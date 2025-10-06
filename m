Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E45721576E
	for <regressions@lists.linux.dev>; Mon,  6 Oct 2025 11:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759750321; cv=none; b=ESFdzalSKpwh/NiHpikcLqUzAu22xAlXGvDNFibkTBLjo0BzLi8QHqVYb7g6UNhjxOER0fSCDSwJh3tjN/VBcVcjJ1BsvyDS8JkpQ6SdUoGm0gVylbgs2QfJQxKPYbYlEC0BtnpQSPs2bHCLBRDIJE09ZvflpMnLd69EEK1OW1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759750321; c=relaxed/simple;
	bh=e5CBSXrn4RtHdVZca6FSaw5ibW+hSpYdEP3TSjb1z80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6c/BTYjYe48o2SLhhOvjcEs0fYEO69wvQ7tqsY1s2pKuZWnzkKRH68st18ZO1pLJaIPwRunoyoJ8uYuiAOpP+RylDU9FZaEwfYtAB0h0Q30Io+Cpt/tDlU2DG9P47HzOIpDetLEUb3o+v1oWktefzTs+iZ12VIDSzZeCw/cu+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qL56gTDW; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qL56gTDW"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77f343231fcso2905302b3a.3
        for <regressions@lists.linux.dev>; Mon, 06 Oct 2025 04:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759750319; x=1760355119; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MCdUfSq56tzjd9BJmamnogQpujr952D9LtJP/K+DvPM=;
        b=qL56gTDWmO1iAo4gz8bYIWcsV/thQIqth9cxZoNdzWAD/RBoFyvvBtdingcnlp1ujn
         v9mZzgL21NYSqAAzm/GGBZsVH+C5zUe6RVrVbSEQy8IKhJLXYWP00OgnJJW+933noCXj
         JI/uAAh5jFpAzmweXUR00RkOGROdfpGnfQoAw9akZ4zPZw06ihJMeeOfk73824TCAWet
         5HrmNmsh17WOTqY3bfc0z9aN8gsZnoOLTdI/KckRUeRJkXAWmiY2uq9uzd1sA9WUj0Wd
         tckTCfiA9/dzkgISEXxHhoZqn1e0sp6TFsy4YScbYvRJWc45mm36tMC5J6e5D6Xyb+pX
         eciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750319; x=1760355119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCdUfSq56tzjd9BJmamnogQpujr952D9LtJP/K+DvPM=;
        b=UTbXVGW3wXz7ulx8ACUWVAeovi0W8mctNU0YvrNmaUBipkDGop7Spx3J24GEdcQAxF
         556DNKElPveIK85wRYXt8kFFDgDPK3dflOFESr3lzIoaBiUaBGx4uszyDRGhfIy4112H
         p7782H/iNHfLqZtHsClZK7dFYunrDu6IGql7tXmQXNtT04fRK0E0eNYdza6N/WwVyL5B
         ShPXhwQQqGlMEVdkJiTKEeEg616nsiPRj5AaO81Ev69/LOhk2c0w/eUz6KKnmqPVHL9a
         tGcYB5+S+DZ0n/yn2vezP0jufdwWpgpZrwFoe2hcgynN8jDMjGq9YmEkLFSsK2bQBJfl
         7VUA==
X-Forwarded-Encrypted: i=1; AJvYcCUn88gDNbLA6EelNx7AGj8LELJPvtxUKi4nwvYv7au6zI9QjmkMCsmAqV647mdDXWk4Dcru9kjmaXXTTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf/xcllaELRqY3DQKsfZzWsMtYTAsJAS0uotzxpK3/qJWdNHKJ
	/gt4kEBRErQ2yEOI77s6feXxP8TVmcwMn0FVULZByoEP3d5rnxiqodLpd1pQbWY53hbZ2NgoH9b
	raePjZSijAL1oHfaoUuvDPyOjMriPq7QXRVK11e7qkQ==
