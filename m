Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919337;
	b=KNwN0prdJFeV5CT2nPLFaMBo9tIOsx9lT90R5tzeWzPfqpGKsD0RBnWcSIF9hvA/brHu
	 3v+xsuZ5TVcTopYJLTpJI8k/5TKiXNJrHtUjfvikGWY1jDalAY9Sf4oo3T0PJsD59tT16
	 nIpx+XFQ6YTg+vzpkC3IksoAaqdVGJoJ/cYh91TR/vRXUW8dU0NM26g4Sb0Yec8qtGEbc
	 kgjGjvx11Mpu56fv7YO6mE/JBrNg8Dy9rY13KUTM04MnUs2aF2114ho3SDgRnjHvrCH+Y
	 rWgp8YLuZrjU8WV3/fioNRrgkf9Fgy7nZcT8r/X1zkYzm/7BrUYT7tDgUZQOHviDY+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+WEBtr/8JSNohNzv89EN8vX89/+poqMMTCUuO0C1p1k=;
	b=BxhdZyGP2dvxgNgmqhQWgb45iSuq1sqPFI9Bn9Ty8c+x0vPGJAAdOL0HUw3hJA3kyHIT
	 JwgcAIwo1TPujTTaqxlfSqw18HT8x/4omZAZNceIt0gRTTN4DUHK1Z8ruJvAN1ZcIm7Mb
	 oAY7cIRGbuzmiOBl0k8gyAcyUY0F1Tcs/dZRxQzqZXAIMi+pjiPFAhbUBoCGNWaZlEcrl
	 CY7+MjbXCBwBP8CRFmUoSZ1shbquAxCxDZ+OkA6aoq86HB6AXhsUGLsUNKP+TvKVQOoLW
	 6BrQxFk2ZSUFdAzFl745l2k5CZkqyJyFic9JQ/zVLEIg/z13XuVU0/81tNMtF355LSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZYw3CusK;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C945606A323
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 12:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C945606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZYw3CusK
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso494899b3a.0
        for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 04:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794919336; x=1795524136; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+WEBtr/8JSNohNzv89EN8vX89/+poqMMTCUuO0C1p1k=;
        b=ZYw3CusK+LHUNFYRTHSm9umH/gnCUU3OBoh7E4vwJ9W8AwYQwGp7i+ZnCkSO9y07cn
         4F0QCdLnVT4i2FaO4Hgyz2GE3F26vVyA8Y45wboFemUYzx3ls+iHh18VljitdFc45yAS
         BpFTELm724jBeNEgAn5i9TiVZlecqtkgXd+Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919336; x=1795524136;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+WEBtr/8JSNohNzv89EN8vX89/+poqMMTCUuO0C1p1k=;
        b=xOhpJPitKXocS1PBw93h0HauttQUHwHljLP59r9g3uiWHQ2Lar+oIFexZ6clpopF75
         WlQUVHmXehJq7YBlLKCG3E+yKIKTEqiDmuebjY0Fsz/GyoeVN5Wrqa2IC5HD9ktbcshT
         IFUu13+leBY8k+Ql01098vzk0guZgXgel9rLbBGCtEfiOiZ10U6hG2zuDSzxIfEo2mDu
         fdIC95II6trQu8kZhlF3PtouGjrOuh+brFbhFWfFkCpiESycsE4W4piCvukugVhnHN1f
         DK6iajZk5KynoCYViTejGAuKz+88+E+ViUmxe18Bx8AO+n3zVBo+fQqEDjyBDflz8IXV
         pJng==
X-Forwarded-Encrypted: i=1; AL+hErGGD/sbKAhWjf5HIlrZoloj4/AP9B1olFE1FG8XX9A5l7DIStky9l1CH2so/9EYQxdVIKBOtLCEfA820w==@lists.linux.dev
X-Gm-Message-State: APuU4Z+HCJAf+URuc5V3CxVWSDNXa8GUiq/v1lS0bRGaS1UFIlwjhrh+
	KptcmPajO5r9gFyTnbr9xw8V72erw8TJ+sfKXJNnZcd/k2OIAKmyZrM7KEpUXImA6vXrS/p0Zz8
	Nx+0JG6Gq
