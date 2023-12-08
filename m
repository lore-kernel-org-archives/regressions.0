Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6DF1C6B5
	for <regressions@lists.linux.dev>; Fri,  8 Dec 2023 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="HEYEUt2D"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9312540E00C7;
	Fri,  8 Dec 2023 13:22:18 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id KjiTfKNC84O3; Fri,  8 Dec 2023 13:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1702041736; bh=9VW5Pgm57o7BPhMBIqaXDaAJ8T8rEibYNmP1Y+5hnGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEYEUt2D30FNHiWLxtHu5+9n7JDmVOtFZSaW2SpOoTlh/YzRcZ33yNrKtnNjrkd2w
	 m7IdCPS729hKtVjzH4wbMGomdon4FSp5GxltvBeuf/46DfVfH3MovvHo1nI9/JkN5/
	 u/a9sX5lZsynJCxhm/cIOCq0mny2QKs8Dpn/4m7CGwslLA2W2sDcnmzAEmrDcHI9GZ
	 VzZ5vesyQ0LIiuDC00kVUfttuP0r2tqkKjHPU7EmdjkFm+MvFX7unahR0vxA87fXRN
	 0X/TsxUQE7yz2zV/4Nfq2YX+uEswsD2u+Lwf6+5myWpjm1PSBrGy8BWKVlk3SP2K29
	 Px22VlzfkG7jWehvBvtRnJv8lbaiM1aM2rrMvxYoNhNqVDh1+DjoWrVZob5+3sLSm+
	 Um5ugztGTzl8ROVXP+0vckXlzm2jUtwZeTSyoe282E3/Ys652OazCNi04y4JvHrru+
	 XxectzUlv8rOzL3Wz6/KfyE2KSwK07xEpyF7U3OSpf326cV/Ih2oSrkD+3Zox83kNL
	 hd7PF+ty5qQVClgkyaEsJmR+3Mg0BhKTrolr4Bg8BGKphPpUlBBPXHvPTFb0HuXNXI
	 5yptuwBOVYrNfKW5QFhDoojE9FGXISj0s+9e6tWO2nVqv2ouuO+aV4eksWwvJtMZkv
	 c0poCUNT3dK8mcqNSRWy3MPo=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A265140E00C6;
	Fri,  8 Dec 2023 13:22:09 +0000 (UTC)
Date: Fri, 8 Dec 2023 14:22:04 +0100
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, paul.gortmaker@windriver.com,
	x86@kernel.org, regressions@leemhuis.info,
	richard.purdie@linuxfoundation.org, regressions@lists.linux.dev
Subject: Re: [patch 2/2] x86/alternatives: Disable interrupts and sync when
 optimizing NOPs in place
Message-ID: <20231208132204.GBZXMYfLSaIbn3BvN3@fat_crate.local>
References: <ZXCXc+BtnLzqMbFv@windriver.com>
 <ZUEgAAGDVqXz2Seo@windriver.com>
 <0adb772c-e8d2-4444-92b0-00cbfdaf1fac@leemhuis.info>
 <87r0k9ym0y.ffs@tglx>
 <20231207193859.961361261@linutronix.de>
 <20231207194518.401797191@linutronix.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231207194518.401797191@linutronix.de>

On Thu, Dec 07, 2023 at 08:49:26PM +0100, Thomas Gleixner wrote:
> +static void __init_or_module noinline optimize_nops_inplace(u8 *instr, size_t len)
> +{
> +	unsigned long flags;
> +
> +	local_irq_save(flags);
> +	optimize_nops(instr, len);
> +	sync_core();
> +	local_irq_restore(flags);
> +}
> +
>  /*
>   * In this context, "source" is where the instructions are placed in the
>   * section .altinstr_replacement, for example during kernel build by the
> @@ -438,7 +448,7 @@ void __init_or_module noinline apply_alt
>  		 *   patch if feature is *NOT* present.
>  		 */
>  		if (!boot_cpu_has(a->cpuid) == !(a->flags & ALT_FLAG_NOT)) {
> -			optimize_nops(instr, a->instrlen);
> +			optimize_nops_inplace(instr, a->instrlen);
>  			continue;
>  		}

Arguably, the proper thing to do here would be to convert the NOP
optimizing to the same 2-stage process as normal patching: write insns
into a buffer and text_poke* it.

VS what we currently do: operating straight on kernel memory.

Lemme put it on the TODO and see how ugly it becomes.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
