Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A9F17D378
	for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 10:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729245694; cv=none; b=XgMTHIOlJFARqMClt52D0CioIYzMXaJds2KzXvKfc+dMCbk7FXGL7YUqR6GWVw1InJM3SLOE59oFbV8XSwmkePT+pvpr32HoEePFsqYWgi/iU4nksGLYDBrruUWyzJJD1NBsLI5y5NWlb7XhNiMEh1p0JaTE/vZeFlNoIf3Ll+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729245694; c=relaxed/simple;
	bh=ByQvZv98BC+L8p1DTuZl2zlqdFxenNAcm24+PlvMt0s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WN99qauHypbdrOILNpwlmrbZ/ywewNGvxk74dY/2yJHUbafqs12uIWcHWruF1nb/ZxWpCnPBGSR885q61L6tWHOlWgFSGT6VQHSGOol4uh+XSEi6PUBbB6W3wmpFNtuIYsgqPdnSk4DWKRMcIIdo5P8bAAqIuSuFM4Rj7Ev62bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6WP35YM; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6WP35YM"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a0c40849cso282639366b.3
        for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 03:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729245691; x=1729850491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EceJMD5TFFW28sEBYAnTnnk355nDba/Ev8Vf3NXQHxQ=;
        b=s6WP35YMuYI8FRJrKnkjqgiIwkOyC4SP1pE6qLgIaJcN2Tq7QoMfXL+3B18N+St33B
         k/CXjIyuXfim/9IYcNDbVxp6eYxqgM60MD7Lc3vXun7kC5SeWBtKfmTvz7p5TRaAjuxV
         rlm+r+3BFeYkZ2LvMtlMgNUYja7Rxz1VMBEYQdsLwfr0H++O2DAOP0RLQMbAVQebKrDN
         NvcmgMzexRbnAXW/rIbVjLt2JajzqTHhgWxdfp7bs5Xp/CsXxyVWB+LYp/mqAKTT/n9I
         v70wyaHXSt7yU2+dZvArjmFzAbsKYPUxva3lzoLOmGGB0+/n/jOC7e69oeBiZnU7m4I+
         WRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729245691; x=1729850491;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EceJMD5TFFW28sEBYAnTnnk355nDba/Ev8Vf3NXQHxQ=;
        b=ryHq2FVa5w5wWCLN6eqU8CSGiirgHzR9yTKgYuixB1ODORkoSldKg6Lv2ZoXlZ4ixc
         P4oX2Nzs/8PI0pNV3kURLQT90rPlWckVtrIi6bZKqMxYqShnARnd68lrNHrCEenHWne6
         ig0o6j75rYFBb+N8v9I0GVQxZtaeX7kLn6bu12rEtPDi4BFo2f8Jq/iwFwrpFBuxrFFH
         2LuI2dxVbYDBLckxdTfQo3NGf+ScTCaDgkVv5dA3vryrK4wut9Ks3sZmaczsWq7vOe/M
         +mKdKUCbHGy3U4zt6qx9FDFtPB12/sY7ANib7lLWMrIHNl153ethK0Z5j958pZM0hPGz
         npbw==
X-Forwarded-Encrypted: i=1; AJvYcCVPYod7LzugkrrcGs3xVmWX0ponRW5Vd8VnB0Rtq+1D4bo7UVhwu2ei4IWk69EpFUo+A8XU9MlINZveNA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaGCcA3I46AWRLnRlCINrRJqcW6lpMrrmM3d1L4JPkrhJ0uhBm
	yHZeWMFaKZQ6SOyclGs1Hl184RpIbRXGe2pfyAPDTvDHImvMYL64qjmeJLpzWLo=
X-Google-Smtp-Source: AGHT+IEDSxbCrlx25fjyK8bHdzmrM1cAxNXPz/tyNwGjzf/ZGH+OdLM0Jm8+kkTlgW5Frk6BCtFLAw==
X-Received: by 2002:a17:907:7da1:b0:a9a:2d04:b577 with SMTP id a640c23a62f3a-a9a69ba71d2mr175520566b.32.1729245691269;
        Fri, 18 Oct 2024 03:01:31 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68a8d9e4sm73106566b.9.2024.10.18.03.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:01:30 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 413755F863;
	Fri, 18 Oct 2024 11:01:29 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,  Linux ARM
 <linux-arm-kernel@lists.infradead.org>,  lkft-triage@lists.linaro.org,
  Linux Regressions <regressions@lists.linux.dev>,  qemu-devel@nongnu.org,
  Arnd Bergmann <arnd@arndb.de>,  Mark Brown <broonie@kernel.org>,  Catalin
 Marinas <catalin.marinas@arm.com>,  Aishwarya TCV <Aishwarya.TCV@arm.com>,
  Peter Maydell <peter.maydell@linaro.org>,  Anders Roxell
 <anders.roxell@linaro.org>
Subject: Re: Qemu v9.0.2: Boot failed qemu-arm with Linux next-20241017 tag.
In-Reply-To: <CA+G9fYt86bUAu_v5dXPWnDUwQNVipj+Wq3Djir1KUSKdr9QLNg@mail.gmail.com>
	(Naresh Kamboju's message of "Fri, 18 Oct 2024 12:35:13 +0530")
References: <CA+G9fYt86bUAu_v5dXPWnDUwQNVipj+Wq3Djir1KUSKdr9QLNg@mail.gmail.com>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Fri, 18 Oct 2024 11:01:29 +0100
Message-ID: <87v7xp91c6.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Naresh Kamboju <naresh.kamboju@linaro.org> writes:

> The QEMU-ARMv7 boot has failed with the Linux next-20241017 tag.
> The boot log is incomplete, and no kernel crash was detected.
> However, the system did not proceed far enough to reach the login prompt.
>
> Please find the incomplete boot log links below for your reference.
> The Qemu version is 9.0.2.
> The arm devices TI beaglebone x15 boot pass.
>
> This is always reproducible.
> First seen on Linux next-20241017 tag.
>   Good: next-20241016
>   Bad: next-20241017
>
> qemu-armv7:
>   boot:
>     * clang-19-lkftconfig
>     * gcc-13-lkftconfig
>     * clang-nightly-lkftconfig
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Boot log:
> -------
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 6.12.0-rc3-next-20241017
> (tuxmake@tuxmake) (arm-linux-gnueabihf-gcc (Debian 13.3.0-5) 13.3.0,
> GNU ld (GNU Binutils for Debian) 2.43.1) #1 SMP @1729156545
> [    0.000000] CPU: ARMv7 Processor [414fc0f0] revision 0 (ARMv7), cr=3D1=
0c5387d
> [    0.000000] CPU: div instructions available: patching division code
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction =
cache
> [    0.000000] OF: fdt: Machine model: linux,dummy-virt
> [    0.000000] random: crng init done
> [    0.000000] earlycon: pl11 at MMIO 0x09000000 (options '')
> [    0.000000] printk: legacy bootconsole [pl11] enabled
> [    0.000000] Memory policy: Data cache writealloc
> [    0.000000] efi: UEFI not found.
> [    0.000000] cma: Size (0x04000000) of region at 0x00000000 exceeds
> limit (0x00000000)
> [    0.000000] cma: Failed to reserve 64 MiB on node -1

Is this a highmem related thing. Passing -m 2G allows it to get further
and 4G is obviously at the limit of 32 bit?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
