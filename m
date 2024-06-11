Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBAC101E2
	for <regressions@lists.linux.dev>; Tue, 11 Jun 2024 21:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718140777; cv=none; b=fwLN98crG+WyT8ZjraYbfTd5ombfFVEBtBRqfgjSfojwJ7VGqCrqAT1e8L91SlwkLA2qJAPUyOInIbIemf7dHw0qgnjCfAZisM4kD8jZq9Q9o0D8d5hwBiyAzNwQJshEBE8rIXWI4TuEQcET0RDLdq/k3z1xev+II/DC8J+PK+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718140777; c=relaxed/simple;
	bh=ELCydqjpdFo4e5YLr2TqZB1sj47Z8XFwUvs0m0bOxMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPhAWSoUZQ039rm/zbKTp0a80Fli4xda2B7abcsDUj2qMPT7NoW314BFD27f9zf/EGkBAy2M141FqlEksX68nebM6MedUiX1ruzu75WmxTCGXFEgkZ3IHxItebIUw+bwPJPUoLZScjiW1k5TOieRJDHF1Ctr8LHM8RbKGt54nWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=H4kiQxAF; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="H4kiQxAF"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-254aec5a084so1588200fac.3
        for <regressions@lists.linux.dev>; Tue, 11 Jun 2024 14:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1718140775; x=1718745575; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIrp8qzhxU8e7FrceQyxypKcph7vNSgb2Uumfdyvzas=;
        b=H4kiQxAFZZMzv+qXUa5B6WNY2gWL8SBhzAX7p8ThvEnKX5jdiwqonFKB20K8FCK23z
         6mYvC0FXiAnce75kDJ3K7dmz+MsMTb1mGT3NcrNpZNFmR3bjjW9TmxBQ3Qxbz6mugfk9
         Ux1BHmQTDl6rEXteQcZqwoWqrDcv1uas6rO6Hl+cDkYTlaaZRlbKKpNvTbBWSj2Uddv5
         CglyMS8Q3FvnFj5TMZbzUzYCmhQOQK0W8/eVtpzcTjrk2mQ7vKzmfIP5I7MXF6/6R7+S
         NFNq+izIYVEcymuWiI+13fbu+jmPZkwOxENh3o110b4rTUiP7NTmSCrDoW4tJ10FU9/G
         rETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718140775; x=1718745575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kIrp8qzhxU8e7FrceQyxypKcph7vNSgb2Uumfdyvzas=;
        b=gm0MG29Qxmu/cMloNzv7JoJt+c/8QJymhG233glHuweM1hX7NeOSWvBGl8TC3gXZ+Q
         aPh2TdNTznN1vJ0yg98xLIqHcsQKhIwblBQivWLv3jZ9eT82ndybTPPQY8V0ct1Wi+OS
         lTt61N6GiWGxshlFJ0Se/VDw1+8+ciVXREU3LtCwNbLyEquf8IEwhp0vuJgRAkyOlOnC
         E17LyJNeN3WX5Q0vfKv88KtNyKm46xo+X08ztcfrIYeYb3K1bbgK1IaWDF1TYzKZB/6z
         LjQZAI7Oh4HTm7WUuFB/xuuvbS5MtH4bKDE2Xbec8gCSQMi0uPWU8TX+qB+ocRnBmp/z
         q1Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVcALgC701yqBonci/D5eFopGM0r+QlYTSH/M8SLC15nbkaLprrE9W4gzI7NjZaP55qR2hsrAaAOpEZvAmVcl0zBOqg8IbuXMHG1Ks=
X-Gm-Message-State: AOJu0YzXIVkdTKerbyTvsmi9CLKT+3V4X++BoGbOCeD1SsCJ5gymKLsX
	ahr0hQRJQb4KH6GCSjbm+2tORP4ftP+oKAqFmGqSw6Bk0dvPcu/6GFr2m+RLCBY=
X-Google-Smtp-Source: AGHT+IEspAynUq6bEDt0FQbYW3uXgAn4JXj6JpZ/+Vmr9hn7HqhaGFU2dhDx1yYp9Pq3vY+Wts3Rlw==
X-Received: by 2002:a05:6870:f113:b0:24f:c7cf:17fb with SMTP id 586e51a60fabf-25514c037f9mr50908fac.22.1718140775044;
        Tue, 11 Jun 2024 14:19:35 -0700 (PDT)
Received: from [192.168.1.98] (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f9d9a98e74sm616426a34.72.2024.06.11.14.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 14:19:34 -0700 (PDT)
Message-ID: <f288cbb9-af88-4c4e-94d4-60b0829bd0dc@kali.org>
Date: Tue, 11 Jun 2024 16:19:32 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cpufreq/thermal regression in 6.10
To: Johan Hovold <johan@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <ZmVfcEOxmjUHZTSX@hovoldconsulting.com>
 <CAJZ5v0gVnjVyd_O6KgXy2sXr3b3M3vyTLyUCasyxP0GrAXro4Q@mail.gmail.com>
 <CAJZ5v0iz7gwhpvT53CH0ZEA_q3U=dnn6XR8HdLk6LpP3ye4Zkg@mail.gmail.com>
 <Zmg8x6JXQW1dqOr4@hovoldconsulting.com>
Content-Language: en-US
From: Steev Klimaszewski <steev@kali.org>
In-Reply-To: <Zmg8x6JXQW1dqOr4@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/11/24 7:02 AM, Johan Hovold wrote:
> On Tue, Jun 11, 2024 at 12:54:25PM +0200, Rafael J. Wysocki wrote:
>> On Mon, Jun 10, 2024 at 1:17 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>>> On Sun, Jun 9, 2024 at 9:53 AM Johan Hovold <johan@kernel.org> wrote:
>>>> Steev reported to me off-list that the CPU frequency of the big cores on
>>>> the Lenovo ThinkPad X13s sometimes appears to get stuck at a low
>>>> frequency with 6.10-rc2.
>>>>
>>>> I just confirmed that once the cores are fully throttled (using the
>>>> stepwise thermal governor) due to the skin temperature reaching the
>>>> first trip point, scaling_max_freq gets stuck at the next OPP:
>>>>
>>>>          cpu4/cpufreq/scaling_max_freq:940800
>>>>          cpu5/cpufreq/scaling_max_freq:940800
>>>>          cpu6/cpufreq/scaling_max_freq:940800
>>>>          cpu7/cpufreq/scaling_max_freq:940800
>>>>
>>>> when the temperature drops again.
>> If this is the step-wise governor, the problem might have been
>> introduced by commit
>>
>> 042a3d80f118 thermal: core: Move passive polling management to the core
>>
>> which removed passive polling count updates from that governor, so if
>> the thermal zone in question has passive polling only and no regular
>> polling, temperature updates may stop coming before the governor drops
>> the cooling device states to the "no target" level.
>>
>> So please test the attached partial revert of the above commit when you can.
> Thanks for the quick fix. The partial revert seems to do the trick:
>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
>
> Johan

I can also confirm that it's working here!

Tested-by: Steev Klimaszewski <steev@kali.org>

