Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1345668
	for <regressions@lists.linux.dev>; Sun, 20 Aug 2023 13:30:42 +0000 (UTC)
Received: from p200300cf17418700333267be2b9ea1d1.dip0.t-ipconnect.de ([2003:cf:1741:8700:3332:67be:2b9e:a1d1]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qXiVs-00012U-Lw; Sun, 20 Aug 2023 15:30:40 +0200
Message-ID: <0659d006-0029-737d-48a4-72cc54e87b0a@leemhuis.info>
Date: Sun, 20 Aug 2023 15:30:40 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: TPM patch breaks S3 on some Intel systems (bugzilla ticket)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1692538242;c406445b;
X-HE-SMSGID: 1qXiVs-00012U-Lw

[TLDR: Just adding a regression reported to bko to the tracking]

Hi, Thorsten here, the Linux kernel's regression tracker. I noticed a
regression reported in bugzilla.kernel.org that seems to be handled
there already, nevertheless I'd like to add to the tracking to ensure
it's doesn't fall through the cracks in the end:

#regzbot introduced: 554b841d470338a3
https://bugzilla.kernel.org/show_bug.cgi?id=217804
#regzbot dup-of:
https://lore.kernel.org/all/485e8740385239b56753ce01d8995f01f84a68e5.camel@linux.intel.com/
#regzbot monitor:
https://lore.kernel.org/all/20230818181516.19167-1-mario.limonciello@amd.com/
#regzbot ignore-activity

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
