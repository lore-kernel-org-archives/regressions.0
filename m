Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B4F1448E4
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 04:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713931590; cv=none; b=lfcfMo69tsNwpxfwaQo1BLHhsqvmJjXfWKv814eAuZEejq6GjcqCFDWoQ8nsB5E6FO6lolWGFhtjBHkBZkJrPWNA3Br4rYaMuePq73Bbp9d3jMb88QbwyB1lH0hxy6VMhUm+xkVPAYrMnh+4X6fUcY8BJO9VUwrw7Edcc1y60HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713931590; c=relaxed/simple;
	bh=PuPXjwkBwAE+05mxqeu9X2cnKyYSIQjvqU8GspVwiCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGOTSy90Xdp0C9xxH60z374delywxsMgs6c5xhy77pmLOSD+y+Lv/5xoZEgVy5+2vTCP+tlDsPfUszXR2I4YUbxK4fU3FhY8Kdzxnwoiyo604OXtqHkL+eP1q8ht/ODFXmVUQiNHr+5SDBpGpsBOOl1yWTK94ydfBHwDxBzsDAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GkbuAHWt; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GkbuAHWt"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a557044f2ddso710078666b.2
        for <regressions@lists.linux.dev>; Tue, 23 Apr 2024 21:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713931587; x=1714536387; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qtmBEq8KlrPnZUrc9wyQPtPGNGRjXzpVIpe3uN+cYwg=;
        b=GkbuAHWtHhw43/d4mIRHmsHFwhYzpnKUM6cdxCIloBWC7phIpyT4ORIGFvwtuJdT0+
         9mDZcGpzoFtsnC8tV3ql4BcKjiAo2ldBzG5qqe8EaVQGxpVWb4kry9H0ExkZ5YEIFie4
         HRG3yjMZchLD7ZzHNAW52ErVu4zl0R41yPcPVOxyS/KRMMS9oWhoIc34mCY1afFhLmS4
         VFUx77yFBU22SCNhQ6JkhkNCz5ZcCHRuVkjWDXJk6kMHw1Tg2LUtgswyMHechdrjMoze
         3+/8t2KfFU5erd9Ijpe8kvH6rdG3bHdOGrSCuTImlf3KHq29go0JtB20gLbJKG8fJRey
         QWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713931587; x=1714536387;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtmBEq8KlrPnZUrc9wyQPtPGNGRjXzpVIpe3uN+cYwg=;
        b=wMyyAzU5FMVknp3FW0SWwQ2JEktAeJS5g+ggCjyTtMgueS74OOr3FNoKEx8SdNbxLh
         0/G0mcWg+A+iIFf/zSgALnvMrcmft/+0qeGgNh86Gvffd01PYczBpewv/wB+2tJV+J+6
         5Dbv6duxDwLm1mDppL6vLJ2qaZ9CKjM0CocPV54Cf7FzEN46xEcKMUSkQAZ33keJv9tU
         L3f0mBUDDR6Tt36qGNbHtpB2qKVdZ29IMYkjmwT4vqb75/ShpDFSUso9ifC9v+U+pW8m
         AyvqamkE7r/uij/NWvW/qZLr7w9hm3gWc3BHE3NBilUNv6L1v1bFoP5AX+6bJWmQix0P
         CyhA==
X-Forwarded-Encrypted: i=1; AJvYcCWZWxtgIlThJxEH/dvBTizMsPISLDh8z68Br6gnUIwdgNIuRgyn+m+EvFm9mkWNSt7+QlFOoBqSCK34uGJGcfALx3A5ZBpzb4S3934=
X-Gm-Message-State: AOJu0YyLWadjUme8gHxTzYvfGP22LReJn5uUoYmb5o0h96qmH181kU3H
	ItCDrU+XznT0zcnozd1w8Bwh0CmqI1o6tVomZyRuqEJHW6D8CuzMBmMQoz43CZ0=
X-Google-Smtp-Source: AGHT+IE55h87Dvj9XpIyvvj8R06p1P5iw3w4j0SIzDqsDUxFU6Rb9zbROlqQOVLni0xVt11AK9VPFw==
X-Received: by 2002:a17:906:34cd:b0:a52:5b71:d91f with SMTP id h13-20020a17090634cd00b00a525b71d91fmr677367ejb.19.1713931587284;
        Tue, 23 Apr 2024 21:06:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o20-20020a1709064f9400b00a51e9b299b9sm7751153eju.55.2024.04.23.21.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 21:06:26 -0700 (PDT)
Message-ID: <349b27a5-d2d3-46f1-b002-44f81e0cedef@linaro.org>
Date: Wed, 24 Apr 2024 06:06:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] Bluetooth: qca: Fix BT enable failure for QCA6390
To: Zijun Hu <quic_zijuhu@quicinc.com>, luiz.dentz@gmail.com,
 luiz.von.dentz@intel.com, marcel@holtmann.org
Cc: linux-bluetooth@vger.kernel.org, bartosz.golaszewski@linaro.org,
 wt@penguintechs.org, regressions@lists.linux.dev, kernel@quicinc.com
References: <1713919602-5812-1-git-send-email-quic_zijuhu@quicinc.com>
 <1713919602-5812-2-git-send-email-quic_zijuhu@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1713919602-5812-2-git-send-email-quic_zijuhu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2024 02:46, Zijun Hu wrote:
> Commit 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_NULL()
> with gpiod_get_optional()") will cause below serious regression issue:
> 
> BT can't be enabled any more after below steps:
> cold boot -> enable BT -> disable BT -> BT enable failure
> if property enable-gpios is not configured within DT|ACPI for QCA6390.
> 
> The commit wrongly changes flag @power_ctrl_enabled set logic for this
> case as shown by its below code applet and causes this serious issue.
> qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
>                                                GPIOD_OUT_LOW);
> - if (IS_ERR_OR_NULL(qcadev->bt_en)) {
> + if (IS_ERR(qcadev->bt_en)) {
>   	dev_warn(&serdev->dev, "failed to acquire enable gpio\n");
> 	power_ctrl_enabled = false;
>   }
> 
> Fixed by reverting the mentioned commit for QCA6390.
> 
> Fixes: 56d074d26c58 ("Bluetooth: hci_qca: don't use IS_ERR_OR_NULL() with gpiod_get_optional()")
> Reported-by: Wren Turkal <wt@penguintechs.org>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218726
> Link: https://lore.kernel.org/linux-bluetooth/ea20bb9b-6b60-47fc-ae42-5eed918ad7b4@quicinc.com/T/#m73d6a71d2f454bb03588c66f3ef7912274d37c6f
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> Tested-by: Wren Turkal <wt@penguintechs.org>

No, Bartosz' patch should go.

Best regards,
Krzysztof

