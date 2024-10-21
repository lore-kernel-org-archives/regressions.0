Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71302126BE1
	for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 17:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729530031; cv=none; b=qIkvjSZuGr9D5XKVmY/s2tozYX50siwRomL66qiFImV2b1DwMW82JnbncWUzhrxGPVfxtVP1Skj9s2+8s+p1C7FF+qrS1yUJCVpgzTmaOkrKpUrT+jp9VyKdBMjGfbk6sqkHOYxMn2rnML01GMg94sITJuzxxDBIZH72FCfBq44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729530031; c=relaxed/simple;
	bh=mnRFS/mj+G35ASMRqM8Sj6IPy8kOKX4bsXtvWDlciDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZBGBwr3VQ56lmBWx36QWs6t0lQglYj2TckVnE4Y1MxokBTrrpFYZoeYh77YMIxCjRzWwowRwkSBJaQqasdapVJwxUk5alL1Skpr891iULUfQ6aZzq75PlpbYWPAuB0rzqnF+4W6nmhl6oJVZU8fEYeMePTBlW1b3fDQNpNnnYPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=pcZvfwyD; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="pcZvfwyD"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-83abdaf8a26so115094739f.1
        for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 10:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1729530028; x=1730134828; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynAME6NN09JzWzcI2kzNPurKWJPhVAQ6z8aud0/0Fpg=;
        b=pcZvfwyDS6SNOD+9L4NX4g1U9bhJwF4pvg8YcJsSR0ibjZGMm7D7ZywAPOHh/yIATP
         0hK1JkJYAPYIiT5OrdqpMAbfClF4cBgQaYZRgQvKoEUWrvQLfw7Wyx+DLIkYaE/KCQs0
         4XM+/+wVFh3XMMdtf+Gxcu6zXYVhY2WtKsIfO56VED7QOXu3eNY9Ug6K4AWEPCFFVzzG
         up46DIEm/+tA7r4H8gU0xwL4BKhNSb4encGaNw+wHCI23Flw8Yam8jUJLbrG3PdKnVpw
         pLbSiUWDDY+PYS4BjD6W0qhe5HUZuVho/QBVFocEWhUUFxzfvvwUjvn79XvtxBYCjE0W
         yYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729530028; x=1730134828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ynAME6NN09JzWzcI2kzNPurKWJPhVAQ6z8aud0/0Fpg=;
        b=sPXTV5NP2pOmvUDa0zHMDxi3ytdYSjFujgjznZNAcouG5yxgmRJ27JsF7qQEwAeaWY
         yobdRcNiaZ+HC57TIDPmuahLtXGMYbVsKOJgtJodRFaLWACJQWnnjQX6SHYeEo0OwEeT
         7UAaSsgwAJhRMoIDC9Oon3r0ee3uHwpsNbxDvT+oNsRk1Fi0pQGt+9sKyv9JVWL1SHGj
         viWvUpGNYruckR6/sOF7PtrdIKKEa/WYBZktyoKp2N8koFPKCVa1D4inSrOkS99RENK5
         ECDAkdNW5E+qrhbqHkA3zxwqAYpWHUoUH5HhTaKGhg+CNo//Sa+HpjKblwhtYA+XIlrg
         KSLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUkxCyViEiCppc/OwVQTkqacFaXwbOXJWt250p61vAvVlFUCsPm9hRkk5U440C1aU8QN03x32fMZHs1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzV6McR97knv4Ldqr4eDQgUriOAoHvgg/3grULtJbfHFNNLKytT
	iD1SRpVT+VhW8cFg/qLu/PnGy/Sy3nmnBxDggfLLMOTFRy1ZgCneM6+zM7xTWUE=
X-Google-Smtp-Source: AGHT+IGVp9T6pGjNOnVfMsOCjRFetBtb2uqMCM0VJgtnNP4wYNtnbYheNWRYc351ZZ93jN9AJRwdTw==
X-Received: by 2002:a05:6602:1584:b0:83a:b43b:da89 with SMTP id ca18e2360f4ac-83aba63ff0cmr1327422939f.10.1729530028275;
        Mon, 21 Oct 2024 10:00:28 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc2a609491sm1098928173.113.2024.10.21.10.00.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 10:00:27 -0700 (PDT)
Message-ID: <daa98312-cc66-4c2f-8e64-01358ee99305@kernel.dk>
Date: Mon, 21 Oct 2024 11:00:26 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD zen microcode updates breaks boot
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <320024ab-63af-45eb-a3ae-5486cb2015c0@kernel.dk>
 <20241018175606.GJZxKhNmW9nCLwNS6Z@fat_crate.local>
 <016ecb00-2331-472c-88e4-66b1dbecfc99@kernel.dk>
 <1bb5dd7f-15b5-4d9d-97ef-75ebdc24e7d9@kernel.dk>
 <20241019093748.GAZxN97LS_dJ3DNrpd@fat_crate.local>
 <436b4fc7-6369-40d9-8e88-556cbf5a5687@kernel.dk>
 <20241019232138.GDZxQ_AtkqA9iAR2td@fat_crate.local>
 <b2fd70bb-9414-49e0-bdb8-5c538f247dea@kernel.dk>
 <20241020121819.GAZxT1CyR_5vLLZ5e6@fat_crate.local>
 <df217737-6e2c-41fe-b558-3e2ab6dc0d9e@kernel.dk>
 <20241021073140.GAZxYDXCk02lSrG3-T@fat_crate.local>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241021073140.GAZxYDXCk02lSrG3-T@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/24 1:31 AM, Borislav Petkov wrote:
> On Sun, Oct 20, 2024 at 06:47:25PM -0600, Jens Axboe wrote:
>> Works, outside of waiting 3 min for the serial console spewage from the
>> patch! But it boots and it's happy after that. Attached here gzip'ed as
>> it's 1.3M otherwise.
> 
> Thanks for testing.
> 
> Lemme write proper patches, run them everywhere here and give them to you for
> one final testing.

Sounds good, I'll give them a spin once posted.

>> root@r7625 ~# echo 1 > /sys/devices/system/cpu/microcode/reload
>> warning: An error occurred while redirecting file '/sys/devices/system/cpu/microcode/reload'
>> open: Permission denied
>>
>> and no output in dmesg.
> 
> Right, you need
> 
> CONFIG_MICROCODE_LATE_LOADING=y
> 
> for that.

Ah gotcha, makes sense.

-- 
Jens Axboe

