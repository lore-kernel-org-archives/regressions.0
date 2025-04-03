Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA1024E002
	for <regressions@lists.linux.dev>; Thu,  3 Apr 2025 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677279; cv=none; b=jDi4DFYxw/cFXCXsIEZyhdv08qqnu/7qiO3ft5x9+bfQGH8E7FWs+M3NKkS03T77VhKrTZ7AMZ8iULsXC2gCrvvMIB9gVPnP9ElLtuFNa86P1sRGagZ5J48C3vv99SefgbZjOKAVGxmtESjjgsyGchWRm7u0JiL2ok0oeAqsYgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677279; c=relaxed/simple;
	bh=1rSp8GUjQPXhDnQXL+D/PZL/CS3hVuRflE6/UX7tu6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Slf8RmUbU05tFZWAAioegqereiwgfXzNpSFpmM3eu7onzWMj5B6Y2pmsUeEkmWezT34gKOk3f99L6f4Odcp0FBooGdaZZChnPC0JFfB7WZUo+uznz3aB6HG9MYyuWMFcEqL/JqSg0RKHUVBfdx5PizjJusjbuwepyEGbicBnO9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X4zSvslq; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X4zSvslq"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-525b44b7720so380959e0c.0
        for <regressions@lists.linux.dev>; Thu, 03 Apr 2025 03:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743677275; x=1744282075; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAaNZ+6NXDNpsPuLfvCYG+9qWpEj8cIl19GUNWtS3+0=;
        b=X4zSvslqIcP05LRM9jVYL3sLMK9aLV11iJVpsUNekb6icn/+YO0ijzxsAaL83NpjNj
         TgJxNIvoV1yTl7IyZcMj0wCus/51TR3aypGq9DWlvh+ACDPjDMxnpO4wdyWwzGxb+BmV
         fy0Kek7PlCuinakDiFJCStsH8HulTJ1oFiGgI2EiSNGWGY290/ezlkVOdCpdNn3hqeGG
         +ATcpgdFjsh2TKDOc6T3iw/6894lCA16qLVkrwHBC0p/+kFVZsyl7JkPDmkDTYcGaMRE
         aabcVg8nJVOnYcx83A4xFlnvV+YwBufHT6X6hbSsOqow9O0SKnyuojiunyvzQCRW3dWk
         xbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743677275; x=1744282075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAaNZ+6NXDNpsPuLfvCYG+9qWpEj8cIl19GUNWtS3+0=;
        b=hFEe12oS0OVgp1hp/Prty4hAtsTyvtjc3kIzZ4VYW3yZRtEe1JAfGQP8epbAhroeoR
         iwCVZzXp20n5XyZlsfG+Cz+5du2icCyex9kdJVqWQsEeFdsxvDkhU1NSVqArwjX+3IMB
         MOMGN28OGZ/eFgnzVtO8EUr15ygLyoikeFz2P9bBptpBBeSbwU8lIeqTY4XZnWdgnGEQ
         iAQ3PeudpoU5//3PVYg+jP5ZdJjtANo5HVSm5dO9a1aSDf2E+VZEONYPgWzRmLUAzBcz
         sOLvzMtnGRNuA2iEm7g6ifKZZ0BZcJF/Euo3Me0TcEcImbE3FNi96LJ748Isr0b3IR45
         GWcw==
X-Forwarded-Encrypted: i=1; AJvYcCV2kt6CwTElIlYD/xfHL+IHI3OaobeJQAyuYS+5yS0jtWGSQTfme3VuQxmM0ynuSKTWzgZ6bbYvg+yc1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwdORERKdgaoMUXrIbeNa3yNVcIrkH7G+Bo+UI1ynQKNTOyxrPl
	M/HHkmXng6o/56b4ndqYURKfogC0hhbilBQxviQmiWIznDsSVKVxeeT5XyTrYQrSxOK6XKEC9gG
	FDL2aIxU6jq0pE5kkaGM9f9PK5gXZ7eXGNLf4PA==
X-Gm-Gg: ASbGncvbUk1pcRq6VGiRB0x1bWMKQWXBS7YxfMnrAkNXBGZhxbUrmg4Gzqjvr03KDcm
	nyixNVrxn7gB55MgR66YTHeXIkdNnuBd59Dr4tUSRViAFyibh44O4SDlHZhmnnQS3xpGCuFsrGA
	f3EGv0tvc9sM/pX2/iqWsK/wBU/YFsA26c05Km1Rs1F726u6FDsLBGAUv+27iFnjpxubky
X-Google-Smtp-Source: AGHT+IEAZl1Bq3/zu9vvbPR6m3Radye8loELaRqXD0AyDpOs+9n2p6f39NGtMiUIYfBcaZxZCiTPFXD5UyQrWFVswQo=
X-Received: by 2002:a05:6102:3e06:b0:4c1:abaa:ad93 with SMTP id
 ada2fe7eead31-4c8477c5c58mr1268689137.14.1743677275308; Thu, 03 Apr 2025
 03:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
 <20250403011849.GA3138383@ax162>
