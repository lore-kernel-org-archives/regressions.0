Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4126C11C93
	for <regressions@lists.linux.dev>; Wed, 19 Jul 2023 16:19:08 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qM9tK-0006rN-P5; Wed, 19 Jul 2023 18:19:06 +0200
Message-ID: <03985866-102a-2a58-cd54-f8db3bedfebc@leemhuis.info>
Date: Wed, 19 Jul 2023 18:19:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Kernel Crash Dump (kdump) broken with 6.5
Content-Language: en-US, de-DE
To: Sachin Sant <sachinp@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <AB3C7C5C-86FD-4D86-9330-000CB9728F48@linux.ibm.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <AB3C7C5C-86FD-4D86-9330-000CB9728F48@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1689783549;43a11470;
X-HE-SMSGID: 1qM9tK-0006rN-P5

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 17.07.23 16:45, Sachin Sant wrote:
> Kdump seems to be broken with 6.5 for ppc64le.
> [...]
> 
> 6.4 was good. Git bisect points to following patch
> 
> commit 606787fed7268feb256957872586370b56af697a
>     powerpc/64s: Remove support for ELFv1 little endian userspace
> 
> Reverting this patch allows a successful capture of vmcore.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 606787fed7268feb256957872586370b56af69
#regzbot title powerpc/64s: Crash Dump (kdump) broken with 6.5
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
