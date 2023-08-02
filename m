Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB38566E
	for <regressions@lists.linux.dev>; Wed,  2 Aug 2023 09:09:01 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qR7ql-0002Nv-5D; Wed, 02 Aug 2023 11:08:59 +0200
Message-ID: <bc22f6c4-a147-3032-49ef-0784d0171d9a@leemhuis.info>
Date: Wed, 2 Aug 2023 11:08:58 +0200
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
Subject: [regression] ALSA: hda/realtek: Audible "pop" sound whenever audio
 card goes in or out of sleep
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690967341;0263bacd;
X-HE-SMSGID: 1qR7ql-0002Nv-5D

[TLDR: Just adding a regression reported to bko to the tracking]

Hi, Thorsten here, the Linux kernel's regression tracker. I noticed a
regression reported in bugzilla.kernel.org that seems to be handled
there already, nevertheless I'd like to add to the tracking to ensure
it's doesn't fall through the cracks in the end:

#regzbot introduced: 69ea4c9d02b7947cdd612335a61cc1a02e544
https://bugzilla.kernel.org/show_bug.cgi?id=217732
#regzbot title: ALSA: hda/realtek: Audible "pop" sound whenever audio
card goes in or out of sleep
#regzbot ignore-activity
#regzbot monitor: https://lore.kernel.org/all/87o7jshxch.wl-tiwai@suse.de/

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
