Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242529;
	b=idfoSaEBMvd+AptF/k5CXTIcEJsO3mM61DDshcOV64fZAKwILVuSNQ9fmavoKs7pvaJv
	 KDfSfLOqXHT/1Hz5iXCQlQbpnDi1oA3kpSm6Rm72Pe02l/cCgO2BoRo/xM4EW9lF++TLD
	 1OzOJEmANq/iCc0x/VAtMU0jUAhqDggFqDoX6NYreRS4E2YBRxRSYbi6vpR0jf9xJH52g
	 D2JGdxCHz4nlB6B7+zDpz6jGrQPjrY12uXDxir9t3DhBdrvR3awUHaCh3AbI3ix5NtV3I
	 E3oettX5rw+k8OmL8hZ/PffBSq3HgD7IpXCGWku26t7L9pEdX/wScVaypUnT8D/MyBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rTBkN4SoXpbnTrjKm6a9r9Hi9WyVrqwpfUB5k5zGKJU=;
	b=E3srIe3vPNC2HZuZR/yq2EXUbvHvuo80KMaInfAPxGONRz9qMjcj4OEJYFg/bBPfvAWd
	 ck1E0TE2Oyzulfs/RTIbowcjnaTYtSlwb9oMDrk/nOpYffJNhjUPcU1QZPMH4FGlxPK5+
	 4jsYYKiepuoS5/u+QlJa8xcCERt9wZLWRq8/a3/+gwaPouuih/IN5hUFtB6tzH0ZeJlMs
	 yYRGH3KBwbry7yxZKeztBsXIQCUVgv//B/Jmo8SviIJp+igkjCc7svq8h/ouZq5Gblvph
	 pjM4nir32DonJRRNjUVlVz5q7r0q8fTLpvroFXAWQi2uxzOgNyiOhBq6Igf+IPPdlEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SRSYdRl1;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2493606A321
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 16:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2493606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SRSYdRl1
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a210470b49so8427385e9.2
        for <regressions@lists.linux.dev>; Mon, 09 Nov 2026 08:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242527; x=1794847327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTBkN4SoXpbnTrjKm6a9r9Hi9WyVrqwpfUB5k5zGKJU=;
        b=SRSYdRl1WySoy7WAKRxq18ouVqkDkIVouq6VE13iqk3cbQNn/m3PoyV32aqfX2qQOx
         4iwOt+eYmdpCcmfBpzKBWqd75vYBPl3wn9Adrth5QzQub6QXkz2+k5sCexKLa7n5WpXm
         Gw4L3fQr46ewc63im4y6rFPoCHMiTV4y4qAf13htXI2a52FJ4WnNQx/g8nNPxtgO/qfk
         Lm+wjhKfvkQNLUnO8Ir6pNdsII+qTcaqlSSV87ZG1iVSUBEumlCq6ptZ1RZ1aUXZZ1jS
         lAQPfm9xdt8SIu/JyAdqG1d1bd82koNVv8Kel9Hyq99bYrZhK1Cyk1BRCNLUIOk3X+gK
         lncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242527; x=1794847327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTBkN4SoXpbnTrjKm6a9r9Hi9WyVrqwpfUB5k5zGKJU=;
        b=LOduO9F+mgo9mXVCzkXts7WCFeb0cydnIUucmaELQAljDlgtr7fBpRg2jJj/+w5f27
         CI5EVYmp7bT83C5foizOmYKljpUyQ7whjTDmPZOhAOvekdiUFFpNlhc7E8KvWGUZwPRY
         bkBilYpW6Y9x2q/tFL1yt0zJnz43W2SxZkr+27gZF/fukIce2rgPGkQXi15lsIospD5+
         tPw2HljT7c0txXZ46qMpwIF471mm1DlttgIYWOKfKLV3/GXQHwMQTGrA28dzPPWiWtJS
         JfxWbhQOxP5sAPogOnJ3IrWR+2Ub8gEMwXbMF+vgCMDtGroN7kWvBkQxX1HeD+5iV+uU
         3jMA==
