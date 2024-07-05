Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F234813AD03
	for <regressions@lists.linux.dev>; Fri,  5 Jul 2024 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720166892; cv=none; b=ADA46Xir481uCSsm0rtemNucdGk4xLOlHvDEYTmBF+fvw2xzfvqVLtDAy6LZMj3524Olb6ARqZ1+TMzbNxV5aUkhVfl+I/Kvq78sD1GY6vU7JCsmLe9r7sqwVu0X+eJH/DyFnYoUFkCmBRQ8CGAQ5JzpKRlx1WMH/KsL3S7rirc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720166892; c=relaxed/simple;
	bh=wvdYHlQL8lO+IlfRdDENMqAj3V5CQXQwPRSb2U+uwUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a2JbR06kYk8jEBs2BTUsziAL3hzuuny2mM3UvvZDeLb6kVKO/NHJV9uh0RjTLSE4e9Hp1J+/+DD+J0LhBw8Y3Tak+jivpZcMKaJ/JLL2VqQMutq3wWFaeovdPrffps1ymrm9HrLQFcJwZ9Co2GDUu/OMRL9v5yXpEja+aeIK+X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QaLs78Zu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QaLs78Zu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42578fe58a6so9266905e9.3
        for <regressions@lists.linux.dev>; Fri, 05 Jul 2024 01:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720166889; x=1720771689; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WjGU82DEow4vCfytvOBUtVOJAoZCXHrpyKm0G7YFVnw=;
        b=QaLs78ZuonC+T9nCLmtjhph/NOAsBoCbnpOarnZKGq7HxeQYwt1nkiEI/6QNdWGk/t
         XBYHHJQKi7ynknRp77ArwwdRvg+LbUPqoX5qLAKKMkqQvts6Tc4ggSTrQp+OK2AZDlng
         Fjv5dpFrC00KxvPF51fhToAkxQvBjDwwyydzN0i8Zp1s+K8k4ZO5dY7FNhQpqfYz29mx
         KSNZD8gtB516jNRsfcMfrFLVWIq1BB5dRD5rv9ep5GeuEFqWECWD7Y0PDmtf4L183Dq4
         lsR+u7L2UgfS+aMe2GvQz6BbosPUH4MWl4a8hpJV7g0XwUKXaeJR5y8bDs9xzZaU4AcE
         ofuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720166889; x=1720771689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WjGU82DEow4vCfytvOBUtVOJAoZCXHrpyKm0G7YFVnw=;
        b=Gd/ZH1YMdN1bfHF9JOAP4WSoyg+HLdDLMydvOGW0sDtaYZIRDKGLYL7AQFJLkYfqGq
         xOp3edklCTYTQ+Y9kQyFb84nH7aOyIxqXNuHRvgnY4vdcHw7pbcHlb9+1UbyvkMu3Qos
         zqth4IVzd8T/dc/F8SHFZSskN6s/LO5htUZIb19Bwk+tawU4F1gumSTMtkswSP4AOU1C
         skVO9ZkaaFd3gsSy+chrAuBy/YH2axZXRGrvmSUH1+rWKhY+5bn2/MZ1NN0gJyWOFUmh
         l3WmArOonBQ0VD7qMFudSFrfhL+mxCIeeyu0GBkCEOUv7FBuCJL5379kTb3gHokFLedV
         /zjg==
X-Forwarded-Encrypted: i=1; AJvYcCVERlgx9XgiSYD2upzS6XY1IrjAy5CLilhKJTqXRSQurLybgJ7QdbefPe0SduGYAbw1AAWsldrlC4FKuwDae+cP1009SJS52Rf8jbY=
X-Gm-Message-State: AOJu0YxnEWqyDxNUgzimWtEkNTH8D4jBPCxpHZAuSpR60R6qjAO3hSTC
	8vyURBvDglx4RgGepJPsMMp0EDrlZYKD3fdYSFJAb5lt9qZ9uL3JyecmIcYRnLc=
X-Google-Smtp-Source: AGHT+IFknzjJC+OXw3nrKuw0O6Ja5aXZl7xCifpIrGmyLs9uFgT9hmZIVSZhR+sgHT6jrB7dDgY4ZA==
X-Received: by 2002:a05:600c:1c11:b0:424:ada1:6d9 with SMTP id 5b1f17b1804b1-4264a46928dmr31258775e9.34.1720166889435;
        Fri, 05 Jul 2024 01:08:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4264a1d69d8sm51097775e9.19.2024.07.05.01.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 01:08:09 -0700 (PDT)
Message-ID: <b63ac8c6-213b-4307-8d33-48badee7881d@linaro.org>
Date: Fri, 5 Jul 2024 10:08:08 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: core: return -EAGAIN on uninitialized read
 temp
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rhyland Klein <rklein@nvidia.com>,
 Anton Vorontsov <cbouatmailru@gmail.com>, Jenny TC <jenny.tc@intel.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <20240704-topic-sm8x50-upstream-fix-battmgr-temp-tz-warn-v1-1-9d66d6f6efde@linaro.org>
 <a50eb87a-4dcc-4272-b897-fb8170bfe58b@linaro.org>
 <0516a900-0911-47f3-888e-57d014986e3b@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <0516a900-0911-47f3-888e-57d014986e3b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2024 07:56, Krzysztof Kozlowski wrote:
> On 04/07/2024 18:41, Daniel Lezcano wrote:
>> On 04/07/2024 10:52, Neil Armstrong wrote:
>>> If the thermal core tries to update the temperature from an
>>> uninitialized power supply, it will swawn the following warning:
>>> thermal thermal_zoneXX: failed to read out thermal zone (-19)
>>>
>>> But reading from an uninitialized power supply should not be
>>> considered as a fatal error, but the thermal core expects
>>> the -EAGAIN error to be returned in this particular case.
>>>
>>> So convert -ENODEV as -EAGAIN to express the fact that reading
>>> temperature from an uninitialized power supply shouldn't be
>>> a fatal error, but should indicate to the thermal zone it should
>>> retry later.
>>>
>>> It notably removes such messages on Qualcomm platforms using the
>>> qcom_battmgr driver spawning warnings until the aDSP firmware
>>> gets up and the battery manager reports valid data.
>>
>> Is it possible to have the aDSP firmware ready first ?
> 
> I don't think so. ADSP firmware is a file, so as every firmware it can
> be loaded from rootfs, not initramfs (unlike this driver), or even missing.

Ok, said differently, can't we initialize the thermal zone after the 
firmware is loaded ?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

