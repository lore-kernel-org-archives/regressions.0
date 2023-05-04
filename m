Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6817E1
	for <regressions@lists.linux.dev>; Thu,  4 May 2023 08:38:42 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1puUU4-0006Th-9F; Thu, 04 May 2023 10:38:40 +0200
Message-ID: <3db12698-bae2-9484-1c2b-f12587dba8ef@leemhuis.info>
Date: Thu, 4 May 2023 10:38:39 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: 6.2 regression: BTRFS_LOGICAL_INO_ARGS_IGNORE_OFFSET broken
Content-Language: en-US, de-DE
To: Vladimir Panteleev <git@vladimir.panteleev.md>,
 Btrfs BTRFS <linux-btrfs@vger.kernel.org>
Cc: Filipe Manana <fdmanana@suse.com>, David Sterba <dsterba@suse.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <CAHhfkvwo=nmzrJSqZ2qMfF-rZB-ab6ahHnCD_sq9h4o8v+M7QQ@mail.gmail.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAHhfkvwo=nmzrJSqZ2qMfF-rZB-ab6ahHnCD_sq9h4o8v+M7QQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1683189523;d22750e7;
X-HE-SMSGID: 1puUU4-0006Th-9F

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 03.05.23 14:27, Vladimir Panteleev wrote:
> 
> Commit 6ce6ba534418132f4c727d5707fe2794c797299c appears to have broken
> the BTRFS_LOGICAL_INO_ARGS_IGNORE_OFFSET flag to
> BTRFS_IOC_LOGICAL_INO_V2. The ioctl now always seems to return zero
> inodes with the flag, if the same happened without the flag, thus
> making it not very useful.
> 
> Context: I maintain btdu, a disk usage profiler for btrfs. It uses
> BTRFS_LOGICAL_INO_ARGS_IGNORE_OFFSET to help users estimate the amount
> of space wasted by bookend extents, and identify files / applications
> / IO patterns which create excessive amounts of them.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 6ce6ba534418132f4c727d5707fe2794c79729
#regzbot title btrfs: BTRFS_LOGICAL_INO_ARGS_IGNORE_OFFSET broken
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
