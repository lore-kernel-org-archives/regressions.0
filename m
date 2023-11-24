Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F63B2E844
	for <regressions@lists.linux.dev>; Fri, 24 Nov 2023 15:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r6Y7u-0004OG-JX; Fri, 24 Nov 2023 16:29:54 +0100
Message-ID: <33b55166-00a3-4947-ad4f-387ddfa2c7a4@leemhuis.info>
Date: Fri, 24 Nov 2023 16:29:53 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION]: mmap performance regression starting with k-6.1
Content-Language: en-US, de-DE
To: Matthew Wilcox <willy@infradead.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Chun Ng <chunn@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Ankita Garg <ankitag@nvidia.com>
References: <PH7PR12MB7937B0DF19E7E8539703D0E3D6BAA@PH7PR12MB7937.namprd12.prod.outlook.com>
 <ZV7eHE2Fxb75oRpG@archie.me> <ZV9x6qZ5z8YTvTC4@casper.infradead.org>
 <ZV_rJtxdn1dU9ip0@archie.me> <ZV/2nPBs5r1nIaW4@casper.infradead.org>
 <2023112402-posing-dress-4bf2@gregkh> <ZWC8BOtPW2bWBFqh@casper.infradead.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZWC8BOtPW2bWBFqh@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1700839802;65fea13b;
X-HE-SMSGID: 1r6Y7u-0004OG-JX

On 24.11.23 16:06, Matthew Wilcox wrote:
>  Mostly I ignore him now, but when he's instructing a bot
> to harass me, that crosses a line.

I'm curious: How is regzbot able to harass you? It as of now and likely
for at least another year is not able to send mails on its own -- by
design, as I wanted to ensure it doesn't harass anyone.

Sure, I might manually send a mail if something looks stalled in
regzbot. But before I do that I always do a sanity check to avoid
annoying people. Do I sometimes make mistakes or miss something in that
process? Sure. But that happens to all of us.

Ciao, Thorsten
