Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D801F93D
	for <regressions@lists.linux.dev>; Tue,  1 Aug 2023 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690880746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9kdFDWcMyK/1HOobM9v5phnyHdEWyzyFaqhLZWLocA=;
	b=HK2FxibLFBP73YBplhU7Cja5w7Zac3sN40Wh0028wdke+aMKRAZiOX15Tky/ZxmuN+k+Un
	aQLOv0BzMJw7mnsNP9zN0llWbs0uYkQ42+A/J4y5thFuTjuliJfyWniT3WTMOiLA3wKVwG
	0WAYaLRZ7ivWcKKkeTMVAyNa5tSiMVY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-iBEO2ZksOxiXAl2i55e0Ug-1; Tue, 01 Aug 2023 05:05:43 -0400
X-MC-Unique: iBEO2ZksOxiXAl2i55e0Ug-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f5df65fa35so31928515e9.3
        for <regressions@lists.linux.dev>; Tue, 01 Aug 2023 02:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690880742; x=1691485542;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9kdFDWcMyK/1HOobM9v5phnyHdEWyzyFaqhLZWLocA=;
        b=TrW3FoMYpMLLhovkUAchMejTb9jwJq6ES1J+b17rnFZ9o1uCNh78Y4gqAmIvm4yYBE
         QDR6cmuzXeItk2E/vW032PPSJ+tFLuM1OtPLMsSGdmMQOci2JjaIztCGrS6Da5aA1LN8
         TDuL//benfeiMHAnaU3oRPcn7bo6u+c5Mwm47FxATKAggEL5LKceW4CpLamD7yrDB5nt
         PKXNg+UDL+GkIp6cHtHhFNS6PqE1orYcoET06slGYOfE6Pdv9Sm5LLwh+NhBPpGLBiYZ
         vgK7yv7JjalJgltSxaoR4bqbD8vmDkmmIccITG125fqjutYW5NWrRCn9eokWb2gV/bCW
         CbLA==
X-Gm-Message-State: ABy/qLZmh51HeSiXwv2fnj8BfSEwEPV0DfZY42nytKg6Vmeq4ck+OHGW
	YqmcV3cqI5CIsQs0e26/KIWJUDouQEh/sLjaqaDdwfPLN3Ma01uirBEdkVEuLbKXZmxVWUZlH6H
	hpEw1HSRftjTiCchBSeWpf2k=
X-Received: by 2002:a7b:ce16:0:b0:3fc:521:8492 with SMTP id m22-20020a7bce16000000b003fc05218492mr1796110wmc.5.1690880742248;
        Tue, 01 Aug 2023 02:05:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEC68EW/3Q+u0VSARbq5VNE5NLUF7t+a5naaLWqjf05jsPmAZ5g85TjNh4l1QEK1armULjtOw==
X-Received: by 2002:a7b:ce16:0:b0:3fc:521:8492 with SMTP id m22-20020a7bce16000000b003fc05218492mr1796077wmc.5.1690880741870;
        Tue, 01 Aug 2023 02:05:41 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:d100:871b:ec55:67d:5247? (p200300cbc705d100871bec55067d5247.dip0.t-ipconnect.de. [2003:cb:c705:d100:871b:ec55:67d:5247])
        by smtp.gmail.com with ESMTPSA id f17-20020adffcd1000000b00313f61889ecsm15587910wrs.66.2023.08.01.02.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 02:05:41 -0700 (PDT)
Message-ID: <0af1bc20-8ba2-c6b6-64e6-c1f58d521504@redhat.com>
Date: Tue, 1 Aug 2023 11:05:40 +0200
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
To: Lorenzo Stoakes <lstoakes@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <bhe@redhat.com>, Uladzislau Rezki <urezki@gmail.com>,
 linux-fsdevel@vger.kernel.org, Jiri Olsa <olsajiri@gmail.com>,
 Will Deacon <will@kernel.org>, Mike Galbraith <efault@gmx.de>,
 Mark Rutland <mark.rutland@arm.com>, wangkefeng.wang@huawei.com,
 catalin.marinas@arm.com, ardb@kernel.org,
 Linux regression tracking <regressions@leemhuis.info>,
 regressions@lists.linux.dev, Matthew Wilcox <willy@infradead.org>,
 Liu Shixin <liushixin2@huawei.com>, Jens Axboe <axboe@kernel.dk>,
 Alexander Viro <viro@zeniv.linux.org.uk>, stable@vger.kernel.org
References: <20230731215021.70911-1-lstoakes@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230731215021.70911-1-lstoakes@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.07.23 23:50, Lorenzo Stoakes wrote:
> Some architectures do not populate the entire range categorised by
> KCORE_TEXT, so we must ensure that the kernel address we read from is
> valid.
> 
> Unfortunately there is no solution currently available to do so with a
> purely iterator solution so reinstate the bounce buffer in this instance so
> we can use copy_from_kernel_nofault() in order to avoid page faults when
> regions are unmapped.
> 
> This change partly reverts commit 2e1c0170771e ("fs/proc/kcore: avoid
> bounce buffer for ktext data"), reinstating the bounce buffer, but adapts
> the code to continue to use an iterator.
> 
> Fixes: 2e1c0170771e ("fs/proc/kcore: avoid bounce buffer for ktext data")
> Reported-by: Jiri Olsa <olsajiri@gmail.com>
> Closes: https://lore.kernel.org/all/ZHc2fm+9daF6cgCE@krava
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
> ---
>   fs/proc/kcore.c | 26 +++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
> index 9cb32e1a78a0..3bc689038232 100644
> --- a/fs/proc/kcore.c
> +++ b/fs/proc/kcore.c
> @@ -309,6 +309,8 @@ static void append_kcore_note(char *notes, size_t *i, const char *name,
>   
>   static ssize_t read_kcore_iter(struct kiocb *iocb, struct iov_iter *iter)
>   {
> +	struct file *file = iocb->ki_filp;
> +	char *buf = file->private_data;
>   	loff_t *fpos = &iocb->ki_pos;
>   	size_t phdrs_offset, notes_offset, data_offset;
>   	size_t page_offline_frozen = 1;
> @@ -554,11 +556,22 @@ static ssize_t read_kcore_iter(struct kiocb *iocb, struct iov_iter *iter)
>   			fallthrough;
>   		case KCORE_VMEMMAP:
>   		case KCORE_TEXT:
> +			/*
> +			 * Sadly we must use a bounce buffer here to be able to
> +			 * make use of copy_from_kernel_nofault(), as these
> +			 * memory regions might not always be mapped on all
> +			 * architectures.
> +			 */
> +			if (copy_from_kernel_nofault(buf, (void *)start, tsz)) {
> +				if (iov_iter_zero(tsz, iter) != tsz) {
> +					ret = -EFAULT;
> +					goto out;
> +				}
>   			/*
>   			 * We use _copy_to_iter() to bypass usermode hardening
>   			 * which would otherwise prevent this operation.
>   			 */

Having a comment at this indentation level looks for the else case looks 
kind of weird.

(does that comment still apply?)


-- 
Cheers,

David / dhildenb

