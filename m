Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE990482DA
	for <regressions@lists.linux.dev>; Mon,  4 Mar 2024 20:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709583685; cv=none; b=bzXFT3AOkO/h3R3SDzMLRyAafosKIVRtn7FIRMaaeqT27nkESDIowfMkPjFqwABuMQ0DTenZ2wymPfgGA3/ixyoAaD3Nvw/N6awGfbFB4fVbuQYQ8t2IkaE+Xv2ACdUU2S4rI5DRtgnZUYuvJMKgHgjaKxUJ04W/O293HAz6D6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709583685; c=relaxed/simple;
	bh=AmoRIvLmMQnVEYPQ8Gvg/fIyOLg1vnqmhYOCD8vsVy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2Cgky8RjeaCL1qkMaZjkTnu6mo+zJMTsR9QZVA/i2hB8lURsuv6/f0oW0Hz5zen8I64ebZNNbVTx/Dg9EJDqOSSdCiPKoamFJGqmkfZYEzIfdlLWBFtX6eI8wWHLlO41Hhyh1J2lv8FJ82TXvp1Bn2kEtDR0svcvR3AD+mcVqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7X8ECWL; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7X8ECWL"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so799169366b.0
        for <regressions@lists.linux.dev>; Mon, 04 Mar 2024 12:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709583682; x=1710188482; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=layVb4r7VmNjWsOKd0JDFtRUwuim1yeHZBOM5lzRFlU=;
        b=N7X8ECWLs0OQCdOdEt92zb4XQGMcB/f4VJwVgz2oO/zDksnegn13C/018RkrYmuuM8
         GElrXZFe+9ONMUYEqqOzJGs+EUeaNWJeILqOVp6URrX6v7heskprvrofnqu/sOeL9AtL
         DTb2V8v8525yI90QHCy+pgGpVF9ZxCUd5axcE45U0KH1TYLF9vu4tybaxg+PWRO+g4q9
         /NwZZgZ4OjLVg+cArVrLddoq0fNDii4gzqm4qzjy8fw0hlb9g1GMNYj9IYy6cbaNoZoL
         m0wUc9AY+GjUMkTmTBLrJcm52i8fNU2SkF4oWkQ8kdSH4LtIh31n9eAjcmxdMyvrJhS6
         Wv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709583682; x=1710188482;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=layVb4r7VmNjWsOKd0JDFtRUwuim1yeHZBOM5lzRFlU=;
        b=aLD7TyUz47ULlFjMPSyCXjySGliWWUVMzBQlHHkxwlm1KD03M+FYThdAZY+5yTLjdo
         +YJNW9QIARHX6bdistALNmK+y8HFiLszgoRRKzcYGm5aSy8Zqw6pLh8xoUtQmgdCVLU/
         P3QqTjlEKfue4KeCSmYAtPJAw3C2UhxRaA3gY9isrCEjk7+w56NMqvrfogGr5Mh/q3Yu
         KiJoNgMttKQUVzta2KwjE1axTSv/fwsddSIpVtHO4rkx4vbfKc4JuthEaj02AJA9QiEa
         RDnbs9ndCf5TW5hF2lM2tz0dEIjs6EjLiknHgGKwd0mEYtWNRjo93UjEt4I35gKVJvTE
         eHHg==
X-Forwarded-Encrypted: i=1; AJvYcCXYeyuas3hYDZ/0Un7zIZNlpl86ZIl64YbqfjW7DnD3i20PsrRrSrYDzYeUnLUI4sJ7IxTtd2hQ3XDP3ToF7X8mhs/Spl2JpSshK/I=
X-Gm-Message-State: AOJu0Yy81vpXojtsuVzzio6JTW+sSf8ogDMzo6Ej5Iw17ik4BLvHv2sR
	5HKNR1ux42Y0EIsy8tfoVUVWD9yz7P3OEqszxSBLr1v6qxhYZ5OG
X-Google-Smtp-Source: AGHT+IEDBAkVJq3/bxcg0d/Wna1qRImKqxXHA3lzpegeS8cL1vTYF75FvZwuGpXQo/c5qMwu5GSVRQ==
X-Received: by 2002:a17:906:1c8d:b0:a44:415d:fa39 with SMTP id g13-20020a1709061c8d00b00a44415dfa39mr5204051ejh.37.1709583682023;
        Mon, 04 Mar 2024 12:21:22 -0800 (PST)
Received: from ?IPV6:2a02:8389:41cf:e200:b4fe:bc05:cea3:29e3? (2a02-8389-41cf-e200-b4fe-bc05-cea3-29e3.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:b4fe:bc05:cea3:29e3])
        by smtp.gmail.com with ESMTPSA id a15-20020a17090640cf00b00a4354b9893csm5231660ejk.74.2024.03.04.12.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 12:21:21 -0800 (PST)
Message-ID: <449417ca-aae1-4868-a96f-a99ac5d187d6@gmail.com>
Date: Mon, 4 Mar 2024 21:21:19 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Missing bcm5974 touchpad on Macbooks
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>,
 Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 Henrik Rydberg <rydberg@euromail.se>, John Horan <knasher@gmail.com>
