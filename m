Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514472E2DF1
	for <regressions@lists.linux.dev>; Thu,  9 Oct 2025 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760012962; cv=none; b=t2cDgqRwZK9NWKVQsaaTw1aEFXePWy5DPM3AqewNviT7HsSXVsit+QQ9QHoAXFAniu8RqdL7Wh6pooepcJd5jdAxs061CXvf45NqidHFgjaV4cFZtR+eqcmyQv+2tBdodgsDlMhfs/LxVg66JJ07NRpxci/Jqj33L4GMMIsy4UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760012962; c=relaxed/simple;
	bh=VzdC46ij9og/QMv5wDDGRQOuoWac6/8T3RkbIGb96os=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E3D8uqHZMs6BO74bKdPGHZbx364JAQ5Yqup9T6oAMlEyYvuYPXGNI91kWuuM0zNZnQ048LCyxnOJ64g1ayqCeLt3IU1sQ4thXNdY6dx3zZZsgds1WGNEw3hNUDYIRnLv+tXS++Jhg5Q4sll3kkXZ5MIfRrDuf5oqVByUaQEs/Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYGwyeX2; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYGwyeX2"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso1841260a12.1
        for <regressions@lists.linux.dev>; Thu, 09 Oct 2025 05:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760012958; x=1760617758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyW/MRHSFiY33jmW9b/P7thbCXCFOf6rw+BoiTwW0Y8=;
        b=NYGwyeX2e9at61Kv0ev8vRMMIfbbwAM8mDA+Nf5ZvJhLY8XxS4h8hHJAw6psptQCvZ
         WQFTiWTWlEB9TlmOf02lfn/O7dxsz/kKJ6QVd+TrZBrPMNCOC38rCNmC8j0a2PTOcGXq
         IwiD5O24Q6uVxwW17LhL0DaY7oZbHFmILT2Xt1kdMnnwzwpJpI7NCAz/I7kQjyZ8nX99
         PkGb45V7pXbu58w3aVdQb3fNU/U6iLt6J7rKl6nEZC5C/Pcez9fQRFpRqZc0owLmevzA
         jcNgxU+3sRc28zgSbLbtYhn8sgf00N78I1gyLtUW83iWR8Tjy5haRMQnbkYDHrIBwmVm
         6UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760012958; x=1760617758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyW/MRHSFiY33jmW9b/P7thbCXCFOf6rw+BoiTwW0Y8=;
        b=hEMnv3SmQXDZlSYPDNcDFo0FIPaA83CiADh3kOqDql3k6sdB4kMZUWLtSonksTCwG3
         5HdrrsAeceBjryuG/oQViYW8Qu7iur6VfAhwQdwaASl3Iyi7mLKcSIAIgCXymTTnQlOc
         1Z6BrWz665c5xO4bEL8KhKqc2eBvnXSdqn3mZeWivk0oeKTv4pEEvtvSl1sip+S7EG/f
         AANZswH1yXbfgpRWnSa8m6hGvpnc02jEEM0U/zti2jG55vHuqNmNpT8KWoH8WOufy42R
         qesvWw/FHq6HZ4a6YEEk3/V1HkBckyQ0pMBfYTSCsPYXjJyItjSu1iCGoQLdFOVMCVTk
         tZ3A==
X-Forwarded-Encrypted: i=1; AJvYcCX2BQ5UqXVgU1RASmcudWSR7B4hJyAXteFRMo5bPwfbl6cLB4zmL/4pbTIKlPg/1+8Gt+5G9rHgchs8jg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwaotVIL8qt4C6JxL3YJFR36sv2SNCRmiRuFRcnrFrjR7BZYNHG
	Nz1pK40FEm4oBzY7VIAkKN07d4wA4/4JDKsUod5F/+01aUqMPmCv60te
X-Gm-Gg: ASbGncu15N+FFnfBWzsbuCUZ0M7Xtcl0QyE0g7pnpUiP+wOJWHw7UcDxh4qXlFB+bhW
	3MeBQjhok11MP+fSzJ7NXxQnTcVDHHgNMRTssGzOhE4SEKqHAvIKAG2hjgvhfyn+XdcJ1LT34kK
	hVgnmKGtHHfLqIiAA+nF6YGWlNz601exCDeRGcf0J0jKtuDhRTBfdOjQQNpBEwwRC92hacODfHF
	8WKVxDA5Z7kRs32yMfv3C9HrIxijr0bQSZKwTCeVEe3xow+WlKhbGHTDh0WhxujO39O0YopxU1d
	TzcjFnRvz/UleSS+zxvjmBsG9vDwR0oWoo7r5J7PRNc5e3ehQpMDDo2v2LpISXkw6a3fL+JqlaB
	OFdBQYWgyLIQEmLIX9akEOAzaXiErI7OHY0MQld+SeDGY1pP1QOz/cLAQhEk/oHwVBvLo7w==
X-Google-Smtp-Source: AGHT+IEUFt2opNB1FkGPRiWGkz3n+VBsnJz1zaUezVI3q1ZBqp6vQVbi/Nvy0LOYCR/GmfXBoc7uag==
X-Received: by 2002:a05:6402:51c9:b0:629:e50c:b058 with SMTP id 4fb4d7f45d1cf-639d5c52cdamr7113841a12.28.1760012956991;
        Thu, 09 Oct 2025 05:29:16 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f30fb7dfsm2279630a12.19.2025.10.09.05.29.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 09 Oct 2025 05:29:16 -0700 (PDT)
Date: Thu, 9 Oct 2025 14:29:11 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Arisa Snowbell <arisa.snowbell@gmail.com>, Mathias Nyman
 <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci-pci: Fix USB2-only root hub registration
Message-ID: <20251009142911.6069c164.michal.pecio@gmail.com>
In-Reply-To: <CABpa4MC-pij0Fczh-mH3zc+Ey2ALX70OfxX=cG4om7R6WMdRBg@mail.gmail.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
	<20251007231709.6c16802e.michal.pecio@gmail.com>
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
	<CABpa4MC-pij0Fczh-mH3zc+Ey2ALX70OfxX=cG4om7R6WMdRBg@mail.gmail.com>
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
caused problems to other people who actually use such HCs and I was
able to confirm it on an ordinary HC by patching to ignore USB3 ports.

Setting allow_single_roothub during early setup fixes things.

Reported-by: Arisa Snowbell <arisa.snowbell@gmail.com>
Closes: https://lore.kernel.org/linux-usb/CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com/
Fixes: 719de070f764 ("usb: xhci-pci: add support for hosts with zero USB3 ports")
Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---


Arisa, does this version also work?


 drivers/usb/host/xhci-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 13454bef14d3..cb7f5dd34333 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -580,6 +580,7 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
 
 	/* imod_interval is the interrupt moderation value in nanoseconds. */
 	xhci->imod_interval = 40000;
+	xhci->allow_single_roothub = 1;
 
 	retval = xhci_gen_setup(hcd, xhci_pci_quirks);
 	if (retval)
@@ -643,7 +644,6 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	xhci = hcd_to_xhci(hcd);
 	xhci->reset = reset;
 
-	xhci->allow_single_roothub = 1;
 	if (!xhci_has_one_roothub(xhci)) {
 		xhci->shared_hcd = usb_create_shared_hcd(&xhci_pci_hc_driver, &dev->dev,
 							 pci_name(dev), hcd);
-- 
2.48.1