X-Gm-Gg: AYBFou3IMDHyaFsmmfPW0MnhNcKFK5aBRginBgwT+f1j0Rouc/vGyipCjNQnWSrfl7z
	Xi92+G2NXEKhqRziyy9xfE66xxhIYQkl3LfmXyqhYn0YYekwLDfo0pMpeUzR89ha+pRTHscxzln
	aoL1MrOv2j11sqkaplNdv2iJKXdjrPUkP/rgYfIt4XDWGKa7gu/zkQ7T3e9rPiSaD2+AwG3SZGO
	UuVlXsxD1bGfCv3Zj1vyl10a73aDw1XhoniIc+sAJi2IhNHUFbz54f1MdAgNFoGtr8jc9uBjwSD
	h+XhZ2SJQ7IReYw7w8TV50hVP7x5jSyh3P57ObqGMzeIynniKvT/gCreXP7+5HTDYxOojMTO21J
	+XhcpUeu/2HTWbH4IOI1aK9OZFXPpzH3Ymfr+cNuR0f5Q6MNPTUBLhGQM8a56AS8b9mQi+3Tnor
	SPCJoqoIljb0txd2EpvysXgtIwjfEUBIbo7z2HTZG8a8RWOY1UvqwtZ0Zhl28L3YXaZvUt9l0Um
	YA9YK0a+cAU18mRQhEyhcFn35kYl7DS6XSvCvAqFEOr/tYevn12QBQM1FWyVtpcTYLChPDbyp5o
	ejb5Hm/j0tGf4+5xk2uZ1IcmkrS3QGviP8NZO9ghNF1PI4aFBZbLoXTe34G1dxvPjg==
X-Received: by 2002:a05:6a20:eed4:10b0:3f8:87c0:8312 with SMTP id adf61e73a8af0-3fd2b0f068amr1168646637.24.1794919336546;
        Tue, 17 Nov 2026 04:42:16 -0800 (PST)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com. [74.125.82.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8121sm5045897b3a.20.2026.11.17.04.42.15
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:42:16 -0800 (PST)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1438d9363fbso614433c88.0
        for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 04:42:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE10PpYOY+aU0DUJivl9AVZvZG625wIQS9UikXCU06VFv47U34MOZTjXeDHR98znaKF0lBnbjwqEsVGcg==@lists.linux.dev
X-Received: by 2002:a05:701b:4208:10b0:1b3:b3d5:566f with SMTP id
 a92af1059eb24-1b53a3d6f36mr2169749c88.11.1794919334620; Tue, 17 Nov 2026
 04:42:14 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <avxKOmxCBLF+7qdT@jpc00229873>
In-Reply-To: <avxKOmxCBLF+7qdT@jpc00229873>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Nov 2026 13:42:00 +0100
X-Gmail-Original-Message-ID: <CANiDSCuX1+ehTGN=HNuLL9YBTt8tUw6fJ2D1JqfePQGaz+QOzA@mail.gmail.com>
X-Gm-Features: AclHuK-EAX41DbKYbj2e_sh3aVA0w84vlTt-MWboq9nmaiJAZIgb1T5nlgGrxS0
Message-ID: <CANiDSCuX1+ehTGN=HNuLL9YBTt8tUw6fJ2D1JqfePQGaz+QOzA@mail.gmail.com>
Subject: Re: [REGRESSION] 5.15.y, 5.10.y: media: uvcvideo: please backport 5b9c75c794ce
To: Naoki Matsumoto <naoki.matt.matsumoto@sony.com>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, regressions@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, chenchangcheng <chenchangcheng@kylinos.cn>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Naoki

On Tue, 17 Nov 2026 at 13:36, Naoki Matsumoto
<naoki.matt.matsumoto@sony.com> wrote:
>
> Hi
>
> I use a UVC device of USB3 at v5.15.y. I found the frame rate down with
> the below message after updating stable version.
>
>     uvcvideo 2-3:1.3: UVC non compliance: the max payload
>     transmission size (1729) exceeds the size of the ep max packet (1024).
>     Using the max size.
>
> This message is from by eb6059474e70 ("media: uvcvideo: Fix bandwidth issue for Alcor camera").
>
>     5.15.190: eb6059474e70
>     5.10.241: 3eaf16ff8165
>
> kernel-5.15 supports usb3 of course. This problem is stream->maxpsize is
> not support usb3. Since this function parses it directly, USB 3 support seems
> to have been overlooked. I found the patch at v5.19
>
> Please apply 5b9c75c794ce ("media: uvcvideo: Undup use
> uvc_endpoint_max_bpi() code") to 5.15.y and 5.10.y.
>
> I confirmed that it cherry-picks cleanly and fixes the problem on 5.15.

Thanks a lot for your email. I believe I already asked stable to
cherry-pick this
https://lore.kernel.org/stable/20260323-uvc-backport-bpi-v1-1-5b62c6798ccf@chromium.org/


Sasha, Greg, could you check what happened?

Thanks!
>
> #regzbot introduced: eb6059474e70
>
> Thank you,
> Naoki Matsumoto
>


-- 
Ricardo Ribalda
