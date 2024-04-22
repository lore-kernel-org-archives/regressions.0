Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9557A147C78
	for <regressions@lists.linux.dev>; Mon, 22 Apr 2024 12:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713788582; cv=none; b=rFlhH2wrxsFExMmechur9cxjGteBtKFhF3EJUEq5T57LIfENs+RUB4XEVTic7vi0dCvXwmrLP9Xuu2WioVVsqbxGvebuzX5fp2H998ULiDqvmPTqlC3xxj075T86VNr//HoiWqMdPczbPKuuw7dnM3IZQ1DpoKjEf4ItMr4t8MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713788582; c=relaxed/simple;
	bh=I9DwJZ3PSlZ/pCbMHKLmj/ZnPSwKwkscT23PmRtBgkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQqqcFDlPB6LFk/rUpLr+kGjxlrtQfi2CqPh+4NOPWX9X2QdwokXwPxLPZdtOdWsRQeCRbt2sShzbfS+S1L+nLALun9N6JKxNHp7XwEyIO04BBfDEhofegG07ekt46FPyt5d4yf5UBtMmVE56HjYYoq++3AnBKoZhXzvqmMfLRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KBdUwGIF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KBdUwGIF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41a5b68ed4fso6227465e9.0
        for <regressions@lists.linux.dev>; Mon, 22 Apr 2024 05:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713788579; x=1714393379; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+d99mddtix7DbeBP2Wraphdcf8tWmkbi88UHgf28Qxg=;
        b=KBdUwGIFX8LcRoTH3qkPWY5J4ee7t+qTPkx1uNJ21EcFmkFMADW2CTc0S4ZoYA2ZNA
         TYH9gZu8Xbgs1M0bJ+skopGxWaqyl+IaTtQCBZajAz96ek4BEsat5W2R4LKzqNoG68EJ
         O9C/izBRAEBh1w9QqhIQo+FVULy1wBkHQEvS5PWiBIpnStbFGJxBPh8KHho6WqAUyajO
         zP4/5JIHRWPGO3nS9ebgTz65k/vUbFu8Ic2vuAh78aPCCcNfOcwqZAGJ7rKTmj83qk15
         ksV3YpJTxQquooqGISNBFbUuM6sJe0EkPPn5S0qv06FtqqsJ3VHArEbrWkfvbTeonoeN
         o99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713788579; x=1714393379;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+d99mddtix7DbeBP2Wraphdcf8tWmkbi88UHgf28Qxg=;
        b=WHGjv15+fPxWsRCVaSRKSr2uGCE060kmKjbDig6qDz5A0ep1MeiuRnah81FMKFE8a8
         Uq13k9vuOsoZjHhchWoV5JoMmn549Uy36CGGEKI/ODwCmhQpuEjDN9R7a1NavQW5aoAR
         R3h5YAgqZ/hGy+j/LKuUns3K4WzxwfQKLDK83ySFvv7EzJbP+lEYrsrvCPKu6JhfIL0W
         iRwEr07+wS6X5Sc7022s5sh7lyRbLWFvuCywE/uhlz+v/uqx+W+aSOoo1BehZzglFetC
         tOaIO3hWGe1zZsf0YySh40sMWfYL50aDmwQ7GSuErLxKARrEYZn3ZAymUyDFlyGUfJIJ
         iOcg==
X-Forwarded-Encrypted: i=1; AJvYcCWEZ3YiMcRhtWW8b28F6rv/Xn50nE9re9DvoT9+u+YnJMcUhITdgy5Jc3TudGhebNXyW+ufagYz2XdMxGaoPr4qA3cNaWsi9XKGPsk=
X-Gm-Message-State: AOJu0Yw/wvu3c97mYVJtrLaCeD8tbboHYAnjDbFdgOxO5qqjp691CNuR
	Do8JRVLGtRZRijXawpdDTik0H1PduSuMoUxKFTy+St/DLqsQz4BoovE6rSH8KQw=
