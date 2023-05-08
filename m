Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DA6168CF
	for <regressions@lists.linux.dev>; Mon,  8 May 2023 11:13:19 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pvynr-0005Pi-Be; Mon, 08 May 2023 13:13:15 +0200
Message-ID: <084837c4-72c8-be92-fd1c-5ccbd805c559@leemhuis.info>
Date: Mon, 8 May 2023 13:13:14 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, de-DE
To: Mario Limonciello <mario.limonciello@amd.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Hans de Goede <hdegoede@redhat.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Sanket Goswami <Sanket.Goswami@amd.com>, Richard gong
 <richard.gong@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20230427053338.16653-1-mario.limonciello@amd.com>
 <20230427053338.16653-2-mario.limonciello@amd.com>
 <7b74c389-97b7-4f56-851b-6ce17950a4d1@roeck-us.net>
 <f2b81356-e702-3026-660f-d9a88edff632@amd.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH 1/2] amd_nb: Add PCI ID for family 19h model 78h
In-Reply-To: <f2b81356-e702-3026-660f-d9a88edff632@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1683544399;7b49306e;
X-HE-SMSGID: 1pvynr-0005Pi-Be

On 07.05.23 14:51, Mario Limonciello wrote:
> On 5/6/23 09:05, Guenter Roeck wrote:
>> On Thu, Apr 27, 2023 at 12:33:36AM -0500, Mario Limonciello wrote:
>>> s2idle previously worked on this system, but it regressed in kernel
>>> 6.4 due to commit 310e782a99c7 ("platform/x86/amd: pmc: Utilize SMN
>>> index 0 for driver probe").
>>>
>>> The reason for the regression is that before this commit the SMN
>>> communication was hardcoded, but after amd_smn_read() is used which
>>> relies upon the misc PCI ID used by DF function 3 being included in
>>> a table.  The ID was missing for model 78h, so this meant that the
>>> amd_smn_read() wouldn't work.
>>>
>>> Add the missing ID into amd_nb, restoring s2idle on this system.
>>>
>>> Fixes: 310e782a99c7 ("platform/x86/amd: pmc: Utilize SMN index 0 for
>>> driver probe")
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> FWIW:
>>
>> Acked-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Note that this patch is not upstream, meaning the second patch
>> in the series can not be applied either. I am not sure if that is
>> because of "regressed in kernel 6.4" - after all, that kernel does not
>> exist yet. The offending patch _is_ in the upstream kernel, though.
>> It might make sense to inform the regression bot if the problem is
>> not fixed when v6.4-rc1 is made available.
> 
> You're right; the commit message should:
> 
> s,but it regressed in kernel 6.4 due,but it regressed in,
> 
> Boris told me that he's waiting for 6.4-rc1 to pick this series up.

Which afaics means that users of -rc1 are now affected by this and might
waste time bisecting a known issue that could easily have been fixed
already. :-/ That doesn't feel right. Or am I missing something?

/me wonders I he should start tracking regressions more closely during
the merge window to catch and prevent situations like this...

> #regzbot ^introduced 310e782a99c7

Thx for adding it.

#regzbot fix: 7d8accfaa0ab65e42

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
