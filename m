Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D957E57D
	for <regressions@lists.linux.dev>; Tue,  5 Mar 2024 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709626827; cv=none; b=Xi5VAJB2roIk64kZDsHKQg3ynr/Nt6AAsepNN1yeTsyXfeqqHRFZhewRhJifzus6zoAnnEx5mi8wG0C4EIWe1MCqViMoxPyNzpGvQiaEdwE6OZ31WBgZB4zHDLU4mu3s1kW+9QNRqVT1lsPY7d4BgqB+8UmmUyanW6aZMu9Rd8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709626827; c=relaxed/simple;
	bh=e/15w+mHPSCvhdKQ8QwceDaXPrSNYKAi3RNQElsZfj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=grbzuwlmq166DaDxlpTs4BBxxE8D5hcQAJQWuleISE9v1iMbLrN6VZkSK0Mo4IVWLMAjj03ijuAwgyG1JeS2dNUMsVpqO5zbW6/irLTsaBX0neBg09A77Z2kWssR76hMgAXxrEYYYiyQlRR4uR1lUNGphuTU+hCOqsbv4ecev+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=lALEDH2q; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="lALEDH2q"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so10705267a12.1
        for <regressions@lists.linux.dev>; Tue, 05 Mar 2024 00:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1709626824; x=1710231624; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8CsUjF7JQbAcdgvYOQzZMP2VzXv092YSfeMTAYcnO4=;
        b=lALEDH2qCcLsESAvkUr9tvVhT8uGALdwY23nvtDOa26CaR1YJ347ejqAB6gz1VaO2g
         WquU3j0rHpZLNP6234sQmb9kcPoX0CgfuqsOTiY713hSOMxdnK3AjlAVSV0ulyr8uvz7
         bEtFId9SUuVqHUL+7JZyw8X2H4Z7ZgoK6jZaFzvY/gF9bOvlk8IsGzDgZmHwng8uxgHY
         cNJPCfLDY3kEDcI7ijOFQp2umzTHTC8kVzsleBD8QcW7dkA5Alz6p4Nc3cKht63A49q0
         COZLr0rZcczlkL2D1ug4SGuYF0OenNUVMW7K1VeVHsiqC4NWRx/I0qSoy9yujF73UDeH
         sXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709626824; x=1710231624;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8CsUjF7JQbAcdgvYOQzZMP2VzXv092YSfeMTAYcnO4=;
        b=wzewc6vfHZjDwv7r1phkrsavUwyD6HNGKsPkofk0QnHgHWAQ751AjWbZtG1q1VVE7r
         ek5joWRdkSC/2i3XC52/QjkkW5UR+STyZ1gNVBS93K89DYal681pKeBdfFRHibIfN4O4
         3MpODw5DqYsX14j/+5MNIBANgygp2+HhgjnZcFeRoNuqu1x1KGW6bw5tTMZxJqLHbDrq
         egTmkxUWJ+Mb4XcHfG4Wi21mpDoTxC4nF5JylpchFHFuzDow1qee2tJZTxN3ldpsEA3L
         5ksZWmaNgxZs7ZT4r17qQgGJ3tTviErDmeiuFjASX6I2kW+okHxx3ChIfUHeHOkrPIsf
         AJeA==
X-Forwarded-Encrypted: i=1; AJvYcCWMnghoHZ8ViGY8vFIAew0LpxmZrCaBMT3nqBow6+tWIWFvNyyNx1qEV1CDQtrT6ywfqHu0xNXXINlluD/TeJshj495zBKYLYtUjqM=
X-Gm-Message-State: AOJu0YwAp3mLvsb0NyHxYkjHDUl3/PxbKD+AQilAnY9r95ubazGVjP0Y
	+VkFStjFHpRooNC57WQ7QQ5dOY1/lvyQ+i7lqyCLFBlSH5mXhBE62pXm2hrTMfo=
X-Google-Smtp-Source: AGHT+IGAzddLrKdouAn1vzKrQnL+AqI69thyT/BpaaQ0bLSgzQww8ZY27ap7ftu6i683+dOO7bzCKQ==
X-Received: by 2002:a17:907:764b:b0:a3f:f8a7:e1f7 with SMTP id kj11-20020a170907764b00b00a3ff8a7e1f7mr1880347ejc.5.1709626823544;
        Tue, 05 Mar 2024 00:20:23 -0800 (PST)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
        by smtp.gmail.com with ESMTPSA id tb5-20020a1709078b8500b00a4329670e9csm5725377ejc.126.2024.03.05.00.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 00:20:23 -0800 (PST)
