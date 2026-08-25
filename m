Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C822481644
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665254; cv=pass; b=QpAOAGi1uEvGFscovPHvKJhhu/XZrSHtUtIzoiegzdF46XXlgWYb3NoqAa0JzfcQwxAuOsjrfpW3fCBeGr0pcL3Jo6VsRx82Q0SqDXpxmla3iEp2t4hCOLYvak1+zHkr7VTxyb8WsSo5PfiTsNy3NowXrflBcpu9zKsG1gn7/ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665254; c=relaxed/simple;
	bh=hvKyXzgJppJMaaEEyd99Thc93IbcMAS25L7bMTUdZT4=;
	h=Mime-Version:From:References:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gg+JvgyPh0Xy11N+oS6t3V6pfQ/Bn5tSkO3DlbYBvjuxZjc0ZMYa8P6LSLHu0EB2qNeOCcgJRifRJpPUivQ+Dx+0ALpbaAf6FOtYKOTRX1N3WyzkhLCfPAQgUt1jzXx9KLK2VIgevTSeDeZOj6U7CPvq+WqE7d+k/RK/SIZRyoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuxcmIqb; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuxcmIqb"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso5366168e87.2
        for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 06:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787665250; cv=none;
        d=google.com; s=arc-20260327;
        b=PrRTb2ca/PtXu3GwDqGpXIj+x0AmlBgw1XKAA4JGrO3Y8sPWJCg2PIdamHGlQFt1tu
         ahMkf+UFDQnUItR9v2OYM3ejFMsQJwCPBbetApGZudkG9sxAOQNhTMunoVI5SC8KiWWR
         Itg5F9J2o1zx8IgkQrlizqF8CVDYfHRNmTIbwrLFIZlAFK//XXZWYmYo0F8K9US638mW
         eklwY/xKg7INK1eLhgCxJLSVPydS8N/TlY4QaES80OccECVWBPbL18nTl71QphqIgpDP
         ObhujW4nkcBzrgmmJvdgTIil7E1+WnqfDQKZ8KPftwcxxa/DaHfH0JtR/gvpaMBFYwpX
         ypWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:dkim-signature;
        bh=hvKyXzgJppJMaaEEyd99Thc93IbcMAS25L7bMTUdZT4=;
        fh=t8ldjdsUbHtkIzTgeHmpdnCADJAst/gea+e0hCPYb9I=;
        b=dc+MFNywPLD++PTxdq3e0N36qksEXcGaHy33L80E9xvKwN6FL1wFXvHm14QzEjfxtC
         qzrbxxE5GQ/845DuujL2C2s4Eh0A2Er6Y2VHgATVfLANc3+lXF8ny+bOcxfYeX24Pxfw
         3RiDb4tI4OteChlkQk6BdShGlsspNDngWDKRHSfvvtKeAufsWCWF/cH+0H2cPftlEZ6u
         txIcUSnQrAN93KHe06w5Bklwoq8yzhg/mAAWZ4gN8bBFAKYt4LZj2MWTHsflhQBG4NMt
         3vRjg9b1TZu539gFOMEjg5Keq70Guqbrm9vy2DAg+Omva3mrauqYSAaWCgSmJcIMPFhM
         gAqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787665250; x=1788270050; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:references
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvKyXzgJppJMaaEEyd99Thc93IbcMAS25L7bMTUdZT4=;
        b=kuxcmIqbYa7OW3+oX6km8eeYKxuu6sh85rnrD/OHtuG7UqGeLWTPoRIFB+NSjtPXjR
         anruv678wGMIh4cQVptsubiYd+7iOLMKycOeFj+LNCSBGFWSBD06yxixlyGVRR84TGX7
         xT652LTzEYdqBqGJUs5CCYlUt8021EHykMvRlw8YtJi1SvDzh+2YYD5PLNysWAfvsz/F
         M/hBnxkDzwS2K1we2SP8bmprLwTCiAydoxh89mWjl6R46bESJK9BPDmCXz31a8xyM1n7
         3AEYhx364aLjFz5iqv+oTunmn3tret0mqgaya2gOiFGCkIDi4F07uN9274gR8vR4m3Xb
         IilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787665250; x=1788270050;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:references
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hvKyXzgJppJMaaEEyd99Thc93IbcMAS25L7bMTUdZT4=;
        b=d/GkUeEetSTqgEAqR0mVsPz+VF7I5Jsq6TKlwasu/rMtGnbbzxvSh3mmTGHCeE6k+5
         zy+zl3SaGPzpg2W9MC0LCeEqvf15QuTwaq5qRPi/7aqaAJWq6conHbU1IAYdFK4RGI8g
         ztLMRPxVNAVC+Qd3H6tZu2IiM97awuSmQxqZOkFGUlIWjWTkuJA+ipS7LkXSTu79pFdo
         v+wjdOJzGphZVFq+bNqTc9I9kwUlU6mE0ddAoveAs445eSg0ulkPUyYjwwS/E6vbf6Ax
         R2XwerS/zc1TWQJ7lWCwtYeok08y2cvSKuIImxv9A5Y+k/MpgXS/oe0aG4Y1+ek392pV
         wJ5g==
