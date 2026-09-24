Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFFC40929D
	for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 07:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233788; cv=none; b=V3SFw6CVJzOdWdNrcog2nMg9+kYdwt1rRLpPue03Ah1af/YafRSm8yOa2srSvxYhNTLDMxdbABaRy0cFskFbZm/wuzVy55RaAVBbJ5WNn2DkfHsJH/nWNH+6wKcMk/9rk/BqvU0StfDn5yXDBJxzIugsNnwy0dwzrbKg33dtnMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233788; c=relaxed/simple;
	bh=K7D7cVhyfKWTG5ZsIkrNnok6a9O/FIU+9I2MVB2PDTg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WN96zFyuCiFnWsfkeoaRo9dmKOMgY5Sgtn5velZbuF3q2BzlnJ5eczcuAAXLlP9tye6c8oRRO9c0XnK9JSBhBx+12Z/BJ153Kijku78FjaEg/24eNwYpqwAFlOCV22nVq/7ChFJ7X5qPIG+zzdncgHviys5RBoKdup5H3RmueD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r28mzjoE; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r28mzjoE"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48586861639so272729f8f.0
        for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 00:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790233781; x=1790838581; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7avs/biYs8l8E4Q+bkJinfYIswxmGt6u/gkPhCnUaNY=;
        b=r28mzjoE/yJoTXvHOVirS7KIdYGROfu0Ig6rl8Vrdoa4s1ovbMr0SfanOi+KbhSWpD
         tK3px1HW1gXqlMHJ3Bz/LQ4Iz0rdRXiKb+2oy7g+65lpWhB207wGwKL+4x0o8Ua4kUGt
         TLnYdp0q71VT9aNGVD4M5Sj50bQ2CPegZSExNSygktbK2gUrJOKQ8mVdKUKFE4b25VGL
         LzrssG80eZ8W4/uJK1fA3NHQviyfGs/Xox2d/TWdaMiZisv/bqFKdv4GuHEMQVfgJu5B
         2jWXt+W0dABaimtItuWX5RMav5QJhGz3nW75gKwd7VcsTZWKc60s05acglqB55pc17zf
         pMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233781; x=1790838581;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7avs/biYs8l8E4Q+bkJinfYIswxmGt6u/gkPhCnUaNY=;
        b=1Jaq3Z2GCQXMBQD8D7jbinJQY+cKYubwWAgOP1UH6fe6YIYjTgCqN9aS9m0eNWx2Yz
         n9+L/S8IOS2k4voqR+qwS9LlBTj1t0jzt0/0j4r6qJX+HnFGHbzi33qE58GE/cMlF9z/
         lxW/vqnp7aa0azm7s9CWRepkrgOswE7gvVTnzGAcw3fUAkFCPEXm/JX0cpzUa0TKkFD6
         1H0MzWhqg8rIHzWh+fuRQPKLJZVCftPyOJtgupFR03Wbac3bzRvNNjI9MDajdpDcQN4f
         yg7YGSuQISInBj6bu9zZ45PIJsQJjF4tW+lbQdzs5ro695t69113yq5jIeoRuDuqqVDy
         IqJg==
X-Forwarded-Encrypted: i=1; AKwUvBwnB03vGoNYj77nTuNhzitaLQXDGFCQLeNiiXbA+JLkQ/Zr2u6Nn7TVQGg6F4BsIaCQDvgho+CFJJWT1g==@lists.linux.dev
X-Gm-Message-State: AFuF++kbIIywxw51jjNidBIvfN2qW/yNM6l9HuNJLEhF/INlMU/ZT8tF
	j8s++tKDprA5tgDDxyIuehMvX9TtawEwDUBF91iBMcs6tCOLh0zSRIghXe5dwhxj33Y=
X-Gm-Gg: AYBFou0W+9d440fEQYJuHRor5oImiflhVgKif5twTH+tMoTmmf+DA4K8xmapq7wv4uz
	W+U13zVhYNx57zSwKEhz79tH5NshYXizamRnhDeKXGh9YzFRPf8p0Jae7WrmzSi8j7X0Zk4N+Fy
	vFnNFS6zlYHQDKOAj5tHWiBeBdqBl/k5G5nPv1ADTX+EHLaABnfFUH8dsB2n03JkdKxMpfLjq2H
	xSUdnZtDkp1eu+KcId6IUbqVKnvKSqpM/UL9QXSh43ONsdNue/A4ZwzOyKUcoiJ9IbK0y1IpmJN
	Fq8RD3A6bcrzdPBSs2c1dZ9ox4QlW76L0hLsKmzS14FN6Am8JClOlwrsbLn3S/ibS2aLBGBvGSy
	kAfBHHZPQnYSTPKTWJIYIjklp2V8MK+j/mu80FqmrZn8c8Ts0d7FKEXM/0cJ2t5M2WF+XODPmeI
	+SewQpik/T1BTiCKN/PV6CGLnIetA5As+ia769AmY8h5jxF+k67W6tgQuIZJ+0v/CVOA3gTXtwe
	Q/3kkHiaAhPYoAANTNTac79ZUK8MIk1qnMmgxxcNUYG3GSk1wENYScULEcX+H2+wrw+AI2v+zs=
