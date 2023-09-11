Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D07123D9
	for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 07:50:31 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qfbgj-0003Rl-Bf; Mon, 11 Sep 2023 09:50:29 +0200
Message-ID: <7b78505a-a8c9-4770-b283-807581b5edfb@leemhuis.info>
Date: Mon, 11 Sep 2023 09:50:28 +0200
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
Subject: power button stopped working on lenovo ideapad 5 since a855724dc08b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1694418631;eb12151b;
X-HE-SMSGID: 1qfbgj-0003Rl-Bf

[TLDR: Just adding a regression reported to bko to the tracking]

Hi, Thorsten here, the Linux kernel's regression tracker. I noticed a
regression reported in bugzilla.kernel.org that seems to be handled
there already, nevertheless I'd like to add to the tracking to ensure
it's doesn't fall through the cracks in the end:

#regzbot introduced: a855724dc08b
https://bugzilla.kernel.org/show_bug.cgi?id=217833
#regzbot title: power button stopped working on lenovo ideapad 5
#regzbot dup-of:
https://lore.kernel.org/stable/aa1649b6-b7a8-4fbe-8356-2c856951e283@gmail.com/
#regzbot ignore-activity

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


