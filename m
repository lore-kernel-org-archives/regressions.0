Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E06ACA6C
	for <regressions@lists.linux.dev>; Fri, 20 Oct 2023 07:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qtjVK-0008J0-A1; Fri, 20 Oct 2023 09:01:06 +0200
Message-ID: <00375284-2071-4dea-9009-9cd2d0de71e1@leemhuis.info>
Date: Fri, 20 Oct 2023 09:01:05 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: task hung in ext4_fallocate #2
Content-Language: en-US, de-DE
To: Andres Freund <andres@anarazel.de>, Theodore Ts'o <tytso@mit.edu>
Cc: Shreeya Patel <shreeya.patel@collabora.com>, linux-ext4@vger.kernel.org,
 =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 gustavo.padovan@collabora.com, zsm@google.com, garrick@google.com,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20231017033725.r6pfo5a4ayqisct7@awork3.anarazel.de>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20231017033725.r6pfo5a4ayqisct7@awork3.anarazel.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1697785270;8ab9d00d;
X-HE-SMSGID: 1qtjVK-0008J0-A1

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 17.10.23 05:37, Andres Freund wrote:
> 
> As previously reported in https://lore.kernel.org/all/20231004004247.zkswbseowwwc6vvk@alap3.anarazel.de/
> I found some hangs below ext4_fallocate(), in 6.6-rc*.  As it looks like my
> issue was unrelated to the thread I had responded to, I was asked to start
> this new thread.
> 
> I just was able to reproduce the issue, after upgrading to 6.6-rc6 - this time
> it took ~55min of high load (io_uring using branch of postgres, running a
> write heavy transactional workload concurrently with concurrent bulk data
> load) to trigger the issue.
> 
> For now I have left the system running, in case there's something you would
> like me to check while the system is hung.
> [...]

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced v6.5..v6.6-rc6
#regzbot title ext4: task hung in ext4_fallocate
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
