Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48AC26F288
	for <regressions@lists.linux.dev>; Thu, 28 Aug 2025 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756377666; cv=none; b=YfDp6TJWlwHQGBgb98hfmJb9wX0WBvbCkX3CWF9gw4E1sCo/JOJQyxyufE2xVijUvIHXkgGi/0Xq0B39mY1LoMwWQGnJbTKXRtQNyPHJTyZ3/XNoVZ3bCBRdcgsipYS8b50AJ/hjsrnY+ae5vWS+O0HHW28EG7Y8WqM+CTf/QdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756377666; c=relaxed/simple;
	bh=uw4c+i8xKaQAYP7o50jrNBNLbmBRrs7CaD4Z51npYbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JNKR2sMa5f0/cItPvXVRRSQgUAvfHXoBMOUktVmiqpKRDk6pzYZpVDNasKNDWUddhNi6blaIC2gNKnWNoo0y6w2MeNxgmhUTky4qEXg2dRVpadYa249IIbbr4o9/588vl1rGNNHkvpKAGqJF9sD0QSDrSnIeMvbJUdeMKs8ds3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hahHM2kB; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hahHM2kB"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-70de8324efeso1686656d6.0
        for <regressions@lists.linux.dev>; Thu, 28 Aug 2025 03:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756377664; x=1756982464; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EydVysub6WRf2f/POlpq24Sj1Yvi1ca2N5AUKs2yN74=;
        b=hahHM2kBLT+FZRvGU2VYPjYPFG0peGFfNeGL8rQxUZCPJu6L5GcjQ79yXUPz27yNQF
         yy7oEL4pjkejxq3EqaZ+iXUZBIgNSt4nEZCxrJTbCVVqt3opmiU2+cJ+tdWKsRuWZQsx
         HJeTVavUZzHQdil5kIFoKATF8jrUWJRraHaw8GLXxmrFOi8IWc2BWlTE0jus4C5Ho9O7
         QCmoIrjmJinKXJwRjJoEqh0f8+uO/X11HFFUHNTEqseExBQ7esQ/8MtwG877juHPdiSu
         TcJHTh56E7lj2v8Bygv3DkaDLz+QEHz4KWMIqTmgsCtlmRmdBe4cFQMNAf0jwIm9h7Gf
         NuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756377664; x=1756982464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EydVysub6WRf2f/POlpq24Sj1Yvi1ca2N5AUKs2yN74=;
        b=QJ5UueouP8vb0bmrEg6Nrqi3be5zyZAJe/ZEgQKF9W21zKtib4AoHe60Yt58+HgzrN
         FXV8K/0Tu2C/DF219SYi21ydgXdLkU6EJ8FAAmYYV8waK5pfVeOFE4/aWGBM/rP3vAjs
         mVUfpOlafalmxcxhemFYOi+Zd4LZe3TETts7YMUmk87PrK0jPNycZ3nCB71HC2Wf8fO+
         UOSJz8C9mFgK+3IasitngGkwNXPfnbbUBXfTxFcPIflCYgoIRJbnrf96gk5omoOJp407
         iFTAKQIN4xfTM7+hwmFT6r+TIwtrvlcLb/JVVA03cVrDnCY7Gy/wx8MElMpNqruAjvLG
         om6g==
X-Forwarded-Encrypted: i=1; AJvYcCUHmUBo5vVQJ8h4+m36aCbqdFJZ8BDBm8uE2OwkiwxUc4cBNs74sTZ5hXIEVfnmLlFlxq9mfAz0Vz1LOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEnSeTNy85TTzR1biZdCJoocoWYm60PHW6dO1QUxCBhZHbaEPT
	CxCw2uzmscnT7zpqwxoGxsATJfYyk1Z8VyLB2JKDZKVuSFXceQJGsEuwYcQ10FyCXP2TKAcnkza
	G3ApgHeO3GFbuCqcDYHtxrYUG4jIW5KJ4/dWoInkQ5Q==
X-Gm-Gg: ASbGncsNTsNtJlAZ7BEjKMLnhkXT/T1kE+FEbQKP/WKIHab8lcaEXgQ4vIUxnaC0tUY
	pLcGfRkMnQwk9o7fED28E0QYbST6q1f30xp5JTyye+K6clXV0G2xGaHDqFLmdw/1bisx8360xda
	Tj7t5vNaJ/KASXGVsQGqqb888SMmVYDRVKVn6ZPcb9ntPH3ZiO9PKI5BZXwQtcu0bp4QAZou1V8
	/P8NOI4pnLq11JY
X-Google-Smtp-Source: AGHT+IE4bAuEW9ouUAxu2MG7S4mY4Sa0rG4XXjaFyEoJM05F/h+YGpiGYd0qZuUP43lUZrkbFMhLhuVFPQZ3xAVR+ck=
X-Received: by 2002:a05:620a:a11c:b0:7eb:b179:cf18 with SMTP id
 af79cd13be357-7ebb179cf73mr1352900785a.0.1756377663827; Thu, 28 Aug 2025
 03:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuysVr6qT8bjF6f08WLyCJRG7aXAeSd2F7=zTaHHd7L+Q@mail.gmail.com>
In-Reply-To: <CA+G9fYuysVr6qT8bjF6f08WLyCJRG7aXAeSd2F7=zTaHHd7L+Q@mail.gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 28 Aug 2025 12:40:52 +0200
X-Gm-Features: Ac12FXwg7V6NAoK1bwozm71TrmcFepHUZqBu0bygtHChH0GZxXhOVks4ofdYiC8
Message-ID: <CADYN=9+Pnw+7bYGr=QnSWqF1YBoB8CbtgkdmDqeY68DQr3CVDw@mail.gmail.com>
Subject: Re: next-20250826 gcc-8 compiler_types.h:572:38: error: call to
 '__compiletime_assert_478' declared with attribute error: FIELD_PREP: value
 too large for the field
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, PCI <linux-pci@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Aug 2025 at 11:55, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following build warnings / errors noticed on arm riscv mips with
> gcc-8 toolchain but gcc-13 build pass for the following configs.
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> First seen on next-20250826
> Good: next-20250825
> Bad: next-20250826 to next-20250828
>
> Build regression: next-20250826 gcc-8 compiler_types.h:572:38: error:
> call to '__compiletime_assert_478' declared with attribute error:
> FIELD_PREP: value too large for the field
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> arm:
>   build:
>     * gcc-8-integrator_defconfig
>     * gcc-8-omap1_defconfig
>     * gcc-8-footbridge_defconfig
>
> riscv:
>   build:
>     * gcc-8-defconfig
>     * gcc-8-lkftconfig-hardening
>
> mips:
>     * cavium_octeon_defconfig
>     * malta_defconfig
>     * defconfig
>
> ## Build log
> drivers/pci/pci.c: In function 'pcie_set_readrq':
> include/linux/compiler_types.h:572:38: error: call to
> '__compiletime_assert_478' declared with attribute error: FIELD_PREP:
> value too large for the field
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                       ^

Thanks for the report. This should be fixed by my patch here:
https://lore.kernel.org/lkml/20250828101237.1359212-1-anders.roxell@linaro.org/T/#u

Cheers,
Anders
