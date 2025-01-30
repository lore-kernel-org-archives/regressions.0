Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F3C1F0E20
	for <regressions@lists.linux.dev>; Thu, 30 Jan 2025 19:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738265990; cv=none; b=ZQ4nsmB0dgyuwHKoU2eDKr5cUzx0CblOsJ1ChffrpAwYIdHZMPDuaOD81X2+k+Ef5ZvwEAs8ErajX1XScbbxRgEqKvCAWkOjQDzMzTmnuObN1ZmsOxqKSPW3eAiArLKEaTLDSIi5m0RH0bGAkuvfSqI/AtyvJ6PAjLnIMNcPf3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738265990; c=relaxed/simple;
	bh=DzlC+X0WZW0niB4gvbmLbEseL93wg5RUoZ89xtMXXj8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kf38aFb8cbxnHZyYwARKgUjylM6bVL5Lpv8tRNUJNKIpC4GAj45L/9PnUUFC8Zt8pJUu4LoS+Bugt/i7r3lalwtBS2rkKmaxDNJsRZlVj6WzNdxZB9HSfaJC8R1+8BlTKenW+mBrGcLEi0o2jLlQni64VCm94D77ygylJTRfJes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rbk4SYqz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rbk4SYqz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so14182295e9.0
        for <regressions@lists.linux.dev>; Thu, 30 Jan 2025 11:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738265987; x=1738870787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbrBbtetW+eFSRSujFwF+D0y+0c8n01YuDApoGFtoHM=;
        b=Rbk4SYqzTL4uu9UmPIFHWjtC3Lx6jUN3+5G0p1MX+qqwuKS03XyupGfLLwEJFhdrkG
         CkfxKNIbU3xDe/G9GnXqUTNYmipTASWqWQcDjw+JEe1FK/ZbPSJjc/w4QVNoql9Ns9O1
         lEcgslg9DBUMSzNpUE08oUS3wa5d6h+78+V2NMKS8KL8ZAc6ULCOyDD3rUWama9d1xlt
         XvclklR/BF+uKZ3ayYVCWuuy0H5txPIpujQ1w/A14QgoCQWDfbDwaxv47Sz+4r1FSen9
         ShNgJmB9aYE7WcYlC/DEYiV+eefMDLgBwGroOXiFcTpLypT3M4yI3wg6lLNmAXxBb0Tc
         RAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738265987; x=1738870787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbrBbtetW+eFSRSujFwF+D0y+0c8n01YuDApoGFtoHM=;
        b=hXFRJI1N2TAm8cgUxOEBmtKwIT5B3QjzyUxakPYpbGLSfLpcR7/EZH5QxH5q3GPbRk
         KQ9NffqNQGepxZmRhhTlS6YnoIt1kHuMvGdoa+ZaystTlGz5BcMXVdqIL43ly0fKFR6u
         vd3M3OduPf+kntHEnnmPGLfFt+2WbRyuN7lTigFsYHquUyJQSg3lIrXcT9A4R3LTwIHu
         p1dxtdx1cRAKbyppPrRradN8lE8TEEjVLPY0zCciRkM2rDGFaak0Dyps5pWBKmQq9cA2
         Qm9UguVMVHwMPzEu3v0S+1ZpQzXz0ao6kzp0PH1h5pMd80yKiwQ1hgDt6R96pMxL8k2v
         7wdw==
X-Forwarded-Encrypted: i=1; AJvYcCU7VfVzBr9sJ6XKyyLvN/M58+uDwWe7wdD5UbVenM1lQS8Bzvd+6FsjR2LxXkilR79JTfZChvx2BhYZwg==@lists.linux.dev
X-Gm-Message-State: AOJu0YznKOd5qQ1qDUqJH5NjBxUmYIuymWRL0gC3HhDm1iC9Cf6gkaGn
	VI3Q8DdqEqjtiCJ+RfFOqjevajva1xSB7dvMU5fHDVCoCpxk77CtSDFP6w==
X-Gm-Gg: ASbGncvh+kx2WObEKjlE6f+fDCIHgS0WM8rAkfKpBwrTMrxos+dHw1JGbZz2qY0LEs1
	iglbZGVuvG1wGZuJdzHVMs3JgHQ3u2EeIiCQMTM2PkDPGweWvJCd8O2TTSgSxY5YSGar1Bm3N0E
	rrIuLrjrBWJCrbG/6K0bzscW91jJguvxYIVD78BIp659gVj5dN94K2L7XXys+3VQmh+mM/noJaC
	j4Dn8eYSRvme5+E9ZxXh0KT4gY69GQ1QkOXOMuekzMo8mnV/uUiGhmFa7H/ZmdPS/2/5VcdAEGE
	a89kOXD93k33aFMk0rft+CXjVc9q2We23Ihc2Fq+50Jg9f6GOV2u/w==
