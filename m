Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF6F26A0AB
	for <regressions@lists.linux.dev>; Fri, 18 Apr 2025 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744964974; cv=none; b=WGKz7IPkgTLJCztCAFVddYMupxvyO0uY0PaeD4zX15x86PKjCiguMTXSAh0PxYnUbRVY0PB1cODOIrh6eV95lTJ9HDFGoVRG5D8ZH6u0pkNeSz7Cf3yNnRlfPXnK8m1WWrFiKRyQDaU7vXubmfrRm++7qZasOd6gAKIDSzrxvmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744964974; c=relaxed/simple;
	bh=s92j6pxzvlqV+3o2hee8gDhoG89WN1vgnuclnd0mk+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ehyTs0wrUNzCXknN4X3zt9wNxjOMV28UrQUZDg3vCc54gn7uqSQLMCUaO6UY04AqB6Um8jlO2Ralp2noxN4bFgTB+t+XOq1GrRGRSGPKRtpQHIju4DAbG3b6xuUoiQkm0F7hwl65Rj1020TLSiHk4IskekYW6R+f9Pp5LB1K81E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkZgond5; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkZgond5"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54996d30bfbso1557378e87.2
        for <regressions@lists.linux.dev>; Fri, 18 Apr 2025 01:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744964971; x=1745569771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s92j6pxzvlqV+3o2hee8gDhoG89WN1vgnuclnd0mk+Q=;
        b=CkZgond5E0ciVMHf+YabUqe62QIMnXn3et5noZvyFHI+w9+ilSBPSC01SD8tMgJkt3
         7aij+0GxGRDN4S23EBJ5GziGO2BY8tftKtMoOV9YWN+eXiYqU5Q8tMCKMfiVCbjevplk
         aDylRmVzl7wIvvdF0kHwzHg4i/M+9NpP4xxwoQjifQRWCUlG5ndmq+dKQDfCx0S/TTNb
         D/21fvb+JVm/ZLraTZM4Osoa5eqkqhkeCILBuUam3CNnyFF6df7s8xQyyWOwSLM78J/g
         fHnHuZakyw3ykkUnEjIpAyY5yclDMezq/9Fry/alT6bcyXLV0quEJLGmQ/WdUgZl2SQ0
         Tz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744964971; x=1745569771;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s92j6pxzvlqV+3o2hee8gDhoG89WN1vgnuclnd0mk+Q=;
        b=H28Kr/MYlB5FxdkV1h+iApj+Yn1Q5RgPYW/k8xWkfM2BLU6abDDPX6g3ZxtOtmUisf
         ouHd36MM0JNc+pFqB9XzCMDxqA6CayuiNHi7gaZqS5mooHPsX1IiPd6bDZLmqucRyJmO
         JaZGyQaxHMxy46BDpcuqqRC/txwKlO0YAZQUondbP0NUV0ULH6XSCz9PLU5beaL5EbXD
         3jMfC750IPaLYz3//YrlzgfrV8dldiVm0vwuciDsVS+kdoBHgjMmTlGxELFeNApy14+F
         8xa3uecuUvQ2KfECmmHpws1bVGQ+Akvzn+fDaLVl1VzlO2Flz2jFIDHLKa0OH3LqfK8b
         x6Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWuA+5XLNYdogoDNVPhj3N54Rqg3Tyd00BOPaK35GbY9+lanm86vZ1ElnUw3cdinuAhbxgD3bDJ/CekfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVQ8zLyg+baDDU4hUkxZ01DqOJfFGuStq5iPbI9eep+RXCGwNa
	2RXgyoM1Kgc0gr+mgQH/0FMFoFD5sJQ8/rAGpIoZsfVkSUuatOaYOcPuwA==
X-Gm-Gg: ASbGncv1fCTxbV9oogtTeRW1/DEOIYIHdkHUxuMnOIiTKE4lAoeYx7KHaqkM4gn12wc
	VSk1yiH8QdjRILa7lN9QSTet1EOGyJwGkuEFN3h96pp5KnJyOZda59kN3S4xRwl1wsoQCb1ty2L
	o1uribwxr6XpBf9QRcrZGJj+fJPgYihEkCYmYuJeCjK2pyopL7BcHjPuO1GFsnMAMzzi/5mHFVQ
	8+g6tp+7V44bMhjf7PXxtKzCVQbnXv5poIFVL19vqhxePgsUaEuVVV4WwtteGq+6LxatQDT4D6T
	6ZUV0bc1rEsa8093GN7tkW8qpt1PpapDZT345SY3RLv41dyjlKKdqADZ1w==
X-Google-Smtp-Source: AGHT+IFUTm0W49Qs/USupxCHL/NXGEOwE+ROyG8Iv52IIXe6ndsNi4djYlFd0wAdt3CQ7vpCPkN3hw==
X-Received: by 2002:a05:6512:2346:b0:545:e19:ba1c with SMTP id 2adb3069b0e04-54d6e62cb0amr470052e87.19.1744964970781;
        Fri, 18 Apr 2025 01:29:30 -0700 (PDT)
Received: from foxbook (adtu187.neoplus.adsl.tpnet.pl. [79.185.232.187])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5e524csm129527e87.182.2025.04.18.01.29.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 18 Apr 2025 01:29:30 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:29:26 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: [REGRESSION 6.14] Some PCI device BARs inacessible
Message-ID: <20250418102926.690ac42c@foxbook>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

This is a heads up that an apparent PCI regression has been reported
and mistakenly assigned to USB in the kernel bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=220016

Visible symptom is missing USB devices, but the whole controller fails
to probe, apparently due to devm_request_mem_region() returning NULL,
see drivers/usb/core/hcd-pci.c and usb_hcd_pci_probe().

Same systems also show a similar failure with some AHCI controller.
It seems specific to particular ASUS AMD motherboards.

Somebody found that disabling CONFIG_PCI_REALLOC_ENABLE_AUTO helps.

That's all I know, reporters can be reached via bugzilla.

Regards,
Michal
