Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508822566
	for <regressions@lists.linux.dev>; Wed, 22 Mar 2023 12:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC6DC433EF;
	Wed, 22 Mar 2023 12:01:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="cGXuHR3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1679486489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=31iz5njnxwIdR1+jjyeAyXciOwOhvxGbyonntQxMoEM=;
	b=cGXuHR3kuAudxj0LB1/F3WViZ6fW2Iq6KZCkF0vl0bd57zsF5NPpYfkxwx40HRLPSZn4oU
	sqfL0wsNoiu45GxMgUj5hEIIEj1R1kp193+SqUVJTLqAREnaBjGv2dKO+oOx14GozOEQz0
	5QkwjzhUJvBDeZXAZAmUePeIoAyuofM=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 99a7018e (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 22 Mar 2023 12:01:28 +0000 (UTC)
Date: Wed, 22 Mar 2023 13:01:25 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	regressions@leemhuis.info, regressions@lists.linux.dev
Subject: Re: [PATCH v5 06/13] riscv: fpu: switch has_fpu() to
 riscv_has_extension_likely()
Message-ID: <ZBruFRwt3rUVngPu@zx2c4.com>
References: <20230128172856.3814-1-jszhang@kernel.org>
 <20230128172856.3814-7-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230128172856.3814-7-jszhang@kernel.org>

Hi,

On Sun, Jan 29, 2023 at 01:28:49AM +0800, Jisheng Zhang wrote:
> Switch has_fpu() from static branch to the new helper
> riscv_has_extension_likely().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/switch_to.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 11463489fec6..60f8ca01d36e 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -59,7 +59,8 @@ static inline void __switch_to_aux(struct task_struct *prev,
>  
>  static __always_inline bool has_fpu(void)
>  {
> -	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_FPU]);
> +	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
> +		riscv_has_extension_likely(RISCV_ISA_EXT_d);

This causes programs to crash on kernels that are compiled with
CONFIG_RISCV_ALTERNATIVE=n. Since CONFIG_RISCV_ALTERNATIVE isn't
selectable, this is a problem.

You can try this out for yourself using the WireGuard test suite:

    ARCH=riscv64 make -C tools/testing/selftests/wireguard/qemu -j$(nproc)

And you'll see the crash:

[    2.172093] init.sh[45]: unhandled signal 4 code 0x1 at 0x00ffffff945a2170 in libc.so[ffffff94562000+8c000]
[    2.174306] CPU: 0 PID: 45 Comm: init.sh Not tainted 6.3.0-rc3+ #1
[    2.174981] Hardware name: riscv-virtio,qemu (DT)
[    2.175639] epc : 00ffffff945a2170 ra : 00aaaaaae7332820 sp : 00fffffffd3e6c00
[    2.176287]  gp : 00aaaaaae73aff40 tp : 00ffffff945f1a50 t0 : 0000000000000000
[    2.176858]  t1 : 00aaaaaae7331f9c t2 : 0000000000000002 s0 : 00fffffffd3e6de0
[    2.177427]  s1 : 0000000000000002 a0 : 00aaaaaae73b7380 a1 : 00fffffffd3e6dc8
[    2.177990]  a2 : 00fffffffd3e6de0 a3 : 0000000000000000 a4 : 0000000000000000
[    2.178524]  a5 : 0000000000000002 a6 : 000000000000008b a7 : 0000000000000010
[    2.179081]  s2 : 00aaaaaae73327f0 s3 : 00ffffff945ef990 s4 : 00ffffff945f1988
[    2.179796]  s5 : 00ffffff945f1b48 s6 : 0000000000000000 s7 : 00000000000000e0
[    2.180366]  s8 : 00ffffff945f1d58 s9 : 00ffffff945ecb88 s10: 00ffffff945f17e0
[    2.185464]  s11: 0000000000000001 t3 : 00ffffff945a213c t4 : 0000000300000000
[    2.186106]  t5 : 0000000000000003 t6 : ffffffffffffffff
[    2.186520] status: 0000000200000020 badaddr: 000000000000b920 cause: 0000000000000002

I bisected it to this commit:

    702e64550b12 ("riscv: fpu: switch has_fpu() to riscv_has_extension_likely()")

Thanks,
Jason
