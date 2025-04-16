Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB501537DA
	for <regressions@lists.linux.dev>; Wed, 16 Apr 2025 02:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744770337; cv=none; b=exNAaSm+bTeti5Eb4X/AdIvCbEwqRDFbB9dbDS83cqdVQafmuYvQC846dQVsmeXfoz418FfZtbYb4PP8M2nX/x87jycNO6FbW2azXJzeOn19is54z6/HLh+TlPfNXyJb7cUaPJbKForrKkYk9gKftMEf3Cq6T+V8I9WX3khuTQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744770337; c=relaxed/simple;
	bh=Fq60TVjg8hdz7OzAED/AfXd7INuQmua9Mckrs6NN3VM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7mOe8fRBfbRwmD0jNbIexz2cjORqVJqM1fc6EagbCxLGEIbbsezCxX4GSM0Lv0/+1bfh5voDqLl+wWe3bU8WGb2wrG+gN5pbqSVa0u4g4kcjC9bSbBBHzSiSQ6kHSw/Ck1zlqStDQKj47JQ1pVeovbxcjTj+I+3euWBxadLc5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U8K3xmt1; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U8K3xmt1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2242ac37caeso58795ad.1
        for <regressions@lists.linux.dev>; Tue, 15 Apr 2025 19:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744770335; x=1745375135; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6R1dE+WfBiT5qGwENgdRrornJr/YiHxdg8wrTb8+t8=;
        b=U8K3xmt1y2sYqXyzuNPhPm5f1B/9EOc7KiBB1YAYoOPcArvp272beJXX3NAGUAt+af
         RhfAEUdmTUQRobygtuTOegjSsu+uSTHJC092mbrPSgFxTWxZzB6qYEZOYZOaJG7AeOO8
         O+WKaAbdXZg48xVu8NAH7MYXuqn6JV1AHv6BMAOWkuvaT9vAaaQeUbOkoBoBhRQO1i1Q
         xHGvJJhL89WL+KoI4wR+ABmYWHm08aBoelwBSZ/8IhRsbhtlqXVFJiRhxNn9GaEFbOnW
         3dL75TaHVYEoWtVLcvDuDEuKK/1v93eaxjM5exq5Xi7CTWENO3pmiLmGp25tzWRu5DTH
         YSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744770335; x=1745375135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6R1dE+WfBiT5qGwENgdRrornJr/YiHxdg8wrTb8+t8=;
        b=E6wZoUAAANaR2wOZL9HfyJLpjQOWmteloah8Kt4z0jlNymTA7sDXK3vkHRGdBnt8lq
         3I+5QF1DMRVt1D2SQPlTtRncxwf+mUeR8U6Nh+aV3Y258BBnkqb0k+d4eml0Zk+ZqCU3
         7LxMFMR7mnABwP3sxJFAuAw//DUOt68Ys49yTFqtFbZh01jXuX9vOqxPSAy/w3pfu2AR
         Hxt36unF1PzO7/5sLq4J6m/iVctQkGlFxvtqrYSM5mr0lirpNaiY/FQGoyZPGpfixdix
         qn0w0jX6GGrj0L1WAH8RlH2HBFXT13bGHf6OLKditVRwD6TIi7anJ+Vc6BCS7VzyNxxP
         K8xA==
X-Forwarded-Encrypted: i=1; AJvYcCWgqsU1mNOT7rLzsUFnvIEbqx5f6LNOECOaoz911Bz11/WeMOxwrHje7nSqFqh3ajswRPHpVbQcYeBQQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAXv/vvYgtrf4J713Qo6Ze+BZVifuWjiKyvDiewEmTYURqGzwT
	6olbRn4UokLkr+jTEBRjLeHqp8zsPEA8U6VRX6UojqmrE6+cwNP6ZZaQzDUhg51gK6fuO8WC2HZ
	ESZsJ1L/wP8XrKyVunWiLULzHOSPzdjb2gzqp
