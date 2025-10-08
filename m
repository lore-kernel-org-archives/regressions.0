Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47161E25F9
	for <regressions@lists.linux.dev>; Wed,  8 Oct 2025 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759962370; cv=none; b=iYNxQvOIDdhnfqo0jqDyfh72+3HRT8NoRTFhdExtIMiEnlaq8b4BEf7ld8CpQjxPUuMYPASV2Y3BbmQ9wcgZ/EUUg8P/U+7wd+1lbxwEKFMVA+aZeEfVH7tWcj6bp8L4Fihr7t7sH5w1c+VR4C37PAuF7jkQNpcEMzoMSLEhsoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759962370; c=relaxed/simple;
	bh=SSjbrzdgh/nOoql1zsGYj2WvrqyAF9J5MZIuUzoTBdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OxKE8srAvfSVOk3iPMmne9ahwf3bsIMGiOGxAy1JLmO6Nd/ZepRp1bqnoUJ4tkOy+GS3b/yZHO6EFlYop7vnZdFmhWTR7T2TL2vDnSd8FzUe/ABdjYuHVVmr5uztcMOB/8yvOWeFlMCY9SgGiwpbMEKrdOzlfYr5PY6glipYjvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAE5pDlY; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAE5pDlY"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-554a7e98e19so207497e0c.3
        for <regressions@lists.linux.dev>; Wed, 08 Oct 2025 15:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759962368; x=1760567168; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SSjbrzdgh/nOoql1zsGYj2WvrqyAF9J5MZIuUzoTBdE=;
        b=aAE5pDlYz0xgkMe4xutC2OhPRL5GfgLOEPFkVXbqgg8c3Sz5n0ebJye8X3iFJOen40
         cn1Su4ln8kwgley/104SAlVbEhWpAmqCQ7kvRfcJAp/cCUYvEaPNbiKs9+usSzRRWXkf
         4eKZQsJaDDxpqVfvPC/klT1uEHW7fXTfzF3CVnTOnl0gss/v9n8nby8hYCWRBSl/J3DQ
         hTMVOg/PVTJXRZpqGe3hQlsj714nAg3JuK3yqTB/srLTol+c9mh6HW8q5AxHsvUmUWZl
         IgMWYiBPPkT9F6KTj5bajznfksAokd10zmUK92XSU3mmLQz4AcM2pAO7yplabwPHD0bo
         i9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759962368; x=1760567168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSjbrzdgh/nOoql1zsGYj2WvrqyAF9J5MZIuUzoTBdE=;
        b=ZM+A8EUhDa9QBCSMAwtAHvaNXMLA7IOILqNEb6uIyNGipBsGT18O+NZMG78QUaJPqP
         g38Q7l0PRWpD6+ibRYqrh0pk81PbT+K2IEGLmHLn0mjvLBhBltdkT5iKCE7NOiCZDQ1N
         BArJ1eZvzL+oPCNI3rPAUpkEImEyxbMkw1ZcSRJNJ0ZJAXnOriU8DrDIxLWw0i4lWPmf
         1Z9vMWvRbnIYhqxVT0eMMsdD0G7kMeEQqaDFkKlPcOrwPdvbMybJeb4pa8CrXPQB5QXH
         K1K/dMJ8od3mqFJcea5P95TsVKGcmgEc7KkvBcddRXKkNaYWw2oOOQ3ueFZLQ4ko7NJu
         1j5A==
X-Forwarded-Encrypted: i=1; AJvYcCWlRDq3sRapZ/zJJ+ds6ap4BYAU4Xlh29kLikyc9lctjdi1E1WLW5sOfjmQ/Qh8GwFozISkN2dMcDunoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjF7mZ6WXTSEe5oRUnNQT77sF1QI+7UPHMnf0snxQcJu+P8x+V
	HD64W8UBmZGXF5GKMarlTFjt2BMmMRM8a4DoD9Osoj3/BZJB8WTm8jADg3LF7grjwMlhLnKGHuF
	skjrhONyXLRhd648BrYV/SfO9ir20Ny4=
X-Gm-Gg: ASbGncuJk/ziJcwF3xteD7+sEwMJFt+H+HnjS90d2nISGTofhQEvyWi/BiMEaj0Hpds
	l6oBOA68+DJMzPJYjjZdOAaz0ZnOcxnU9u7kYtZeo63koklEF6q0+xotQlvbdZt+WETz2+KwYP7
	BoEh9VH5gMQmyXiN5XuX0NnGpwtERTwf0ldGhHan/pkRT133GtYB2qC4JiZ3Y75g0pN/cEPqi4f
	7KhHLInG8nPqn9ERIF5WACfmfLP0/4=
X-Google-Smtp-Source: AGHT+IFc2bHUCZOVk/jSHRVhDMxkU1QLA3u78KP0usSruM30hY94G/DjGOEPi/85KUy5GXymTHlhotJcUFMrCdPFeQg=
X-Received: by 2002:a05:6122:308d:b0:54a:93be:46fc with SMTP id
 71dfb90a1353d-554b890bc3emr2323268e0c.0.1759962367723; Wed, 08 Oct 2025
 15:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
 <20251008082055.5646dadc.michal.pecio@gmail.com> <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
 <20251008130532.49922d58.michal.pecio@gmail.com> <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
 <20251008223406.13f16f19.michal.pecio@gmail.com> <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
In-Reply-To: <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Thu, 9 Oct 2025 00:25:55 +0200
X-Gm-Features: AS18NWAufrPo0--_wjTTgEstRbde3_tDtM2AG8z7OpPilyHw637Tecy3L1mXPWI
Message-ID: <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	Niklas Neronin <niklas.neronin@linux.intel.com>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

This is what I get when I use good kernel:

kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus number 9
kernel: xhci_hcd 0000:7a:00.0: USB3 root hub has no ports
kernel: xhci_hcd 0000:7a:00.0: hcc params 0x0110ffc5 hci version 0x120
quirks 0x0000000200000010
kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus number 10
kernel: xhci_hcd 0000:7a:00.0: Host supports USB 3.0 SuperSpeed
kernel: usb usb9: New USB device found, idVendor=1d6b, idProduct=0002,
bcdDevice= 6.17
kernel: usb usb9: New USB device strings: Mfr=3, Product=2, SerialNumber=1
kernel: usb usb9: Product: xHCI Host Controller
kernel: usb usb9: Manufacturer: Linux
6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
kernel: usb usb9: SerialNumber: 0000:7a:00.0
kernel: hub 9-0:1.0: USB hub found
kernel: hub 9-0:1.0: 1 port detected
kernel: usb usb10: We don't know the algorithms for LPM for this host,
disabling LPM.
kernel: usb usb10: New USB device found, idVendor=1d6b,
idProduct=0003, bcdDevice= 6.17
kernel: usb usb10: New USB device strings: Mfr=3, Product=2, SerialNumber=1
kernel: usb usb10: Product: xHCI Host Controller
kernel: usb usb10: Manufacturer: Linux
6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
kernel: usb usb10: SerialNumber: 0000:7a:00.0
kernel: hub 10-0:1.0: USB hub found
kernel: hub 10-0:1.0: config failed, hub doesn't have any ports! (err -19)

where the 2.0 USB's work, mice is powered on, with the bad kernel the
mice doesn't even power the LED's on.
In the bad kernel its missing the New USB and all.

Regards,
Arisa
