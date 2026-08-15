Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AA9265623
	for <regressions@lists.linux.dev>; Sat, 15 Aug 2026 16:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786813200; cv=none; b=NHzQCDzaQOfSzEfl6HrJ6f03uJ1VjcrLmjNK/U/x2zzlH1xjxUwBKzKAKHBU0BD3p+Cz2g7k4z/fPWU5ti4EuCTfkgq+pWF3QtjiHE6TbzcPExDDh7/u3Xn1Pszmt+y/NM5L29bZpOW8PSRhsVrh090fKtkioAlkeVu63Yf1wgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786813200; c=relaxed/simple;
	bh=hk8ey2BiC+ojmYOxKlXaJZgRJXTiWL54rqZdd/V98p0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r//Ei70Er6s8GEf/VU4pUK76Wr+VbAEeBWzZl9pSfNNXMvBcJ90rPjnZTSHfjcwTmLLTpyTbXLpcXC/rq5t2yoIxC0tXRTbRC87DMG5V7mwuFjgvXrJpVXqNJQl37QGoT8YYRGWzN4eEoBhvDfCEXOm0RrzMHvZAxEd2dLy4xco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwJ2q7IS; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwJ2q7IS"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b2aa3be376so1553159e87.0
        for <regressions@lists.linux.dev>; Sat, 15 Aug 2026 09:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786813197; x=1787417997; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vo0gH5walmOuH9TG7vKE8plLHSq7YWG1GGcACj/aHik=;
        b=NwJ2q7ISQFHuDFNEOH6w1KqqK1w0PSiw3eyHAy47U3Cdpq/qc2UgmG63FwJCWN6Ntc
         8e2B6zIbuxQRlrw267QiQqVSnCRMtR7nFagzQjunTpUWnTElKyLhXk6YeoJTjI4KcJ+Z
         sx4qZAR6iwBBMSZA1vFbXlOWj5uv5NiJyol+v/RHho5wot9ZBio9BibfiJsTsJwlxNM9
         ZPlVDp0E5A60TYun58qtd1rf+s414nMgiqRsUo5u7nnXXUm6Upt76BdXc24eEWuT6HMH
         n2gc0cYqIM3XuwBpJTaOwJL2Y10ZALBq+lSlxh9QciR9eHh4ipBvopHkruCrUXSSh8O/
         Bv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786813197; x=1787417997;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vo0gH5walmOuH9TG7vKE8plLHSq7YWG1GGcACj/aHik=;
        b=LNYo5Owxhb3tV3gPABjrpUfkRTeG+O17kST2zgEt5WoclOULJyAFB0p46GAZqZ26aZ
         ET9jXMwCwt802QUhRZr/Wsj93Zuc/VFB2j2OdT4wYercj7yP4lGt5MDunpWhRbwSVmgw
         dvmmQhVevaE2roXAuCXsoeuS7e9gGW/6MlgAmmxueQeHUKvuTwlnMAl5NBBumVDXk4bY
         HygGGftCUJYjXPL4EsDO5M+8LcgR5umNDpYg7iC1GhjWeUFlNOIB4kmWEvtSIBVD7sGF
         sNM40Xi3ez/WYjDqq3fGD+a2YyQIXG3Er/vt4VxMv4xOO1sk5HLZhZ/ha+OSsyhVon+r
         a1ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLa7tLNzWaeREQ7g3osP/BXMYr2q+WaxwXwF+W0qH4/1KeaSwcwvCGLkyGSvR0FDRIlHvM4OQitlx3Xw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCIo68slC7Htnyv4OcaVGmXT+Qw4iwEGGVxdh7xP4a1xnHBgYi
	qstwsSMmSHM8Qv92Bf+jeYv38YMgIXnideQMO3d5B1Gx/wdnxnOFaT7f
