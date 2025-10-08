Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3494F29B77E
	for <regressions@lists.linux.dev>; Wed,  8 Oct 2025 21:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759958966; cv=none; b=L7fnk/a3WxRKEq6DEyThbRAyBELAzQyUORBZLon65m6TqoNWmn1PBbCIXwBY8qpRSJjK8sA3pQV9KGmniUe+lK/fcDV/U6iXS8Bi6u/+bL/sSPb1fL+7gHj8sWWbVNGpM8s5HzLpaVQsmHsZgXeiieQl3cQcVlkCAXdcm64WJv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759958966; c=relaxed/simple;
	bh=iGbUpMqiX9ui1CJT84Evg17hTmS1Ypmw1iPJWevxnQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hx9bY1QGgIcirO0Sy/wcjqhjvAZCGzw9H0VcmUOSOybH+2qV0TpxxqmQnibiIcjOL+RHAUcJ8tKbeRDZ9ZF0xtscLrgr9f+7jillISlniAhvuTRAsXX5YgMPWXDDHiIwixtQ+89SHKI15kzF67uzCXlTABxIWofRuSlqEifwf8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mW0MAxNW; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mW0MAxNW"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8e1d6fd99c1so86113241.2
        for <regressions@lists.linux.dev>; Wed, 08 Oct 2025 14:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759958963; x=1760563763; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KjAnB+Zzyfvp4Pp2ybIwv27YmlWXv103r2xKYoV6VSg=;
        b=mW0MAxNW2LRhxVyFkuV2yfKOl0KITySTQGMc0+/c00r/nF8v8+fsc81cy8ah9kd+MY
         llTM+KSdglYceQkvL4J6kViOK35pAW6ym6e3DFxNd22FL4j9X6aZfvX9MgeUxZ+MaD/i
         9OMxqk8nvyLhQfAAhfETGCjLfbTOitUPPksp4HvZb01+Dck4cdaA0dcAu5EL9txG9+pS
         5k5A+W+2COnTRId3Pmyh88AXVGlun/BsNMk7Y0DhCi8eRfh8Gyfj/piddR+JA2i0I/fZ
         hU8NJitim2gMW8Auku4SUkbGOU/Zi1GT7olO8F3YEysbe1J4VcYbCAgQh2KbOKHocypc
         Iazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759958963; x=1760563763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjAnB+Zzyfvp4Pp2ybIwv27YmlWXv103r2xKYoV6VSg=;
        b=xEAZS8+zYkhF8yrYRPjMcZ304rmurk6cBwjIMCK+tMybr+GN+juSyXVd7s3GGgDTGY
         uqbCipjBWzypEPjTG3sb7w/z0Ye+xnDoYyevvxVePL2WiyqqeF+p9HcFSTHy56DxTZqW
         L0po2QfWSKV0b2WZBervWN11YDQDhOLGnMqDVXvI7SKPkwlrfptiMz28LWJGiEa3gT73
         d0V/sBX8yg+5in30/4mfOi7xzfeYp18EV5nZxhGsbR66IbcA2fdzbXNTGYGtJGFGOOZB
         TeNdX8CVAExqnmVAoR5f2PFADLzX3wtUMVXdcUzQp11eEfbaVCSDs+1C6uQjnEtdPSfO
         72+g==
X-Forwarded-Encrypted: i=1; AJvYcCWuHz+ad8Z2Fn0aIkduWNXIXaVvKGrIqOjycIoFnff2UE4XKIqvsQBJW2LYpxsWErPOEZVynPaIHQND6g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg5JwwB9SQHgFKUXM3Q1p6QEIEY4CGWsosURq53BrHvYCHcTVA
	ftBK/SklUwuyuyS1A5jolNRQF2mDSeMN5gSZtJif2g4eNiKbAV/z+s6A5jhY6HApI5IxcLhCBfB
	mABy/ldAj99fFsLtuf+fo0Nwi/akkRXw=
X-Gm-Gg: ASbGncuQk1iDYZM7qFYQkTegPrz0wjSUoROkToPBy+/8hOdJIbsL30+z1bjokBLx6l0
	346hbwGcNrnFsUvjNaa8nJ1ZnTVmGUmaElwRI3XfbXrJ5lnERzGK+fgkuq9iXp88h/vE/KVeSQL
	yABH0vYiAtH74rDK4kicjgL8hMPLOpJTwnTdE/YGLacnJ/9AD6Y8okKZsyhGFLVQtfMYbhyH83C
	usTIIzjeqx23N73Pzl/ukDRB+iL6sE=
X-Google-Smtp-Source: AGHT+IG+pulNGykYUZB003oWExF+n2LFA14Bx2e0GXWW+ufKuzx4sIaQlm0rWhv3xzSpTjaJhHi37DacnR9TEvDf61c=
X-Received: by 2002:a05:6102:510c:b0:5a4:138d:b13c with SMTP id
 ada2fe7eead31-5d5e237aff6mr2256654137.29.1759958963084; Wed, 08 Oct 2025
 14:29:23 -0700 (PDT)
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
 <20251008223406.13f16f19.michal.pecio@gmail.com>
In-Reply-To: <20251008223406.13f16f19.michal.pecio@gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Wed, 8 Oct 2025 23:29:12 +0200
X-Gm-Features: AS18NWBwuMRLNTll_iFqjIE2B8neeAzZfwmvOISoejS8xJ94lLIRW25Z1lS-dY4
Message-ID: <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	Niklas Neronin <niklas.neronin@linux.intel.com>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I looked into the dmesg and found this:

