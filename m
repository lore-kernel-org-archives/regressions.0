Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF11CA67
	for <regressions@lists.linux.dev>; Fri, 20 Oct 2023 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qtjTW-000806-Do; Fri, 20 Oct 2023 08:59:14 +0200
Message-ID: <fe56d275-a859-4f0e-8652-88fb1b12bf93@leemhuis.info>
Date: Fri, 20 Oct 2023 08:59:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: X86 parallel bring up regression
Content-Language: en-US, de-DE
To: Mario Limonciello <mario.limonciello@amd.com>, x86@kernel.org,
 David Woodhouse <dwmw@amazon.co.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, "Gong, Richard"
 <Richard.Gong@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Michael Kelley <mikelley@microsoft.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>, Helge Deller
 <deller@gmx.de>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
References: <3d96c70e-da3b-49c2-a776-930a9f1b815d@amd.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <3d96c70e-da3b-49c2-a776-930a9f1b815d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1697785164;de4aebf2;
X-HE-SMSGID: 1qtjTW-000806-Do

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 19.10.23 22:26, Mario Limonciello wrote:
> 
> We've recently found that there was a regression from 6.5 that broke
> resume from suspend-to-ram on some AMD platforms.
> 
> We bisected it and confirmed it's introduced by 0c7ffa32dbd6
> ("x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup() and
> enable it").
> 
> Furthermore; we confirmed that on 6.6-rc6 adding cpuhp.parallel=0 to the
> kernel command line avoids the issue.
> 
> Here are bootup kernel logs from an affected system at 7e75178 (doesn't
> reproduce) and 0c7ffa32 (does reproduce).
> https://gist.github.com/superm1/c251c0849956b8389309f03871fba091
> 
> Is it possible that this is caused by the system entering S3 with x2apic
> enabled but leaving with it disabled?
> 
> I notice in the resume path on a boot with cpuhp.parallel=0 that x2apic
> "explicitly" gets turned on again.
> 
> <snip>
> smpboot: CPU 127 is now offline
> ACPI: PM: Low-level resume complete
> ACPI: PM: Restoring platform NVS memory
> x2apic enabled
> AMD-Vi: Virtual APIC enabled
> AMD-Vi: Virtual APIC enabled
> LVT offset 0 assigned for vector 0x400
> Enabling non-boot CPUs ...
> smpboot: Booting Node 0 Processor 1 APIC 0x2
> masked ExtINT on CPU#1
> ACPI: \_SB_.PLTF.C002: Found 2 idle states
> CPU1 is up
> smpboot: Booting Node 0 Processor 2 APIC 0x4
> </snip>
> 
> I hypothesize this could be caused by .Lread_apicid finding x2apic
> disabled but then trying to read from apic_mmio_base which isn't
> initialized because x2apic was used (AFAICT apic_set_fixmap() never gets
> called in this case).

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 0c7ffa32dbd6
#regzbot title x86: resume from suspend-to-ram broken on some AMD platforms
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
