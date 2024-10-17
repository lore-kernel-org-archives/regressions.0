Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF57B199944
	for <regressions@lists.linux.dev>; Thu, 17 Oct 2024 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729174994; cv=none; b=qyd6Mgww60O3QxXVXVTEso19NDcrXaExY6hmPsHpgK7GIzAUn3xCaMHEKLoQXcVM1ozGh/1vok5iYt5oWn68fz5l1a1g/rwPDhZfsSEXVhhnrLT0RQiV5INnVH6zMgshGMaoaD28rzgiaIPtxKzVpHSe2c1rYi80qtuUGUAxxlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729174994; c=relaxed/simple;
	bh=/oKzF01zLyly/tbLX0q/TExjLUJBosYRk2Ziq2D9EZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MiTSIN1NUadvWm9j2mJ4pV8w2+ag4E0DzMpc1hGM6ftyXGCpkZOXO23gPxU6SprlPGh3yeUh2HDROh4zg9vLxxmVijU+H+GeoRiyxZ17OHExL3o6xBDDIIYHiL5P4Te1ogYh/V6774h8gMC2fhh4f/hyODSmW4f+cFjX+IPsUr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=v/+Pkl0p; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="v/+Pkl0p"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ea12e0dc7aso651961a12.3
        for <regressions@lists.linux.dev>; Thu, 17 Oct 2024 07:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1729174992; x=1729779792; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9fTERrQKqMnvmgvP0SOzXoTwAvCNChxoWuC9cArNN4Q=;
        b=v/+Pkl0pdIDTtpSQxot4cH9z4O4yl7EJk+WFy+oIbMLGsDSdPGRcyTHWSxLZwhyCTr
         pf8NqTT6/mZ/isP3p4YDCTwEh3g1BT8VnBSRSr+NtPdqO7h1CKbtSme+DupBA3J5Q6Ee
         jBsSd8d4nHQNtC0y2zZeuTKXTFnqOyuiH+kuSWzCEPaIUYDHKHxTQf2Vzvf7nZujc2Oj
         DEtkhz3KcvV2MhDe0KOkjNaqsFD0d9rb7xPurbGzmADpZMw/Xe/QNmW80XpWlCn7avr0
         eD9zR4in+rpqNCpC4crwwyzLpeiedx8KC0E3Utif0CY1R45gf6uMGgexvSMmll/kJZTM
         b0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729174992; x=1729779792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9fTERrQKqMnvmgvP0SOzXoTwAvCNChxoWuC9cArNN4Q=;
        b=cBtz7fHlZOFDM2Cn92V1ATRikNXX+jXWMmnYB1eDlm7g30sHA97fDCq4e0OhWKmP8o
         3t4jHSHs77JfDszHjQNY7Lf8JS7e/MFnCwEt+pNMXXCf1Lhsr4RJoRmcOzjpAvZuT3S0
         5tpHk8uu4H5RxFqwmPix0NM1IxV8ousbH3c1WH06cRkhbawv4L1L28Zl1oC/XlP6r54m
         ITnyUdmruFPq/UleJbA8z905Q/BsgxA3zsjYVwMw+JWxifmLMHRIS/uNDkz21yoVaO2x
         lsTZ7/9DR2A1ShEdKJNm+nYB/E/jxpPQsVbo50GKMbaf8P0sz4AuRvbBego6+kHzAXvC
         MTIA==
X-Forwarded-Encrypted: i=1; AJvYcCXtpM9JGorx0NvoFdgUzAqiONjwgmZUfCoSM8+vaHzrpoJ3AX3lu2f/mJDb2SV7KCagZJRvHVQWlRKFkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuMfFfQSMmtiiEVf+uJjnDYzgBF5BD+xrDYB1tmlF3CB/8nocD
	4oDQe/xc3nSM45mEyXwP7X6tNi7l0nRwale0IeJQyfzmj5vzERlSXjJc4BjKcUZF9i2hCBoqUKY
	j
X-Google-Smtp-Source: AGHT+IFeylxJB+BrRDiwJcZ2ACKQfqwRzp6C9c9ZmanBqyrah5yhHpghkWrJLJsQuqCUJP7Ete/9bA==
X-Received: by 2002:a05:6a20:e605:b0:1d9:1907:aa2b with SMTP id adf61e73a8af0-1d91907af95mr5986334637.1.1729174992039;
        Thu, 17 Oct 2024 07:23:12 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c6ba2a8sm5066138a12.6.2024.10.17.07.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 07:23:11 -0700 (PDT)
Message-ID: <4d4bf52a-dd91-48ad-8949-198b2ffbc9da@kernel.dk>
Date: Thu, 17 Oct 2024 08:23:10 -0600
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
References: <d7aff674-ad92-4a36-9ebf-8d3c42774723@kernel.dk>
 <CC418B80-5ED9-4F64-917F-BA6F94130F83@alien8.de>
 <ad9638b4-0a4a-4cd0-9fcb-2690693da157@kernel.dk>
 <20241009091247.GCZwZJDwFETmN5pEGe@fat_crate.local>
 <77f16324-47e1-41e6-a9e9-2cb7cbc8d14d@kernel.dk>
 <20241010134613.GDZwfapaZ8AKp0n72C@fat_crate.local>
 <842a76fe-3d6a-4846-83da-bb113634b8bc@kernel.dk>
 <13fe104b-d83b-4d6d-a348-1103d402540d@kernel.dk>
 <20241017100257.GAZxDg0VqDAesee00m@fat_crate.local>
 <3400cf0b-85ca-4ec2-a8a0-c9d75889d573@kernel.dk>
 <20241017141314.GDZxEbenNT6XF4jIaA@fat_crate.local>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241017141314.GDZxEbenNT6XF4jIaA@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/24 8:13 AM, Borislav Petkov wrote:
> On Thu, Oct 17, 2024 at 08:05:09AM -0600, Jens Axboe wrote:
>> Same thing, doesn't boot, just hangs after loading the kernel.
> 
> Ohh, so it is not the patch application but something else in the code.
> 
> I presume "dis_ucode_ldr" on the kernel cmdline makes it boot?

Yep, it boots with that added on current -git WITH the microcode
package installed.

-- 
Jens Axboe

