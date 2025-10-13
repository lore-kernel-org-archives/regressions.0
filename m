Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73D32EB5CF
	for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760342672; cv=none; b=RGSDxOXhgQxBQjDf1vouq02fdkbVOtZdhUd3vdsGnpGsNjlCIWp70lYAIVVh140rHDRHVzJR45mSFHbQaJka1fAaMUUjsKyhWT0lB0taF0ATolbkRS1cHcSe8FIB8YVaT5iJwXKGTYY4wavFkest4UZMU1YSTsbA5uGwZ55rZ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760342672; c=relaxed/simple;
	bh=BLo8HuhReAxGmZOqi6gBCCfDhLhZHN1x49/Tmthde5o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ofrppWkhmf5MTA9VdjOe89KFQw7RaY6YYt4qrkKCRHl4FV6C2/VlyQFFXsOKRn6PiCdL4Cg1FufSGADis+A7WZu8w0wAp6bmSWpSGwONMdcQFuY0R2ODxQ0r7RPLyDONcchN1SwYnPwC0jeUG4Hk23oCuKYHxbDCwfIzUytJee0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6wKkxjJ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6wKkxjJ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-634a3327ff7so7960143a12.1
        for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 01:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760342669; x=1760947469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSWleg5SNuU8k4snLkQWjinhkoTu4SXIKrR4fKSJTig=;
        b=F6wKkxjJ3HiS0XjVU2+0giJcvUATcL3eFCcKPVP2ZFsG7PzYOYSjqvdgFBHRf8OvJG
         pO2ZuB9FdWdYJI6628mgN27SezOhi5vQ6dyLurZTwyFv0JClf/rki7WxjvIpEAZBQtuH
         +DCIMXtxNXiJ/nSITxMBGYm4lpgpuWINY9ksyOzo6MEmRrCHqkVV4EGwyGJSxdL2a68Q
         l2p/B0Diee3RZAwzwJN053p8HDQoZMIMy/n9Pm6xZoLJbAsBtKwIt3/Xp+OWXaC3KiCS
         fm8Zg9HIT3uEZLuWOX5ybtFLyYRx/BnEpv7qtTp88DDUpnCGqHI6ijUgPMfMXIBHliwv
         aGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760342669; x=1760947469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSWleg5SNuU8k4snLkQWjinhkoTu4SXIKrR4fKSJTig=;
        b=PUeAvhAudKAo4ezuT33Nd8UrYmpmVRva+j8giy7wa1bzaDPVEUMphHXGyXKZ3w9x7z
         ouexak5bvYiFzY4lz71RQ0APoIP70n0ihlT8MuOsohO4lRttD/GSUhvXwzx8LTtOHsN1
         wRgRrHJH5kY3LqUcOWzDtwZyWOMF4tkZuu3pHmA1VkZhFPSLvFAu6+LQvOx/4E1gYI0u
         60W14gil98D0jmIusClFptgs+KpPOGADSIqQOhj7dRLI7ur0sM7SUgEN2Q6f+F2GYVU1
         ggQw/wJCdeuNDVWfaGyTPXpOFChbHmiiy78hBIOsisyHSwlDReeOWdZrTAfBa0iNLwFA
         jNag==
X-Forwarded-Encrypted: i=1; AJvYcCWR1q1Mw5yODq104BuC+rsa6QEvLbUcZbRgKZi+ZEoolC7E053SME9r/kUj7LCamZuB9ADXwdbuoXB2Mg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1WX0bOs/n54xl3hU5AfN1z6uQHrA0econyv5onli76IbrumRX
	chSFeT3R3827SFwLziG+HEzo4gJmIv8f6SG+MlTOC+SBJV14//XF4DdJ
