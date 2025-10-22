Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41F734D4CD
	for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 15:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761146787; cv=none; b=FA3Y33K+/uzz06Tjy9x9XbK4b7zrLIS0JrE4Y9ubiqA2+PP9gnlI8WYZcpfdLlwAlDpsWqzXIzCe5UVrbIRbuvOybCCJxtjosytEDotQxvjFtHwqAJ14K/rJhP7SwMS6aRAry0/tEKeHLtaXXmXjX/ItZbJaRdQPVSGnF4u7gro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761146787; c=relaxed/simple;
	bh=LRcyThRZzNKckLx/U80TKVewi3+2BXLCTF+fupxbHx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YtF79wM3Ztca3mAgB3eszOb/4I3k0omEfUKFuX2bVIJCbmq7o/Vjsp0e6cBV5XyIw2PMsL1uxl3fX04fS+vOtXP47pfu9J5CiEX05RoaAt4Yg/m0y7UZGLI+YNp/NXUrdvOVwUmhM21tE19xEi/rkS39v2V2CZEFpuGhHXyqjQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=p1pKp+42; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="p1pKp+42"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-430d0cad0deso20771225ab.2
        for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 08:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1761146784; x=1761751584; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hKPkWmq5p2r79ibLmLIZ9MOTurUfR2k5+wgsOoKVJ8=;
        b=p1pKp+42zHRSEUHDKPv4myrTsS0i+cPZ/vw9+9pnabqMTpOntJMOj7E6/2bBCpklTC
         vIoSWzQhMBcMIqU3QsPCDUaPKw9RYgiO4L1jxS9LxgQG9IJS7x1Pmylik/vkk/A8pkvm
         K7hpXNaT6FkqOi9dZyOb5P+TWqWTwtM2b9ZhtNGMhDdDbBDe/i9riF6Jd/VkBRO/3lGs
         fB14Oe2yD3D1WK/d0wb4CSGN0tb5yDF2b91T/erpsi6aD8UwsSXWaOOc+SO3dxaAikyo
         G6XRRp1rK3lWUzI9cfylr823ofNDOlIPYVrmXeMZYeYwDYsl/1k14++4CpHErGipzves
         rMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146784; x=1761751584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hKPkWmq5p2r79ibLmLIZ9MOTurUfR2k5+wgsOoKVJ8=;
        b=c2pj5xHLKlic+SCj5Fc5SASGrLU4EARF9jkGrh1SeovdUOBmgKYE8txliW80OoDAfY
         jLak3bhB3KklxmIzWtha3ijr93VDjmqIB/xb/4Duz40mJk6xWP+/NQFiVsbTqwS7GyIx
         QcaZBn9sJKhu/IQHlCUzPIUNu5tsrzr6DoCrmInTCIjl7jNw6nTBN10OAHbL7Rv7qUFM
         Oss4JLimYf8Stp5Ies/3INfItrrG5iUZfO81JIDhUlfC+MO0SycqHcZiwh/J6Jw9+UPR
         G3uDU0UnvZ92Xlq5YzpHbdOy2Ldaq5/vwLaeLcLGVV1A1+ueYkjHuRUwePBfATP8MWUN
         rwLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPg6Ju/pXUeFuYmGzE67Um+9dbT4RkqmT8N3sESvjG9N5UKLM1WAt1sOtXrDqqNNDzGASvKodHxulg1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPrKqEsR8EawnjYwPdxO5nkwRS/f4mfvFYM3vqN0CfjAnSacrA
	biXINnbBaHlmRGCW9BKhrJnl6F1LaQCDcHVeGAd4T19+517VNpX9uzT7LsTuD0DzVwE=
X-Gm-Gg: ASbGncssHUuaA8cch+HpFvBbNf6nXt1eAY1QFvAoqMwZZoX2eAJze4R/UmffMjRO7rL
	uCUeyMe7yOoJOIiN5Z5otKFLZeMsi6EvW2WYHDV6ZM/LZnDkKXweRaTFGQWTVTOK2MW9aSmy7F4
	j0uFlujqQFosVZ948VqbaBgR22P1mWXc4Y2uQfpsJULq1SfB19zLCxG+Mg32XEbyu7jaAYEC6bg
	psVFl5b+X9O1n7R7Oohzni4+bp9bZW33485NfnbPXn9JIVTIx336acFAqlsVNS1luMpjlzbA/Di
	2dfz1jmdUuvKEFqMrhLGsCuSkGhAdtpfE8ZaOavfurmFNGsEORXZgF/VSHvsCTPEe9NynkKafeR
	H2z7wk+0XGq3zI2dPbEiqTcjUIoQ75WdCRXDH8Xu5EVXdEpATawBsVRuEaFvtKDlcJq/UEhLChD
	1okcZlrcI=
X-Google-Smtp-Source: AGHT+IH/AJKSnikGo5wNrnUym0lndDFMHlCN0fa2V9GweWa6rnWf9q9FmfmeJXuUbrL+yAPgextAEA==
X-Received: by 2002:a05:6e02:1522:b0:42f:e334:5ec3 with SMTP id e9e14a558f8ab-430c527fc65mr269056205ab.26.1761146783972;
        Wed, 22 Oct 2025 08:26:23 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a979aa80sm5114331173.64.2025.10.22.08.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:26:23 -0700 (PDT)
Message-ID: <5b78c30d-26de-4e49-9bfa-121c9f40b4e0@kernel.dk>
Date: Wed, 22 Oct 2025 09:26:22 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: initialize vairable "sqe" to silence build
 warning
To: Mallikarjun Thammanavar <mallikarjunst09@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, "kernelci . org bot" <bot@kernelci.org>
References: <20251022150716.2157854-1-mallikarjunst09@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20251022150716.2157854-1-mallikarjunst09@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/22/25 9:07 AM, Mallikarjun Thammanavar wrote:
> clang-17 compiler throws build error when [-Werror,-Wuninitialized] are enabled
> error: variable 'sqe' is uninitialized when used here [-Werror,-Wuninitialized]

Already fixed, and as Greg mentioned, this may silence the warning but now it'll
cause a NULL pointer deref instead...

-- 
Jens Axboe

