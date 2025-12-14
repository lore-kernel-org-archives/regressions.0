Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1CE27E07E
	for <regressions@lists.linux.dev>; Sun, 14 Dec 2025 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765697675; cv=none; b=IVzzFkAxfR1IMhRyGPMvA6ergdUA9Lb0t+YGBTKchd9lzYSHvdLnfNQVT7lvJy8pBvq1XdLejpoBW4Iaue9ROEfvJ17ZZ7Mbn2xVl5TLo5soLSXClXgBOGsYcFO5vSfkBTaz31Up3/SqGnd5w/pg0sd6LEc1dNI92Y1zQWbnUO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765697675; c=relaxed/simple;
	bh=FVxIlAKuTuRT11DwsMiqIbBYGhbAiF+XA+LYL1zo2gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q4JJoOJ91F99r2i80W3/N9yluT0yMkd8rQFML3PQXoDnAfjrQyBrMbNCYiGYn9zLwxOShSeEdsXVwh8kap+lfoGcgq+Vnu/O5HdekxbaxT398zGqq7P4wCqHBvK4qFL6sC14CEiNjTaQdKgN1Rx1c476nShhgYBNnB26j3tMAOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJlexOnU; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJlexOnU"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so1735966a12.0
        for <regressions@lists.linux.dev>; Sat, 13 Dec 2025 23:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765697673; x=1766302473; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRn1RbbVVYNiiCpJThw73EOp5BTjJZAt0+REstZc+hw=;
        b=YJlexOnUpKulvqke9pljcOObx8BdVOMKcajOldCfqn60wIxRnewJRHVfDDyptP3ryw
         b4nQtCu0wBXZLpROeKjEGcW8RAy0Tygvyzp+LOieK2QQxDI/ubAd6URNAEBqXmlu1Qk2
         Mz8wKPWPcdkQkqrz1KUikd8sR3Oom5UBvIBrYkDU2HK81qOj3BX1q+J4uta6KGUSnZIO
         47fziOMKEisQSBf2XpqtO+S8PfzNtAK09aYDk7ZriVTqZ4KCDGAWgGPXEgQBt6g5+xJw
         dYZWd8kFHAi44FQpNHNG5Epdt/9iEDxNnO0ZiVerirKMLOtyW9/R2a3mKQPgt84F1Q9X
         c49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765697673; x=1766302473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRn1RbbVVYNiiCpJThw73EOp5BTjJZAt0+REstZc+hw=;
        b=irDiTV0ry1pM6EL3X9Y7mVgRDvJQV7ogy/KOwQyhUXVpuy+0qVVEoxKo7Dd1s0iS/X
         XlvH1f4//n31JVElcieOWOuPfzdbOeCwOeOvdkFKGorj9uWWm+qWi90nynBWZIgZV7E7
         gaOkQ1S9TiEasNIe8/jFRdtNW8nmt+aLd4zuaPm3IwjjC1amH7QHjqJ5+zppx7MWjnTo
         Sm6H+bQl1qAAjuNPAc0KGmycIjdSsqfRhb2JEgZEwZAS9xmSpcj0fbfjkZPIOQuUlGwm
         t7cSqabFhs7U31Yk8RanyQA6EbtpKOkwEMGTLjk4bUs0kT6xkM+EDcqLqZdDmk7pO7iB
         yFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSk60Z8Cs9OS2tAut9B7ArlfRl6FUb+znAu/P2mbO0iXVyvgq2dFMHxawSMN6UEAvGRhMGz39Via4g8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw26QDhuiuRO33I5CtNprCD37ICsAi41hFQ5fS2BplDUVea7qDg
	1DHJ+ukzImzQmsJVQXnS43DpU/+Z/7dLZ1F/8kJOGQDVeWt9OW6bcnyx
