Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985FD13AE7
	for <regressions@lists.linux.dev>; Mon, 22 May 2023 16:00:47 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f3a873476bso4985546e87.1
        for <regressions@lists.linux.dev>; Mon, 22 May 2023 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684771245; x=1687363245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xdQP7e6XI8muUkGCL2LzZvt7rBDHBRBcReLGBADbeO8=;
        b=jGM6H/jDYG1TfV4quO5mzoyolkUbR7QMpAIYT2ekDT3FeYIX8cHDzIXw18w15AJes/
         tnFC1egjdXR41zOzdY1to1izuSI2mDSZc/72L6cYiKvOuZIE32kpXW4BqEGSw7CqIIZG
         OhM6ZXV4BZ0nAwT68X8jHzCyMVyLl82aMDoDlssc+bBlHzQ0Umd3PpT9oWCJ5R5z2Hwt
         cLQzCvO7XVVBzg7hDrkYXCmSSMJCMAToF2owjpBbcWzeDSCvejbgq7pqzD9SS7Ov0TyL
         S747uJUiiKagW2sCvV8dwuLQIOjtwk3tWGi31qb7gWnmOsiz56Chi6kcSFj7NRJipWFU
         pqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684771245; x=1687363245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdQP7e6XI8muUkGCL2LzZvt7rBDHBRBcReLGBADbeO8=;
        b=X3m+Fsqe+416sTbQR5Q3FC5byNpniurufqiMuM2lSVFY+txFIQ9lc00WyUiCxqFk8Y
         hCFOzeh7pqFKV7Aju4ukCdUBlZHypLnxGcD/ta2y93uKVxIrc01qsVsUpY8TLkFYzi5g
         ztm5yQtFRyZCrEzZ0qcOY5hg2oStT/zUHapt3qQ6SlARSIk4aKJwSD5woEocQvXCYvfH
         O4tz5K5ZTeX46utCP5CeLcMIkvyUr2sJqNceARcSWtLezcOoLKcZxffh9ZCipTvYYnzv
         Ec0Ubo+Xs1SJlgrXRP0pd4uu/Qit04W3X6JkoD4iUnTWHHjREhpcuKmVOhRpjDELdYba
         O+Jg==
X-Gm-Message-State: AC+VfDwgUCkxB5mBT2R5Kp/wHkV76lgV5KqY0SqwIq6G7kp51O8lqORk
	12sIlc/KXl1CV31E76ckARg=
X-Google-Smtp-Source: ACHHUZ7jZsWvnjAbwJpGb2QaXoef2dmzCHTIKokNvxU4Rgo8RYSD/pek1rzLKAR4HGgziXUQw3NIZA==
X-Received: by 2002:ac2:5f10:0:b0:4f3:aa73:562 with SMTP id 16-20020ac25f10000000b004f3aa730562mr3106198lfq.2.1684771245200;
        Mon, 22 May 2023 09:00:45 -0700 (PDT)
Received: from pc636 (host-90-235-19-70.mobileonline.telia.com. [90.235.19.70])
        by smtp.gmail.com with ESMTPSA id h26-20020a19701a000000b004ece331c830sm1022897lfc.206.2023.05.22.09.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 09:00:44 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 22 May 2023 18:00:42 +0200
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux btrfs <linux-btrfs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Stable <stable@vger.kernel.org>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	a1bert@atlas.cz
Subject: Re: Fwd: vmalloc error: btrfs-delalloc btrfs_work_helper [btrfs] in
 kernel 6.3.x
Message-ID: <ZGuRqtPkmeP07M6x@pc636>
References: <efa04d56-cd7f-6620-bca7-1df89f49bf4b@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efa04d56-cd7f-6620-bca7-1df89f49bf4b@gmail.com>

> Hi,
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
> > after updating from 6.2.x to 6.3.x, vmalloc error messages started to appear in the dmesg
> > 
> > 
> > 
> > # free 
> >                total        used        free      shared  buff/cache   available
> > Mem:        16183724     1473068      205664       33472    14504992    14335700
> > Swap:       16777212      703596    16073616
> > 
> > 
> > (zswap enabled)
> 
> See bugzilla for the full thread and attached dmesg.
> 
> On the report, the reporter can't perform the required bisection,
> unfortunately.
> 
> Anyway, I'm adding it to regzbot:
> 
> #regzbot introduced: v6.2..v6.3 https://bugzilla.kernel.org/show_bug.cgi?id=217466
> #regzbot title: btrfs_work_helper dealloc error in v6.3.x
> 
> Thanks.
> 
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217466
> 
According to dmesg output from the bugzilla, the vmalloc tries to
allocate high order pages: 1 << 9. Since it fails to get a order-9 page
you get the warning:

<snip>
	if (area->nr_pages != nr_small_pages) {
		/* vm_area_alloc_pages() can also fail due to a fatal signal */
		if (!fatal_signal_pending(current))
			warn_alloc(gfp_mask, NULL,
				"vmalloc error: size %lu, page order %u, failed to allocate pages",
				area->nr_pages * PAGE_SIZE, page_order);
		goto fail;
	}
<snip>

and it fails.

If the __GFP_NOFAIL is passed, the vm_area_alloc_pages() function switches
to allocate 0-order pages instead. I think the fix is to call the
kvmalloc_node() with __GFP_NOFAIL flag.

--
Uladzislau Rezki
