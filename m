Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D3828FC
	for <regressions@lists.linux.dev>; Wed, 22 Mar 2023 12:46:34 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id b20so39477350edd.1
        for <regressions@lists.linux.dev>; Wed, 22 Mar 2023 05:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679489193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W5zKbHjfhgxF54RZN2uMVwaO/XV5lTFGogMg3VcS9Gw=;
        b=AeU+V10ihje21KzHVT78gOrQJ9YQxfOvj599aKQERL00BRKdGiTV8EFqv73faU5f45
         Fykh774S7V9G71lAC4TEFQ3HxDIx1EQ0Bqm7flYXZj5iFo/nVULYw3meaxbOoELkiojq
         x6V2dlejM6itF7F200uRTOvDwFd2eADEDVVJQOGEDaaATvRx85pcmbviAKnRrBPTx/uB
         AOeK7cGNMBKW8ICWJsqaSKxaLc9PvuyaYQwOUVTTIsqorPS2qGnQzXmY9wNn92vowMA3
         VTqRv2AOet1xNuUY4essauv5cZLbIYJmk2Tv9HaJt7ImatZVWYQ3DaircOALrij8nlol
         2Vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679489193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5zKbHjfhgxF54RZN2uMVwaO/XV5lTFGogMg3VcS9Gw=;
        b=4u65v2/AauhQXHkePusOah+WE6ztCZJovL2o6lG0FUVcJyApcg/FDQX4ZsDzzdR2KB
         c2n1D7qA3hBas9AoC1R3H42iDFM4bueZDFZmIyyhc5oCqlL+pigN9YvRlDk6gK3bAnrW
         zhQHxHH4Uryjc/PJQyitzMQD0aDgCugyxOKhujVHkUGbIkWDoILzrd+MlWyxOLkk9n64
         s91cKiOlkvb+KNfEERoTUofdWrdiajSpSgdY3eyLr+iWLk1FMSGuRyWNOCjwhY2dTv8e
         hzxNnmxPn7/YxxWELUjQpdIBtq4prb8cmLhuZfMXAw7mDKfDbErSrkEUb13b6FsGf4Bm
         pw1g==
X-Gm-Message-State: AO0yUKX+rCWk+RQIduABmaW8b7uvWXqnFXF4Vz+9DZY0cDFMqxmbljBE
	ExK2aFN50MWD1Vfqafn8TTBUhw==
X-Google-Smtp-Source: AK7set+gJyx2poiD3sfTmwA9axJroFF1RhsQFBXaCqd0DtnPZi3yDlC8QBiTKtp9e6oeJC2EllLOww==
X-Received: by 2002:a05:6402:48c:b0:4fa:ad62:b1a0 with SMTP id k12-20020a056402048c00b004faad62b1a0mr5882545edv.41.1679489193201;
        Wed, 22 Mar 2023 05:46:33 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id c25-20020a50f619000000b004bd6e3ed196sm7761962edn.86.2023.03.22.05.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 05:46:32 -0700 (PDT)
Date: Wed, 22 Mar 2023 13:46:31 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
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
Message-ID: <20230322124631.7p67thzeblrawsqj@orel>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322120907.2968494-1-Jason@zx2c4.com>

On Wed, Mar 22, 2023 at 01:09:07PM +0100, Jason A. Donenfeld wrote:
> When moving switch_to's has_fpu() over to using riscv_has_extension_
> likely() rather than static branchs, the FPU code gained a dependency on
> the alternatives framework. If CONFIG_RISCV_ALTERNATIVE isn't selected
> when CONFIG_FPU is, then has_fpu() returns false, and switch_to does not
> work as intended. So select CONFIG_RISCV_ALTERNATIVE when CONFIG_FPU is
> selected.
> 
> Fixes: 702e64550b12 ("riscv: fpu: switch has_fpu() to riscv_has_extension_likely()")
> Link: https://lore.kernel.org/all/ZBruFRwt3rUVngPu@zx2c4.com/
> Cc: Jisheng Zhang <jszhang@kernel.org>
> Cc: Andrew Jones <ajones@ventanamicro.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index c5e42cc37604..0f59350c699d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -467,6 +467,7 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
>  config FPU
>  	bool "FPU support"
>  	default y
> +	select RISCV_ALTERNATIVE
>  	help
>  	  Say N here if you want to disable all floating-point related procedure
>  	  in the kernel.
> -- 
> 2.40.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

I took a look to see if we missed anything else and see that we should
do the same patch for KVM. I'll send one.

(It's tempting to just select RISCV_ALTERNATIVE from RISCV, but maybe we
 can defer that wedding a bit longer.)

Thanks,
drew
