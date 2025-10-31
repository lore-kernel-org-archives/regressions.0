Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AC934D3A4
	for <regressions@lists.linux.dev>; Fri, 31 Oct 2025 08:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761900664; cv=none; b=NW3HwfVbR+H/Ykbf/PqllujJ9mAXuOt8VDE9frYhO44KXVGlEg9M3NhtyaohV53QahvheUndFhyNrurYRPJEcCjSntCxlKcXomCuqrYQrnS18I0ZpsUTDhRBKdYyCIMCMAsXKBP4W34Uoq8Q3TjN0IxaF/DYsp4W+DUgTbHuHuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761900664; c=relaxed/simple;
	bh=ocbxgDBr/NQ05/9FVwt9PJ96thby+UU01iRLKbfPELo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nWGXtjIcgZQpjf0RiLlhfaTUGyH6MXxZors93KJ9K9j9tdMTxCgxfmOhC99bVqI7l5wOpzPu+2Xl3WCPqFSAOyTnO34NDXfe2jCNLuePSXSYj9rEIISwzoFRjtnDPOr/adEMuEjm1a4qIV/aKr+pz4uf03tI5wtyFJF51iRtnGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iafEB3Y1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iafEB3Y1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso26026735e9.1
        for <regressions@lists.linux.dev>; Fri, 31 Oct 2025 01:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761900661; x=1762505461; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdthYQx3fPupz9VTuX9fs9tD+q8rhp/J+8kdTaSyYGI=;
        b=iafEB3Y18rAtr+MAdX01CoDc0sT1oCT9SSvOeJzXS7lfCoQJ4RrhheeeaYm070pZjF
         Hkuo5wli3z9Km/+7VBqrk75/uLnZZtKjRFXYVvFfeX6D32tYgxtfsY7AXuEXbRHVpK3N
         /gToSwvnKP+Sq8VmR6zEQ+HRJ4wIHabLYVXfEtKF6DBeMqZrcyavy9qQTxDlNCHvQLob
         nb8XBu13Rk79SJ8f38Doj5Jho8QHg6jUbUYHihCSOu3hIKsbxNnc/F3SS1ShtoMQa5HP
         RQQxjYuzGR1f6ocf4wPtS9gwmk4K+xKGOmCC0nXy+kXVXkbT7/54nmxdL/RD46tMc0Q1
         aBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761900661; x=1762505461;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VdthYQx3fPupz9VTuX9fs9tD+q8rhp/J+8kdTaSyYGI=;
        b=oth/yI1qW94dXirh3jVRbFHrO+LRfiM89MVqArSh0zZdtsRzWQNJKlaFTbyVD+9bt2
         kjLDSt56MQtV0SC+Yue7KpigUT1c5KoPRM7lxh5QNr7DlQ2st+kMsd/wDZObYlDkJPge
         YuAJkDzb1yCKrwg1k0UzZf41rmZm4Zfh3x3iVcS6SNmWEowK+ZMsSexpt4K3zVKdsvgC
         4MMiYhNqrSZJePDvkqruCvzo75+YmCu0o8cyQtUBpL3r7nrVWuICvbFa5UAfrbwMIHYo
         jxu/6PfORPSXPBU9+73TiU3zudNas1mTR9cMC8MDO7nTVfXQYjEv6kjLRI6YESgwKtFK
         J+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXgYfy/Mq8oTfcDsA1ZldGGupk7JLq6PDC30Xd8Z1JEMNDYltBcIlh7IWOi4v7osP9M7kiZlzDsPlSeZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvjE/G4d+Rs6XEsi2cs8ObqAVrw8EdXTkNO+4H0HiLjszr9hji
	efJOhyr2SE5YDCbqigk8thuJr++Dhrelc3SbzANm591LUR4rHiG3AFvlzEnNWkCbG3Q=