kernel: xhci_hcd 0000:7a:00.0: xHCI Host Controller
kernel: xhci_hcd 0000:7a:00.0: new USB bus registered, assigned bus number 9
kernel: xhci_hcd 0000:7a:00.0: USB3 root hub has no ports
kernel: xhci_hcd 0000:7a:00.0: hcc params 0x0110ffc5 hci version 0x120
quirks 0x0000000200000010
kernel: xhci_hcd 0000:7a:00.0: Root hub is not suspended
kernel: xhci_hcd 0000:7a:00.0: Root hub is not suspended
kernel: usbcore: registered new interface driver usbserial_generic
kernel: usbserial: USB Serial support registered for generic
kernel: i8042: PNP: No PS/2 controller found.

went back into the bad kernel and enabled the dynamic debug, unplugged
and plugged the mice and ran the unbind and bind on the 7a controller.

got this log:

[  203.432169] xhci_hcd 0000:7a:00.0: Root hub is not suspended
[  203.432395] xhci_hcd 0000:7a:00.0: remove, state 1
[  203.432404] xhci_hcd 0000:7a:00.0: // Halt the HC
[  203.432410] xhci_hcd 0000:7a:00.0: // Reset the HC
[  203.433638] xhci_hcd 0000:7a:00.0: Wait for controller to be ready
for doorbell rings
[  203.433653] xhci_hcd 0000:7a:00.0: // Disabling event ring interrupts
[  203.433660] xhci_hcd 0000:7a:00.0: cleaning up memory
[  203.433669] xhci_hcd 0000:7a:00.0: Freed interrupters
[  203.433670] xhci_hcd 0000:7a:00.0: Freed command ring
[  203.433674] xhci_hcd 0000:7a:00.0: Freed segment pool
[  203.433675] xhci_hcd 0000:7a:00.0: Freed device context pool
[  203.433675] xhci_hcd 0000:7a:00.0: Freed small stream array pool
[  203.433676] xhci_hcd 0000:7a:00.0: Freed xhci port bw array pool
[  203.433676] xhci_hcd 0000:7a:00.0: Freed medium stream array pool
[  203.433706] xhci_hcd 0000:7a:00.0: xhci_stop completed - status = 11
[  203.433831] xhci_hcd 0000:7a:00.0: USB bus 9 deregistered
[  203.433921] xhci_hcd 0000:7a:00.0: xHCI Host Controller
[  203.433924] xhci_hcd 0000:7a:00.0: new USB bus registered, assigned
bus number 9
[  203.433933] xhci_hcd 0000:7a:00.0: // Halt the HC
[  203.433938] xhci_hcd 0000:7a:00.0: Resetting HCD
[  203.433939] xhci_hcd 0000:7a:00.0: // Reset the HC
[  203.435167] xhci_hcd 0000:7a:00.0: Wait for controller to be ready
for doorbell rings
[  203.435169] xhci_hcd 0000:7a:00.0: Reset complete
[  203.435170] xhci_hcd 0000:7a:00.0: Enabling 64-bit DMA addresses.
[  203.435170] xhci_hcd 0000:7a:00.0: Calling HCD init
[  203.435171] xhci_hcd 0000:7a:00.0: Starting xhci_init
[  203.435172] xhci_hcd 0000:7a:00.0: HCD page size set to 4K
[  203.435177] xhci_hcd 0000:7a:00.0: Device context base array
address = 0x0x00000000ffff7000 (DMA), 000000009a3b17b6 (virt)
[  203.435181] xhci_hcd 0000:7a:00.0: Allocated command ring at 000000005fb9657f
[  203.435181] xhci_hcd 0000:7a:00.0: First segment DMA is 0x0x00000000ffff6000
[  203.435182] xhci_hcd 0000:7a:00.0: Allocating primary event ring
[  203.435186] xhci_hcd 0000:7a:00.0: Allocating 2 scratchpad buffers
[  203.435196] xhci_hcd 0000:7a:00.0: Ext Cap 00000000715dddb0, port
offset = 1, count = 1, revision = 0x2
[  203.435197] xhci_hcd 0000:7a:00.0: xHCI 1.0: support USB2 hardware lpm
[  203.435198] xhci_hcd 0000:7a:00.0: Found 1 USB 2.0 ports and 0 USB 3.0 ports.
[  203.435198] xhci_hcd 0000:7a:00.0: USB3 root hub has no ports
[  203.435199] xhci_hcd 0000:7a:00.0: xHC can handle at most 64 device slots
[  203.435200] xhci_hcd 0000:7a:00.0: Setting Max device slots reg = 0x40
[  203.435204] xhci_hcd 0000:7a:00.0: Setting command ring address to 0xffff6001
[  203.435208] xhci_hcd 0000:7a:00.0: Doorbell array is located at
offset 0x2000 from cap regs base addr
[  203.435214] xhci_hcd 0000:7a:00.0: // Write event ring dequeue
pointer, preserving EHB bit
[  203.435215] xhci_hcd 0000:7a:00.0: Finished xhci_init
[  203.435215] xhci_hcd 0000:7a:00.0: Called HCD init
[  203.435216] xhci_hcd 0000:7a:00.0: hcc params 0x0110ffc5 hci
version 0x120 quirks 0x0000000200000010
[  203.435375] xhci_hcd 0000:7a:00.0: xhci_run
[  203.435378] xhci_hcd 0000:7a:00.0: ERST deq = 64'hffff5000
[  203.435380] xhci_hcd 0000:7a:00.0: Finished xhci_run for main hcd
[  203.436837] xhci_hcd 0000:7a:00.0: Root hub is not suspended


Thanks,
Arisa
