Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA604313283
	for <regressions@lists.linux.dev>; Thu,  2 Apr 2026 15:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.76.10.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775145601; cv=none; b=FbAo5Z5zIumBVPyXfZLh5Efyl+M5Khu37d52l9M8ESoQ0/BOj8QMQ9eL9EH4HXlatlibrrKz0YFJToZdlngsHPVPlUwH9uXwUYdcLq7x92IKAvVssDeP0P2pFZTZ+LDJd+kStSjvFXAJRWDvXoVVIRUwqLNtm/x/JAChKaERY84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775145601; c=relaxed/simple;
	bh=PvsI+t/20v9P5mfFNqZNcxLxAgHixBewv85GaikLfwY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TV5qtFsQ6XF1b5cK6/KykNPBEVTyB8qBv39tngYqxlZpYffdDKfwaRHF4ge0kzBxIEExv6qihGKH3pULv+UbPf5Ai6fkIxbKDGwEv6beb5mvOzeEPrEyGRCEiyEaww5ithGq7EhgrHxLeg7JBFM5rNJpZLuL/LYctB5Fmxa+z40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ipp.mpg.de; spf=pass smtp.mailfrom=ipp.mpg.de; dkim=pass (2048-bit key) header.d=ipp.mpg.de header.i=@ipp.mpg.de header.b=ZMlrN0Yb; arc=none smtp.client-ip=134.76.10.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ipp.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipp.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ipp.mpg.de header.i=@ipp.mpg.de header.b="ZMlrN0Yb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ipp.mpg.de;
	s=2023-rsa; h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:
	Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=iPp7duenfQKkK0OQ7n2aNd3gXvLVq0F0pHSDTuyFsCg=; b=ZMlrN0YbE6RHfWsdkL04YXBoHZ
	QreMeUfkAWF+tz2NGhA+FZkr02F7dvoShswuI2mrIS2G/rIwK6mrOftR2TiWDR0umC9hALqzMdFCZ
	hvz48xi9b30NEpit7pafrgol2vsKL4v77in1V/oDj+7vqIDd/EU68MALnubXXpl3nrjdtzDDLYMZd
	pCl0fM2/6hYAB9LfnxDaHNg83ELOtaYZkFQj6mctxuZM+yrHfohjblWHMdaR8hq/OiHk6JUeYcVhv
	i/+iaKbRBD2//TQlWmpNV5Yho59FP8pE7KvwCefpCkU+MiT7e2zGvSTMRalN63k5F3Q8K9kmyZeyU
	J3syfo7A==;
Received: from mailer.gwdg.de ([134.76.10.26]:41521)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <simon.fischer@ipp.mpg.de>)
	id 1w8K43-0034Gw-02
	for regressions@lists.linux.dev;
	Thu, 02 Apr 2026 17:34:35 +0200
Received: from mbx19-fmz-05.um.gwdg.de ([10.108.142.64] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <simon.fischer@ipp.mpg.de>)
	id 1w8K43-000Dcq-2P
	for regressions@lists.linux.dev;
	Thu, 02 Apr 2026 17:34:35 +0200
