Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046D32BCF6C
	for <regressions@lists.linux.dev>; Thu,  4 Sep 2025 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756971516; cv=none; b=d7w7ojKxdin2pdAQS9qDBFUIUvxF8l7MaFOgrYcpxcHKztfPdmvZS9boJSp9VPhhl8z0Td1aBHcNbWMo7Bha14yeEphdqWlrBR7AYQiIHM1191CP3V7iFcX7Bm+0vlxsTdaqHYgMfwHmdgyLG/87jMbQy5qIxzcfRXbAatd/lIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756971516; c=relaxed/simple;
	bh=FbWK51zuCaG8lucEmAI2mMSW2LMRM66FMsNCbZr0bsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jG1NH0c2xCipx8fJEyZbukvFhNs5SfWqZaFEiS7OMivKxuhPZ8sWoG6eB7hi5piV+ZrlSCAlrw0s1FL4LwnwuvRCClRGRfRpfKf7d/p2rgNG2ufqAYNU5fa8+9gmZwO9RparifLL33u18LzRqj9eDicuPAfkRYma0TYlPofWv8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=s86tH8ui; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="s86tH8ui"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-71d60528734so6565997b3.2
        for <regressions@lists.linux.dev>; Thu, 04 Sep 2025 00:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756971513; x=1757576313; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgZhEVyr6juMKHl8gJtC0+SUexeCcUE2zJAQWjvjjYs=;
        b=s86tH8uiU75i5QwtmhoPUeQNccjBgZZmcZtm/CCa/gR4TfDf1KMIQZDGJpIvOeg81N
         SUJdwniU7EiqWFW8UKwUAq9CogkBDzyh1b5gn9/YnnyhfPV1LTubjkkgnekfvklRjBwz
         W4QFHamBCCR/smjTaTG0KtjX5dOAoOCWej6UVSRxo3cEwE45mFF9Q4voYcDshWlvkDh2
         B2gPB5ahBwME5qsQl+380u5gcCqQxjjlbcjuBzzAm/zMy0xUMXui+Iq6gwaJfJkpWdLA
         z7ijpoRpii+D1QANNFwLAX8yfuEzlXbaXozgakt35XH+OZMjEdUFaNI3o0mjjGKckB3u
         0PqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756971513; x=1757576313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgZhEVyr6juMKHl8gJtC0+SUexeCcUE2zJAQWjvjjYs=;
        b=d/BkaaBxOWCxLnkJxLZnp+2tMufjTDUbNTA2a6MLamurItG43w0HRGaGqCFYIDAktR
         yBAYrrZA80mUmmFBClt8HTkdwNq0CKNibPdfKLQz+rlrKr6NFl2owBkqAtuLnoevVupk
         7Jbqn2PUXiyWK6/gC/smIMjD1/2j3zfs/kl4e5i5bj3vVXx1J7DFGSwAofRZx2ChRbxC
         82EgCY211TIfgybk9Z4so4jXtQQi8CwkNskBTm8FH1G4GqINgnJ0AyByX7TERa4IiGm/
         lr0V58akB3EktemqohoaZ0a46i/nUwUUsJJmZBOvbp7165o8SJC2qMKErObYZCfqu/QV
         Z6hg==
X-Forwarded-Encrypted: i=1; AJvYcCVTeKhj36XQ/V7C3KvhNkV+P+9QzMitTX3vV+IvIMG0jHrfng8L/u4vOT4gCPqJLip7hhXbOTua7x8JqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrQb6JWPDDvKYg7fYGawp75vq35PROOP6m9mWRCWSm2+BCM+B0
	gHQfMTFeLZ5E4mqHx/NRJkPtXtHaI0J1ftI1VRf/yIt//wIIDoXXK86i1UVnVuOX22Xs6ok7egT
	vC+ZNktyAylh3O2QVJqkEt3qxv685BKh2T0plftcA1w==
X-Gm-Gg: ASbGncutXiSYp4raD25IMKYPPGMQy3GsiXpPoIwdddBTL5CiJId+QK6o8XlISnVsG9s
	TyQNTrMZfElk1CeusGEgf3Ck5WRJ0KmdPCyAht+HrfZ2CylqCkWS91rWyo2p0VORo1ufKia25ty
	yIPGS8IVumNK2Oe4khL3pNU7blJ8hDst3fzJNSgRHcRAKR+rNFaoHR8DxgkU3AUagxP0iLiy5B9
	61vKIxk9xg=
