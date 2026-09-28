Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1704F393B
	for <regressions@lists.linux.dev>; Mon, 28 Sep 2026 16:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614398; cv=none; b=YPNk1N0mCb9n3HqDpgGgjM2ru+fhRxq6G5sOdICPrRjYBu6L7IVvYVPKY1zzo/qoQuQ5SyH8HSzFGSKDT0tm58ilc3FK3xISfqlfBcLkNbRr7di7yDROts6fqrZVgiqb2ux/u2Y3uix7JhIfDWGN72qiUBGKDgO7lbu6KDaxSwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614398; c=relaxed/simple;
	bh=G9sExAdtnxh/VHCkojybBWsTBo/Gb/MbdlY4uuZD4tA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bHQOVT41PaiSUsZFVN2eDCutr6wc14VtbVdy/BtxvWXO4vS4oydvh8kzIHLrLXvUvIs+y24TcHURhFNJx+aXC6U0AhBmKijpsQip+XO49X7YMPJDU8MlS7tzuKmA9yRU1g2PuwF3hCvK2PSU3kEi/F7rrCSln9Jsjk8WRyKs1U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Va6WaOpX; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Va6WaOpX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso1585145e9.1
        for <regressions@lists.linux.dev>; Mon, 28 Sep 2026 09:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790614391; x=1791219191; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cnAg8yd+SFMKgMnOCthTX/mJXQ5eQt2X/SkShksKg4=;
        b=Va6WaOpXiBO5usaLguD34ZHt7HLhUV45HbpHHUPgA/YdDc8fijUlxfgVHMbNqK8XVY
         8RQvVqG2GlFJQltSnpa7nV4OMqhhEaXgN04IzA9CkjSBCXJ4ChRwIGoXPcS4eXHLiOdV
         NkR4yy66Yrh9gkNfinCv2X4nCr4WW3oPZ9Hfc19wj5bWkGZqLQrQqJUPt7we9NKsawFg
         gYKiT9Fsz+7tC0fvZlOdsJqEdHzFOqTqsoM7EjImUKoxMhDFGnIi58HIaBNNdILyEXRL
         l5OTAsq/AkWTkp+8iM4Ql+p9/5/s3qKhtop/UyMwLxLZV6wWRmWjeIjocHUgu5BZl47Y
         l9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790614391; x=1791219191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cnAg8yd+SFMKgMnOCthTX/mJXQ5eQt2X/SkShksKg4=;
        b=f6jsoEfL/eY+99ykiIkD7QYQkXBeP877Hca9zqKfgPLpbLDOD2jKDzx+RucpkgrUGb
         4GVDMJQnNjtgGJt/vzIUx2/T0dCEx8oI3CkK/JX8/bx+SGnnhjgc3wogMIXFDadF8mR+
         8/b+Ko6RXB5Uze0xT/oHDcKy40c8c+DhmJwffmo7CjPRYlap2GW1xtya8xojpzL8EjDz
         mEMo7eJTVu+OYUKsd/tnQ/S1nCCEE0VoEgxp81uWioQ3z0EQxHRAmDVcp545F6QFk9td
         2XjuFdAiXK+XJSuGZGZ5yaR9r5h4P7iF91r6ODoEV97Ol3g8AyqZeU9YDwacIEZuLd5C
         EsTw==
X-Forwarded-Encrypted: i=1; AKwUvBwU4IjWq0S57pasqnpQQ4eNXAxQWmay+Fwwnl7RlhS7MTMP3TjeAixeHe1yFCSBotpXVd4ScfFNNB2B5Q==@lists.linux.dev
X-Gm-Message-State: AFuF++ko9Z6yhgbddv51fk/ESV/yoPFw/xCXzV85eRM+2mD1IZKkUya+
	WVISnahMZOQV+ZmtYOFpyceb+TkqnuMQh9llYKy2QzY6JVEolP9nSvT+yr/PTDd2tiM6dKpy
