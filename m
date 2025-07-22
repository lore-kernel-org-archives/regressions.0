Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF942DE1E5
	for <regressions@lists.linux.dev>; Tue, 22 Jul 2025 12:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753186462; cv=none; b=PS/9zFUKcysYQpOwEY1ij/2j+R0Mskzwh6fKlTRLpg6y5UXfDK21OBNHvzVcsJNIjP3F3gf8gLRKiKiSDCrbR4lTabI+hrGxwH455fcQszSc9+Hn/vMX/VfjwQ2zQptKYpvDC0+KEQIoPC57VZqIVPTE4Yuz9fMSgUczyXAdcaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753186462; c=relaxed/simple;
	bh=sf1+T0JcwOlPtAmaW12tuPWOakYQlJPwEqSiEGG12QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nMMGdkEHDNilERmPHoD5CYk3Zb/HUzYEuAr6UHTCNzgjxi/HrA+Sp5eZerV0x7K+qWikfxSMT9n2eQwtdmXkYC3F5otLsSzR0oR+WPniSMYy7AILGdmlxYCnkyk97IUChfOqa5ZkE0iSEJb4KxaeSX0mikM/5hv8pDRoyn2X8II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=wz0nVbb0; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="wz0nVbb0"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e29788356cso15323575ab.3
        for <regressions@lists.linux.dev>; Tue, 22 Jul 2025 05:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1753186460; x=1753791260; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aPVTwTdFTsc751gaYm/Hhn67W96rQTewFcoGBTIznqI=;
        b=wz0nVbb0k6Xe/mlnF+bPso2yk0jJSvrbkQOHoHyAgcH+8zmTSTeAGWopDwUq8j8N4i
         3Be8OY0KryBGVxJNyBNhEFMtw/c0qM3Bs1kIb5KHz47Srd+DbJj1wSqtXC/GbHIEEnZ1
         2xS3989yQPfrgEHwb1IRErlAE77F+X3KhGCwUEgSP1JJ92sqCGII69RIg8ZX4SXkBiLY
         Nqg8lzTsV7k7clKMPoDF5DF9BMod0ZfJmJVyGgEqqdcFnRp7RcgPDz039GUnvruafAdo
         wgfh0zk57xA9wgBTj0lyjdlFA0nfh/kUwTbDeHfoiu9OG9juaO8/aU5psSYUTG13WQ9M
         66lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186460; x=1753791260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPVTwTdFTsc751gaYm/Hhn67W96rQTewFcoGBTIznqI=;
        b=tQCNjS8JmB0gZ58cNHXqPJ+MIKXVsrsG15sdJzpTWoXJTlNFKWjmCqhN0MEqdMeUxf
         DyFSmGcqiNDemNle0TSqz16B0rkXpER807wfe10RG71pKYSEZ91Q5hGflNEE5DbDFAhe
         TDHGsW949hITl5K9Jskrk2EVYWbYBC/AcOwwGGQmEcqYiTMNrnXZ8nytDFD9/yH0Ic7V
         hywcpd9IkTUie1CZEnWCMPPz1efER0HXa1QK71V6Rs+2DiCcnje/x5sAD9bnxTwgLDFF
         V8S9iH2aicjic5j2fVTe1DycqAeecP4rDbVpkOOV1RIkIgowvmIhc5DLfZdSBTdiImar
         HJOw==
X-Forwarded-Encrypted: i=1; AJvYcCVAZ+k6eNZzJXY92ZD+6q+mW6l43j6D0Tg45fwy1uwbFbkznZuJs87HWhH9d+EZS0f7xaXywnE/CEhSxg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf3IvNgzoGvetdrz6EXs41UeB5JNzuVjy8eVTj2DyAlOsciM/K
	ZjaafVNUXZpS49EoJB3u1hJVc3iYGdn+d93NxGHg6l0p3ocJmAlbZmwqOgmpZDgAXuw=
X-Gm-Gg: ASbGncvjIHvSsCmgvLofxe9zfAHF0zBD3QyXgtrzH5cvMqwdGTOfNl08v59KSJbp+p7
	EcMZjGPE9vaP8oim+1NqkxEGV/0JELvlFQk6mWt0oR47RcIm/7ExKQaIvtMIF+/vuBjPcWDOwJA
	Xsp4OsvfM3b1D50U9QsE90rKUYPdqCm3SHXJWM/eV3YW8TLzcOS0G7n7YgHEcDKBUw81wtZv9dG
	UoX3t7pl+OnihMI7chtnpcwpNc4ksXHYY3M0E1+92IdT/QHc2v6LM1PU42rzsCDENZfGTrMxd8C
	Y7b8OYzM/QM44P35Bpw2VwBcl05Uy3N9ApSj5NJ5boBB/2frgLXRtr3A1+x3EkkUCJLX8lAKra4
	0/2/cxRammv4v8AQDEE8=
X-Google-Smtp-Source: AGHT+IGWtOls1B66eWDWTPlotWRsVDE8PPR3Zo1JfCpc3xDLAOtrzQLxt3z8FA6rIVPpDcscI4nFOA==
X-Received: by 2002:a05:6e02:3c87:b0:3df:5333:c2ab with SMTP id e9e14a558f8ab-3e282e64ee3mr277030295ab.17.1753186459712;
        Tue, 22 Jul 2025 05:14:19 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5084c787e63sm2495145173.9.2025.07.22.05.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 05:14:19 -0700 (PDT)
Message-ID: <8acbc346-98f8-44fc-9675-0c3a7da87d21@kernel.dk>
Date: Tue, 22 Jul 2025 06:14:18 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.15/regression/bisected - lockdep warning: circular locking
 dependency detected when plugging USB stick after ffa1e7ada456
To: Hillf Danton <hdanton@sina.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: thomas.hellstrom@linux.intel.com, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>,
 regressions@lists.linux.dev
References: <20250722005125.2765-1-hdanton@sina.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250722005125.2765-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/21/25 6:51 PM, Hillf Danton wrote:
> Try the diff that serializes elevator_change() with q->elevator_lock if
> reproducer is available.

Hillf, these seemingly random and not tested or thought through patches
flung out in response to reports is not useful. It just wastes peoples
time and resources.

-- 
Jens Axboe
