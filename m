Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8001757D
	for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710151104; cv=none; b=Z1k7UPqYK0LXbk3wNDgrUo0cq8zNq/mSGX1EgTK34Ol5B6nIGaBcO33lwNSB+y8C+P0anUMhM9gXDCd7b1dXy/88Yxhkh275jlUiPrng6TaU/qoR6n0Af+0X+MmJRGGh7JgFnIc8Q28BF62DRHpuU5j9BY4lqAg3tbFkzYUmY+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710151104; c=relaxed/simple;
	bh=WzOuexDXNHJfVLpDsLi/j5carQxZ7Ator1iXUkcUXVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fWwvUG423ORw5KG9RZ7uL6BGiAMEDmJMlOztX/2yo9jTlnDsGDzWQ3SXe9cN4BoP+ZoC6GCl2dBBex2o0Hy8kjyiX2yvQfKoJWAkC5K+KQd9hoaXd1SASPJOAKH6rJFE7Es+Qm2ErOfRYRSvlpd7JN+wz75st76TVQwe0vk+Pc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=b+g4PI2/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="b+g4PI2/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5683576ea18so3006650a12.3
        for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 02:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1710151100; x=1710755900; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+4G+RFqm6TAKRoasVo5QUl7d7n7sQEAw3Vx1YsE9jgQ=;
        b=b+g4PI2/7GLxxxtFKVLXAJSqmzsW65COJVqVWin6sArzNzEiJg59R7m/nz+LsFWWKO
         PjW1ts4WC4FjhojzlbvjqPHXwYakRH4pEMpUkuNu4O6nb6J6WzImcRHCYxJdZZPb4V+V
         /mkyT4+V43qFHHWxhhyb8UNLlcVMJG2rg5/eUdtaMIO5dHys36/8Glvd6N+bKNSVwcRn
         3qlZPUVeHfDRuSFptvI0at09m6fDJmaEXhNSlwyZ+agtOXEXrRIznXSxpzo1PrWjf4tI
         YjMQluonXzKCkDwCsh3Ye3F4dlau5AH4TEmmMluLkqxylK0LDbedelOwnAzvYYWKuVmL
         7ebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710151100; x=1710755900;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+4G+RFqm6TAKRoasVo5QUl7d7n7sQEAw3Vx1YsE9jgQ=;
        b=Y3p4qcIxKy+ET2o8KQK6P+hidslqvEKFgpQVRvPKgCXjnk13GdotS2yw8EP6eQxVf6
         SnqekyFXo9wqhsPMuEoNk9mHZPjphdJW3r01XdIjstwLIYGSIZrPdDn4K2NvQ7pfg6TS
         vgTMzusbpsWtLVV1GOFmsr0BkVyW7n2H8XH2KqqiZXx1Eei67wZyp8qU9vclTxfc1gBK
         X0/eMwyLZSYXHBn+aG9rMdBrLPO6re+jrHoYIfZo94SqBKfq2DIF0HJJ1SHvmOkrckWg
         S+K9QX8CAZv7yXlVeQmv5m6nvbEO/GxWNEBtr1IlUgTc54n66LNg9McynlKWek7NH0pV
         w69w==
X-Forwarded-Encrypted: i=1; AJvYcCVf+P3MUeta6cmZjwKSDEfJJT3Me0EFuefTSPdZrBUVD5plbbF+fbWVNx9feBo8jv8txu3G6TuCt9xyg9AGN5mSj6eVSyqfnrBTDbQ=
X-Gm-Message-State: AOJu0YxUDWl/XH/KIoNHEOBLYCQhRuqP5XOj2jbeRK3PaU3zP/4GQZo/
	lCftczwdMp4bCkqi3SOKp+qfBJyqy7VfUI3iXMuRhevaqlIN/0IipfoRi5p8wNEGETdBbWv//JU
	W1YU=
X-Google-Smtp-Source: AGHT+IEWFd0Lni3H4a6DBK8eJOmQ7Sv16rcrNe3OaaWJJMOGHqjkeAixGqq3+/h7HWx0N8qfprWWkA==
X-Received: by 2002:a17:907:c706:b0:a3e:cdae:7aa2 with SMTP id ty6-20020a170907c70600b00a3ecdae7aa2mr3802782ejc.35.1710151099987;
        Mon, 11 Mar 2024 02:58:19 -0700 (PDT)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
        by smtp.gmail.com with ESMTPSA id ae1-20020a17090725c100b00a45ffe583acsm2590321ejc.187.2024.03.11.02.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 02:58:19 -0700 (PDT)
Message-ID: <4c2a410b-2997-4a7a-8fd6-2bec819a1c4f@sairon.cz>
Date: Mon, 11 Mar 2024 10:58:18 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
 USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <1e954652-dfb3-4248-beea-b8a449128ff0@sairon.cz>
 <4c3ab861-0274-409b-aad3-7cfb53dc2308@rowland.harvard.edu>
 <00f0786b-a9f2-4f73-8d23-3b1fa4c8b77e@sairon.cz>
 <60def275-5237-48df-b37b-ab886f4ee017@rowland.harvard.edu>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <60def275-5237-48df-b37b-ab886f4ee017@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07. 03. 24 20:34, Alan Stern wrote:
