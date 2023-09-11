Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BE73D8C
	for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 09:46:33 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qfdUo-00017y-87; Mon, 11 Sep 2023 11:46:18 +0200
Message-ID: <5fe38b0a-e8de-466b-b35b-a827eae3e766@leemhuis.info>
Date: Mon, 11 Sep 2023 11:46:17 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: ucsi: Fix NULL pointer dereference
To: Mario Limonciello <mario.limonciello@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Saranya Gopal <saranya.gopal@intel.com>,
 Rajaram Regupathy <rajaram.regupathy@intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Wayne Chang <waynec@nvidia.com>, Hans de Goede <hdegoede@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230906084842.1922052-1-heikki.krogerus@linux.intel.com>
 <2023090638-overexert-endearing-3726@gregkh>
 <288ac4c1-b66d-477a-ba2e-9b8d8dde4dc6@amd.com>
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <288ac4c1-b66d-477a-ba2e-9b8d8dde4dc6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1694425594;786d0b6f;
X-HE-SMSGID: 1qfdUo-00017y-87

On 06.09.23 14:05, Mario Limonciello wrote:
> On 9/6/2023 03:57, Greg Kroah-Hartman wrote:
>> On Wed, Sep 06, 2023 at 11:48:42AM +0300, Heikki Krogerus wrote:
>>> Making sure the UCSI debugfs entry actually exists before
>>> attempting to remove it.
>>>
>>> Fixes: df0383ffad64 ("usb: typec: ucsi: Add debugfs for ucsi commands")
>>> Reported-by: Dave Hansen <dave.hansen@intel.com>
>>> Closes:
>>> https://lore.kernel.org/linux-usb/700df3c4-2f6c-85f9-6c61-065bc5b2db3a@intel.com/
>>> Suggested-by: Dave Hansen <dave.hansen@intel.com>
>>> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Cc: Saranya Gopal <saranya.gopal@intel.com>
>>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> I could also reproduce it with 7733171926cc336ddf0c8f847eefaff569dbff86
> on two different laptops.
> 
>>> ---
>>>   drivers/usb/typec/ucsi/debugfs.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/usb/typec/ucsi/debugfs.c
>>> b/drivers/usb/typec/ucsi/debugfs.c
>>> index 0c7bf88d4a7f..f67733cecfdf 100644
>>> --- a/drivers/usb/typec/ucsi/debugfs.c
>>> +++ b/drivers/usb/typec/ucsi/debugfs.c
>>> @@ -84,6 +84,9 @@ void ucsi_debugfs_register(struct ucsi *ucsi)
>>>     void ucsi_debugfs_unregister(struct ucsi *ucsi)
>>>   {
>>> +    if (IS_ERR_OR_NULL(ucsi) || !ucsi->debugfs)
>>> +        return;
>>> +
>>>       debugfs_remove_recursive(ucsi->debugfs->dentry);
>>
>> Why are you saving the dentry at all?  Why not just have debugfs look it
>> up when you want to remove it based on the filename?
>>
>> Anyway, not a big deal here, just a comment.  I'll queue this up after
>> -rc1 is out.
> 
> It might be worth sending before rc1 if it ends up being widespread.

FWIW, as someone that afaics just ran into the regression fixed by this
patch with -rc1, I would have liked that patch to be in -rc1 as well...

Ciao, Thorsten