X-Gm-Gg: AR+sD1339DCsQFdiEQDjocE7KxjSsgMtGikjsrR/g8S3dELFDNqQQPZJa8cRcJ6k+Iy
	EITvinLiWiGya0Thqw1FgG1qZmT28rnqA4WtCGFMp0boPSLaNffEYmGP2UMl62zrrkyfrdRHiSM
	/gqWs4WO9tYgNS4+U3NwYVc+JWrLQWfzo4XtGuHxz4gWueAyHcAT0ewVUCtG6v8Dt3WW+lsEjZK
	MrtbYSA8WIyAK8WgHsBkReG8vq41XfMUWyLcC0k+oOFjrJk4QOcgjuxmrvAUdAlLeQqlHj7Paqq
	9foDqulPtZXf6IQB1UHUP7TaMVhmLeXQNBW2Qw0QrRUuEaxKkDNx5SWkA4xj0EjpndMMN6Sax/Y
	sAhz5lsKDyP2eOFF54sZY3v11rT21dKGbS/i4cUaFuWY5l2ZWD0OC+roMqUtmDBdcGDx7KH9eVK
	43+lFrrMmbFiZiCzYtm3DK5BuG7G35jh0f07n2tWhAosx0LeJNqpgtuasQ44yVd38HhtKqOljLQ
	N2BgSkhwLnjr73kwKGb8Y6KzidXdphfQKo=
X-Received: by 2002:a05:6512:3043:b0:5b4:5352:e2da with SMTP id 2adb3069b0e04-5b459109648mr2103872e87.6.1786813196636;
        Sat, 15 Aug 2026 09:59:56 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458b9a9bfsm1274885e87.6.2026.08.15.09.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 09:59:56 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Bert Karwatzki <spasswolf@web.de>,
 Devin Wittmayer <lucid_duck@justthetip.ca>,
 Eric Biggers <ebiggers@kernel.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH wireless] Revert "wifi: mt76: Disable napi when removing
 device"
Date: Sat, 15 Aug 2026 20:12:00 +0300
Message-ID: <20260815201000.9134-1-andrey.golovko@gmail.com>
In-Reply-To: <20260804120004.523934-1-mikhail.v.gavrilov@gmail.com>
References: <20260804120004.523934-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested-by: Andrey Golovko <andrey@golovko.me>

Third machine, third form factor: an ASUS ProArt PX13 HN7306EAC, AMD
Strix Halo, MT7925 on PCIe (14c3:7925, mt7925e).  Kernel is v7.2-rc6
plus unrelated ASoC patches, so the regression is still there in rc6 and
rc7 - the 7.2 release is about to ship with it.

Before the revert: every poweroff and every reboot hangs after the
displays go off, machine stays powered, only holding the power button
recovers it.  'modprobe -r mt7925e' hangs the same way, with the stack
you posted:

  napi_disable_locked+0xe9/0x100
  napi_disable+0x25/0x50
  mt76_dma_cleanup+0x178/0x370 [mt76]
  mt792x_dma_cleanup+0x8f/0xb0 [mt792x_lib]
  mt7925_pci_remove+0xd7/0x1a0 [mt7925e]

After the revert: five poweroffs and one reboot in a row, all clean, and
'modprobe -r mt7925e' returns immediately.

One thing that may save the next person some time.  The hang is silent -
no watchdog fires, and here even the panic-on-stall sysctls were all set
to 1 by kdump-tools, so hung_task_panic could not catch it either.  But
device_shutdown() prints "<device>: shutdown" before each callback when
initcall_debug is on, so booting with

  initcall_debug nomodeset

names the culprit on the console: nomodeset keeps amdgpu from taking
over the framebuffer, so efifb survives to the end of the shutdown, and
the last line on the screen is

  mt7925e 0000:c2:00.0: shutdown

with no "reboot: Power down" after it.  That points at the guilty
.shutdown callback in one boot, without netconsole and without a serial
port, which on a laptop is the difference between diagnosable and not.

Andrey
