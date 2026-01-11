Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E793358D2
	for <regressions@lists.linux.dev>; Sun, 11 Jan 2026 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768140007; cv=none; b=c71XxhpEfKSiDJRQPAkpR5jxTYZNFA1hvIzJjlSX/jUlZwIi7wXVchq1HgJg9GZkyYG4D8tskHWP+Y7bO8s1QkQUasSSpqvmNJuuIWpVNTwyuUR1UFgLNcHSLPlI33U+HHbWzWx6sxKR3cqGIP4/572B/RYY9ITmQ+tumGA1xvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768140007; c=relaxed/simple;
	bh=muAbc47f+KdV7pThOPib6X86PAnNbxXumD783ShwRa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hZoIoO/wpkoCAyop2zf1+LKmUgqoP6ZkyOind87go1PBbYrQJFjrrRKyyR0zbSZg0xROrb0mCVh8yxEn7ldHJJmRi8+4zmFqXsb6iMp6Q4lCv8I5twOrBA0UFthyLCHfKH298FBlFJVSV1P7Lumx+Efk639YYPRRcDtBdjilHPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iwell.eu; spf=pass smtp.mailfrom=iwell.eu; dkim=pass (2048-bit key) header.d=iwell-eu.20230601.gappssmtp.com header.i=@iwell-eu.20230601.gappssmtp.com header.b=iiMS+nUL; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iwell.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwell.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iwell-eu.20230601.gappssmtp.com header.i=@iwell-eu.20230601.gappssmtp.com header.b="iiMS+nUL"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64b791b5584so9218957a12.0
        for <regressions@lists.linux.dev>; Sun, 11 Jan 2026 06:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwell-eu.20230601.gappssmtp.com; s=20230601; t=1768140004; x=1768744804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xShQI6nmF2mT1Lv36uqcWWMajb2SrUl2CNXN+SemGJ4=;
        b=iiMS+nULGC4PesRZ+U+a5c2DdnOsSmkDjk1JZMNOes8VXYkuLLGrNQRD+jWZZ0uvOX
         feePlxPXF7PGrWbSwSYOAFz+dYnqfrO54eW1n9EqIgRPb4QTghE3RjBUQlPCwWNMRKpJ
         DWRBDCy60DoGZQ5zmxkhbvvWREEn6/aewv2QyAtC0g1z1yDAUQ7c93OSryPqC0S1hbat
         WboLKg285zy8RsReKDq8+HOpCqGoUfi1ZHkJeWaQIZuJ4LeBDWkTV6mYYgDL6Np0pviD
         Ts9V6/0T8exyifH8fvUI5k4DDMmunkmXCm8cIzikUfEKzLndvnb+DiMfPYlT3cWCjrjM
         kZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768140004; x=1768744804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xShQI6nmF2mT1Lv36uqcWWMajb2SrUl2CNXN+SemGJ4=;
        b=rort6K8u5wUOhcJy4L19R5anGzNRIA7D9fVDEvy5LQWRWLT3285cj3NnUQUxw67jsN
         MejhzVKJlTYrFWILpzkEu1xRykbxf5YX56r38O4znAnNJQoBtN5RB08+wrXISvzJ41jD
         swIBBAv9TvqTjhcJsjIQ/qil1S5dyr4h7dIF6kMqob5eg6/8SKtX88iAF8k3CF6uHjUT
         niO32TrCjTlxDfjJLjHMlh4y5vrLscsNpZSR3nkBZfyf0MfIMcQdMlsAMk0MMyJe72LM
         sAkcFRW7yNA3mugIAHCWezmLHlri6aEglRkQ/rvO1Aa9IhB08YlLAD+66iirQF83IQmu
         SjxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZWBI92rL8ABOCLBRLCHmMEvTHvNBEaFA5TyYv9B4iukKN/5CxlXoeHMPwLTlVfcoMT+vKlG30Y6vcPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBtaaDom9an0vUBRltjUdVwXjFf0sUya39FrzRTqP64YpgrBQB
	kFKaoga8zcObKFOT5w5fHOJiyD1grCIqL8wrOG9/zDaoC0JAWhoCYia/YCYfitH9+T0=
