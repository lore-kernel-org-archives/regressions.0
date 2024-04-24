Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D3515EFB6
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 14:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713969891; cv=none; b=Wk/EbTpzA9Hrlwjmb4OV2OTASR76ec+hpopXThgo45R6zDLFGwLHjvpQu2ScTNXVJUh3OEKHSiMMYUazc/v2ncXsoEFJSMU29XtmkiIqbuEq8TUn3+hKAcERbpn3g8s6/b+kvipxg23CwIk7eAvAuNSD9sb4ftpn70oIGKPMdZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713969891; c=relaxed/simple;
	bh=Wjvi6/FPDxdY71RXd4ksoRnM6YcRHw0fUXQiZ75Ds04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1ai5M+2Rz4pufpTTx/vRHeA3vRVqpicvIrX4+YR3vpw1OQjDnjpiIrlqEvmKk2XrOO5ihSkb/60h/bDAWIVqTP43evgCzkt8chIspBjBUuukbu341WHeSBXeo6qfZ6b7j/rdkdrlREgaMxgzayAwLU0rSZEMo3bYLBH/XEkF9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dmAJSEEL; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dmAJSEEL"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a58872c07d8so200303966b.0
        for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713969888; x=1714574688; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nrpjcJzbIWN+7n7NJajhclpC3028/XgYLEN5udjhdz8=;
        b=dmAJSEELCGCj2sXfME2zvJmIXGXjJNAPrjMbH/vHo3kr/xEYCImWIWUCrab4oirrtH
         hIvbYxVdK6TxGnXrcPJxz8WA1buATtd7OWT3aY6dpkWs6KlGCRzOjt6I3hAlfl1oCsX5
         YihxY3xlvMGLQdwhtjqyjq4aVDQyH25dr2sjBbwIpxtZo4giixFHyDZmdzacG3yd+tLs
         jj2jWlezshe+kr7ahVeLaHZAvRGzVqFLDx3NQuMzvQaFNzUpciei/2yFbatE/3uevHd9
         0ExTu4Nb4fL199C9jnZ1VrHBPP3Kn135Vmf7Au+NjfZA1aygKHhjfJngtBMI00iZojAk
         iE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713969888; x=1714574688;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrpjcJzbIWN+7n7NJajhclpC3028/XgYLEN5udjhdz8=;
        b=BbZXDpQBilMcRoB1jBYAPGiVDLNy2Qq7V4umoRAgyEevgbUvuwut5yYOpqOarTzwaB
         wzylWbQAcz+7Ft4YKYSrf2IU6A0wc2IP2GH6OY6gFimo/V+zFt/8AuqM5jJGyjMFa/3g
         /FrNI9TJBFOC+MEgAQgoSHIyPhXaJo0VVOfh8gT3TFsB1ZbqQdouyXm1T7QWTWS21U+g
         92GFpvf1jpmUhbqDwo6vFcoD0onj+2Z8D6i7ksZ9fA53sg34THJy/wy3rb7VNJavwEU+
         R2GzaPbZo9guG0Hj4Ebg1FXCdJeHmDnNrojk+mzQtj3adCwmNBHtYKxJwsGcYpbt7hF+
         Vwvw==
X-Forwarded-Encrypted: i=1; AJvYcCX4oVc5FU8brmMFuJ8ps5NGDc1qejZPe5CBvJR7gBfn7xO4O36SmpPq9WXY7g5OwYBoDg9pTOtH+tZmH/XGNU3cx2FGFi9RarHYQYc=
X-Gm-Message-State: AOJu0YwUutRCDXgpFoCVt78kKfdglUntuJu8prVgKI90fwArsq0JJY2B
	lc7kGhR6VYGsXMFkbEL9Rk7DYYldTZS+CkfG8TYOE78uq0DaCZsBTLMNWYW7aRM=
X-Google-Smtp-Source: AGHT+IG/4ikN8fdYLqcS+lfP6wr/OoDmo7rWpkusl+iKJEh9jbx97zRs4aq7J7y2sADjQwBtnYJZcQ==
X-Received: by 2002:a17:907:868d:b0:a58:86f8:410d with SMTP id qa13-20020a170907868d00b00a5886f8410dmr4438969ejc.23.1713969888050;
        Wed, 24 Apr 2024 07:44:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k11-20020a17090632cb00b00a46a2779475sm8375189ejk.101.2024.04.24.07.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 07:44:47 -0700 (PDT)
Message-ID: <d995680b-f294-4f84-8d6b-482df44f9813@linaro.org>
Date: Wed, 24 Apr 2024 16:44:45 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] Bluetooth: qca: Fix BT enable failure for QCA6390
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Wren Turkal <wt@penguintechs.org>, luiz.von.dentz@intel.com,
 marcel@holtmann.org, linux-bluetooth@vger.kernel.org,
 regressions@lists.linux.dev, kernel@quicinc.com,
 quic_zijuhu <quic_zijuhu@quicinc.com>