X-Google-Smtp-Source: AGHT+IH+dsWzoPqJ1FZkEn31AznVDwohTc/WMVbBodZ7oPmqAAzLBa26jUpO3bFpM05kGf7eu9Dy3w==
X-Received: by 2002:a05:600c:3501:b0:434:a7e3:db5c with SMTP id 5b1f17b1804b1-438e2446708mr43887285e9.11.1738265986805;
        Thu, 30 Jan 2025 11:39:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2ede0sm68629125e9.21.2025.01.30.11.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 11:39:46 -0800 (PST)
Date: Thu, 30 Jan 2025 19:39:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: lkft-triage@lists.linaro.org, open list <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, David Laight
 <david.laight@aculab.com>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter
 <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, Ankit
 Nautiyal <ankit.k.nautiyal@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: Re: linux: master: x86_64: gcc-8: error: call to
 '__compiletime_assert_909' declared with attribute error: clamp() low limit
 dsc_min_bpc * 3 greater than high limit dsc_max_bpc * 3
Message-ID: <20250130193944.478cae8f@pumpkin>
In-Reply-To: <CA+G9fYtNfM399_=_ff81zeRJv=0+z7oFJfPGmJgTp6yrJmU+1w@mail.gmail.com>
References: <CA+G9fYtNfM399_=_ff81zeRJv=0+z7oFJfPGmJgTp6yrJmU+1w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Jan 2025 15:01:21 +0530
Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

> The x86_64 and i386 build failed with defconfig with gcc-8 toolchain due to
> following build warnings / errors on the Torvalds Linux master branch.
> But gcc-13 builds pass.
> 
> First seen on v6.13-9485-g72deda0abee6 on Jan. 27, 2025
> Good:  v6.13-7644-gc2da8b3f914f on Jan. 27, 2025
> Bad:  v6.13-8265-g9c5968db9e62 on Jan. 27, 2025
> 
> i386:
>   build:
>     * gcc-8-i386_defconfig
> 
> x86_64:
>   build:
>     * gcc-8-x86_64_defconfig
> 
> Reported-by: Linux Kernel Functional Testing
> 
> Build log:
> ---
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 SRCARCH=x86
> CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc'
> 'HOSTCC=sccache gcc'
> In file included from <command-line>:
> In function 'intel_dp_dsc_compute_pipe_bpp_limits.isra.80',
>     inlined from 'intel_dp_compute_config_limits' at
> drivers/gpu/drm/i915/display/intel_dp.c:2547:3:
> include/linux/compiler_types.h:542:38: error: call to
> '__compiletime_assert_909' declared with attribute error: clamp() low
> limit dsc_min_bpc * 3 greater than high limit dsc_max_bpc * 3
...
> drivers/gpu/drm/i915/display/intel_dp.c:2506:25: note: in expansion of
> macro 'clamp'
>   limits->pipe.max_bpp = clamp(limits->pipe.max_bpp, dsc_min_bpc * 3, dsc_max_bpc * 3);

The code is:

static void
intel_dp_dsc_compute_pipe_bpp_limits(struct intel_dp *intel_dp,
                                     struct link_config_limits *limits)
{
        struct intel_display *display = to_intel_display(intel_dp);
        int dsc_min_bpc = intel_dp_dsc_min_src_input_bpc();
        int dsc_max_bpc = intel_dp_dsc_max_src_input_bpc(display);
 
        limits->pipe.max_bpp = clamp(limits->pipe.max_bpp, dsc_min_bpc * 3, dsc_max_bpc * 3);
        limits->pipe.min_bpp = clamp(limits->pipe.min_bpp, dsc_min_bpc * 3, dsc_max_bpc * 3);
}

with:

int intel_dp_dsc_min_src_input_bpc(void)
{
        /* Min DSC Input BPC for ICL+ is 8 */
        return 8;
}
     
int intel_dp_dsc_max_src_input_bpc(struct intel_display *display)
{
        /* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
        if (DISPLAY_VER(display) >= 12)
                return 12;
        if (DISPLAY_VER(display) == 11)
                return 10;

        return 0;
}

Although the little functions aren't static the compiler can assume that the local
versions will be called and inline them.

It can then move the clamp() code into the conditionals in
intel_dp_dsc_max_src_input_bpc()
It then sees clamp(limit->pipe.max_bpp, 24, 0) and quite rightly complains.

Broken by 160672b86b0dd

	David

