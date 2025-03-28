Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EF317BCE
	for <regressions@lists.linux.dev>; Fri, 28 Mar 2025 00:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743122204; cv=none; b=gBilJS8pQPpz3fEVcaUvQlMYuV4SAZO+K59E60ZR3z5OFQI72eI2CrEWCSPJXcvgjxjZdnc4APJfN5sl+RMB2nKTuotWstGhNaZ3Lv9yM1VKcf1Ltz2viSTDfP/XOH+OfhneGIywmojEgTATxebcyfZkT4vLDnCsnspyufMpLsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743122204; c=relaxed/simple;
	bh=1uII/cyHRCshxvLRtMflHYwuF0oXNl9307h44MCYgTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hMnWrx0TbreLYPapqAFmRAWhrl5BVddj8qSrI8nA2GaE+E9DRHBsGyTJpiJsDtu+4M376OMEIXmVnkalZ08235MxiWZXVK2/oeay7e5h8AXO2X2QXaz3E00uxynWqdn+pdA+k43KkG5gdL6qIXKg810CXLCa38HuuelQIaEoIAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TW6XoJpY; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TW6XoJpY"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913fdd003bso879518f8f.1
        for <regressions@lists.linux.dev>; Thu, 27 Mar 2025 17:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743122201; x=1743727001; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qV8grmpi1aEvGUG0oyJ8akE8G0+45KOa5Xv7UHoo2Dk=;
        b=TW6XoJpYAOqzcNrwaAYrUAP+LeeQbB3AjTixqPBRmNaX8uU8xEuVmd/WrJ2ZV7e3oo
         dcm+SFdJuskIea0YQTfA+vGTDJCaTaIoIsEr0Z+9xQTPfCBDP3pSHwLNFfpqq1kVqxKR
         VpmId06d9GSJpdDoVRXXYv/1EmXpSmJxW7Xwf4RPjPPz3czXlZgV85O0M9aHNInmiR9R
         wLcHFCQulyfPq7MmrNmSzWkFM6Ief9Dqo6YnUHvbPwa2Mlp29pmsTFFqDdaYBnou2V0L
         eCGkP1T+IyneXgNHfGaY87gNvGlRUzxY+NQJVPkjqdpnVeDEVikSV88gBL5OCohG/tui
         ldgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743122201; x=1743727001;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qV8grmpi1aEvGUG0oyJ8akE8G0+45KOa5Xv7UHoo2Dk=;
        b=o18cJuG+cSRxQa8p4LoxPU3mH4LfwwPe9Q0HaK9/7cD8nlMVcES43i5foywGcO85ab
         qfLY1NFZJYdgmicz7KWDEEQUFFDdcIHMl4h1wSVmsBlzPMtZG28M9l0O+zOUZSACe/bA
         grIr7gB6Jm10HKcHZdxGxrFJOKPejUQbD3IUbcwkXqw1RJGPkb3GSW7M4na185lnyofL
         KrGPEI752sggGeqV4tYaeIunxlvBO/in3BLyfoOeT48MO9n1akzZVWL87Y/oAaqKQ22q
         dXVwbts6a0FxXfpYjYZWUpl9J+3m9tbOL86ZQl7gb4yPNpaX+YfLsr0EiF0mYymODQp9
         uyIw==
X-Forwarded-Encrypted: i=1; AJvYcCWTFv9tN8BgaR+LcLP0ATU3wN+On0rNRNbwTdi88wH8skzUSgv0CUxd3yLCStIlC8Z5uAv9gRsF/lh9AQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKdywjoCVGWp1bG/qaxptz9CPHQi8uZHHsQQn/MMsGLCatcWKv
	TqanSTkBqnnfOhc594Ur1b513bYY8CnR2SayMfFqGANkxbqX/cWu
X-Gm-Gg: ASbGncvDpWWTKErQdPEj0pX2nOXk294GTRSX0EDp9M2sNBj+GcTF7H6JWb6uVhixays
	5JazO1MuIficRDQw/414XSnRFAv3nzhefFzn+WUkXrWr/8QETkgj64/OoCzc59mUe57/X19jcn3
	JRw5945mA8yIbIHiRznLknkKjYHBrQEQmaflWWdVMW1xla814eWTsp7AUcklvSyDCsHy6nmFrnD
	LqWbBZ72zMyr00wPhctVAwzbL8urLl5vuVETBUCJjVwErFw+ZsuKlbP3JSP2vhj1GLo+xYAEEmC
	oQbd1DZ+j68tMFDcIxTL4vvSNhsudoXvxZDkTM8Wp6R0ym+Db3njW3Y2v9/i1Dg03mM=