Received: from MBX19-SUB-03.um.gwdg.de (10.108.142.68) by
 MBX19-FMZ-05.um.gwdg.de (10.108.142.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Thu, 2 Apr 2026 17:34:35 +0200
Received: from MBX19-SUB-03.um.gwdg.de ([10.108.142.68]) by
 MBX19-SUB-03.um.gwdg.de ([10.108.142.68]) with mapi id 15.02.2562.037; Thu, 2
 Apr 2026 17:34:35 +0200
From: "Fischer, Simon" <simon.fischer@ipp.mpg.de>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Lowspeed USB device enumerationg under 5.4.288, but not under 6.8.1
Thread-Topic: Lowspeed USB device enumerationg under 5.4.288, but not under
 6.8.1
Thread-Index: AdzCs+1oMfzeuAm2S72W6S8kW/Ma3A==
Date: Thu, 2 Apr 2026 15:34:35 +0000
Message-ID: <8a29db20f78046578e8dc2c516607240@ipp.mpg.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Virus-Scanned: (clean) by clamav
X-Spam-Level: -

Dear list,

I've tried to dig deeper into the issues, tried different quirks and small =
patches, but was unable to solve this or find the root cause. As this seems=
 to be a regression of 6.8 from 5.4, I hope this is the correct list?

I got setup with a low speed isochronous USB device (Optec filter wheel), t=
hat is connected to a Dell R6515 server via a Lindy 300m 2 Port Fibre Optic=
 USB 3.0 Extender (which enumerates as a chain of USB3 super speed hubs).
The server is running Ubuntu 24.04 with a 6.8.1 RT kernel. When connecting =
the device, it fails to enumerate:

		[ 1843.938804] usb 2-1.2.1: new SuperSpeed USB device number 14 using xhc=
i_hcd
		[ 1843.950893] xhci_hcd 0000:04:00.3: Waiting for status stage event
		[ 1843.950937] xhci_hcd 0000:04:00.3: Waiting for status stage event
		[ 1843.950981] xhci_hcd 0000:04:00.3: Waiting for status stage event
		[ 1843.950998] usb 2-1.2.1: New USB device found, idVendor=3D0424, idProd=
uct=3D7016, bcdDevice=3D 6.26
		[ 1843.951006] usb 2-1.2.1: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
		[ 1843.951013] usb 2-1.2.1: Product: USB7016 Smart Hub
		[ 1843.951018] usb 2-1.2.1: Manufacturer: Microchip
		[ 1843.951365] xhci_hcd 0000:04:00.3: add ep 0x81, slot id 4, new drop fl=
ags =3D 0x0, new add flags =3D 0x8
		[ 1843.951375] xhci_hcd 0000:04:00.3: xhci_check_bandwidth called for ude=
v 00000000f628da0a
		[ 1843.951387] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1843.952768] xhci_hcd 0000:04:00.3: Successful Endpoint Configure comma=
nd
		[ 1843.952825] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1843.952865] xhci_hcd 0000:04:00.3: Stopped on No-op or Link TRB for sl=
ot 4 ep 2
		[ 1843.952884] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1843.969034] hub 2-1.2.1:1.0: USB hub found
		[ 1843.969108] hub 2-1.2.1:1.0: 3 ports detected
		[ 1843.969459] xhci_hcd 0000:04:00.3: xHCI version 110 needs hub TT think=
 time and number of ports
		[ 1843.969466] xhci_hcd 0000:04:00.3: Set up configure endpoint for hub d=
evice.
		[ 1843.969474] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1843.969529] xhci_hcd 0000:04:00.3: Successful Endpoint Configure comma=
nd
		[ 1844.178598] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1844.178634] xhci_hcd 0000:04:00.3: Slot 5 output ctx =3D 0x0x000000017=
9f5f000 (dma)
		[ 1844.178643] xhci_hcd 0000:04:00.3: Slot 5 input ctx =3D 0x0x0000000131=
1ce000 (dma)
		[ 1844.178652] xhci_hcd 0000:04:00.3: Set slot id 5 dcbaa entry 00000000b=
b87fc6b to 0x179f5f000
		[ 1844.208850] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.224776] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.240774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.242544] xhci_hcd 0000:04:00.3: Set root hub portnum to 3
		[ 1844.242554] xhci_hcd 0000:04:00.3: Set fake root hub portnum to 1
		[ 1844.242560] xhci_hcd 0000:04:00.3: udev->tt =3D 0000000000000000
		[ 1844.242565] xhci_hcd 0000:04:00.3: udev->ttport =3D 0x0
		[ 1844.242573] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1844.250778] usb 2-1.2.1.3: Device not responding to setup address.
		[ 1844.250888] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1844.250919] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1844.250959] xhci_hcd 0000:04:00.3: Slot 5 output ctx =3D 0x0x000000017=
9f5f000 (dma)
		[ 1844.250968] xhci_hcd 0000:04:00.3: Slot 5 input ctx =3D 0x0x0000000131=
1ce000 (dma)
		[ 1844.250976] xhci_hcd 0000:04:00.3: Set slot id 5 dcbaa entry 00000000b=
b87fc6b to 0x179f5f000
		[ 1844.256773] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.272775] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.288888] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.304774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.320774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.336774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.352774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.368774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.384774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.400774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.416774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.432774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.448774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.458535] xhci_hcd 0000:04:00.3: Set root hub portnum to 3
		[ 1844.458544] xhci_hcd 0000:04:00.3: Set fake root hub portnum to 1
		[ 1844.458550] xhci_hcd 0000:04:00.3: udev->tt =3D 0000000000000000
		[ 1844.458556] xhci_hcd 0000:04:00.3: udev->ttport =3D 0x0
		[ 1844.458563] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1844.464774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.466663] usb 2-1.2.1.3: Device not responding to setup address.
		[ 1844.466771] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1844.466801] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1844.466843] xhci_hcd 0000:04:00.3: Slot 5 output ctx =3D 0x0x000000017=
