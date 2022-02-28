Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7971515BF
	for <regressions@lists.linux.dev>; Mon, 28 Feb 2022 20:46:11 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id em10-20020a17090b014a00b001bc3071f921so213855pjb.5
        for <regressions@lists.linux.dev>; Mon, 28 Feb 2022 12:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L8JEIwHbnjfnbrHGB8HmORKlRcamD72tkThVNtNE5+Q=;
        b=lcLDVxs4gvDGJ3MA+LlTyrgLXFoKqIzED2gFMdbiZxTKoxgSQMlaANWuHLUF0GV1xF
         0sTgCIgahg/w9yHHKLxjqThKXd52M3zhIzrALVLlH0WZuNYjY7hjpi1WshuF8gN64VWI
         lMtTCqa0TH7m/bdC4rLf9cZP9NnA44nIFyWXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L8JEIwHbnjfnbrHGB8HmORKlRcamD72tkThVNtNE5+Q=;
        b=aP/1jYxiUcXYXKAffN0r7JQPa6kryowmiiDOPDkonntixs2m57xUagZVrH6yyt7YgW
         1oz0QSmKXdU+f1ckQMV0KfxOoZzBS3DP1Fp0PeQQDVhf1LOw2kr5eutviF/XTsDRtoyZ
         Y2cWJ8oTXbc94Geb6ssKURPUljzLByVXNYTP49IyuW///e0immQfCAuNGO8SRfgWEp1L
         PfTn7SL95K9OfZkNsfkv2bFpicksjRIU8aIhliRaBB2ZpgyqIsKdIJh1cgsHHUgXBVR6
         2RllA1sHYprDcw6M2t8I3CT/CZPMvkRjsDInpAXd0ac2ar4B6ZalIN/AA+21FWBBJPZd
         woTw==
X-Gm-Message-State: AOAM532NEuwJffIGD+6iI9tEcng2bSRu1NGfr4PdARLktEL/myF4dklA
	s9kvQVyhR6LPvyegEY4K7r67SA==
X-Google-Smtp-Source: ABdhPJxwzHoZn8pFzNDQnpmFvA1UslmJRrpff/i6ocs8O6PtPqf/AReIoLelwIe0jA7xJtLLu9tJww==
X-Received: by 2002:a17:902:9041:b0:14f:1c23:1eb1 with SMTP id w1-20020a170902904100b0014f1c231eb1mr21788975plz.173.1646081170908;
        Mon, 28 Feb 2022 12:46:10 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id me10-20020a17090b17ca00b001b9e6f62045sm208940pjb.41.2022.02.28.12.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 12:46:10 -0800 (PST)
Date: Mon, 28 Feb 2022 12:46:09 -0800
From: Kees Cook <keescook@chromium.org>
To: matoro <matoro_mailinglist_kernel@matoro.tk>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
	Eric Biederman <ebiederm@xmission.com>,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	stable@vger.kernel.org,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	regressions@lists.linux.dev, linux-ia64@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] binfmt_elf: Avoid total_mapping_size for ET_EXEC
Message-ID: <202202281245.DF46393@keescook>
References: <20220228194613.1149432-1-keescook@chromium.org>
 <5d44f028b2d739395c92e4b3036e2bbf@matoro.tk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d44f028b2d739395c92e4b3036e2bbf@matoro.tk>

On Mon, Feb 28, 2022 at 03:31:00PM -0500, matoro wrote:
> On 2022-02-28 14:46, Kees Cook wrote:
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
> > matoro (or anyone else) can you please test this?
> > ---
> >  fs/binfmt_elf.c | 25 ++++++++++++++++++-------
> >  1 file changed, 18 insertions(+), 7 deletions(-)
> > 
> > diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> > index 9bea703ed1c2..474b44032c65 100644
> > --- a/fs/binfmt_elf.c
> > +++ b/fs/binfmt_elf.c
> > @@ -1136,14 +1136,25 @@ static int load_elf_binary(struct linux_binprm
> > *bprm)
> >  			 * is then page aligned.
> >  			 */
> >  			load_bias = ELF_PAGESTART(load_bias - vaddr);
> > -		}
> > 
> > -		/*
> > -		 * Calculate the entire size of the ELF mapping (total_size).
> > -		 * (Note that first_pt_load is set to false later once the
> > -		 * initial mapping is performed.)
> > -		 */
> > -		if (first_pt_load) {
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
> This does not apply for me, I'm looking around and can't find any reference
> to the first_pt_load variable you're removing there?  What commit/tag are
> you applying this on top of?

Ah, yeah, this is against linux-next. Let me send a backport, one sec...

-- 
Kees Cook
