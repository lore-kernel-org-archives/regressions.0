Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404F02DECC2
	for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 10:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160517; cv=none; b=R47+iyGzX0FyPb18HUkThp7NEx6wXs9pNtcIUA+KSs9nTNxaTsl0ZjemmIAchDYILMlSxJbZIP2n80GwXB/kUJHQF48E/8XlfEr76G3j3+r23hCu7QsxG2pxF3p6uMwoTzTmRwvOBA97JMcUiY/r5zEYH6TcWg8VVfmHQxJ0bwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160517; c=relaxed/simple;
	bh=00LliydZFbWhN9/JMAzKVWb41FNb6WBNeqfGEFRG2kg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QWq1pEhk6mPv4wqWtbaogohcsFvZ7+zJuzQDRZJZl2/fCLyLmHVo9nGDT5jDsg4KwvNRSqO5yzDlbO6n8bgu+0IPIkpA4nv5GW6gtoMYpvL8bvr9sctffzqJKjp1DYVn0C6CN4xkvvJXiht0A42gHG9PEhxel1fMEmbcG5JDCko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SXZPV3Tv; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SXZPV3Tv"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7daaso1062317a12.1
        for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 03:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790160502; x=1790765302; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZdJeS2NWmvwKi1c64k6v6zLwI+NJ1nsn1DFESP4VK7w=;
        b=SXZPV3TvCvLDcm6dbJ7gkrimoEso3ZJSSiqj7bRXSA4kbqFZRP3bBq8zx0PgemBbqe
         QuoWN7Ba1W/lmtDKF7odHNNuITHhRoFTxPug2/utC4R7oNjO8Qm0So80WUFrbci24+c9
         TcjGqMV6kJqfEiPzNOLrPXDqR7TziSV3dk/whiwn9K2y/kj74789jwT42K0FcKOYDft5
         MDoE9lBwGOCBryE9CqGVPOY/yx7NbinT+50qVqkdWR/Gn/+m1+jXZUqOy89ypfMmMnjG
         yMz1yKiZG/zt+J6DIVJ7hNQY0ZsQnpHjZJyk8YsrYTLsjx9cojsrbwScyhWtH6RUztWB
         ecWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160502; x=1790765302;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZdJeS2NWmvwKi1c64k6v6zLwI+NJ1nsn1DFESP4VK7w=;
        b=KihdSWOPiDWwuIFpHaW/WokjMk5i4+9S5Vv3vbReRyxlZXfeOkS/Tk6EgWzHAL1HJ4
         fNoWKhyNdxj4eA3DLIuF5Klw0MilYRc27xXavzvHMaXljDbHzAX3FBAgznLC2pRwcaeh
         66C6fDAUU6Fs0xKfh96sZ3Vl2LJTO6VstE3pJ0BStCAYiwNxlq2KBGslhOA0cmuS+XMK
         k9QzQdBr9uKd5jM7Mb7JF5uW1NgZvlRRyc95VTX/AG8/UGhQ48+dGCl16enLE5VAUDMT
         BdDzVYrViCubE9kaEG4hoFGaze9UDIazoxZQqXsF9Ej/+hn8HujnCFckOKV5uyeRHY9N
         OdVg==
X-Forwarded-Encrypted: i=1; AKwUvBypiXctotAzz4b/gnUYtVmBV4rKKY3+tbdp15FHB/mCL6ewW9zVZLLItPuVDSSC43Ph6o+MG3KqVNXRXg==@lists.linux.dev
X-Gm-Message-State: AFuF++mmlbrdzXJ8zKVilIa9p+joK6CBQ698X2ZJYR/H2TXqdbxV8MC2
	Y5I9LJKn4GttqhKHiyfnG5AqNHdzl6VHoWlMg8Xe75cHn7W4ajFCkwx8C9VZ2j7plyg+coKPkVv
	PsiycO+U=
