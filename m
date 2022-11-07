Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC715AD
	for <regressions@lists.linux.dev>; Mon,  7 Nov 2022 21:40:15 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id sc25so33623954ejc.12
        for <regressions@lists.linux.dev>; Mon, 07 Nov 2022 13:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a7Pu312VBrRa3fZpA2kIIB54gqaUtTzt/kFTpVj9Gyg=;
        b=n5wjSnKDahfy6jokw7XFLSSk66A4Ob296f44tyNXmPenGjHHPloCpXMD1Ez/AkqESK
         SLHykNycUc06VqR7N9BrpxYUZtNhvxyYPu5z0aNrhswA+iK7SMIJestecpQ/XTqyH6g0
         zejJLg0rvbsQoFhSb8h5lbkKbsowOJbX/A0gPHQfRCEGjn8cowuBP3NdX6YGRFOQuF33
         iS6lEvYdkVYPYHVB1ezKwL9pCCSoypVt6jZN0WlFa1XrjlSeg3nSBWW0Z/HD2nj9mBPQ
         6IlnUzFioaelYmGCEpvGVCJxJ/Q+T+dHKlmZbGNk/qO/sSylhdfKk8n3naHnRxXN/0yo
         d76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7Pu312VBrRa3fZpA2kIIB54gqaUtTzt/kFTpVj9Gyg=;
        b=yotWo0Vhy/dniuKyx8vSNg1pEb4ndnrPhldCYBM6muGZZzmZWw/Yo+MtV+Pnz14VZK
         uTGdQ1hl7XEq4So2ItrnmPLdTK97uypPMxSkH+5AnNiuudq2oieuGXr6hta5s9piACZy
         QfijQDuMoil7SeXxSMRULt5v+Eg0M6Cle8csfacp55OHAHEw3IyrMX728WGhxAWXHB/V
         a3R1HbffWxJHwtBeOx5MrK45sqDyO/INtXQ6LB1KBTROf5OSvjKbb1qF+L96zOB4jOcf
         q6cxcPAqabqSyJ9RNTOvkLHok2O8nUKXqswNJ5VNZrv3GtcEsxvmBcWC0DPcInmQDkHd
         UvzQ==
X-Gm-Message-State: ACrzQf00RBxjICtTuypWzBV/bnJRxSjgxYPdNR/gBcjmgKXbzgjyvAaZ
	PX9UFvlbHQfRRaUvkDKjfBPZYeNHqESnVpxdQQ9T3JvA
X-Google-Smtp-Source: AMsMyM675OVDVgKSw3ua7nw/asBTMb/aRORa1xk0sqS6j8Ja93NCFLWkXxRtCKVOaR7mYmsIB9DwvFVv+7bFcPtOBTE=
X-Received: by 2002:a17:907:1de6:b0:7a5:ea4b:ddbb with SMTP id
 og38-20020a1709071de600b007a5ea4bddbbmr50075967ejc.757.1667857213303; Mon, 07
 Nov 2022 13:40:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221011231207.1458541-1-lsahlber@redhat.com> <0fb9b48e-3bcc-5a5e-15fb-1d3e2752d80b@leemhuis.info>
 <b5badfe1-ccb8-f8b3-90b7-c05689e22776@leemhuis.info> <CAN05THSLqgRS9LwQMdSBY22YRYRoD6FDJUS1HZ+Ujzk=gZ+jHw@mail.gmail.com>
 <7a348025-8db3-449b-e92d-7033104d60d3@leemhuis.info>
In-Reply-To: <7a348025-8db3-449b-e92d-7033104d60d3@leemhuis.info>
From: ronnie sahlberg <ronniesahlberg@gmail.com>
Date: Tue, 8 Nov 2022 07:40:00 +1000
Message-ID: <CAN05THSP0N0QMTv5-csBjvHuO0PVgDBkC7xNMNfHUZmuMXLRnQ@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix regression in very old smb1 mounts
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <smfrench@gmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, linux-cifs <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Nov 2022 at 23:40, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 07.11.22 14:31, ronnie sahlberg wrote:
> > On Mon, 7 Nov 2022 at 23:20, Thorsten Leemhuis
> > <regressions@leemhuis.info> wrote:
> >>
> >> On 01.11.22 18:53, Thorsten Leemhuis wrote:
> >>> On 12.10.22 01:12, Ronnie Sahlberg wrote:
> >>>> BZ: 215375
> >>>>
> >>>> Fixes: 76a3c92ec9e0668e4cd0e9ff1782eb68f61a179c ("cifs: remove support for NTLM and weaker authentication algorithms")
> >>>> Signed-off-by: Ronnie Sahlberg <lsahlber@redhat.com>
> >>>
> >>> Ronnie, Steve, did this change create any trouble in 6.1 pre-releases so
> >>> far? If not: could you please consider submitting this change for
> >>> inclusion in 6.0 and 5.15, as this is a regression from the 5.15 days
> >>> that according to the bugzilla ticket seem to annoy some people a lot.
> >>
> >> Ronnie, Steve, if you have a minute, I would really appreciate your help
> >> in this matter, you are the best people to judge here.
> >
> > Thanks for the reminder.  I don't think there were any issues in the
> > pre-release so we should try to get it into the stable kernels.
>
> Great.
>
> > I am not sure how that process works since the patch is already in upstream.
> > (I have only seen the process where you flag the patch with cc-stable.)
> > Can you explain the process on how to flag this existing patch for backporting?
>
> Documentation/process/stable-kernel-rules.rst (or
> https://docs.kernel.org/process/stable-kernel-rules.html ) explains this
> (see option 3 there) better than I can. The patch afaics needs to got to
> 6.0 and 5.15.

Thanks. What we need here is option 2.
Steve, can you send an email for option 2 so we get it in the older kernels?


>
> Many thx for taking care of this!
>
> Ciao, Thorsten
>
>
> >>>> ---
> >>>>  fs/cifs/connect.c | 11 +++++------
> >>>>  1 file changed, 5 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> >>>> index 93e59b3b36c7..c77232096c12 100644
> >>>> --- a/fs/cifs/connect.c
> >>>> +++ b/fs/cifs/connect.c
> >>>> @@ -3922,12 +3922,11 @@ CIFSTCon(const unsigned int xid, struct cifs_ses *ses,
> >>>>      pSMB->AndXCommand = 0xFF;
> >>>>      pSMB->Flags = cpu_to_le16(TCON_EXTENDED_SECINFO);
> >>>>      bcc_ptr = &pSMB->Password[0];
> >>>> -    if (tcon->pipe || (ses->server->sec_mode & SECMODE_USER)) {
> >>>> -            pSMB->PasswordLength = cpu_to_le16(1);  /* minimum */
> >>>> -            *bcc_ptr = 0; /* password is null byte */
> >>>> -            bcc_ptr++;              /* skip password */
> >>>> -            /* already aligned so no need to do it below */
> >>>> -    }
> >>>> +
> >>>> +    pSMB->PasswordLength = cpu_to_le16(1);  /* minimum */
> >>>> +    *bcc_ptr = 0; /* password is null byte */
> >>>> +    bcc_ptr++;              /* skip password */
> >>>> +    /* already aligned so no need to do it below */
> >>>>
> >>>>      if (ses->server->sign)
> >>>>              smb_buffer->Flags2 |= SMBFLG2_SECURITY_SIGNATURE;
> >
