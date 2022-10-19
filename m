Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8E27E
	for <regressions@lists.linux.dev>; Wed, 19 Oct 2022 07:53:38 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id o9-20020a17090a0a0900b0020ad4e758b3so16254826pjo.4
        for <regressions@lists.linux.dev>; Wed, 19 Oct 2022 00:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZueTs/+bMoVLrqmmW5H/dNZecXv1no47pT1obzP7u3w=;
        b=jtnxRpT6KgQnC1BwlAlJxMurrb0XX717mTowe4b8xq51pu/zH88fKlk8qW1JAtRmqj
         h8k3FxuZTA/zGBiWBKj99iW54w4rqs4G5da/yL05ye8Kd/kggb7jRrYG6ICfnjhqwni4
         eiVw/1OxVsqAWF6A4N00x18TKxGqUW96jYEeFMZ7lc/XD4/ytuQC++8y0NT69IeWVSXA
         loVo1n/n0hSx3F2Vh0ejpQiHmq5NziZSroAnThnVMvy8WWZwfx2ZNuMXm8AQbw34wWHJ
         GSJn9dumt+spGOjS3qtMuJUlEOu62HcaH2ySyw2x/HgJdcLTQshJaz201rZU2L4xxGTN
         hCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZueTs/+bMoVLrqmmW5H/dNZecXv1no47pT1obzP7u3w=;
        b=g2sDbVg9/57IBV9AKPoDkGW7fywpQ+uzJgBKohL8RpcLp+tuftf18pai//cXUb3qsa
         gkYsLv+zCAqMPcaraPz4YB4grIRcNN8fjt1/eiAUYqHy2o6IvSaObWdrBrAdpZ/Mv0HZ
         q/r6TOVeNklIQTkuRgo4vjrmmXI9YpoH+n6kQZwtUC9QoYaRX4yNvSct4dE2zbmDq1NA
         XOwdozmemLL5HPYN3FgWmG9G6xAqpqoUILpmnPbiuDF+5TNWVL4dVTwVA8pdchbwI4uc
         kEtQIO9nQeieji76A6Uk/n32PFLeSnUGfNjJrxOXQXxm3PdWX9IVXmMkwAKVAFhDoklB
         DPKA==
X-Gm-Message-State: ACrzQf1xmrSIibmm8rPvEO3GnSPlAB8HLtd0UanbkC8fKugLm8xirUEN
	ebfvyNhVHHQFjF0qA21qdBY=
X-Google-Smtp-Source: AMsMyM6Gn15eQm0Z+63XzH0wXZGF6XR/fxfTtO/QUhzN2el13W+HTAqNhLJkA6e+rrDrsermsJL1cA==
X-Received: by 2002:a17:903:3249:b0:181:150c:fcc7 with SMTP id ji9-20020a170903324900b00181150cfcc7mr7313344plb.119.1666166017531;
        Wed, 19 Oct 2022 00:53:37 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-65.three.co.id. [180.214.233.65])
        by smtp.gmail.com with ESMTPSA id z10-20020a170902d54a00b00172951ddb12sm10041831plf.42.2022.10.19.00.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 00:53:37 -0700 (PDT)
Message-ID: <54964dcf-6c98-464f-d1ad-e2d484c9c953@gmail.com>
Date: Wed, 19 Oct 2022 14:53:32 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: hsinyi@chromium.org, linux-kernel@vger.kernel.org,
 marcmiltenberger@gmail.com, mirsad.todorovac@alu.unizg.hr,
 nicememory@gmail.com, regressions@leemhuis.info,
 regressions@lists.linux.dev, srw@sladewatkins.net
References: <cfe5dd3a-5820-98cf-ae31-b6a3ff3f0578@squashfs.org.uk>
 <20221018174157.1897-1-phillip@squashfs.org.uk>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20221018174157.1897-1-phillip@squashfs.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/22 00:41, Phillip Lougher wrote:
