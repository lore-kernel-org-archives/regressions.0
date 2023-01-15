Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF69A3C
	for <regressions@lists.linux.dev>; Sun, 15 Jan 2023 15:19:44 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pH4nO-0005KX-AF; Sun, 15 Jan 2023 16:19:42 +0100
Message-ID: <2a9140bb-8c4f-dda8-cf43-92db792a29db@leemhuis.info>
Date: Sun, 15 Jan 2023 16:19:41 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: =?UTF-8?Q?Re=3a_=5bRegression=5d_Bug=c2=a0216884_-_NETDEV_WATCHDOG?=
 =?UTF-8?Q?=3a_enp6s0_=28r8169=29=3a_transmit_queue_0_timed_out?=
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Reply-To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <f5b100c0-cdeb-59d1-5c82-e1df59ee3773@leemhuis.info>
In-Reply-To: <f5b100c0-cdeb-59d1-5c82-e1df59ee3773@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1673795984;c9838335;
X-HE-SMSGID: 1pH4nO-0005KX-AF

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 05.01.23 11:21, Linux kernel regression tracking (#adding) wrote:
> [TLDR: Just adding a regression reported to bko to the tracking]
> 
> I noticed a regression reported in bugzilla.kernel.org that seems to be
> handled there already, nevertheless I'd like to add to the tracking to
> ensure it's doesn't fall through the cracks in the end:
> 
> #regzbot introduced: v6.1..v6.2-rc2
> https://bugzilla.kernel.org/show_bug.cgi?id=216884
> #regzbot title: net: r8169: NETDEV WATCHDOG: enp6s0 (r8169): transmit
> queue 0 timed out
> #regzbot ignore-activity

#regzbot monitor:
https://lore.kernel.org/all/20230106095143.3158998-1-chenhuacai@loongson.cn/
#regzbot fix: PCI: loongson: Improve the MRRS quirk for LS7A
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.



