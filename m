Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7C91509AB;
	Mon, 22 Apr 2024 17:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713807206; cv=none; b=eUC/u+UCIQ28CabLDV4vkD2xwcB68Gf3qTvcGHbj6mnTj1Yeku73AvxN+Fx68druffXyhQksC+12KLgjXJHeOPcPPTB4J/VlD5+NeJg8gp4dMz8K5/Kz0FrkIfgiapGkWLpFjHcFbUvDL1iuNA8RGm/eCrqNqi2Y8V1hlNum4SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713807206; c=relaxed/simple;
	bh=8+YgznOFk9u7FjaYZS0smLzN3+j9Gq7etE74g8obpWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dY/5T3sj2yVLncRuD5n7tvAImD0LLioT0+Nkya1j6mfcUXmykSChZLOYSqun1Ae8oukVCDKMZ/iwV+tgj86KSUzSLJ8mLlRoUGG2bPQ8ptLqN/0c8m1KhXadqFzqDiUbH129kft1dDEnvUI3WxR/D2NsHDaP7Su29XMFwSTpkas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YYbnLcqM; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YYbnLcqM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=XQry8EBSDpmzoKS2wPZgyq0GbPcHk+YW9cRs48Z1C6U=;
	t=1713807204; x=1714239204; b=YYbnLcqMr1vwNIXyuQXSfLs2QS0UHqPLksgEC6mOTcuphRk
	CUzSJOxXwegnsPQ/7wAP1M1fe75CVKdG75MhXK+H9w+f1x8ypFGz0u5fezT9hoh3S1Bk4/d4u+dHT
	HgosmQn2GrzrN3Y7aULDKLp0iFIUWxNt5RoTIHrNNsJ8g1dninZiHZQi8DWek+ieeHbpeJ2ZB2e+h
	yRBTBLaW3gzzRgJDn7uGl9WejDZUzQ8bJL3a0WxTjhjXu23VRP7mFfMUpQkpi09h6p0RlSmHcBRGp
	KOINu4mvr4q4l0/X1OyzV3qe7ZUFfmlEcF3ZCwtlEmaa0vMj5r9jm8cWP0qph3Kg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ryxXe-0007wR-A7; Mon, 22 Apr 2024 19:33:22 +0200
Message-ID: <8a4a7f9e-a191-4301-93f8-9694aa14e42f@leemhuis.info>
Date: Mon, 22 Apr 2024 19:33:21 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: Regression due to 59cf44575456 ("USB: core: Fix oversight in
 SuperSpeed initialization")
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: USB list <linux-usb@vger.kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>
 <78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1713807204;162381f1;
X-HE-SMSGID: 1ryxXe-0007wR-A7

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

Is anyone still working on fixing below regression? From here it looks
stalled, but I might have missed something.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

On 09.04.24 16:56, Alan Stern wrote:
> On Tue, Apr 09, 2024 at 03:49:01PM +0200, Oliver Neukum wrote:
>> Hi,
>>
>> with the following device:
>>
>> Bus 002 Device 002: ID fb5d:0001 BHYVE HID Tablet
>> Device Descriptor:
>>   bLength                18
>>   bDescriptorType         1
>>   bcdUSB               3.00
>>   bDeviceClass            0
>>   bDeviceSubClass         0
>>   bDeviceProtocol         0
>>   bMaxPacketSize0         8
> 
> A USB-3 device, running at SuperSpeed with its bMaxPacketSize0 set to 8 
> instead of 9?  Presumably this thing never received a USB certification.  
> Does the packaging use the USB logo?
> 
>>   idVendor           0xfb5d
>>   idProduct          0x0001
>>   bcdDevice            0.00
>>   iManufacturer           1 BHYVE
>>   iProduct                2 HID Tablet
>>   iSerial                 3 01
>>   bNumConfigurations      1
> 
> Why on earth would an HID tablet need to run at SuperSpeed?
> 
>> Binary Object Store Descriptor:
>>   bLength                 5
>>   bDescriptorType        15
>>   wTotalLength       0x000f
>>   bNumDeviceCaps          1
>>   SuperSpeed USB Device Capability:
>>     bLength                10
>>     bDescriptorType        16
>>     bDevCapabilityType      3
>>     bmAttributes         0x00
>>     wSpeedsSupported   0x0008
>>       Device can operate at SuperSpeed (5Gbps)
>>     bFunctionalitySupport   3
>>       Lowest fully-functional device speed is SuperSpeed (5Gbps)
>>     bU1DevExitLat          10 micro seconds
>>     bU2DevExitLat          32 micro seconds
> 
> A tablet not capable of running at any speed below 5 Gbps?
> 
>> we are getting a regression on enumeration. It used to work with the
>> code prior to your patch. Takashi is proposing the attached fixed.
>> It looks like we are a bit too restrictive and should just try.
>>
>> 	Regards
>> 		Oliver
> 
>> From: Takashi Iwai <tiwai@suse.de>
>> Subject: [PATCH] USB: hub: Workaround for buggy max packet size with super
>>  speed
>> Patch-mainline: Not yet, testing
>> References: bsc#1220569
>>
>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>
>> ---
>>  drivers/usb/core/hub.c | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>> index e38a4124f610..64193effc456 100644
>> --- a/drivers/usb/core/hub.c
>> +++ b/drivers/usb/core/hub.c
>> @@ -4830,7 +4830,7 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>>  	const char		*driver_name;
>>  	bool			do_new_scheme;
>>  	const bool		initial = !dev_descr;
>> -	int			maxp0;
>> +	int			maxp0, ep0_maxp;
>>  	struct usb_device_descriptor	*buf, *descr;
>>  
>>  	buf = kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
>> @@ -5070,7 +5070,8 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>>  		else
>>  			i = 0;		/* Invalid */
>>  	}
>> -	if (usb_endpoint_maxp(&udev->ep0.desc) == i) {
>> +	ep0_maxp = usb_endpoint_maxp(&udev->ep0.desc);
>> +	if (ep0_maxp == i) {
> 
> This variable looks like it was left over from earlier testing.  It's 
> not really needed.
> 
>>  		;	/* Initial ep0 maxpacket guess is right */
>>  	} else if ((udev->speed == USB_SPEED_FULL ||
>>  				udev->speed == USB_SPEED_HIGH) &&
>> @@ -5082,9 +5083,15 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>>  			dev_warn(&udev->dev, "Using ep0 maxpacket: %d\n", i);
>>  		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(i);
>>  		usb_ep0_reinit(udev);
>> +	} else if (udev->speed >= USB_SPEED_SUPER && initial) {
>> +		/* FIXME: should be more restrictive? */
>> +		/* Initial guess is wrong; use the descriptor's value */
>> +		dev_warn(&udev->dev, "Using ep0 maxpacket: %d\n", i);
>> +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(i);
>> +		usb_ep0_reinit(udev);
> 
> This could be merged with the previous case fairly easily.
> 
>>  	} else {
>>  		/* Initial guess is wrong and descriptor's value is invalid */
>> -		dev_err(&udev->dev, "Invalid ep0 maxpacket: %d\n", maxp0);
>> +		dev_err(&udev->dev, "Invalid ep0 maxpacket: %d, expected %d\n", maxp0, ep0_maxp);
> 
> This also looks like a remnant from earlier testing.
> 
> Alan Stern
> 
>>  		retval = -EMSGSIZE;
>>  		goto fail;
>>  	}
>> -- 
>> 2.35.3
>>
> 
