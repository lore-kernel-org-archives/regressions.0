Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02422EA174
	for <regressions@lists.linux.dev>; Mon, 10 Nov 2025 19:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762801442; cv=none; b=QKIy/0SNjyzKxtKR2VdFb8JZiA3RlhqMlPZVA9wTcD0rsuKcpvpGfImKrv+bXCyqz7800vPYJwB+PA4je+DLbOp1uXnLUZj+nAUDSh+lo7FipJIRVCT7jz8OyqTSNME1S3WRKT+IEZbauinuPiSODC/RoSa0WvS4hR4CaG10vy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762801442; c=relaxed/simple;
	bh=LGjOA09bnTGrJVEPsadzP5+xYl8mEOeOa8jYDNOt07M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MBfecslm2dyyW7AxkrYC1JPxfVOY78L07pVcsYwlzp5IT57+DpTwskZb0yGll6bgiybA0gXfBmeCduEHhhb4W4HEGX9FXAVkC4BllwAuTX+rmAQc9BqtACZqOcfB3OD4qXbX9zFMock7EE9yz2xHb6zGmKEOw0+vnydZSYfcsqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMn1Eac0; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMn1Eac0"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso2539178b3a.1
        for <regressions@lists.linux.dev>; Mon, 10 Nov 2025 11:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762801440; x=1763406240; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rdr73Hf6yD7F+vTTY+eqR8iFcL2w+R5f59ccxWMaVaA=;
        b=RMn1Eac0/A1ubHVSOMsHAOdKfFcRpvR4fGwHgsGYDYZosOb/r1vSu2PjHJmzByneW+
         5rRf4xrDcwP1snQ60Z8YEJ42XHSazGB2v6LAKZTkCIN6uaSOSI3zc3Na+9sO73PVOA7u
         1WcmJNOjOfERLmivqtKHmnRtnZvOoQPmmpZSoyUKSHfUCkhdCNMCxpYtmV1XBaGw7Phd
         bPzRwsCt5f7hXf8tO7t/8pt7cUpXiRrg/X8P9GeSaQHuY+HKCVsbIFik+rMG/h948JGI
         ODGulSiG9xCQngdhgVKD9pmm/X+uysbXZHhiU2AjTdMKuAkgLnL/bDzZJouXtdSbe/Aq
         Sgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762801440; x=1763406240;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rdr73Hf6yD7F+vTTY+eqR8iFcL2w+R5f59ccxWMaVaA=;
        b=jfoxzkGp7qXuAHOyDU2OuGScKySawMR7u455P2emDzNlzNLi3Qq927SdZZprkmV4mM
         IZsB3mVwTlZxN1hR8/N0BrkHqhmB/c0qAysdoBB00vgLK8UNq2vk0EecXjj9HIX1j/EY
         vkL6yaxseSJhV3gtng50pTAUU/DxBYpf+SmGw8WtYEjumheuiV/JCRkHDoMteBOdXvQi
         KZgBR9oEqA4FVJ2/fqec8AvWLfU4UWZBMzrLjE/jY+6EpwtzQqkTEzNDEQ3eAOvNLmRH
         X+pJC2ij3+TXDyUJX+oV+V6hXRRLECzj5SM2gywVw6rY4U1vHxDgd97HGsl8rgSWonQi
         37og==
X-Forwarded-Encrypted: i=1; AJvYcCX8LGqtMsz2xk70g4zs0YTRK4/xJ5TqASzNcnUQfnMXQ3jZ1d0AxdkqDTHp69bnRDSJHePynkNW8aivOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXZYxGykZtojk9nJZgzMTGhsD7iqTY/xMgd+imMUdCLhL7dJ+t
	OF0a5njgXac8X4qGXgMX4Hr+HRCccsbBpI+tIbKFmiCIx88jM95PWWpH
X-Gm-Gg: ASbGncs3p7vL0UWo30EiB4QlowUYJJ/6nUvOnfO4wkw+UQFrEDseANkIZ32+uQUystk
	0yK36+1daBssr5IeFeo4cFd31BOjhaRxbnHa9OmqS/+hDY/iE0Xy800YOsffXQ5m06PWizmFSx7
	Ig9OpzCz9aXWCvs8e7gCPiUnuxFUO0rIABV6y5yyWSm6DEq0zLaALCuKxzpQNH0cYQ1vXupKpCY
	tqAYwgk+XRwtbb8+6BPmq3k0aggExakm/hpvPLPUmgl7tc59TTIrurXBIzpRB5UjJpvRZuOBTKg
	fhc38Vhm1bsD/OOqNPr6qnn6I5lZGZ8ggyESZgkaB3ISsLZfsRf3DSmcVvgIkWCGotULe7r/ubV
	8QVkHhC8CSD9YZP/D8w4bBm300fF6ZhFvF9aBt5zM0E6dulPWejcUPdSmqK8nKUQWZWC7J65ywP
	k90mh64K2UsXlzswSoPNUOCHBO77OAUc7aMCdCTgP83SGd
X-Google-Smtp-Source: AGHT+IHWdjktidRqLMlZy+27raRZ8vwSz7rzuoczgl7EjMb3laqTUYObvY0qN7E6lqkaVnfU2LzZRw==
X-Received: by 2002:a05:6a00:22d4:b0:7ad:11c9:d643 with SMTP id d2e1a72fcca58-7b2266a5203mr10847194b3a.21.1762801439938;
        Mon, 10 Nov 2025 11:03:59 -0800 (PST)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c062b6sm12506475b3a.18.2025.11.10.11.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 11:03:59 -0800 (PST)
Date: Mon, 10 Nov 2025 16:03:51 -0300
From: 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
Message-ID: <bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello,

After commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error
recovery mechanism"), our DSI display stopped working correctly. The
display internally uses a TI SN65DSI83 to convert DSI-to-LVDS, and with
the change, it keeps blinking on and off because the bridge is being
reset by the error recovery mechanism.

Even before the change, it was possible to see the message below from
the driver indicating that the bridge's internal PLL was not locked
(register 0xE5, bit 0 in [1]):

[ 11.198616] sn65dsi83 2-002c: Unexpected link status 0x01

However, it was working. After the change, it stopped working. Masking
the PLL error makes it work again:

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 033c44326552..89a0a2ab45b1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -429,7 +429,7 @@ static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
         */

        ret = regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
-       if (ret || irq_stat) {
+       if (ret || (irq_stat & ~REG_IRQ_STAT_CHA_PLL_UNLOCK)) {
                /*
                 * IRQ acknowledged is not always possible (the bridge can be in
                 * a state where it doesn't answer anymore). To prevent an

Any suggestions on how to proceed here?

#regzbot introduced: ad5c6ecef27e

[1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf

Best Regards,
João Paulo Gonçalves
