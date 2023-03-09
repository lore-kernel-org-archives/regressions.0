Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92B933ED
	for <regressions@lists.linux.dev>; Thu,  9 Mar 2023 09:24:41 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1paCVr-0002m5-Jz; Thu, 09 Mar 2023 10:24:39 +0100
Message-ID: <b8346394-955f-598d-d1ad-666b0ce68ec5@leemhuis.info>
Date: Thu, 9 Mar 2023 10:24:39 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, de-DE
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: [regression] [Bug 217158] stutter with kernel 6.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678353881;aa9ab858;
X-HE-SMSGID: 1paCVr-0002m5-Jz

[TLDR: Just adding a regression reported to bko to the tracking]

Hi, Thorsten here, the Linux kernel's regression tracker. I noticed a
regression reported in bugzilla.kernel.org that seems to be handled
there already (at least partially, because as of now we have not the
slightest idea what subsystem might cause this), nevertheless I'd like
to add to the tracking to ensure it's doesn't fall through the cracks in
the end:

#regzbot introduced: v6.1..v6.2
https://bugzilla.kernel.org/show_bug.cgi?id=217158
#regzbot title: system started to stutter
#regzbot ignore-activity

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
