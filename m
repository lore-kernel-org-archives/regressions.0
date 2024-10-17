Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF3B101F2
	for <regressions@lists.linux.dev>; Thu, 17 Oct 2024 02:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729132454; cv=none; b=VYci4Xd3giPpgLNugUnjaHblCps30LI9kLrHRCQ0HoGlclOWyu4zFFA8TXloOsAVjq/IIlDuchm/HtGOOGSw9bM9jd2EUrUmtqbaWEQAZph+jrpxP3uOr3vdw5jwVrkmMcdu7AhII1qOrS4w0Kc/exu0ZQmDxgtXcN7sAgQru5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729132454; c=relaxed/simple;
	bh=GJhaVtiZLy15AyD3VfoJlUPHEaJahKRPUFuJ0X1aEWY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sX7FgaI5siIOaL1HPM9VuXPw96Iy1CZfJdGbVhG+Vc3s92IP27DSj4uzl4g5SqvkO9w2fLiXh4RwaU7I9HT6TJTXcyo3JzsSbNtSFqdAtZfloQD9NeqMpPr09H4+E6+p+dvmQfwQMK3gJlPwwXtFOqe9vHmDuywYQ41EOdiWKnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=RdQ3GHFB; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="RdQ3GHFB"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso90730b3a.3
        for <regressions@lists.linux.dev>; Wed, 16 Oct 2024 19:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1729132452; x=1729737252; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CzEWcgkyEN2xCGQzQYd58oYQmuoVm6jkLMq2U4NyvJQ=;
        b=RdQ3GHFB2NRwbPJYHxk+lJjiJfsWl10OZpETb3JambvvUE/YFFyFBhm0SqL5c3bguH
         OFD1tDBoqNLj/N2vbtBR8vNyE4pZ0/lEfE3BZEZsJefnS489pvW/OcLmF2+9Y6dUGQ/f
         O8WDHZz5sLw6lw3uq9NJwU38Rer3cYlVaKEG1D89mj89NUKDuSN2TegKKWypFEXiUFet
         6BUCtPlXNQr+UbmjGSfiobBgpsxuNgMP71psPdbqqWE5NtUeYPr+2wdVHZU3wMA7hjeT
         HJtllLdH/o1UUk+xcitFrEQYNASaks3gsU3au5nO8AWFpzEYcuJGH5UeQuwLSJ2dbyTa
         iJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729132452; x=1729737252;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CzEWcgkyEN2xCGQzQYd58oYQmuoVm6jkLMq2U4NyvJQ=;
        b=WIz1uPS9eifr6AnevUOpt0OdyjaM79oDD6uP10R+7y6kPmINvgMfwP6Mima5/zxxTK
         Z3Zbnnbq0FPBw41z4N6cUAq4ZTGxGPobHHLD2o+ArykAk/22IhKC3zKd2+oQ0lEpG33H
         c6TNnUp6XWpUpfzcAaKyvea3BDmOx/pppJ3L3eeryp3N3ZWE4PtjHBwem+IMuHz5VWfR
         fYpOMqe8Q9mmscxBR6qFjWm6y+Hrf77rgW0jHwcBYlcZ2AvjhE5gYFme3oq5YE5RtPIz
         oV+yK5XFQ+BTUj8kcoOZsGlj6qKuPLZdM6FPHhNw1Qh+KK8YuDdZf+SOl05LOAN4Y7B9
         nPfw==
X-Forwarded-Encrypted: i=1; AJvYcCU70lAsoE/93eHM0l1YxkABqqe9oobPcfwLs0EqlIIeVaY3Xrssnjh1sgb5PuGZJU/vnsEPydqrqWY8fQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwME+hRex6vCfj2uM/LXDJpUuDvX+eCZqY09dMVzkk68AHimgTw
	Kc0wccvJ/WS/0F90vp9g4g0Z1kw+4d7hxT0+HGMJjD8RqBXBL1irbV0Q6/ViT60=
X-Google-Smtp-Source: AGHT+IEPlYb+DxeCpUtrmzvV4jpB/7wPYMRwmw1C+8y9sir94HhOaj5Up0Hc08t4bY8iVVhiJFRp+w==
X-Received: by 2002:a05:6a00:2e11:b0:71e:6ed:9108 with SMTP id d2e1a72fcca58-71e4c13db67mr26050685b3a.2.1729132451589;
        Wed, 16 Oct 2024 19:34:11 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e774cbcf1sm3750124b3a.157.2024.10.16.19.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 19:34:10 -0700 (PDT)
Message-ID: <13fe104b-d83b-4d6d-a348-1103d402540d@kernel.dk>
Date: Wed, 16 Oct 2024 20:34:09 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD zen microcode updates breaks boot
From: Jens Axboe <axboe@kernel.dk>
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
 <77f16324-47e1-41e6-a9e9-2cb7cbc8d14d@kernel.dk>
 <20241010134613.GDZwfapaZ8AKp0n72C@fat_crate.local>
 <842a76fe-3d6a-4846-83da-bb113634b8bc@kernel.dk>
Content-Language: en-US
In-Reply-To: <842a76fe-3d6a-4846-83da-bb113634b8bc@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/24 7:50 AM, Jens Axboe wrote:
> On 10/10/24 7:46 AM, Borislav Petkov wrote:
>> On Wed, Oct 09, 2024 at 05:04:23AM -0600, Jens Axboe wrote:
>>> Yep, 0xaa00215
>>
>> Found something: I'm not handling the stepping properly, below is a big diff
>> along with debug printks. Can you pls run it and send me dmesg. I'm assuming
>> the box will boot with it.
> 
> Sure will give it a spin. The box is tied up with testing for now, but
> I should be able to run this later today and send you the output.

And then I totally forgot... Got it done now, but it still just hangs
after loading the kernel. No output.

-- 
Jens Axboe
