Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D869A14F102
	for <regressions@lists.linux.dev>; Thu, 30 Jan 2025 20:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738267277; cv=none; b=rlPByDAVvt8cqwN4cZvG8+TWHGpvZdu9ICNH24dR7Fik7m7dSXzbAwe0eEjqtx3TmkYI3nhq5kaOVlBzLp82bjB0iWjZgSOVSF8Bi/kYlfLOT9hz31AIf5kroPbTSF6rsablfQUM6vBfDWurKA1RjItpLvC5AHVaa8IlnumQfbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738267277; c=relaxed/simple;
	bh=j72SbzSvOGMJxJoQNxbERw8rJQAq8FYGiP1zq21fHI8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KfK3sOfh40h/J2Qfj+6WD5vx4cDZfzvU41tGLDjPd+VrHt7h+3omVsEEN5iGiKHLzQMYwmF34WWP89okQMpV4t3qKPSwxrzRx3y3FzeYUJGE63iZ4aZt9tBRy1PeT/g+T2vLtYNPMUvOLNiAHdzoz6TOT8Rx2jNiUcObMY4QoTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2XgILdd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2XgILdd"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so693859f8f.0
        for <regressions@lists.linux.dev>; Thu, 30 Jan 2025 12:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738267274; x=1738872074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfOmM15t6GCi/gXpOTSAQVn8+bb5YsUyZ8MqKExsTSg=;
        b=f2XgILddrSpzEoPcSMYm89YH3vQCJGsS5ZBSrJ462anhoS7TD/iy80HWwQvnaVN3la
         Os/92HfY2XEpaCWDNl0Wpqo5B8KfN5U4qSiO9n0T8XvNOWdfWmQQCKHP5zk2PKkYoLTV
         85SSl/e1qq4oNDoRTcrrl+hwpBwambthMDIWlm7YJjrioF2gD3VMN/vhprPvsBWEvxiG
         UpGeDcywsaNIDoSzvqO8lymSS0xqG69KTM8h6n2xhpPk9NvMZWqw1qf6W2SmACWIF9Fr
         Yw/jiZGkUSYYFykjoVXk/97z755wjHEFguVeR30HrlAxXfy5g8iiqSd3hk9rdGJLSJnT
         EkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738267274; x=1738872074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfOmM15t6GCi/gXpOTSAQVn8+bb5YsUyZ8MqKExsTSg=;
        b=gw8OzxxsEbeKMpjAWbneL2+eW4VEIqi6+2RMFnI+UP/GeqjXVNcmKmtSmlu3QwS4IY
         g9cbE5SOz2aRlmXHxLn37fFy4J1H8tPdQ1NLLpRLyRyGt7sIi3dtAfXZLU5ohtHnEk+U
         8+/+LYjx9qKKhcVsm3JmvO2gsMr+oUDDaHbbW+vHR/ee3PIvK9gFyHFOpdLUJ8zoUVeG
         wul9CxDQmHcdy2BIL+06MG2+uRMyHci6BBvtB7RaVKi3tLHVprZ8Uau1e6lXpkvknFrx
         UX7DP2YwYfq3GGt2Zt8hdxt9d7Ibb40HaA3tXwqjXmovmX7kH8+yIcfDHWPgXPDfnveT
         9iDw==
X-Forwarded-Encrypted: i=1; AJvYcCVpZTraSFS5fOdcoIL73cWb/1bOSFGJ1u9SDe4WmoB/TEzn5ebywLvM7U20xQaj7hp55BZ3MZKeNxenDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8FXWw0z2yn1abCm0K4bnBvjMHIgW6MD+Wom006NYLMvFeh6Lr
	BvwVv4DwkJXBtaWJXxjEuSCcMn2s6InS4VJ8Tagg0sQH5LxWjqw9
