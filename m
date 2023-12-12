Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CE775439
	for <regressions@lists.linux.dev>; Tue, 12 Dec 2023 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rD4k3-0005uv-AS; Tue, 12 Dec 2023 16:32:15 +0100
Message-ID: <80a77f0f-5ba6-496e-99d3-7508af530dc0@leemhuis.info>
Date: Tue, 12 Dec 2023 16:32:15 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] x86/smpboot/64: System will not boot on v6.5,
 v6.7-rc4
Content-Language: en-US, de-DE
To: regressions@lists.linux.dev
References: <CA+2tU59853R49EaU_tyvOZuOTDdcU0RshGyydccp9R1NX9bEeQ@mail.gmail.com>
 <20231210110518.GAZXWbbn9+ZNF5kwQV@fat_crate.local>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20231210110518.GAZXWbbn9+ZNF5kwQV@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1702395143;eb40a6e6;
X-HE-SMSGID: 1rD4k3-0005uv-AS

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 10.12.23 12:05, Borislav Petkov wrote:
> On Sat, Dec 09, 2023 at 09:31:48PM -0600, Chris Lindee wrote:
>> My Dell-EMC PowerEdge T340 server worked with v6.4.15, but it will not
>> start with v6.5.x - it won't even display dmesg events during boot.  I
>> reproduced the issue on v6.7-rc4 and bisected the first problematic commit
>> to:
>>
>> 0c7ffa32dbd6 x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup()
>> and enable it
> 
> I presume booting with "cpuhp.parallel=0" on the kernel cmdline fixes
> it?

To be sure the issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, the Linux kernel regression tracking bot:

#regzbot ^introduced 0c7ffa32dbd6
#regzbot title x86: system stopped booting with v6.5
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
