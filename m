Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4321C9DF7
	for <regressions@lists.linux.dev>; Fri,  6 Sep 2024 11:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725622409; cv=none; b=gitRxNrjRow6eftQTApg+oov0vcTboYbJ6IO7MKz/iNnuCzhHvnXqaBzS/R/bnDS+A9aKZgg2HDrYbPYyQsWqKunjPbPJ45VKADU/xOJHGpEf1TPTQgW9j36plRAeWAxBuduOnvLq4fHY2jjFWgGNafIXy0XkoqToeEJkSfn3Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725622409; c=relaxed/simple;
	bh=a1oiwHXhTP5k1qDN8Kz5shKpgHS7gkdYtvq/dlluG9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijmBzBGrryZv5rVyw+5kq9gUx2f6UW2gITsYSDeh/I+ZUijBxIz74GhcAtI16eBD6o18LdgyQbJId5kZL2pBRlT4HGsrN3rcLlUrAIACeFXhrjoowxnzxm2vzuShLxovD1Ht/EoNelf8P5Hu4LHW3eQl6MS+rarBpibcJwAo/Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hHuKyVW7; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hHuKyVW7"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6db20e22c85so18198557b3.0
        for <regressions@lists.linux.dev>; Fri, 06 Sep 2024 04:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725622406; x=1726227206; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a1oiwHXhTP5k1qDN8Kz5shKpgHS7gkdYtvq/dlluG9A=;
        b=hHuKyVW7zyj3oN8OZKQdzjuzT8M2DS2ND85Ca9T1wV62jclBfaIxYWwbRe3kU54Seb
         FtI9uuSo71JZsxUnsL1S1/aXwikaN9gnQym+FXuRO6W8YzJMJiEYff7WA8Th7Jvi0aSy
         U9QUaS3e654MvI0Gto9t/4CjsmQqI+O0dRZh3hLwNhteYBy8PGqOyhNdc20AEgQw3Mse
         FIv/WauTSHI+V4vjGX7ZMXY+RnDO7dObPNKYC7IGt/Pj6mMLyUFTAmUpmB23uC5hyDmw
         Wc5EY0yTC20NWCG5DKPJPRGW+Ji+ieTcwwYzrT5CLrArqpgG//P7ZlqdI6fZd6trN8WU
         C51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725622406; x=1726227206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1oiwHXhTP5k1qDN8Kz5shKpgHS7gkdYtvq/dlluG9A=;
        b=UOG4NErAnyOU4WQi5T+4x8R1bRxn0NPlcBMbSlN+g/pT8oFbR5O/I7gcRbF6fyNDpx
         etZB3nxbXE1q2Hk/3dDVqeLgITNsfxUnnf3dBZRJj8Ys31UdyfiveiMdME+jQdo28aSF
         E13gMcSelTtIEHo8RlnKEKWrZ20ISCu8prPy8pWqr+o2K64K+KA9l8MCmgbrKn0L5RKO
         6qVT+LXI7ya64D9FtgttJqgjfVPcOXW0aHDQGKBsISolMni+gJRKA7Md1zu8R3LMcFjd
         zxib8MtIwte/imwXHZlr4FVnnujonHwFmmkA6Vd1UuUU2VIogy+3XMIugElCnJ+Jyu/Z
         dLSQ==
X-Gm-Message-State: AOJu0Yw8p/Jt6jPCHV2zXTXNPkrqA8O3ifr4uxLPvoxQV8T3vTyjdAAC
	EB/5DRlgh9mWzDpAGygryMZvlvykLeCic3ewSvA4sntrCJPKlF6//3ZFrtw6cgxAc/0vN+IukfP
	1yRm1GFwe1/ixnkbmCXZgMmTmNhOggpS3LsAL7A==
X-Google-Smtp-Source: AGHT+IGkcx0LnZHoHukMiwPH2fOzPIp/adODmKyPix5sHHzkQiP21pFZVgYcCTOOmpTmXp2A5oULIb0ksyDmO2p8kGw=
X-Received: by 2002:a05:690c:6384:b0:6af:125a:1c6a with SMTP id
 00721157ae682-6db452d6a58mr25663227b3.41.1725622406397; Fri, 06 Sep 2024
 04:33:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
In-Reply-To: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 6 Sep 2024 13:33:15 +0200
Message-ID: <CACMJSes4cnCNUHiZUr4CF-K2c8-1VYzuh=T8JDi_erqfShkuZA@mail.gmail.com>
Subject: Re: [REGRESSION] firmware: qcom: scm: smc: switch to using the SCM allocator
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: regressions@lists.linux.dev, brgl@bgdev.pl, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robimarko@gmail.com, quic_gurus@quicinc.com, 
	luzmaximilian@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	srinivas.kandagatla@linaro.org, arnd@arndb.de, quic_eberman@quicinc.com, 
	elder@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@quicinc.com, ahalaney@redhat.com, quic_djaggi@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Aug 2024 at 08:51, Rudraksha Gupta <guptarud@gmail.com> wrote:
>
> Hello all,
>
>
> Found a regression with a platform that has the msm8960 SoC. Was hoping
> to code up a fix myself, but I'm not adept in ARM architecture or the
> Linux kernel, so I'm just reporting it here. Reverting this commit seems
> to fix it as well. Please let me know if there is anything else I should
> provide for this regression report.
>
> #regzbot introduced 449d0d84bcd8246b508d07995326d13c54488b8c
>
> Error: https://pastebin.com/SDRENUGk
>
> Defconfig: https://pastebin.com/CRDjC39a
>

Looks like qcom_scm_get_tzmem_pool() returns NULL. Not sure how this
happens. Can you confirm that the QCom SCM driver probed correctly?

Bart

> Platform:
> https://wiki.postmarketos.org/wiki/Samsung_Galaxy_Express_SGH-I437_(samsung-expressatt)
>
>
> Thanks,
> Rudraksha
>
