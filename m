Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892021C36
	for <regressions@lists.linux.dev>; Wed, 26 Oct 2022 18:14:15 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1onkuq-0001sl-6i; Wed, 26 Oct 2022 20:14:12 +0200
Message-ID: <9b669a52-93e5-1615-9e04-9f61bfd62a94@leemhuis.info>
Date: Wed, 26 Oct 2022 20:14:11 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Observed memory leak in hugetlb_reserve_pages #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CAKXUXMxf7OiCwbxib7MwfR4M1b5+b3cNTU7n5NV9Zm4967=FPQ@mail.gmail.com>
 <e043f8a2-d429-553d-82f7-884998cd7671@leemhuis.info>
In-Reply-To: <e043f8a2-d429-553d-82f7-884998cd7671@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1666808055;b11d3584;
X-HE-SMSGID: 1onkuq-0001sl-6i

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 20.10.22 12:17, Thorsten Leemhuis wrote:
> On 17.10.22 13:11, Lukas Bulwahn wrote:
>>
>> The reproducer for the 'memory leak in hugetlb_reserve_pages' bug (see
>> https://elisa-builder-00.iol.unh.edu/syzkaller-next/report?id=3469603f4a0da86b581cc979bd6c6663b46ceb1b)
>> is reproducible, it is triggering the memory leak on the current
>> mainline (commit 60bb8154d1d7), and it was not triggering on v6.0. My
>> build config is a x86_64 defconfig with some syzkaller-recommended
>> debug options.
> 
> #regzbot ^introduced bbff39cc6cbc

#regzbot fixed-by: bbff39cc6cbcb86
