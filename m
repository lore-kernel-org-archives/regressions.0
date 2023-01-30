Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7BD17D9
	for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 09:36:26 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pMQaO-0002vw-NK; Mon, 30 Jan 2023 10:36:24 +0100
Message-ID: <a4c166c1-d987-6966-8027-55ddd16e7d5d@leemhuis.info>
Date: Mon, 30 Jan 2023 10:36:24 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
To: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Bug 216930 - closing laptop lid wakes from suspend Lenovo Slim 7 Pro
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1675071386;cca9aec9;
X-HE-SMSGID: 1pMQaO-0002vw-NK

[TLDR: Just adding a regression reported to bko to the tracking]

I noticed a regression reported in bugzilla.kernel.org that seems to be
handled there already, nevertheless I'd like to add to the tracking to
ensure it's doesn't fall through the cracks in the end:

#regzbot introduced: v5.19..v6.0
https://bugzilla.kernel.org/show_bug.cgi?id=216930
#regzbot title: closing laptop lid wakes from suspend Lenovo Slim 7 Pro
#regzbot ignore-activity

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
