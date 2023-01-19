Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF67471
	for <regressions@lists.linux.dev>; Thu, 19 Jan 2023 14:29:58 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pIVvQ-0001Ka-29; Thu, 19 Jan 2023 15:29:56 +0100
Message-ID: <cd3dd308-0fda-60ce-608a-86df9cd1ec79@leemhuis.info>
Date: Thu, 19 Jan 2023 15:29:55 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
Subject: Re: [linus:master] [kbuild] 3bc753c06d: xfstests.generic.454.fail
 #forregzbot
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <202212291509.704a11c9-oliver.sang@intel.com>
 <0cf0fddb-f2e7-80b8-1c08-cf9919a391bd@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <0cf0fddb-f2e7-80b8-1c08-cf9919a391bd@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1674138598;5bc61db3;
X-HE-SMSGID: 1pIVvQ-0001Ka-29

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 30.12.22 11:14, Thorsten Leemhuis wrote:
> On 29.12.22 09:49, kernel test robot wrote:
>>
>> Greeting,
>>
>> FYI, we noticed xfstests.generic.454.fail due to commit (built with gcc-11):
>>
>> commit: 3bc753c06dd02a3517c9b498e3846ebfc94ac3ee ("kbuild: treat char as always unsigned")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> [test failed on linux-next/master c76083fac3bae1a87ae3d005b5cb1cbc761e31d5]
>>
>> in testcase: xfstests
>> version: xfstests-x86_64-fb6575e-1_20221226
>> with following parameters:
>>
>> 	disk: 4HDD
>> 	fs: ext4
>> 	test: generic-group-22
>>
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 3bc753c06dd02a
> #regzbot title ext4/acls: xfstests.generic.454 suddenly fails for the
> kernel test robot
> #regzbot ignore-activity

#regzbot dup:
https://lore.kernel.org/all/Y8bpkm3jA3bDm3eL@debian-BULLSEYE-live-builder-AMD64/

Maybe I'll should mark this as "inconclusive: looks like nothing users
care about is broken, only the test case fails"
(https://lore.kernel.org/all/CAHk-=wgxcupvBROWUsrsyTKTWr8L93T+1xJaRvG6cOfREjpXMw@mail.gmail.com/
), but I'm waiting with that for now

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
