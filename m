Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728EFCA6B
	for <regressions@lists.linux.dev>; Wed, 29 Jan 2025 13:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738158607; cv=none; b=Ge4W8emvkxxVRzOItbK9/KL58eYj7xHAVlbSGfo3PqVnpx6PxC5heuPD6ekD86ik0V3lhDhHUCHtcv9ng7+kG7qC65mnmFN5j7zNJCkcOU5v/y+mOvViCeaujSFlnR9nXk9QYPFX1VHQS3VAaB4msIux5KmVUBRIQSJZsz3Yqkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738158607; c=relaxed/simple;
	bh=dBykreLn8k1vK7gxPzsq0gNUUkHEVGmtIIocx/HeIro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UkTrpB2BBMcYdD80hK5pDcRhRGUQ+QWPiZMdOHUmNNXJjPFM9A2kGHrZvxFS41IyoaJGvFacgbA0S3NEySVq3r3zlbVl97qb1CrpgRlBBxXAcVG17JWLvsajD0BgqaRbVet8dOoymOyTBiuGfGfpOswWoeea2zZA/5e6HCN3EOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=DKkw8Vge; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="DKkw8Vge"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaeec07b705so1303860466b.2
        for <regressions@lists.linux.dev>; Wed, 29 Jan 2025 05:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1738158604; x=1738763404; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=75Qk36IR/Lj4/0wn0Q30039CDztY8/cW9oi3X8VH8Mo=;
        b=DKkw8Vgeh4EXBlc9gLIk4Y3rdzljk1AnVYJw9VFMdUZ1MOacVA96jGYMBup+B1hVoU
         MwRe2U4I2neM7yDJU4JCfUEMZttVpPDiDFurTmqiN3QsjAK7yLXOGO+XrG2nFPaLprOo
         dFpOWWU3fPth0Tmon8kEoLsZLZdsnJ7JtWyUt83xYU87i/sKzOoeIwdY+08fxta4JpIN
         uixNdxFzWsEiNShpQWHejwNXZHKZenDNhEb7TNU+3L0frSJvvE8OPj4xq/b4/ZigAE2S
         usW3LBY3H0OmI+HhdIfq1zbjwTNFz0KfmTEfjoim0Gip8CnPDgb/Z0106OpHjOCMLDrv
         V/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738158604; x=1738763404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75Qk36IR/Lj4/0wn0Q30039CDztY8/cW9oi3X8VH8Mo=;
        b=g+sK16us0n8eS8f5PJ4BIcSrePcgE6pckNbMbWS2dBsV3oSQdG5q2Pu9w7J2ZzD2Z7
         Eeu+ZQJYz5kO+bAlkuxDJraLypZd5GcrPqaMPWsKFXpYqqqSO6/qpMajZtDCZC/HQheh
         KqNpXUr8uv9CpHsRflcZ5dujDJqzZ7pB4vfIXVhVarG+Aean1dUcr8twLd29hbd2/Bzi
         94DO7B9B8Mn5OOLLdGH288zCfLEb8YnubOQjD0PzeuXh3HFvYTdJVc11PEkRS42TZ3Bf
         hqCAfoPmklfx8uzStoxgSNUOAqouQAwqB4RRj3C/UvmmyA4Eyso26stcKJtP5Fkh+dPh
         nmXA==
X-Forwarded-Encrypted: i=1; AJvYcCUKUMfuAVt7YdExG3DRtYTmfzTiF/BVqmqg/2O+8YqMarRrTagF8k/MpIzUu9x8fTxQmWTtfDwT/8+7rw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0BC71LTq5BF856u+H3qHOxD9dSDFaRnS63w/4aNvy6ErctwL+
	FMS/phrtR+ZN9IaaADKVliB22iVe69XIHqeyj0JHz+U5N13beUntLpOJaNgnV4Q=
X-Gm-Gg: ASbGncvkb0CAIgZdu3iD8Csn9a2GRgGTupZv0bncScG0q8qC+0wwDtwdRUDDjgDL3jk
	OBZNOVo53o2apQ/VWEVDwT+dii58bv3NMGto0tmcdmlpyKgIJKG3YOTs9rbo6VU/TefY49KrJC9
	cZ8eS3Kf5swrZEpV2HgPJtRyaHVCEB1aRXjXdskfvQ12edoarJZx5MBzhgsdYxVXV4qm8qklTMs
	yVfoikC0MmgWa4xXLg/XjLzWN83f+67JhaeP2WFzk5HjkLVeoo3aM38LHHDlHSxx//VbaoyJoJT
	dD3CpPyGXvv+Aq4MWFzrc/3WjGMH54pjT/4FX1q61dSG+NBwpw==
X-Google-Smtp-Source: AGHT+IF6V6wMn2HQMQcoHVmacevAxcGpFMu1haNotIgNNU36OH5DU9Ha/1LoSQoaqi7BQjhYZAfmvQ==
X-Received: by 2002:a17:907:7dab:b0:aa6:7cf3:c6ef with SMTP id a640c23a62f3a-ab6cfcdf31emr325837266b.15.1738158603380;
        Wed, 29 Jan 2025 05:50:03 -0800 (PST)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760ab0bcsm985438766b.95.2025.01.29.05.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 05:50:02 -0800 (PST)
Message-ID: <4eb662b7-f15f-40f2-aa10-5a3a5c1fc8a0@sairon.cz>
Date: Wed, 29 Jan 2025 14:50:12 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] USB 3 and PCIe broken on rk356x due to missing phy
 reset
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, FUKAUMI Naoki <naoki@radxa.com>,
 Michael Zimmermann <sigmaepsilon92@gmail.com>,
 Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, regressions@lists.linux.dev
References: <20241230154211.711515682@linuxfoundation.org>
 <20241230154212.527901746@linuxfoundation.org>
 <91993fed-6398-4362-8c62-87beb9ade32b@sairon.cz>
 <2025012925-stammer-certify-68db@gregkh>
Content-Language: en-US
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <2025012925-stammer-certify-68db@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29. 01. 25 14:36, Greg Kroah-Hartman wrote:
> So where should it be reverted from, 6.6.y and 6.12.y?  Or should a
> different specific commit be backported instead?

I think this is for the others in the CC to call what should be done. 
Heiko said that backporting the DTS changes (the other commit in the 
series) is no-go to guarantee backward device tree compatibility, so if 
this commit should be kept here (and in other branches where it was 
backported to without the compatible device tree), patch like [1] needs 
to be added too. But AFAIK there is no such commit available.

> And this isn't an issue on 6.13, right?

Haven't tested it but it should be alright thanks to 
8b9c12757f919157752646faf3821abf2b7d2a64 present there.

Regards,
Jan

[1] https://lore.kernel.org/all/20250103033016.79544-1-amadeus@jmu.edu.cn/