> Another thing the traces showed is that the device doesn't like the
> "new" initialization scheme; it wants the "old" one.  You can test
> this by setting the old_scheme_first module parameter for usbcore
> before plugging in the device:
> 
> 	echo 1 >/sys/module/usbcore/parameters/old_scheme_first
> 

You are right, this indeed works and probing is successful after the 
power-cycling attempt.

> Also, you can try the patch below (without the module parameter set).
> I suspect it should be applied in any case, but it would be nice to
> know if it makes any difference in your case.
> 
> Index: usb-devel/drivers/usb/core/hub.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/hub.c
> +++ usb-devel/drivers/usb/core/hub.c
> @@ -5481,6 +5481,7 @@ loop:
>   			msleep(2 * hub_power_on_good_delay(hub));
>   			usb_hub_set_port_power(hdev, hub, port1, true);
>   			msleep(hub_power_on_good_delay(hub));
> +			hub_port_debounce_be_stable(hub, port1);
>   		}
>   	}
>   	if (hub->hdev->parent ||

Unfortunately, this doesn't fix it. It changes the log output a bit but 
still does not enumerate:

[  199.295695] usb 1-1.2: new full-speed USB device number 25 using ehci-pci
[  199.360684] usb 1-1.2: device descriptor read/64, error -32
[  199.534678] usb 1-1.2: device descriptor read/64, error -32
[  199.708671] usb 1-1.2: new full-speed USB device number 26 using ehci-pci
[  199.773666] usb 1-1.2: device descriptor read/64, error -32
[  199.941602] usb 1-1.2: device descriptor read/64, error -32
[  200.044871] usb 1-1-port2: attempt power cycle
[  200.528631] usb 1-1.2: new full-speed USB device number 27 using ehci-pci
[  200.940603] usb 1-1.2: device not accepting address 27, error -32
[  201.208592] usb 1-1.2: new full-speed USB device number 28 using ehci-pci
[  201.223783] usb 1-1.2: device descriptor read/8, error -32
[  201.345772] usb 1-1.2: device descriptor read/8, error -32
[  201.452899] usb 1-1-port2: unable to enumerate USB device

I'm attaching usbmon traces with this patch.

Regards,
Jan

####################################################


ffff94ff414f8a80 199261119 C Ii:1:002:1 0:2048 1 = 04
ffff94ff414f8a80 199261158 S Ii:1:002:1 -115:2048 1 <
ffff94ff882bd840 199261199 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199261378 C Ci:1:002:0 0 4 = 01010100
ffff94ff882bd840 199261383 S Co:1:002:0 s 23 01 0010 0002 0000 0
ffff94ff882bd840 199261635 C Co:1:002:0 0 0
ffff94ff882bd840 199261661 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199261902 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 199288109 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199288463 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 199315108 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199315374 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 199342113 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199342504 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 199369107 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199369447 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 199369498 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd840 199369903 C Co:1:002:0 0 0
ffff94ff882bd840 199381106 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199381375 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd840 199381410 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd840 199381633 C Co:1:002:0 0 0
ffff94ff882bd840 199433148 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd840 199433339 C Ci:1:000:0 -32 0
ffff94ff882bd840 199433360 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd840 199433971 C Ci:1:000:0 -32 0
ffff94ff882bd840 199433988 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd840 199434342 C Ci:1:000:0 -32 0
ffff94ff882bd840 199434363 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd840 199434609 C Co:1:002:0 0 0
ffff94ff882bd840 199446107 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199446423 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd840 199446448 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd840 199446679 C Co:1:002:0 0 0
ffff94ff882bd840 199606111 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd840 199606348 C Ci:1:000:0 -32 0
ffff94ff882bd840 199606372 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd840 199607003 C Ci:1:000:0 -32 0
ffff94ff882bd840 199607090 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd840 199607593 C Ci:1:000:0 -32 0
ffff94ff882bd840 199607623 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd840 199608123 C Co:1:002:0 0 0
ffff94ff882bd840 199620108 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199620506 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd840 199620531 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd840 199620770 C Co:1:002:0 0 0
ffff94ff882bd840 199782114 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff94ff882bd840 199782380 C Co:1:002:0 0 0
ffff94ff882bd900 199782433 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd900 199782639 C Co:1:002:0 0 0
ffff94ff882bd900 199794109 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd900 199794511 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd900 199794536 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd900 199794769 C Co:1:002:0 0 0
ffff94ff882bd900 199846142 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd900 199846554 C Ci:1:000:0 -32 0
ffff94ff882bd900 199846574 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd900 199846828 C Ci:1:000:0 -32 0
ffff94ff882bd900 199846842 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd900 199847170 C Ci:1:000:0 -32 0
ffff94ff882bd900 199847236 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd900 199847490 C Co:1:002:0 0 0
ffff94ff882bd900 199859108 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd900 199859470 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd900 199859496 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd900 199859726 C Co:1:002:0 0 0
ffff94ff882bd900 200014111 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd900 200014492 C Ci:1:000:0 -32 0
ffff94ff882bd900 200014516 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd900 200014828 C Ci:1:000:0 -32 0
ffff94ff882bd900 200014854 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd900 200015180 C Ci:1:000:0 -32 0
ffff94ff882bd900 200015251 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd900 200015502 C Co:1:002:0 0 0
ffff94ff882bd900 200027108 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd900 200027318 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd900 200027345 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd900 200027579 C Co:1:002:0 0 0
ffff94ff882bd900 200182109 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff94ff882bd900 200182296 C Co:1:002:0 0 0
ffff94ff882bd840 200182354 S Co:1:002:0 s 23 01 0008 0002 0000 0
ffff94ff882bd840 200182551 C Co:1:002:0 0 0
ffff94ff882bd840 200390109 S Co:1:002:0 s 23 03 0008 0002 0000 0
ffff94ff882bd840 200390345 C Co:1:002:0 0 0
ffff94ff882bd840 200494114 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 200494318 C Ci:1:002:0 0 4 = 01010100
ffff94ff882bd840 200494345 S Co:1:002:0 s 23 01 0010 0002 0000 0
ffff94ff882bd840 200494571 C Co:1:002:0 0 0
ffff94ff882bd840 200521107 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 200521316 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 200548107 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 200548426 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 200575100 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 200575338 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 200602100 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 200602260 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 200602311 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd840 200602714 C Co:1:002:0 0 0
ffff94ff882bd840 200614101 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 200614389 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd840 200614416 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd840 200614842 C Co:1:002:0 0 0
ffff94ff882bd840 200666141 S Co:1:000:0 s 00 05 001b 0000 0000 0
ffff94ff882bd840 200666529 C Co:1:000:0 -32 0
ffff94ff414f8a80 200797181 C Ii:1:002:1 0:2048 1 = 04
ffff94ff414f8a80 200797212 S Ii:1:002:1 -115:2048 1 <
ffff94ff882bd840 200870110 S Co:1:000:0 s 00 05 001b 0000 0000 0
ffff94ff882bd840 200870423 C Co:1:000:0 -32 0
ffff94ff414f8a80 201053174 C Ii:1:002:1 0:2048 1 = 04
ffff94ff414f8a80 201053190 S Ii:1:002:1 -115:2048 1 <
ffff94ff882bd840 201079556 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff94ff882bd840 201079768 C Co:1:002:0 0 0
ffff94ff882bd900 201079814 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd900 201080045 C Co:1:002:0 0 0
ffff94ff882bd900 201092106 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd900 201092293 C Ci:1:002:0 0 4 = 03011100
ffff94ff882bd900 201092321 S Co:1:002:0 s 23 01 0010 0002 0000 0
ffff94ff882bd900 201092559 C Co:1:002:0 0 0
ffff94ff882bd900 201092596 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd900 201092819 C Co:1:002:0 0 0
ffff94ff882bd900 201294110 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd900 201294319 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd900 201294346 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd900 201294575 C Co:1:002:0 0 0
ffff94ff882bd900 201346134 S Co:1:000:0 s 00 05 001c 0000 0000 0
ffff94ff882bd900 201346293 C Co:1:000:0 0 0
ffff94ff882bd840 201360112 S Ci:1:028:0 s 80 06 0100 0000 0008 8 <
ffff94ff882bd840 201360521 C Ci:1:028:0 -32 0
ffff94ff882bd840 201360558 S Ci:1:028:0 s 80 06 0100 0000 0008 8 <
ffff94ff882bd840 201360922 C Ci:1:028:0 -32 0
ffff94ff882bd840 201360938 S Ci:1:028:0 s 80 06 0100 0000 0008 8 <
ffff94ff882bd840 201361276 C Ci:1:028:0 -32 0
ffff94ff882bd840 201482107 S Ci:1:028:0 s 80 06 0100 0000 0008 8 <
ffff94ff882bd840 201482304 C Ci:1:028:0 -32 0
ffff94ff882bd840 201482330 S Ci:1:028:0 s 80 06 0100 0000 0008 8 <
ffff94ff882bd840 201482934 C Ci:1:028:0 -32 0
ffff94ff882bd840 201482954 S Ci:1:028:0 s 80 06 0100 0000 0008 8 <
ffff94ff882bd840 201483278 C Ci:1:028:0 -32 0
ffff94ff882bd840 201590112 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff94ff882bd840 201590387 C Co:1:002:0 0 0
ffff94ff882bd900 201591835 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff94ff882bd900 201592045 C Co:1:002:0 0 0
ffff94ff882bd900 201592073 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd900 201592497 C Ci:1:002:0 0 4 = 01010000
