Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF99F207E00
	for <regressions@lists.linux.dev>; Mon, 16 Dec 2024 18:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734374718; cv=none; b=U5mJRV3L1L6xTPD4AXaWfh8ecDSBoKna6qsfsRfMrSpyn427WP9p+03U0VSvyPf4sCH7e4rwyujBJ2pUnbUx8B+k5CcmnoqeNHhOaob0HGNHkzzAR7njI2CxcDNk0xbhkwW1JkKIA4R6bJcW5gmdAOTVrbAndlDPZpfDjgcHCIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734374718; c=relaxed/simple;
	bh=wPhuadXVqq3NRot78X0jrmq9xXlKWbFpMlJqSo/gcfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bp7vOUvRHy+ibdLRGGgshOeChRHp5TAeFz+Y785rpwd91ixNW0nvi15H0Tyo7Q07iw7shKovl1hCqT17OnY3HY7worNvDQCprlVBqkV6bDRFT+QH51DIHPK/XLFqZGzif5cQphIo4Srva65RicP827YSO6l4CWB/uVodnsVQiHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ahlwQUXO; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ahlwQUXO"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6f2896ecdafso16883817b3.1
        for <regressions@lists.linux.dev>; Mon, 16 Dec 2024 10:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734374714; x=1734979514; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hho81fUxS1svxnIpTTMvF+QFJQ1gclraQmirxeDP/2A=;
        b=ahlwQUXOOdc5jNYVb826MdNGawRznKlh3uQ1emZOpShY31jCeW2+7KFXhGR9ZuDsC5
         uoUnDoAStd0tfO+tBqIPcM2hTkn09qSxDrnWP+aaoNGen23tG5pU051PnmZStXpkD4Sj
         2tN+lvROLiuSMwD6A6hSbXhKyzNW0YadMDN2zqTzJKCLnvkDeJ3PcY/N37HBhZpKnIxv
         c59lzwyR8VpZqJ6eYySfR2/AsFU77Br7rVJiVM2Tu06c5G2Kcj34KTA94lgaKMcWSUPE
         4tLwXn8jKwLcTKW93R15j86IXgKZZv09ALhwYsGoJy8ci5nxSUtkewWaxmvxfkkPiWgd
         IP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734374714; x=1734979514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hho81fUxS1svxnIpTTMvF+QFJQ1gclraQmirxeDP/2A=;
        b=Rd4R2R7kxwzBBXA45J0KikU6R1Hv9LpkIOLNwvhl9m+az/aBNISs5752r06YzirwO2
         bKHd4jxWoXqTATv46J/enulnT4ZNDW+wTD17RAOreIz6dObWHjEY10+SWIoFFm+zwIUh
         2gzqR43lMzPqJJX2AdbMjoJYaqvcXYrTl70o5kbzf3/4/m3i1Kr0NuCfg2LDZ0g/BgR5
         QLdhDY8AIZj34AYY1phQfxuCcoQxYHA6nLdQJ1mrGA/21UPSWmjmKdubZt9/lXc0eqS7
         Ww74P7yUrXh2EFQ8TM8picieoXZ1AT4RsQL3Zwgmrys0ENh5LQXF0RWEI3QbBFutRfOO
         ZHAg==
X-Forwarded-Encrypted: i=1; AJvYcCVoVhobCKzYFoSNYd7fV3/3aH3r7ttkolSimmrgcOMkpX3P18br5ICgt2vEcRHXlCVbG4YC58MpU+Y3rQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yytcyp40VM9IRJRmnkFc0dAuv4tJCxALLbXeTndbJA6EYUHZpuI
	8udDSot0XZhvJM47Oib/pcldgQKWujPlNPq9NsxsLwYduXS53ZkGwFCVYy1wopA2VRd4nka7LBf
	FsWTM7ww44T4YG1vCaVk2UyGTwVtLHv2CEm64Kw==
X-Gm-Gg: ASbGncvo/sEfwvH4exTl8/7331jOvdY8P5WuRPE5flpUoNR/ZM5fGpXn1resIIxsfOz
	Ao2SNqDxbrnEr8iWU2g2PUerh+wy8HmoV/GLlShmvnGqMPDE78WFL8+3AnK0IQedJmfYf2Q==
