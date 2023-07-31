Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8901DDC5
	for <regressions@lists.linux.dev>; Mon, 31 Jul 2023 22:11:16 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so5158812f8f.2
        for <regressions@lists.linux.dev>; Mon, 31 Jul 2023 15:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690841475; x=1691446275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pG9mGaJw0oLWkMWSPqLey0DSlekkz+WPcfbnO7e1pGQ=;
        b=AdJx8ydCFIxARVitkfM9CNQfZXbUI80HNWKPO1Yi0sm8djbBCc5tCgR5RLwKIN7ebu
         D7Vv6AVdl4xoLugu6FzgI97k6sHx6VjhwUBetaw/pVvmMep64HTHs9MCBCWv9BaqDvLg
         geVDaeZkscfBDRXVeU68N9fskl4Cge+UPXjb6UcUJDqvbrQaQyt8kbH3nS3QDvRqR7xP
         V0SONxpWj77cGcJ5BYw27QuZXgdLYNQ9YOn/70OuwP8Q9R0klNLO2QAjRDdDKdFR+Gfz
         HLqhFvyal2Q1BCynQzfZv3RVTNTkae2uDJTB2sK4O8QJTbSEbbuSWu7BTf9UPN6CGAtq
         28Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690841475; x=1691446275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG9mGaJw0oLWkMWSPqLey0DSlekkz+WPcfbnO7e1pGQ=;
        b=DRU1SM4mS1qpCBzHEH32iaX+bM+FfW56MgbXdI4l8CEqIO/xb0idDEsb31hHPaWORT
         EVvi+93KP5JzBM4KdnXv83l/rHYUZauQAdPv5kGvaSOZU0E2bJSJ22RgtF5H4DztkLLm
         4bqkruNMUY+H8zr/UPw6AEzj8nK3MXQtVVjwuzTR/wt4Jn/n86Wi1bs4P4USInidVc/Z
         fOl3CL3eqbbrenGn8kAiV4p/nVQsN0o9ee9vUdm3wpeTGukTRjfF5NEHl8W39RQW9OZW
         4C8Lb+ZlOMglvMr6JpOe27d2cG9XFwnI9hCsqILGGh/BHNWt/Ej0vbF1QOgGsycsjQh6
         nuRg==
X-Gm-Message-State: ABy/qLYgERQHzLid97cKSp+f0DX9U+mCAw3OGS/sbjel6E2WaMNnq3ls
	evzF2RMk+GSnjxs2S+i72fU=
X-Google-Smtp-Source: APBJJlFou8tDW9Flgwyhx9pQWEeY3FQxFVM+Nrg0yh4xg7Rg2mTQKyrDZDHLxPb2fsVAVFdEHjzSBA==
X-Received: by 2002:a5d:670b:0:b0:317:6263:1ae2 with SMTP id o11-20020a5d670b000000b0031762631ae2mr806329wru.63.1690841474399;
        Mon, 31 Jul 2023 15:11:14 -0700 (PDT)
Received: from krava ([83.240.60.220])
        by smtp.gmail.com with ESMTPSA id l10-20020a5d410a000000b00317495f88fasm14127444wrp.112.2023.07.31.15.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 15:11:13 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 1 Aug 2023 00:11:11 +0200
To: Lorenzo Stoakes <lstoakes@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Uladzislau Rezki <urezki@gmail.com>,
	linux-fsdevel@vger.kernel.org, Jiri Olsa <olsajiri@gmail.com>,
	Will Deacon <will@kernel.org>, Mike Galbraith <efault@gmx.de>,
	Mark Rutland <mark.rutland@arm.com>, wangkefeng.wang@huawei.com,
	catalin.marinas@arm.com, ardb@kernel.org,
	David Hildenbrand <david@redhat.com>,
	Linux regression tracking <regressions@leemhuis.info>,
	regressions@lists.linux.dev, Matthew Wilcox <willy@infradead.org>,
	Liu Shixin <liushixin2@huawei.com>, Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>, stable@vger.kernel.org
Subject: Re: [PATCH] fs/proc/kcore: reinstate bounce buffer for KCORE_TEXT
 regions
Message-ID: <ZMgxf++oeQ2VU94J@krava>
References: <20230731215021.70911-1-lstoakes@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731215021.70911-1-lstoakes@gmail.com>

On Mon, Jul 31, 2023 at 10:50:21PM +0100, Lorenzo Stoakes wrote:
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

it fixed my issue, thanks

Tested-by: Jiri Olsa <jolsa@kernel.org>

jirka

> Closes: https://lore.kernel.org/all/ZHc2fm+9daF6cgCE@krava
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
> ---
>  fs/proc/kcore.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
> index 9cb32e1a78a0..3bc689038232 100644
> --- a/fs/proc/kcore.c
> +++ b/fs/proc/kcore.c
> @@ -309,6 +309,8 @@ static void append_kcore_note(char *notes, size_t *i, const char *name,
>  
>  static ssize_t read_kcore_iter(struct kiocb *iocb, struct iov_iter *iter)
>  {
> +	struct file *file = iocb->ki_filp;
> +	char *buf = file->private_data;
>  	loff_t *fpos = &iocb->ki_pos;
>  	size_t phdrs_offset, notes_offset, data_offset;
>  	size_t page_offline_frozen = 1;
> @@ -554,11 +556,22 @@ static ssize_t read_kcore_iter(struct kiocb *iocb, struct iov_iter *iter)
>  			fallthrough;
>  		case KCORE_VMEMMAP:
>  		case KCORE_TEXT:
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
>  			/*
>  			 * We use _copy_to_iter() to bypass usermode hardening
>  			 * which would otherwise prevent this operation.
>  			 */
> -			if (_copy_to_iter((char *)start, tsz, iter) != tsz) {
> +			} else if (_copy_to_iter(buf, tsz, iter) != tsz) {
>  				ret = -EFAULT;
>  				goto out;
>  			}
> @@ -595,6 +608,10 @@ static int open_kcore(struct inode *inode, struct file *filp)
>  	if (ret)
>  		return ret;
>  
> +	filp->private_data = kmalloc(PAGE_SIZE, GFP_KERNEL);
> +	if (!filp->private_data)
> +		return -ENOMEM;
> +
>  	if (kcore_need_update)
>  		kcore_update_ram();
>  	if (i_size_read(inode) != proc_root_kcore->size) {
> @@ -605,9 +622,16 @@ static int open_kcore(struct inode *inode, struct file *filp)
>  	return 0;
>  }
>  
> +static int release_kcore(struct inode *inode, struct file *file)
> +{
> +	kfree(file->private_data);
> +	return 0;
> +}
> +
>  static const struct proc_ops kcore_proc_ops = {
>  	.proc_read_iter	= read_kcore_iter,
>  	.proc_open	= open_kcore,
> +	.proc_release	= release_kcore,
>  	.proc_lseek	= default_llseek,
>  };
>  
> -- 
> 2.41.0
> 