X-Gm-Gg: AY/fxX7ZcXqFDVheUzSU/Nddb1kP7g7TRi7dtInXT+OeHzQCgkNOfRH5ZYBhqlYS2hY
	vqgK7yKFft9gRdoyktS4BoRMPaWpQRbBZqdgdAAc8yzzebqfOx0nrButKFQIzYddZrotH2YJ+mK
	hCyJJfm6nogE62bjdaKFU58thOR67Zbct1DImyWZaRiyZWCWaSOuRPS8tS9ywS//W2CY5xs9Rkc
	fyZSmIDRxpzlV3OgoI30EFjlP7fwxvEUC1b9bGZbaKPzjFEz1IaP+cWPl5NRS1LvxQwOO0mTK6f
	KtAdQ4s6FsS1gQtOZFCGvsuyIlAqS7kohG7/DH0KZzyEs6/jJtJ13V+V35p4TIpHYSWxxm18ZIA
	aZupFIsawe095AQGACc01y4u6JYA7NoEnqExJTtIagnoyNwWg2W0Ud+04ZcpjjBqf6q+tVSvHgx
	SGC9sZ47NwYR7fkdW3u+/mDyegSYpph30DuqgfW+/E1D/amw==
X-Google-Smtp-Source: AGHT+IFdxFqrMjfzOnLiMqQ1xgseF6uVa69RCR0RmsJGx0nrevh7/kvqJLjRGbGScdx1/jalJcuukw==
X-Received: by 2002:a05:6402:348a:b0:64b:6e44:217 with SMTP id 4fb4d7f45d1cf-65097ceaecemr13531308a12.0.1768140003970;
        Sun, 11 Jan 2026 06:00:03 -0800 (PST)
Received: from localhost.localdomain ([178.224.217.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4048sm15488184a12.2.2026.01.11.06.00.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Jan 2026 06:00:03 -0800 (PST)
From: Marnix Rijnart <marnix.rijnart@iwell.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	regressions@lists.linux.dev,
	Marnix Rijnart <marnix.rijnart@iwell.eu>,
	stable@vger.kernel.org
Subject: [PATCH v2] serial: 8250_pci: Fix broken RS485 for F81504/508/512
Date: Sun, 11 Jan 2026 14:59:17 +0100
Message-ID: <20260111135933.31316-1-marnix.rijnart@iwell.eu>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1: https://patch.msgid.link/20250923221756.26770-1-marnix.rijnart@iwell.eu
Changes: 
 * Added fixes tags
 * Cc stable

Commit 4afeced ("serial: core: fix sanitizing check for RTS settings")
introduced a regression making it impossible to unset
SER_RS485_RTS_ON_SEND from userspace if SER_RS485_RTS_AFTER_SEND is
unsupported. Because these devices need RTS to be low on TX (fecf27a)
they are effectively broken.

The hardware supports both RTS_ON_SEND and RTS_AFTER_SEND,
so fix this by announcing support for SER_RS485_RTS_AFTER_SEND,
similar to commit 068d35a.

Fixes: 4afeced55baa ("serial: core: fix sanitizing check for RTS settings")
Fixes: fecf27a373f5 ("serial: 8250_pci: add RS485 for F81504/508/512")
Cc: stable@vger.kernel.org
Signed-off-by: Marnix Rijnart <marnix.rijnart@iwell.eu>
---
 drivers/tty/serial/8250/8250_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_pci.c b/drivers/tty/serial/8250/8250_pci.c
index 152f914c599d..a9da222bd174 100644
--- a/drivers/tty/serial/8250/8250_pci.c
+++ b/drivers/tty/serial/8250/8250_pci.c
@@ -1645,7 +1645,7 @@ static int pci_fintek_rs485_config(struct uart_port *port, struct ktermios *term
 }
 
 static const struct serial_rs485 pci_fintek_rs485_supported = {
-	.flags = SER_RS485_ENABLED | SER_RS485_RTS_ON_SEND,
+	.flags = SER_RS485_ENABLED | SER_RS485_RTS_ON_SEND | SER_RS485_RTS_AFTER_SEND,
 	/* F81504/508/512 does not support RTS delay before or after send */
 };
 
-- 
2.52.0

