Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C9E14D43D
	for <regressions@lists.linux.dev>; Mon, 23 Dec 2024 15:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734966536; cv=none; b=kj9wyw0OLb9wAH0ZK+VvPPOJsZID+UCEPUyPC1uy5rsfC0L5NbHgg07/WHqSP42d0BA32abMF097uSspznueSrOGr9mWpS30v7RyZDWZc2hORBvU4fDwFa4axogCVRjwMeNXd7cPa2zMKkGTAMn/qofDBpIt15OTq3lYyc2mnWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734966536; c=relaxed/simple;
	bh=5kuDSeTzV1Jw0BuP6ho8M1FKxQboDclJcHPZg3xW6zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRj7RfaHCdpK8QZPILKmIGqNj0uKr+C8vNWlLSSeSC4U05myaU4Rch9EY4Cc901mFcwNdkLHjD/5MUqQls2PbnAfockC+Zb1pwkWQDOThpXnGTBgyPIPO7AV2K037ucye063ke0ZP4f1xgfDTpumSKIIfzNS/u4PfqwNC34cdnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiDyW1En; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiDyW1En"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee534d6800so807312a91.2
        for <regressions@lists.linux.dev>; Mon, 23 Dec 2024 07:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734966534; x=1735571334; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF0sOZnUj8sAyucMQ2ztc2c0IcnVX/ElkSfDdu250GM=;
        b=SiDyW1EncRz7pj5RuB9ALM6CjlMbWEWysFDEa0NVdr6zNiX+eUiw+LDmfG3LL0oXqs
         LAfdcgR3H9RwuCTBZxj+VuWHsG5+eFrSX6nxYVwN/76r4mWum2CLImajMhc2cCGvA/un
         4/R+iwOga6jXyEAoZtmP+bgfwnsh/skHBZr0i/ZCrADenL7gqiOicSmM4I6tE+tuFF60
         md96PFthbc1/Gb4ywDd8n5afmJ9tQL80JhMOB+pyctrCp3EIn/vgTLSAFskejVhtyJH3
         sBm8Od1Ur9ydTVnQcQROktL7FnSc9XLaUwKhJoKwenH54vOxyO2AJ0akfq4OLe9bNzJr
         qeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734966534; x=1735571334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tF0sOZnUj8sAyucMQ2ztc2c0IcnVX/ElkSfDdu250GM=;
        b=A+dZ+wbBDF0/o7u261h8yCwXXrnsIvixbdirbCj8gGQBBABYensSbKbnbyti5BUq9m
         gSZ8Fo30ALERyonEeedV4dePbZ/3MqmLKxFjvUM1sjjuiJ77Kg2Lzf4J3El8PnRyx+Jm
         wHvZzl/hdt+CNFwo6h80Rm70y2p58HcnLkVBeC09TmKQNBrUG9bWRmgZ/2Tu36/0X++F
         yjmzyi9xknCijoeKTAi/S2Axfswqe3Kie4hpCM10eZZxtNItZUBEKvROYwyLeDzIFJsM
         xuGk3/sqgA/vcr12iLMROygfTpwuCgb4+4kFeM8CeD+ANhUhTfU+oDxH2qc/FkNJRb++
         mYMA==
X-Forwarded-Encrypted: i=1; AJvYcCUw6wF1jVaVy9f/j4PxDUHMDe6u45dPT6dw8Q6RoRdpyfr2ObLbBXfe+/9MLjVSqcNFmAGQR4tsMOjN8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbgsSV4JijXgIImCO45KeLQag3uU+diV3w/YRLOvnpS8mYq/QN
	r+xr4VDu32Ym33BvGbkybFAdv75gxAzvqNU/PYV6fx+Bx+bA5aLogas6YvtLPh3z8FXkoxjak7w
	4jW6CM2K2t90uCwCYg2CF2skntdE=
X-Gm-Gg: ASbGnct30MwuOiFvVYdZat4vlheip97J6MHxL7hLZXp5UisQi3fSe8qfDKzba1I08Yl
	KYplL4pNZcjZHcSWmf/WecBTosP1I3KGS0jE8sQ==
X-Google-Smtp-Source: AGHT+IEkapHYNlUUKAjZj8egJF18AjyOabciUQrTJCmtjvX4x7gga/YoC2xZlf0T/eu7KxDIYeGVatztWXLKQd3DHZE=
X-Received: by 2002:a17:90a:c884:b0:2ee:b665:12ce with SMTP id
 98e67ed59e1d1-2f452debc21mr7690176a91.1.1734966534558; Mon, 23 Dec 2024
 07:08:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <D6HQK0PSRVBC.XEUGZC9N1O5K@svmhdvn.name>
In-Reply-To: <D6HQK0PSRVBC.XEUGZC9N1O5K@svmhdvn.name>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Dec 2024 10:08:41 -0500
Message-ID: <CADnq5_M-aPD6tNppQ3_6dC8dgt7zeLXZPE5CdCjQEuEDxS=mWA@mail.gmail.com>
Subject: Re: [REGRESSION] amdgpu: thinkpad e495 backlight brightness resets
 after suspend
To: Siva Mahadevan <me@svmhdvn.name>
Cc: alexander.deucher@amd.com, regressions@lists.linux.dev, 
	stable@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Xinhui.Pan@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2024 at 4:08=E2=80=AFAM Siva Mahadevan <me@svmhdvn.name> wr=
ote:
>
> #regzbot introduced: 99a02eab8
>
> Observed behaviour:
> linux-stable v6.12.5 has a regression on my thinkpad e495 where
> suspend/resume of the laptop results in my backlight brightness settings
> to be reset to some very high value. After resume, I'm able to increase
> brightness further until max brightness, but I'm not able to decrease it
> anymore.
>
> Behaviour prior to regression:
> linux-stable v6.12.4 correctly maintains the same brightness setting on
> the backlight that was set prior to suspend/resume.
>
> Notes:
> I bisected this issue between v6.12.4 and v6.12.5 to commit 99a02eab8
> titled "drm/amdgpu: rework resume handling for display (v2)".

Odd.  That commit shouldn't affect the backlight per se.

>
> Hardware:
> * lenovo thinkpad e495
> * AMD Ryzen 5 3500U with Radeon Vega Mobile Gfx
> * VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
>   Picasso/Raven 2 [Radeon Vega Series / Radeon Vega Mobile Series]
>   (rev c2)

Please file a ticket here:
https://gitlab.freedesktop.org/drm/amd/-/issues
and attach your full dmesg output and we'll take a look.

Thanks,

Alex
