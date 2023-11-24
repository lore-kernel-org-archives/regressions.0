Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF98723A0
	for <regressions@lists.linux.dev>; Fri, 24 Nov 2023 05:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r6OQT-0000LE-2r; Fri, 24 Nov 2023 06:08:25 +0100
Message-ID: <2541055a-48c9-4680-ad9b-5a3c41995a1d@leemhuis.info>
Date: Fri, 24 Nov 2023 06:08:24 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION]: mmap performance regression starting with k-6.1
Content-Language: en-US, de-DE
To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Chun Ng <chunn@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Ankita Garg <ankitag@nvidia.com>, Suren Baghdasaryan <surenb@google.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <PH7PR12MB7937B0DF19E7E8539703D0E3D6BAA@PH7PR12MB7937.namprd12.prod.outlook.com>
 <ZV7eHE2Fxb75oRpG@archie.me> <20231123143452.erzar3sqhg37hjxz@revolver>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20231123143452.erzar3sqhg37hjxz@revolver>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1700802519;d23a3611;
X-HE-SMSGID: 1r6OQT-0000LE-2r

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 23.11.23 15:34, Liam R. Howlett wrote:
> * Bagas Sanjaya <bagasdotme@gmail.com> [231123 00:07]:
>> On Wed, Nov 22, 2023 at 08:03:19PM +0000, Chun Ng wrote:
>>>
>>> Recently I observed there is performance regression on system call mmap(..). I tried both vanilla kernels and Raspberry Pi kernels on a Raspberry Pi 4 box and the results are pretty consistent among them.
>>>
>>> Bisection showed that the regression starts from k-6.1, and the latest vanilla k-6.7 is still showing the same regression.
> 
> This is almost certainly the maple tree.  The tree is slower on writes
> than the rbtree and so if the benchmark mmaps/munmaps in a tight loop
> you will see this slow down. [...]
>
>> Anyway, I'm adding this regression to regzbot:
>> #regzbot ^introduced: v6.0..v6.1

Liam, many thx for your reply. I known that you are still working on
optimizing things in this area again, so I don't think this is worth
tracking this as a regression: that doesn't buy us much afaics. And it
might not be a regression at all anyway (not totally sure, didn't look
into the details due to the former aspect; sounded a bit like the
problem only can be seen in a microbenchmark; whatever).

#regzbot resolve: not worth tracking

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

