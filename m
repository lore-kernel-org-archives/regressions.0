Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90E0338925
	for <regressions@lists.linux.dev>; Wed, 17 Dec 2025 10:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965678; cv=none; b=EnxcgAkmYwNXMKYwKDsx32guNyI2/uGYAXEeWJUsuoqV3BMkYQNTInKLn470zQdiKPMmalSumUJ9iLYeTSFVSpvKU2jLNxpUvmidgJMQptF0GDLxEQu5mnA1ZPyG3rLDrqMB/rmLlJrxYFpQbprH46rr4ycn+ivZA1+anj/gJME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965678; c=relaxed/simple;
	bh=TX9PKbwuo+X5c/pt2dQLV/tFLg61cIkY/mvBpoTbQQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPriUfJweZ7oAPrHmExy28apaddKP1iPCfXyIn9/4jEDZBltSedqp6SPQ/4CMktG4ygOSTp0N4Lv3gcCZaPVW1v/9XgSDjNZFLzlBWd+5VF06aavKwNGTKvmP1G4ZfXuUMOGlQrdahQFpDcb7KjL5/LpFyC90aJb8NCfOEfwT+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTAWJBpD; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTAWJBpD"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29f1bc40b35so83254975ad.2
        for <regressions@lists.linux.dev>; Wed, 17 Dec 2025 02:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765965674; x=1766570474; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BnrbYc142rU4PJ4+bdzEv+GG1owi+xgePcJ4V/hmpW4=;
        b=JTAWJBpD+GdDNMpodqHCiAZzUeOnvwT8JeJdvLR3zSOctL9ATEUbqoXtISuCKyX43d
         MeC4zA+TguS0wUBDWMYzPAVMo74vizWO/mnX+ek1FjRv7BHs8ZUCH6uTzEVRmb05ge67
         WDj0kyX0Bf6UxVmyU8urdacjm2B/c8xO12sbGkW/ZQrtKccTTnDUqMxpo5M2NFn3KkBf
         MHHr5BP2W+y3vw5nuQQgMqSUPFUZ2X5NDuexjK81/rGBR4Wj5Jbx1hXU1ZLR4U3P57jj
         YTBZ4ooXAi+PSz2P5kQSxeRwa2T83ZjdGZ02/1kf8fg0ixSQ1SXl/HNipH2VFoybupP1
         Dspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965674; x=1766570474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnrbYc142rU4PJ4+bdzEv+GG1owi+xgePcJ4V/hmpW4=;
        b=LYm4MgztuhWXMStkJlye5pHJle2TvpeIU4xWO42GMyww85NaKv8CvFln4o+r9eC23Q
         5CdXzO1+6i78wbHiRJ6gfzRD3zTFQ9ynzHco0ZVxuN/C7n7zp3rvNJXi03n/0cB8DSYi
         t7KV16mZGMIjR/Zupj0UEm5vwKFgrTT0S2GGFiPUNzK3c7yp7TmvlhwhUUxHtsQ4xObn
         3aoKJn7EfTBulDT4ALvmSO6oSVG5ZvcZpiTPX9bWEGg4qYvJhOSMLizHRorFpnTAGbIn
         AnWFtHd1YkSzcfWEqkAZdIDHAhZStnClIBjK+ISxUkrPZd+JK9poKkvI/1uC9xxGjPlf
         0BBw==
X-Forwarded-Encrypted: i=1; AJvYcCWm2A70+DnFE9P+wznVUCh0vffk+n3z41pYw2+C+DLtp7aK0mYEsdTjYXYx6fYy3hZ2zAVpcLw8Oskkcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxG4kqWS22tA4fNNByh8g7mGgMkVZWAuYrZIHNCuAeTNFfuGocu
	LbxXCAMvsbxBixS9InzcS5sF2WLv11+BjHSr6nUjB0f8Jfpnch5orpLy
