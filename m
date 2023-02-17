Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9196AA0
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 12:45:32 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pT07G-0007SF-KU; Fri, 17 Feb 2023 13:45:30 +0100
Message-ID: <4c6089a3-fb56-39c5-3f5a-79c20ffa34df@leemhuis.info>
Date: Fri, 17 Feb 2023 13:45:30 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: regression: nfs mount (even idle) eventually hangs server
 #forregzbot
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <65ed34338c69cb034295f2c9cbe0af684d65d30f.camel@gmx.de>
 <0bee316d-8b9c-055b-4fdc-0abd151799d7@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <0bee316d-8b9c-055b-4fdc-0abd151799d7@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676637932;f901104d;
X-HE-SMSGID: 1pT07G-0007SF-KU

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 22.12.22 12:19, Thorsten Leemhuis wrote:
> [Note: this mail contains only information for Linux kernel regression
> tracking. Mails like these contain '#forregzbot' in the subject to make
> then easy to spot and filter out. The author also tried to remove most
> or all individuals from the list of recipients to spare them the hassle.]
> 
> On 21.12.22 09:59, Mike Galbraith wrote:
>> scenario: /home/mikeg of desktop box mounted by lappy, lappy sitting
>> idle with user mikeg not even logged in.  Reclaim inducing activity on
>> desktop box eventually leads to spew below.  I've hung the box three
>> times in two days, twice with light client side activity, and below
>> with none, ie with the mount point allegedly merely existing. Sans nfs
>> mount, box seems perfectly fine. 6.1 didn't reproduce either, so it
>> would appear to be a merge window bug.
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced v5.19..v6.0
> #regzbot title nfs: mount (even idle) eventually hangs server
> #regzbot ignore-activity

#regzbot fix: f385f7d244134246f984975ed34cd75f77de4
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


