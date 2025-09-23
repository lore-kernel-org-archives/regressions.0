Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAB8275108
	for <regressions@lists.linux.dev>; Tue, 23 Sep 2025 22:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758665993; cv=none; b=rak2PRpMWTX+ZYrSDanWIlFLhbgpMN+b8LeNq3nrrGLo+VAxbVlCwqoOuMSbtfHIbsqIIBj4L6zkgjslmES3nT+PsjGqTLDv+teGr1RHgDhJJ418K1zUKOicE3nIc7dnFj+HjZ11KevxYbLmEWjJnnNgChW3A4VHfaZIvo8+8hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758665993; c=relaxed/simple;
	bh=kuspQguKDMN2QP07Ofn/e8FxPXEd28GZFNAFhZqNgXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D/qnSCaiJauG950g67dA1lm94g0K4rvD+z78wnfOdTcNvYp/puzIv1V2/H1yugd33Q9AM1N9p1swlAKXg5EUij46UjcuaPMqVvcmhCGvpW1/iM1sR4IEqd58zsumSXprQLc01+Vf0keOw5+xS4AlBenY93hC1O6BnHytELsygoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iwell.eu; spf=pass smtp.mailfrom=iwell.eu; dkim=pass (2048-bit key) header.d=iwell-eu.20230601.gappssmtp.com header.i=@iwell-eu.20230601.gappssmtp.com header.b=RyAPZv56; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iwell.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwell.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iwell-eu.20230601.gappssmtp.com header.i=@iwell-eu.20230601.gappssmtp.com header.b="RyAPZv56"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b30ead58e0cso182802266b.0
        for <regressions@lists.linux.dev>; Tue, 23 Sep 2025 15:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwell-eu.20230601.gappssmtp.com; s=20230601; t=1758665989; x=1759270789; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pZoDAc2wyhln1U3oJuCYDkDreDeByhBAvuQoDZOwjao=;
        b=RyAPZv56HLW1PqYpDd24GHk5+h+IoCAGs8rmHxyGbJHWM054MYyvIKvLPa0o0gUosz
         LpCPbH38aLZWwNc921Gt2sdK9lHI/D8wdE+KoK4LzOaqXt+aD6tTMi8d90TKdTFcJ1RZ
         ID4zr6Y8VBX5jq94im+K8BGzM2SQuPLyu8AhgAtgSZwdcbW65GMUti+a0ZVF18OCQmqw
         M03NB+yBxpAyeN+z5PS+yM52jw/tkyyhRr36iV1jf/g8mv98FY81KZ5GrsQ3FkiY6qzt
         GRS68tFUcRCitapO88/IN2bcj+FhgiHxTxgn6WnghJUba7yEvdIb5Att81y88JYuC9Ax
         C9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758665989; x=1759270789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZoDAc2wyhln1U3oJuCYDkDreDeByhBAvuQoDZOwjao=;
        b=d6AVgsM+Sef+RTsesaXl6ChHqThu+2FH3hGtfqFqq6OYJEM2aLi9qlsBvbXsRQ4UNz
         kmZ6zclcgd7UpaTVs6WYnJP5voLRVx0GRWunaf1xazEWvk29fetT2Rs6KiZtHLVrTQe9
         HzOj1ynHa/HvUOwFskv/anZeG9dFXMoZtETmbBA3YGugFarMh7nJ2O9FtE2jN+3i5Wvq
         GRzgaABDsMvuvWP55wHKpXGtBt02BqA6nYRIJuk9uGJEIvp4MphKygmwlvFPGLx9R2i0
         n+CqQ/+8ifi63YPYHECTXywft1jFxVSSdcJQotUPCUyfLxPm1JlJD7pYQ3X2ZwFsFkrO
         rp7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVETFFxE/6yKNnzDM97/FAciH3SprZvr15TArBbpfbTzWF7deEPOz5JNOqkskckdYzYi10V7CZcxEU6gw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhFO/vfZsBKi8bLzLHpc95REksmtGy8c3ZkDWBHTtK/s+BV1ce
	SlQ2kwsWCD3PHReqoNznW+Uql7Q3nW6fEe9xb7xpkrNM71HUgcx25ZDDJQ7P7x8IRriN4wZHBL5
	jxJnrimid7w==
X-Gm-Gg: ASbGnctesbta3GZvBbAO0uGqDJTsX89+WTayHwOTl7XI/kGcZZ5dGjql8PPlTBEhH+k
	cdsUI8I7KxtCbfp+zAHtmpOh3AFDdRaV02HT27OqIAc+LI1pkjLiTc9+9azX25NTRox/sNG18Dh
	Arl5eHo3fZ7nfizzXEkqhV1S7osTtzL0MbjZ2ogipnSnPAi6NkEqbtL4QqH97lMtsUp2iRTPFb1
	ZXtJi8O+38doUN8RfDzEigPrliVC/VAfyswUkibjptqSThUuDf2OAvlcBC516/602JiefD0ZuW7
	W0WIgkXYihfr8VC+0gTn7+384yAj9Ch2DslQO8jTUBEz1iiN8tuA2V2weJCwXpvpsnyBWx63bRI
	pM/v/VLhNS8Is417n9AtgZs8+dZJSfrDn3eq6JmTz16Ltszh6eJVqIsLi
X-Google-Smtp-Source: AGHT+IEzCEwbixWOf1mAG9edDAoF9t3pu71R6SaOM3SQN+LM7ZMPhOBWU5qdpOcyem+S8HdoFV3sDA==
X-Received: by 2002:a17:907:9627:b0:b08:85d0:3d8b with SMTP id a640c23a62f3a-b3026e7495dmr394989166b.21.1758665989378;
        Tue, 23 Sep 2025 15:19:49 -0700 (PDT)
Received: from localhost.localdomain ([178.224.220.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2c56c2389fsm581187066b.79.2025.09.23.15.19.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Sep 2025 15:19:49 -0700 (PDT)
From: Marnix Rijnart <marnix.rijnart@iwell.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Marnix Rijnart <marnix.rijnart@iwell.eu>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION][PATCH] serial: 8250_pci: Fix broken RS485 for F81504/508/512
Date: Wed, 24 Sep 2025 00:17:33 +0200
Message-ID: <20250923221756.26770-1-marnix.rijnart@iwell.eu>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4afeced ("serial: core: fix sanitizing check for RTS settings")
introduced a regression making it impossible to unset
SER_RS485_RTS_ON_SEND from userspace if SER_RS485_RTS_AFTER_SEND is
unsupported. Because these devices need RTS to be low on TX (fecf27a)
they are effectively broken.

The hardware supports both RTS_ON_SEND and RTS_AFTER_SEND,
so fix this by announcing support for SER_RS485_RTS_AFTER_SEND,
similar to commit 068d35a.

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
2.51.0

