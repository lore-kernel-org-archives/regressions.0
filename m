Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32047C
	for <regressions@lists.linux.dev>; Mon, 28 Feb 2022 22:53:26 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id o8so12820194pgf.9
        for <regressions@lists.linux.dev>; Mon, 28 Feb 2022 14:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zibmIXYjhxaupOk9s0xWr7duCuTjugvyvgKLHyYpgFE=;
        b=iCpxXt6G0aThtvRUcLNU8SriL190rIC2M+2t85Gz/EPinufDECNpaCnslsRSQAk3ep
         MPSStIzbBpIxl3lRd+df6HbZ3lim+gftRnXLHB8sidpRHKV2QhZoSgXk99khZDcvuzcT
         Spee0qr8TUPt+3I4rqnlZ4mG/KhdXvQrBaZQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zibmIXYjhxaupOk9s0xWr7duCuTjugvyvgKLHyYpgFE=;
        b=mGPswmXRYFzZ8QkuPlHrZUmEQPlq7esz5wdiiqqJdp0JOdsCgpINz/0GsqFvBfHIVY
         58zAtbOCcVzqaXRgiaWyaf/n9h0F1+BQaSWXrl6SG0XCVKZK124pDxlFVF45+rSgHUE5
         +02p+f8RmtoFVcKdcAvMUfbLrEDRgCTjJQl3/lXQV7TeNapwi85v8FtBP9Y7Un8zUVjx
         o4Z9OKX+6Id9GZQJCrWFrYkYGy+qUWzHBkfpfanZs3S7qPEpe0K4KJplw+paOerVp9X2
         3MnlNZYgriK3peLTTdPqNAK03YC0KYBE6HIvbJuPECIBHPjJ+Hzsq8A7pF+sjfg2v17Z
         9WCg==
X-Gm-Message-State: AOAM532WkuEDBKaBDrycFxPbJgKOtOdgZXnpz/+N+KU+O+vPIpM/HvA4
	NVNk6EJO5qaEUklFRAd2q/wW1Q==
X-Google-Smtp-Source: ABdhPJzHZGv/HnLcdSxWcXgVP/q5WimYbT2Car4mVv68atOJnIPOjOQrAQTFGQxx45g0YLdkIV/MsA==
X-Received: by 2002:a65:6210:0:b0:374:ba5:aacc with SMTP id d16-20020a656210000000b003740ba5aaccmr18921903pgv.8.1646088806198;
        Mon, 28 Feb 2022 14:53:26 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f9-20020a056a00228900b004f3ba7d177csm14943547pfe.54.2022.02.28.14.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 14:53:25 -0800 (PST)
Date: Mon, 28 Feb 2022 14:53:25 -0800
From: Kees Cook <keescook@chromium.org>
To: matoro <matoro_mailinglist_kernel@matoro.tk>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Eric Biederman <ebiederm@xmission.com>,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	stable@vger.kernel.org,
	Magnus =?iso-8859-1?Q?Gro=DF?= <magnus.gross@rwth-aachen.de>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	regressions@lists.linux.dev, linux-ia64@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5.16 v2] binfmt_elf: Avoid total_mapping_size for ET_EXEC
Message-ID: <202202281452.93E321A39@keescook>
References: <20220228205518.1265798-1-keescook@chromium.org>
 <ce8af9c13bcea9230c7689f3c1e0e2cd@matoro.tk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce8af9c13bcea9230c7689f3c1e0e2cd@matoro.tk>

