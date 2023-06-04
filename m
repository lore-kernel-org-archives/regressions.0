Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6C615C1
	for <regressions@lists.linux.dev>; Sun,  4 Jun 2023 08:21:10 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q5iz0-0001Qr-6F; Sun, 04 Jun 2023 10:21:02 +0200
Message-ID: <15e5d50f-95fc-c7c9-0918-015f24c6fc6d@leemhuis.info>
Date: Sun, 4 Jun 2023 10:21:01 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: [regression] kernel 6.3.x logitech unify receiver still not working
 properly
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1685866870;ba055fd2;
X-HE-SMSGID: 1q5iz0-0001Qr-6F

[TLDR: Just adding a regression reported to bko to the tracking]

Hi, Thorsten here, the Linux kernel's regression tracker. I noticed a
regression reported in bugzilla.kernel.org that seems to be handled
there already, nevertheless I'd like to add to the tracking to ensure
it's doesn't fall through the cracks in the end:

#regzbot introduced: 586e8fede7953b1695b5ccc6112
https://bugzilla.kernel.org/show_bug.cgi?id=217523
#regzbot title: input: hid: logitech unify receiver not working properly
#regzbot monitor:
https://lore.kernel.org/all/nycvar.YFH.7.76.2305311042150.29760@cbobk.fhfr.pm/
#regzbot ignore-activity

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