X-Gm-Gg: ASbGncu+u9NomtZOkASQOyyoYe4ByAcFlPA0ow0lBiuyQdUNSYTqZzgqUTKJybWAlHc
	JEmpzJ64apbuXDp8ssmff6+ZQCpDupNmtC0cVBsMLydW8iEisw3flg0eeojOl71W1MuyJ90mxjX
	srBii1J2mKJg68gmsg7f/jKdTsQu8E6Na5gedE5657keHXt9Nnu28XlLpqFalJ5mntnhhKqJyrY
	1HU1DIPDF/8nqzAwvQHoJgOI78bdrU2SkHUBi/NSz2AQRFqXxyI3dUq9eVn/1K6Nc2X3yBAUbme
	7lBdXei4m4LL4oWA7hKxWYZKIaU+XlsSz76WKHn34N7PDHcBASAoWOKB/2YxIHtgvdp/N9GlTEW
	g7qrXHN2FK08zf2bC1PyswX5VQ8TJSUj8CwglHgniCRYAGHkJ+DqPdHYc3ufRMN+Z
X-Google-Smtp-Source: AGHT+IHDoW9D++R2OZVwNusZrk/tUB485ZKXOiyFpPGgdo7RejEQM3utsIdE/iCJa+2LRQBwUUgQpQ==
X-Received: by 2002:a05:6402:909:b0:62f:6759:3b09 with SMTP id 4fb4d7f45d1cf-639d5c59e04mr17273494a12.30.1760342668689;
        Mon, 13 Oct 2025 01:04:28 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c133f58sm8380542a12.30.2025.10.13.01.04.27
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 13 Oct 2025 01:04:27 -0700 (PDT)
Date: Mon, 13 Oct 2025 10:04:24 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Arisa Snowbell <arisa.snowbell@gmail.com>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>, Michal Kubecek <mkubecek@suse.cz>
Subject: [PATCH v2 RFT] usb: xhci-pci: Fix USB2-only root hub registration
Message-ID: <20251013100424.42d5b9d2.michal.pecio@gmail.com>
In-Reply-To: <21741b98-4844-4218-8bd9-10b8bf5cd869@linux.intel.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
	<CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
	<CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
	<20251008082055.5646dadc.michal.pecio@gmail.com>
	<CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
	<20251008130532.49922d58.michal.pecio@gmail.com>
	<CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
	<20251008223406.13f16f19.michal.pecio@gmail.com>
	<CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
	<CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
	<20251009131444.2c221922.michal.pecio@gmail.com>
	<90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com>
	<20251009152703.72e780b4.michal.pecio@gmail.com>
	<b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com>
	<20251013092250.699bf60f.michal.pecio@gmail.com>
	<21741b98-4844-4218-8bd9-10b8bf5cd869@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

A recent change to hide USB3 root hubs of USB2-only controllers broke
registration of USB2 root hubs - allow_single_roothub is set too late,
and by this time xhci_run() has already deferred root hub registration
until after the shared HCD is added, which will never happen.

This makes such controllers unusable, but testers didn't notice since
they were only bothered by warnings about empty USB3 root hubs. The bug
causes problems to other people who actually use such HCs and I was
able to confirm it on an ordinary HC by patching to ignore USB3 ports.

Setting allow_single_roothub during early setup fixes things.

Reported-by: Arisa Snowbell <arisa.snowbell@gmail.com>
Closes: https://lore.kernel.org/linux-usb/CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com/
Reported-by: Michal Kubecek <mkubecek@suse.cz>
Closes: https://lore.kernel.org/linux-usb/lnb5bum7dnzkn3fc7gq6hwigslebo7o4ccflcvsc3lvdgnu7el@fvqpobbdoapl/
Fixes: 719de070f764 ("usb: xhci-pci: add support for hosts with zero USB3 ports")
Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

New in v2:
- don't set allow_single_roothub twice, it's harmless but lame
- credit and Cc another reporter

 drivers/usb/host/xhci-pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 13454bef14d3..d292adc65e5a 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -588,6 +588,8 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
 	if (!usb_hcd_is_primary_hcd(hcd))
 		return 0;
 
+	xhci->allow_single_roothub = 1;
+
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_acpi_rtd3_enable(pdev);
 
@@ -643,7 +645,6 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	xhci = hcd_to_xhci(hcd);
 	xhci->reset = reset;
 
-	xhci->allow_single_roothub = 1;
 	if (!xhci_has_one_roothub(xhci)) {
 		xhci->shared_hcd = usb_create_shared_hcd(&xhci_pci_hc_driver, &dev->dev,
 							 pci_name(dev), hcd);
-- 
2.48.1
