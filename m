Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F84298CC4
	for <regressions@lists.linux.dev>; Tue, 21 Jul 2026 10:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630541; cv=none; b=ko71AzkqN+KDsdtZouP0gUgATGm12yMrfDCr8KKfnNyPXtegzDyc3se3V3NKm3YizyKSvUeK0CepCHwODYElE8VP/gHgNEQtdqCUmivwG5kTvMAd+zlnNiiXd9VwH947WA1qNQt4aatx0kXwfOIOKU8CqthDq191uAdAREXQ5p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630541; c=relaxed/simple;
	bh=R+eGFGf0cgc4eA8bhxZ+anUWM2eHOrWZeI2lNIAlZxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qEMAam5conGaV8fG/vs/jAnszKtM3qp4HM7YZj7Nr1yTOdZag2klayer/lO1HMRvnMO+085rql3HJnxxoqN8pSq3dKJJZrksRiot4OfzbIedZeOjwiVYYYU/la8POIrGi3YoUuh1n6W+cZW3Tu8NNtGOpyzTeUD6EZlUP6FRmQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMU/WevU; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMU/WevU"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84a2c90e383so3226504b3a.0
        for <regressions@lists.linux.dev>; Tue, 21 Jul 2026 03:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784630539; x=1785235339; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6i/KJS3NLXhR3k/OosNO1oVTEegm0iAGuSI/Lf7jfU=;
        b=bMU/WevUDsq07v+IXFyKYwK4MAkmJQUWHa2lAG+P3SSR4+pXAXiKcBaH9ClLZUQ/SF
         9Jx1/hP30cKXL6RUJSRH6eL8JfRI3u2v/HloxjArCAtWEXUatqbMKvp99MKorT7WW6vu
         rBGM0Tqj3W9hOvR/mj26ILslwH0kJcqR6GdpDQNFG+lZ7L6vRlm0fZL9ut+IueJKixue
         4+H/RPG0B5rE7o/SGD8BKnoZMe7xzhDrISx8TMWDhrPMba7L1zUbeajOlSNrQ1VI0s52
         hYmErUbnOp1WAnthXTKkohu5/Oe/0IefGMP1mhVFeo+jFDyqjAarFWUCrVUZDD7RwZv4
         FvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630539; x=1785235339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6i/KJS3NLXhR3k/OosNO1oVTEegm0iAGuSI/Lf7jfU=;
        b=HPtRvVpJqGJBzH+TSy31egSFhj0BogzhndWSRtyYTPBw6W2Ks0tFTfgFC47o1RVGxE
         mhZDN6aff8cjydFq0S+S3ghYYG18H+bhVCPf2wR+uGB+QkHbRpEorShHyD/Lg7+PesJY
         KGlp5QzavdldSPrpcK4am/SvvQSRhZ0I4E+Ra3LcuUeDRq7CB7rRs0GOCq4e5QU/Irpm
         K/due5l33urZKaUFA9irqBvChnX6O/tq1wVHHYAJ9bcHZIUXu23T5n2IUKsZuhXi0EH8
         6ruegAJ8A2N+ikO/NLVxXa7JMhGDKF0O78u3aAJVqxwJw7rWTKaqRL3+zzr8n9DpD+3U
         cxJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZjCdSPRtwT3u1cvNqKxF1FsG97TT0IOvYysYCPczL6T6buUIJxlZysO8z07pWEy8LiUFu4aaJK5jcQA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0IhWUnN5b5zS0a07fKAkrpw/g8niSY4r7zrfjRCWLUG0MUFEe
	sG99aaYtk6GCXtFxtJa9VtKYxBIZMbqNU7IDI0CwzwfdLZ5sG+kijkoc
X-Gm-Gg: AR+sD10l1naCxZHk9s5Pk4h5aZjnhIYQuPIwjc8NR630qTWFGiY64BIem73JNroJuV0
	T6dKXmN+j9a6YEZYbLuSJ59m07d0t+8VqZblnzCsrNWQnR6iN8xhvldMUuH2fuTZOOF9c8Sb/4O
	NCqmjZX0pbz2/0SgeRaXYy5ptKuJz6ppzHE8Z42c5feX39oDZ3UY43qBF68aL0D1fShUxHHExO4
	fSrYi8WdeR2mJiZCSpLbGhRwQhodD56+iDURYvw8864sxkBsnMbdCkGwT4si2/RPD1AVF7cMpW4
	OhJ7ohKdiEIncnxOebueg9b2f+Z9lQ+NMhSSMKeUiwPHLlk8y4pntDX4kNU8ZwJTvUo+9j4Wzm/
	J1pX2S6Efcr1avaBuq8b0KUvIxEVlrH6ApFrtVfM4wI8gtIrV0Ou1
X-Received: by 2002:a05:6a00:12e5:b0:842:446a:4cb5 with SMTP id d2e1a72fcca58-84be686c3c1mr21311072b3a.0.1784630539077;
        Tue, 21 Jul 2026 03:42:19 -0700 (PDT)
Received: from [28.0.0.1] ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519aeb676sm5898806a12.19.2026.07.21.03.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 03:42:18 -0700 (PDT)
Message-ID: <036a5e30-1eee-4dca-8fd0-268a1d6536eb@gmail.com>
Date: Tue, 21 Jul 2026 18:42:15 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] bitland-mifs-wmi: power-saver write is accepted but
 profile remains balanced on Redmi Book Pro 14 2022
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Gladyshev Ilya <foxido@foxido.dev>
Cc: platform-driver-x86@vger.kernel.org, hansg@kernel.org,
 Robert Munro <robert.munro@ethicsbowl.ca>, ilpo.jarvinen@linux.intel.com,
 regressions@lists.linux.dev
