Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1502358D
	for <regressions@lists.linux.dev>; Tue,  1 Aug 2023 16:33:22 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31771bb4869so6021441f8f.0
        for <regressions@lists.linux.dev>; Tue, 01 Aug 2023 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690907600; x=1691512400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHGU2gldR70GqySNOHxAwDHvYPybisAew0SwiRmKpZY=;
        b=sUkr6tkOpfLpmNAXaSFuiW9LXXeEwoKnrmMBkcK4Hzd0GO2uCmDG+gS3aJeFobgXlD
         ImcBSaz6f4I9GQ+RO4VH50l6qUxD+A8J0DSNTD75KJC1ayt6U4xdPnPubhdWeczlWQ6H
         fMfduYyNkmjd2kWxa5QQJ123pP6nOzDRnh1UyGT5KnRAlO3R6gH86arPxDYsF/4Pn0ie
         rKXwqC3Nj3MtsSP9/dw1OtLM6sSmfKy6MMU9v7Uf0lNMpxRtqiBJuwYDHe1w6uAg17kf
         ZTu8tou6vHV8MSGse9+huBvZCwjrIlu7RI0oZQNdHGmjzTEizy9R6fAyj0yfLm36uJBV
         32xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690907600; x=1691512400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHGU2gldR70GqySNOHxAwDHvYPybisAew0SwiRmKpZY=;
        b=QSmRuECXwL5AhJIQADg43bM8y3JGv21zLSA5ytESzVrnpk0uV1GsGCmHfROF9d/m+U
         zrtn6VSVxC2AzfqcHzJuJieaXWtndtjGkVjTjssLHOgvz4N/kjcqp0HDWPPBqe6Vve7B
         bvyML61xlfP58OGE3nj5GmGXoOxCEwwo7fw0ZynEzC45NMZYRKa8G9MktO409Ld90aO8
         zNBONlXgN0lkcpRqFFTfSzg/MsPi4LXzXHviMWIDUqhDUk8q8lF97Afr5YU3KB9Gu8Vp
         v6qoLUzquFzsDQQpCAFlw6Wc09sGlaVnMn1ju3dCazd+PCdUrdm6cadanpGl21cNZiTy
         i6CA==
X-Gm-Message-State: ABy/qLbqbm8seOfhdxF4nhUn+iN7YbXMpytB12j8JY6C3cmHalCyOD/j
	jXs7c2cwFlTIRVd+iKy0xHU=
X-Google-Smtp-Source: APBJJlGWssiVAATcXmhQas2IAW1DtAJFXZ/rOYG4wKV4z3qFLF/SvVTfMh8RRRDM4z57utXs4wl8gg==
X-Received: by 2002:a5d:6783:0:b0:313:f02f:be7f with SMTP id v3-20020a5d6783000000b00313f02fbe7fmr2576237wru.55.1690907600207;
        Tue, 01 Aug 2023 09:33:20 -0700 (PDT)
Received: from localhost ([2a00:23c5:dc8c:8701:1663:9a35:5a7b:1d76])
        by smtp.gmail.com with ESMTPSA id h16-20020adffa90000000b0031423a8f4f7sm16488864wrr.56.2023.08.01.09.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 09:33:19 -0700 (PDT)
Date: Tue, 1 Aug 2023 17:33:18 +0100
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Uladzislau Rezki <urezki@gmail.com>,
	linux-fsdevel@vger.kernel.org, Jiri Olsa <olsajiri@gmail.com>,
	Will Deacon <will@kernel.org>, Mike Galbraith <efault@gmx.de>,
	Mark Rutland <mark.rutland@arm.com>, wangkefeng.wang@huawei.com,
	catalin.marinas@arm.com, ardb@kernel.org,
	Linux regression tracking <regressions@leemhuis.info>,
	regressions@lists.linux.dev, Matthew Wilcox <willy@infradead.org>,
	Liu Shixin <liushixin2@huawei.com>, Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>, stable@vger.kernel.org
