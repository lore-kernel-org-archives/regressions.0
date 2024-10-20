Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191A4137E
	for <regressions@lists.linux.dev>; Sun, 20 Oct 2024 18:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729450029; cv=none; b=Hmcle/aEx4fTrLS95xtIY6H48aivBG2q92hy9h51giMTGSsz50t4YLprUWR+eoBH/g2iNjRe4dtjBxsVUTw3I5RUkFYET7y0/wxHb2uiLH0EUCJEFriUi9ouHA/YOw6sSSo4rLaNgJU64SMYgGyuJurQY9o05tTvcatppvQ7zsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729450029; c=relaxed/simple;
	bh=yDVmUcOPsK+6r2MNKdv1fLvgP/RzdstYd7n1r8wYqEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyRQYwpN1pauMzRMu+MSBPV0AazCzgRYuBNmiFhjqia8AM178g2EBuJ0ADX0CLm49Z7Xq+KdQaGFIQKZIkCmLbz5mwl73Harbi2as/9vuIQE3X9dw9vpGd+/Gr9rzVRf//d+fDkq1Ufizd9Qi5tQh0Z5hOnnkLSJj9YxLu8jAo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ID3/eTIu; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ID3/eTIu"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71ec1216156so541664b3a.2
        for <regressions@lists.linux.dev>; Sun, 20 Oct 2024 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729450027; x=1730054827; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K0rgne+RllSD4dCojokc08O6fyLjqxPDouNOsGVSJrE=;
        b=ID3/eTIuL5bEcbLJaTgyINILnDc/AZYxYRvEikqzFKzj7546SekBEdl8qi6ay1LfID
         rwZZuBvVoBZVj7mz60E2XXa6XIA/i+AInT2bLZ/D+ulv1PPApym3XfsSdGrv8NX6VZGn
         9NZeXu5/6negJfzL5p8YLZciPljxhp+XKorEamfENzwOsan8NvUgybbIifibIdB7Pkkc
         41S76hqkiiMGrHBNKFnCdAiIDHmnEh54CHaXidZwDT4FZ/2xWzd9y/1YJnlY9lOsvhwb
         ZfrvBbaZFc0isLKnna6PnTzvedYuPkarC/pQCiSugJlx49xH83wMbgj6rMeDxha8Q0Gd
         7lrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729450027; x=1730054827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0rgne+RllSD4dCojokc08O6fyLjqxPDouNOsGVSJrE=;
        b=rF3GXNtqrGQeXcdIupvrVOKIU2xwat8qNTyt9eW32WPgAmeEJv3HFNG7aAHXJ3TEz1
         Gf1L6Xry4N2PFxKKCW9rSb6EQgFbKp0yYNIg0/kNNC7lWhgrb4dE+n0cZ25YCfJ3we53
         U9+4+uXlNUrud8j8527vVNnNXSTicvyErpZ3ZMnpVMCF6mTI3c+C8tQpjjbbfWBDVssi
         7owJVs18nOPbm6NLk+jXtuQyb/8xgSg4ccPFVHxYf8NA3I1zU7kh5MRgsggV/Ts8nE94
         Ar3qAS6gDJ+GC/JnkX6S1R4kYKKez3r++1oLPUho8jnmYBwxq38uRDGQMFOxHEGWlxOO
         TD/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYz5hUIayuNrPI28/xP0iY8jeQtlIBHGex9gzZRaHvKyaaVT75qK+rGTaGzdJ0+HHzyJIH+WTgFa+BHw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8kGKyJz57mqxqP77sT0LC4wUgdAuY0KyrChdQ0SDQfF7b08fd
	1hva0Diw7RZn5A51aIAjCToZs8TUL69qslgARGWIZ/H0gn9cotUADRBLH+LCcas=
X-Google-Smtp-Source: AGHT+IEKJ2tZYebKlsmIfal4MlXfWP2VdJ72brsGz4X8tn78fB0n6xx0/1+LKeIcGrc9RV2fJRuazQ==
X-Received: by 2002:a05:6a00:140c:b0:71e:cd0:cc99 with SMTP id d2e1a72fcca58-71ea31a57famr13485118b3a.4.1729450027298;
        Sun, 20 Oct 2024 11:47:07 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1407da1sm1443694b3a.191.2024.10.20.11.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 11:47:06 -0700 (PDT)
Message-ID: <9aa82e51-8330-4be1-89ea-bcfadcecea29@linaro.org>
Date: Sun, 20 Oct 2024 11:47:05 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Qemu v9.0.2: Boot failed qemu-arm with Linux next-20241017 tag.
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 lkft-triage@lists.linaro.org, Linux Regressions
 <regressions@lists.linux.dev>, qemu-devel@nongnu.org
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Aishwarya TCV <Aishwarya.TCV@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <CA+G9fYt86bUAu_v5dXPWnDUwQNVipj+Wq3Djir1KUSKdr9QLNg@mail.gmail.com>
 <CA+G9fYsMg0fA-jraEvC==0a-22J97o-uBmbLJt16_ZKBpOT8EQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CA+G9fYsMg0fA-jraEvC==0a-22J97o-uBmbLJt16_ZKBpOT8EQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/24 10:39, Naresh Kamboju wrote:
> On Fri, 18 Oct 2024 at 12:35, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> The QEMU-ARMv7 boot has failed with the Linux next-20241017 tag.
>> The boot log is incomplete, and no kernel crash was detected.
>> However, the system did not proceed far enough to reach the login prompt.
>>
>> Please find the incomplete boot log links below for your reference.
>> The Qemu version is 9.0.2.
>> The arm devices TI beaglebone x15 boot pass.
>>
>> This is always reproducible.
>> First seen on Linux next-20241017 tag.
>>    Good: next-20241016
>>    Bad: next-20241017
>>
>> qemu-armv7:
>>    boot:
>>      * clang-19-lkftconfig
>>      * gcc-13-lkftconfig
>>      * clang-nightly-lkftconfig
> 
> Anders bisected this boot regressions and found,
> # first bad commit:
>    [efe8419ae78d65e83edc31aad74b605c12e7d60c]
>      vdso: Introduce vdso/page.h
> 
> We are investigating the reason for boot failure due to this commit.

Probably fixed on qemu master with

commit 67d762e716a7127ecc114e9708254316dd521911
Author: Ard Biesheuvel <ardb@kernel.org>
Date:   Fri Sep 27 09:10:51 2024 +0200

     target/arm: Avoid target_ulong for physical address lookups



r~
