Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697804;
	b=JuvHIpplgA8nA+FwZHcQJch7a8Wr+aAvuP43hSVCzK8hDkpnqvy2EpgtiwhL8tXRkvlN
	 KXO2bxncYPFh2FBy1plMK5ncWx4irjDZAeA1TW6pGCJ+uuV61dc8d9B5ne9yKRFnczego
	 DE8EFrzCFfE3YRGQ/bWjpsxhK3CMub74GWYZepXNVY6VkSMNcSriQ9sn/5THr36xKnhRm
	 4mnKGOkNFM2XL2QT2XGxTSU6niJrVE1Toxm2Y8xE+McdD32LrKonvuF2IO86t1GDg8jUo
	 J04uFP3a5cQAlOmmymuxpKYxvhKU7lW0DdK+XVpIQESPlTJAeP2pjyWCk5K4eJFdi7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PZPvfX1rm0qpo9fUpVJwjmTY46uavpRGLm5yVTqEhw4=;
	b=Ec+e2P648f8Vkfs/pO2lCkcRNmhtOUtAuGGHJpfnjQBs0ZhtUhfve2+fOyU+8zMrxKN9
	 fbd5r+I6LYSbIw+PPK0EAK6HrN1CZYRvc5M8dwksnfE+G+9XctH3kdiJGaelL90s088V0
	 dld1BcDgTMQecZJfaIzvGT/TMXcKC8bnabDuIGNIKROZZlT3zBb4K155EG3XY/StJ/v5V
	 X+pg/8qlhV+n71XlfeAwwk0XpThfxgNV25QyghoQ17cKhnvKObFAJu496F8jhGwfipy5Z
	 72d/0VMKoN9V87JZOg2ONPKlIvpjzl9fAE0POuQ4eJXLuXqoo/mN1Q8fzsNGlEb5viQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="JdVDlJC/";
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC7E606A31A
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 19:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC7E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JdVDlJC/
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c34bff61551so23971666b.2
        for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 12:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697803; x=1793302603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZPvfX1rm0qpo9fUpVJwjmTY46uavpRGLm5yVTqEhw4=;
        b=JdVDlJC//sjw3r4H0JJbNrLnsPo/5uMrLQcwIeG37QN9k5DKdWkoil25x9eLlU6Iq7
         YqbwQK5RwCi7DysRT5mEvbRLwdqO9hwGoJvg+elGGT2hpOD67tQGPiO53MHci1krzrQ1
         OCGmLKZ3OFsAHE755ctA+kXblG9W0MA5LoR/LBVyNQk1NAlcvZz59wm3dVKHnN68fco0
         d3u/x5aK3lgvsGdVH3IwXjvXoNL1RFN3gCRyRrbiFqWkt2PpXGLMDvW16ys+keVRK5GO
         2cVSrvCv/8xDBESp1EgqBb2sdNYuIE9nVqDa6raRB9wReNgT0G+j76E+Y8a9TyRGGcQt
         //Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697803; x=1793302603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZPvfX1rm0qpo9fUpVJwjmTY46uavpRGLm5yVTqEhw4=;
        b=zaZyd3JaifiroSTsal5rPFfkJGtD0labSwrRQHtUL8LHQiY7DNLhdTYLjdV0IgVPx2
         Ka3xF1db6haah793iKeBX1A7RAzMdNn+QjxvIstMDbbPY1Uj3ruRtDFJwVGz99yEx3JC
         qWAfS2Wj5z4AYxj2ihreO6VfGdad71UcFFwxgL6D7Q0I72KYHtm3WFU537+3+1/dWZ7J
         SL3E4A4RiH6Rcr2M0P6VBU5UZCVvWwQGIiEL3mLc+pNSHO9ORkXBBwcVNq2KOvbtOFzY
         bZ1GyxTS3v3N1yyFV7EsclHaPr4KYUD7ngztP1kQcEKY6qRUeF/9CdmRA1g6HVrqqKcP
         jYOw==
X-Forwarded-Encrypted: i=1; AKwUvBwH+pneboVxGr0PT0f7WsLiyysOzRZWlkW1n0ur8UGXD90C6H2ozrX+Pbp8UBiib3fVeUKgTeCsose0pg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJzSvwmVEC8WfBE1cCcH5pWYqao/jYyVFwll5UFy7j3UUqylu4V
	unIxmp0BPtNHLAb/qDXMpIQcF2bfS6pboHqAYKkXbmD6a58ojLmo/nDE