On Mon, Feb 28, 2022 at 05:14:26PM -0500, matoro wrote:
> On 2022-02-28 15:55, Kees Cook wrote:
> > Partially revert commit 5f501d555653 ("binfmt_elf: reintroduce using
> > MAP_FIXED_NOREPLACE").
> > 
> > At least ia64 has ET_EXEC PT_LOAD segments that are not virtual-address
> > contiguous (but _are_ file-offset contiguous). This would result in
> > giant mapping attempts to cover the entire span, including the virtual
> > address range hole. Disable total_mapping_size for ET_EXEC, which
> > reduces the MAP_FIXED_NOREPLACE coverage to only the first PT_LOAD:
> > 
> > $ readelf -lW /usr/bin/gcc
> > ...
> > Program Headers:
> >   Type Offset   VirtAddr           PhysAddr           FileSiz  MemSiz
> > ...
> > ...
> >   LOAD 0x000000 0x4000000000000000 0x4000000000000000 0x00b5a0 0x00b5a0
> > ...
> >   LOAD 0x00b5a0 0x600000000000b5a0 0x600000000000b5a0 0x0005ac 0x000710
> > ...
> > ...
> >        ^^^^^^^^ ^^^^^^^^^^^^^^^^^^                    ^^^^^^^^ ^^^^^^^^
> > 
> > File offset range     : 0x000000-0x00bb4c
> > 			0x00bb4c bytes
> > 
> > Virtual address range : 0x4000000000000000-0x600000000000bcb0
> > 			0x200000000000bcb0 bytes
> > 
> > Ironically, this is the reverse of the problem that originally caused
> > problems with ET_EXEC and MAP_FIXED_NOREPLACE: overlaps. This problem is
> > with holes. Future work could restore full coverage if load_elf_binary()
> > were to perform mappings in a separate phase from the loading (where
> > it could resolve both overlaps and holes).
> > 
> > Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> > Cc: Eric Biederman <ebiederm@xmission.com>
> > Cc: linux-fsdevel@vger.kernel.org
> > Cc: linux-mm@kvack.org
> > Reported-by: matoro <matoro_mailinglist_kernel@matoro.tk>
> > Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> > Fixes: 5f501d555653 ("binfmt_elf: reintroduce using
> > MAP_FIXED_NOREPLACE")
> > Link:
> > https://lore.kernel.org/r/a3edd529-c42d-3b09-135c-7e98a15b150f@leemhuis.info
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> > Here's the v5.16 backport.
> > ---
> >  fs/binfmt_elf.c | 25 ++++++++++++++++++-------
> >  1 file changed, 18 insertions(+), 7 deletions(-)
> > 
> > diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> > index f8c7f26f1fbb..911a9e7044f4 100644
> > --- a/fs/binfmt_elf.c
> > +++ b/fs/binfmt_elf.c
> > @@ -1135,14 +1135,25 @@ static int load_elf_binary(struct linux_binprm
> > *bprm)
> >  			 * is then page aligned.
> >  			 */
> >  			load_bias = ELF_PAGESTART(load_bias - vaddr);
> > -		}
> > 
> > -		/*
> > -		 * Calculate the entire size of the ELF mapping (total_size).
> > -		 * (Note that load_addr_set is set to true later once the
> > -		 * initial mapping is performed.)
> > -		 */
> > -		if (!load_addr_set) {
> > +			/*
> > +			 * Calculate the entire size of the ELF mapping
> > +			 * (total_size), used for the initial mapping,
> > +			 * due to first_pt_load which is set to false later
> > +			 * once the initial mapping is performed.
> > +			 *
> > +			 * Note that this is only sensible when the LOAD
> > +			 * segments are contiguous (or overlapping). If
> > +			 * used for LOADs that are far apart, this would
> > +			 * cause the holes between LOADs to be mapped,
> > +			 * running the risk of having the mapping fail,
> > +			 * as it would be larger than the ELF file itself.
> > +			 *
> > +			 * As a result, only ET_DYN does this, since
> > +			 * some ET_EXEC (e.g. ia64) may have virtual
> > +			 * memory holes between LOADs.
> > +			 *
> > +			 */
> >  			total_size = total_mapping_size(elf_phdata,
> >  							elf_ex->e_phnum);
> >  			if (!total_size) {
> 
> This does the trick!  Thank you so much!!

Excellent; thank you for testing! I'll send this to Linus shortly.

-- 
Kees Cook
