Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7AA4437C
	for <regressions@lists.linux.dev>; Fri, 23 May 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748006371; cv=none; b=eZZ2ALSBvv4tk3qkQ4jCcu5j/7ixJO8+6e7pknOvaGCet5G81ZqP2z7rix4IT53a8JTxfZelkEVZ51lsxSHKyasp/FMqW4/FQMuHmhsGtVZCFhuozIrR+W0KseFigLH2YBJKggLJtQGJQY4Fo/vKQNNrCV54Pa+T2IRWgmzC0D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748006371; c=relaxed/simple;
	bh=weVIVWSmAEm0vAps5JJpC+7tazPUvlBdD62+QheOM+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ogX0Z+jCvH16Q3uEpsWGc6f1+J1v6r0Pjod8rNc6TyRmatXp5s/F+CFlrC9PDOAA/vJZeLLcbCKAraQpEXouLPw6XrcJloFfLpHS0WBWm+NBpHW8cPXggo4X1YfgQPhBqKcu4/qsa7lpnERmXkmL7GdOEV25Gug3LBsP+l7kMLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zUd/zbwC; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zUd/zbwC"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c58974ed57so965416785a.2
        for <regressions@lists.linux.dev>; Fri, 23 May 2025 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748006369; x=1748611169; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wxyrfP33qC8ALCV6TibxZ8ffP3Xham0td5+3H8syoiE=;
        b=zUd/zbwCSq99RykgvYPX3Le4MZpoCCqga2J16JDAopdvMLDOuw/mU0z3QJ4RwVkjn/
         hX331mHF/A/pJIhMTvyJ5maKxr2jIAwHkPdWwTGAEHC2vd/HclDp5Wdcvsb3i09D2vc4
         JaoTxSWc9+JOs6ej8QtuDODtGTFAOip0HVQAsG3aiIeB8BEfZ2wMbvR5Dyof6rAa6hDI
         GknGgWt+pYCjUYFtOtxzfI12bKN+5jOVtn1z8ZWMKmUv56d0BelFrTEMQm3vkJEMU3ug
         o+mOmMbDrp3068bVVX4cPDRBXTrg4O2Z/XR2YZtyw9vFVMBNHO3FuOu8A/AHCgwZakAX
         FJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748006369; x=1748611169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxyrfP33qC8ALCV6TibxZ8ffP3Xham0td5+3H8syoiE=;
        b=c4gviIu93gPHffjiu7a3idPWUZNysU3IJgWl/5Avc2LQWfBc2LkpMLAStXWqJpjFHL
         dfXiheg2N5ehRJx99PWWD5T7IJdDGY8Wr+M3j8ZwmbmNbXV8+FxV+idpkviNNPz51aWv
         iLFBxpqacx+Z+ZYDgbI+Hxi6zdfAwFoJppnmNc19E06Z0m1Bup2av+tIMFCO1Sqjtpzl
         kM6sP/JjxaGnoFOl+wp9qHViTQcYn5MroPJdOIPoZCatxjYHxonQc3ZCJHewKRSeg4jb
         UaBUtA/XV+ZYyM+BqqZi089gkwLuVyDU8FREv8Qw/kw4xpZc54jy6+E15+CkGnYTYIEI
         5+pw==
X-Forwarded-Encrypted: i=1; AJvYcCWNAMdL3hG5d6WuR6EDIugxm7uTwrzJCjvrusq0eLnScyqW9Q/LejytdZGUcR+meVGJyajf4ap34u8bng==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWDWT1iRpQ34ZEuX1cu4L+PC3l3lxoAih+gLfezPR3RJFkeVzw
	NlrGlOwkF1RdBMBz3MuDo6SS52gl4N6Dm9eb94ozMpMx1d1S4zkSGDeYL9ZGV5Tlc8V3+uLSRXf
	2qw4ndZhc8cLtTq4TQDMgCHaFtFXXi2+Hixb6ODjiqQ==
X-Gm-Gg: ASbGncuYZ+DximMQA9q/U6uAys8IyVVm62MnjG3ZyXXF36QaDghR9D1CD0JN7P7XEcP
	bYdIIv/wFYKb98iaCXBQsOr7YkjO0NpqiciTxIZfFShT3KPJmyoBwozriZMGlQ6KOz+n+uJ+uZD
	ws8Ee765phRxcKkj7IytfBxIeN+2YrLEvrHXRbCYGcZ7wh9MZqsWmuP1nGuW4yoqolJXHe14rdt
	w==
X-Google-Smtp-Source: AGHT+IHyjvNAAtHNM58ZIM56gNpC2I5XziXsRadQQZ+dhZZ3rU8qNnJxcPg4bPBm0zEL2RJNey22Zg6GikdUy4Olj2Y=
X-Received: by 2002:a05:620a:400c:b0:7c0:c332:1cdb with SMTP id
 af79cd13be357-7cd4677d30dmr4029786585a.38.1748006368879; Fri, 23 May 2025
 06:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv08Rbg4f8ZyoZC9qseKdRygy8y86qFvts5D=BoJg888g@mail.gmail.com>
 <6tgxbull5sqlxbpiw3jafxtio2a3kc53yh27td4g2otb6kae5t@lr6wjawp6vfa>
In-Reply-To: <6tgxbull5sqlxbpiw3jafxtio2a3kc53yh27td4g2otb6kae5t@lr6wjawp6vfa>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 23 May 2025 18:49:17 +0530
X-Gm-Features: AX0GCFv47L9zNz_HqH7izio-QcYYMfFmCuTMugR2i0Gz9XAi2gWfyAbx-zg4GTQ
Message-ID: <CA+G9fYsjBXvm9NNKRbVo_7heX1537K8yOjH7OaSEQhGRmkLvgA@mail.gmail.com>
Subject: Re: riscv gcc-13 allyesconfig error the frame size of 2064 bytes is
 larger than 2048 bytes [-Werror=frame-larger-than=]
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcache@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 May 2025 at 22:18, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> On Thu, May 22, 2025 at 06:59:53PM +0530, Naresh Kamboju wrote:
> > Regressions on riscv allyesconfig build failed with gcc-13 on the Linux next
> > tag next-20250516 and next-20250522.
> >
> > First seen on the next-20250516
> >  Good: next-20250515
> >  Bad:  next-20250516
> >
> > Regressions found on riscv:
> >  - build/gcc-13-allyesconfig
> >
> > Regression Analysis:
> >  - New regression? Yes
> >  - Reproducible? Yes
> >
> > Build regression: riscv gcc-13 allyesconfig error the frame size of
> > 2064 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>
> Is this a kmsan build? kmsan seems to inflate stack usage by quite a
> lot.

This is allyesconfig build which has KASAN builds.

CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y
CONFIG_KASAN_KUNIT_TEST=y
CONFIG_KASAN_EXTRA_INFO=y

- Naresh
