Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BFD7C
	for <regressions@lists.linux.dev>; Wed,  8 Jun 2022 20:45:33 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso19413755pjg.0
        for <regressions@lists.linux.dev>; Wed, 08 Jun 2022 13:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bTBDtpW2qpcmzetkuUn9+lFzWx5HLxWub8Bm7cJfh2o=;
        b=Ebv8KX8PrhCbhkiUOwrYsdSxtwhEYjuLpaIcWDDUxSEhuOm5U2E/ijtPueb/kBf9on
         UVGe3xTfppkY+qsf3Oc9TnYJjgyaLdovdnHfAF+PSF2bgjoDAg6x78SLsWc5kosawUIm
         ZzVM6u3shW7LjAmkuYlKaJIyw6UX3eUeMYTugbSxHS+oUYBy/UW9b8m5mVg81JUUgPcD
         1RV33HRC0GYVgdFGBeEgmIw3B5rDlmCPMYhChQVskDJcmSqmiN4TxJ41JOj/P5FUWDGb
         lkMV7KEPpp0mCp4/P0mm97GwH7ojt8SUXm9n3engCy4mE4p/vFKnatudqpX5jbO0nOE/
         CySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=bTBDtpW2qpcmzetkuUn9+lFzWx5HLxWub8Bm7cJfh2o=;
        b=SjtMbchgSuoXBQR06AfreEPWLX6mee91fM8h+y6c3L9hvt4/20MK4Q9Gfgs99DMHmN
         Y+0EaKqeLsgbvFKZoz2e1VS88XyyNnjqNANe+65/Mj7G4cGTT0MSnf4u8in7Y494kgcv
         QmbZ7eIk4S+jsdiCLPSNPEI64Oehuqol8gPpStBmNa7XfYaaO0XGFlaWvDjjDc07xReu
         0AxvQxIvkXNVH+/fIlLLPqS1l8Cf3/rkWHOlq8/bLcR5CkaiZqsdzntfaghUkNtROhqX
         oJG9LAH2ZG4x3I8bFyyScKVnvIUA2EuC0oskhBXElmE/yo5qxZX6BHtOYDGePrmfYoUp
         vvng==
X-Gm-Message-State: AOAM533k+trb8mgrGsvHD+olVQHWED7n5OLOuWnWYsiZLRAV+qUuBroK
	0hC9T9qQrOBKnfvn9NO7kZ4=
X-Google-Smtp-Source: ABdhPJxWnOVLKSSb2udV5MEgFj+HgqKRxSGhFY7d0TphKFpZQyhmluBHlgWM/bio1Z4rR05TfrYjvA==
X-Received: by 2002:a17:903:22c9:b0:163:e49d:648c with SMTP id y9-20020a17090322c900b00163e49d648cmr36311082plg.54.1654721132718;
        Wed, 08 Jun 2022 13:45:32 -0700 (PDT)
Received: from google.com ([2620:15c:211:201:f30f:4d03:66e6:b121])
        by smtp.gmail.com with ESMTPSA id cj24-20020a056a00299800b0051bc1865ca5sm13796026pfb.122.2022.06.08.13.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 13:45:32 -0700 (PDT)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date: Wed, 8 Jun 2022 13:45:30 -0700
From: Minchan Kim <minchan@kernel.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-fsdevel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	regressions@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Nitin Gupta <ngupta@vflare.org>
Subject: Re: qemu-arm: zram: mkfs.ext4 : Unable to handle kernel NULL pointer
 dereference at virtual address 00000140
Message-ID: <YqEKapKLBgKEXGBg@google.com>
References: <CA+G9fYtVOfWWpx96fa3zzKzBPKiNu1w3FOD4j++G8MOG3Vs0EA@mail.gmail.com>
 <Yp47DODPCz0kNgE8@google.com>
 <CA+G9fYsjn0zySHU4YYNJWAgkABuJuKtHty7ELHmN-+30VYgCDA@mail.gmail.com>
 <Yp/kpPA7GdbArXDo@google.com>
 <YqAL+HeZDk5Wug28@google.com>
 <YqAMmTiwcyS3Ttla@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqAMmTiwcyS3Ttla@google.com>

On Wed, Jun 08, 2022 at 11:42:33AM +0900, Sergey Senozhatsky wrote:
> On (22/06/08 11:39), Sergey Senozhatsky wrote:
> > On (22/06/07 16:52), Minchan Kim wrote:
> > > > rootfs: https://oebuilds.tuxbuild.com/29zhlbEc3EWq2wod9Uy964Bp27q/images/am57xx-evm/rpb-console-image-lkft-am57xx-evm-20220601222434.rootfs.ext4.gz
> > > > kernel: https://builds.tuxbuild.com/29zhqJJizU2Y7Ka7ArhryUOrNDC/zImage
> > > > 
> > > > Boot command,
> > > >  /usr/bin/qemu-system-aarch64 -cpu host,aarch64=off -machine
> > > > virt-2.10,accel=kvm -nographic -net
> > > > nic,model=virtio,maaacaddr=BA:DD:AD:CC:09:04 -net tap -m 2048 -monitor
> > > > none -kernel kernel/zImage --append "console=ttyAMA0 root=/dev/vda rw"
> > > > -hda rootfs/rpb-console-image-lkft-am57xx-evm-20220601222434.rootfs.ext4
> > > > -m 4096 -smp 2
> > > > 
> > > > # cd /opt/kselftests/default-in-kernel/zram
> > > > # ./zram.sh
> > > > 
> > > > Allow me sometime I will try to bisect this problem.
> > > 
> > > Thanks for sharing the info. 
> > > 
> > > I managed to work your rootfs with my local arm build
> > > based on the problematic git tip. 
> > > However, I couldn't suceed to reproduce it.
> > > 
> > > I needed to build zsmalloc/zram built-in instead of modules
> > > Is it related? Hmm,
> > > 
> > > Yeah, It would be very helpful if you could help to bisect it.
> > 
> > This looks like a NULL lock->name dereference in lockdep. I suspect
> > that somehow local_lock doesn't get .dep_map initialized. Maybe running
> > the kernel with CONFIG_DEBUG_LOCK_ALLOC would help us? Naresh, can you
> > help us with this?
> 
> Hmm, actually, hold on. mapping_area is per-CPU, so what happens if CPU
> get offlined and onlined again? I don't see us re-initializing mapping_area
> local_lock_init(&zs_map_area.lock) and so on.

I am trying to understand the problem. AFAIK, the mapping_area was
static allocation per cpu so in zs_cpu_down, we never free the
mapping_area itself. Then, why do we need to reinitialize the local
lock again?