X-Gm-Gg: ASbGnct+gDo5RZMUNXuuLb1GXskO+d1D4NFS7YgZL6a7l93g7ZjQrkPtCQ3fZ9caA3Q
	aQZ1FQpwQRbaiZb5o5EpzSV2nAE+JcEfH9l66bl8neNnu76KrpwrwGV8XoE5V7P080r0BYga/7R
	ZhiG309GGZcbLsmTIDvDQgHLY/SdSXCPi7VUfoMkFEURp4jmeYJ1q2h0JqS3E9RVaiQHWr7OdQW
	U+WbmVd5BpYT14JT9CH/XrKXgAIVYjIF2mNwhlUYokrjE+urRqgcB9qFdnhbZkfVRkfawN2FF6W
	TnR7KyKfJUfcQ8fPSfQt3w86Y/lC8Pee+g==
X-Google-Smtp-Source: AGHT+IHk0BcyHGNjd8fw0KaD/j6uqPvdrOPp0sarkJmj00XawyQpO8GAec8OzHweFlDyK5jRXRrJR1iEX/aJ4XaNBSg=
X-Received: by 2002:a17:902:c94f:b0:267:b6f9:2ce with SMTP id
 d9443c01a7336-28e9a6dc5cbmr138177325ad.41.1759750318721; Mon, 06 Oct 2025
 04:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYu-5gS0Z6+18qp1xdrYRtHXG_FeTV0hYEbhavuGe_jGQg@mail.gmail.com>
In-Reply-To: <CA+G9fYu-5gS0Z6+18qp1xdrYRtHXG_FeTV0hYEbhavuGe_jGQg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 6 Oct 2025 17:01:47 +0530
X-Gm-Features: AS18NWB4sx-MUkILVHxbXiSvIkCbaL1n4-3C_QY4dTO4nEO29p1EMqNEWalh0DA
Message-ID: <CA+G9fYt+9QZ4TwEx7+m2S5Vtn7cq1N54oGceSR72upZJTrzkng@mail.gmail.com>
Subject: Re: next-20251002: arm64: gcc-8-defconfig: Assembler messages: Error:
 unknown architectural extension `simd;'
To: Netdev <netdev@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-rdma@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Patrisious Haddad <phaddad@nvidia.com>, Michael Guralnik <michaelgur@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

+ linux-rdma@vger.kernel.org

On Mon, 6 Oct 2025 at 17:00, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> [Resending with typo correction in the subject next tag]
>
> The arm64 defconfig builds failed on the Linux next-20251002 tag build due
> to following build warnings / errors with gcc-8 toolchain.
>
> * arm64, build
>   - gcc-8-defconfig
>
> First seen on next-20251002
> Good: next-20250929
> Bad: next-20251002..next-20251003
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> Build regression: next-20251002: arm64: gcc-8-defconfig: Assembler
> messages: Error: unknown architectural extension `simd;'
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ### Build error log
> /tmp/cclfMnj9.s: Assembler messages:
> /tmp/cclfMnj9.s:656: Error: unknown architectural extension `simd;'
> make[8]: *** [scripts/Makefile.build:287:
> drivers/net/ethernet/mellanox/mlx5/core/wc.o] Error 1
>
> Suspecting commit,
> $ git blame -L 269 drivers/net/ethernet/mellanox/mlx5/core/wc.c
> fd8c8216648cd8 (Patrisious Haddad 2025-09-29 00:08:08 +0300 269)
>          (".arch_extension simd;\n\t"
> fd8c8216648cd net/mlx5: Improve write-combining test reliability for
> ARM64 Grace CPUs
>
> ## Source
> * Kernel version: 6.17.0
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git commit: 47a8d4b89844f5974f634b4189a39d5ccbacd81c
> * Architectures: arm64
> * Toolchains: gcc-8
> * Kconfigs: defconfig
>
> ## Build
> * Build log: https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/build.log
> * Build details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20251003/build/gcc-8-defconfig/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/config
>
> ## Steps to reproduce
>   - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
> --kconfig defconfig
>
>
>
> --
> Linaro LKFT
