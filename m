Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB25933DF
	for <regressions@lists.linux.dev>; Sun, 29 Jan 2023 21:13:30 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pMEzQ-0006Sh-D1; Sun, 29 Jan 2023 22:13:28 +0100
Message-ID: <73f7aba7-1533-ed16-fc76-97a758aaaf1d@leemhuis.info>
Date: Sun, 29 Jan 2023 22:13:25 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Heads-up: one change merged for -rc6 that might be good to have in
 the next 6.1.y release
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1675026810;c2880dff;
X-HE-SMSGID: 1pMEzQ-0006Sh-D1

Hi Greg. Just a heads up that likely isn't needed, as the change
mentioned below has a proper Cc: <stable@...> tag, so you scripts will
likely do the right thing automatically. But just to be sure:

I'm pretty sure Vlastimil would be extremely happy if you include
95e7a450b819 ("Revert "mm/compaction: fix set skip in
fast_find_migrateblock"") [was merged ~2 hours ago] in the next 6.1.y
release, as he in [1] wrote:

> FWIW, I consider this serious enough to be fixed in mainline+stable ASAP,
> hopefully in rc5, as it does hurt people using 6.1. mm-fixes PR for rc5 was
> sent 2 days ago [1] so please flag this in your regression report for Linus
> etc. Thanks.

[1]
https://lore.kernel.org/all/f47f69f9-7378-f18c-399b-b277c753532e@suse.cz/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
