Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACEC8BF5
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 16:59:22 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pShbJ-0007uE-5Z; Thu, 16 Feb 2023 17:59:17 +0100
Message-ID: <611c1202-1978-8886-eec3-929933ee75cd@leemhuis.info>
Date: Thu, 16 Feb 2023 17:59:16 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] mm/migrate: Fix wrongly apply write bit after mkdirty on
 sparc64
Content-Language: en-US, de-DE
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Bowler <nbowler@draconx.ca>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230216153059.256739-1-peterx@redhat.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230216153059.256739-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676566762;6248c182;
X-HE-SMSGID: 1pShbJ-0007uE-5Z

On 16.02.23 16:30, Peter Xu wrote:
> Nick Bowler reported another sparc64 breakage after the young/dirty
> persistent work for page migration (per "Link:" below).  That's after a
> similar report [2].

Thx for handling this.

> [...]
>
> Note: this is based on mm-unstable, because the breakage was since 6.1 and
> we're at a very late stage of 6.2 (-rc8), so I assume for this specific
> case we should target this at 6.3.
> 
> [1] https://lore.kernel.org/all/20221021160603.GA23307@u164.east.ru/
> [2] https://lore.kernel.org/all/20221212130213.136267-1-david@redhat.com/
> 
> Cc: regressions@leemhuis.info

Not that it matters much, but feel free to use this instead:

CC: regressions@lists.linux.dev

Then things don't depend on me (in case I ever get help with my cat
herding job). And it also make it even more obvious that this patch
fixes a regression to anyone who handles it downstream.

> Fixes: 2e3468778dbe ("mm: remember young/dirty bit for page migrations")

That's a commit from 6.1, hence this should likely have:

Cc: stable@vger.kernel.org # 6.1.y

[no, a fixes tag alone does not suffice, see docs]

> Link: https://lore.kernel.org/all/CADyTPExpEqaJiMGoV+Z6xVgL50ZoMJg49B10LcZ=8eg19u34BA@mail.gmail.com/
> Reported-by: Nick Bowler <nbowler@draconx.ca>
> [...]

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