X-Forwarded-Encrypted: i=1; AHgh+Rp0mhPpT3Kp3KUeIwwJS9kTYaWJ6sR+w5LOkx0rMXOCEw40S3sHpYqNkkUIe7/AOb5fFeQrUHSOrwL02w==@lists.linux.dev
X-Gm-Message-State: AFuF++kFq1RWfhAC6sUVqS7Cy4L0FPlQYIdgc56BcjcM/ZVwWdWzFaUK
	B69YviCDWYgRC2nPbITe8IGf64L2YHQR/xWCf7Ib/4XTjAtJIrwis9IiUXIrqss44CNU9JpvpM9
	/ZmHAPPzw3Xlm5P9UTJTY1654QvHrPMg=
X-Gm-Gg: AR+sD13mSsUmCyiuyfIQZlQQr8X3FnA/rhgcU5NlSP7N4pQdNa/jcBnrC5xDE3vGPLU
	op9Ak4sNnBvUmHE8dfbRZxIyRPCbIjW/7DFUmib1d/beaZhZNUdNbwLdlSsovHXCtnOaV3y7GS/
	l0Nrgt8lHtQeBUiGROUzRyU6YlwIqUZwiiQXRzh7lJ2/eBwDLOvcIu/J90VOcm+4vQSAk74BJlb
	Ztgyn7xNuD9ZgUzIBwmpeF+8ZWZyhaGQ37SWyuxLBRG3BEPuAPeKJlVSjxmnohOOIP92PcKXMKg
	tOFLTsk5lpb9G62jJ3whjoeXQVM2dtNOty2lKQ6VF/E82xX44wb9B7hlRBU3MVkYUxfKajAZE78
	bbL+L/QoZk6Hp83h1cbiRY6vP1LhPWxcpaootUUfMNbgV9lkglFMM5f9oH8pW
X-Received: by 2002:a05:6512:3d1d:b0:5b1:5a31:86b2 with SMTP id
 2adb3069b0e04-5b4842513bcmr10922031e87.16.1787665250199; Tue, 25 Aug 2026
 06:40:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 08:40:49 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 08:40:49 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: Kamil Serwus <kserwus@gmail.com>
X-Mailer: aerc 0.22.0
References: <20260824053227.317496-1-junjie.cao@intel.com> <77f94165-3d5f-41de-8969-c7318284fd6a@leemhuis.info>
 <CABBYNZK9ax+iw7xKBtdZTSERsdhQ7t41Bg_1EnG88KOYj6kFHg@mail.gmail.com>
In-Reply-To: <CABBYNZK9ax+iw7xKBtdZTSERsdhQ7t41Bg_1EnG88KOYj6kFHg@mail.gmail.com>
Date: Tue, 25 Aug 2026 08:40:49 -0500
X-Gm-Features: AcwNN1Wug9vDtoOA1TaKYTIovtZeS8SWGR2PbmXd3NJe-LYW9VPQ6Emgzep44ig
Message-ID: <CAO+VTThX-p5sT7sDVsr+Yqf-rWBdWHEBdEyWvDNbqZnwdwhfvw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: limit RTL8761B BROKEN_EXT_SCAN quirk to 0bda:a728
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Junjie Cao <junjie.cao@intel.com>, Marcel Holtmann <marcel@holtmann.org>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexej Sidorenko <alexej@sidorenko.cz>, regressions@lists.linux.dev, 
	Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org, 
	Kamil Serwus <kserwus@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Dear Luiz,

Yes I use this version 1-2 days. It works for me (with reverted code).
(as the same as before commit 5ead2063611ae56809b1b113ac44cef9547c81d7)

Thanks
Kamil
