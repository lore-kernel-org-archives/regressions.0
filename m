Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEFB13AD39
	for <regressions@lists.linux.dev>; Wed, 27 Mar 2024 13:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711545879; cv=none; b=O3G3ouJkRs/t2Un+y/L331wKeFGMFES7Lwfh60kI87jJ9eHQK+bg+isdZ4IPJ8aSH7MmQkERLhbn3I/z+pWq6aPO/iykrwiHTSFdLPwDqTmLjGyH+m3kjr/iGFhzfF/s3mpDx19PAXDBUv8wcn1w1BBDCitGLP50VBG67LHB7eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711545879; c=relaxed/simple;
	bh=sK4u1JyrPL0gWSb3KWFe9C6ypVmyXQk2VkY15iFmMjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xa2HlnjzNDgVo9gDXQolHdnnsATOtrmXrKpO56h2ZcsRp0AnBIRZ0c1bVpFxu9P3IYTVE3/GV6FUbBjUoGI11jQbr1qqp2z+D8afGD3nhU0n8h8wW802uHXL7T2O8UN4aU5/A8NyWAPuUzQIVDYkTWoKTcg3Nu6Hqf8t0mlyky0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=eOmDB+Iv; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="eOmDB+Iv"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-512e4f4e463so7511555e87.1
        for <regressions@lists.linux.dev>; Wed, 27 Mar 2024 06:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1711545875; x=1712150675; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z6utm7a7Re6Wiqpc5NgWio6rQ7rFlgDjaONm7apCUWA=;
        b=eOmDB+IvIgMLlVcuzn4+bYzgA+LJ2oHG12vaZyQxhjgiJ7UCsXtTaFgs1NhNoVstr4
         OO1q/QLWLKphtKDjsZ8BW4bgpnhFMvkowGkfPu5Xbq/AyQ7BiuJnt/5gsjL1SnCcNbMp
         qLWHivLFBUtMurYTzvI9m2AmIiWCPv+VThYJTgcQ3LApySnzU2Vd+ir+P4lMPfg9RFTb
         1fAhXMYiGXaMWOrpzU60OFvG30C5644WczUxRdVOTkLFhD+0Ap5PDvmtggWkVetkkbMA
         gi/DYl9R5+OXYHiNOa59v1JpX8Pi4WlyVTxplg5N7+3rr2R9NW4lg8/Bcn//drEqDuqy
         YgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711545875; x=1712150675;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z6utm7a7Re6Wiqpc5NgWio6rQ7rFlgDjaONm7apCUWA=;
        b=Mi3/4cbb0npXaw1xPpM5yyMMETDL46ggyCDvPwjvfsYGRhUDLRru7WTKPJyjXL//tR
         kQX2mCgfNA2nBqCvtpVnkP5EA65PUv/iwjPERtwiFPoo5mL00ZXWaYdN0eZReanRrqNv
         xIJd2jThmh4Axl2iMiVq1T+ycMBa6xZ0NgvGN6IwrydlVLGcvknj0IZXpj86iIFFJnLF
         ooBRaIjjy92TvXxjWKg2MhtbPkQd5vYjgeXeV39W3qkMqA0jxkAWAuzgoVhISN7Pu9Cm
         ZHNg65pVATEz3p1sz8F+OSDEUgLRUJg66yEjUR77NgylcB5f0NJEwgHCgZ0LvI48S+LN
         bCXg==
X-Forwarded-Encrypted: i=1; AJvYcCV7KQchgHTE0SuFrsnOyFd23KV4GxaqdrxqYESOjW1UvOr7KgUeW96rtlNjmU1wytLp5iWOEILLpKBIfcY1xeLThbixWRtlW06AUPk=
X-Gm-Message-State: AOJu0Yz/ulUCPhyiorVQ3H5ur3+JlX1718zIMifYlHaeAxKsshJQ3fv8
	9RdEzsebafWsIqhbblE4TQzqatrTSGHd+8wKD/cYWwoUixWGDAPkNStnIEdZv+k=