Subject: Re: [PATCH] fs/proc/kcore: reinstate bounce buffer for KCORE_TEXT
 regions
Message-ID: <dc30a97b-853e-4d2a-b171-e68fb3ab026c@lucifer.local>
References: <20230731215021.70911-1-lstoakes@gmail.com>
 <0af1bc20-8ba2-c6b6-64e6-c1f58d521504@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0af1bc20-8ba2-c6b6-64e6-c1f58d521504@redhat.com>

On Tue, Aug 01, 2023 at 11:05:40AM +0200, David Hildenbrand wrote:
> On 31.07.23 23:50, Lorenzo Stoakes wrote:
> > Some architectures do not populate the entire range categorised by
> > KCORE_TEXT, so we must ensure that the kernel address we read from is
> > valid.
> >
> > Unfortunately there is no solution currently available to do so with a
> > purely iterator solution so reinstate the bounce buffer in this instance so
> > we can use copy_from_kernel_nofault() in order to avoid page faults when
> > regions are unmapped.
> >
> > This change partly reverts commit 2e1c0170771e ("fs/proc/kcore: avoid
> > bounce buffer for ktext data"), reinstating the bounce buffer, but adapts
> > the code to continue to use an iterator.
> >
> > Fixes: 2e1c0170771e ("fs/proc/kcore: avoid bounce buffer for ktext data")
> > Reported-by: Jiri Olsa <olsajiri@gmail.com>
> > Closes: https://lore.kernel.org/all/ZHc2fm+9daF6cgCE@krava
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
> > ---
> >   fs/proc/kcore.c | 26 +++++++++++++++++++++++++-
> >   1 file changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
> > index 9cb32e1a78a0..3bc689038232 100644
> > --- a/fs/proc/kcore.c
> > +++ b/fs/proc/kcore.c
> > @@ -309,6 +309,8 @@ static void append_kcore_note(char *notes, size_t *i, const char *name,
> >   static ssize_t read_kcore_iter(struct kiocb *iocb, struct iov_iter *iter)
> >   {
> > +	struct file *file = iocb->ki_filp;
> > +	char *buf = file->private_data;
> >   	loff_t *fpos = &iocb->ki_pos;
> >   	size_t phdrs_offset, notes_offset, data_offset;
> >   	size_t page_offline_frozen = 1;
> > @@ -554,11 +556,22 @@ static ssize_t read_kcore_iter(struct kiocb *iocb, struct iov_iter *iter)
> >   			fallthrough;
> >   		case KCORE_VMEMMAP:
> >   		case KCORE_TEXT:
> > +			/*
> > +			 * Sadly we must use a bounce buffer here to be able to
> > +			 * make use of copy_from_kernel_nofault(), as these
> > +			 * memory regions might not always be mapped on all
> > +			 * architectures.
> > +			 */
> > +			if (copy_from_kernel_nofault(buf, (void *)start, tsz)) {
> > +				if (iov_iter_zero(tsz, iter) != tsz) {
> > +					ret = -EFAULT;
> > +					goto out;
> > +				}
> >   			/*
> >   			 * We use _copy_to_iter() to bypass usermode hardening
> >   			 * which would otherwise prevent this operation.
> >   			 */
>
> Having a comment at this indentation level looks for the else case looks
> kind of weird.

Yeah, but having it indented again would be weird and seem like it doesn't
apply to the block below, there's really no good spot for it and
checkpatch.pl doesn't mind so I think this is ok :)

>
> (does that comment still apply?)

Hm good point, actually, now we're using the bounce buffer we don't need to
avoid usermode hardening any more.

However since we've established a bounce buffer ourselves its still
appropriate to use _copy_to_iter() as we know the source region is good to
copy from.

To make life easy I'll just respin with an updated comment :)

>
>
> --
> Cheers,
>
> David / dhildenb
>