References: <ae3f4f58-0326-45a2-bbee-b71ec44cd28a@ethicsbowl.ca>
 <e9fc777e-fccf-4173-a564-3846396ba6dd@leemhuis.info>
Content-Language: en-US
From: cubewhy <qby140326@gmail.com>
In-Reply-To: <e9fc777e-fccf-4173-a564-3846396ba6dd@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/21/26 6:20 PM, Thorsten Leemhuis wrote:
> [top posting, to facilitate processing]
>
> Hmm, nothing happened here.
>
> Mingyou Chen, this seems to be cause by a change of yours. Not totally
> sure yet if this qualifies as regression (sounds like one), but could
> you maybe share your view on all of this?
>
> Side note: Robert, have you tried if latest 7.2-rc works any better?
>
> Ciao, Thorsten
>
> On 7/13/26 20:35, Robert Munro wrote:
>> To: Mingyou Chen <qby140326@gmail.com>, Hans de Goede
>> <hansg@kernel.org>, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>> Cc: platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev
>> Subject: [REGRESSION] bitland-mifs-wmi: power-saver write is accepted
>> but profile remains balanced on Redmi Book Pro 14 2022
>>
>> Hello,
>>
>> Linux 7.1's new bitland-mifs-wmi driver binds on my TIMI Redmi Book Pro
>> 14 2022 (TM2107) and exposes platform profiles, but selecting power-
>> saver is silently ineffective. The userspace request returns success
>> while the sysfs profile never leaves "balanced".
>>
>> This reproduces without KDE:
>>
>>      $ cat /sys/class/platform-profile/platform-profile-0/name
>>      bitland-mifs-wmi
>>
>>      $ cat /sys/firmware/acpi/platform_profile_choices
>>      low-power balanced balanced-performance performance
>>
>>      $ cat /sys/firmware/acpi/platform_profile
>>      balanced
>>
>>      $ powerprofilesctl set power-saver
>>      $ echo $?
>>      0
>>
>>      $ powerprofilesctl get
>>      balanced
>>
>>      $ cat /sys/firmware/acpi/platform_profile
>>      balanced
>>
>>      $ cat /sys/devices/system/cpu/cpufreq/policy0/
>> energy_performance_preference
>>      balance_performance
>>
>> I repeated the request while polling platform_profile every 50 ms. The
>> only observed value was "balanced"; no transient "low-power" state
>> appeared. The request completed in 162 ms with exit status 0. power-
>> profiles-daemon also persisted Profile=balanced afterward. There were no
>> relevant kernel or daemon log messages.
>>
>> Expected result:
>>
>> The advertised low-power profile is selected, platform_profile reads
>> "low-power", and the AMD P-State EPP becomes power-oriented.
>>
>> Actual result:
>>
>> The operation reports success, but firmware, power-profiles-daemon, and
>> all AMD CPU policies remain balanced.
>>
>> System information:
>>
>>      Distribution: CachyOS
>>      Kernel: 7.1.3-2-cachyos
>>      DMI vendor/product/board: TIMI / Redmi Book Pro 14 2022 / TM2107
>>      BIOS: TIMI RMARB4B0P1010, 2023-06-28
>>      CPU: AMD Ryzen 5 6600H with Radeon Graphics
>>      bitland_mifs_wmi srcversion: 0C0A58A1AE25437010C0B5E
>>      power-profiles-daemon: 0.30-3
>>      Power source during reproduction: AC online
>>      Active profile holds: none
>>      Other power managers (TLP, TuneD, auto-cpufreq): none
>>
>> powerprofilesctl identifies both drivers:
>>
>>      power-saver:
>>        CpuDriver: amd_pstate
>>        PlatformDriver: platform_profile
>>
>> The kernel taint value is 512 because of an unrelated AMDGPU display
>> warning during boot (dcn31_program_compbuf_size); bitland_mifs_wmi
>> itself is not tainted and emitted no warning during reproduction.
>>
>> This began after the 2026-06-24 update from Linux 7.0.12 to 7.1.1, which
>> introduced bitland-mifs-wmi (dc1ec4fa86b2). Power Saver worked before
>> that update. My installed 6.18 LTS kernel does not contain this driver,
>> but I have not yet performed an LTS or vanilla-mainline A/B test, so I
>> am explicitly reporting this as reproduced on a CachyOS kernel.
>>
>>
>> Regards,
>> Robert
>>
>> Assisted-by: OpenAI Codex:GPT-5
>>
>> Robert Munro
>> Director, Executive Team
>> robert.munro@ethicsbowl.ca <mailto:robert.munro@ethicsbowl.ca>
>> ethicsbowl.ca <https://ethicsbowl.ca>
>> Ethics Bowl Canada

Let me explain this,

The bitland-mifs-wmi driver was introduced on Linux 7.1

Previously, there wasn't a driver available for Bitland devices (Redmi 
hardware is OEM'd by Bitland), and |platform_profile| was non-functional.

This driver works well on my Bitland laptop (Lecoo Bellator N176).

The driver support for these generic OEM designs is pretty messy. We 
might need to introduce quirks into the driver because, despite sharing 
the same data structure, many implementation details differ across models.


And by the way, don't top post on kernel mailing lists.

--

Mingyou Chen


