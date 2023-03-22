Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62372F37
	for <regressions@lists.linux.dev>; Wed, 22 Mar 2023 19:26:13 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id r11so77368780edd.5
        for <regressions@lists.linux.dev>; Wed, 22 Mar 2023 12:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679513172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TC6eNLv6iVcM+dLqVd9h+kHjsMmIK0cHmLbQH5XvCQ4=;
        b=YWt+tkLlfdne2Kd0Awx/G4k2qdpzdqxUYDyTBl1Ztnt2ciLuzV00hGhXgAwtJraOta
         foR02SN4g6mrdL4klrVO+c7tFOawmQREXUGb39aqVJgplHebbVKbDKt4rfoJICjBvCMu
         wBK2gDh8hkB0IAhJCytrzvJckPBgh5K8Bt8+sUhwVZuFARuNc2HPfnpZAWb/gZhAHBHq
         kdsvBwn5zagJhUTI8/WriLqEs0UsqOBQ2L8AwQN8ZEYSgKvcT+c7MRTTgCRjZ+bdh0qB
         sZ+7dpMJR+G+PGeubi3mV2QNhg22WsB2UIRYmJqmyL2COl0dZwD8v2RsGie0Xjj8WSpI
         WVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679513172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TC6eNLv6iVcM+dLqVd9h+kHjsMmIK0cHmLbQH5XvCQ4=;
        b=nWiaOVq64R1dFKQMZgx6XcUNOjd09MSL7AqbbhNQHiTBHMyoxziUmPrNs6wDpZ4FJH
         Hha0ANmJ8YaXxcW+VIv0NKlR9+ItArTJ5VK4vYRKaY5E7E4/nyyfgJAqEwImyph/jba1
         0dm/T5+SmgLQY0eOixntnvSScVb4Kd/0CH9uBNRgxUBwCAMGyzmzoIq4Kbo2x0TGx+0o
         k+D+Xs2Cw1Pq6G5eOZg5R5Gfk2WcRl1FB1YT6lPgwJJBNctJbWkw+CszB4Bjnrrugv1U
         ncXe9SMTB+k9ORtDGuIkS6bKPARlW7On6sb3DVGQm8hvFvFMXKFXs8tlgL0Kc+qyUVgU
         R3Uw==
X-Gm-Message-State: AO0yUKWp1qSxyv5+uc4KKCRSkL3ufH1znTT/5BMMCmFFC41jO+yUowZj
	pJ75jJcM0ynN9WhIOql/ZFryOA==
X-Google-Smtp-Source: AK7set/uwReF6l3N0b+QrVmoQo5JsU4Z8X/6Kjo6ne/T8bhKCGGJPKxX52G9T9KTbzd4uWztJ0Q8Ww==
X-Received: by 2002:a17:906:c257:b0:932:6452:2396 with SMTP id bl23-20020a170906c25700b0093264522396mr7250972ejb.74.1679513171843;
        Wed, 22 Mar 2023 12:26:11 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id k19-20020a1709063fd300b00928de86245fsm7587557ejj.135.2023.03.22.12.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 12:26:11 -0700 (PDT)
Date: Wed, 22 Mar 2023 20:26:10 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	regressions@leemhuis.info, regressions@lists.linux.dev
Subject: Re: [PATCH] riscv: require alternatives framework when selecting FPU
 support
Message-ID: <20230322192610.sad42xau33ye5ayn@orel>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel>
 <1884bd96-2783-4556-bc57-8b733758baff@spud>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1884bd96-2783-4556-bc57-8b733758baff@spud>

On Wed, Mar 22, 2023 at 03:17:13PM +0000, Conor Dooley wrote:
> On Wed, Mar 22, 2023 at 01:46:31PM +0100, Andrew Jones wrote:
> > On Wed, Mar 22, 2023 at 01:09:07PM +0100, Jason A. Donenfeld wrote:
> > > When moving switch_to's has_fpu() over to using riscv_has_extension_
> > > likely() rather than static branchs, the FPU code gained a dependency on
> > > the alternatives framework. If CONFIG_RISCV_ALTERNATIVE isn't selected
> > > when CONFIG_FPU is, then has_fpu() returns false, and switch_to does not
> > > work as intended. So select CONFIG_RISCV_ALTERNATIVE when CONFIG_FPU is
> > > selected.
> > > 
> > > Fixes: 702e64550b12 ("riscv: fpu: switch has_fpu() to riscv_has_extension_likely()")
> > > Link: https://lore.kernel.org/all/ZBruFRwt3rUVngPu@zx2c4.com/
> > > Cc: Jisheng Zhang <jszhang@kernel.org>
> > > Cc: Andrew Jones <ajones@ventanamicro.com>
> > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > Cc: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks for fixing it!
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > > ---
> > >  arch/riscv/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index c5e42cc37604..0f59350c699d 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -467,6 +467,7 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
> > >  config FPU
> > >  	bool "FPU support"
> > >  	default y
> > > +	select RISCV_ALTERNATIVE
> > >  	help
> > >  	  Say N here if you want to disable all floating-point related procedure
> > >  	  in the kernel.
> > > -- 
> > > 2.40.0
> > >
> > 
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > 
> > I took a look to see if we missed anything else and see that we should
> > do the same patch for KVM. I'll send one.
> > 
> > (It's tempting to just select RISCV_ALTERNATIVE from RISCV, but maybe we
> >  can defer that wedding a bit longer.)
> 
> At that point, the config option should just go away entirely, no?

Ah, yes, and that makes the idea even more attractive, as we could remove
several ifdefs.

Thanks,
drew
