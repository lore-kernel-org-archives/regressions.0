Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88DD154C1E
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 05:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713935057; cv=none; b=pMLqMQLQYSyIHaQxpIG/VyNLCcmZxAi3DDsLzKNysAYn0yIiVCmSE34o6MTO3P7DRD1ND2xD8MoPEY+xsin4D+G+v1FJ1k6fbVazcuaD2xeORqjsGsaTJdEOvE9uZDrG6xdTGfZry7mS/oD5QCJ1tGQBKOMnq0r1jASgACusheI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713935057; c=relaxed/simple;
	bh=U1ARLhMFcK3m3ruXDOi0DDT9cekDrxtc59CZX0YpZzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aho4QhL+Hyb8kcIhgSh0iY3IG9EdY/xRiH+1FBpFTCPlDhBspZBGWOtobB8wIAm2wknjPBSNE0C74b3V5ytgF3BL6CiLRTD5l01SJFXrRqgTgOoTjqF4/322OMpxD7ZDXN0yD4/++T5wfzBw5moE00aZU3lio1hCL4rgpEAlw5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=Lyv6Phdi; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="Lyv6Phdi"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ed0e9ccca1so5958725b3a.0
        for <regressions@lists.linux.dev>; Tue, 23 Apr 2024 22:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1713935054; x=1714539854; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j1feEMujVLYWXFEcLN0xYo+2RjYfHkXYrzmA2/Kalls=;
        b=Lyv6PhdipaZyv+jVjzFEDRrLeuKKADWVwG/d58+q58yPBHPCp+QevHmQcBU3HWmkdc
         6ncTtElwHvrmcNbKc4+ZGujjUPw5TqFgcoIBn/ySFBkbfDM3vwut2h6j2joGbzAWfPeR
         5hy7HJGGcckYHGoskU/Da1PGlv0lZLsw1W3AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713935054; x=1714539854;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j1feEMujVLYWXFEcLN0xYo+2RjYfHkXYrzmA2/Kalls=;
        b=C/WkQnRBbEAkfi8sMYX1Z1wN4pFXQk19B1u8e6mYLJPXETueU5u+pp6nkOqYodt3u9
         6DIP7LMi4DODwXtGkwd/Pnbahtegeafc9+2zS26UmydwQkD03o0ssNmMGyxrh+2BnQJy
         UmqpevlWWFNFg797TfT/oOehD44/MH0CLCoK8QclJrtsesI4TqkML5TQrVkDzO8ND/r2
         WqJluUkFDS6F9fabVkKIM2vsxyO/CwA49PS7DMdkFQ81pgWZIC8nvHPcOJdnOYnnzkS5
         TnJW+y7Ppfnf1sv48YEJqWYTzRGHTGkLYDLed0GBAvDB5VmczGa0ttWJxcb/FHEWnTbm
         xMXA==
X-Forwarded-Encrypted: i=1; AJvYcCX7Ye1rKmdjnXQSEqhTryr9BVxVYCplLikrUSONeFkXmmUQeQifV6PDH3FGmJLAxtpGYkPq6ga/d3EGyFH2TdVgK0ejr4qnlxRv9tk=
X-Gm-Message-State: AOJu0YxrryBtODgnapIu9aMLPdq8alwzjTDUXmMd8mlTEPQJ3i/61m7M
	Itd41LYTi9nZSMHrMukZf3C5sDUCrT7w9SayHnzY/aZSHADsjsRkJYq/jEW4CQ==
X-Google-Smtp-Source: AGHT+IG5BavmqqE/YMGkRoIZQpkX6ocJF4GE/OpC9ej5tR2Ea5KrmRgZpPTfVQwNsoZneAizERffcQ==
X-Received: by 2002:a05:6a20:12cb:b0:1a6:b689:8c29 with SMTP id v11-20020a056a2012cb00b001a6b6898c29mr1562397pzg.61.1713935053825;
        Tue, 23 Apr 2024 22:04:13 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id c24-20020aa78818000000b006f319bdcfbesm3348472pfo.132.2024.04.23.22.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 22:04:13 -0700 (PDT)
