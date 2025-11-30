Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1091F4262
	for <regressions@lists.linux.dev>; Sun, 30 Nov 2025 06:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764483595; cv=none; b=XgNRR4jRIa9R3SxoZBc199LT7Q0zkA246S4CB8xFbdq9tVC3/9bdSj5Ixpeci2M9n7AlxvrINNRtisSy7xp8t3/9RDKzdtcPgH/SYhMCRx932IiKf9vY2+SqOKHcNJ4WnhfyB1BW3fOctykZ/kWKrkVdwAtl05bOO2GkcysuZuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764483595; c=relaxed/simple;
	bh=sGhdmqu2vDJdYvpv29T3Uwo4nDJRMdKfogH8RLeMRKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MAcATpgci0J293yE93jp8rhIFLQhgwdy1WHmxs9KUrLDOowZNmT9iI5ZB2PLgrZqCcb7YHZCo4SuKYuyR/AhYGTwqwD4wutwf5g+jWolSwFZa25UwhngVwSe6XhNjtrVB/97MiSMjvQ/syfRsky3/72XLqV5OZzzf8KrOLdEhAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcjD+K3V; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcjD+K3V"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5958232f806so3572151e87.0
        for <regressions@lists.linux.dev>; Sat, 29 Nov 2025 22:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764483592; x=1765088392; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sGhdmqu2vDJdYvpv29T3Uwo4nDJRMdKfogH8RLeMRKM=;
        b=lcjD+K3VQIuOzXyW8dhvsftO2ZZr4kflA1snsWRjrNSIB4F/zUC1oSHENwfTEy8mhC
         mrsHXbg0NqALxWDAMDN3uaBvPGLoC9sMQFVnnvpL2PsO2bDylGWnw8lLZ4t+m2Ucx5Bb
         3Xo4jFTwvCtF/jIWG2bBXGBhJ3WFYMNF574u6ji2M6j2TWSHIfdM1eOQW3rEQxMc5Nx1
         bGkgS7yJRF74tFhobBrflH+LfAF12Un6KynwP9fKgpAB12letbPJMuHZmV3sX2djC5lW
         b164YW0SySEiPf/68HctvIKMc9mweqSBTPE1ATNU5W38ZFgGeyPjGfS4Z6DYTFDE7Sef
         Oyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764483592; x=1765088392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGhdmqu2vDJdYvpv29T3Uwo4nDJRMdKfogH8RLeMRKM=;
        b=r2YLyAIVtnRab06Rx+jIscuwdKa4mCKTiDdYOyZq+CbJgCQGU2dhnkf7oNx3i3B36q
         +3yaRD92EPvoSaY8E6THCBNZsRaBQWtjrEEUP3+hcO8nqJNIVhSOCRoSjwETg/GI2m59
         8It0IRTzT49sdybs/A8tEH69Ki2VcZ5OOVXDiXCJJoBI+dX1uF36UuK7iSDAgieUs6Zb
         uL0APi4oqQ/d8egagi3isXQuOxeLDLCf6pekzzININ7l2DuMGnJPfAgdmo2Xr0xkxE68
         22PdoiaXQesGMUDJN7ota193tBOrNZtppN4hxhftf3hBSLOZ7cG0Q275Pm8Tf7DRXpMi
         TxOw==
X-Forwarded-Encrypted: i=1; AJvYcCWOiWAcqNDMTrGr2KAOvzXDtDBGTW2OFnxDd5RkOlwDm9FthOI4c3fmAQRPDLd5fFgnaP6qNjxdTaURgA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn8+xvXRWwqFk/wCL2ISkkmr1tun4PxRGJcFGyKPAIqiQUAr3C
	dMkSmGXFKV+gmdr7hjHAEIjaXzX/tGKHy0Yh1JpQLLRNulRJf3T8FXEm/zvDh+lPcA33qx2B/R2
	bs7NYW3J/WKnEs1Zcudmpzd2TKOsidsI=
X-Gm-Gg: ASbGncv2/ikLXkfsb+B7b6NXOkmfQTUx6qCCnHnhM019kLX+sm91WThm2Z9ZckLxJej
	3PRdt6Rgh/eQce9chUWl8N9puWDwAlV75Ck2T6tIGcvOKHsKI+zJOHF9hNXzd7hmdfgEXKCkz6E
	u2u5cdfMj57Zkvfs+laEuj8b2dBAVoIKpXnOzO8YuvVrHax2u11IKoHySqUtfOc3hGItLqxML9o
	RvbYjfUyjEcD1yJPSfrosPtbGxSH569f9Lf03n9Uftkak7TpRgaXNpoQRufWWJ9DdGhZuA=
X-Google-Smtp-Source: AGHT+IH2MO88uScxHMDf4tuCIJ0inMzI8LHCRFJ99as4ydVsVd0gxL3pNkpLASlnUmvk3UX5aKHdaBU5Ofumb8OBKCU=
X-Received: by 2002:a05:6512:2353:b0:592:f115:292d with SMTP id
 2adb3069b0e04-596a3e9fc81mr12809517e87.6.1764483591650; Sat, 29 Nov 2025
 22:19:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAq5pW8q6V7x6qpYnE3xB99nVwE363keGiu+Jax0_zqPjogULw@mail.gmail.com>
 <CAAq5pW_saBZ+52zz2FYTt9SuWXj2KwX2Ld7AggVKAzca2m0Oow@mail.gmail.com>
 <CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com> <CAAq5pW8-j6UzruT=SU05QgJ1AjLXeUwASLJ3O3SVKttaMbdTXQ@mail.gmail.com>
In-Reply-To: <CAAq5pW8-j6UzruT=SU05QgJ1AjLXeUwASLJ3O3SVKttaMbdTXQ@mail.gmail.com>
From: Evans Jahja <evansjahja13@gmail.com>
Date: Sun, 30 Nov 2025 15:19:40 +0900
X-Gm-Features: AWmQ_blI2ZZ1miUiA1xU7_l8uXC2UgmK51gDMeqlxRs8s6ycdOTn1lyROifxPJw
Message-ID: <CAAq5pW-PLFuUVa9t_gmzhcrMsNRTruh7cD5-i5OPHp0zYfdFHw@mail.gmail.com>
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
To: "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	matthias.bgg@gmail.com, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced: v6.17..e72d63fa0563
#regzbot monitor: https://bugzilla.kernel.org/attachment.cgi?id=308962
