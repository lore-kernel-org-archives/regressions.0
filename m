Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F108AB672
	for <regressions@lists.linux.dev>; Mon, 12 Jan 2026 00:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768176655; cv=none; b=ki3xDErLc8YqAw6gi22atfIdIpV+QopU7viIg2cVOOYIDxneLsbLioOKihW2IkQxmyeSFFCbu7WER0He5bC99PYhItcpRkrWT2xDCgZ5FeuKadfMkLqAfHFNCDRATEb1ysF02xwsG7DunDs1OhflltJ2sNuhYqMqmq/zmCOgvNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768176655; c=relaxed/simple;
	bh=kvCyYtiY0v4R29B6n0ipmfjn2WIRYvvpJMM9B74Hal0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TY8XzTHapHvjvPelsQZsmo6v5fh42pb8Yqy/uCDiRGVpn3eZLu/6yMQvNPjYNH0gMob+C4jJNFKLEqLKQzgXDQZoc4K8hvY6RP1NvJ1+fEg5CFTmqpvc8aSPt2dWS6uRIY6geUL0pxaIt/Vc/EBzXfP+3gBkTFgKZ5fhC9Rxdcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iwell.eu; spf=pass smtp.mailfrom=iwell.eu; dkim=pass (2048-bit key) header.d=iwell-eu.20230601.gappssmtp.com header.i=@iwell-eu.20230601.gappssmtp.com header.b=yNBGexMW; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iwell.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwell.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iwell-eu.20230601.gappssmtp.com header.i=@iwell-eu.20230601.gappssmtp.com header.b="yNBGexMW"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6505d3adc3aso9233195a12.1
        for <regressions@lists.linux.dev>; Sun, 11 Jan 2026 16:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwell-eu.20230601.gappssmtp.com; s=20230601; t=1768176651; x=1768781451; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FkBh8hOVItHXrECToFozYAl6O6uqbPqcIj68J5rzzDM=;
        b=yNBGexMWyym8GkTnmcRtLnKAF9eXxIPqdeZhkEnixYRf2HEbEfXg4kWe6w7PDzDYDT
         Q3EFwzh3xyiidtB2dySUz7HsFDo5XAX71OOMb8oLFe7kubSNqmGjDNVq4HH9E1zr1MX2
         dae1QolUTKBt+wGameLfAqGUthXy9QaBomUIKdIu5imjd87XisSzcBLFMCjnMyGuwfRk
         YPEXBQVnoMOIpCUrv0/olLpRYpzUTmBepXURA/JDZGebj7Citt8/9gPA0JBePIMxzhhw
         209ROAEEOqFCkUAIvbtFs0wFHdLIKuqTlD0hmqXxMU0x+S1FEH5O1sD2QeLc6NjNhWm+
         u+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768176651; x=1768781451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkBh8hOVItHXrECToFozYAl6O6uqbPqcIj68J5rzzDM=;
        b=fVOqks1QWsUd4GyUfc4y1lwIDdhZT/XGx95FDnGKQ+AAV4i+qEHgIWB6bHYYvZEJwj
         K2GtMrWo5NzZr4HUsifHmq0frM5bUEOYcevplmddBuJWqSYJemv6DzDgIxe9n0vRPTEV
         aDXZ1MpgytJbbpPfmqezUX2u6FRDsf070nmjmsbWW39TjK6XpgX0OvQjVz6KD6xuPpUm
         5i/hC9bC75uDe/S0RDxVoLSCS4Db0OrS+CO0lxMQ9EMSBnUGqGTKnLIDCod+MDZiq1Rp
         ufPM3pElDi9vKbMOMIkJ/sZhdKB8e2IyuCmtdw3I0sTShmL5UwlR/dpws7UBN6Sz1y5D
         6SEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBgzp6r1LjphksVvAjsCzNZwNQZRIoG+LkQwsvLg/mRxXKargwzW5wsNk5FtCN/Riorwje3hP/PtdUbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyhzWtjnfjjntNpf/91YPQyZVRgzy29T7zzd3IrOXrXhmBme7Ho
	IVz3KQ3a/OSiD7mxP/mmcUfM7jFvOBfDThv+YzgJJNFN6Iuo9Km+hPmskjvpxygUD+M=
