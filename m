Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C13053804
	for <regressions@lists.linux.dev>; Fri, 16 Aug 2024 08:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723798664; cv=none; b=tZn1ot+597207q5c3muyhzvnLZNZw2x53nqAZ4kGQ94cYTM3SiTog0Nfo7NFix3WhZMffBBzoEZPMlAN2bx2mO8y3kdZVACXDfVAqnHGZ6/ZYV8hOWjNLz/oblXseW00VOWqNZmn0doWvOwBCAHjcNxZLwbFgx9pgc0HI6JjmgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723798664; c=relaxed/simple;
	bh=fETSMc2hQRMfQ2Q133dwwdGv+eoSJjlO71/zUgfQKn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bd4EBsGS2S9dvIhbWi3SkdxkLMts1EyBkXz6ZypGvRrcORTpH2lIzDIiKv+R+FEHUTNEYW/DYjP1jCwQYacOcg2z0gKGyM3VDhgmzIEl8Q13NEUG7xt//qBmLQjNaK7HPFQRhD2k3EiY3GVvo2fA+4nf6gaEY6je5d1OtRzbWsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=da/bgPZi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="da/bgPZi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428e3129851so12636125e9.3
        for <regressions@lists.linux.dev>; Fri, 16 Aug 2024 01:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723798661; x=1724403461; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pp9E1jzP/7LqcZV9OE83mHHXcT7BGqq4jDbXGUvR/tE=;
        b=da/bgPZiZgV3BEAMpkivs2hPbNq+y2Sg8UNh+nQo/KzibopfvOouRvXtjUUJdCHt3y
         CkBUzsA6DNx1C/bxoRQodaol3857hXBseaMU6n8fSS0yt3AsbwtWvNe4eMV2IgDyzSsN
         uNBF1W88sAcdpK7pnMJ1lYZ1uBk2krUIQct9aawV7v9ezAH01fvt0IF+Q18+lQ8wgJx1
         uDzDyZdVNlElZkV45buTEDtLvJ+bB2yQnbN8U5UyRlIW6THYgWkWj+pY/1NRtqUEtv45
         eyWxGjcZmCYBgMy2uKNGaqKeFReYL7FEFB25NJmVprCBc+c1VqeTlHd5dKjvz/NjL80c
         5KlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723798661; x=1724403461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pp9E1jzP/7LqcZV9OE83mHHXcT7BGqq4jDbXGUvR/tE=;
        b=AyDeTNIQBzNfATfRN//kfV+2z3TEAeLEapjm+7Ge51VJUtWjLTv6qkgUfiZhbkV3Ju
         cCG7JpLL9Gy/syGt+xC75rA01FaoICTuFXCvUBV9g/7oej7A2tcB2HENOc067gniBs+t
         +ipJWKToEx0AQ1ovEJvTXb8rj43EY6Wrtj0+6MdNn/s5JM87MirsRYtI/W0gmZgEP8Pu
         +l8crQ3uWnKreSXNieUpoTy5KPFl/XeX/jEROvrVLniO1sYXo50nlcENNJR7Usv1ZCUh
         IwC1y1/TCEGXJxM03kWcb+rNMoz77cWYL2FWcchyIF9ZV6YsFgjWTfs6AsteCVme1G5Q
         SjJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrkfuZxuItfX3i1/UE9a4xpRChijB+GICNgLr6DxSvH1gKN7BYH+I2XDaA8XltKo2QV0S4PvWK/m9wQ0Q99CkF94ndfRVc1JhHjeE=
X-Gm-Message-State: AOJu0Yy65BvOJlXL7wXPZ+YbG/V6pjMpO+8K+sd63No88gO6Bfv9GpAY
	mBI5iH3Lqq60pjOoVrijuf+ZNp2/5XKTer4QgkplG1C0kiLRKKgZPnPNZiC3JHc=
