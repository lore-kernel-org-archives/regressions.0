Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A8123589
	for <regressions@lists.linux.dev>; Tue,  1 Aug 2023 18:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690913698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aebcEwGh27gNIQ03Imyal/tAdi6Up/DQcokGZ4ckJ+Y=;
	b=JP58bN7QUHrNXdQgIloZuS+s1GKkOfAHbMzVGMDc5/gwh40KzerDFUhVB3ByuPWoSKrjOe
	VAz/fx58xAOS+YnJZQ5qttozot31dmDMF1Qn/RaBhxZz7zUUNY5m4rOnUpZkBnpCI5u0gv
	6Lz5Hm52p6cQZroDGUk93XEwFkzeft8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-cSaoenllNHy2IfDvNh0pOA-1; Tue, 01 Aug 2023 14:14:56 -0400
X-MC-Unique: cSaoenllNHy2IfDvNh0pOA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fe25f8c4bfso9957095e9.2
        for <regressions@lists.linux.dev>; Tue, 01 Aug 2023 11:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690913695; x=1691518495;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aebcEwGh27gNIQ03Imyal/tAdi6Up/DQcokGZ4ckJ+Y=;
        b=BObAu4KQ9FbnG0RyJuNG/FRutPodcEEzRLmNgshmy8saKVQ6Dm6Xr81GrL4nuBu8t2
         JzfIofwIvNriZvPUJFtpgsxxWIWXsHpWHg2ROzrlvBsjmS3Qn0/rWMAWciDblm6PJhfc
         3yhirLx48HCaIHbKolMEIcXcJ9aPsB9iwUHbwhaHmd3i06iK5FTDjeA1nqbtlumRoyQG
         v+d/AfjeNk92ruJPWLETfD0hTpMfuw0WzwcRfebIH0KkO54dDv2KEm3E7c5YEbI7VQiO
         0l0xTfDbxaUOrThhJEKMkmJLWv7jfgpB7/5Xevqj5eGqUXqYN6+MDRZwxWAVcluiBPKs
         O8Mg==
X-Gm-Message-State: ABy/qLZQrOiTldrCcPatGz65LANeKxkD9ZfefzJFygVAACTEDDP6xMTf
	CqZ1/n7YCu/YaY9RFinKB6xb3DqDKoPRyvWRwMM9YfaTK/vaTfI01DwLNqDRhFggUHE6BCurV6g
	E7lZj3m+W6Y1OCnsE4s23Qwo=
X-Received: by 2002:a05:600c:2991:b0:3fe:1f98:deb7 with SMTP id r17-20020a05600c299100b003fe1f98deb7mr3227746wmd.35.1690913695682;
        Tue, 01 Aug 2023 11:14:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHjAyBiUjEr3ZWEVqJbYhIbSVEFxyFvlkeCGfJy70Ndyc8CB99cVZI0cTQrSpDMu/5BC6J9pA==
X-Received: by 2002:a05:600c:2991:b0:3fe:1f98:deb7 with SMTP id r17-20020a05600c299100b003fe1f98deb7mr3227726wmd.35.1690913695269;
        Tue, 01 Aug 2023 11:14:55 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:d100:871b:ec55:67d:5247? (p200300cbc705d100871bec55067d5247.dip0.t-ipconnect.de. [2003:cb:c705:d100:871b:ec55:67d:5247])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c219300b003fbdbd0a7desm17194996wme.27.2023.08.01.11.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 11:14:54 -0700 (PDT)
Message-ID: <70442e7f-a401-1b4a-3060-ee1d9ac45290@redhat.com>
Date: Tue, 1 Aug 2023 20:14:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] fs/proc/kcore: reinstate bounce buffer for KCORE_TEXT
 regions
To: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-fsdevel@vger.kernel.org,
 Jiri Olsa <olsajiri@gmail.com>, Will Deacon <will@kernel.org>,
 Mike Galbraith <efault@gmx.de>, Mark Rutland <mark.rutland@arm.com>,
 wangkefeng.wang@huawei.com, catalin.marinas@arm.com, ardb@kernel.org,
 Linux regression tracking <regressions@leemhuis.info>,
 regressions@lists.linux.dev, Matthew Wilcox <willy@infradead.org>,
 Liu Shixin <liushixin2@huawei.com>, Jens Axboe <axboe@kernel.dk>,
 Alexander Viro <viro@zeniv.linux.org.uk>, stable@vger.kernel.org
References: <20230731215021.70911-1-lstoakes@gmail.com>
 <0af1bc20-8ba2-c6b6-64e6-c1f58d521504@redhat.com>
 <dc30a97b-853e-4d2a-b171-e68fb3ab026c@lucifer.local>
 <b6cb8d7f-f3f3-93c3-3ea0-4c184109a4db@redhat.com>
 <525a3f14-74fa-4c22-9fca-9dab4de8a0c3@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <525a3f14-74fa-4c22-9fca-9dab4de8a0c3@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> Hm good point, actually, now we're using the bounce buffer we don't need to
>>> avoid usermode hardening any more.
>>>
>>> However since we've established a bounce buffer ourselves its still
>>> appropriate to use _copy_to_iter() as we know the source region is good to
>>> copy from.
>>>
>>> To make life easy I'll just respin with an updated comment :)
>>
>> I'm not too picky this time, no need to resend if everybody else is fine :P
>>
> 
> Haha you know the classic Lorenzo respin spiral and want to avoid it I see ;)

Don't want to make your apparently stressful week more stressful. Not 
this time ;)

> 
> The comment is actually inaccurate now, so to avoid noise + make life easy
> (maybe) for Andrew here's a fix patch that just corrects the comment:-
> 
> ----8<----
> 
>  From d2b8fb271f21b79048e5630699133f77a93d0481 Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lstoakes@gmail.com>
> Date: Tue, 1 Aug 2023 17:36:08 +0100
> Subject: [PATCH] fs/proc/kcore: correct comment
> 
> Correct comment to be strictly correct about reasoning.
> 
> Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
> ---
>   fs/proc/kcore.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
> index 3bc689038232..23fc24d16b31 100644
> --- a/fs/proc/kcore.c
> +++ b/fs/proc/kcore.c
> @@ -568,8 +568,8 @@ static ssize_t read_kcore_iter(struct kiocb *iocb, struct iov_iter *iter)
>   					goto out;
>   				}
>   			/*
> -			 * We use _copy_to_iter() to bypass usermode hardening
> -			 * which would otherwise prevent this operation.
> +			 * We know the bounce buffer is safe to copy from, so
> +			 * use _copy_to_iter() directly.
>   			 */
>   			} else if (_copy_to_iter(buf, tsz, iter) != tsz) {
>   				ret = -EFAULT;
> --
> 2.41.0
> 

Thanks!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