> This diff has fixed the problem with my repoducer.
> Please test and report your results.
> 
> Phillip
> 
> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> index e56510964b22..e526eb7a1658 100644
> --- a/fs/squashfs/file.c
> +++ b/fs/squashfs/file.c
> @@ -557,6 +557,7 @@ static void squashfs_readahead(struct readahead_control *ractl)
>  		int res, bsize;
>  		u64 block = 0;
>  		unsigned int expected;
> +		struct page *last_page;
>  
>  		nr_pages = __readahead_batch(ractl, pages, max_pages);
>  		if (!nr_pages)
> @@ -593,15 +594,15 @@ static void squashfs_readahead(struct readahead_control *ractl)
>  
>  		res = squashfs_read_data(inode->i_sb, block, bsize, NULL, actor);
>  
> -		squashfs_page_actor_free(actor);
> +		last_page = squashfs_page_actor_free(actor);
>  
>  		if (res == expected) {
>  			int bytes;
>  
>  			/* Last page (if present) may have trailing bytes not filled */
>  			bytes = res % PAGE_SIZE;
> -			if (pages[nr_pages - 1]->index == file_end && bytes)
> -				memzero_page(pages[nr_pages - 1], bytes,
> +			if (index == file_end && bytes && last_page)
> +				memzero_page(last_page, bytes,
>  					     PAGE_SIZE - bytes);
>  
>  			for (i = 0; i < nr_pages; i++) {
> diff --git a/fs/squashfs/page_actor.c b/fs/squashfs/page_actor.c
> index 54b93bf4a25c..6aa38f88e31c 100644
> --- a/fs/squashfs/page_actor.c
> +++ b/fs/squashfs/page_actor.c
> @@ -53,6 +53,7 @@ struct squashfs_page_actor *squashfs_page_actor_init(void **buffer,
>  	actor->pages = pages;
>  	actor->next_page = 0;
>  	actor->tmp_buffer = NULL;
> +	actor->last_page = NULL;
>  	actor->squashfs_first_page = cache_first_page;
>  	actor->squashfs_next_page = cache_next_page;
>  	actor->squashfs_finish_page = cache_finish_page;
> @@ -71,11 +72,13 @@ static void *handle_next_page(struct squashfs_page_actor *actor)
>  			(actor->next_index != actor->page[actor->next_page]->index)) {
>  		actor->next_index++;
>  		actor->returned_pages++;
> +		actor->last_page = NULL;
>  		return actor->alloc_buffer ? actor->tmp_buffer : ERR_PTR(-ENOMEM);
>  	}
>  
>  	actor->next_index++;
>  	actor->returned_pages++;
> +	actor->last_page = actor->page[actor->next_page];
>  	return actor->pageaddr = kmap_local_page(actor->page[actor->next_page++]);
>  }
>  
> diff --git a/fs/squashfs/page_actor.h b/fs/squashfs/page_actor.h
> index 95ffbb543d91..97d4983559b1 100644
> --- a/fs/squashfs/page_actor.h
> +++ b/fs/squashfs/page_actor.h
> @@ -16,6 +16,7 @@ struct squashfs_page_actor {
>  	void    *(*squashfs_first_page)(struct squashfs_page_actor *);
>  	void    *(*squashfs_next_page)(struct squashfs_page_actor *);
>  	void    (*squashfs_finish_page)(struct squashfs_page_actor *);
> +	struct page *last_page;
>  	int	pages;
>  	int	length;
>  	int	next_page;
> @@ -29,10 +30,13 @@ extern struct squashfs_page_actor *squashfs_page_actor_init(void **buffer,
>  extern struct squashfs_page_actor *squashfs_page_actor_init_special(
>  				struct squashfs_sb_info *msblk,
>  				struct page **page, int pages, int length);
> -static inline void squashfs_page_actor_free(struct squashfs_page_actor *actor)
> +static inline struct page *squashfs_page_actor_free(struct squashfs_page_actor *actor)
>  {
> +	struct page *last_page = actor->last_page;
> +
>  	kfree(actor->tmp_buffer);
>  	kfree(actor);
> +	return last_page;
>  }
>  static inline void *squashfs_first_page(struct squashfs_page_actor *actor)
>  {

The fixup makes regression gone, thanks.

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara

