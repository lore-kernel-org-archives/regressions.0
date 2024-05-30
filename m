Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4177F1CB318
	for <regressions@lists.linux.dev>; Thu, 30 May 2024 06:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717051120; cv=none; b=NhG6jRnga7aaZn3m7LKvKAztWQVWYudeQxBmXnqoTxEMWYFfHsrPTyA6T/+3sUpyDqd5QJg0KgtCuXP/IArBApiXwhyIVKy5w/zTuz32Etlr4Ct5l7LQAZl4mpHTTk7NZSTUAXaCf2dIwSJu9EKoBOFEqnWUlTbSZCXENeWVxMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717051120; c=relaxed/simple;
	bh=3iSSVFjIwnSFCrdOdDZd6ny8U3SfjsDDOMMrtMc+HQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkzBtnweWfE9J2yPnERz6XI9OV4LG4tbQeZdHnmjJzOcpO/DOslT/ktenjBig3gBvLjgBn3G7RTFpsw8AyUuUeecYVm/FIw6x3fBjAEn859OIqOJgZC4RBJztkiwNoVGITfIHcvBoBnhdr6Fua4N7r3FSS+EAwZgdS0C7vOmtjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org; spf=pass smtp.mailfrom=me.ssier.org; dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b=AqDAg+YZ; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b="AqDAg+YZ"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dfa584ea2ffso406871276.1
        for <regressions@lists.linux.dev>; Wed, 29 May 2024 23:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1717051117; x=1717655917; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6I6bUq5MtPsSJCD04nOMib7SEtzLq2qYb33NbiPQPqo=;
        b=AqDAg+YZVUHA7SxcpzkjcY5s4qdHMQNHWUoyw/K0C/p5037F/hzUPXsSf7nJ3ppKcW
         0R7p5Pev7X9c0X4nfqXTYeYYAqWHia5aAcDQMi5WGkO+J8vRwj4cf1VuKLpBZj1FjLKk
         ZpHI7UkWTYbJGAusCK5wLxKrSfXt05ak/Jp3Yw4kArCWgDiWxV2Zf6DZOGLk1plabJrm
         eOhFQEIOy3OTrvvxmo507RyGnj0VVGmF6RuNr2H653JXYnrXdbZPRRCMDMCIhS7d4xeK
         iM0PNLFSMooHKmufn4Fo25HRCTkPsPTductQLFhpK8WrdpA2llHziiGRSJeRnIz/EvwJ
         mWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717051117; x=1717655917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6I6bUq5MtPsSJCD04nOMib7SEtzLq2qYb33NbiPQPqo=;
        b=SNZqHNvBNErKsRkOa3OPQ9EOwfBbri6NZFEfC3HHplSkQDcwzXiyc5G0MOY/l7S2ey
         XMXttD/dBFONcLXinMd9GVHPVV4pUuljECp9iq8SfqzWYHP2ZiPRFJc3hcYfh/TE2P7W
         IY31mfPgAiYRhCjnX5roZ0ysQ2e7nLU8/TMpzBMujWuzLpobBcOATd96kueQ2ban53Fa
         0E6UZYya36YPLcDEDeMqnAX/M+c/maDiAd+qhvWFjhcUVpaA4tV3w11ceqxo0MwXRqLC
         TObU1oroPkb7hWVeyHz/l62wQUPI2cTwEHF+0bt791a4lzsvDxDO3zeZKVbNoal6896Q
         6/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCV55iu5OW+eAe/Qn6n3IRK8O11+jUzsrrcO8gU1G4N73FPAljOY86u5aEe7945D78FwUPtEzV/QUv8sGkmbVw7vzdQpvZvOyhROeao=
X-Gm-Message-State: AOJu0YyHyYWdj2qfM3h0ri56/4MGHLitSRkCAY5d/IOJiHQEP3JY++qt
	ZJ704sbIn05DN5wv3U1xeX5TtboJZrmZ9cmK04OTRlWEz9WNQcov7D9pNphBOzI=
X-Google-Smtp-Source: AGHT+IF7XKqWolRteq20RdszdOCxHfIqaWsAlefedQXQH0si50DrOE1KOgzxBdM/g6qKNQxWSjjdWw==
X-Received: by 2002:a25:a2cb:0:b0:dfa:584d:5e3b with SMTP id 3f1490d57ef6-dfa5a5b7f75mr1425987276.6.1717051117021;
        Wed, 29 May 2024 23:38:37 -0700 (PDT)