X-Gm-Gg: AYBFou2D9IbAIuGCxZbThPo2xSz3JUnqA7avAgNF9g8AFD5l05cxEDAOyDF6sNQif8c
	gg75P+BrtpH36RVkshPd6FTBnWXX94D6UXpDzIn9Tr2AgO4wG5DWqVyhVQQIKXtA/h8BaG+1/yK
	O87POY+hfIIBBdKJWar2vHdHIgmgpRYlkf7P9rR7+4nAspEWfTm4BKVQJ2sUarjLibOYbhloVOp
	5/V9AwneFaqdPA6N0PDVcaeioLYF/KYdZ8wHlUnweyNzb4bFyVpDcJ7Qad9xb6xvz/UfvX3+d0A
	UutH98wzcs9DWjQg2BSc0Y7afd8nDNcMCf9D/GGNeFg5tFAfzZ3/PWDBkxMVCt2zuFbptRmwAr4
	EMWwT/7Fdrk3hK6tbOLCxX2gEaxa+SCTF8GqSXW4O54cFD1Z8Er2ngl4vZQRWgFXRsXPNs7q4cP
	M0TNlfj3cKykh9F8umwZOL36WqYvR0FI4+idIGYz9PFW9g0jn4hpHeoVeRBaHOfD1gH4ZdMerqT
	jGm16TnScuTMtDhhkcpCDplWA0FXQYrZOFwB7kH5CPJLP65NA==
X-Received: by 2002:a17:907:dac:b0:c3f:98d4:dfe2 with SMTP id a640c23a62f3a-c46a908932cmr24015266b.18.1792697802406;
        Thu, 22 Oct 2026 12:36:42 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:4f::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5ca4fa2sm22651766b.49.2026.10.22.12.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:36:41 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Jinqian Yang <yangjinqian1@huawei.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Andrew Preece <apreece@meta.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] irqchip/gic-v3-its: Enable dynamic MSI-X allocation
Date: Thu, 22 Oct 2026 12:36:20 -0700
Message-ID: <20261022193620.2152038-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715035437.700601-1-yangjinqian1@huawei.com>
References: <20260715035437.700601-1-yangjinqian1@huawei.com>
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

Hi,

Commit 0d6a7c417983 ("irqchip/gic-v3-its: Enable dynamic MSI-X
allocation"), merged for v7.3-rc1, breaks bnxt_en on our loving Grace
machines. Reverting it fixes the problem on current mainline.

Hardware:
  - NVIDIA Grace (Neoverse V2), ACPI, GICv3 + ITS
  - Broadcom BCM57508 (BCM957508-N1200FJ), FW 230.0.165.3, bnxt_en
  - The same platform with a Mellanox NIC (mlx5) is not affected

The trigger is a ring resize: a boot-time udev .link file with
RxBufferSize=max, i.e. "ethtool -G eth0 rx 4095 tx 4095". The close
path never gets the HWRM_RING_FREE completions, then TX times out and
the machine hangs:

  [   58.221] bnxt_en 0002:01:00.0 eth0: Resp cmpl intr err msg: 0x51
  [   58.221] bnxt_en 0002:01:00.0 eth0: hwrm_ring_free type 1 failed. rc:fffffff0 err:0
  ... (repeats every ~3.7s for every ring)
  [  215.539] bnxt_en 0002:01:00.0 eth0: NETDEV WATCHDOG: CPU: 69: transmit queue 18 timed out 5118 ms
  [  215.539] bnxt_en 0002:01:00.0 eth0: TX timeout detected, starting reset task!

Bisecting v7.2..v7.3-rc3 on this machine points at the irq-drivers
merge (8b5d31123f41), and within it:

  good: 9023960b74ab ("irqchip: Remove redundant dev_err()/dev_err_probe()")
  bad:  0d6a7c417983 ("irqchip/gic-v3-its: Enable dynamic MSI-X allocation")

On current mainline (f47d223627f8) the same machine fails at ~55s;
with the commit reverted it runs cleanly.

So far it only reproduces with our debug config (KASAN, lockdep,
DEBUG_PAGEALLOC, DMA_API_DEBUG, CPUMASK_OFFSTACK, ...), not with our
production config. I haven't narrowed down which option matters.

My guess is that with pci_msix_can_alloc_dyn() now true behind the ITS,
bnxt switches to dynamic MSI-X allocation and something on that path
loses the completion interrupts, but I haven't root-caused it.

Happy to test patches or collect more data.

Reported-by: Andrew Preece <apreece@meta.com>

#regzbot introduced: 0d6a7c417983b

Thanks,
Vlad