X-Google-Smtp-Source: AGHT+IGTzynkBIqcDpsPLyKTUQXtSjSEbSbSBD5cTdpnmo65u6B1II3AYQD+agdiUyzPKAx4ztUZhw==
X-Received: by 2002:a19:4341:0:b0:515:8bb2:72a2 with SMTP id m1-20020a194341000000b005158bb272a2mr3737599lfj.55.1711545875255;
        Wed, 27 Mar 2024 06:24:35 -0700 (PDT)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
        by smtp.gmail.com with ESMTPSA id h4-20020aa7c944000000b0056bdf694890sm5432854edt.43.2024.03.27.06.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 06:24:35 -0700 (PDT)
Message-ID: <3939f491-4890-4a64-9f41-8c3bf738bbc3@sairon.cz>
Date: Wed, 27 Mar 2024 14:24:34 +0100
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
 <4c2a410b-2997-4a7a-8fd6-2bec819a1c4f@sairon.cz>
 <4a168b8b-f012-4b36-92bd-83aeb6849410@rowland.harvard.edu>
 <92d3d802-73df-4ab5-aab4-b2325512e98f@sairon.cz>
 <8b8e2773-47eb-48f4-b5e8-dcd885ee5c5b@rowland.harvard.edu>
 <befc1081-e512-4727-a911-f030e1aac626@sairon.cz>
 <1b2ccaf6-597c-40fe-877a-4ed1fab5261b@rowland.harvard.edu>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <1b2ccaf6-597c-40fe-877a-4ed1fab5261b@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alan,

On 19. 03. 24 17:03, Alan Stern wrote:
> Change the HUB_DEBOUNCE_TIMEOUT value to 4500, the HUB_DEBOUNCE_STEP
> value to 250 and the HUB_DEBOUNCE_STABLE value to 2000.  That just
> might give the device enough time to settle down and start working
> before the computer tries using it.

sorry for the delay, I only managed to test it today. You are right, 
with the timeouts adjusted, it enumerates fine after a while, without 
any descriptor read errors or anything like that:

[  210.957371] usb 1-1.2: new full-speed USB device number 5 using ehci-pci
[  211.037728] usb 1-1.2: New USB device found, idVendor=0658, 
idProduct=0200, bcdDevice= 0.00
[  211.037747] usb 1-1.2: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
[  211.039764] cdc_acm 1-1.2:1.0: ttyACM0: USB ACM device