X-Google-Smtp-Source: AGHT+IEqVuI8kanfFkkhunDNSerpCNGEjjhxKaHogbuDCxny2XcIOJMbQcEZxvgR4Kx5t+UagFo2fg==
X-Received: by 2002:a05:600c:45d0:b0:41a:7065:430a with SMTP id s16-20020a05600c45d000b0041a7065430amr1434976wmo.41.1713788578878;
        Mon, 22 Apr 2024 05:22:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b0041a46ff5e78sm4316208wmo.38.2024.04.22.05.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 05:22:58 -0700 (PDT)
Message-ID: <01b0f63e-55f0-4396-bb8b-521bbe9b060e@linaro.org>
Date: Mon, 22 Apr 2024 14:22:57 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] Bluetooth: qca: Fix BT enable failure for
 QCA_QCA6390 after disable then warm reboot
To: quic_zijuhu <quic_zijuhu@quicinc.com>, luiz.dentz@gmail.com,
 luiz.von.dentz@intel.com, marcel@holtmann.org
Cc: linux-bluetooth@vger.kernel.org, bartosz.golaszewski@linaro.org,
 wt@penguintechs.org, regressions@lists.linux.dev
References: <1713650800-29741-1-git-send-email-quic_zijuhu@quicinc.com>
 <1713771497-5733-1-git-send-email-quic_zijuhu@quicinc.com>
 <1713771497-5733-3-git-send-email-quic_zijuhu@quicinc.com>
 <f744a2ba-f842-454a-a04f-76207f0db9bf@linaro.org>
 <930736f3-696c-4076-93fb-d879691bac66@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <930736f3-696c-4076-93fb-d879691bac66@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/04/2024 13:25, quic_zijuhu wrote:
> On 4/22/2024 3:42 PM, Krzysztof Kozlowski wrote:
>> On 22/04/2024 09:38, Zijun Hu wrote:
>>> From: Zijun Hu <zijuhu@qti.qualcomm.com>
>>>
>>> Commit 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on closed
>>> serdev") will cause below regression issue:
>>>
>>> BT can't be enabled after below steps:
>>> cold boot -> enable BT -> disable BT -> warm reboot -> BT enable failure
>>> if property enable-gpios is not configured within DT|ACPI for QCA_QCA6390.
>>>
>>> The commit is to fix a use-after-free issue within qca_serdev_shutdown()
>>> during reboot, but also introduces this new issue regarding above steps
>>> since the VSC is not sent to reset controller during warm reboot.
>>>
>>> Fixed by sending the VSC to reset controller within qca_serdev_shutdown()
>>> once BT was ever enabled, and the use-after-free issue is also be fixed
>>> by this change since serdev is still opened when send to serdev.
>>>
>>> Fixes: 272970be3dab ("Bluetooth: hci_qca: Fix driver shutdown on closed serdev")
>>> Reported-by: Wren Turkal <wt@penguintechs.org>
>>
>> NAK. This is way too much. Previous discussion is going, I asked there
>> questions and before any answers happen, you keep sending new version.
>> This leads to previous discussion gone/missed.
>>
>> You ignored several questions and feedbacks.
>>
>> Best regards,
>> Krzysztof
>>
> i believe my commit message explains WHAT/WHY/HOW about this issue.
> 
> 1) the qca_serdev_shutdown() was introduced by my below commit
> Commit 7e7bbddd029b ("Bluetooth: hci_qca: Fix qca6390 enable failure
> after warm reboot")
> 
> 2) then Krzysztof's below commit was made to fix use-after-free issue
> but also causes discussed regression issue.
> Commit 0b7015132878 ("Bluetooth: btusb: mediatek: add MediaTek
> devcoredump support")
> 
> 3) my fix will solve both this issue and the use-after-free issue.

I had to keep reminding you about answering to question multiple times.
So one more time:

> You did not address original issue of crash during shutdown and did
not clarify my questions.

> Anyway, any explanation providing background how you are fixing this
issue while keeping *previous problem fixed* is useful but should be
provided in commit msg. I asked about this two or three times.

> BTW, provide here exact kernel version you tested this patches with.
Also the exact hardware.

Best regards,
Krzysztof

