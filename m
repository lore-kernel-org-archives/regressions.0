Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD811E25EC
	for <regressions@lists.linux.dev>; Wed, 29 Jan 2025 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175479; cv=none; b=V2x1ei2glMAwMJbk7WbpVRJ2kqyMsST5nvi2c+9H8APGkTwTBI5GEROll1L1UOoIgC7u7y76jauH3fj2fE0Zh91Ou7jG7cCJEJk6xspejWFxCu/iRpI5fcUtfc2JfXhav/Hp3gVAB6TFHRbnC5bKJycS6pbjVjmKIZFrZO9msfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175479; c=relaxed/simple;
	bh=g942N+5cFH8Z7ggAYbYwuoCxKSmc/5Ox8xjlY1inj9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1+Ft23KyqXVZQLkPg50lWzLwclU8TBo4z6yQyz9yJZJ8qUQzev3lb1tctZCVpeJ5iCOMxwebTNDUBzDRGizUuBLCvTzXD30J6azd67eVuks/xSLkfXpb8Iu1weO6CzW7WCOE/RiqdPr22z4CkTt+cc+wioYIxnwqh3ODJiiG1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnaG9UED; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnaG9UED"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-29fcbf3d709so2278824fac.2
        for <regressions@lists.linux.dev>; Wed, 29 Jan 2025 10:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738175477; x=1738780277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBAmHsVRYatgodxfmWfN1c6yV3AJ+2DuOOOfnLu1pdU=;
        b=dnaG9UEDaRZlCPcAZ2kqTxi6VgQRJfqI9LMtEfnoVyGOlrD6eiaF90dE9Uv+w864cz
         cEJTFMELZDo7Nd1HIGTuESiGzhKCY9inWr1z7pSCESI+WcGOUJS5kCXb+nNjspuFQcnQ
         uK0A2rDAQ/6mvhoyl/rVzeZrp/Mqw6z0AWVZnVbfVXTDO3EpvSNbykk8bKNhYYsQ6oRb
         W9YAxr8Uw8eit92h3+tsrOR5D9uaaYr/7hpmPgk8deY80ls5A+rETLzPflBtEDMiU7C3
         LpwZoGIDbRn1CYs31l7cFyBOg1zrrOQO41YhFYxwn46JSDrCsTVJSLlOT5Kc3sF1T/u1
         tqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738175477; x=1738780277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBAmHsVRYatgodxfmWfN1c6yV3AJ+2DuOOOfnLu1pdU=;
        b=s7Yb72YtKYluJI0j4nznbrMLv4/e+kZcyL7G0JbbjYfTgMwj0ulpzn8Oc2ogMcSucS
         qvKF0I+3gSoThsDWUA5elxGwk3NAYn22zkdzhQLWM77lrYUVeLB43xqhoFONw36KRDu+
         SlxXFUfeGKOBZ87vCIHAZaNmjOAAwGXq00OeYnFi1EWHlLy+cqrrRnGar8Rqc6Zb8vsm
         jKMtw0rRGHkxk+ti8mVICKdVWBl9Uc8LAKyT7ko3NmGiTlrEVXGFkfxU3F0fWG1rwIbu
         T7/XnpfxTWgam2RoCoDjuRj4to1mkdfLjFhk8LwDlpvySf/bEtaX525mvU84Oayed8bh
         vkhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbNqrS/b1A2HbDlu8bDjigyrxLcw3FMIirUj6tXSO7Q2qQNNqlo1HScENcxmBJ4QUObPCSq9v86R6kKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0/o/MILl5TYetUKq2DpR2A100Q/Kj5fuJwnW7CCjGzweiLiKO
	GL4ADVPSUmOC+EjLCSZHPnbvztbctw6HcbIHQYYII6ci/jhv1JXa
X-Gm-Gg: ASbGnctQdImNvZjNGDOLKwmJHHknCYgWi6z2aK5GPlGEP16ezOcEAMR5feq51Y0zbrW
	M958Qfmb8ITnUjPwGynwkvCfPM8awTVX8/8tUMhRm3jkSE82KZx6ttUTJT9Rx5nkXzuFIRJJfDh
	/4+ee3dBYzjx+RbX4EqcSUIvJDW60PPihQ0eZPzKv0YqjgrO8RowCzoG+4UPX512xKzrtr+hSCY
	psONZb68xXUpqorJwd84AxFiGo4lrD5HAfmc/C6QnlCy/pk+6b6DCEC3VTq66nCWLn93NBxFgZS
	ISB/OftXtrqrMMr8G4oSz7pr2viHfoV/QxkS
X-Google-Smtp-Source: AGHT+IFoQgrhZqWDNWjsi+GsbUHYEMoaVrN1HbdaP4CDNbX4DiAKWLHn2kW1C0kpPifUGxx4C7Cu5g==
X-Received: by 2002:a05:6870:2a44:b0:297:2479:a35b with SMTP id 586e51a60fabf-2b32efdb093mr2435058fac.1.1738175477149;
        Wed, 29 Jan 2025 10:31:17 -0800 (PST)
Received: from localhost.localdomain ([23.151.240.73])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b28f4134e0sm4482433fac.40.2025.01.29.10.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 10:31:16 -0800 (PST)
From: John Glotzer <jglotzer@gmail.com>
To: rtl8821cerfe2@gmail.com
Cc: Aaron.Hou@mediatek.com,
	Chris.Lu@mediatek.com,
	Deren.Wu@mediatek.com,
	Hao.Qin@mediatek.com,
	Sean.Wang@mediatek.com,
	jglotzer@gmail.com,
	johan.hedberg@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	luiz.dentz@gmail.com,
	marc.payne@mdpsys.co.uk,
	marcel@holtmann.org,
	regressions@lists.linux.dev,
	sergio.callegari@unibo.it,
	steve.lee@mediatek.com,
	tiwai@suse.de
Subject: Re: [PATCH] Bluetooth: btmtk: Remove resetting mt7921 before downloading the fw
Date: Wed, 29 Jan 2025 12:31:09 -0600
Message-ID: <20250129183109.10770-1-jglotzer@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <585f1075-a662-489b-bd5c-cf9f24291804@gmail.com>
References: <585f1075-a662-489b-bd5c-cf9f24291804@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Good news/TLDR
   Yes, so far I have resumed from sleep 2x without any issues
   with both of my workarounds disabled (kernel command line/systemd rfkill on sleep).

What I don't yet understand
   This commit
   (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/diff/drivers/bluetooth/btusb.c?id=v6.12.8&id2=v6.12.7)
   was a pure USB fix. My mt7922 device (not a USB dongle but built into the motherboard)
   seems to be both a bluetooth device (bound to btusb driver) *and* a Wifi device (bound to mt7921e driver).

   I remain puzzled as to how is it that the issue that is on the USB side was *also* fixed by
   adding mt7921e.disable_aspm=y to the kernel command line (since that would act on the wifi/pci pathway)?