X-Gm-Gg: ASbGncuIi8mWb76lSdHKHlAREr05leyyJNAAlS0cx/MSQ8WZmuMjl47JHMj/mY9ebsC
	jHmtqYQfK3m+B8EctyHWiGjkvjP/I1XxFIPPnNug1UwFmsKCqtW2q5HI30Ihuw4hxYIfG8emhxA
	GF9YtUETIYkTTeeWyPpf85b10iKtsyktOWJUQToQ1f5s4pOkE3s0plQbJ15HIw1lsWbId2hdWiU
	1zgEtsvx+Dwr81FgY8J7XeS1S1/zivi7ilz6jfJUYKPVlUHIgiOPv96xcd9bK8Q4GrcfVZOnLsI
	4IhsC3gdtwZfx5G2OKS8XYW7E3AdSI/fim4BZLWPEw/BwvHgnmDm/g==
X-Google-Smtp-Source: AGHT+IFPStvFpjNXZEIsjMW2EGJ5wmOm9EJKmDiXDJ+zK27gliKKYmMKFPf184s1pxPaWTmh8aGqGA==
X-Received: by 2002:a05:6000:11c9:b0:38c:1270:f961 with SMTP id ffacd0b85a97d-38c520b7c7fmr6273398f8f.46.1738267273958;
        Thu, 30 Jan 2025 12:01:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b547csm2880284f8f.62.2025.01.30.12.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 12:01:13 -0800 (PST)
Date: Thu, 30 Jan 2025 20:01:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: linux-phy@lists.infradead.org, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, Linux Regressions
 <regressions@lists.linux.dev>, David Laight <david.laight@aculab.com>,
 Vinod Koul <vkoul@kernel.org>, Adam Ford <aford173@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, Anders
 Roxell <anders.roxell@linaro.org>, Adam Ford <aford173@gmail.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: linus: arm64: error: call to '__compiletime_assert_536'
 declared with attribute error: FIELD_PREP: value too large for the field
Message-ID: <20250130200112.6ba7316e@pumpkin>
In-Reply-To: <CA+G9fYsHGrgZsEEVvP0XMcAhLyCYnrCPgZJ1puT6cfQBCGUB9g@mail.gmail.com>
References: <CA+G9fYsHGrgZsEEVvP0XMcAhLyCYnrCPgZJ1puT6cfQBCGUB9g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Jan 2025 15:22:06 +0530
Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

> The arm64 build failed with defconfig with gcc-8 toolchain failed due to
> following build warnings / errors on the mainline linux master branch.
> But the gcc-13 builds pass.
> 
> First seen on v6.13-9485-g72deda0abee6 on Jan. 30, 2025
> Good:  v6.13-9338-g05dbaf8dd8bf on Jan. 29, 2025
> Bad:  v6.13-9485-g72deda0abee6 on Jan. 30, 2025
> 
> arm64:
>   build:
>     * gcc-8-i386_defconfig
> 
> Reported-by: Linux Kernel Functional Testing
> 
> Build log:
> ---
> ake --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=arm64
> CROSS_COMPILE=aarch64-linux-gnu-
> CROSS_COMPILE_COMPAT=arm-linux-gnueabihf- 'CC=sccache
> aarch64-linux-gnu-gcc' 'HOSTCC=sccache gcc'
> In file included from <command-line>:
> In function 'fsl_samsung_hdmi_phy_configure_pll_lock_det.isra.10',
>     inlined from 'fsl_samsung_hdmi_phy_configure' at
> drivers/phy/freescale/phy-fsl-samsung-hdmi.c:469:2:
> include/linux/compiler_types.h:542:38: error: call to
> '__compiletime_assert_536' declared with attribute error: FIELD_PREP:
> value too large for the field
...
> drivers/phy/freescale/phy-fsl-samsung-hdmi.c:344:9: note: in expansion
> of macro 'FIELD_PREP'
>   writeb(FIELD_PREP(REG12_CK_DIV_MASK, div), phy->regs + PHY_REG(12));
>          ^~~~~~~~~~

Yep...
Broken by d567679f2b6a8

Preceded by:
        /* Find int_pllclk speed */
        for (div = 0; div < 4; div++) {
                int_pllclk = pclk / (1 << div);
                if (int_pllclk < (50 * MHZ))
                        break;
        }
with:
#define REG12_CK_DIV_MASK       GENMASK(5, 4)

The compiler has optimised (pessimised?) the code somewhat.
If pclk is very large the loop doesn't 'break' so div == 4.
It then does FIELD_PREP(GENMASK(5, 4), 4) - which is an error.

	David



