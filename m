Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81288824
	for <regressions@lists.linux.dev>; Tue,  3 Jan 2023 09:02:26 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pCdBa-0002p2-Sp; Tue, 03 Jan 2023 10:02:18 +0100
Message-ID: <8855f990-592e-7bb8-a027-903d2efdd3b5@leemhuis.info>
Date: Tue, 3 Jan 2023 10:02:18 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (#info)" <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: =?UTF-8?Q?Bug=c2=a0216877_-_Regression_in_PCI_powermanagement_break?=
 =?UTF-8?Q?s_resume_after_suspend?=
Reply-To: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672736546;a43c9e60;
X-HE-SMSGID: 1pCdBa-0002p2-Sp

I noticed a regression reported in bugzilla.kernel.org that seems to be
handled there already, nevertheless I'd like to add to the tracking to
ensure it's doesn't fall through the cracks in the end:

#regzbot introduced: 5e85eba6f50dc288c22083a7e213152bcc4b82
https://bugzilla.kernel.org/show_bug.cgi?id=216877
#regzbot title: PCI/ASPM: Laptop does not resume PCI devices back from
suspend anymore
#regzbot monitor:
https://lore.kernel.org/all/20230102171516.GA783946@bhelgaas/
#regzbot ignore-activity

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
-- 
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