X-Forwarded-Encrypted: i=1; AL+hErH33hHjDSbXQ616HENrQzabKhCAo4sJVV2Vuvp96ZJVCGxnY5qSd7l9wUCQ4PLX0hzu4bgge+BQkOS3sw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/yiyXOZZTtHN4+723aKiq8/p4MOzBW/GDJQ1HCnrYcrueYPH8q
	WHg16dlNXASHB+U72v1lOmhCJUu0OvksA2r/z3vdOyPE4aZMIMzbTo8=
X-Gm-Gg: AYBFou2YB7YRHee4IBC+mmrBjPBr0vzSKEDwMcKCS85nn2BIFhmelNOdWGTYZ3gO59I
	PBPhWPivefFUhzsZj4ySu7PAxEOGU32cJHBdaX85VYxCa6fyhKxQS8QyVtZILxZFqvEtPMm9tqq
	5AHC16PWsL25RHd2MrCkMSuE8werGvy90ExVxzd9KNQs8kj5pmhhZM1xaeMRFA8kZ+MJe404+o5
	N+CEbf5Oc/Dv8jv/JSVDk/V0+N7X/PxDtdZgVBnC7QTGTu7HUy9fLTLtYKUKBTMdmlxgHFaC8+t
	1X7PtF9WXO4y0GqTQY1YDwOHWzZAw8Ga6k1okSToJXPo1mpBBDnPJ70U9NXZ58QaY6E2PhL+oan
	cFVFK34kllL49YRbm8ntAJt+SAFG7JAfW912PIhkQLL1ypMqVYMJOGwHVvBo1hb1cnsOOMtqLmR
	DtSBfx6w8gh/BXUQM+60vpdt5tYSIwrz9RfJNFR1TVtf5AYvsLNKHceDi6y+GHtZyBpS3aRawru
	QNX1Z1Nf3r7P1QKIelYeHJTBC4FGSH/OP5mi8US8GDiuGD6nJDIVL5Et+9xnM5iDm/TxBfjE9J9
	J+pj1PdK219J7D9jjKWXOrVnTA7XUpUVdUCm5PCv7ZOCJtSbqlhwaweuJGtF3ugCEpNLzs5AjdP
	m87GtiddFBbuw8HI7zSf6JpKAPWxSHLSjCw2VVkKq1o5R9KEDWwtPl5chRiuxP8fz6huuC7qpTQ
	==
X-Received: by 2002:a05:600c:8b24:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4b960d9b66fmr79533325e9.10.1794242527085;
        Mon, 09 Nov 2026 08:42:07 -0800 (PST)
Received: from chateau ([194.65.85.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597371cc4sm10639482f8f.36.2026.11.09.08.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:42:06 -0800 (PST)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: Arpith Alexander <arpith99@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Jake Steinman <j@metarealtyinc.ca>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] media: ivsc: csi: Add sensor node in bound callback
Date: Mon,  9 Nov 2026 16:41:59 +0000
Message-ID: <ivsc-csi-tested.20261109163952.eaa256f0cc02@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103200226.100989-1-arpith99@gmail.com>
References: <20261103200226.100989-1-arpith99@gmail.com>
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

Hi Arpith,

Same regression on a Dell XPS 16 9640 (BIOS 1.4.1, OV02C10 behind the
IVSC, HIMX1092:00 in ACPI). I reported it before finding your patch:
https://lore.kernel.org/r/20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com/

I tested the same change (identical apart from the declaration of ret)
on CachyOS 7.2.8, with modules built from kernel.org v7.2.8 sources:
- 7.2.8 plus only the HM1092 entry from 4fdb0342f05e: no sub-device
  node for the OV02C10, libcamera skips the sensor.
- Same plus this change: the node is created, libcamera and PipeWire
  find the camera, and "cam -c1 --capture=10" streams at 30 fps.
- This change without the HM1092 entry, so .complete() runs after the
  node already exists: still one node for the sensor, streams fine.
No kernel warnings in any of these.

Tested-by: Sergey Zagursky <gvozdoder@gmail.com>

Sakari, if you pick this up, could you also add
Closes: https://lore.kernel.org/r/20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com/

I used an AI assistant (Claude) to analyse the problem; the tests
above ran on my machine.

Thanks,
Sergey
