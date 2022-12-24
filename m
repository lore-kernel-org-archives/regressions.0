Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB0A7B
	for <regressions@lists.linux.dev>; Sat, 24 Dec 2022 07:20:51 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p8yps-0000x0-Oo; Sat, 24 Dec 2022 08:20:48 +0100
Message-ID: <f1770b7c-d287-a255-0298-2523ce3a9565@leemhuis.info>
Date: Sat, 24 Dec 2022 08:20:48 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [6.2][regression] after commit
 ffcb754584603adf7039d7972564fbf6febdc542 all sound devices disappeared (due
 BUG at mm/page_alloc.c:3592!) #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: alsa-devel@alsa-project.org,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CABXGCsPnpu0TGHnvXM1we7q1t3tJAOYW2rA=AMvf7ZahcYvpRQ@mail.gmail.com>
 <5dff36ee-bfe5-4596-b01d-0eaca1b552bd@leemhuis.info>
In-Reply-To: <5dff36ee-bfe5-4596-b01d-0eaca1b552bd@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671866451;fba5fd2d;
X-HE-SMSGID: 1p8yps-0000x0-Oo



On 22.12.22 13:17, Thorsten Leemhuis wrote:
> [Note: this mail contains only information for Linux kernel regression
> tracking. Mails like these contain '#forregzbot' in the subject to make
> then easy to spot and filter out. The author also tried to remove most
> or all individuals from the list of recipients to spare them the hassle.]
> 
> On 15.12.22 15:17, Mikhail Gavrilov wrote:
>> Hi,
>> The kernel 6.2 preparation cycle has begun and yesterday after the
>> kernel was updated on my Fedora Rawhide all audio devices disappeared.
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced ffcb754584603adf
> #regzbot title dma-mapping: audio devices disappeared
> #regzbot monitor:
> https://lore.kernel.org/all/20221220082009.569785-1-hch@lst.de/
> #regzbot fix: dma-mapping: reject GFP_COMP for noncohernt allocaions

The typo in the subject of the fix was fixed, hence this is needed:

#regzbot fix: 3622b86f49f8
