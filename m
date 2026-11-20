Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189935;
	b=GuBo0Wio1LuptcmfrJb0U6ILT+OT3uj6NfO/ebjJZgKago3wenh+gNuXtqwqH+UdW9YG
	 gR7cHrEY6Ax3dnbFjLRCBDldan6fjZuItR05KNgay2t6woi07zhgjrgNxIHUO3LhHyd6M
	 gbkul1YRcKzQNY6oZ+QYNKLTv2puZepE3oAYQVo8AHxBDeSZhSyH6da0wIAWFdcndwSlX
	 Cizn1BwHzyfhp0AyA2lregl15KL3kn6HoIFEdCMFjGDnGHj5bR1VWGlu82Kyqxk0xxK9h
	 dm6R7Xbcjxy2eLMwHzeAvyGbLS/8BJcyAhVNFeZW9JaLZig5n7P3X63VQvZrEVvwx/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o0nDPHjheNdO6zZdX+LgK+UkTDP3QtATTApjvPCGCnc=;
	b=Em6XNofZd8gfTCKjBUSujgnqU+sikPWh4ygNuuBjtKSpMJy86HhGGteUfB/9+NiOzjun
	 Q4hZEl/KTg8b+BPiip6Ki4fK/Q54fkTukkD2A8nxH3jBqn8F0bNCD5CkZfJADQPZAj84f
	 pUkDEa7e+zcXTmF4EXeMUzIq9hJiVjZIpVK+phZluehcUejjakb3qp4p2A19gcRmf+lGk
	 ni+E8tz/gP0G07u0l+xM12h9i0F6YCWDeRSrmUpyMJkCRrpduBkE3KLcxsx5l1j2mxI1u
	 9LuzMxqjjU6V3MBA/7pTNiDTqUmEkjPDsQi4iY62IsMtSGYbBHXxzt1hBwYiqvkHByQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starlabs.systems;
	spf=pass smtp.mailfrom=starlabs.systems;
	dkim=pass header.d=starlabs-systems.20260707.gappssmtp.com header.i=@starlabs-systems.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fvQdX6uT;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F6D606A325
	for <regressions@lists.linux.dev>; Fri, 20 Nov 2026 15:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F6D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20260707.gappssmtp.com header.i=@starlabs-systems.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fvQdX6uT
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so9603805e9.3
        for <regressions@lists.linux.dev>; Fri, 20 Nov 2026 07:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20260707.gappssmtp.com; s=20260707; t=1795189933; x=1795794733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0nDPHjheNdO6zZdX+LgK+UkTDP3QtATTApjvPCGCnc=;
        b=fvQdX6uTl62t/LJ0s/DJZDa8vad/uYdqtl/YxJ1HlYfgZcR5mpMIOO1hx5dBQuM2j4
         9ydK3uaV7Bn4CRjirmaUAhZtS5If0XSX7hKqq/T7f43iNegLmucR8OxULksz9aRL5qOI
         rOczAF3lp7Dl4pae8TbID424/SuVnj1qBbyv/NQJ+Lx6lJfh2/aZvQujT3sgG9z+C2f+
         7ZQ/MXB1agQtaNKgfniT9b25UJbMO6IFTUCkMT96cl3K/nNWNNAj3d+LTWZ1xvLFjgnb
         /Ossj3z+dxfABrCZPorqRCjbn7szzYzE9zsFnWhdUagod+y5ultrM+1CeFYtV2r+VJKp
         kZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795189933; x=1795794733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0nDPHjheNdO6zZdX+LgK+UkTDP3QtATTApjvPCGCnc=;
        b=fEoDxW8/eeTVw0RnMNe1lMgwXsUpGkFAF1oEwkcjjwkdqaYYfEeUfasBwuEUQ1PKDc
         WZFKHo0wZNc9PTabJUUWJ+4e+gznj2QTTs8Aun5P/UCy3sgoL8jRjtE4pP+tmaJembai
         12J6QBbocpDqUh1x/XGHF/h+7uJWzAFqr+mdFUkVFGMCJTd11ZaF3JjkWEmVM0NPLk/D
         ZXrUaXUQpC4L6nEm4gTFH07frsgnXApB1hEqP10GrUwq/e1lIbT2ZCgnvQ6RrV22sR6G
         8GWiBtAzrCu1nqSB0oB72UcfKKi7rEAFnrcxHl8nsTOytY/qnfXmpz+xS6QcynV7ED0S
         qEmw==
X-Forwarded-Encrypted: i=1; AL+hErENOLzRsLXlbmPt7M8TPHKEUdqmi55rQ8G6LK20ayq8jo8b4E73jbz3mFSuMKVzQ8v7mEqVYz/iMfVcGQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9HI25qGqzfso3HhylU04DknIN+UzMoQTMUBgZaOQWbUecN9bne
	FV+9VVgh1MQ/aTrzM7TiDmaAbOrX+tLB15Izcj7lVXkkNTyCbmOo5sSGVIwgIma9Jw==
