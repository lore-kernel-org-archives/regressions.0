Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215B4131BDE
	for <regressions@lists.linux.dev>; Wed,  3 Apr 2024 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712138241; cv=none; b=aYlA2g7zZCH8oEyoae3ydJnR81bvN98njRAHWguB44Td2acTkMGFXENUAE+zF8Ps2J/ztDMWIsqO+FIAes6fW4CN91+5x1uOQD8KpZZg+AeV539O4IYquobLHTkA9Usljb7OL21ThXIP1JH2WQmyjMcUKb06qi2eQ0r8WPSpNUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712138241; c=relaxed/simple;
	bh=hsY8vdvALd9mllqZJPG0q6gvzkR5NuFBfzXk8bK0SSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCNAi5sT6HKjo8lQG3MX+4ljYfbeCRHDIyDnN8A8ZGKu8zJQwJU+VEwT01jysb6r3E0cGSjOXL7fyG+88Gb6Ec1yV0aT/WiF1geWyQObcHK03PP+5HXf8Vnc4G52MPUbDHEia5GC+P7l4S1tg/ApsbrhXIQwl4CEdh3VWAPemdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=KlE7abwy; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="KlE7abwy"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d4515ec3aaso6172941fa.1
        for <regressions@lists.linux.dev>; Wed, 03 Apr 2024 02:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1712138238; x=1712743038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/Iap6Ckpc7gnYDeHu4z6nTWkkkUTqEUIw+VC+egTdI=;
        b=KlE7abwyX92xyeNqFwqkcEQWvPpdRRI9HAPy5roEmXsaCPTD1XNZ6ZVjPuSAd/i3qy
         alINLjhvLgAryzKL35q5Z2SJnfVDEIIPT/IWRKH4Do+cUeqCwb5H0YGPixV0iZ54bpjI
         7LIr7lCwMfzQInmThrCirvRp38PuzGstg4RP7edRsiaalJ9szXyyWS2fNCd44jRoh42C
         eieDLr7vwKu17/T1gnUxIvDSNLWhvoUmRNyzfrhQZlUTe9eaBDCvmIUo83bP3Wz3hERE
         cBMumPBsdFaeFWpCIkOxqwET/CYHb8q4RP+4N21JGg2kVCGrjHP/5nI+vvjfBPuWFAuh
         S7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712138238; x=1712743038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/Iap6Ckpc7gnYDeHu4z6nTWkkkUTqEUIw+VC+egTdI=;
        b=JnKCL+23+HNWu//R3SwytBb4rc/+p0DoWFv9OFFhyAEfHRZfvh0/sH+ZyuhMwKv31+
         FOANB4Do4K89vTRSzQ4J+Lgyu/Tl/AbqE8UR+60SmsIENwL7sr+KRD4BPMXaai1iIo9s
         sYIDS1UEAxRMQTrzKIpXryJo+AGNmGerY6YF7DDLV/nbp45pEx+Kk3ipuhF3TATD4EDB
         vp1Fsq8EzBPlfx685f+vg5FbQiFC+qL/O1cReAeCSS8lgGvSo1chtwEt+RtTLcQacpKq
         n1jCoyQpN9aFFgkMYQNplLzt1nFsU4+1JXi8OATN/g33SM9BKtjncbWFXg9PHOzl3+2d
         Batg==
X-Forwarded-Encrypted: i=1; AJvYcCXnIVSJ6rIcbk73MIFx6lvRi7J+TFg1a8mRULYZ5otXTK+pnOwEgD0DramTWrr8Y0UN5KwsHaYvTElP6KkqbNbaHNBv1909IpRvNeI=
X-Gm-Message-State: AOJu0YywFeXX9CmYXdJhF7NLKigq4PfnOLIaGJEy8ZC77UN/Wybi8mLe
	jb2FiSeB1QUTRqmNkwckZqhxWmkHfXxDspVRKwWKNnW5mADIhZFS3+/avuKHHLw2bG2sIyDrS0x
	1OL3+Te/u4eRUKG2XGrW7LknbMR4yHROs/+17sg==
X-Google-Smtp-Source: AGHT+IGN419LcaWsNIQm0EXU4px3i4LNqOSzT+9stPHxFmHNZq8t1sxU4/AHC2Q7Tdn0p2VU0n1Z13oPGMJ1EP4VEEM=
X-Received: by 2002:a05:651c:1a2b:b0:2d6:e110:700f with SMTP id
 by43-20020a05651c1a2b00b002d6e110700fmr932725ljb.11.1712138238422; Wed, 03
 Apr 2024 02:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtsoP51f-oP_Sp5MOq-Ffv8La2RztNpwvE6+R1VtFiLrw@mail.gmail.com>
 <CAPyNcWeu+bzyQg9S3wDb43jbfk95Su5XcSRFPzUbS2ofZ=+5Fg@mail.gmail.com>
 <347bb21e-98db-4bd5-9ca1-550eac5be9f8@app.fastmail.com> <277decf7-d9cb-451c-a105-6ecc998f9f46@intel.com>
In-Reply-To: <277decf7-d9cb-451c-a105-6ecc998f9f46@intel.com>
From: Anton Protopopov <aspsk@isovalent.com>
Date: Wed, 3 Apr 2024 11:57:07 +0200
Message-ID: <CAPyNcWeXpidnVsXgt4XpwXiA0CRFdZYFN9O2ys5oq9FQKXNxsw@mail.gmail.com>
Subject: Re: include/linux/build_bug.h:78:41: error: static assertion failed:
 "struct bpf_fib_lookup size check"
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	David Ahern <dsahern@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2024 at 11:39=E2=80=AFAM Alexander Lobakin
<aleksander.lobakin@intel.com> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
> Date: Wed, 03 Apr 2024 10:45:36 +0200
>
> > On Wed, Apr 3, 2024, at 10:10, Anton Protopopov wrote:
> >> On Wed, Apr 3, 2024 at 10:03=E2=80=AFAM Naresh Kamboju
> >> <naresh.kamboju@linaro.org> wrote:
> >>>
> >>> The arm footbridge_defconfig failed with gcc-13 and gcc-8 on Linux ne=
xt
> >>> starting from next-20240328..next-20240402.
> >>>
> >>> arm:
> >>>   build:
> >>>     * gcc-8-footbridge_defconfig - Failed
> >>>     * gcc-13-footbridge_defconfig - Failed
> >>>
> >>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >>>
> >>> In file included from include/linux/bitfield.h:10,
> >>>                  from arch/arm/include/asm/ptrace.h:13,
> >>>                  from arch/arm/include/asm/processor.h:14,
> >>>                  from include/linux/prefetch.h:15,
> >>>                  from arch/arm/include/asm/atomic.h:12,
> >>>                  from include/linux/atomic.h:7,
> >>>                  from net/core/filter.c:20:
> >>> include/linux/build_bug.h:78:41: error: static assertion failed:
> >>> "struct bpf_fib_lookup size check"
> >>>    78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, =
msg)
> >>>       |                                         ^~~~~~~~~~~~~~
> >>
> >> Thanks, I will take a look today
>
> Naresh,
>
> Could you please remove that static_assert() and dump bpf_bif_lookup
> layout from pahole?
>
> Anton unionized { smac, dmac } with __u32 mark. On x86_64, the offset of
> smac was 52 (aligned to 4) already, so I don't really get what AEABI
> does here. IIRC it aligns every structure to 8 bytes?
>
> Maybe we could just add __attribute__((__packed__))
> __attribute__((__aligned__(4))) to that anonymous union at the end.

Yeah, I am sending a patch for this right now. Better not to depend on
compiler options