X-Gm-Gg: AY/fxX5o5lgdwZerOJKPRosPAsGz1rZIgWwmWFoKmouz95Fy6Ztv7brOcC3Sa7KEbtX
	wJbgoCHKnciVjfzhzgQtH6FXBFSpJeC1trGTcUoE9cq4UP/zLGm9ThiIPNgiu9wkzcM8EJJanPV
	0t0Yw78mqgrt5DJlq/0YZozQxqeQhEgY/IduxPiDN637QyuEKkxJ7Mzv5gmcExYjqslJPYgckmN
	u1yETj1XmaTKCMcKuWvvUv+WHztNGGEk52BWoOaORfLvzgp0DAu6/jupWwYEMjg5nYa+W3UzI75
	NMuAuFOousJhUDzVB7u2zL0P3u8ci+3FLdXVfcbCVklXbhniaYFdnQwb7/6AS/NkOLPs/rOry1Q
	0CbBEMhaw0ZezG3BeY558DWXWXjTylH4ROTAg8Lot3PY6zDbadB76xewlv0LoBDpa60Ljg3YikO
	+dwMLWnbTKt7MTp+eASuavdg7DIw3uEfBTZJFCwzeJNZ3bfg==
X-Google-Smtp-Source: AGHT+IGUGs/1ia/yH5M8iEeDtiuWEQc2pvZNjndbCLfMd1tYAUWcPTkr5LhD3ULnD/zcl7ZQwjXZgw==
X-Received: by 2002:a05:6402:1453:b0:650:2820:38bd with SMTP id 4fb4d7f45d1cf-65097de5b35mr16955783a12.11.1768176650936;
        Sun, 11 Jan 2026 16:10:50 -0800 (PST)
Received: from localhost.localdomain ([178.224.217.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be641e0sm16003130a12.22.2026.01.11.16.10.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Jan 2026 16:10:50 -0800 (PST)
From: Marnix Rijnart <marnix.rijnart@iwell.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	regressions@lists.linux.dev,
	Marnix Rijnart <marnix.rijnart@iwell.eu>,
	stable@vger.kernel.org
Subject: [PATCH v3] serial: 8250_pci: Fix broken RS485 for F81504/508/512
Date: Mon, 12 Jan 2026 01:08:23 +0100
Message-ID: <20260112000931.61703-1-marnix.rijnart@iwell.eu>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fintek F81504/508/512 can support both RTS_ON_SEND and RTS_AFTER_SEND, 
but pci_fintek_rs485_supported only announces the former.

This makes it impossible to unset SER_RS485_RTS_ON_SEND from 
userspace because of uart_sanitize_serial_rs485(). Some devices 
with these chips need RTS low on TX, so they are effectively broken.

Fix this by announcing the support for SER_RS485_RTS_AFTER_SEND,
similar to commit 068d35a7be65 ("serial: sc16is7xx: announce support 
for SER_RS485_RTS_ON_SEND").

Fixes: 4afeced55baa ("serial: core: fix sanitizing check for RTS settings")
Cc: stable@vger.kernel.org
Signed-off-by: Marnix Rijnart <marnix.rijnart@iwell.eu>
---

Changes in v3:
- Rewrite commit message to clarify problem
- Use longer commit hashes
- v2: https://patch.msgid.link/20260111135933.31316-1-marnix.rijnart@iwell.eu

Changes in v2:
 - Added fixes tags
 - Cc stable
 - v1: https://patch.msgid.link/20250923221756.26770-1-marnix.rijnart@iwell.eu

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