X-Gm-Gg: AYBFou1kf4sOya0GDTmlfCAvMnywgt1cLzbplBNrRfj/hFelfLh4Use7MeoeASaB5zU
	E4r4cqJsIqSg2UoZLMCRb+B5lPB6rGCR9E3w+NvxkDkuW4KzdOK8K8w0P31shgMdP/44aV2nQ+k
	y7L6zsuANpnGKw7NHLzYtnGlb6lcM6qHnp6RnPoHaeZsz1UctlQm3g/xvbuw3Z1Z0hroapqqHc9
	mPvbRz1a3O4FZ2djYpv77TF5k3u/qmStnhcrc6JahJtlvM0xQEYkutx7/4JwyBPByMpV1J2A3EU
	XUzVXsNy7Sn2HLot2IiuOINZ8YPB25XPnBgmBE7O49XyxPw7kr6FMAIElAeL0znVR1b4DZOBCz5
	M8Ozwph1L7jYdcX9BUlKz9Dqd5VH3Tge6RpTr+QithwQkJUilz19FDz4y/OmGyJ3EZ6O3FBFFZw
	YxOudWy17tLcLAQpV53MPlRIN6TALwLGWT2pc1yOIvzKyZin3aBK6BWXmASsLcWFta1V9ehvHgi
	wWSxN6jMW6zjdljvc4AUVibYghnvNtbQK4dFjjqEImd94ii37Yqbg==
X-Received: by 2002:a05:6402:52c5:b0:6a9:d0f0:69a0 with SMTP id 4fb4d7f45d1cf-6aab3b0a3e2mr1757911a12.11.1790160502330;
        Wed, 23 Sep 2026 03:48:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4140:d290:ef49:44ba? ([2a01:e0a:106d:1080:4140:d290:ef49:44ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868266822sm6706162f8f.5.2026.09.23.03.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:48:21 -0700 (PDT)
Message-ID: <f77e53d3-fb80-4832-aff7-4ab1244ee4a4@linaro.org>
Date: Wed, 23 Sep 2026 12:48:21 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [REGRESSION] Resolutions broken after "drm/msm: dsi: fix PLL init
 in bonded mode"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Mohit Dsor <mohit.dsor@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
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
In-Reply-To: <d7v4kwmc42k5ymgdt4mn2qc7dkrf5jj2l5afgyjqrm3pxterl4@guulk22xwlzs>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 7/8/26 15:31, Dmitry Baryshkov wrote:
> On Wed, Jul 08, 2026 at 09:26:04AM +0200, Thorsten Leemhuis wrote:
>> On 7/6/26 11:52, Mohit Dsor wrote:
>>> On Wed, Jun 03, 2026 at 03:11:34PM +0300, Dmitry Baryshkov wrote:
>>>> On Wed, Jun 03, 2026 at 11:56:15AM +0200, Thorsten Leemhuis wrote:
>>>>> On 5/4/26 22:09, Mohit Dsor wrote:
>>>>>> Sorry for the late reply. I am attaching clk_summary and reg_dump in
>>>>>> working and non working case. Lilliput is just a normal display working
>>>>>> with hdmi and has 720p as preferred mode. Yes, I was talking about RB3
>>>>>> Gen2 only.
>>>>>
>>>>> Neil, Dmitry, and Mohit: what's the status here? From the outside it
>>>>> looks like this regression is still unfixed with nothing happening for
>>>>> weeks now. Or has progress been made and I just missed it?
>>>>
>>>> Thanks as a reminder. Unfortunately, it takes some more time (and I've
>>>> been a bit overloaded lately). Worst case I will send a revert soon.
>>>>
>>> Just wanted to check if you had a chance to look into this issue and whether there's any update on the investigation from your side.
>> Hmm, no reply. Given that we are entering holiday season and are way
>> past what Linus expects in a situation like this[1] I'd say we should go
>> for a revert, unless some fix shows up really soon now.

Sorry I'm very late to the party, and checked again, reverting this breaks all dual-DSI setup
on SM8650, and probably other similar SoCs.

Here's a complete log of the breakage which appears on the Ayaneo PS2 running v7.3-rc3 with mainline panel driver: https://gitlab.postmarketos.org/-/snippets/65

I don't see why my fix did break this use case since it reverted the way the dual DSI PHYs
were initialized to actually allow the dual-DSI setup.

Thanks,
Neil

>>
>> Ciao, Thorsten
> 
> Please send a revert.
> 
>>
>> [1] To quote Linus statements from
>> https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
>>
>> """
>>  From 2026-01-22:
>>
>>   But a user complaining should basically result in an immediate fix -
>>   possibly a "revert and rethink".
>>
>> With a later clarification on 2026-01-28:
>>
>>   It's also worth noting that "immediate" obviously doesn't mean "right
>>   this *second* when the problem has been reported".
>>
>>   But if it's a regression with a known commit that caused it, I think
>>   the rule of thumb should generally be "within a week", preferably
>>   before the next rc.
>> """
> 

