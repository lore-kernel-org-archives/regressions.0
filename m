Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2F9BA55
	for <regressions@lists.linux.dev>; Mon,  7 Nov 2022 13:40:31 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1os2MW-0004Lj-V4; Mon, 07 Nov 2022 14:40:29 +0100
Message-ID: <7a348025-8db3-449b-e92d-7033104d60d3@leemhuis.info>
Date: Mon, 7 Nov 2022 14:40:28 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] cifs: fix regression in very old smb1 mounts
Content-Language: en-US, de-DE
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <smfrench@gmail.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 linux-cifs <linux-cifs@vger.kernel.org>
References: <20221011231207.1458541-1-lsahlber@redhat.com>
 <0fb9b48e-3bcc-5a5e-15fb-1d3e2752d80b@leemhuis.info>
 <b5badfe1-ccb8-f8b3-90b7-c05689e22776@leemhuis.info>
 <CAN05THSLqgRS9LwQMdSBY22YRYRoD6FDJUS1HZ+Ujzk=gZ+jHw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAN05THSLqgRS9LwQMdSBY22YRYRoD6FDJUS1HZ+Ujzk=gZ+jHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667828431;6191490b;
X-HE-SMSGID: 1os2MW-0004Lj-V4

On 07.11.22 14:31, ronnie sahlberg wrote:
> On Mon, 7 Nov 2022 at 23:20, Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
>>
>> On 01.11.22 18:53, Thorsten Leemhuis wrote:
>>> On 12.10.22 01:12, Ronnie Sahlberg wrote:
>>>> BZ: 215375
>>>>
>>>> Fixes: 76a3c92ec9e0668e4cd0e9ff1782eb68f61a179c ("cifs: remove support for NTLM and weaker authentication algorithms")
>>>> Signed-off-by: Ronnie Sahlberg <lsahlber@redhat.com>
>>>
>>> Ronnie, Steve, did this change create any trouble in 6.1 pre-releases so
>>> far? If not: could you please consider submitting this change for
>>> inclusion in 6.0 and 5.15, as this is a regression from the 5.15 days
>>> that according to the bugzilla ticket seem to annoy some people a lot.
>>
>> Ronnie, Steve, if you have a minute, I would really appreciate your help
>> in this matter, you are the best people to judge here.
> 
> Thanks for the reminder.  I don't think there were any issues in the
> pre-release so we should try to get it into the stable kernels.

Great.

> I am not sure how that process works since the patch is already in upstream.
> (I have only seen the process where you flag the patch with cc-stable.)
> Can you explain the process on how to flag this existing patch for backporting?

Documentation/process/stable-kernel-rules.rst (or
https://docs.kernel.org/process/stable-kernel-rules.html ) explains this
(see option 3 there) better than I can. The patch afaics needs to got to
6.0 and 5.15.

Many thx for taking care of this!

Ciao, Thorsten


>>>> ---
>>>>  fs/cifs/connect.c | 11 +++++------
>>>>  1 file changed, 5 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
>>>> index 93e59b3b36c7..c77232096c12 100644
>>>> --- a/fs/cifs/connect.c
>>>> +++ b/fs/cifs/connect.c
>>>> @@ -3922,12 +3922,11 @@ CIFSTCon(const unsigned int xid, struct cifs_ses *ses,
>>>>      pSMB->AndXCommand = 0xFF;
>>>>      pSMB->Flags = cpu_to_le16(TCON_EXTENDED_SECINFO);
>>>>      bcc_ptr = &pSMB->Password[0];
>>>> -    if (tcon->pipe || (ses->server->sec_mode & SECMODE_USER)) {
>>>> -            pSMB->PasswordLength = cpu_to_le16(1);  /* minimum */
>>>> -            *bcc_ptr = 0; /* password is null byte */
>>>> -            bcc_ptr++;              /* skip password */
>>>> -            /* already aligned so no need to do it below */
>>>> -    }
>>>> +
>>>> +    pSMB->PasswordLength = cpu_to_le16(1);  /* minimum */
>>>> +    *bcc_ptr = 0; /* password is null byte */
>>>> +    bcc_ptr++;              /* skip password */
>>>> +    /* already aligned so no need to do it below */
>>>>
>>>>      if (ses->server->sign)
>>>>              smb_buffer->Flags2 |= SMBFLG2_SECURITY_SIGNATURE;
> 
