Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13DB68
	for <regressions@lists.linux.dev>; Sun, 28 Nov 2021 08:07:37 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mrFDk-0000Dq-3h; Sun, 28 Nov 2021 09:07:36 +0100
Message-ID: <89d7ae53-7f08-ac59-12cb-33c12a8ee530@leemhuis.info>
Date: Sun, 28 Nov 2021 09:07:35 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: mm: LTP/memcg testcase regression induced by
 8cd7c588decf..66ce520bb7c2 series #justforregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <99e779783d6c7fce96448a3402061b9dc1b3b602.camel@gmx.de>
 <6cc591c5-ed71-3213-3119-c778b3b2823d@leemhuis.info>
In-Reply-To: <6cc591c5-ed71-3213-3119-c778b3b2823d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1638086857;9f91861e;
X-HE-SMSGID: 1mrFDk-0000Dq-3h

On 21.11.21 14:51, Thorsten Leemhuis wrote:
> On 21.11.21 11:57, Mike Galbraith wrote:
>> Greetings,
>>
>> FYI, something in this series causes LTP controllers::memcg_regression
>> testcase to hang forever.  Verified via brute force revert of the lot.
>>
>> After letting box moan for 4.5 hours, I poked ^C repeatedly, but runltp
>> didn't exit/recover gracefully, and ps hung, so I nuked the box.  All
>> memcg_test_1 instances were stuck in reclaim_throttle().
>> [...]
> 
> TWIMC: To be sure this issue doesn't fall through the cracks unnoticed,
> I'm adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced 8cd7c588decf..66ce520bb7c2
> #regzbot ignore-activity

#regzbot link:
https://lore.kernel.org/lkml/20211124011954.7cab9bb4@mail.inbox.lv/
Related regression, likely to be fixed by the same patch