In-Reply-To: <20250403011849.GA3138383@ax162>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 3 Apr 2025 16:17:44 +0530
X-Gm-Features: ATxdqUE4AkC2FOF6OY9aZNJrmty8hh4LW8Nc1vXRFFYdK231FvWNsG3UDqbvQK4
Message-ID: <CA+G9fYtrsLHvMH=ofmdS3MMsMTEj3k0PD7=qsRsA4WkSqLkCzQ@mail.gmail.com>
Subject: Re: v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
 dragonboard-410c dragonboard-845c no console output
To: Nathan Chancellor <nathan@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Apr 2025 at 06:48, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Naresh,
>
> On Wed, Apr 02, 2025 at 06:19:19PM +0530, Naresh Kamboju wrote:
> > Regressions on rk3399-rock-pi-4b, dragonboard-410c and dragonboard-845c
> > the lto-thing, hardening and lto-full config boot failed with toolchain
> > clang-nightly on the mainline master branch with no console output.
> >
> > First seen on the v6.14-12245-g91e5bfe317d8
> >  Good: v6.14-11270-g08733088b566
> >  Bad: v6.14-12245-g91e5bfe317d8
> >
> > Regressions found on rk3399-rock-pi-4b:
> >   - boot/clang-nightly-lkftconfig-kselftest
> >   - boot/clang-nightly-lkftconfig-lto-thing
> >   - boot/clang-nightly-lkftconfig-hardening
> >   - boot/clang-nightly-lkftconfig-lto-full
> >
> > Regressions found on dragonboard-410c:
> >   - boot/clang-nightly-lkftconfig-lto-thing
> >   - boot/clang-nightly-lkftconfig-lto-full
> >   - boot/clang-nightly-lkftconfig-hardening
> >
> > Regressions found on dragonboard-845c:
> >   - boot/clang-nightly-lkftconfig-hardening
> >   - boot/clang-nightly-lkftconfig-lto-thing
> >
> > Regression Analysis:
> >  - New regression? Yes
> >  - Reproducibility? Yes
> >
> > Boot regression: rk3399-rock-pi-4b dragonboard-410c dragonboard-845c
> > no console output
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > ## Boot log
> > Starting kernel
> > ...
> > <No console output>
> >
> >
> > ## Source
> > * Kernel version: 6.14.0
> > * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git
> > * Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
> > * Git describe: v6.14-12245-g91e5bfe317d8
> > * Project details:
> > https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12=
245-g91e5bfe317d8/
> > * Architectures: arm64 (rk3399-rock-pi-4b, dragonboard-410c, dragonboar=
d-845c)
> > * Toolchains: clang-nightly (Debian clang version 21.0.0 )
>
> The version string for the toolchain seems to be slightly truncated but
> from the configuration it is:
>
>   Debian clang version 21.0.0 (++20250330105456+3b3d1a5c2614-1~exp1~20250=
330225508.1357)
>
> which can be parsed with our parse-debian-clang.py [1] to get more
> information:
>
>   $ scripts/parse-debian-clang.py -p -v 'Debian clang version 21.0.0 (++2=
0250330105456+3b3d1a5c2614-1~exp1~20250330225508.1357)'
>   clang checkout date: 2025-03-30 10:54 UTC (3 days, 14:17:24.134272 ago)
>   clang revision: 3b3d1a5c2614
>   clang revision link: https://github.com/llvm/llvm-project/commit/3b3d1a=
5c2614
>
> Our CI is using a slightly newer version:
>
>   $ scripts/parse-debian-clang.py -p -v 'Debian clang version 21.0.0 (++2=
0250401112529+290d7b82cb5d-1~exp1~20250401112547.1360)'
>   clang checkout date: 2025-04-01 11:25 UTC (1 day, 13:49:39.394836 ago)
>   clang revision: 290d7b82cb5d
>   clang revision link: https://github.com/llvm/llvm-project/commit/290d7b=
82cb5d
>
> Can you see if it is reproducible with that revision?

I=E2=80=99ve re-run the tests to validate the boot behavior on the Rock Pi =
4 board
with different Clang nightly versions and the latest mainline kernel.

The combination using clang-nightly:20250319 successfully booted the
Rock Pi 4 board.
However, the combination using clang-nightly:20250401 failed to boot
the same board.

"name": "clang",
"version": "21.0.0",
"version_full": "Debian clang version 21.0.0
(++20250401112529+290d7b82cb5d-1~exp1~20250401112547.1360)"

Reference:
 - https://lkft.validation.linaro.org/scheduler/job/8196258
 - https://lkft.validation.linaro.org/scheduler/job/8196275

- Naresh



> For what it's
> worth, both of the arm64 boxes I have can boot a ThinLTO kernel compiled
> with a version of LLVM @ 749535ba2808e133682074f712ac6829335f8875, so it
> could be something that was broken for a little bit but Debian happened
> to sync before the fix was committed.
>
> [1]: https://github.com/ClangBuiltLinux/continuous-integration2/blob/fe48=
44afc1be91d469fc162c8a179f23fafb9384/scripts/parse-debian-clang.py
>
> Cheers,
> Nathan
