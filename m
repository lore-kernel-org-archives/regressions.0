Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.93.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795569914;
	b=rfPZ3hdUgfIJwd9iJA5jX3TcYo9eHORqVrONyVe+JtqgHXgq+BZvOdsn2/a/48oC5Vsq
	 vS+LhvJQdXx8Zv4I4pji2uk8yhPkalFMKrUuu+OpC8Bj6QP8AzluVY+BbDWvTtisCTJs1
	 XIAOhWSPVCWK3ktUwcMy1N02AHLIr7o7w0vm4j5nXNQaTxNM4Ig75UJG3Yz1aEanSDH2B
	 fk14gGncrde8BmPiFimYhVT2idbkPBBCxmBFSVd6NsrJdOUMNKWeVsl8VvDYrrItDTkES
	 uz0ZPseDS9mQ10YrIUTkTNAUQA/N4RfNaGuULeq3w2ZP7CtyKleMx28b2jHQvW8QtiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795569914;
	h=DMARC-Filter:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=BMhI++4hrmOQdb1jbtyFj7f8QyI0a7HFLcXSQC8NNgQ=;
	b=toNkBsK4AZ+lV2bNtre5TvHs7SKEnEv46bEcy72zHYicArBgH2Sk5yD+r96JYqT35J3Z
	 2LtdvdDWLO/zzqC6OCgC4kCDbR1tpMMcK9KKem6ujRKwD8eAI/el0G+JVMUx65He020RG
	 rWyU6lXOX74OKTzmOkbUu2Kgm84sYvyu3j3PcMo/BlqY+IgX5/ZFRxcJhrhNU8IZNN6Cs
	 GfuEAZSHeDYiK6omIQQd5x0cJq8E3GF0FECeQanXpgrbRcox/IBqqhnLeXrtv2YxQ/pZ+
	 5ngqXA2EjHg7zY8fabtMIU+0iigKIhbmYdxfdN/XkDr63+BC1IOlJq0R2QzQufX6fWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=none smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.93.99
