Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7E1135412
	for <regressions@lists.linux.dev>; Wed,  3 Apr 2024 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712138983; cv=none; b=PPar5WB7PGNBpsj/7uak//raNa19oObRWTpHmuuuFAbIyOBVUc/SE9RyOss+ASuacgtCqwxAVeCNkbOwUKdn5iD60dyOkQqgobD9qnG+O0Yr27bKy8co9zMACHLE52tBJwFrPnKin/eGxJ0QqZf4+r6PnPh+7sEeHRB2H/ONuHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712138983; c=relaxed/simple;
	bh=jiF1b1qN7q/VFRrdeA+VOPcB74H2DGR+qR1HismVjBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ufD754LFrJzdVQ4ndHKfcv8Z4d4TWO1NZfHLJNYD2s3kk/XTk9vwU9+H9eS1OejCFl903owlXxNh1zEy3TMkPEVV50g5EUAFA2FZZ6KYqdx4wZGZ48vjY8z322t8qHPgFTuir9ghpvhbsPoBYKmW4l6arfLu1BSgHkkJ5eLdVuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=NUA501lS; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="NUA501lS"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d48d75ab70so91587441fa.0
        for <regressions@lists.linux.dev>; Wed, 03 Apr 2024 03:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1712138980; x=1712743780; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjTsloGmOucOZQ+j+s/fLrYr5N8eIOKIN1JpE5014io=;
        b=NUA501lS9WfqVfHvoWILOR65X/JrwkFWGtginVfpkBaDKC3Egq/1W9BRbahNl//8ao
         0Wks5g9GFo4fbGy0E/TH862cC+8hBTwenhm6VQ3fG5cliWsfv/SRHCvOgNxms0IVwO9o
         F2QUj2iP/ipJSIskkc3Mx5VVt0w6gQd3bnS/s6LtbTnIAugFt+p+Onk74kT4PF72yhgs
         Wu0MlYnmyJ+UKy4Kdi8lunM+qz1iorQzjETkBMv3gVK0ykH7xLCiMpoGRmfHgshINMFJ
         rxDFymRrvaQ84p3dTQmjyfBI8uGbdzbOUdVTouPvm8fTS7Ixoo3BQEKwN3SXAPTALkjY
         jUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712138980; x=1712743780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjTsloGmOucOZQ+j+s/fLrYr5N8eIOKIN1JpE5014io=;
        b=Jd1phgH0I0oRX3bwQp2WeUVEC1/kaVRaJKxwD6nWxMc4z6BRgv9wbWR5h97kxsQbaQ
         TiVaXpvoyzz3vzrtYDggeDK2749titEJyahASrEp1xMG7l/XBY3EPPQuhclOVEoegkFB
         YM4f0yK/zslvYpO8xYIMbxBXd25NkvwQnFmrLRf5mwfWvvQM4SfKR6D/kh/RiIzkiX60
         Nw9VQ6AaJEJv2lms6pV4UPiXuOQ6BD87ra5UTxbbLn6WcZSBALVG5XCs/VbToQLrdMId
         NS1g8nUVqTxOA5Ilj5HLUs0LA4b0FD1BcN11FCVc0XY0s2b+txXn4Y39Gn4fDDp2mK6J
         k56g==
X-Forwarded-Encrypted: i=1; AJvYcCW+JL5cBniCXCA2q/gReoj4z0Q1D86g/jY0WPJBWiyaj4ncIiAiVmkKwGRLH/8giqRRiEtk98rBo7++hjL7dhA63NoiAtcFpEhhhks=
X-Gm-Message-State: AOJu0YxC8YqJHBaTehQt8aRJsuUyifvNLRBhQJl+s08DhEyuJtqmLy1t
	c8lxHiKK6eEb9kaWMaKRa+fL27MCSHILxyjrxlID1/Ysjtn5ZwEWDZJdD03kkfbVvzpSz8aqTOG
	h/6tXBBZFSThPz2SOac1iwf0OP+eT17ZjDT49tQ==
