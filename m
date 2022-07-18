Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEAEECC
	for <regressions@lists.linux.dev>; Mon, 18 Jul 2022 11:42:15 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oDP8f-0006ga-JZ; Mon, 18 Jul 2022 13:42:13 +0200
Message-ID: <c6ef3d55-bd54-435f-52f3-e1ce5842f33a@leemhuis.info>
Date: Mon, 18 Jul 2022 13:42:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: regressions@lists.linux.dev
References: <YtTM8GYn0/HkSoet@squish.home.loc>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [REGRESSION] recent changes to copy_file_range behavior breakage
 #forregzbot
In-Reply-To: <YtTM8GYn0/HkSoet@squish.home.loc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1658144535;f2328b50;
X-HE-SMSGID: 1oDP8f-0006ga-JZ

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 18.07.22 05:01, Paul Thompson wrote:
> 	Something that worked in 5.18.9 no longer does in 5.18.1[01] and 5.19-rc6.
> 
> 	Using the example code in the man page for copy_file_range:
> 
> # ./copy-file-range testfile-on-ext4 /path-to-another-ext4/testfile (or symlink thereto)
> 
> Works in 5.18.9, fails with:
> 
> # copy_file_range: Invalid cross-device link
> 
> And produces garbage file at destination on newer (5.18.10+) kernels.
> 
> 	This breaks eg. qbittorrent (moving a distro image across ext4
> filesystems, or following such a symlink) So potentially other real world
> applications. I do not know if the reason for the commit overrides this
> breakage, but it caused me a bit of a headache.
> 
> Thanks;
> Paul
> 
> This commit:
> 
> commit b9cabd2ec2ff6f452bd5744326cc5c5f503448c6

FWIW, that's 868f9f2f8e004bfe0d3935b1976f625b2924893b in mainline.

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced 868f9f2f8e004bfe0d3935b1976f625b2924893b
#regzbot title fs: recent changes to copy_file_range behavior breakage
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
