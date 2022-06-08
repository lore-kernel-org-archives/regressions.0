Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C407B
	for <regressions@lists.linux.dev>; Wed,  8 Jun 2022 02:39:58 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id v11-20020a17090a4ecb00b001e2c5b837ccso22545875pjl.3
        for <regressions@lists.linux.dev>; Tue, 07 Jun 2022 19:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6bOa4esw0xksLVfNdAT6B93rV/P/8VSGEKMP6EjzR0E=;
        b=K6KpXwM81tTGGNFDdq17Lj1eMk1q3eODHH8nocGcaU9nWe7rFntrd/gnI4dJmrX5ot
         jelT47mS9pdJT0S2PzSCrNgL5Sh63CeXCG+aYcN+ywbxrVtSsSCUllZRXU38BSZmlUri
         DAKxKJgyjtIwfLg5ysES88sOtfU39kmTixM4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6bOa4esw0xksLVfNdAT6B93rV/P/8VSGEKMP6EjzR0E=;
        b=e/WUO9T5DXUS6mfQays1ELBL4i5Mvcqk1Eaa1rwBKRa1jQ1GTL3Ubn+y17A5DwUkHP
         4OFPbvTRskXRuQ4rRIlVPKatTGI0Vr60Yqu71YBZEpj6lwW5Je4W2f53RAPe6ouq28xd
         x4Uvq1vGgueBACApQnRVAa21Q2yhAB0EaTJ6tZlcdGAKKoeRqyquGBIDeZxpKqYEg63x
         ARa6GqeVsJrZ2bqbKvAu63rwR68i55KJ/xvg18LBlkgPIiDNQQx9XlhUMqb0pRoKlsld
         eYlwZiN8urQ+rAej7o8fmWE4QeJrzLNyMvgVBj0yl2Ul3OOXVVvcQzNr++fg1Dho97t3
         ckWw==
X-Gm-Message-State: AOAM532Tr4FJaaDo4sA0PSLNBaBCi/1kN+M173aJlBikytRvizxgepy8
	mHsBAilshi1TkwB+NwJTYcLR+sliRaJ9VQ==
X-Google-Smtp-Source: ABdhPJyJZwIgrQupdT+vh6Z2lrRhM1s6jhssKdeRPoFc/TqToiSIDBj6GM5p6VPlbfki0O4rCxkesQ==
X-Received: by 2002:a17:90b:3a8f:b0:1e8:7669:8a2f with SMTP id om15-20020a17090b3a8f00b001e876698a2fmr16728205pjb.55.1654655998366;
        Tue, 07 Jun 2022 19:39:58 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:463d:a192:6128:66e])
        by smtp.gmail.com with ESMTPSA id 84-20020a621857000000b0050dc7628158sm13612168pfy.50.2022.06.07.19.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 19:39:57 -0700 (PDT)
Date: Wed, 8 Jun 2022 11:39:52 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Minchan Kim <minchan@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-fsdevel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	regressions@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Nitin Gupta <ngupta@vflare.org>
Subject: Re: qemu-arm: zram: mkfs.ext4 : Unable to handle kernel NULL pointer
 dereference at virtual address 00000140
Message-ID: <YqAL+HeZDk5Wug28@google.com>
References: <CA+G9fYtVOfWWpx96fa3zzKzBPKiNu1w3FOD4j++G8MOG3Vs0EA@mail.gmail.com>
 <Yp47DODPCz0kNgE8@google.com>
 <CA+G9fYsjn0zySHU4YYNJWAgkABuJuKtHty7ELHmN-+30VYgCDA@mail.gmail.com>
 <Yp/kpPA7GdbArXDo@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yp/kpPA7GdbArXDo@google.com>

On (22/06/07 16:52), Minchan Kim wrote:
> > rootfs: https://oebuilds.tuxbuild.com/29zhlbEc3EWq2wod9Uy964Bp27q/images/am57xx-evm/rpb-console-image-lkft-am57xx-evm-20220601222434.rootfs.ext4.gz
> > kernel: https://builds.tuxbuild.com/29zhqJJizU2Y7Ka7ArhryUOrNDC/zImage
> > 
> > Boot command,
> >  /usr/bin/qemu-system-aarch64 -cpu host,aarch64=off -machine
> > virt-2.10,accel=kvm -nographic -net
> > nic,model=virtio,maaacaddr=BA:DD:AD:CC:09:04 -net tap -m 2048 -monitor
> > none -kernel kernel/zImage --append "console=ttyAMA0 root=/dev/vda rw"
> > -hda rootfs/rpb-console-image-lkft-am57xx-evm-20220601222434.rootfs.ext4
> > -m 4096 -smp 2
> > 
> > # cd /opt/kselftests/default-in-kernel/zram
> > # ./zram.sh
> > 
> > Allow me sometime I will try to bisect this problem.
> 
> Thanks for sharing the info. 
> 
> I managed to work your rootfs with my local arm build
> based on the problematic git tip. 
> However, I couldn't suceed to reproduce it.
> 
> I needed to build zsmalloc/zram built-in instead of modules
> Is it related? Hmm,
> 
> Yeah, It would be very helpful if you could help to bisect it.

This looks like a NULL lock->name dereference in lockdep. I suspect
that somehow local_lock doesn't get .dep_map initialized. Maybe running
the kernel with CONFIG_DEBUG_LOCK_ALLOC would help us? Naresh, can you
help us with this?