X-Gm-Gg: AYBFou38sDFjrJR8Lf0B3k0a+XOK56tXfocgzt7ri7SQjRBKZkYW6z1aRisVW5hlLBt
	uCW1ddEsyDu1MpUb/cP4Yk1epyVteX60wPi1pErQj6sxb9DJHWJD8E7sqG9TREwrDZcvNTfeK1s
	19K1Dn3pysuB3/yT9auXcURWyjoV/K00tIaskPyGWaxPnNF1xmRZjvK5rsBzDvz+2Hp1xT+ZKVV
	rsZr8rWjTYWIUCkaobeg0pK5nX+GcIBkJi6Iu5sge+y07O2FpbdUtjTSoaAHyJ+/DGjfi3k42Os
	J5wqkwDK21bKt8f4oWmQLiuYr211UzYCfTxi7S1FS5bmz7RqFS3PflgIw5LuCR62/rqYyC5WcYm
	UxAkMXruYUzYxUoBXgfKrK4NyDjRkNsvridbTO+4FRrQ5NMhZ/HvmBLcfOsisov1FxNKyvMjKmQ
	xtNJEbZuxTMTlVEzRaOFc1n/p0Lg+daFkf0AAg6KUim4OgcFQ7N3waT/tVyfpmv52Xg7LKty2gh
	Wc9yttXcs3ZCTpOIQwcUY5mSmhR65V5qIfM7p9Rx4yZP9zAMAzlLijtubx8YmczdRnur35ut6KS
	yoAUbZzud6EAJskR6qbme0ZxfrUKMvz1L0iUz1sg1De3Yvi53XoV
X-Received: by 2002:a05:600c:4e41:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-4a00d778ed3mr11895e9.13.1790614391251;
        Mon, 28 Sep 2026 09:53:11 -0700 (PDT)
