Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D8324B28;
	Thu, 20 Aug 2026 00:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787184546; cv=none; b=rDS29nb4Qa1a8PFuV0pP8cGjLEhu5nCDZcQWH5AjbvVMgACOpv9kHAmmXgRNIKVBj95D1w3ViYdAxvlSAGCw72721qok0p665ut8vQAA6XmgBIx4m1+KFFGLVccO7W8h4wKZLpVGjzQYjlFzafyhJjVHXG4r7gh6mbs3IYY8dcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787184546; c=relaxed/simple;
	bh=AxlW7ZHGTGbaoqTZX5to6NIQ3crAfXfyWIRqTCJ3sHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aeG8L4eldewXa2MH38exgPFHag2HjnnJZRWuZb7SqvRQnKQk618LyEAzTu+9C2KexwbQQXXEE5V94d8CZR8zoV/MeCk0/SdB+RU41aaG646NRDupsF+2X0NTqwCy/5EH7G4iNNAgitztnMzxx4rsr/T5T3M9SDJzEBakIg/RBfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oe/YQafv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oe/YQafv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20FBC1F000E9;
	Thu, 20 Aug 2026 00:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787184545;
	bh=4d+5LPSFhG+mb7VuQCiam79z5ZAsu+LA1K+9EnO0mVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Oe/YQafvWRvxMocR16U+/PkSw3RsergYmEIvuCrerBVgHYIFSS2of0UXX2Tm3avet
	 u2PPB/G1jydea7IFh7lOobBSFTljlRzsse9VlL2yuhwPdZHwPJ+PaylKsjX2BLv4Wn
	 XmpNzIeEWNwYXWWq5yin6/rJym5f8+RPkWWEt11qNQqCspzJJNmNkhkPPMc5i51aj9
	 /FXfXlucBpZNuoablzHXs5JeMpVyxFjciAi8wevbID/Sow9XpNt9hGg1k7t91GMwOt
	 mNELF1JzdozSV00h2J1j7NK21C3BCgN6c27eMenwcRH9X8f3YZhfETgXVS5axMOK30
	 8ZU0IjSAhk0rw==
Date: Wed, 19 Aug 2026 17:09:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	regressions@lists.linux.dev, laura.nao@collabora.com,
	shreeya.patel@collabora.com, Mark Brown <broonie@kernel.org>,
	kernelci-results@groups.io, kernelci@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [REGRESSION] mainline/master: (build) in
 arch/arm/kernel/entry-common.o (/tmp/kci/linux/scripts/Makefile...
Message-ID: <20260820000900.GA3034882@ax162>
References: <178701474442.5156.12765087253678603047@kernelci.org>
 <c9ba4aeb-a288-4597-b13a-9da55666f96a@leemhuis.info>
 <CAKwvOdkcCnhM-395QVriu3hnjmtX1H-3i_1tU5Jpb1Ybr2Q77g@mail.gmail.com>
 <20260818165116.GA1335107@ax162>
 <20260818175209.GA1675024@ax162>
 <e5c6c56c-b0e2-4950-996a-4f9321a1a57a@app.fastmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5c6c56c-b0e2-4950-996a-4f9321a1a57a@app.fastmail.com>

On Wed, Aug 19, 2026 at 11:08:39AM +0300, Ard Biesheuvel wrote:
> We're falling back to the mov_l asm macro in this case.
> 
> This is unfortunate, because the only reason to avoid these group
> relocations is making allyesconfig work, now that LLD has caught up.
> 
> I did not manage to reproduce this, but if this is something we care
> deeply about, we might tweak mov_l as below when COMPILE_TEST is set,
> so that the literal pool is always in range.

I am not sure that we do, at least currently, since Arnd's patch to turn
off OABI compat for everything but StrongARM has now landed in mainline,
getting rid of the originally reported error. If this error comes back,
we could look at a better fix.

> --- a/arch/arm/include/asm/assembler.h
> +++ b/arch/arm/include/asm/assembler.h
> @@ -636,6 +636,12 @@
>         .macro          mov_l, dst:req, imm:req, cond
>         .if             __LINUX_ARM_ARCH__ < 7
>         ldr\cond        \dst, =\imm
> +#ifdef CONFIG_COMPILE_TEST
> +       /* The literal may go out of range in pathological cases */
> +       b               .L\@
> +       .ltorg
> +.L\@:
> +#endif
>         .else
>         movw\cond       \dst, #:lower16:\imm
>         movt\cond       \dst, #:upper16:\imm

-- 
Cheers,
Nathan
