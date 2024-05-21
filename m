Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307202AE6C
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 19:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716318714; cv=none; b=hmn6G9d9mRrkbv0/bUvXb8tpbAg3U7U7E+OJsU3OQi22Rj82iqCg/k3/LSI7Gx7LJG0J0xtkibzRkpw3LvLG5sC3qbnhTtaBy4Y9V+d3D7G1ZW1UX+kTmhk8YXN6is3akIXfl0m19l5U6ecS44XKPgBLfBdjw0wTqhMXI5tbq2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716318714; c=relaxed/simple;
	bh=W4KBY+3wFgc33kZ7ocw1X4OcJKutAsZN9ixLcTINEEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CaM7yzK/qFfdri/HxY9/pYVKEgDwpMIpHu+GjXdbZMcob3OynlmeCx3pSw3JcXFyt34qlE3WJeERepGLai71mZwkwnKGNjkEUqTbbmeCEQ0PHefzw7R4cz8JushLscNyb4rVJ2TTIgZitJT9Bz6qAxKHeamqYnRulKadBtWm5mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=fnia1Jfp; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="fnia1Jfp"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7e195fd1d8eso21030239f.0
        for <regressions@lists.linux.dev>; Tue, 21 May 2024 12:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1716318712; x=1716923512; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2R1lZ7cvE4ys+41YejloGdUV0GMIOF3sFj6PoCbWqgw=;
        b=fnia1Jfp6vIA4mgzcAG8/zbL4P+Jj9Dep+KMtGG7SOJ/ixgHIYFz4u2MVTxt7RKKsW
         qoKvh2hlatp3qT954PjlNX/bTyz9eR4ghEYU2+kTpAEkMr6+5zy3Y8cT+xEGky3kNplY
         gk/eBEWaFnYReJCyIzxBXE70ygnZJFn+fWz/BOotES7eZLSUmyseBJoHRsZCJXgIg2h0
         tggfayCkN4ogehMKODxZWYmbNR8sxWou94DYJ9LmHaeVwNIVGzQrdTkn4ge7QnICsBHs
         7zM8CeWQtTqlAICSyGvMSzoMpuKWn5ZUkVU3Dr1kCIfs2xbcS9CIIxtPCYtMZHfYaITZ
         ewbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716318712; x=1716923512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2R1lZ7cvE4ys+41YejloGdUV0GMIOF3sFj6PoCbWqgw=;
        b=cT5PxnM3Us7YsEzHnm9Xrx9vX+wkxAFFOHF4MFM7v7raSiqCdXrVYlrqZ8Q4y/raa8
         V5bDRbsjYAUSY+3JqUH7kNfuh3nmGKU/SX9WZQsal+kvu2AHkJssx/ksSZe2fmzwdmh2
         BbcY39dpOKIOjhi3sqZUtRtjg1CfCqoCcsWeiqtSdfHo0mFzk66mXhU1Hjucl0GJmu45
         P/Ctlv4k+/TM1ghX+a8r/3iLFdugMgl7zTHF141t6RMUbh8Ewel40xPfEBBGBtBPfi7m
         b2AU0HnOJSNQTP4sJadr6wT2DBYSTsF51TC8w0HyDDivgEktEMVQp+h3ZS+RCYH/DeBn
         p19w==
X-Forwarded-Encrypted: i=1; AJvYcCVfKPVcPoEvfVd869KCvBmHzyZL91EebNX4Ua8gInpHmCwhK80YiNjZnEJUSkSgU3J/lmbqwCgugBnzriCWDuKwjhHPFb2mc0+H2l0=
X-Gm-Message-State: AOJu0Yx7BwlpuT0EHg9pH161IBBYhJ2tww/THFwwVD+S1oRZ9oaTfIhc
	2xxHePO8S6MZEAup/UhS7e+2hPB9bzGVnPbzxFu60U3V1piq3nsuQulXdfkzDu4=
X-Google-Smtp-Source: AGHT+IHMEI/NQlnj7qN5dyCM8kuLceJZQOhDuwzGeMbyVpzUYD2D5aem2PyaYHQ9VB3USbFeb4ppbg==
X-Received: by 2002:a05:6e02:1aa1:b0:36d:cdc1:d76c with SMTP id e9e14a558f8ab-36dcdc1d784mr139275585ab.0.1716318712300;
        Tue, 21 May 2024 12:11:52 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-36cceab150bsm56029305ab.10.2024.05.21.12.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 12:11:51 -0700 (PDT)
Message-ID: <c7b07540-e204-4863-8b90-a96dfb4129e5@kernel.dk>
Date: Tue, 21 May 2024 13:11:49 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ETXTBSY when running Yarn (Node) since af5d68f
To: Christian Heusel <christian@heusel.eu>
Cc: Andrew Udvare <audvare@gmail.com>, regressions@lists.linux.dev,
 io-uring <io-uring@vger.kernel.org>
References: <313824bc-799d-414f-96b7-e6de57c7e21d@gmail.com>
 <8979ae0b-c443-4b45-8210-6394471dddd1@kernel.dk>
 <8de221f7-fe5a-4da9-899e-de2a856a4ddc@kernel.dk>
 <yywbp7fjnwgqxvc66zimea4hgdc2eysjx5nezky3vndr7xw25l@jv76rdseqm3e>
 <b8018270-6e9a-4888-87fd-69620d62c4e5@kernel.dk>
 <0ec1d936-ee3f-4df2-84df-51c15830091b@kernel.dk>
 <ocpimtl6f32k46tpcytix4kse4fhaivp7qvs4ohqmcx7ybtign@3yujd4llvah6>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ocpimtl6f32k46tpcytix4kse4fhaivp7qvs4ohqmcx7ybtign@3yujd4llvah6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/24 1:07 PM, Christian Heusel wrote:
> On 24/05/21 12:29PM, Jens Axboe wrote:
>> On 5/21/24 12:25 PM, Jens Axboe wrote:
>>> Outside of that, only other thing I can think of is that the final
>>> close would be punted to task_work by fput(), which means there's also
>>> a dependency on the task having run its kernel task_work before it's
>>> fully closed.
>>
>> Yep I think that's it, the below should fix it.
> 
> It indeed does! I applied the patch on top of Linus tree and the issue
> is now gone!
> 
> Tested-by: Christian Heusel <christian@heusel.eu>

Thanks for testing! I'll add your tag.

-- 
Jens Axboe