Received: from [192.168.2.14] ([74.14.126.218])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ac162ef87fsm60876626d6.80.2024.05.29.23.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 23:38:36 -0700 (PDT)
Message-ID: <87546d93-3fe7-4459-b44a-47cbcab9da74@me.ssier.org>
Date: Thu, 30 May 2024 02:38:25 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: chipidea: move ci_ulpi_init after the phy
 initialization
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Peter Chen <peter.chen@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, wouter@franken-peeters.be
References: <20240328-chipidea-phy-misc-v1-1-907d9de5d4df@pengutronix.de>
 <CGME20240425194033eucas1p2c1e98d1c55c970e246087e2dab180e84@eucas1p2.samsung.com>
 <21ea292a-b1d1-43e2-92ab-9f1f63aaf729@samsung.com>
Content-Language: en-US
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <21ea292a-b1d1-43e2-92ab-9f1f63aaf729@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-04-25 15:40, Marek Szyprowski wrote:
> Dear All,
> 
> On 02.04.2024 08:23, Michael Grzeschik wrote:
>> The function ci_usb_phy_init is already handling the
>> hw_phymode_configure path which is also only possible after we have
>> a valid phy. So we move the ci_ulpi_init after the phy initialization
>> to be really sure to be able to communicate with the ulpi phy.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> This patch landed in linux-next some time ago as commit 22ffd399e6e7 
> ("usb: chipidea: move ci_ulpi_init after the phy initialization"). 
> Unfortunately it breaks host USB operation on DragonBoard410c 
> (arch/arm64/boot/dts/qcom/apq8016-sbc.dts). There is no error nor 
> warning in the kernel log besides the information about deferred probe 
> on the chipidea controller:
> 
> platform ci_hdrc.0: deferred probe pending: (reason unknown)
> 
> Tomorrow I will try to investigate which operation during driver probe 
> triggers it. If there is anything else to check that might help fixing 
> this issue, let me know.

I am also seeing this issue on a msm8974-based device.

There is also a report and analysis by Wouter Franken here:
https://lore.kernel.org/all/ecb8d3e8-d525-4a2d-a868-803202c16296@franken-peeters.be/

Reverting the commit does fix the issue for me.

Adding to regzbot for tracking:

#regzbot introduced: 22ffd399e6e7 ^

Thanks,
Alexandre

> 
>> ---
>>   drivers/usb/chipidea/core.c | 8 ++++----
>>   drivers/usb/chipidea/ulpi.c | 5 -----
>>   2 files changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
>> index 835bf2428dc6e..bada13f704b62 100644
>> --- a/drivers/usb/chipidea/core.c
>> +++ b/drivers/usb/chipidea/core.c
>> @@ -1084,10 +1084,6 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>>   		return -ENODEV;
>>   	}
>>   
>> -	ret = ci_ulpi_init(ci);
>> -	if (ret)
>> -		return ret;
>> -
>>   	if (ci->platdata->phy) {
>>   		ci->phy = ci->platdata->phy;
>>   	} else if (ci->platdata->usb_phy) {
>> @@ -1142,6 +1138,10 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>>   		goto ulpi_exit;
>>   	}
>>   
>> +	ret = ci_ulpi_init(ci);
>> +	if (ret)
>> +		return ret;
>> +
>>   	ci->hw_bank.phys = res->start;
>>   
>>   	ci->irq = platform_get_irq(pdev, 0);
>> diff --git a/drivers/usb/chipidea/ulpi.c b/drivers/usb/chipidea/ulpi.c
>> index dfec07e8ae1d2..89fb51e2c3ded 100644
>> --- a/drivers/usb/chipidea/ulpi.c
>> +++ b/drivers/usb/chipidea/ulpi.c
>> @@ -68,11 +68,6 @@ int ci_ulpi_init(struct ci_hdrc *ci)
>>   	if (ci->platdata->phy_mode != USBPHY_INTERFACE_MODE_ULPI)
>>   		return 0;
>>   
>> -	/*
>> -	 * Set PORTSC correctly so we can read/write ULPI registers for
>> -	 * identification purposes
>> -	 */
>> -	hw_phymode_configure(ci);
>>   
>>   	ci->ulpi_ops.read = ci_ulpi_read;
>>   	ci->ulpi_ops.write = ci_ulpi_write;
>>
>> ---
>> base-commit: 5bab5dc780c9ed0c69fc2f828015532acf4a7848
>> change-id: 20240328-chipidea-phy-misc-b3f2bc814784
>>
>> Best regards,
> 
> Best regards