X-Gm-Gg: AY/fxX7q5iS5CSKoRntKkqW6PxvVD5YQBaeG8PpMU+Y5i6GErMBWW27SfqD1HyWOErq
	9Xww3gCtSVbfpFNd0LhN6RKLDYUPznLjRhZdb7Un/FGmJnAGUEGClfpMt/HtzvpXFV1eNUIwOdC
	n3I9uKpQBkvhrmtvSSB6QDj2cMS3ZUJqac5NlcPf0IXt5rAuRGCSR6uWV34N7f1Elvwthqa95Nk
	bXEXcfz5kTpPwxKSS6D9AUitdYdfqgRIExMUPjuxh7pQiyjMT1E/3+lRYU15OytA01JngIzCUeZ
	wVjDWVvxYaSEvOJH093UqLYWiC8LajHrJfSLcMdTszFUWtiuebnedale3DhH+7fq29rpzd7JWac
	oA5LjWJexuw6ml7VRk26jho40+A0+iaf7VJXIiYWirXL7iwOLRj20sc1ldio72vgOxfSvZJH5La
	ETqqhSCCa9OFL6AGLaSLzCikxu6A5PsjHzNpBMZrgXchyJajBnZ1BPocvuyRo0DzQBaA==
X-Google-Smtp-Source: AGHT+IHQwrAaQaZ6XAsRxYUc34aZYpqc/das4JLNgCdGwfbkhJl9an6tRUMXyRBfVTtZ0DT+E4HinA==
X-Received: by 2002:a05:7022:1715:b0:11d:f81b:b212 with SMTP id a92af1059eb24-11f34bc819amr10015101c88.17.1765965673857;
        Wed, 17 Dec 2025 02:01:13 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb28dsm61367679c88.2.2025.12.17.02.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:01:13 -0800 (PST)
Message-ID: <f14fec30-204a-48ed-b714-f420ea4594aa@gmail.com>
Date: Wed, 17 Dec 2025 02:01:12 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 stable@vger.kernel.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Danilo Krummrich <dakr@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Benno Lossin <lossin@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
 <CANiq72kYjNrvyjVs0FOFvrzUf7QYe8i+NpBS6bMEzX8uJbwB+w@mail.gmail.com>
 <66cba90e-c9b1-4356-a021-e8beeff0b88d@gmail.com>
 <20251215111941.6c7817cf.gary@garyguo.net>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20251215111941.6c7817cf.gary@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/15/25 03:19, Gary Guo wrote:
> On Sat, 13 Dec 2025 23:34:31 -0800
> Rudraksha Gupta <guptarud@gmail.com> wrote:
>
>> On 12/13/25 22:06, Miguel Ojeda wrote:
>>> On Sun, Dec 14, 2025 at 12:54 AM Rudraksha Gupta <guptarud@gmail.com> wrote:
>>>> - The kernel boots and outputs via UART when I build the kernel with the
>>>> following:
>>>>
>>>> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
>>>>
>>>> - The kernel doesn't boot and there is no output via UART when I build
>>>> the kernel with the following:
>>>>
>>>> make LLVM=1 ARCH="$arm"
>>>>
>>>> The only difference being: CC="${CC:-gcc}". Is this expected?
>>> It depends on what that resolves to, i.e. your environment etc., i.e.
>>> that is resolved before Kbuild is called.
>> Sorry about that, I should've specified in the original email. The CC
>> resolves to armv7-alpine-linux-musleabihf-gcc.
>>
>> When both LLVM=1 and the CC=gcc are used, I can insmod the sample rust
>> modules just fine. However, if I only use LLVM=1, my phone doesn't
>> output anything over UART, and I assume that it fails to boot.
>> Interestingly enough, if I just specify LLVM=1 (with no CC=gcc), and
>> remove the rust related configs from the pmos.config fragment, then my
>> phone boots and I can see logs over UART.
> Which drivers have you enabled that use Rust? Just having core Rust
> infrastructure enabled shouldn't cause issues on its own, apart from
> slightly bigger kernel image.

Just these ones:

https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/pmos.config#L264


I'm starting to think this might be an clang issue. Ran this on qemu-arm 
and encountering similar issues:

https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635#note_521740

> If just enabling Rust but none of Rust drivers cause issue, I would start
> looking at
>
> 1) if there're any symbols somehow being overwritten by the Rust object
> files.

If I suspect it to be a clang issue now, is this still the best way to 
go about looking into the problem? This is a little bit out of my 
domain, but happy to learn.


> 2) if the size of kernel is pushed above a certain threshold that your
> bootloader/firmware is unhappy.

I believe lk2nd (fastboot bootloader) would complain if this were the 
case. I'm currently flashing lk2nd into the boot partition (to override 
the proprietary bootloader's defaults) and then flashing posmarketOS 
kernel and rootfs in data and system partitions.


>
> Best,
> Gary
