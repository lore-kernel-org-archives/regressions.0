Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856916AAD
	for <regressions@lists.linux.dev>; Wed,  6 Sep 2023 11:21:11 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qdqaq-0007aA-3Z; Wed, 06 Sep 2023 13:21:08 +0200
Message-ID: <a8d206b6-d1d8-4c9a-b82c-724c2def0491@leemhuis.info>
Date: Wed, 6 Sep 2023 13:21:07 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Content-Language: en-US, de-DE
Subject: Consider picking up "tpm: Enable hwrng only for Pluton on AMD CPUs"
 rather sooner than later
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693999271;75efbebd;
X-HE-SMSGID: 1qdqaq-0007aA-3Z

Hi stable team, JFYI, the recently mainline commit 8f7f35e5aa6f21 ("tpm:
Enable hwrng only for Pluton on AMD CPUs") from Jarkko contains a stable
tag, but it might be worth picking up rather sooner than later, as it
fixes a regression that seems to annoy quite a few users of 6.1.y, 6.4.y
and 6.5; that's why at least Fedora is already working on picking the
fix up ahead of the stable-tree.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