X-Received: by 2002:a05:6000:1861:b0:487:e:f4f6 with SMTP id ffacd0b85a97d-488716dd323mr2953334f8f.15.1790233780913;
        Thu, 24 Sep 2026 00:09:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5e86:d153:fdb4:61c0? ([2a01:e0a:106d:1080:5e86:d153:fdb4:61c0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877a2a5sm13347227f8f.26.2026.09.24.00.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 00:09:40 -0700 (PDT)
Message-ID: <2e369f45-6c9a-4604-a66e-f35c0904ec0f@linaro.org>
Date: Thu, 24 Sep 2026 09:09:39 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [REGRESSION] Resolutions broken after "drm/msm: dsi: fix PLL init
 in bonded mode"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 Mohit Dsor <mohit.dsor@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, vishnu.saini@qualcomm.oss.com,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
 <ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com>
 <wrhuksrzlxw2pjlvjm37dwjuztcv7qs5t6mqiav4ujecwqdkwj@ozbfxpbgaimt>
 <CAJfMnmEVwUwt=wMJ-8HKH1yz9+erWLrRGB+6wVYCdSGDK+_T_Q@mail.gmail.com>
 <114b9be8-1fca-4762-822e-1d53838d5de5@leemhuis.info>
 <o64cxeq5f4ffqpdmbai5cvsmxei2cnw3p6acvu55xl3cj5w3z3@6o6kokszvng7>
 <akt6z1irWlXA5UIy@hu-mdsor-hyd.qualcomm.com>
 <493b8d4c-164e-43c9-93c8-40cc251b1c3b@leemhuis.info>
 <d7v4kwmc42k5ymgdt4mn2qc7dkrf5jj2l5afgyjqrm3pxterl4@guulk22xwlzs>
 <f77e53d3-fb80-4832-aff7-4ab1244ee4a4@linaro.org>
 <y64m2frbbg67zfukyuuds5cx65fx3rjxfujbckoerv7sswhk2u@i6p4k3ul4aec>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <y64m2frbbg67zfukyuuds5cx65fx3rjxfujbckoerv7sswhk2u@i6p4k3ul4aec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/23/26 22:58, Dmitry Baryshkov wrote:
> On Wed, Sep 23, 2026 at 12:48:21PM +0200, neil.armstrong@linaro.org wrote:
>> Hi,
>>
>> On 7/8/26 15:31, Dmitry Baryshkov wrote:
>>> On Wed, Jul 08, 2026 at 09:26:04AM +0200, Thorsten Leemhuis wrote:
>>>> On 7/6/26 11:52, Mohit Dsor wrote:
>>>>> On Wed, Jun 03, 2026 at 03:11:34PM +0300, Dmitry Baryshkov wrote:
>>>>>> On Wed, Jun 03, 2026 at 11:56:15AM +0200, Thorsten Leemhuis wrote:
>>>>>>> On 5/4/26 22:09, Mohit Dsor wrote:
>>>>>>>> Sorry for the late reply. I am attaching clk_summary and reg_dump in
>>>>>>>> working and non working case. Lilliput is just a normal display working
>>>>>>>> with hdmi and has 720p as preferred mode. Yes, I was talking about RB3
>>>>>>>> Gen2 only.
>>>>>>>
>>>>>>> Neil, Dmitry, and Mohit: what's the status here? From the outside it
>>>>>>> looks like this regression is still unfixed with nothing happening for
>>>>>>> weeks now. Or has progress been made and I just missed it?
>>>>>>
>>>>>> Thanks as a reminder. Unfortunately, it takes some more time (and I've
>>>>>> been a bit overloaded lately). Worst case I will send a revert soon.
>>>>>>
>>>>> Just wanted to check if you had a chance to look into this issue and whether there's any update on the investigation from your side.
>>>> Hmm, no reply. Given that we are entering holiday season and are way
>>>> past what Linus expects in a situation like this[1] I'd say we should go
>>>> for a revert, unless some fix shows up really soon now.
>>
>> Sorry I'm very late to the party, and checked again, reverting this breaks all dual-DSI setup
>> on SM8650, and probably other similar SoCs.
>>
>> Here's a complete log of the breakage which appears on the Ayaneo PS2 running v7.3-rc3 with mainline panel driver: https://gitlab.postmarketos.org/-/snippets/65
>>
>> I don't see why my fix did break this use case since it reverted the way the dual DSI PHYs
>> were initialized to actually allow the dual-DSI setup.
> 
> See commit cb55f39bf7b1. Without PLL_SHUTDOWNB and DIGTOP_PWRDN_B most
> of the PLL registers read as zero. Currently the regs are handled
> correctly (almost). With your patch in place the SHUTDOWNB gets dropped,
> making PLL loose reg contents (and return 0 to CCF as the selected divisor).
> Current code depends on those two bits being set across host_power_on.

Thanks I'll have a look.

Neil

> 
>>
>> Thanks,
>> Neil
>>
>>>>
>>>> Ciao, Thorsten
>>>
>>> Please send a revert.
>>>
>>>>
>>>> [1] To quote Linus statements from
>>>> https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
>>>>
>>>> """
>>>>   From 2026-01-22:
>>>>
>>>>    But a user complaining should basically result in an immediate fix -
>>>>    possibly a "revert and rethink".
>>>>
>>>> With a later clarification on 2026-01-28:
>>>>
>>>>    It's also worth noting that "immediate" obviously doesn't mean "right
>>>>    this *second* when the problem has been reported".
>>>>
>>>>    But if it's a regression with a known commit that caused it, I think
>>>>    the rule of thumb should generally be "within a week", preferably
>>>>    before the next rc.
>>>> """
>>>
>>
> 

