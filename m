Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3245630F7F1
	for <regressions@lists.linux.dev>; Wed, 10 Sep 2025 08:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757492962; cv=none; b=e4YpxM0qgggfnzg4Teqe1+4GIx5gC0sPIdrj234ld0WECFCiD+hIo8i7hopND5K7RaAm4Z7y9rWi+fyVvjpO3XnV3ep0cpeHXf2SyAkBU0r6KTOAjsR3OuYa1rQjXK6T5U1oJwOZIWOq99j1FJmNWBae4zQhAXNAIE2L76yc61g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757492962; c=relaxed/simple;
	bh=1mTwkUq7dRAhbqn/fyhOeIAqtw/i0fbkfFE21F31X28=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ozeOnD7ulU0RgUgbwqAVy/LVK3bvc+5u6ScPvo1cjfABZ6yVyLSEgAYMI3IaCt15RhbdrESplmZ+GfNnITpOKI05A2KYyXfUT4RP9bHoMIvJJXGbDTHcjQSX4bbTTKNYZvG+FxSgJXMbXlQUCV1oyqEVCHFerpF6UIXfhiRF0bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJ7DkDn4; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJ7DkDn4"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b045d56e181so973856966b.2
        for <regressions@lists.linux.dev>; Wed, 10 Sep 2025 01:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757492959; x=1758097759; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mTwkUq7dRAhbqn/fyhOeIAqtw/i0fbkfFE21F31X28=;
        b=BJ7DkDn40jkKVHFMl8LZJ2ksunpwQ88ikX9DAVpYpdAcqbiklFsLZDOhE+dT4TqPvs
         9NiLLoNB3ztuibVEmXunej7TGYFSI8p83MWvKyEk7QQMWuO14LwdNXTY5+oW19xyXYo7
         coojlNVLORHlMDcmqtbSrFt42qd0weCaackj+sdUKV2JkjZera7cVaSbZY0cvtxhPRpU
         GDYML1gRDwAY63K+JfQP6IVwnqfvDcGIzDPTia8AQwaq82shsBaGTl8kJzKM2CfUH/Df
         oWjjmDG71Qgcrd1B1H9vLz8mUNs7lYhxFJIaW4Bxr0UaBLHrzpg4k8Xb0D6EcPedvlhl
         Ckrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757492959; x=1758097759;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1mTwkUq7dRAhbqn/fyhOeIAqtw/i0fbkfFE21F31X28=;
        b=JoaPJ4cVxSlFehb4uJr6pexsJtvGcLZb4ObauZiA+z49MPPA7pCUv86bUdrdOdetzt
         X8h2iQP9Xw/7AniYT53P56oJtVnTB77YI/QTq1qiour9DCDI+Z+7nzfBROxSYf2UtP3S
         Ook8ex2wRm/K1HrcrDfeI7y/fqgYoFij+ywdsdPJkbplhlGMLHg2cX0bkQz8kEi2y3lw
         8uDmk5i8TZVM7JIkESs790hqL6Q6wQvWmW2+duQT3MaDT0EWNCcMcWAPsCaDi6T17Bgb
         LiTaAllTe5vxXb7Q+jnw6PpVK6coe+6AEi17L1AN8WFtXFCdHJ649WJyn/DBGRZReLg3
         dyDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzdzcqzQY722j27UzNTQkpUN5qVcgFr6utcI9KIFpg5YOIqfrFpSIM/QcRxVrmZFPkuLgwQYhuKYKnqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTL8ZDWOEuwv9NSVlmzcrMy6RxUYv/Il8M17uq+mPAB7V47GY8
	+pBH9wwUPLQ9lyVi9AeQefJQTxRHpZTx2tEly/QTThYiiqiDBaQAs0lm
X-Gm-Gg: ASbGncu8mNaSbszmUaZvBzedXuGpT84unHsZHt4auarpl90+R1GuQeuB0PBmEEPYCnI
	jxjJ4aY/UTZk7Le4N8bbhx8uX5WcudM89CMcGpEuvPBISJTzBdVhHtwnztuPeVa+TADaZ6bZCuG
	I5W01YVwzUuOCHtcmcreynKcmKPoMhbBRR3KwK0LSozU8u+h3w6f91O0/o48gNpYrCCeht1/yLE
	/NaTXBUfL/MOf1J2y9ilvmvKpwJ5ymFJFC3v11BUJ9/H9rDiDLmsBd+va2CCGuQ+8OzmP6MRkrD
	At2gWohwmrfwRiN2gmxeCAJn3kSxJwz9ik5HEvnfYioV51B4qcn/LHQnycPmy2xSRRZHfiYgzyD
	wGmvndNQeO9nv5y9ZqMb9jyUcbDEa/qW7Z5GkRCkyMZvXXJpOxSjcXNFn6QtsRr9l9wl3gEJnQ6
	molQ==
X-Google-Smtp-Source: AGHT+IEGlLGLHWy4VSYvtPlZdL0zIAxuRa0BqhKCh35i4BIZvTkG53oBP+b+dE3GST5/RJnfR/ncqQ==
X-Received: by 2002:a17:907:2d91:b0:b04:3302:d7a8 with SMTP id a640c23a62f3a-b04b16d300dmr1359997466b.58.1757492959169;
        Wed, 10 Sep 2025 01:29:19 -0700 (PDT)
Received: from localhost (public-gprs292944.centertel.pl. [31.62.31.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b078334b3c0sm125451966b.68.2025.09.10.01.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 01:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 10:29:17 +0200
Message-Id: <DCOZ9AOMAZM0.G789W69TWCUO@gmail.com>
Subject: Re: [REGRESSION] net: usb: asix: deadlock on interface setup
From: =?utf-8?q?Hubert_Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>
To: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Oleksij
 Rempel" <linux@rempel-privat.de>
Cc: <linux-usb@vger.kernel.org>, <netdev@vger.kernel.org>,
 <regressions@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <DCGHG5UJT9G3.2K1GHFZ3H87T0@gmail.com>
In-Reply-To: <DCGHG5UJT9G3.2K1GHFZ3H87T0@gmail.com>

On Sun Aug 31, 2025 at 10:50 AM CEST, Hubert Wi=C5=9Bniewski wrote:
> #regzbot introduced: 4a2c7217cd5a

#regzbot monitor: https://lore.kernel.org/linux-usb/20250908112619.2900723-=
1-o.rempel@pengutronix.de/