Message-ID: <1e954652-dfb3-4248-beea-b8a449128ff0@sairon.cz>
Date: Tue, 5 Mar 2024 09:20:22 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Khazhy Kumykov <khazhy@google.com>,
 USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alan, Greg, everyone,

On 04. 08. 23 21:09, Alan Stern wrote:
> An outstanding syzbot bug report has been traced to a race between the
> routine that reads in the device descriptor for a device being
> reinitialized and the routine that writes the descriptors to a sysfs
> attribute file.  The problem is that reinitializing a device, like
> initializing it for the first time, stores the device descriptor
> directly in the usb_device structure, where it may be accessed
> concurrently as part of sending the descriptors to the sysfs reader.

I have a suspicion that some of these patches (three from the original 
series, plus the "Fix oversight..." one) introduced a regression we see 
with some USB devices in Home Assistant OS (but in mainstream distro as 
well, see below). In particular it's Z-Wave.me UZB stick (0658:0200), 
however roughly at the time of introduction of these patches, we started 
to see a few more reports of issues with USB devices (in general radios 
for IoT protocols), so I can't rule out it's source of more regressions. 
For this particular device, we have most detailed tracing of the issue, 
confirming it also manifests on mainstream distribution (Debian) which 
included these patches in its kernel. Most issue reports come from RPi 3 
but we also got them on amd64, and both on HAOS and Debian.

I'm a layman in terms of the USB stack, so I might be wrong about some 
assumptions, but anyway, the device seemed to always misbehave due to 
poor HW (?) implementation - every time it's plugged into an USB slot, 
the following messages appear:

[ 1134.073005] usb 1-1.4: new full-speed USB device number 12 using dwc_otg
[ 1134.153006] usb 1-1.4: device descriptor read/64, error -32
[ 1134.341003] usb 1-1.4: device descriptor read/64, error -32
[ 1134.529004] usb 1-1.4: new full-speed USB device number 13 using dwc_otg
[ 1134.609063] usb 1-1.4: device descriptor read/64, error -32
[ 1134.797005] usb 1-1.4: device descriptor read/64, error -32
[ 1134.905181] usb 1-1-port4: attempt power cycle

However, kernel versions prior to 6.1.52, or 6.1.73 with these patches 
reverted, were able to recover:

[ 1135.717049] usb 1-1.4: new full-speed USB device number 14 using dwc_otg
[ 1135.741234] usb 1-1.4: New USB device found, idVendor=0658, 
idProduct=0200, bcdDevice= 0.00
[ 1135.741275] usb 1-1.4: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
[ 1135.743959] cdc_acm 1-1.4:1.0: ttyACM0: USB ACM device

Without these patches reverted, 6.1.73 goes 2 another rounds of device 
descriptor read errors, and ends with:

[ 263.705865] usb 1-1-port4: unable to enumerate USB device

Also it should be noted that it seems that this only happens on USB 2 
ports, on USB 3/SS ports, the descriptor read errors are "protocol 
error" instead of "broken pipe", and the driver recovers (realizing 
this, I am now finally able to reproduce the issue in my environment):

[ 38.244292] usb 2-3: new full-speed USB device number 3 using xhci_hcd
[ 38.372319] usb 2-3: device descriptor read/64, error -71
[ 38.608317] usb 2-3: device descriptor read/64, error -71
[ 38.844287] usb 2-3: new full-speed USB device number 4 using xhci_hcd
[ 38.972317] usb 2-3: device descriptor read/64, error -71
[ 39.208325] usb 2-3: device descriptor read/64, error -71
[ 39.316405] usb usb2-port3: attempt power cycle
[ 39.936295] usb 2-3: new full-speed USB device number 5 using xhci_hcd
[ 39.957228] usb 2-3: New USB device found, idVendor=0658, 
idProduct=0200, bcdDevice= 0.00
[ 39.957241] usb 2-3: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
[ 39.999591] cdc_acm 2-3:1.0: ttyACM0: USB ACM device
[ 39.999639] usbcore: registered new interface driver cdc_acm
[ 39.999641] cdc_acm: USB Abstract Control Model driver for USB modems 
and ISDN adapters

This is the gist of the problem, more detailed findings can be found in 
reports by @FredrikFornstad in the GH issue [1], who managed to 
reproduce and pinpoint the likely source of the problem.

Let me know if you need any more details, or if there's something more 
to try, I'll be happy to help with getting this resolved.

Thanks,
Jan


[1] 
https://github.com/home-assistant/operating-system/issues/2995#issuecomment-1973507518
