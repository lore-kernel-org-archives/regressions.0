Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6E119E967
	for <regressions@lists.linux.dev>; Thu,  9 Oct 2025 11:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760008493; cv=none; b=N+WdN8gmhkUTLImPDO/KjaJx8k39KClBsh6cOLo442A9UjaU3GXWAOP4LjlvO5yrKi74wQ2yw+qZq1z8wlC4Jss2mEBJiqUXqe9ZCZbZaTrzVR1uV/lG29UyL5AL2x/ZwRDPsXyekdiyWFWTJE/hzzLxOo7K6Hf6oQLFNmlhloQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760008493; c=relaxed/simple;
	bh=9J9nNWGV7vJp3qLFK66g+Dl/TNTTfEakolL/lYaRMwA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fo3vD1DLBdbn8X1CsNlM64FzTRTrbgw7atKaFFXKQTlOoh+NonF64nqk6z97e6JMAeCVT+789J4zWCCZRzURXpFVEXiRRfbXi4T4BTtrI9MJV3qrbWP47caHD2r+09NQsUh1TIZGpJdooEsd4j3/H324glHzH8ZFhFGh00NO/j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCUHR6zI; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCUHR6zI"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3c2db014easo165603066b.0
        for <regressions@lists.linux.dev>; Thu, 09 Oct 2025 04:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760008490; x=1760613290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLMYgsfNTFFI/O68TRr8vgYO3AsgFRuWnjyuhxCaGCY=;
        b=jCUHR6zIbq5Jfx6mH+/MyYrOd+pHd6f5enYCHEqFkh2CPlyhp+VO4SSPgMud5I1zRw
         Oknt2/ZH9ruk1pzxtCJeK88Pqqfpu8jl7YJwG0tCAXkzjVlbyiKh1EwWzBsvCXGx8tl8
         DXl7wIuVztfOI9Oxw4niPZU4xrWOBdeKcCegONntJjWyQN8NbPWufcmUbY1H02/jULoB
         9q/jYn42LgVwY1YBXozXM1xCyWcT30SKBEBjnXbPnXlkKGhHWPgGaqeGLYlnxVL2918E
         tGGjLCKLJqmxzgi7MV+biFsWgVWkPw6M8hyfNviM0Mgjhhj9iPkeeaERfphP/wYG7hxE
         A4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760008490; x=1760613290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLMYgsfNTFFI/O68TRr8vgYO3AsgFRuWnjyuhxCaGCY=;
        b=vooGFgrU5mP/eqsekDtW65fwxy6lDrA3C45D5NIapgYgevsk7S1v4i+W+nP5hwAReP
         qumiRRCVnzBwrlfK5mqqfj5XKlzvCx2edLrF97APsKGo+EtZGEW1/RL5BSjZU/vr3fdd
         O5dQcDVSYjmULLmopbMdrJw652FeCvE2mejn0fC+27+LRl2Uyp208Kd9T/PkEejrH04v
         RlnxiC/lkdYKgXSyOQbEJWszxRQUsb8/6RDbPcY7kAgZ90+pmN9yLJDoHpqEX9WBKMln
         GHecg2zF9zeVevYe7m3G/Y+SphyBiDwdc5CdAYy51aKUA5bVh6rwTsohidbvKXU9hcIb
         emLw==
X-Forwarded-Encrypted: i=1; AJvYcCUFs2c4qTT64Utn8cpR0qjazgu3oBZyuWAOqTvV49KfGa74J1p2Q/66fy9xJr9TggsbvTsFIMwkRTr6Aw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg1R1UTSOASDF0+oe5Da1W6xAiGeo/vRdSEAt7bcZ+d24Wz9IJ
	SwRPN+UgUprFIhxy4flg647XEb6Z/Mj4xcUY1NZgkHf8PeShqqFe7sKw
X-Gm-Gg: ASbGnctasYRwwEWbQhWo56ejeDUheAtst5ALOlcT+kgE8PdQQY8naQJBQN1yk3XzRlm
	hZmRRIk2VFwhGO1s/f+N5tg1Zgvs7ZtiDMon6CXggoKDM7amtviiebPUN3vIlJQ6KGgHHx8l0Ln
	YaLJsQLJFncdR4SUDVd/EwEdgDFuQTW1cZZWcF6ukp+QhsW9CY6N3OVkZy3OFIzWSXWXCZvcjQ7
	gzyaomExkvrTQkDGZFDSklQKqnakdf/i5oiWOXA2PI6uSgzifpqS4ZWaHjiaM5VVInoxaEcllrL
	08FOnZj2SI7d9Q3g2c3TkswZLeEDe/YXxxH5xTGrE1j1UjCEs9gnmtt83Zaq7WbqnjnY/xttUtR
	Ga/eJY8YbInkAxVXoc3dAFAlj+FPxrei7tJvHThCsmk5Ncr4hAZTv0DxNfZSL3CAVg5inHg==