X-Google-Smtp-Source: AGHT+IGz56bQpjBbGo0uOLNED6Eyr940dKNOhXmrjPU5vtmy0ylGk957l6Yh8SHw3K/Bcwg+P9nRjQ==
X-Received: by 2002:a05:600c:1f90:b0:426:6960:34b0 with SMTP id 5b1f17b1804b1-429ed7bab7fmr13192735e9.14.1723798660662;
        Fri, 16 Aug 2024 01:57:40 -0700 (PDT)
Received: from [192.168.1.3] ([89.47.253.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed794640sm16916315e9.41.2024.08.16.01.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 01:57:40 -0700 (PDT)
Message-ID: <88cea92d-98ee-4a1e-8a44-a7c6a247ba2e@linaro.org>
Date: Fri, 16 Aug 2024 09:57:39 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Perf (userspace) broken on big.LITTLE systems since
 v6.5
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, Ian Rogers <irogers@google.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linux perf Profiling <linux-perf-users@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 James Clark <james.clark@arm.com>, "cc: Marc Zyngier" <maz@kernel.org>,
 Hector Martin <marcan@marcan.st>, Asahi Linux <asahi@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <08f1f185-e259-4014-9ca4-6411d5c1bc65@marcan.st>
 <ZV1AnNB2CSbAUFVg@archie.me>
 <a9c14dfd-3269-4758-9174-4710bef07088@leemhuis.info>
 <CAP-5=fXqx_k1miPTkcAmS3z2GBPt2KeDtP5fknmdDghZqxXPew@mail.gmail.com>
 <714ed350-0e6c-4922-bf65-36de48f62879@leemhuis.info>
 <0de3b572-f5f7-42e4-b410-d1e315943a3c@linaro.org> <ZrzeRM3ekLl9zp3z@x1>
 <348ea015-eccf-4f44-a332-a1d9d8baf81f@linaro.org> <Zr4eWd6HWLHDcpC9@x1>
 <Zr4kZTxgvD6bmi37@x1>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <Zr4kZTxgvD6bmi37@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/08/2024 4:53 pm, Arnaldo Carvalho de Melo wrote:
> On Thu, Aug 15, 2024 at 12:27:21PM -0300, Arnaldo Carvalho de Melo wrote:
>> On Thu, Aug 15, 2024 at 04:15:41PM +0100, James Clark wrote:
>>> In one of your investigations here
>>> https://lore.kernel.org/lkml/Zld3dlJHjFMFG02v@x1/ comparing "cycles",
>>> "cpu-cycles" and "cpu_cycles" events on Arm you say only some of them open
>>> events on both core types. I wasn't able to reproduce that on
>>> perf-tools-next (27ac597c0e) or v6.9 (a38297e3fb) for perf record or stat. I
>>> guessed the 6.9 tag because you only mentioned it was on tip and it was 29th
>>> May. For me they all open exactly the same two legacy events with the
>>> extended type ID set.
>>>
>>> It looks like the behavior you see would be caused by either missing this
>>> kernel change:
>>>
>>>    5c81672865 ("arm_pmu: Add PERF_PMU_CAP_EXTENDED_HW_TYPE capability")
>>>     (v6.6 release)
> 
> What I have now is:
> 
> 6.1.92-15907-gf36fd2695db3
> 
> It was a bit older, but 6.1 ish as well, I'll try to either get a new
> kernel from Libre Computer or build one myself.
> 
> - Arnaldo
>

Thanks for the confirmation. In that case you may not even need to 
retest. I was only wondering if it was broken from v6.6 onwards, but 6.1 
not working is expected. And I'm certain that you'll find any later 
versions working.

>>> Or this userspace change, but unlikely as it was a fix for Apple M hardware:
>>>
>>>    25412c036 ("perf print-events: make is_event_supported() more robust")
>>>     (v6.9 release)
>>>
>>> Do you remember if you were using a new kernel or only testing a new Perf?
>>
>> I normally use the distro/SoC provided kernel, didn't I add the 'uname
>> -a' output in those investigations (/me slaps himself in the face
>> speculatively...)?