X-Gm-Gg: AYBFou29WRs2gHUcOmJfzaMa09Yzt+xUFmrxW21yrKNOMBdJxk90PhjUto7L7bBAQuY
	Bgf3M7NO/9k5xI+w8DP9OnrOkK2pc6EA/ww3krHsz9iXI3TgUH1NmwnpU4BSTwYyu7k4F4g43b2
	mq1gf8Hg1FlysdU6KZd0sDep2K2xu+8Kqh7qTEm8PiRmy08IHyWbf/JvLum2ALTGM3q/LnoxIg9
	PeK9iIOztX+z9r1YFNmXv4+zZhpySJGLurviS9zjiSMFC1+8XagmhfuZ/MsJccBtDepBlFrETyD
	fyAvDKKjW6hnZ/LQv2Zmp2U6fmQOuG9gPlGVr5+zzfCW+xrS1ze3sPpQ1aI8iBCZSF0SGRZPimi
	hJptVy/+Q3NbCYw/WqTgV95wHKx7bXA3YmkiN7gliCZ3o+nQzoxalosP1I7I2b8ZqeC8fTvLyGa
	JhID6TpNyHTzKyaXYC4fo+dyjrufGWbUd0qNueH7DYn6opg6ezGnai+ninml+CjbkcZRRpaRleq
	Nfmgoly3k25txEz+RUBGeoaSgKo7iT4OmoESAP9ZudZIPMTJCrdChn94hC8FweDqQ+tPivpLD1p
	TBfbavBkyQy7kuo7CFGXXpCJ69M13n/bB9JA4BoEQd0sOVDZcIqpNZtmbl2goZ3Wc95B5TL/GEf
	uJSyzD7DJvvroOxZOI/X8fcx7miIjMMLuFr8cHw==
X-Received: by 2002:a05:600c:c09b:b0:4bb:665f:7e52 with SMTP id 5b1f17b1804b1-4bb8880995dmr59500055e9.10.1795189932934;
        Fri, 20 Nov 2026 07:52:12 -0800 (PST)
Received: from fighter ([2a02:8011:ef47:0:33c1:5cb4:17b2:3e17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm132029365e9.8.2026.11.20.07.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:52:12 -0800 (PST)
From: Sean Rhodes <sean@starlabs.systems>
To: Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org
Cc: Philipp Jonas <pjjonas@web.de>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	regressions@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: rtsx_usb_sdmmc: allow legacy SD init after CMD8 timeout
Date: Fri, 20 Nov 2026 15:52:11 +0000
Message-ID: <20261120155211.2535908-1-sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the rts5139 staging driver, SD 1.x cards do not respond
to SD_SEND_IF_COND. On an RTS5129, a preinserted 2 GB SD card times
out on that command and the driver then rejects CMD55 and subsequent
initialization requests with -ENOMEDIUM. This prevents MMC core from
trying the legacy SD path.

Do not suppress card detection on a timeout from a no-data CMD8.
MMC SEND_EXT_CSD uses the same opcode with a data transfer, so retain
the existing timeout handling for that command. Keep refreshing the
physical card state and retain suppression on other discovery timeouts
to stop repeated probes of an empty tray.

Fixes: 7185b6d33b17 ("mmc: rtsx_usb_sdmmc: suppress false CD after init timeout")
Reported-by: Philipp Jonas <pjjonas@web.de>
Closes: https://lore.kernel.org/r/523eb7d1cc0811df4a5e4c534538f3dd@web.de
Tested-by: Philipp Jonas <pjjonas@web.de>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/mmc/host/rtsx_usb_sdmmc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_usb_sdmmc.c
index bf37fab233cf..55fb83f29328 100644
--- a/drivers/mmc/host/rtsx_usb_sdmmc.c
+++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
@@ -879,10 +879,12 @@ static void sdmmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 finish_detect_card:
 	if (cmd->error) {
 		/*
-		 * detect card when fail to update card existence state and
-		 * speed up card removal when retry
+		 * SD 1.x cards can time out on SEND_IF_COND. Leave card
+		 * detection enabled for the legacy initialization sequence.
+		 * MMC SEND_EXT_CSD shares the opcode but carries data.
 		 */
-		if (!mmc->card && cmd->error == -ETIMEDOUT)
+		if (!mmc->card && cmd->error == -ETIMEDOUT &&
+		    (cmd->opcode != SD_SEND_IF_COND || data))
 			WRITE_ONCE(host->suppress_cd, true);
 		sdmmc_get_cd(mmc);
 		dev_dbg(sdmmc_dev(host), "cmd->error = %d\n", cmd->error);
-- 
2.53.0