9f5f000 (dma)
		[ 1844.466851] xhci_hcd 0000:04:00.3: Slot 5 input ctx =3D 0x0x0000000131=
1ce000 (dma)
		[ 1844.466860] xhci_hcd 0000:04:00.3: Set slot id 5 dcbaa entry 00000000b=
b87fc6b to 0x179f5f000
		[ 1844.480774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.496774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.512774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.528774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.544774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.560774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.576774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.592774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.608776] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.624777] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.640774] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.656775] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.672776] xhci_hcd 0000:04:00.3: ep 0x81 - asked for 2 bytes, 1 byte=
s untransferred
		[ 1844.674524] usb 2-1.2.1.3: device not accepting address 15, error -71
		[ 1844.675151] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1844.675178] xhci_hcd 0000:04:00.3: Bad real port.
		[ 1844.675188] xhci_hcd 0000:04:00.3: // Ding dong!

	[this repeats multiple times until giving up]

		[ 1864.698065] usb 2-1.2.1.3.4: device not accepting address 25, error -7=
1
		[ 1864.698674] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1864.698711] xhci_hcd 0000:04:00.3: Bad real port.
		[ 1864.698718] usb 2-1.2.1.3-port4: unable to enumerate USB device
		[ 1864.699443] xhci_hcd 0000:04:00.3: Cancel URB 00000000c8fb420b, dev 1.=
2.1.3, ep 0x81, starting at offset 0x16e8fb050
		[ 1864.699455] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1864.699474] xhci_hcd 0000:04:00.3: Stopped on Transfer TRB for slot 5 =
ep 2
		[ 1864.699481] xhci_hcd 0000:04:00.3: Removing canceled TD starting at 0x=
16e8fb050 (dma) in stream 0 URB 00000000c8fb420b
		[ 1864.699489] xhci_hcd 0000:04:00.3: Set TR Deq ptr 0x16e8fb060, cycle 1

		[ 1864.699495] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1864.699500] xhci_hcd 0000:04:00.3: xhci_giveback_invalidated_tds: Keep=
 cancelled URB 00000000c8fb420b TD as cancel_status is 2
		[ 1864.699510] xhci_hcd 0000:04:00.3: Successful Set TR Deq Ptr cmd, deq =
=3D @16e8fb060
		[ 1864.699517] xhci_hcd 0000:04:00.3: xhci_handle_cmd_set_deq: Giveback c=
ancelled URB 00000000c8fb420b TD
		[ 1864.699522] xhci_hcd 0000:04:00.3: Giveback URB 00000000c8fb420b, len =
=3D 0, expected =3D 2, status =3D -115
		[ 1864.711179] xhci_hcd 0000:04:00.3: Cancel URB 00000000301149a6, dev 1.=
2.1, ep 0x81, starting at offset 0x125370300
		[ 1864.711194] xhci_hcd 0000:04:00.3: // Ding dong!
		[ 1864.711211] xhci_hcd 0000:04:00.3: Stopped on Transfer TRB for slot 4 =
ep 2
		[ 1864.711218] xhci_hcd 0000:04:00.3: Removing canceled TD starting at 0x=
125370300 (dma) in stream 0 URB 00000000301149a6
		[ 1864.711226] xhci_hcd 0000:04:00.3: Set TR Deq ptr 0x125370310, cycle 1

		[ 1864.711232] xhci_hcd 0000:04:00.3: // Ding dong!


When booting into a 5.4.288 PREEMPT_RT kernel we were using before with, ev=
erything works fine (device enumerates and works).
When exchanging the USB Extender for a Lindy 200m Fibre Optic USB 2.0 Exten=
der, everything works fine with the 6.8.1 kernel.
I cannot inject a USB 2.0 hub before the extender, because it is a super sp=
eed device and not compatible.

Any suggestions how to fix or further investigate the issue would be greatl=
y appreciated!

Kind regards
Simon Fischer


Developer
Department E5 - CoDaC


Max Planck Institute for Plasmaphysics
Wendelsteinstrasse 1
17491 Greifswald, Germany

Phone: +49(0)3834 88 1215

