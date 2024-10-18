Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B922AE99
	for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258221; cv=none; b=faBNp78vUJIUHPPHiZlEV4BMJtcFyruuGxiSPNnvbMBfZSqBLJ6qBJPCfazE+OQsjk05OJPBKsiVWz1VKVDjum5CmRJNhBOvxm6HWTir0GENrHvX2YgCRxjvp24wstLRJFdcMKvccDId+peiJFY8MNDGOYSatINEPzFwGOgL7MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258221; c=relaxed/simple;
	bh=KPSDXFRajCiADW3kOGC7o+H5Jjxj8YqYn65iwwChS6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9bdyzgUJkPrexRaMAgIfF7ih6BYgW/8PuEbdVN97Apt+g2DXeSWsjpN5HMpN1qgNY3M+ECnmywQqaveAYvlHuLdxGlWX+IkyuIb9ALzZn+6aPE3K+8hEBQ25mQi6uhAqPimpRZYPwYb3Gbz8XCcNUz/6acK8VBUyJxlCCrycAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=dsZ++gTa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="dsZ++gTa"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c805a0753so18149945ad.0
        for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 06:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1729258217; x=1729863017; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RoQjeOuXX3AlCfEBISUxX7T/BVrV6UabUw4LIP4IFB4=;
        b=dsZ++gTaB/a5rsfeRKZH2M6A+xJfdkRIjapjdyrI6J8NIWt7QJ/fmFg0uNkLWNtzYb
         4cjJ1eA9b0+gPEZasF8X8eyjR2zDzjuhBExMsYweQ3tvuvQE0GqKdG4dTdzH94bI84Lq
         qBJeo+SEn3VmxKTuT+10B3NVuvIYgpT54BnxDOLPWtcPe/VBf9ccmM167b5JPofy/VX0
         YzPDSHyV7Qi9oLTSoWtfolXivjWRehJSAFPNkV0S1ddf/37btkg/eqJ81d66LGvRj5i6
         R2i/LdZ8pWDAKu9lQk1cJw1sZRtRChL40cHUlbv865/iD9I12hR5ycJDVjGSRLbD3SZY
         tE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729258217; x=1729863017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RoQjeOuXX3AlCfEBISUxX7T/BVrV6UabUw4LIP4IFB4=;
        b=QzxlAqE/b77eWoXoZ2c/uzJheT6iBlM9H55nRXHow4Am2AAaEtsitPe5LAGuECacKO
         PvF+2mIqaZHeQeLifuSVur3r6nBj9s0yiQjxsziPdRrFhrsuKQNfvVg7jpMUf485eAtA
         BGSPEhvDvOrbTgy/wBhoKZJOf50K0mD9wNNzLWjOeogLGeAWZpqQKW51CAvMkWV6B4GY
         n3IWEpukfHDsbCi6QS04tMbQIFsLifkXAITUFo8kiXHM1uj6Dskxk6enopKwunYpRwU3
         BoeFjXDJz4/LaiMPWMZgC0aXdzcxjBt8myetPp2Yk6Y3MZMymrADOL5s1yKUE7w56PIK
         2tWw==
X-Forwarded-Encrypted: i=1; AJvYcCWR0M01oHOpXztgVQO6bikcEGystJxp3tZz4gZbmPvM8bP7up447FYU0VJP8mRHp78LoqpWVd8NJrs4IQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUUw6oNF8KM/xCu/ncQTMYLjBO4J6KF87U2/dlXiKHfbi7PrVz
	MsCkbnmc3HiN2VhhPE7McNA3YyyYd+zuhs+Fk2fe3kx3/y2MBjVIiN7DYyXjDzQ=
X-Google-Smtp-Source: AGHT+IGk0asjwlSemWFvowI7NtGy4UmJu78/1/m70oxQTRdp4QpvFvbGEmRsvoG/eVeLt+N1ihdayw==
X-Received: by 2002:a17:902:e848:b0:20c:da66:3875 with SMTP id d9443c01a7336-20e5a78ae60mr31288335ad.24.1729258217464;
        Fri, 18 Oct 2024 06:30:17 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8fe68asm12410915ad.237.2024.10.18.06.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 06:30:16 -0700 (PDT)
Message-ID: <79296353-1fa3-458a-b055-88bc6a772180@kernel.dk>
Date: Fri, 18 Oct 2024 07:30:15 -0600
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
References: <20241010134613.GDZwfapaZ8AKp0n72C@fat_crate.local>
 <842a76fe-3d6a-4846-83da-bb113634b8bc@kernel.dk>
 <13fe104b-d83b-4d6d-a348-1103d402540d@kernel.dk>
 <20241017100257.GAZxDg0VqDAesee00m@fat_crate.local>
 <3400cf0b-85ca-4ec2-a8a0-c9d75889d573@kernel.dk>
 <20241017141314.GDZxEbenNT6XF4jIaA@fat_crate.local>
 <4d4bf52a-dd91-48ad-8949-198b2ffbc9da@kernel.dk>
 <20241017142707.GEZxEeu3YHvnEMmd32@fat_crate.local>
 <a395a18b-3478-45dd-aabd-ccc9d0851318@kernel.dk>
 <20241018115857.GBZxJNgZY-NedtPrxX@fat_crate.local>
 <20241018124943.GDZxJZZxtwA9O9eqiU@fat_crate.local>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241018124943.GDZxJZZxtwA9O9eqiU@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/24 6:49 AM, Borislav Petkov wrote:
> On Fri, Oct 18, 2024 at 01:58:57PM +0200, Borislav Petkov wrote:
>> The next thing that is catching my eye is your simulated NUMA config:
>>
>> [    1.668943] smp: Brought up 32 nodes, 512 CPUs
>>
>> Lemme see if I can repro that here.
> 
> I can do only 4 nodes here:
> 
> [   23.137188] smp: Brought up 4 nodes, 255 CPUs
> 
> But that thing boots fine too.
> 
> I guess the next thing to try is a two-socket box like yours.

At least on mine, the BIOS has an option that says something like "L3
cache as numa domain", which is on and why there's 32 nodes on that box.
It's pretty handy for testing since there's a crap ton of CPUs, as it
makes affinity handling easier.

-- 
Jens Axboe