X-Google-Smtp-Source: AGHT+IE5z2pgz+A7dCNJyyG8QIYblNGkCNhflqCvxeuwB8uHuEdSU3kMGBtjMr8q2Qj/c9XSy1qHwg==
X-Received: by 2002:a17:907:1c15:b0:b4b:4692:6927 with SMTP id a640c23a62f3a-b50aa292d83mr791802766b.23.1760008489434;
        Thu, 09 Oct 2025 04:14:49 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4c7396b863sm1148406566b.65.2025.10.09.04.14.48
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 09 Oct 2025 04:14:48 -0700 (PDT)
Date: Thu, 9 Oct 2025 13:14:44 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Arisa Snowbell <arisa.snowbell@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>, Mathias Nyman
 <mathias.nyman@linux.intel.com>
Subject: Re: [REGRESSION] [REPRO] USB-A devices not working on boot after
 recent USB merge
Message-ID: <20251009131444.2c221922.michal.pecio@gmail.com>
In-Reply-To: <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
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
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Oct 2025 00:25:55 +0200, Arisa Snowbell wrote:
> This is what I get when I use good kernel:
> 
> kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
> kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus number 9
> kernel: xhci_hcd 0000:7a:00.0: USB3 root hub has no ports
> kernel: xhci_hcd 0000:7a:00.0: hcc params 0x0110ffc5 hci version 0x120
> quirks 0x0000000200000010
> kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
> kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus number 10
> kernel: xhci_hcd 0000:7a:00.0: Host supports USB 3.0 SuperSpeed
> kernel: usb usb9: New USB device found, idVendor=1d6b, idProduct=0002,
> bcdDevice= 6.17
> kernel: usb usb9: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> kernel: usb usb9: Product: xHCI Host Controller
> kernel: usb usb9: Manufacturer: Linux
> 6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
> kernel: usb usb9: SerialNumber: 0000:7a:00.0
> kernel: hub 9-0:1.0: USB hub found
> kernel: hub 9-0:1.0: 1 port detected
> kernel: usb usb10: We don't know the algorithms for LPM for this host,
> disabling LPM.
> kernel: usb usb10: New USB device found, idVendor=1d6b,
> idProduct=0003, bcdDevice= 6.17
> kernel: usb usb10: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> kernel: usb usb10: Product: xHCI Host Controller
> kernel: usb usb10: Manufacturer: Linux
> 6.17.0-1-mainline-12298-gf5bd2142c274 xhci-hcd
> kernel: usb usb10: SerialNumber: 0000:7a:00.0
> kernel: hub 10-0:1.0: USB hub found
> kernel: hub 10-0:1.0: config failed, hub doesn't have any ports! (err -19)
> 
> where the 2.0 USB's work, mice is powered on, with the bad kernel the
> mice doesn't even power the LED's on.
> In the bad kernel its missing the New USB and all.

Okay, thanks. I now see what's going on.

I have successfully reproduced it on a normal controller by patching
the driver to simply ignore any USB3 ports. With this patch, no root
hubs are registered at all until I revert the "bad" commit.

In my case it's an idiotic little problem:

xhci_pci_common_probe()
{
	usb_hcd_pci_probe() {
		// allocate xhci
		xhci_run(xhci);
	}

	xhci->allow_single_roothub = 1;
}

The thing is that xhci_run() needs allow_single_roothub to already
be set when it executes, but we can't do it before xhci is allocated.
And some non-PCI drivers don't want it to be set.

Can you check if this patch fixes things for you?

It is obviously not a real solution, but it's good enough for xhci_pci
and sufficient to check if no other problems remain in your case.

---
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 485ea7fc0433..354443316bfb 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1735,8 +1735,7 @@ static inline bool xhci_hcd_is_usb3(struct usb_hcd *hcd)
 
 static inline bool xhci_has_one_roothub(struct xhci_hcd *xhci)
 {
-	return xhci->allow_single_roothub &&
-	       (!xhci->usb2_rhub.num_ports || !xhci->usb3_rhub.num_ports);
+	return (!xhci->usb2_rhub.num_ports || !xhci->usb3_rhub.num_ports);
 }
 
 #define xhci_dbg(xhci, fmt, args...) \