X-Gm-Gg: ASbGnctq75e6ll2IJc+yFTb17Uvkythi4i6vVL/KTY8Xrv5krJLlW8Box+H5qzmNRdr
	LxaukWTqmKkh6SiTXk7WGlwcOxsKw1zbd89s9pBBHo2CVb030Bv7Ki3hA1tV1NkskKOJ304Yw91
	SsiRHu/begaUBCGr8K6drSmKhIRj4VX2/FUzETw8Ma7f9LVFYsI3aG2SU=
X-Google-Smtp-Source: AGHT+IG9RiKIlFiaf5R//EGgfl+L5t1otqcCAe6fn0MT3S3JpXCs/7FHbJfIZvFN/RP5dz9VHtsw0EA1mQA/tyEw6vE=
X-Received: by 2002:a17:903:1aa6:b0:21f:631c:7fc9 with SMTP id
 d9443c01a7336-22c353bac4cmr171545ad.0.1744770334611; Tue, 15 Apr 2025
 19:25:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415-stable_fixup-v1-1-0bea1b5f583c@ciq.com>
In-Reply-To: <20250415-stable_fixup-v1-1-0bea1b5f583c@ciq.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 15 Apr 2025 19:25:22 -0700
X-Gm-Features: ATxdqUFoeX6dUsNwNufCHKFr6Tl2La5AmtfAgoT41BdEM1trNaeFr3d_M47Tirc
Message-ID: <CAGtprH-iO-Bk3bsqMCkdRp4xOQWzHsOVY7DDNyxh3u6AmhMBFg@mail.gmail.com>
Subject: Re: [PATCH REGRESSION-FIX] x86/paravirt: Move halt paravirt calls
 under CONFIG_PARAVIRT
To: bmastbergen@ciq.com
Cc: stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tony Luck <tony.luck@intel.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev, regressions@lists.linux.dev, 
	Ingo Molnar <mingo@kernel.org>, Ryan Afranji <afranji@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Brian Gerst <brgerst@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, stable@kernel.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> ...
> 6.12.23 fails to build with the following error if CONFIG_XEN_PV is
> not set:
>
> arch/x86/coco/tdx/tdx.c: In function =E2=80=98tdx_early_init=E2=80=99:
> arch/x86/coco/tdx/tdx.c:1080:19: error: =E2=80=98struct pv_irq_ops=E2=80=
=99 has no member
> named =E2=80=98safe_halt=E2=80=99
>  1080 |         pv_ops.irq.safe_halt =3D tdx_safe_halt;
>       |                   ^
> arch/x86/coco/tdx/tdx.c:1081:19: error: =E2=80=98struct pv_irq_ops=E2=80=
=99 has no member
> named =E2=80=98halt=E2=80=99
>  1081 |         pv_ops.irq.halt =3D tdx_halt;
>       |                   ^
>
> This is because XEN_PV selects PARAVIRT_XXL, and 'safe_halt' and
> 'halt' are only defined for pv_irq_ops if PARAVIRT_XXL is defined.
>
> The build breakage was introduced in 6.12.23 by stable commit
> 805e3ce5e0e3 which is a backport of 9f98a4f4e721 ("x86/tdx: Fix
> arch_safe_halt() execution for TDX VMs").
>
> Consider picking up upstream commit 22cc5ca5de52 ("x86/paravirt:
> Move halt paravirt calls under CONFIG_PARAVIRT") for stable 6.12.y
> which fixes the build regression by moving 'safe_halt' and 'halt'
> out from under the PARAVIRT_XXL config.
>
> This patch is 22cc5ca5de52 backported to 6.12.23.  There were a
> couple of merge conflicts due to the missing upstream commits below:
>

Thanks Brett for looking into this. I have posted a similar patch [1]
and I see that the issue you reported is also being discussed already
[2].

[1] https://lore.kernel.org/stable/20250408132341.4175633-1-vannapurve@goog=
le.com/
[2] https://lore.kernel.org/stable/20250410180423.GA3430900@ax162/