X-Google-Smtp-Source: AGHT+IEVwI1RraT3wQd9MTFlOt+UOzbpLxT0PvFHkrm6cZHemZMbCzSqwRu1DpwrXojzv26fJuOhrQ==
X-Received: by 2002:a5d:59a3:0:b0:390:f9d0:5e7 with SMTP id ffacd0b85a97d-39c0c5a05acmr513916f8f.13.1743122200460;
        Thu, 27 Mar 2025 17:36:40 -0700 (PDT)
Received: from debian.local ([2a0a:ef40:4d4:f101:e41a:977a:f788:910f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4318sm965126f8f.87.2025.03.27.17.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 17:36:40 -0700 (PDT)
Date: Fri, 28 Mar 2025 00:36:38 +0000
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"kvalo@kernel.org" <kvalo@kernel.org>,
	"Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>,
	"Berg, Johannes" <johannes.berg@intel.com>,
	"benjamin@sipsolutions.net" <benjamin@sipsolutions.net>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: [REGRESSION] iwlwifi: probe with driver iwlwifi failed with error -22
Message-ID: <Z-XvFvGigpY7JYFn@debian.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Laptop: Lenovo Legion 7 16ACHg6.
Wifi: Killer(R) Wi-Fi 6 AX1650x 160MHz Wireless Network Adapter (200NGW)
04:00.0 Network controller [0280]: Intel Corporation Wi-Fi 6 AX200 [8086:2723] (rev 1a)

Wifi stopped working in recent kernel builds:

[   20.907824] Intel(R) Wireless WiFi driver for Linux
[   20.907955] iwlwifi 0000:04:00.0: enabling device (0000 -> 0002)
[   20.912024] ee1004 2-0050: 512 byte EE1004-compliant SPD EEPROM, read-only
[   20.913666] NET: Registered PF_BLUETOOTH protocol family
[   20.913670] Bluetooth: HCI device and connection manager initialized
[   20.913806] Bluetooth: HCI socket layer initialized
[   20.913810] Bluetooth: L2CAP socket layer initialized
[   20.913828] Bluetooth: SCO socket layer initialized
[   20.917455] iwlwifi 0000:04:00.0: Detected crf-id 0x3617, cnv-id 0x100530 wfpm id 0x80000000
[   20.917674] iwlwifi 0000:04:00.0: PCI dev 2723/1654, rev=0x340, rfid=0x10a100
[   20.917679] iwlwifi: No config found for PCI dev 2723/1654, rev=0x340, rfid=0x10a100
[   20.920126] iwlwifi 0000:04:00.0: probe with driver iwlwifi failed with error -22

Bisect led to:

commit 75a3313f52b7e08e7e73746f69a68c2b7c28bb2b (HEAD)
Author: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Date:   Wed Feb 5 14:55:42 2025 +0200

    wifi: iwlwifi: make no_160 more generic

    We'll have devices that are EHT capable but don't support 320 MHz and
    those devices look like the 320 MHz capable devices, but have distinct
    subsystem ID.
    We already had the same type of differentiation for HE devices that
    support 160 MHz or not.
    Enhance that mechanism and now the _IWL_DEV_INFO macro gets an
    indication whether the bandwidth should be limited for that specific
    device.
    The subsystem ID gives a binary answer about the bandwidth limitation
    and iwl_pci_find_dev_info() compares this to the list of _IWL_DEV_INFO
    entries.

    Signed-off-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
    Reviewed-by: Johannes Berg <johannes.berg@intel.com>
    Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
    Link: https://patch.msgid.link/20250205145347.1ba406c538a5.I6e24123f60a764aedfeaaac8768c26e136c320cf@changeid
    Signed-off-by: Johannes Berg <johannes.berg@intel.com>

#regzbot introduced: 75a3313f52b7e08e7e73746f69a68c2b7c28bb2b
