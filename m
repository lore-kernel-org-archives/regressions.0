Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650EB13A256
	for <regressions@lists.linux.dev>; Thu, 31 Oct 2024 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730364913; cv=none; b=ZOdhx5TEWobvbMw35DRDJ7lFvfzjflh7NA8wUz6xyQDzpp6RZkaI+fzHSc53it4HE03PQQvDfxLo6kJBJ5Wg+U4tN3yLERGAAAbNt+6hyRXKSN+woyAmbFrJiIB0bVijHPaarHfWrz1/P2+5DBox+o50QKfOt31tQ4k6gphWezE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730364913; c=relaxed/simple;
	bh=ZDySzFsnKkeFXp+VFDI9R1fVxxjBMfiPXZnrcfMngKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5w1NvVmJuMdU6koh6USxhmcWGooPNZUBMDkTtaO0XwC2tQgNIIteO3Md4iH5GI0EL4Ggk7Sqb+lxhrijjREIbOTk85qvAm6WufeNRMWmwGyQoz0AdMaCYEPJgAwYP9RrcXjJsxuWZljxcHhpi4ozpW0YbzFmnG9pbXz1AOVqjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SA/51ygK; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SA/51ygK"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso9090941fa.1
        for <regressions@lists.linux.dev>; Thu, 31 Oct 2024 01:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730364909; x=1730969709; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FUDcheiK8JhqH6/QyyEKBcuyjmkqcu9I4AhzOv/eO7M=;
        b=SA/51ygK1tTSGx7qpFjis2dWCOJVXSKv6gBaNKhy8GfAF7RugM0Q0jkBWTI2cz9or9
         vQF8U+nFWTQWwWWEMrhxvUaevBoJeXwelnnQMgFJ9gDI8u/VXZdkBxyRIytSlbjoJ7Ux
         L/7nieSYQDeTguaQwO+JMBl9DOzfRxbGF+3dvlcpRTCRxCES4KUmERBmOUQSj6ZObzKa
         p6IoRf8HRcjgwlOP9fe5RjwCL3gFBPTIjAYwGeQuYLFbeTMd4ed9rsy2mN0E06PUqMb2
         n73+f6/45Eg8Dq/ZR/iAr9VuAkHIg1BZoYDtYoeS85YH8OgUlP55KkHUc0yunMjQQ+SS
         w8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730364909; x=1730969709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUDcheiK8JhqH6/QyyEKBcuyjmkqcu9I4AhzOv/eO7M=;
        b=sIQyGDcXVRTK9Ce9bkh4tfttybI/DoB5Agq8c2VXiq+H5Ga/sgHoDwRrDuRLVhiqK2
         +F9n/KB6uml2l8mwAxQ8DFRCfxU+tyz5vc8N9NdO9oXHt7ccfjO1J3RnxGMU6E5eJ+hU
         lQiqUH+XlzXrbMXm9WLSSx1fgausyYm2VWVLF/Ps8FpAZJhlFi68MASFvJTSuZEi9kny
         6gGXeZAES+7UQaEyUZBXPfUSzYVyDBbYl34w0f8YSl1Nj3sxh0YEmcy1dAzSJkn0vyhR
         OoWbL4+X1BB3lszOW+trnswln7ol+SlpA1Q2VGnCGVqreKp13sRNPuzTqpQX29RabAot
         nd8A==
X-Forwarded-Encrypted: i=1; AJvYcCXWjgTGS0iEhtHosGAMmbVnNttmETzwOin/W5ztLTWT3LnmVB/MQPt60pmH0sM4filrYnqJuK8SnykWLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbB6+YtMhUbOu/uSoEzZvUyB64R4qleChJz4Cmh2ytj9P53/bR
	njpoQowcerd+91zoSSSw2NM2VTiYbHW/VdP0kxwdFgbrUJWZvCG3Eo+YyVWnn60=
X-Google-Smtp-Source: AGHT+IFBFiCfVxYlwTElhQ9iaN5niEh2RqNjHdUElsmI/f4MFMMrn30OPEc0CN4b5u1SgxFe8qNHmw==
X-Received: by 2002:a2e:a984:0:b0:2f7:7be8:fd89 with SMTP id 38308e7fff4ca-2fcbdf61db9mr168289041fa.6.1730364909453;
        Thu, 31 Oct 2024 01:55:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1189123sm1440859f8f.115.2024.10.31.01.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 01:55:09 -0700 (PDT)
Date: Thu, 31 Oct 2024 11:55:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: next-20241028: gcc-8-defconfig : ERROR: modpost:
 "__aeabi_uldivmod" [drivers/media/dvb-frontends/cxd2841er.ko] undefined!
Message-ID: <456c79d2-5041-47c4-bed2-44d257524ddd@stanley.mountain>
References: <CA+G9fYvvNm-aYodLaAwwTjEGtX0YxR-1R14FOA5aHKt0sSVsYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvvNm-aYodLaAwwTjEGtX0YxR-1R14FOA5aHKt0sSVsYg@mail.gmail.com>

Is it possible to tie this to a commit?

This is a u64 variable getting divided somewhere or maybe the divisor is a u64?
But there haven't been any recent changes to the driver so probably the change
happened in a header file?  I looked the differences between the preprocessed
.i files from before and after and nothing jumped out at me.

I don't have a copy of gcc-8...

regards,
dan carpenter

On Wed, Oct 30, 2024 at 06:53:01PM +0530, Naresh Kamboju wrote:
> The arm builds failed with gcc-8 on Linux next-20241028
> and builds pass with gcc-13.
> 
> First seen on Linux next-20241028 tag.
>   Good: next-20241025
>   Bad:  next-20241028
> 
> arm:
>   build:
>     * gcc-8-imx_v6_v7_defconfig
>     * gcc-8-defconfig
>     * gcc-8-omap2plus_defconfig
>     * gcc-8-davinci_all_defconfig
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build log:
> ---------
> ERROR: modpost: "__aeabi_uldivmod"
> [drivers/media/dvb-frontends/cxd2841er.ko] undefined!
> make[3]: *** [/builds/linux/scripts/Makefile.modpost:145:
> Module.symvers] Error 1
> make[3]: Target '__modpost' not remade because of errors.
> 
> Build image:
> -----------
> - https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/
> - https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/build.log
> 
> Steps to reproduce:
> ------------
>    - tuxmake --runtime podman --target-arch arm --toolchain gcc-8
> --kconfig defconfig
> 
> metadata:
> ----
>   git describe: next-20241030
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git sha: 86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
>   kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/config
>   build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2o9bKKvq45ZlybLVnQ1Bl0hEVA5/
>   toolchain: gcc-8
>   config: defconfig
>   arch: arm
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