References: <1713919602-5812-1-git-send-email-quic_zijuhu@quicinc.com>
 <1713919602-5812-2-git-send-email-quic_zijuhu@quicinc.com>
 <349b27a5-d2d3-46f1-b002-44f81e0cedef@linaro.org>
 <e8cd122d-e342-45c2-b078-a4ca2d8dcfff@quicinc.com>
 <dfe18768-f6da-4c60-880d-deeae3c3b04d@linaro.org>
 <8ae32009-5f5e-49a1-88a1-e330f0614f60@quicinc.com>
 <5e363318-c6e4-4874-8026-7940b434d583@linaro.org>
 <2020a858-c3d9-48a7-ad59-3691c6b98fb2@penguintechs.org>
 <CABBYNZJLCPaLTaFEfeTEn+2FpxLS8Z-W2kT1ry4jKB_W=XYNjA@mail.gmail.com>
 <CACMJSeuWQE4t2KDCRP7n-DeHN9Ndn1bE_KCRc-X2kmM9L2i7_Q@mail.gmail.com>
 <38736db8-eec4-4ebd-b4c4-4b404cea6e42@quicinc.com>
 <CACMJSev8=gBCw9o-ur87fMMj9K=ZWY-ECzxZjyvERYQ8P=VS7A@mail.gmail.com>
 <CABBYNZ+PvZb6azHoXAbO2czqK2zQnZ1ddcKRb_YX-zGSVfy+KQ@mail.gmail.com>
 <CACMJSeue3kM-G1UvO0REEAJbhU9vOqbeEzy0Qny5udKLB97e8g@mail.gmail.com>
 <2805ad96-6383-45b3-9b68-66578461bb5f@quicinc.com>
 <CACMJSeuyumcmkO8pYiWk6Gccd7njpke23NdboYrxNZxHx6XjAQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CACMJSeuyumcmkO8pYiWk6Gccd7njpke23NdboYrxNZxHx6XjAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/04/2024 16:41, Bartosz Golaszewski wrote:
> On Wed, 24 Apr 2024 at 16:25, quic_zijuhu <quic_zijuhu@quicinc.com> wrote:
>>
>> On 4/24/2024 10:19 PM, Bartosz Golaszewski wrote:
>>> On Wed, 24 Apr 2024 at 16:08, Luiz Augusto von Dentz
>>> <luiz.dentz@gmail.com> wrote:
>>>>
>>>> Hi Bartosz,
>>>>
>>>> On Wed, Apr 24, 2024 at 10:00 AM Bartosz Golaszewski
>>>> <bartosz.golaszewski@linaro.org> wrote:
>>>>>
>>>>> On Wed, 24 Apr 2024 at 15:53, quic_zijuhu <quic_zijuhu@quicinc.com> wrote:
>>>>>>
>>>>>>>>>
>>>>>>>>> Please slow down here. Zijun's patch works and Bartosz's patch does not.
>>>>>>>>> I don't think Zijun means any ill intent. I am replying to Bartosz's
>>>>>>>>> patch right now.
>>>>>>>>
>>>>>>>> Ok, that is great feedback, so I might be picking up the Zijun v7 set
>>>>>>>> if we don't find any major problems with it.
>>>>>>>>
>>>>>>>
>>>>>>> Luiz,
>>>>>>>
>>>>>>> Please consider my alternative[1] also tested by Wren. Zijun's usage
>>>>>>> of GPIO API is wrong.
>>>>>>>
>>>>>> why is it wrong ?
>>>>>>
>>>>>
>>>>> I have already told you that at least three times. But whatever, let
>>>>> me repeat again: gpiod_get_optional() returns NULL if the given GPIO
>>>>> is not assigned to the device in question OR a pointer to a valid GPIO
>>>>> descriptor. Anything else returned by it is an error and the driver
>>>>> must abort probe().
>>>>
>>>> Ok, but there are other fixes on top of it:
>>>>
>>>> https://patchwork.kernel.org/project/bluetooth/patch/1713932807-19619-3-git-send-email-quic_zijuhu@quicinc.com/
>>>>
>>>> I guess that could go in but it would really help if you guys could
>>>> work together so we don't have more competing solutions.
>>>>
>>>
>>> These threads with their 7 patch versions from Zijun within 2 days or
>>> so have become very chaotic. Let me summarize: there are two
>>> regressions: one caused by my commit 6845667146a2 ("Bluetooth:
>>> hci_qca: Fix NULL vs IS_ERR_OR_NULL check in qca_serdev_probe") and a
>>> second caused by Krzysztof's commit 272970be3dab ("Bluetooth: hci_qca:
>>> Fix driver shutdown on closed serdev"). The patch I linked here is how
>>> I propose to fix my regression only. These fixes don't seem to
>>> conflict with one another.
>>>
>> it is not conflict issue, from my perspective, you fix are wrong.
>> do you see my patch change log?
>>
>>> We (Krzysztof and I) have provided feedback to Zijun but he refused to
>>> address it and instead kept on resending his patches every couple
>>> hours. Zijun's patch 1/2 proposed to revert my commit 6845667146a2. I
>>> disagreed and proposed a way forward by fixing the regression. This
>>> fix was incorrect as pointed out by Wren, so I submitted v2 which
>>> works.
>>>
>> v2 is not right from my point as i commented with your solution.
>>
>> you don't answer my questions commented within your solution.
>>
>> what is your question i don't answer?
>>
>>> Bartosz
>>
> 
> Luiz,
> 
> This is an example of how Zijun will borrow any attempt at meaningful
> communication under a heap of incomprehensible emails. Krzysztof has
> already given up and I think I will stop too now. As the GPIO
> maintainer I suggest you take my fix for this regression. I can't make
> you though and I've already wasted way too much time on it. Your call.

Yeah, I given up. It suck way too much of my time and effort. I will
just review Bartosz' patch for completeness.

Best regards,
Krzysztof

