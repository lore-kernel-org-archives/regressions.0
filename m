Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707B2156867
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 05:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713937781; cv=none; b=n1yHggpz/ki3Ojb5EYY9n9JKswGSu3BgEkjcyjZglcS8orhKhWgbdLbZCsiG0ZZqIzVPNbGIEkO1jz9Ln+N39mBc/jF95tNFyeBEGbYLI65HrkXs91bVnKwKFhqO15VOrZ5tpwOkjh3oVpcSKM76D91kj80/yWAzGwvC7lUEiDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713937781; c=relaxed/simple;
	bh=l5OkF8AxOS3Gjpu7NZAPcOi4s1zEXCpAB4RaachyQ80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I32jagaYJd6tL8hczJPXnJu5sW4fw82+IfVzk8+FMIq7DPxHfgMH5oH3qBxvj1aArliLIMexOKXLdabt1XwO86OgNK0p2/jN/7Zrdcz9cJoxEN+PuymOtX8Uwee4T9qh56bvwWGUDjEDpziozyWHWNxgt3OATu4JfsmzXNuDoj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=X/qAd/ot; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="X/qAd/ot"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ee0642f718so432270b3a.0
        for <regressions@lists.linux.dev>; Tue, 23 Apr 2024 22:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1713937779; x=1714542579; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JySSannFKBpwWTIuXl9VxiTFqW9a99otiT1KAh1oTHQ=;
        b=X/qAd/othE4YqMXidhANRKVtxTU3HeSiSVo9FW/EtRLGBWY11tKRsPNhhZnyvdvmEa
         vszK3Z6Zzl2e7+9DjJpt9ZOPpjGHEc+uy0rLgZ5tLzuR7KOqiMDO2koxkmyqHKDsAZWt
         MVAbWRYRz3ZsNqcCnP4SqPA7OeuGoD36TgInw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713937779; x=1714542579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JySSannFKBpwWTIuXl9VxiTFqW9a99otiT1KAh1oTHQ=;
        b=TMXiiX435FcxaOGOmB9Yy5W2Peiy+6rzXd7tA9Up6m7pIWIoWfkczGHk2U066GjTx2
         fnv0t1BoivLCZKzDwJx3j3z/2iy/4LI8bRGckt/UPnPSST3Pe4xjK+2/tvnUQB0sx1I4
         cYFI7JUSw33mCBoLa8ILFyrSBT8Yxcm0Wb6IB79TkuXl/c4jMQ691fpi3r4zilUTAk9D
         iEVwYmAi+P9/VVzGb00dC1tXd4MW1P5KiXbrGcs+vdZDueqikxSuL7EQgi7lxQMeztCm
         ta5CyPgTzxdenFTgKYnf8tjGfB6celusu7uK68NP9PHzDsT5h43UK3aFM+jU1/QVzlkn
         1yRA==
X-Forwarded-Encrypted: i=1; AJvYcCVGbduo9WXnNmzJ2iv+nl6zNSaY7Aroyl4MqheZHgDoZuSPapI9MWycQOQp2npnLgKvgTj7C6JJxvpUUCjJvdx3TAZ8ZzpaJVo9AJg=
X-Gm-Message-State: AOJu0YxgkWW9oGKULYnYqokeUBt+LMtfSIOSnqb110Hm/Wvg1MW42exA
	EGgmrNcnkCwISU5qw43CkjPfTFbLpMfUj1/kKVWAQ7D1CtcPoo2vZS4iu6Ywnw==
X-Google-Smtp-Source: AGHT+IG7J5EB+OS4bWsTGY9svXpYszeCkk2/xau38sXpHgJgzIf77MOWp4CGayS20E3eDvHRIaZDuQ==
X-Received: by 2002:a05:6a21:3282:b0:1a3:bd97:4cab with SMTP id yt2-20020a056a21328200b001a3bd974cabmr6867656pzb.6.1713937778549;
        Tue, 23 Apr 2024 22:49:38 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id x1-20020a63b201000000b005e838b99c96sm10342348pge.80.2024.04.23.22.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 22:49:38 -0700 (PDT)