X-Google-Smtp-Source: AGHT+IHAqMzaONaSYMHfHIGLX6FXI5tM+wIyElctL+Mo7Yefx4I8BbosB/7EjveV6AmnpmC/MA9KKw31I0NQom67AQc=
X-Received: by 2002:a05:690c:312:b0:723:8ccd:6898 with SMTP id
 00721157ae682-7238ccd7709mr174479327b3.10.1756971512980; Thu, 04 Sep 2025
 00:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com>
 <a07b0ebf-25e7-48ba-a1da-2c04fc0e027f@app.fastmail.com> <20250903165931.GA3288670@ax162>
In-Reply-To: <20250903165931.GA3288670@ax162>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 4 Sep 2025 15:38:21 +0800
X-Gm-Features: Ac12FXwiXF9IvfBYbe4zzNOtF-jes20CBabfcX8-C-vzxRaxmAjm9PLipHmDVBM
Message-ID: <CAH1PCMYWWkThMosDMW=wZZWZ8d_c4_zQWhJOJPKe354LPiV1bA@mail.gmail.com>
Subject: Re: next-20250903 x86_64 clang-20 allyesconfig mmp_pdma.c:1188:14:
 error: shift count >= width of type [-Werror,-Wshift-count-overflow]
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	dmaengine@vger.kernel.org, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Vinod Koul <vkoul@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Benjamin Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 12:59=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Sep 03, 2025 at 02:04:10PM +0200, Arnd Bergmann wrote:
> > On Wed, Sep 3, 2025, at 12:08, Naresh Kamboju wrote:
> >
> > > Build error:
> > > drivers/dma/mmp_pdma.c:1188:14: error: shift count >=3D width of type
> > > [-Werror,-Wshift-count-overflow]
> > >  1188 |         .dma_mask =3D DMA_BIT_MASK(64),   /* force 64-bit DMA
> > > addr capability */
> > >       |                     ^~~~~~~~~~~~~~~~
> > > include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT=
_MASK'
> > >    73 | #define DMA_BIT_MASK(n) (((n) =3D=3D 64) ? ~0ULL : ((1ULL<<(n=
))-1))
> > >       |                                                      ^ ~~~
> >
> > I see two separate issues:
> >
> > 1. The current DMA_BIT_MASK() definition seems unfortunate, as the
> > '(n) =3D=3D 64' check is meant to avoid this problem, but I think this
> > only works inside of a function, not in a static structure definition.
>
> Right, this is one of our longest outstanding issues :/
>
> https://github.com/ClangBuiltLinux/linux/issues/92
> https://github.com/llvm/llvm-project/issues/38137
>
> This only happens at global scope.
>
> > This could perhaps be avoided by replacing the ?: operator with
> > __builtin_choose_expr(), but that likely causes other build failures.
>
> Yeah, that makes the problem worse somehow even though GCC says the
> non-taken option should not be evaluated...
>
>   drivers/dma/mmp_pdma.c:1188:14: error: shift count >=3D width of type [=
-Werror,-Wshift-count-overflow]
>    1188 |         .dma_mask =3D DMA_BIT_MASK(64),   /* force 64-bit DMA a=
ddr capability */
>         |                     ^~~~~~~~~~~~~~~~
>   include/linux/dma-mapping.h:73:70: note: expanded from macro 'DMA_BIT_M=
ASK'
>      73 | #define DMA_BIT_MASK(n) __builtin_choose_expr((n) =3D=3D 64, ~0=
ULL, (1ULL<<(n))-1)
>         |                                                                =
      ^ ~~~
>   drivers/dma/mmp_pdma.c:1323:27: error: shift count >=3D width of type [=
-Werror,-Wshift-count-overflow]
>    1323 |                 dma_set_mask(pdev->dev, DMA_BIT_MASK(64));
>         |                                         ^~~~~~~~~~~~~~~~
>   include/linux/dma-mapping.h:73:70: note: expanded from macro 'DMA_BIT_M=
ASK'
>      73 | #define DMA_BIT_MASK(n) __builtin_choose_expr((n) =3D=3D 64, ~0=
ULL, (1ULL<<(n))-1)
>         |                                                                =
      ^ ~~~
>

Thanks Nathan for the information here and above.

> > Guodong, how about a patch to drop all the custom dma_mask handling
> > and instead just use dma_set_mask_and_coherent(DMA_BIT_MASK(64))
> > or dma_set_mask_and_coherent(DMA_BIT_MASK(32)) here? Instead of
> > passing the mask in the mmp_pdma_ops, you can replace it e.g. with
> > a 'bool addr64' flag, or an 'int dma_width' number that
> > gets passed into the DMA_MASK_MASK().
>

Thanks, Arnd. I'll send a patch to clean up and simplify the logic.

> If this works, I think it is worth pursuing to avoid this bogus
> warning/error.
>
> Cheers,
> Nathan