X-Gm-Gg: AY/fxX4C7qZySFgX2HiBjNf/54CI8t5GqU/0l07Sfgkw2L0Gzxx6NyNEzIMhwm28OAK
	AvCypej6mLdzmz12OO58Q1C4lOu4wGXmIvdNTObU/rX8dzoPn9lCHidAxIApO7elcPicDjxnAsC
	1rWVpFLTif4MJulsRViO6/42Xp/YH3gAoUepXGoiZ4akAWua4zHWVg692HuCgW66JhzwbNxOGXB
	iV/m9CJd585Ul+a+s1pdOfYW3O8S/KUkdgTYJMksYlr6FlMxDPRHyEgPvsZHfl5FcS35g6YEDe0
	MSBZ+cXPMuew7J9YZ8TjHTLQFydQTcmS7M1aoUSlF767lo0gBsrmpl3hTva0fI2DVVyGh7GdnAH
	srf6t4zi/mDOLZQdsxCjX3sxkj6NGbQgnhR0nKF4UKZmUH/oqeKuErOkCJ0CyjB1AxLtbu/l351
	kMxh1RU5aQp7kkX3W+Uzzl7bhJvVV5UqEX1FaRIZsTWeMlkHjRlXAc7Wcn8eV60TE3ig==
X-Google-Smtp-Source: AGHT+IHAPA/EnNsgzP0HIlYsXfOj/q3Xg73QhloxXAO45aDmZUzS7OcDiFy9ELh/3UzA7ijVRiMldg==
X-Received: by 2002:a05:701b:2704:b0:11a:61ef:8491 with SMTP id a92af1059eb24-11f34ac1593mr4017789c88.3.1765697673068;
        Sat, 13 Dec 2025 23:34:33 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb2f4sm32890480c88.3.2025.12.13.23.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 23:34:32 -0800 (PST)
Message-ID: <66cba90e-c9b1-4356-a021-e8beeff0b88d@gmail.com>
Date: Sat, 13 Dec 2025 23:34:31 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
 <CANiq72kYjNrvyjVs0FOFvrzUf7QYe8i+NpBS6bMEzX8uJbwB+w@mail.gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <CANiq72kYjNrvyjVs0FOFvrzUf7QYe8i+NpBS6bMEzX8uJbwB+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/13/25 22:06, Miguel Ojeda wrote:
> On Sun, Dec 14, 2025 at 12:54 AM Rudraksha Gupta <guptarud@gmail.com> wrote:
>> - The kernel boots and outputs via UART when I build the kernel with the
>> following:
>>
>> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
>>
>> - The kernel doesn't boot and there is no output via UART when I build
>> the kernel with the following:
>>
>> make LLVM=1 ARCH="$arm"
>>
>> The only difference being: CC="${CC:-gcc}". Is this expected?
> It depends on what that resolves to, i.e. your environment etc., i.e.
> that is resolved before Kbuild is called.

Sorry about that, I should've specified in the original email. The CC 
resolves to armv7-alpine-linux-musleabihf-gcc.

When both LLVM=1 and the CC=gcc are used, I can insmod the sample rust 
modules just fine. However, if I only use LLVM=1, my phone doesn't 
output anything over UART, and I assume that it fails to boot. 
Interestingly enough, if I just specify LLVM=1 (with no CC=gcc), and 
remove the rust related configs from the pmos.config fragment, then my 
phone boots and I can see logs over UART.


> The normal way of calling would be the latter anyway -- with the
> former you are setting a custom `CC` (either whatever you have there
> or the `gcc` default). By default, `LLVM=1` means `CC=clang`.
>
> So it could be that you are using a completely different compiler
> (even Clang vs. GCC, or different versions, and so on). Hard to say.
> And depending on that, you may end up with a very different kernel
> image. Even substantial Kconfig options may get changed etc.
>
> I would suggest comparing the kernel configuration of those two ways
> (attaching them here could also be nice to see what compilers you are
> using and so on).

postmarketOS uses kernel config fragments and tracks the latest linux-next:

- 
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/devices.config

- 
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/pmos.config

- build recipe: 
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/APKBUILD


The only thing that changed was whether CC=gcc was specified or not:

https://gitlab.postmarketos.org/postmarketOS/pmaports/-/commit/b9102ac5718b8d18acb6801a62e1cd4cc7edc0cb

> Cc'ing Kbuild too so that they are in the loop.
>
> I hope that helps.

Thanks for your help! Always appreciate your presence. :)


> Cheers,
> Miguel
