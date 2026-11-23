Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462526;
	b=tf1v474nD816wymbpz9DuP78HDlyvgqlAp4VokpsIJ8IuR5PNH030bXUfPuh0lNmwOy8
	 aZhv4n0eUtREJaru/oY2jImG3w7rnvopITaV3ZHIBShC8f//knBqvkkQ17X45VVOwCu1P
	 owHvcAFUubdylLe9QJXbFnaX2FTSQBDlmZHuCEBr+MUIgLuldnzamjWNq+aQuvqq9Mrb3
	 faeAxnbTXbCANMCVhl6t0yvVlKn3LA94kExXLQz46mUfug6pxMXjRwG08Kz7yqz4LuPCq
	 diJ28x8l2Rn+c4DCbM76Lm5F2NiOgFuafXycYM1BLfHN1OjBLahLItilRKbLqYJlbwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462526;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 Message-Id:Date;
	bh=ZiwswBjB8SuAHKpqVoUng3ormeEZ1lBb3Z+5aMiucdM=;
	b=aEdJoDdgYUN+9C1uZh8kq1PS5pAdptEYHOD5ZuUYLHBedeEQeoDhCA8h4f5798g0rDnV
	 MFaWhoOZGBbyAAu1U0QAPYDtWoXYNcniN9BfQ9KyuJNXt8LaAVYTm5UtrwQLY9SIvwSTJ
	 +20XTdkysbcq6zc6m2lRFXqQKXlnfZEHlOmNBO/BkNU8xeRavc1GRS0KBwibQzjgh3NUm
	 qbMFhkMqvWb35r32tNc9UNruGWOF6vWXvcbdTSYmmJn+t7Y11h2rkp9zVq58Nnf8U91rR
	 kvc7085XjuVI97t89X1sE1hWnPX0PntnNdDIEQ0FoFeNTAAhdmSv6/2bnGL8AfJ0d4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aigeus.net;
	spf=pass smtp.mailfrom=aigeus.net;
	dkim=pass header.d=aigeus.net header.i=@aigeus.net header.a=rsa-sha256 header.s=protonmail header.b=jnNUAiE+;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8732606A31F
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 19:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8732606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aigeus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aigeus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aigeus.net header.i=@aigeus.net header.a=rsa-sha256 header.s=protonmail header.b=jnNUAiE+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aigeus.net;
	s=protonmail; t=1795462522; x=1795721722;
	bh=ZiwswBjB8SuAHKpqVoUng3ormeEZ1lBb3Z+5aMiucdM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Message-Id:Date:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jnNUAiE+qblP0m3bUbNS7ANJmBbAc5EHc8VM8emCJ8xH2o4smvQMRivA3kklTGSJW
	 hsx93P4zmwkjxIkzGrUE/MZkTDNrSqL7uWoKh2DtzO78hg/jJwRhfg9JPO+MDYEwLM
	 MozBWlKwb4mlkJQT0uSGfSOe70+Mc/JnlRjUNBhgrBRxJ4b6a/dvaCmSHUU32lV74X
	 co/p8oKt+lKKrPzoL0pLhi6gyyAOqQq3HNFnZ9LE2RpHoQjN6sJ1yS0FgkU7DWjEZ4
	 MwDwF9C6SQ+S4yEcVgU/FHA8j4NFVM+2kikfS4K6O5qfUKeyhbnzdUpApCwdAr6m5B
	 in9xFCjQRb+/w==
X-Pm-Submission-Id: 4jYGPN6WyGz2ScQD
From: Aigeus <info@aigeus.net>
To: iommu@lists.linux.dev, regressions@lists.linux.dev
Cc: baolu.lu@linux.intel.com
Subject: Re: [REGRESSION] GPU passes into VM improperly after c376a3456d8b or a98db518dde2
In-Reply-To: <HYhMd0Klo0XE_yiVY7XmsgyKKFDwKHfKRy22KrycLcYd0V_ykA4xdbBMJXkA07YX3os6qK-NhMIVi6ITo-CkNIIF0e-GcI0UwwZmdDhAJ0I=@protonmail.com>
References: <HYhMd0Klo0XE_yiVY7XmsgyKKFDwKHfKRy22KrycLcYd0V_ykA4xdbBMJXkA07YX3os6qK-NhMIVi6ITo-CkNIIF0e-GcI0UwwZmdDhAJ0I=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-Id: <4jYGPN6WyGz2ScQD@mailsubfra1001.protonmail.ch>
Date: Mon, 23 Nov 2026 19:35:20 +0000 (UTC)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list

Hello again,

Two follow-ups to my previous message, both of which strengthen the case that
this is the page-table producer rather than the driver.

1) The workaround is now verified with the card actually installed (before it I
   could only show that the faults stop). Same machine, same BIOS, same kernel
   7.3.4+deb13-amd64, intel_iommu=off, monitor on the AMD output:

     amdgpu 0000:03:00.0: VRAM: 8176M 0x0000008000000000 - 0x00000081FEFFFFFF (8176M used)
     amdgpu 0000:03:00.0: SMU is initialized successfully!
     [drm] Initialized amdgpu 3.64.0 for 0000:03:00.0 on minor 1
     fbcon: amdgpudrmfb (fb0) is primary device
     dmesg | grep -c "fault reason"   ->  0

   So on this box the only thing that breaks the RX 5500 XT is the Intel IOMMU
   code path; with remapping off the card initialises normally and becomes the
   primary display. iommu.passthrough=1 is still untested - say the word and I
   will boot with it and report, it is a five-minute test now that the card
   works.

2) While filing this with Debian I found two other reports of the same fault
   reason on the same kernel family, with completely different drivers:

   - Debian #1154877: linux-image-7.3.4+deb14-amd64, "brcmfmac BCM43602 Wi-Fi
     broken by IOMMU DMAR faults (regression from 7.2.15)"
   - Debian #1155040: linux-image-6.12.118+deb13-amd64, "Boot hangs with
     nouveau GPU faults and DMAR errors; 6.12.117 works" (different kernel
     line, so possibly a different cause - I have not read that log)
   - mine is now Debian #1155044 (amdgpu PSP/SMC, the report above)

   Three unrelated drivers losing DMA with fault reason 0x0c on the same kernel
   family is hard to explain as a driver bug.

Anything you would like me to bisect or measure on this box, I can turn around
within a day now.

-- 
Aigeus
GitHub: EgolOS <79418083+EgolOS@users.noreply.github.com>