If it's worth anything, usbmon trace is attached below. Anyway, do you 
have any ideas what could be done to make it work without doing any 
detrimental changes? I was thinking I'll try to reach out to the vendor 
at this point - they should be aware their device might stop working 
with recent kernels, and they could explain the quirky behavior, or 
implement any changes on the firmware side (if it's even possible).

Regards,
Jan



ffff888101391300 207454583 C Ii:1:002:1 0:2048 1 = 04
ffff888101391300 207454617 S Ii:1:002:1 -115:2048 1 <
ffff88814d461180 207454651 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 207454845 C Ci:1:002:0 0 4 = 01010100
ffff88814d461180 207454860 S Co:1:002:0 s 23 01 0010 0002 0000 0
ffff88814d461180 207455110 C Co:1:002:0 0 0
ffff88814d461180 207455119 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 207455368 C Ci:1:002:0 0 4 = 01010000
ffff88814d461180 207710110 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 207710378 C Ci:1:002:0 0 4 = 01010000
ffff88814d461180 207966112 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 207966378 C Ci:1:002:0 0 4 = 01010000
ffff88814d461180 208222112 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 208222401 C Ci:1:002:0 0 4 = 01010000
ffff88814d461180 208478109 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 208478561 C Ci:1:002:0 0 4 = 01010000
ffff88814d461180 208734110 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 208734342 C Ci:1:002:0 0 4 = 01010000
ffff88814d461180 208990111 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 208990297 C Ci:1:002:0 0 4 = 01010100
ffff88814d461180 208990317 S Co:1:002:0 s 23 01 0010 0002 0000 0
ffff888101391300 208990557 C Ii:1:002:1 0:2048 1 = 04
ffff888101391300 208990574 S Ii:1:002:1 -115:2048 1 <
ffff88814d461180 208990583 C Co:1:002:0 0 0
ffff88814d461180 209246112 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 209246405 C Ci:1:002:0 0 4 = 01010000
ffff88814d461180 209502108 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 209502393 C Ci:1:002:0 0 4 = 01010000
ffff88814d461180 209758115 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 209758358 C Ci:1:002:0 0 4 = 01010000
ffff88814d461180 210014113 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 210014318 C Ci:1:002:0 0 4 = 01010000
ffff88814d461180 210270107 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 210270327 C Ci:1:002:0 0 4 = 01010000
ffff88814d461180 210526114 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 210526337 C Ci:1:002:0 0 4 = 01010000
ffff88814d461180 210782106 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 210782340 C Ci:1:002:0 0 4 = 01010000
ffff88814d461180 211038111 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 211038365 C Ci:1:002:0 0 4 = 01010000
ffff88814d461180 211038419 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff88814d461180 211038621 C Co:1:002:0 0 0
ffff88814d461180 211050109 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 211050473 C Ci:1:002:0 0 4 = 03011000
ffff88814d461180 211050508 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff88814d461180 211050732 C Co:1:002:0 0 0
ffff88814d461180 211102145 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff88814d461180 211102383 C Ci:1:000:0 0 8 = 12010002 02000008
ffff88814d461180 211102410 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff88814d461180 211102640 C Co:1:002:0 0 0
ffff88814d461180 211114111 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff88814d461180 211114411 C Ci:1:002:0 0 4 = 03011000
ffff88814d461180 211114446 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff88814d461180 211114667 C Co:1:002:0 0 0
ffff88814d461180 211166117 S Co:1:000:0 s 00 05 0005 0000 0000 0
ffff88814d461180 211166509 C Co:1:000:0 0 0
ffff88814d461240 211180097 S Ci:1:005:0 s 80 06 0100 0000 0012 18 <
ffff88814d461240 211180460 C Ci:1:005:0 0 18 = 12010002 02000008 
58060002 00000000 0001
ffff88814d461240 211180500 S Ci:1:005:0 s 80 06 0600 0000 000a 10 <
ffff88814d461240 211180722 C Ci:1:005:0 -32 0
ffff88814d461240 211180989 S Ci:1:005:0 s 80 06 0600 0000 000a 10 <
ffff88814d461240 211181294 C Ci:1:005:0 -32 0
ffff88814d461240 211181324 S Ci:1:005:0 s 80 06 0600 0000 000a 10 <
ffff88814d461240 211181647 C Ci:1:005:0 -32 0
ffff88814d461240 211181669 S Ci:1:005:0 s 80 06 0200 0000 0009 9 <
ffff88814d461240 211181972 C Ci:1:005:0 0 9 = 09024300 02010080 32
ffff88814d461240 211181999 S Ci:1:005:0 s 80 06 0200 0000 0043 67 <
ffff88814d461240 211182437 C Ci:1:005:0 0 67 = 09024300 02010080 
32090400 00010202 01000524 00100105 24010001 04240200
ffff88814d461300 211182850 S Co:1:005:0 s 00 09 0001 0000 0000 0
ffff88814d461300 211183117 C Co:1:005:0 0 0
ffff888145f1cb40 211184128 S Co:1:005:0 s 21 20 0000 0000 0007 7 = 
80250000 000008
ffff888145f1cb40 211184335 C Co:1:005:0 0 7 >
ffff888145f1cb40 211184995 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff888145f1cb40 211185187 C Ci:1:002:0 0 4 = 03010000
