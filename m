Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40BDECD
	for <regressions@lists.linux.dev>; Thu,  5 Jan 2023 10:22:03 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pDNNj-0004lD-QZ; Thu, 05 Jan 2023 11:21:55 +0100
Message-ID: <f5b100c0-cdeb-59d1-5c82-e1df59ee3773@leemhuis.info>
Date: Thu, 5 Jan 2023 11:21:55 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (#adding)" <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Reply-To: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: =?UTF-8?Q?=5bRegression=5d_Bug=c2=a0216884_-_NETDEV_WATCHDOG=3a_enp?=
 =?UTF-8?Q?6s0_=28r8169=29=3a_transmit_queue_0_timed_out?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672914123;4414a973;
X-HE-SMSGID: 1pDNNj-0004lD-QZ

[TLDR: Just adding a regression reported to bko to the tracking]

I noticed a regression reported in bugzilla.kernel.org that seems to be
handled there already, nevertheless I'd like to add to the tracking to
ensure it's doesn't fall through the cracks in the end:

#regzbot introduced: v6.1..v6.2-rc2
https://bugzilla.kernel.org/show_bug.cgi?id=216884
#regzbot title: net: r8169: NETDEV WATCHDOG: enp6s0 (r8169): transmit
queue 0 timed out
#regzbot ignore-activity

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