References: <87sf161jjc.wl-tiwai@suse.de>
 <6ef6c5bf-e6e5-4711-81c6-6ae41de2e61e@wolfvision.net>
 <874jdm17yt.wl-tiwai@suse.de>
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <874jdm17yt.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04.03.24 13:45, Takashi Iwai wrote:
> On Mon, 04 Mar 2024 12:26:48 +0100,
> Javier Carrasco wrote:
>>
>> On 04.03.24 09:35, Takashi Iwai wrote:
>>> Hi,
>>>
>>> we've received a few regression reports for openSUSE Leap about the
>>> missing touchpad on Macbooks.  After debugging, this turned out to be
>>> the backport of the commit 2b9c3eb32a699acdd4784d6b93743271b4970899
>>>     Input: bcm5974 - check endpoint type before starting traffic
>>>
>>> And, the same regression was confirmed on the upstream 6.8-rc6
>>> kernel.
>>>
>>> Reverting the commit above fixes the problem, the touchpad reappears.
>>>
>>> The detailed hardware info is found at:
>>>   https://bugzilla.suse.com/show_bug.cgi?id=1220030
>>>
>>> Feel free to join the bugzilla above, or let me know if you need
>>> something for debugging, then I'll delegate on the bugzilla.
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>>>
>>
>> Hi Takashi,
>>
>> The commit adds a check to ensure that the endpoint type is interrupt.
>>
>> According to that report, the issue arose with a MacBook Pro 5.1 (no
>> button, only trackpad endpoint), so the check on the tp_ep address
>> (0x81) returns false. I assume that you see an error message
>> ("Unexpected non-int endpoint) and  the probe function fails returning
>> -ENODEV.
> 
> Right, there is the message.
> 
>> Do you see any warning in the logs when you revert the commit? It was
>> added to prevent using wrong endpoint types, which will display the
>> following warning: "BOGUS urb xfer, pipe "some_number" != type
>> "another_number""
> 
> The revert was tested on the downstream kernel, but it has also the
> check of bogus pipe, and there was no such warning, as far as I see
> the report.
> 
>> I am just wondering if for some reason the check on interrupt type is
>> wrong here.
> 
> I'll ask reporters to give the lsusb -v output so that we can take a
> deeper look.  Also, I'm building a test kernel based on 6.8-rc7 with
> the revert, and ask reporters to test with it, just to be sure.
> 
> 
> thanks,
> 
> Takashi

I retrieved the relevant node from the report that was uploaded a few
minutes ago:

Bus 003 Device 003: ID 05ac:0237 Apple, Inc. Internal Keyboard/Trackpad
(ISO)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         8
  idVendor           0x05ac Apple, Inc.
  idProduct          0x0237 Internal Keyboard/Trackpad (ISO)
  bcdDevice            0.77
  iManufacturer           1 Apple, Inc.
  iProduct                2 Apple Internal Keyboard / Trackpad
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0054
    bNumInterfaces          3
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower               40mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      1 Keyboard
      iInterface              3 Apple Internal Keyboard
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode           13 International (ISO)
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength     156
         Report Descriptors:
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              4 Touchpad
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      27
         Report Descriptors:
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               2
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      2 Mouse
      iInterface              4 Touchpad
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      52
         Report Descriptors:
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               8
Device Status:     0x0000
  (Bus Powered)


There is indeed an interrupt endpoint with address 0x81, but the driver
defines bInterfaceProtocol = 2 (Mouse), and the endpoint in that
interface is 0x84:

#define BCM5974_DEVICE(prod) {					\
	.match_flags = (USB_DEVICE_ID_MATCH_DEVICE |		\
			USB_DEVICE_ID_MATCH_INT_CLASS |		\
			USB_DEVICE_ID_MATCH_INT_PROTOCOL),	\
	.idVendor = USB_VENDOR_ID_APPLE,			\
	.idProduct = (prod),					\
	.bInterfaceClass = USB_INTERFACE_CLASS_HID,		\
	.bInterfaceProtocol = USB_INTERFACE_PROTOCOL_MOUSE	\
}

where USB_INTERFACE_PROTOCOL_MOUSE = 2.


My interpretation is that the driver is checking if the endpoint with
address 0x81 form the interface with bInterfaceProtocol = 2 (that is the
last interface of the list, the one with bInterfaceNumber = 2), but it
is not found, because its only endpoint has a different address (0x84).

Interestingly, 0x84 is the address given to the endpoint of the button
interface. The button interface should not be relevant for Macbook 5,1
(TYPE 2 in the driver), according to 43f482b48d03 ("Input: bcm5974 -
only setup button urb for TYPE1 devices").

If that is true, does anyone know why bInterfaceProtocol is always set
to USB_INTERFACE_PROTOCOL_MOUSE, and why the driver works anyway with
bEndpointAddress = 0x81 for the trackpad? The urb setup for 0x84 is only
executed for TYPE 1 devices, and the mouse interface does not have an
endpoint with address 0x81. Or am I missing something?

We could revert the patch in question, but I see no reason why checking
an expected interrupt endpoint should cause trouble. It looks like there
is something fishy going on.

Best regards,
Javier Carrasco


