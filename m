Received: from out30-45.freemail.mail.aliyun.com (out30-45.freemail.mail.aliyun.com [115.124.30.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD7A7C
	for <regressions@lists.linux.dev>; Fri, 27 May 2022 04:56:25 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0VEVggNJ_1653627374;
Received: from 30.32.82.202(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0VEVggNJ_1653627374)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 27 May 2022 12:56:15 +0800
Message-ID: <548a60d7-80bb-7551-cdc1-f9a58071a76b@linux.alibaba.com>
Date: Fri, 27 May 2022 12:56:42 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: mm: change huge_ptep_clear_flush() to return the original pte
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 lkft-triage@lists.linaro.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>
References: <CA+G9fYtDBZaBGkEp5tRMM5C1xHEKeyyNK1S4WoKvrOoFxGm4KQ@mail.gmail.com>
 <ac245d62-2295-8cf6-6808-4a6eb6bdbd21@linux.alibaba.com>
 <CAHk-=wjgGW_jsjZxKLcKCf4Di22vzJU6K56j0Oe8Td6RgKrc+A@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAHk-=wjgGW_jsjZxKLcKCf4Di22vzJU6K56j0Oe8Td6RgKrc+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/27/2022 11:42 AM, Linus Torvalds wrote:
> On Thu, May 26, 2022 at 8:36 PM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>> That is caused by commit:
>>
>> 00df1f1a133b ("mm: change huge_ptep_clear_flush() to return the original
>> pte")
>>
>> interacting with commit:
>>
>> fb396bb459c1 ("arm64/hugetlb: Drop TLB flush from get_clear_flush()")
>>
>> And Catalin has fixed the conflict with below changes [1], not sure why
>> it is not merged.
> 
> Argh. Nobody informed me (or if they did, I clearly missed it).
> 
>> Linus, should I send a proper patch to fix this conflict for you?
> 
> Yeah, somebody please send me a proper tested fix-up patch with commit
> message etc.

Sure. I send out a fix patch [1] which is already tested in linux-next 
for several days.

[1] 
https://lore.kernel.org/all/814e20c19b110209ee12ecae7cb05f8a78d021c8.1653625820.git.baolin.wang@linux.alibaba.com/
