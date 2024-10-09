Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D326318C35C
	for <regressions@lists.linux.dev>; Wed,  9 Oct 2024 11:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728471867; cv=none; b=hqJ/YuH0IOVHgWNTCBuawTP0U+fFNtHJJysvbG9Q1mLWc5jKlLDoDbDB1sD3HIhvU+La463g3omu5JRF4gEDMkUtFQVBRBbhAMU00l7j+coFIdECmXuAiNh7CkpJEDEi57iJQ3QVsZC6Oj5Lj7ueZxRxLTfI01gNM1eah1F69HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728471867; c=relaxed/simple;
	bh=akw4z7RCBxzqygAyivLS/uFj6Zz7BOFnEaigEkTnitE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OO+YTouemOpKyxsGFhVjSRt/K/8TxJuhqyT4uEZr4Uu2EMsrxggr2dt8WHHB5+HNW2RA7oX61HzNfp4o1+RxnHyQ7hbIxnNa8xu5kmdjiZ23ZqEkq1eO6tu8jsczk2P93xUu1ShfNKEZQWPP6EpJ/VR9dbPW0FpRQ1p2kcphVBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=LWgLUDu/; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="LWgLUDu/"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e0c3e85c5so2150986b3a.2
        for <regressions@lists.linux.dev>; Wed, 09 Oct 2024 04:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1728471865; x=1729076665; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BmXF2Q49luswGg/2y86q1ZQ3ULzUFXxuhYjCSrdRAvw=;
        b=LWgLUDu/H/3Oj9iXiHsY1jbVWEQaQsCZ0RfDS6BSSY3+RXxuTetuf1D5f88WQhgMHx
         Qiq4JxzGwxZMgmrUrd9+jbB4/DggUM3MF1285ke1RluRIhds39Ar7ICBEX4NcLo4EKFY
         y2J1aykIJ7h3kjZMI2QMlPP8Nsr4RL7/VvrKOVXj3NBWVI3jHX7O/92YznGBxNvvkWbe
         E7iVZaTw9gT65+jJmTID6P9B2DdMrH9uyBRqJSC3Zh7UAKzqBK8o0CnNrwibTxGMefVJ
         13ebvW62XjsBSWph3Ko1AnLlaaEr+sh0JzP+tepEexDM1GA3LxEWYG+PxyVDq6SI25ZH
         YTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728471865; x=1729076665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BmXF2Q49luswGg/2y86q1ZQ3ULzUFXxuhYjCSrdRAvw=;
        b=DU7cgq4sRFXepTNYQQ88VWkxYAdfV2zQchmqht8jgHX6Cq+yt/QGqUzeNtx5EF/10K
         K8WBqtYBNYuu8ujCGj7F/A5CtEvU538wglPtEDGc36DGgclcq0iqREMaNegIz+4VxMYo
         LADPw2z5GtAcLY/8kQkJsEyb949SU5Vo8ZsTXl4j3sYHANayJa9g3K8wj/QNeCmhDaaZ
         24WYBE/CfYVuqDtwKI4I5s4Q/7zsoq5NCjeti2XzH+JfCsAILlu6o6Sq0AkijWJsjn9F
         K6Y/MPiD6AzRiQHdkTK7v97t7SUSX1un7EvWHOoLXEEbxGP0hQaEd4Pxdcrj624hljLo
         UsAA==
X-Forwarded-Encrypted: i=1; AJvYcCUvtNvrFizr4hykYAAWXIkKgz2FQWuzFVnk7EFPE1maoQZyHigiTijkvDpxwX2TSQgyDKIyuMDW7w8BPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnmGIGGDwSYyyRBWwkNzI5ppr7W4v/EN4gqwErWzW5SuWNtlo+
	/2kF7v9fIeVZLPpAwZ14T7/OOIq3RHwLe3Znw1vYSUeUEN9w8wvtZZcvsPnqyUw=
X-Google-Smtp-Source: AGHT+IEEMjmiRET2kOs0GeInwrz52Oue3vtvkRG73mTQZZRLoPcG6hCze0/6KFkEbxi8zZg9lyGnbg==
X-Received: by 2002:a05:6a00:1312:b0:714:15ff:a2a4 with SMTP id d2e1a72fcca58-71e1db85861mr3024260b3a.13.1728471865013;
        Wed, 09 Oct 2024 04:04:25 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccd156sm7550277b3a.57.2024.10.09.04.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 04:04:24 -0700 (PDT)
Message-ID: <77f16324-47e1-41e6-a9e9-2cb7cbc8d14d@kernel.dk>
Date: Wed, 9 Oct 2024 05:04:23 -0600
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
References: <91194406-3fdf-4e38-9838-d334af538f74@kernel.dk>
 <20240928061038.GAZved3hMSU3XahWrJ@fat_crate.local>
 <5fe1e264-c285-4988-b1e3-46771d07172b@kernel.dk>
 <20240930044313.GAZvosYZF5mHi2OZbC@fat_crate.local>
 <d7aff674-ad92-4a36-9ebf-8d3c42774723@kernel.dk>
 <CC418B80-5ED9-4F64-917F-BA6F94130F83@alien8.de>
 <ad9638b4-0a4a-4cd0-9fcb-2690693da157@kernel.dk>
 <20241009091247.GCZwZJDwFETmN5pEGe@fat_crate.local>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241009091247.GCZwZJDwFETmN5pEGe@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/9/24 3:12 AM, Borislav Petkov wrote:
> On Mon, Sep 30, 2024 at 10:25:21AM -0600, Jens Axboe wrote:
>> Hmm, seems like a pretty standard cpu and updated microcode fw, no? But
>> if it's just me, we can just defer until it gets fixed, at least for
>> some more rcs. I just pruned the microcode for now to work around it, as
>> it's pretty annoying to forget about doing the reverts and then booting
>> a broken kernel. The box takes minutes to post+boot.
> 
> With the microcode blob removed so that no loading happens, what microcode
> does this box have?
> 
> Still 0x0aa00215?

Yep, 0xaa00215

-- 
Jens Axboe