Message-ID: <c9bf22a3-2549-4cf1-898e-8a9adcd2f0f6@penguintechs.org>
Date: Tue, 23 Apr 2024 22:49:36 -0700
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
 <c1fc9c28-25df-4d41-9ae6-c5d079ea805d@penguintechs.org>
 <0db77c30-5be2-41b5-adf0-fb4436b9107b@quicinc.com>
From: Wren Turkal <wt@penguintechs.org>
In-Reply-To: <0db77c30-5be2-41b5-adf0-fb4436b9107b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/23/24 10:46 PM, quic_zijuhu wrote:
> On 4/24/2024 1:37 PM, Wren Turkal wrote:
>> On 4/23/24 10:02 PM, quic_zijuhu wrote:
>>> On 4/24/2024 12:30 PM, Krzysztof Kozlowski wrote:
>>>> On 24/04/2024 06:26, Zijun Hu wrote:
>>>>> Commit 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_NULL()
>>>>> with gpiod_get_optional()") will cause below serious regression issue:
>>>>>
>>>>> BT can't be enabled any more after below steps:
>>>>> cold boot -> enable BT -> disable BT -> BT enable failure
>>>>> if property enable-gpios is not configured within DT|ACPI for QCA6390.
>>>>>
>>>>> The commit wrongly changes flag @power_ctrl_enabled set logic for this
>>>>> case as shown by its below code applet and causes this serious issue.
>>>>> qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
>>>>>                                                  GPIOD_OUT_LOW);
>>>>> - if (IS_ERR_OR_NULL(qcadev->bt_en)) {
>>>>> + if (IS_ERR(qcadev->bt_en)) {
>>>>>         dev_warn(&serdev->dev, "failed to acquire enable gpio\n");
>>>>>      power_ctrl_enabled = false;
>>>>>     }
>>>>>
>>>>> Fixed by reverting the mentioned commit for QCA6390.
>>>>>
>>>>> Fixes: 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_NULL()
>>>>> with gpiod_get_optional()")
>>>>> Cc: stable@vge.kernel.org
>>>>> Reported-by: Wren Turkal <wt@penguintechs.org>
>>>>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218726
>>>>> Link:
>>>>> https://lore.kernel.org/linux-bluetooth/ea20bb9b-6b60-47fc-ae42-5eed918ad7b4@quicinc.com/T/#m73d6a71d2f454bb03588c66f3ef7912274d37c6f
>>>>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
>>>>> Tested-by: Wren Turkal <wt@penguintechs.org>
>>>>> ---
>>>>> Changes:
>>>>> V6 -> V7: Add stable tag
>>>>
>>>> Stop sending multiple pathchsets per day. I already asked you to first
>>>> finish discussion and then send new version. You again start sending
>>>> something while previous discussion is going.
>>>> you concern is wrong and i am sure it don't block me sending new patch
>>> sets to solve other issue. so i send this v7.
>>>
>>> i have give reply for Bartosz' patch.
>>>
>>> i hop you as DTS expert to notice my concern about DTS in the reply.
>>
>> Are you saying here (1) that you identified a problem in the DTs that
>> you hope Krzysztof notices or (2) that you want Krzysztof to notice how
>> your description of way that DT declares the gpio as required affects
>> your proposed change. As a native American English speaker, I am finding
>> your text hard to follow.
>>
> 1) is my purpose. i have given my concern about DTS for Bartosz' patch
> and hope DTS expert notice the concern.
> 
> my change don't have any such concern about DTS usage. that is why i
> changed my fix from original reverting the whole wrong commit to now
> focusing on QCA6390.

Let me try to parse this. If #1 is the correct interpretation, does that 
mean that the DTs are wrong and need to be changed? Do you expect K to 
do that since he's the "DTS expert"?

>> I think you are saying #2.
>>
>> I just want to make sure I am following the discussion here.
>>
>> wt
> 

-- 
You're more amazing than you think!
