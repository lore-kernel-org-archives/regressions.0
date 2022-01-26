Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7E168
	for <regressions@lists.linux.dev>; Wed, 26 Jan 2022 02:35:56 +0000 (UTC)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Jk6nV1ntqzccG3;
	Wed, 26 Jan 2022 10:17:50 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 26 Jan 2022 10:18:40 +0800
Received: from [10.174.178.178] (10.174.178.178) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 26 Jan 2022 10:18:39 +0800
Message-ID: <c0b74f54-c39a-51f7-08f8-701e9af94e56@huawei.com>
Date: Wed, 26 Jan 2022 10:18:38 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH] Revert "mm/page_isolation: unset migratetype directly for
 non Buddy page"
To: Vlastimil Babka <vbabka@suse.cz>, <akpm@linux-foundation.org>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<guillaume.tucker@collabora.com>
CC: <regressions@lists.linux.dev>, Oscar Salvador <osalvador@suse.de>
References: <20220117142712.3967624-1-chenwandun@huawei.com>
 <b1966d11-e874-c71e-d14f-c0c88ace297e@suse.cz>
From: Chen Wandun <chenwandun@huawei.com>
In-Reply-To: <b1966d11-e874-c71e-d14f-c0c88ace297e@suse.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.178]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected



在 2022/1/26 0:40, Vlastimil Babka 写道:
> On 1/17/22 15:27, Chen Wandun wrote:
>> This reverts commit 075782149abff45ee22f27315eced44d02b96779.
>>
>> commit 075782149abf ("mm/page_isolation: unset migratetype directly for
> That's an old -next commit id, it went to mainline as 721fb891ad0b
> ("mm/page_isolation: unset migratetype directly for non Buddy page")
>
>> non Buddy page") will result memory that should in buddy disappear by
>> mistake. move_freepages_block move all pages in pageblock instead of
>> pages indicated by input parameter, so if input pages is not in buddy
>> but other pages in pageblock is in buddy, it will result in page out of
>> control.
>>
>> Reported-by: "kernelci.org bot" <bot@kernelci.org>
>> Signed-off-by: Chen Wandun <chenwandun@huawei.com>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
>
> #regzbot ^introduced: 721fb891ad0b
>
> There should better be also:
>
> Fixes: 721fb891ad0b ("mm/page_isolation: unset migratetype directly for non
> Buddy page")
>
> Especially as that commit had a (inadequate, IMHO, for an optimization)
> Fixes: tag and could end up being backported somewhere without the followup
> fix/revert.
thanks, I will send v2
>
>> ---
>>   mm/page_isolation.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
>> index 6a0ddda6b3c5..f67c4c70f17f 100644
>> --- a/mm/page_isolation.c
>> +++ b/mm/page_isolation.c
>> @@ -115,7 +115,7 @@ static void unset_migratetype_isolate(struct page *page, unsigned migratetype)
>>   	 * onlining - just onlined memory won't immediately be considered for
>>   	 * allocation.
>>   	 */
>> -	if (!isolated_page && PageBuddy(page)) {
>> +	if (!isolated_page) {
>>   		nr_pages = move_freepages_block(zone, page, migratetype, NULL);
>>   		__mod_zone_freepage_state(zone, nr_pages, migratetype);
>>   	}
> .