Received: from dggmsgout11.his.huawei.com (dggmsgout11.his.huawei.com [124.71.93.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1F3606A338
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 01:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC1F3606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggmsgout11.his.huawei.com (SkyGuard) with ESMTP id 4jZ26S5Z3hz1c1F8
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 09:25:04 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 07D9240573
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 09:25:09 +0800 (CST)
Received: from [10.174.179.19] (unknown [10.174.179.19])
	by APP4 (Coremail) with UTF8SMTPSA id gCh0CgCn4O_rOAZrGoHDFg--.50683S3;
	Wed, 25 Nov 2026 09:25:08 +0800 (CST)
Message-ID: <490a7578-6171-4a48-8d7a-b8541f0e9425@huaweicloud.com>
Date: Wed, 25 Nov 2026 09:24:59 +0800
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ext4: silent data loss when a split at I/O
 completion gets ENOSPC
To: Jan Kara <jack@suse.cz>
Cc: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Theodore Ts'o <tytso@mit.edu>,
 Baokun Li <libaokun@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 guolingxing <guolingxing@tju.edu.cn>, Josef Bacik <josef@toxicpanda.com>,
 Chris Mason <mason@kernel.org>, linux-ext4@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <d400205a-0d3d-4ec3-a916-6c0a085841b4@linux.dev>
 <d8ac3185-44c8-41e7-9cbf-3d1baa27f272@huaweicloud.com>
 <20261117-jf-ext4-enospc-reply-zhangyi-v9-b19eeb966ad0@linux.dev>
 <10712329-a587-496d-babf-620ebfd0e60e@huaweicloud.com>
 <20261118-jf-ext4-enospc-reply-zhangyi-v13-3886a3248c32@linux.dev>
 <9be1cb3e-4417-4609-bc0d-67dcfa24aa10@huaweicloud.com>
 <osarljpnd2viffbi3lrgqccyjxjo6ktez73sizcstqjiaw3cbc@e5jnepamtbkl>
Content-Language: en-US
From: Zhang Yi <yi.zhang@huaweicloud.com>
In-Reply-To: <osarljpnd2viffbi3lrgqccyjxjo6ktez73sizcstqjiaw3cbc@e5jnepamtbkl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgCn4O_rOAZrGoHDFg--.50683S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXr45WFWUZF45ZrWUAFW7XFb_yoW5KF1rpF
	Z5Ca43Kr4kKw1UJrsFqw1xX34Fkw4SgF4UGrykWr17u398urySgFs7KryY9F9Fkr4xGw1j
	vFWj934ru3Z8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUF1
	v3UUUUU
X-CM-SenderInfo: d1lo6xhdqjqx5xdzvxpfor3voofrz/

On 11/24/2026 11:53 PM, Jan Kara wrote:
> On Tue 24-11-26 12:49:19, Zhang Yi wrote:
>> On 11/18/2026 10:06 PM, Jose Fernandez (Anthropic) wrote:
>>> On Wed, Nov 18, 2026 Zhang Yi wrote:
>>>> Could you provide a reproducer? My guess is that high concurrency causes
>>>> the blocks freed by my current process to be taken by I/O issued by
>>>> other processes
>>>
>>> That fits our runs. I'll send you the script off-list.
>>>
>>> - Jose
>>
>>
>> Thank you for the reproducer. After debugging, I confirmed the cause. On
>> each failed endio conversion, the retry commits the journal, but the
>> blocks released by the commit are soon claimed again by the
>> background fallocate loop, so after 3 retries the DIO finally returns
>> ENOSPC.
>>
>> Although Ojaswin's v2 does track the exact ranges when submitting I/Os,
>> we cannot convert the whole extent after zeroing until all in-flight I/Os
>> overlapping this extent have finished, which is too expensive to me. So I
>> think we may still need the split to succeed.
>>
>> Note that we do reserve space for exactly this case. At mount time we
>> set aside s_resv_clusters (2% of the clusters, capped at 4096 clusters),
>> and EXT4_GET_BLOCKS_METADATA_NOFAIL is allowed to use it. The problem is
>> that this reservation is not effective today. s_freeclusters_counter is
>> incremented when blocks are freed, but for journaled frees the blocks
>> only return to the buddy allocator after the freeing transaction
>> commits. Most allocation paths already run inside a transaction, so we
>> cannot force a commit from there, and even between retries the released
>> space can be taken again, as the reproducer shows. So ordinary
>> allocations can currently consume the reserved pool, and endio extent
>> splits can be fooled into thinking space is available. This hurts both
>> endio extent conversion and delalloc writeback.
>>
>> My idea is to make this a real reservation of currently allocatable
>> clusters rather than just a counter check. We can subtract
>> sbi->s_mb_free_pending from free_clusters in ext4_has_free_clusters().
>> Then a successful check no longer counts clusters that cannot be
>> allocated yet, ordinary allocations can no longer eat into the reserved
>> pool, and the endio split can fall back on the reserve without having to
>> force a commit first. Delalloc reservations benefit as well, since
>> writeback is less likely to run into ENOSPC.
>>
>> The downside is that ENOSPC may be returned earlier, e.g. by buffered
>> writes under the same heavy concurrency. I think that is acceptable
>> since the retry is best effort anyway, and ext4_should_retry_alloc()
>> still forces a commit when there are pending frees, so it can cover most
>> scenarios. Even if it does fail, it is better to fail early than to fail
>> after the data has already been written. This is also consistent with
>> the behavior of allocating blocks directly when writing in old
>> dioread_lock mode.
>>
>> With the reproducer, this takes the DIO ENOSPC rate from ~11% to 0, and
>> failed conversion attempts from ~1500-2200 per run to ~0.3 per run.
>> fallocate ENOSPC did not increase noticeably (2.0% before vs 2.2% after).
>> However, the probability of returning ENOSPC for pure append writes
>> increases by about 10%.
>>
>> Does this approach sounds OK?
> 
> Yes, it sounds good to me. I was also puzzled why the reserved clusters are
> not effective so thanks for explaining that :)
> 
> 								Honza

Thank you for confirming this idea. Let's continue moving forward in
this direction. :)

Best Regards,
Yi.

