Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82263277CB0
	for <regressions@lists.linux.dev>; Tue,  1 Jul 2025 17:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751389922; cv=none; b=JMopSFa6UDU/rLwutEb+I4BDWlm+JAvJoHCzv08Hk+Bv4wPGc589dwCpeMpeUDxO8IPj/zyXrcWWf4LMpTlDIReDyKuWAATIutKDvEciw9WSXThDWKblro7+PlEGoh59hMP5mBOVLnUzjnQorFAR5pp8ii/bS+Nri+yXJlnyTUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751389922; c=relaxed/simple;
	bh=SX2heC/Qk6afxGMZKjrW09kyPvYeBI0adPXbi3Fnvpc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=k97T/jy/5F/JshydD/74Ikfm3BqxDkKO+zceuj5IrPwl/UJaqW5zGsXgQfMpF2Irgp9WGNmUIER9tbo6j4SfTKIqYfHC43I2nexB9loOv/K3vt1ojYb76NW8ZpKV1TUwSSV4Ia2t9x+hBHqnUsN0j0h1DQcMJgTwYyhyaeGFoik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=XS9t/U9R; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="XS9t/U9R"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 715803F1D1
	for <regressions@lists.linux.dev>; Tue,  1 Jul 2025 17:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751389918;
	bh=sU2Tqd6bdvzOLtqB6osCLzx8U1+d3a8Z2ezfvd4F1oM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=XS9t/U9R+3zUPjGMo8TXfF8V4bFRO48sGEJTHDFEwALEQlklu34q5iWKNWJAxeJDN
	 +K3J8c/GIUaMzj/GAXRLelvWCBv1t1aNu430TZblitWvrwTVWBchyyxHwyT9K2nFJV
	 2SWUvcYUGjOfRYSLdpCwNODR9T1Oe/hhRKxARi7O1Z4AJmUcQosDyXFPrM9D3+2a97
	 w2pqLs5qGElOjXvgryvDOJ7FE1c8xrUPTzjxFZdV2sZU22COfpkD6ECGQ0PtD7Jyp5
	 u1S0HgtOspnVPWIHNGHSQOAgw/iDhvS32Yt2ki1VYu1t0R/B2Mce+anQPsZXBmoaSU
	 nEIFsheOI6nHA==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6098216df4eso6089221a12.0
        for <regressions@lists.linux.dev>; Tue, 01 Jul 2025 10:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751389918; x=1751994718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sU2Tqd6bdvzOLtqB6osCLzx8U1+d3a8Z2ezfvd4F1oM=;
        b=tOpcvRbnGDDsVFWsdRmaUqlUdSEbEDsKNokJCcCc2Rz2xLQUsalf0TBdnIh4+ASUpB
         mJFYjyJ8JBvLgtckP59C2ngiS7wlmCVY/qXSUNFuiPnaj723zYUMuTqSkQuwF+goWVwX
         JKVNKAJp9RyIlAQW6REn6tjhNblDfoFDpn/ZqZbR1LZKaFR3l7WHa4/Gja4bWzoIZiJy
         2wyfDLEzn7qg10E1ynTdCxA3+Tr0SqK/B0fGEolgRVf5ynZSfdchdnJMYABlF7tW/rns
         unYLpoUKNW+THgdlOn2MObsIerzo9NX+2OrWxkMxniGIemsPADl1mizPcSmA1KdJfdX1
         Vv0A==
X-Forwarded-Encrypted: i=1; AJvYcCUUd+hMByyDmav3HsB//KAQeLXQXa68lBq55tuoXL4y8vbjscPCffW2xowoKxjr8RCB+o04Sqkv9xhjMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWrUAv560yymhoda+zZqx/vpuYgpJ6/fDAcE/kESrt8nRIUkFh
	Ofkkp2XvuFLF7e5DGw7exhVIIWqvdCuyou7+0BrByZu9wN+jeeKcwDPHJf9KUC9x1tEk97p7eB0
	eYK1Xv68hpY66AHLKlhv1zH8K+GbuT745L3lcgXHvPydF3QBa4936eugZq6c4z8XjlippblxdoI
	bTWjG+
X-Gm-Gg: ASbGncsIGml3HEoTKvNXG5kjyjfCsqXZWEmhwscnQZ/bOAYVwraoypcHLjiBFEwEF9F
	JCVW63HD2u3ohJfRu2zUt69nkjdljS+0wrbmtuzAot1csmcOMLxuv6lkphHO12PCNU4GJKKaGQp
	yJG2neFqGA8Q5iiFNpraHT+kd+rzcRH0AA8WLgH/oUFS0gHv7qvAqZIEhConPEQRNFM4wMN9gg6
	2rbKNSZINyCX7oKVhkXC4ezn6wcSVhhbYowoaYxHAJn67bXDM6jOzjp19THDohrXJvOrB7RSIMg
	clzLI5++R9rWLA90RMCzRsqjGJ+AVL2/EzH03xdfeCEKMDq7LSfHsCViKavzaI4V
X-Received: by 2002:a50:ed87:0:b0:608:40bf:caed with SMTP id 4fb4d7f45d1cf-60e3a8f3b4cmr2512626a12.7.1751389917970;
        Tue, 01 Jul 2025 10:11:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu8J6lVnS+AjHzqRmWb7aXWSa8lc+z3NV7ufWDiI84tWqPRb7bwIpffBsf/O52QDBXHBTQ1w==
X-Received: by 2002:a50:ed87:0:b0:608:40bf:caed with SMTP id 4fb4d7f45d1cf-60e3a8f3b4cmr2512601a12.7.1751389917513;
        Tue, 01 Jul 2025 10:11:57 -0700 (PDT)
Received: from t14s.. (adsl-6.109.242.31.tellas.gr. [109.242.31.6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bbea9sm7818156a12.1.2025.07.01.10.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 10:11:57 -0700 (PDT)
From: Ioanna Alifieraki <ioanna-maria.alifieraki@canonical.com>
To: baolu.lu@linux.intel.com,
	kevin.tian@intel.com,
	jroedel@suse.de,
	robin.murphy@arm.com,
	will@kernel.org,
	joro@8bytes.org,
	dwmw2@infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [REGRESSION][BISECTED] Performance Regression in IOMMU/VT-d Since Kernel 6.10
Date: Tue,  1 Jul 2025 20:11:54 +0300
Message-Id: <20250701171154.52435-1-ioanna-maria.alifieraki@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#regzbot introduced: 129dab6e1286

Hello everyone,

We've identified a performance regression that starts with linux
kernel 6.10 and persists through 6.16(tested at commit e540341508ce).
Bisection pointed to commit:
129dab6e1286 ("iommu/vt-d: Use cache_tag_flush_range_np() in iotlb_sync_map").

The issue occurs when running fio against two NVMe devices located
under the same PCIe bridge (dual-port NVMe configuration). Performance
drops compared to configurations where the devices are on different
bridges.

Observed Performance:
- Before the commit: ~6150 MiB/s, regardless of NVMe device placement.
- After the commit:
  -- Same PCIe bridge: ~4985 MiB/s
  -- Different PCIe bridges: ~6150 MiB/s


Currently we can only reproduce the issue on a Z3 metal instance on
gcp. I suspect the issue can be reproducible if you have a dual port
nvme on any machine.
At [1] there's a more detailed description of the issue and details
on the reproducer. 

Could you please advise on the appropriate path forward to mitigate or
address this regression?

Thanks,
Jo

[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2115738