X-Gm-Gg: ASbGncurB84QI5CUWQ42RAr/HS/D84vx/g07vAEL40U70z39MSO0C5tH+VsPdHb4ZpO
	9bOCC25D1jIsvTMa/BdZjW8MYTnL8ZFB6wI/qT4kVkAdrURy3x9P4JYEOIdoyYYbk1dwhO4GfpH
	oP9cSZ9wOmQENfeS5HBiVU84XTBpGalyF3LX/fJLn1KvOsFeCe1QBkzFQpdun+LlDa2WapcPe0J
	lJ+OkiztJycYB4pk3W9dX+tIE6e0hC2lEKsp7QLzlVYlc/3wtxeCmy0IjmWEa5Th7vJSRxAji55
	IMMnWbPpWPJ7H6PXSZ5K5SsJm5KJvwTbk6tfH/6R51IC4GnTb+2zCPGWFSSJ6Qy6QjK3E5G72xy
	F1k5oiMiZ6m1eE+mF5ydxslr7ZSuV+p9+kl87vUZXq1mTvMSYQc2uQKONVN/MJjOpO2ngpIcoYP
	yV+fuXMJnSMXEBVH3daTd9nw125Pi9smce5i+Rd+L0k8TZRgLu0l7YZSIDjqnjGp0=
X-Google-Smtp-Source: AGHT+IHgzS/nF5S0MzMHbXjLp8vWzcH8CRZAK3FVflgVJ4Dnpp781CewdMABTPZNC2jy/zYIIniiPg==
X-Received: by 2002:a05:600c:524f:b0:471:c72:c7f8 with SMTP id 5b1f17b1804b1-477308b6117mr24385315e9.21.1761900660929;
        Fri, 31 Oct 2025 01:51:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:d967:2bcf:d2d0:b324? ([2a01:e0a:cad:2140:d967:2bcf:d2d0:b324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477289adc18sm86749505e9.6.2025.10.31.01.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:51:00 -0700 (PDT)
Message-ID: <59baecc0-bc28-4411-bf83-37ff9e7dd193@linaro.org>
Date: Fri, 31 Oct 2025 09:50:59 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: PCIe probe failure on AmLogic A311D after 6.18-rc1
To: Linnaea Lavia <linnaea-von-lavia@live.com>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 regressions@lists.linux.dev, Yue Wang <yue.wang@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20251029171542.GA1566240@bhelgaas>
 <DM4PR05MB10270506AAC1FCE53C4915CC2C7F8A@DM4PR05MB10270.namprd05.prod.outlook.com>
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
In-Reply-To: <DM4PR05MB10270506AAC1FCE53C4915CC2C7F8A@DM4PR05MB10270.namprd05.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/31/25 06:34, Linnaea Lavia wrote:
> On 10/30/2025 1:15 AM, Bjorn Helgaas wrote:
>> On Wed, Oct 29, 2025 at 06:50:46PM +0800, Linnaea Lavia wrote:
>>> On 10/29/2025 6:16 AM, Bjorn Helgaas wrote:
>>
>>>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>>>> index 214ed060ca1b..9cd12924b5cb 100644
>>>> --- a/drivers/pci/quirks.c
>>>> +++ b/drivers/pci/quirks.c
>>>> @@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
>>>>     * disable both L0s and L1 for now to be safe.
>>>>     */
>>>>    DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
>>>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SYNOPSYS, 0xabcd, quirk_disable_aspm_l0s_l1);
>>>>    /*
>>>>     * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
>>>
>>> I have applied the patch on 6.18-rc3 but it's still trying to enable ASPM for some reasons.
>>
>> Sorry, my fault, I should have made that fixup run earlier, so the
>> patch should be this instead:
>>
>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>> index 214ed060ca1b..4fc04015ca0c 100644
>> --- a/drivers/pci/quirks.c
>> +++ b/drivers/pci/quirks.c
>> @@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
>>    * disable both L0s and L1 for now to be safe.
>>    */
>>   DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
>> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_SYNOPSYS, 0xabcd, quirk_disable_aspm_l0s_l1);
> 
> L1 still got enabled

<snip>

> 
> The card works just fine. I'm thinking the ASPM issue is probably from the glue driver reporting the link to be down when it's really just in low power state.

You're probbaly right, the meson_pcie_link_up() not only checks the LTSSM but also the speed, which is probably wrong.

Can you try removing the test for speed ?

-                 if (smlh_up && rdlh_up && ltssm_up && speed_okay)
+                 if (smlh_up && rdlh_up && ltssm_up)

The other drivers just checks the link, and some only the smlh_up && rdlh_up. So you can also probably drop ltssm_up aswell.

Neil