Message-ID: <2020a858-c3d9-48a7-ad59-3691c6b98fb2@penguintechs.org>
Date: Tue, 23 Apr 2024 22:04:11 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] Bluetooth: qca: Fix BT enable failure for QCA6390
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 quic_zijuhu <quic_zijuhu@quicinc.com>, luiz.dentz@gmail.com,
 luiz.von.dentz@intel.com, marcel@holtmann.org
Cc: linux-bluetooth@vger.kernel.org, bartosz.golaszewski@linaro.org,
 regressions@lists.linux.dev, kernel@quicinc.com
References: <1713919602-5812-1-git-send-email-quic_zijuhu@quicinc.com>
 <1713919602-5812-2-git-send-email-quic_zijuhu@quicinc.com>
 <349b27a5-d2d3-46f1-b002-44f81e0cedef@linaro.org>
 <e8cd122d-e342-45c2-b078-a4ca2d8dcfff@quicinc.com>
 <dfe18768-f6da-4c60-880d-deeae3c3b04d@linaro.org>
 <8ae32009-5f5e-49a1-88a1-e330f0614f60@quicinc.com>
 <5e363318-c6e4-4874-8026-7940b434d583@linaro.org>
From: Wren Turkal <wt@penguintechs.org>
In-Reply-To: <5e363318-c6e4-4874-8026-7940b434d583@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/24 9:31 PM, Krzysztof Kozlowski wrote:
> On 24/04/2024 06:18, quic_zijuhu wrote:
>> On 4/24/2024 12:10 PM, Krzysztof Kozlowski wrote:
>>> On 24/04/2024 06:07, quic_zijuhu wrote:
>>>> On 4/24/2024 12:06 PM, Krzysztof Kozlowski wrote:
>>>>> On 24/04/2024 02:46, Zijun Hu wrote:
>>>>>> Commit 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_NULL()
>>>>>> with gpiod_get_optional()") will cause below serious regression issue:
>>>>>>
>>>>>> BT can't be enabled any more after below steps:
>>>>>> cold boot -> enable BT -> disable BT -> BT enable failure
>>>>>> if property enable-gpios is not configured within DT|ACPI for QCA6390.
>>>>>>
>>>>>> The commit wrongly changes flag @power_ctrl_enabled set logic for this
>>>>>> case as shown by its below code applet and causes this serious issue.
>>>>>> qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
>>>>>>                                                 GPIOD_OUT_LOW);
>>>>>> - if (IS_ERR_OR_NULL(qcadev->bt_en)) {
>>>>>> + if (IS_ERR(qcadev->bt_en)) {
>>>>>>    	dev_warn(&serdev->dev, "failed to acquire enable gpio\n");
>>>>>> 	power_ctrl_enabled = false;
>>>>>>    }
>>>>>>
>>>>>> Fixed by reverting the mentioned commit for QCA6390.
>>>>>>
>>>>>> Fixes: 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_NULL() with gpiod_get_optional()")
>>>>>> Reported-by: Wren Turkal <wt@penguintechs.org>
>>>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218726
>>>>>> Link: https://lore.kernel.org/linux-bluetooth/ea20bb9b-6b60-47fc-ae42-5eed918ad7b4@quicinc.com/T/#m73d6a71d2f454bb03588c66f3ef7912274d37c6f
>>>>>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
>>>>>> Tested-by: Wren Turkal <wt@penguintechs.org>
>>>>>
>>>>> No, Bartosz' patch should go.
>>>>>
>>>> what is Bartosz' patch.
>>>
>>> Srsly? You were Cc'ed on it. How many upstream patches on upstream
>>> mailing lists do you receive that you lost track of them?
>>>
>> Bartosz' patch have basic serious mistook and logic error and have no
>> any help for QCA6390, and it is not suitable regarding DTS usage.
> 
> Really? Why you did not respond with comments then? Considering how
> imprecise and vague you are in describing real issues, I have doubts in
> your judgment here as well.

Please slow down here. Zijun's patch works and Bartosz's patch does not. 
I don't think Zijun means any ill intent. I am replying to Bartosz's 
patch right now.

> 
> Best regards,
> Krzysztof
> 

-- 
You're more amazing than you think!