Received: from [192.168.0.46] ([63.135.75.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a648895sm28809748f8f.28.2026.09.28.09.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:53:10 -0700 (PDT)
Message-ID: <ee6e9e8f-e174-4872-baee-114d848e8137@gmail.com>
Date: Mon, 28 Sep 2026 17:53:10 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Audient EVO4 hardware volume control now requires
 quirk
To: Sasha Levin <sashal@kernel.org>,
 Faaris Ansari <faarisansari@googlemail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 linux-sound@vger.kernel.org, =?UTF-8?Q?C=C3=A1ssio_Gabriel?=
 <cassiogabrielcontato@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
References: <CANBVYRCL=8QdLxGg4S6qrahrFtwJxhv-aSGpW7-1S=+iOe4ZGA@mail.gmail.com>
 <2026-09-27-daily-reply-0001-re-audient-evo4-mixer-put-errors@kernel.org>
 <CANBVYRAr_ShKGmrt2NoqsDsDEbTXa5DWJbq2oP6wKLWJQpLRWw@mail.gmail.com>
 <2026-09-28-daily-reply-0001-re-audient-evo4-upstream-decision@kernel.org>
Content-Language: en-US
From: Faaris Ansari <faaris.ansari@gmail.com>
In-Reply-To: <2026-09-28-daily-reply-0001-re-audient-evo4-upstream-decision@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, yeah of course I can provide you with this info - I installed the 
latest 7.3-rc5 for testing.

Below are the dmesg logs that you requested:

[   80.940668] usb 3-1: cannot set ctl value: req = 0x1, wValue = 0x203, 
wIndex = 0xa00, type = 4, data = 0x0/0x81
[   80.944292] usb 3-1: cannot set ctl value: req = 0x1, wValue = 0x203, 
wIndex = 0xa00, type = 4, data = 0x0/0x81
[   80.947542] usb 3-1: cannot set ctl value: req = 0x1, wValue = 0x203, 
wIndex = 0xa00, type = 4, data = 0x0/0xdc
[   80.950794] usb 3-1: cannot set ctl value: req = 0x1, wValue = 0x203, 
wIndex = 0xa00, type = 4, data = 0x0/0x81

Below is the output of lsusb -v -d 2708:0006:

Bus 003 Device 002: ID 2708:0006 Audient EVO4
Negotiated speed: High Speed (480Mbps)
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2 [unknown]
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x2708 Audient
   idProduct          0x0006 EVO4
   bcdDevice            1.4c
   iManufacturer           1 Audient
   iProduct                3 EVO4
   iSerial                 0
   bNumConfigurations      2
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x01d6
     bNumInterfaces          4
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         3
       bFunctionClass          1 Audio
       bFunctionSubClass       0 [unknown]
       bFunctionProtocol      32
       iFunction               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      1 Control Device
       bInterfaceProtocol     32
       iInterface              3
       AudioControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdADC               2.00
         bCategory               8
         wTotalLength       0x0100
         bmControls           0x01
           Latency control Control (read-only)
       AudioControl Interface Descriptor:
         bLength                 8
         bDescriptorType        36
         bDescriptorSubtype     10 (CLOCK_SOURCE)
         bClockID               41
         bmAttributes            3 Internal programmable clock
         bmControls           0x07
           Clock Frequency Control (read/write)
           Clock Validity Control (read-only)
         bAssocTerminal          0
         iClockSource            9
       AudioControl Interface Descriptor:
         bLength                 8
         bDescriptorType        36
         bDescriptorSubtype     11 (CLOCK_SELECTOR)
         bClockID               40
         bNrInPins               1
         baCSourceID(0)         41
         bmControls           0x03
           Clock Selector Control (read/write)
         iClockSelector          8
       AudioControl Interface Descriptor:
         bLength                17
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             2
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bCSourceID             40
         bNrChannels             4
         bmChannelConfig    0x00000000
         iChannelNames          11
         bmControls         0x0000
         iTerminal               6
       AudioControl Interface Descriptor:
         bLength                26
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                10
         bSourceID               2
         bmaControls(0)     0x00000000
         bmaControls(1)     0x0000000c
           Volume Control (read/write)
         bmaControls(2)     0x0000000c
           Volume Control (read/write)
         bmaControls(3)     0x0000000c
           Volume Control (read/write)
         bmaControls(4)     0x0000000c
           Volume Control (read/write)
         iFeature                0
       AudioControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID            20
         wTerminalType      0x0301 Speaker
         bAssocTerminal          0
         bSourceID              59
         bCSourceID             40
         bmControls         0x0000
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      9 (EXTENSION_UNIT)
         bUnitID                59
         wExtensionCode     0x0000
         bNrInPins               1
         baSourceID(0)          56
         bNrChannels             2
         bmChannelConfig    0x00000000
         iChannelNames           0
         bmControls           0x3f
           Enable Control (read/write)
           Cluster Control (read/write)
           Underflow Control (read/write)
         iExtension              0
       AudioControl Interface Descriptor:
         bLength                17
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             1
         wTerminalType      0x0201 Microphone
         bAssocTerminal          0
         bCSourceID             40
         bNrChannels             4
         bmChannelConfig    0x00000000
         iChannelNames          15
         bmControls         0x0000
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      9 (EXTENSION_UNIT)
         bUnitID                58
         wExtensionCode     0x0000
         bNrInPins               1
         baSourceID(0)           1
         bNrChannels             2
         bmChannelConfig    0x00000000
         iChannelNames           0
         bmControls           0xff
           Enable Control (read/write)
           Cluster Control (read/write)
           Underflow Control (read/write)
           Overflow Control (read/write)
         iExtension              0
       AudioControl Interface Descriptor:
         bLength                26
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                11
         bSourceID               1
         bmaControls(0)     0x00000000
         bmaControls(1)     0x0000000c
           Volume Control (read/write)
         bmaControls(2)     0x0000000c
           Volume Control (read/write)
         bmaControls(3)     0x0000000c
           Volume Control (read/write)
         bmaControls(4)     0x0000000c
           Volume Control (read/write)
         iFeature                0
       AudioControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID            22
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID              60
         bCSourceID             40
         bmControls         0x0000
         iTerminal               7
       AudioControl Interface Descriptor:
         bLength                17
         bDescriptorType        36
         bDescriptorSubtype      9 (EXTENSION_UNIT)
         bUnitID                50
         wExtensionCode     0x0000
         bNrInPins               2
         baSourceID(0)          11
         baSourceID(1)          10
         bNrChannels             6
         bmChannelConfig    0x00000000
         iChannelNames           0
         bmControls           0x03
           Enable Control (read/write)
         iExtension              0
       AudioControl Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      4 (MIXER_UNIT)
         bUnitID                60
         bNrInPins               1
         baSourceID(0)          50
         bNrChannels             2
         bmChannelConfig    0x00000000
         iChannelNames          19
         bmMixerControls(0)   0xff
         bmControls           0xff
           Cluster Control (read/write)
           Underflow Control (read/write)
           Overflow Control (read/write)
         iMixer                  0
       Warning: Junk at end of descriptor (1 bytes):
         00
       AudioControl Interface Descriptor:
         bLength                17
         bDescriptorType        36
         bDescriptorSubtype      9 (EXTENSION_UNIT)
         bUnitID                56
         wExtensionCode     0x0000
         bNrInPins               2
         baSourceID(0)          11
         baSourceID(1)          10
         bNrChannels             2
         bmChannelConfig    0x00000000
         iChannelNames           0
         bmControls           0x00
         iExtension              0
       AudioControl Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      9 (EXTENSION_UNIT)
         bUnitID                57
         wExtensionCode     0x0000
         bNrInPins               1
         baSourceID(0)           2
         bNrChannels             0
         bmChannelConfig    0x00000000
         iChannelNames           0
         bmControls           0x00
         iExtension              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0006  1x 6 bytes
         bInterval               8
         INTERFACE CLASS:  10 24 09 3e 00 00 01 01 01 00 00 00 00 00 00 00
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           2
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              4
       AudioStreaming Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink           2
         bmControls           0x00
         bFormatType             1
         bmFormats          0x00000001
           PCM
         bNrChannels             4
         bmChannelConfig    0x00000000
         iChannelNames          11
       AudioStreaming Interface Descriptor:
         bLength                 6
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bSubslotSize            4
         bBitResolution         24
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x00d0  1x 208 bytes
         bInterval               1
         AudioStreaming Endpoint Descriptor:
           bLength                 8
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x00
           bmControls           0x00
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0008
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes           17
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Feedback
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       2
       bNumEndpoints           2
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              4
       AudioStreaming Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink           2
         bmControls           0x00
         bFormatType             1
         bmFormats          0x00000001
           PCM
         bNrChannels             4
         bmChannelConfig    0x00000000
         iChannelNames          11
       AudioStreaming Interface Descriptor:
         bLength                 6
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bSubslotSize            2
         bBitResolution         16
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0068  1x 104 bytes
         bInterval               1
         AudioStreaming Endpoint Descriptor:
           bLength                 8
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x00
           bmControls           0x00
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0008
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes           17
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Feedback
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              5
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              5
       AudioStreaming Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink          22
         bmControls           0x00
         bFormatType             1
         bmFormats          0x00000001
           PCM
         bNrChannels             4
         bmChannelConfig    0x00000000
         iChannelNames          15
       AudioStreaming Interface Descriptor:
         bLength                 6
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bSubslotSize            4
         bBitResolution         24
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x00d0  1x 208 bytes
         bInterval               1
         AudioStreaming Endpoint Descriptor:
           bLength                 8
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x00
           bmControls           0x00
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0008
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        3
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass       254 Application Specific Interface
       bInterfaceSubClass      1 Device Firmware Update
       bInterfaceProtocol      1
       iInterface             10
       Device Firmware Upgrade Interface Descriptor:
         bLength                             9
         bDescriptorType                    33
         bmAttributes                        7
           Will Not Detach
           Manifestation Tolerant
           Upload Supported
           Download Supported
         wDetachTimeout                    250 milliseconds
         wTransferSize                      64 bytes
         bcdDFUVersion                   1.10
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x01d6
     bNumInterfaces          4
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         3
       bFunctionClass          1 Audio
       bFunctionSubClass       0 [unknown]
       bFunctionProtocol      32
       iFunction               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      1 Control Device
       bInterfaceProtocol     32
       iInterface              3
       AudioControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdADC               2.00
         bCategory               8
         wTotalLength       0x0100
         bmControls           0x01
           Latency control Control (read-only)
       AudioControl Interface Descriptor:
         bLength                 8
         bDescriptorType        36
         bDescriptorSubtype     10 (CLOCK_SOURCE)
         bClockID               41
         bmAttributes            3 Internal programmable clock
         bmControls           0x07
           Clock Frequency Control (read/write)
           Clock Validity Control (read-only)
         bAssocTerminal          0
         iClockSource            9
       AudioControl Interface Descriptor:
         bLength                 8
         bDescriptorType        36
         bDescriptorSubtype     11 (CLOCK_SELECTOR)
         bClockID               40
         bNrInPins               1
         baCSourceID(0)         41
         bmControls           0x03
           Clock Selector Control (read/write)
         iClockSelector          8
       AudioControl Interface Descriptor:
         bLength                17
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             2
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bCSourceID             40
         bNrChannels             4
         bmChannelConfig    0x00000000
         iChannelNames          11
         bmControls         0x0000
         iTerminal               6
       AudioControl Interface Descriptor:
         bLength                26
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                10
         bSourceID               2
         bmaControls(0)     0x00000000
         bmaControls(1)     0x0000000c
           Volume Control (read/write)
         bmaControls(2)     0x0000000c
           Volume Control (read/write)
         bmaControls(3)     0x0000000c
           Volume Control (read/write)
         bmaControls(4)     0x0000000c
           Volume Control (read/write)
         iFeature                0
       AudioControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID            20
         wTerminalType      0x0301 Speaker
         bAssocTerminal          0
         bSourceID              59
         bCSourceID             40
         bmControls         0x0000
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      9 (EXTENSION_UNIT)
         bUnitID                59
         wExtensionCode     0x0000
         bNrInPins               1
         baSourceID(0)          56
         bNrChannels             2
         bmChannelConfig    0x00000000
         iChannelNames           0
         bmControls           0x3f
           Enable Control (read/write)
           Cluster Control (read/write)
           Underflow Control (read/write)
         iExtension              0
       AudioControl Interface Descriptor:
         bLength                17
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             1
         wTerminalType      0x0201 Microphone
         bAssocTerminal          0
         bCSourceID             40
         bNrChannels             4
         bmChannelConfig    0x00000000
         iChannelNames          15
         bmControls         0x0000
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      9 (EXTENSION_UNIT)
         bUnitID                58
         wExtensionCode     0x0000
         bNrInPins               1
         baSourceID(0)           1
         bNrChannels             2
         bmChannelConfig    0x00000000
         iChannelNames           0
         bmControls           0xff
           Enable Control (read/write)
           Cluster Control (read/write)
           Underflow Control (read/write)
           Overflow Control (read/write)
         iExtension              0
       AudioControl Interface Descriptor:
         bLength                26
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                11
         bSourceID               1
         bmaControls(0)     0x00000000
         bmaControls(1)     0x0000000c
           Volume Control (read/write)
         bmaControls(2)     0x0000000c
           Volume Control (read/write)
         bmaControls(3)     0x0000000c
           Volume Control (read/write)
         bmaControls(4)     0x0000000c
           Volume Control (read/write)
         iFeature                0
       AudioControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID            22
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID              60
         bCSourceID             40
         bmControls         0x0000
         iTerminal               7
       AudioControl Interface Descriptor:
         bLength                17
         bDescriptorType        36
         bDescriptorSubtype      9 (EXTENSION_UNIT)
         bUnitID                50
         wExtensionCode     0x0000
         bNrInPins               2
         baSourceID(0)          11
         baSourceID(1)          10
         bNrChannels             6
         bmChannelConfig    0x00000000
         iChannelNames           0
         bmControls           0x03
           Enable Control (read/write)
         iExtension              0
       AudioControl Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      4 (MIXER_UNIT)
         bUnitID                60
         bNrInPins               1
         baSourceID(0)          50
         bNrChannels             2
         bmChannelConfig    0x00000000
         iChannelNames          19
         bmMixerControls(0)   0xff
         bmControls           0xff
           Cluster Control (read/write)
           Underflow Control (read/write)
           Overflow Control (read/write)
         iMixer                  0
       Warning: Junk at end of descriptor (1 bytes):
         00
       AudioControl Interface Descriptor:
         bLength                17
         bDescriptorType        36
         bDescriptorSubtype      9 (EXTENSION_UNIT)
         bUnitID                56
         wExtensionCode     0x0000
         bNrInPins               2
         baSourceID(0)          11
         baSourceID(1)          10
         bNrChannels             2
         bmChannelConfig    0x00000000
         iChannelNames           0
         bmControls           0x00
         iExtension              0
       AudioControl Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      9 (EXTENSION_UNIT)
         bUnitID                57
         wExtensionCode     0x0000
         bNrInPins               1
         baSourceID(0)           2
         bNrChannels             0
         bmChannelConfig    0x00000000
         iChannelNames           0
         bmControls           0x00
         iExtension              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0006  1x 6 bytes
         bInterval               8
         INTERFACE CLASS:  10 24 09 3e 00 00 01 01 01 00 00 00 00 00 00 00
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           2
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              4
       AudioStreaming Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink           2
         bmControls           0x00
         bFormatType             1
         bmFormats          0x00000001
           PCM
         bNrChannels             4
         bmChannelConfig    0x00000000
         iChannelNames          11
       AudioStreaming Interface Descriptor:
         bLength                 6
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bSubslotSize            4
         bBitResolution         24
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x00d0  1x 208 bytes
         bInterval               1
         AudioStreaming Endpoint Descriptor:
           bLength                 8
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x00
           bmControls           0x00
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0008
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes           17
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Feedback
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       2
       bNumEndpoints           2
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              4
       AudioStreaming Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink           2
         bmControls           0x00
         bFormatType             1
         bmFormats          0x00000001
           PCM
         bNrChannels             4
         bmChannelConfig    0x00000000
         iChannelNames          11
       AudioStreaming Interface Descriptor:
         bLength                 6
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bSubslotSize            2
         bBitResolution         16
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0068  1x 104 bytes
         bInterval               1
         AudioStreaming Endpoint Descriptor:
           bLength                 8
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x00
           bmControls           0x00
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0008
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes           17
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Feedback
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              5
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              5
       AudioStreaming Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink          22
         bmControls           0x00
         bFormatType             1
         bmFormats          0x00000001
           PCM
         bNrChannels             4
         bmChannelConfig    0x00000000
         iChannelNames          15
       AudioStreaming Interface Descriptor:
         bLength                 6
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bSubslotSize            4
         bBitResolution         24
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x00d0  1x 208 bytes
         bInterval               1
         AudioStreaming Endpoint Descriptor:
           bLength                 8
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x00
           bmControls           0x00
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0008
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        3
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass       254 Application Specific Interface
       bInterfaceSubClass      1 Device Firmware Update
       bInterfaceProtocol      1
       iInterface             10
       Device Firmware Upgrade Interface Descriptor:
         bLength                             9
         bDescriptorType                    33
         bmAttributes                        7
           Will Not Detach
           Manifestation Tolerant
           Upload Supported
           Download Supported
         wDetachTimeout                    250 milliseconds
         wTransferSize                      64 bytes
         bcdDFUVersion                   1.10

And here is the output of amixer -c EVO4 contents

numid=6,iface=CARD,name='Audient Internal Clock Validity'
   ; type=BOOLEAN,access=r-------,values=1
   : values=on
numid=3,iface=MIXER,name='Mic Playback Volume'
   ; type=INTEGER,access=rw---R--,values=4,min=0,max=116,step=0
   : values=96,0,0,0
   | dBminmax-min=-8.00dB,max=50.00dB
numid=4,iface=MIXER,name='EVO4  Playback Volume'
   ; type=INTEGER,access=rw---R--,values=4,min=0,max=254,step=0
   : values=182,182,0,0
   | dBminmax-min=-127.00dB,max=0.00dB
numid=5,iface=MIXER,name='Extension Unit Switch'
   ; type=BOOLEAN,access=rw------,values=1
   : values=off
numid=2,iface=PCM,name='Capture Channel Map'
   ; type=INTEGER,access=r--v-R--,values=4,min=0,max=36,step=0
   : values=0,0,0,0
   | container
     | chmap-fixed=FL,FR,FC,LFE
numid=1,iface=PCM,name='Playback Channel Map'
   ; type=INTEGER,access=r--v-R--,values=4,min=0,max=36,step=0
   : values=0,0,0,0
   | container
     | chmap-fixed=FL,FR,FC,LFE


Thank you for your help debugging this issue,

Faaris


On 28/09/2026 17:46, Sasha Levin wrote:
>> It seems you're right. Reverting that change has fixed the volume
>> control with my interface - I made sure to remove the quirk flags
>> whilst testing.
>>
>> What are the next steps here? Is there a problem with that patch, or
>> do we need to add a quirk for the EVO4 in the kernel?
> Thanks for testing.
>
> Takashi, Cássio: before 87a6f2fa6e6c ("ALSA: usb-audio: Propagate write
> errors in generic mixer put callbacks"), a failed SET_CUR in the mixer
> put callbacks was ignored. Now it is returned to userspace, and on the
> EVO4 (2708:0006) that breaks hardware volume control. Would you prefer a
> QUIRK_FLAG_IGNORE_CTL_ERROR entry for 2708:0006, or a revert or rework
> of that commit? Any other device that rejects SET_CUR on a single
> control or channel will regress the same way.
>
> Faaris, to help with that decision, could you send:
>
>    1. dmesg with snd_usb_audio debug output enabled while you change the
>       volume without the quirk, using
>       echo 'module snd_usb_audio +p' > /sys/kernel/debug/dynamic_debug/control
>       (the "cannot set ctl value" lines are the useful ones)
>    2. lsusb -v -d 2708:0006
>    3. amixer -c <card> contents
>
