Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C56415687D
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 05:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713937030; cv=none; b=C4BpfRJ8YafUbxsSxNuj0XnjerBOAJgLTBHmM4ziLiqyxymbjhH4cnKcs2vnVlPg0pBrdJxrmSUKjFfMfjkn36VWkPDwHJQQ4CrKSp9acR0vTwmAIJvagpcvoZPkSXkcucas3i8Ke9o6UpEHMX88HqMrcOKSBOsAsR1RNjFDV44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713937030; c=relaxed/simple;
	bh=QusuSqMHdPq6C/CJ3ENqNKHB+dHBtJZNmUPJB3+F3ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=anU4Ac77raKZAzzhpW4wDDX6WgIPdWJEGG0AYNhXnuNAgr4cDYVHqZnxzanXv8Ubcbv/2K8u+5jSvcJH0Da/Oh8CRC6K3P0Zf37KKjNO+rBiCWDdaB/94BdLp+66CDcmVUxUdtdDgoWYRH8uxRKGSvEh4Ct3fpBVzCFmIBbjI/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=BinW3wx2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="BinW3wx2"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e5c7d087e1so52544395ad.0
        for <regressions@lists.linux.dev>; Tue, 23 Apr 2024 22:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1713937027; x=1714541827; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WTYiowv/jO5SBd5fVNLzPl+KfQ4pn8ng6hL2RWoRcyc=;
        b=BinW3wx2KgElwXNXC4WPdENAzkDLQrYtGvsW9pOZsBF0w8iNp7CDIvMR5ykc9KOSer
         +BW4Y6XpGQFZBFfm4xruPPpwZIWnUl7vOds/AjXALvR6V7VfXI+C8Rp6AAW9sdnNovDF
         Fs8ouDimKOa88IfJ+edF2amvQXl1m+ZMozUus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713937027; x=1714541827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WTYiowv/jO5SBd5fVNLzPl+KfQ4pn8ng6hL2RWoRcyc=;
        b=j7dy+mMFvLVbF5x3yT4S0QOIhlxT5grkxNTjp8MAUnN862D7Kj1BeOGt2gvAXimGeG
         l+uiEtgEvpDul0zTCuqs2+WK4RJm5zxJRNsdwuuzi3djcywa6VvLZBcEEd4ycIJ26ytj
         K2YMwpcNLMuVB1VoY/VQnt2KwkjNUJocCXEB+HRHLncLYWkoXdvNRE3dySgpzkuzPomz
         eD/rtbi0tPizp9rEicBcoWnfjPzry9KNyap3Key7KzbHTr3bQ1MuiKO2ebuXMr52ZVAH
         AYy0gdOUkf686vX/YrZviLKorLSSGtbbiSrtNTR/VJ5UXtqxIK0AocZfZdmVk++wdGiz
         46IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmYYbcacbdIXmU/rVdYdXhNq6b90ZxF12v7zBPZvDlfZx3qmMNnFD5imu9bDjX/4e9pSSajYEpoYjW78foT4ouxA6XibcFGHEvtss=
X-Gm-Message-State: AOJu0YwApjxEoeV4abTFv+MTCwpPQIGQV6sbA2HwvdodADYKeHGtE5OJ
	syl4xAh521IvfQEW3tycJFRu4xM97ZVJ7d69dM/Zgfn3wYSAHKIufmI680HLsQ==
X-Google-Smtp-Source: AGHT+IHWaFUsqgpzdbN3mUtXogHVXYFDI6iQLIQKcuSkE1sc+qTSw7nVcSVeClHYUFwnU537Babwgw==
X-Received: by 2002:a17:902:6f16:b0:1e7:b7a7:9f1f with SMTP id w22-20020a1709026f1600b001e7b7a79f1fmr1367840plk.2.1713937026707;
        Tue, 23 Apr 2024 22:37:06 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id d17-20020a170903209100b001e264b50964sm10990116plc.205.2024.04.23.22.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 22:37:06 -0700 (PDT)
Message-ID: <c1fc9c28-25df-4d41-9ae6-c5d079ea805d@penguintechs.org>
Date: Tue, 23 Apr 2024 22:37:04 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] Bluetooth: qca: Fix BT enable failure for QCA6390
Content-Language: en-US
To: quic_zijuhu <quic_zijuhu@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, luiz.dentz@gmail.com,
 luiz.von.dentz@intel.com, marcel@holtmann.org
Cc: linux-bluetooth@vger.kernel.org, bartosz.golaszewski@linaro.org,
 regressions@lists.linux.dev, kernel@quicinc.com, gregkh@linuxfoundation.org,
 stable@vge.kernel.org
References: <1713932807-19619-1-git-send-email-quic_zijuhu@quicinc.com>
 <1713932807-19619-2-git-send-email-quic_zijuhu@quicinc.com>
 <a8a7e3df-44c6-4fa6-a576-da384c02e9ac@linaro.org>
 <067db05d-56bc-4ca3-aef1-bc3bae47667c@quicinc.com>
From: Wren Turkal <wt@penguintechs.org>
In-Reply-To: <067db05d-56bc-4ca3-aef1-bc3bae47667c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/23/24 10:02 PM, quic_zijuhu wrote:
> On 4/24/2024 12:30 PM, Krzysztof Kozlowski wrote:
>> On 24/04/2024 06:26, Zijun Hu wrote:
>>> Commit 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_NULL()
>>> with gpiod_get_optional()") will cause below serious regression issue:
>>>
>>> BT can't be enabled any more after below steps:
>>> cold boot -> enable BT -> disable BT -> BT enable failure
>>> if property enable-gpios is not configured within DT|ACPI for QCA6390.
>>>
>>> The commit wrongly changes flag @power_ctrl_enabled set logic for this
>>> case as shown by its below code applet and causes this serious issue.
>>> qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
>>>                                                 GPIOD_OUT_LOW);
>>> - if (IS_ERR_OR_NULL(qcadev->bt_en)) {
>>> + if (IS_ERR(qcadev->bt_en)) {
>>>    	dev_warn(&serdev->dev, "failed to acquire enable gpio\n");
>>> 	power_ctrl_enabled = false;
>>>    }
>>>
>>> Fixed by reverting the mentioned commit for QCA6390.
>>>
>>> Fixes: 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_NULL() with gpiod_get_optional()")
>>> Cc: stable@vge.kernel.org
>>> Reported-by: Wren Turkal <wt@penguintechs.org>
>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218726
>>> Link: https://lore.kernel.org/linux-bluetooth/ea20bb9b-6b60-47fc-ae42-5eed918ad7b4@quicinc.com/T/#m73d6a71d2f454bb03588c66f3ef7912274d37c6f
>>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
>>> Tested-by: Wren Turkal <wt@penguintechs.org>
>>> ---
>>> Changes:
>>> V6 -> V7: Add stable tag
>>
>> Stop sending multiple pathchsets per day. I already asked you to first
>> finish discussion and then send new version. You again start sending
>> something while previous discussion is going.
>> you concern is wrong and i am sure it don't block me sending new patch
> sets to solve other issue. so i send this v7.
> 
> i have give reply for Bartosz' patch.
> 
> i hop you as DTS expert to notice my concern about DTS in the reply.

Are you saying here (1) that you identified a problem in the DTs that 
you hope Krzysztof notices or (2) that you want Krzysztof to notice how 
your description of way that DT declares the gpio as required affects 
your proposed change. As a native American English speaker, I am finding 
your text hard to follow.

I think you are saying #2.

I just want to make sure I am following the discussion here.

wt
-- 
You're more amazing than you think!
