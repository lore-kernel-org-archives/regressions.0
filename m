Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D644882E
	for <regressions@lists.linux.dev>; Sun, 10 Dec 2023 11:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rCIAs-0001Gv-UF; Sun, 10 Dec 2023 12:40:43 +0100
Message-ID: <4cbd1ad9-d343-421a-b9de-30dc8e2d02c1@leemhuis.info>
Date: Sun, 10 Dec 2023 12:40:42 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Bug 218198 - system after successful resuming the CPU won't enter
 lower Package Sates below pc2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1702208445;f76ffab3;
X-HE-SMSGID: 1rCIAs-0001Gv-UF

[TLDR: Just adding a regression reported to bko to the tracking]

Hi, Thorsten here, the Linux kernel's regression tracker. I noticed a
regression reported in bugzilla.kernel.org that seems to be handled
there already, nevertheless I'd like to add to the tracking to ensure
it's doesn't fall through the cracks in the end:

#regzbot introduced: d035e4eb38b3ea5ae9
https://bugzilla.kernel.org/show_bug.cgi?id=218198
#regzbot title: system after successful resuming the CPU won't enter
lower Package Sates below pc2
#regzbot ignore-activity

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