X-Google-Smtp-Source: AGHT+IFlFB6olZ0gqOdR0d4FAkKc9Kfb3hY6rkX+XGzj+YRmkfBGCFt0EXe/x6AEeQHbfyoUVBX8ieXGq6w425MS31U=
X-Received: by 2002:a2e:b1c2:0:b0:2d6:c4ec:782 with SMTP id
 e2-20020a2eb1c2000000b002d6c4ec0782mr1420936lja.49.1712138979880; Wed, 03 Apr
 2024 03:09:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtsoP51f-oP_Sp5MOq-Ffv8La2RztNpwvE6+R1VtFiLrw@mail.gmail.com>
 <CAPyNcWeu+bzyQg9S3wDb43jbfk95Su5XcSRFPzUbS2ofZ=+5Fg@mail.gmail.com>
 <347bb21e-98db-4bd5-9ca1-550eac5be9f8@app.fastmail.com> <277decf7-d9cb-451c-a105-6ecc998f9f46@intel.com>
 <CAPyNcWeXpidnVsXgt4XpwXiA0CRFdZYFN9O2ys5oq9FQKXNxsw@mail.gmail.com>
In-Reply-To: <CAPyNcWeXpidnVsXgt4XpwXiA0CRFdZYFN9O2ys5oq9FQKXNxsw@mail.gmail.com>
From: Anton Protopopov <aspsk@isovalent.com>
Date: Wed, 3 Apr 2024 12:09:29 +0200
Message-ID: <CAPyNcWdPJYOtDbun-qUJApm9ndsVkEj-sHDfbMWK2yCT6FOwdA@mail.gmail.com>
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

On Wed, Apr 3, 2024 at 11:57=E2=80=AFAM Anton Protopopov <aspsk@isovalent.c=
om> wrote:
>
> On Wed, Apr 3, 2024 at 11:39=E2=80=AFAM Alexander Lobakin
> <aleksander.lobakin@intel.com> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> > Date: Wed, 03 Apr 2024 10:45:36 +0200
> >
> > > On Wed, Apr 3, 2024, at 10:10, Anton Protopopov wrote:
> > >> On Wed, Apr 3, 2024 at 10:03=E2=80=AFAM Naresh Kamboju
> > >> <naresh.kamboju@linaro.org> wrote:
> > >>>
> > >>> The arm footbridge_defconfig failed with gcc-13 and gcc-8 on Linux =
next
> > >>> starting from next-20240328..next-20240402.
> > >>>
> > >>> arm:
> > >>>   build:
> > >>>     * gcc-8-footbridge_defconfig - Failed
> > >>>     * gcc-13-footbridge_defconfig - Failed
> > >>>
> > >>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >>>
> > >>> In file included from include/linux/bitfield.h:10,
> > >>>                  from arch/arm/include/asm/ptrace.h:13,
> > >>>                  from arch/arm/include/asm/processor.h:14,
> > >>>                  from include/linux/prefetch.h:15,
> > >>>                  from arch/arm/include/asm/atomic.h:12,
> > >>>                  from include/linux/atomic.h:7,
> > >>>                  from net/core/filter.c:20:
> > >>> include/linux/build_bug.h:78:41: error: static assertion failed:
> > >>> "struct bpf_fib_lookup size check"
> > >>>    78 | #define __static_assert(expr, msg, ...) _Static_assert(expr=
, msg)
> > >>>       |                                         ^~~~~~~~~~~~~~
> > >>
> > >> Thanks, I will take a look today
> >
> > Naresh,
> >
> > Could you please remove that static_assert() and dump bpf_bif_lookup
> > layout from pahole?
> >
> > Anton unionized { smac, dmac } with __u32 mark. On x86_64, the offset o=
f
> > smac was 52 (aligned to 4) already, so I don't really get what AEABI
> > does here. IIRC it aligns every structure to 8 bytes?
> >
> > Maybe we could just add __attribute__((__packed__))
> > __attribute__((__aligned__(4))) to that anonymous union at the end.
>
> Yeah, I am sending a patch for this right now. Better not to depend on
> compiler options

One __packed__ was not enough though. The problem was also with the
union of two __u16's which is padded to be 32 bits when AEABI=3Dn and
the whole structure is packed (so total size is 66 in this case).