X-Google-Smtp-Source: AGHT+IEoWJcDKQv5iEmEVMq3EpzCtQ9Q1A7OeekLCcpaKrEW68EjTvVaw4TXtlFnG0gT2cPtGh8+n5e6AdoDQWuvyI4=
X-Received: by 2002:a05:690c:7449:b0:6ef:8dd0:fff9 with SMTP id
 00721157ae682-6f279ad163fmr123605197b3.8.1734374713861; Mon, 16 Dec 2024
 10:45:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtpAwXa5mUQ5O7vDLK2xN4t-kJoxgUe1ZFRT=AGqmLSRA@mail.gmail.com>
 <20241216180231.GA1069997@ax162>
In-Reply-To: <20241216180231.GA1069997@ax162>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 16 Dec 2024 19:45:03 +0100
Message-ID: <CACMJSevssgFn6omKpV0rAMQKXpH__mmmkpdjUSYB7s2U=dsAEw@mail.gmail.com>
Subject: Re: next-20241216: drivers/crypto/qce/sha.c:365:3: error: cannot jump
 from this goto statement to its label
To: Nathan Chancellor <nathan@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>, 
	thara gopinath <thara.gopinath@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Dec 2024 at 19:02, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Naresh,
>
> Thanks for the report.
>
> + Bartosz as author of ce8fd0500b74
>
> On Mon, Dec 16, 2024 at 10:04:05PM +0530, Naresh Kamboju wrote:
> > The arm and arm64 builds failed on Linux next-20241216 due to following
> > build warnings / errors with clang-19 and clang-nightly toolchain.
> > Whereas the gcc-13 builds pass.
> >
> > arm, arm64:
> >   * build/clang-19-defconfig
> >   * build/clang-nightly-defconfig
> >
> > First seen on Linux next-20241216.
> >   Good: next-20241216
> >   Bad:  next-20241213
> >
> > Build log:
> > -----------
> <trimmed irrelevant warning>
> > drivers/crypto/qce/sha.c:365:3: error: cannot jump from this goto
> > statement to its label
> >   365 |                 goto err_free_ahash;
> >       |                 ^
> > drivers/crypto/qce/sha.c:373:6: note: jump bypasses initialization of
> > variable with __attribute__((cleanup))
> >   373 |         u8 *buf __free(kfree) = kzalloc(keylen + QCE_MAX_ALIGN_SIZE,
> >       |             ^
> > 1 error generated.
>
> It is a bug to jump over the initialization of a cleanup variable
> because the cleanup function will be called on an uninitialized pointer
> in those cases. GCC does not catch this at compile time like clang does
> (it would be nice if we could document this somewhere and really
> encourage people doing cleanup annotations to ensure their patches pass
> a clang build except in architecture code where clang does not support
> that target):
>
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91951
>
> It may be worth just reverting commit ce8fd0500b74 ("crypto: qce - use
> __free() for a buffer that's always freed") since it seems like little
> value in this case but if we want to forward fix it, I think we could
> just mirror what the rest of the kernel does and keep the declaration at
> the top of the function and initialize the pointer to NULL. The diff
> below resolves the issue for me, which I don't mind sending as a formal
> patch.
>
> Cheers,
> Nathan

I'm fine with dropping that commit from next.

Bartosz

>
> diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
> index c4ddc3b265ee..e251f0f9a4fd 100644
> --- a/drivers/crypto/qce/sha.c
> +++ b/drivers/crypto/qce/sha.c
> @@ -337,6 +337,7 @@ static int qce_ahash_hmac_setkey(struct crypto_ahash *tfm, const u8 *key,
>         struct scatterlist sg;
>         unsigned int blocksize;
>         struct crypto_ahash *ahash_tfm;
> +       u8 *buf __free(kfree) = NULL;
>         int ret;
>         const char *alg_name;
>
> @@ -370,8 +371,7 @@ static int qce_ahash_hmac_setkey(struct crypto_ahash *tfm, const u8 *key,
>                                    crypto_req_done, &wait);
>         crypto_ahash_clear_flags(ahash_tfm, ~0);
>
> -       u8 *buf __free(kfree) = kzalloc(keylen + QCE_MAX_ALIGN_SIZE,
> -                                       GFP_KERNEL);
> +       buf = kzalloc(keylen + QCE_MAX_ALIGN_SIZE, GFP_KERNEL);
>         if (!buf) {
>                 ret = -ENOMEM;
>                 goto err_free_req;
