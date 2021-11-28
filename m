Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383BE68
	for <regressions@lists.linux.dev>; Sun, 28 Nov 2021 08:06:20 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mrFCT-0005AL-AJ; Sun, 28 Nov 2021 09:06:17 +0100
Message-ID: <908a2ab6-4906-1181-9b82-e6de8d896eee@leemhuis.info>
Date: Sun, 28 Nov 2021 09:06:16 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: mm: 5.16 regression: reclaim_throttle leads to stall in near-OOM
 conditions #justforregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20211124011954.7cab9bb4@mail.inbox.lv>
 <f9361bfa-4e5c-7095-48d4-2b3950c4b85e@leemhuis.info>
In-Reply-To: <f9361bfa-4e5c-7095-48d4-2b3950c4b85e@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1638086780;3252db7b;
X-HE-SMSGID: 1mrFCT-0005AL-AJ

On 24.11.21 08:40, Thorsten Leemhuis wrote:
> On 23.11.21 17:19, Alexey Avramov wrote:
>
> #regzbot ^introduced v5.15..v5.16-rc1
> #regzbot title mm: reclaim_throttle leads to stall in near-OOM conditions
> #regzbot ignore-activity

#regzbot link:
https://lore.kernel.org/lkml/99e779783d6c7fce96448a3402061b9dc1b3b602.camel@gmx.de/
Related regression, likely to be fixed by the same patch

