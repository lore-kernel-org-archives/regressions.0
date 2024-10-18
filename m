Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9042038BE
	for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 18:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729274604; cv=none; b=B3V4DJP35sBIPC05LIYu7cMNOKXYYYssPDki+UDgzE1q6VEYQOdlBXRA/SWNbOS1G5w75fQBVp3I4HvrtifEjVBMJD84Ehn3Wm8a+DrTPOWxI//fIClaO8NGBPPvCzV/qWPTfypCWz97NZyOiBh83DSOYg5WBZGbYuPYeNCuTm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729274604; c=relaxed/simple;
	bh=zxqa3/qqKqvRYqqj3Z+cv4GKWsObzym4ycxYsNtVp50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrpyUAz3EaSiHvLtynX07Se12zTgHgRGk9u/gYNhE8cmalnDn75JKoCX16DE/ph1NSEkuzKcy0tEsL/YTvA/1Mted3gv4FbLvxR1LBBEqlqr2GeCKKHl423miGnEnsknw6lDhHh8iW1L/Pem7FqK6BiJZ+vTwmy5uMOsYNfpSxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=wKFgtQff; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="wKFgtQff"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a3bd42955bso9909615ab.1
        for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 11:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1729274601; x=1729879401; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2zH+UgTmxiSGcgRF5ylverOTn7g/wnZyHq4IeCCvEKk=;
        b=wKFgtQffWwrWI7GrmvdIumG7GxTfmZYIIPeDJXLXjQW2D50/In/DlRoNIGDSFj4Aoj
         r9sVu1zAsQDV58iKbno5MH4JXP1IiYlwwb448wZF6N1R3VJu6R8sAxdF7joTijL1LXB5
         el1C1OtzomagYddWGLnzaQoT7WkL7AYSiXBHmzLKqPxnacVzIcUakW6J0VYQp2yu3cWA
         +zYda4aLKq2gG3Am3isCyxxasxzOx4Q5EXuUuZfv5BYppFET3d4wIf+pGtW3FEpqxR1q
         rXkeFUtbOSxO9pBR4XCf1oIA0VzXv4iJXs+Ayd9LR9SZHR+VleemT/elBEUVVpHUuGdG
         ENMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729274601; x=1729879401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2zH+UgTmxiSGcgRF5ylverOTn7g/wnZyHq4IeCCvEKk=;
        b=rU5dPQzTiHBpWVjNRRz2mjpaFqwVtY+qGwubEXQ7t0/AEcErI63ZCc5jrlQVUUyo2A
         K6UJtl8K8X5BaKqpkp+ALhiXqAYY5FidAMZmtRmCK2bf2eSGlEiuL2/ZYLCBXeQI8tgo
         45cKj1sZo5rbLin7iPvcwgVogLMkJ7Xd2hVeszhzF/xafAcYjrvg3ZLhBOVyTOXLl4QX
         kiTh4r4mn6dCKN8sz3cp74tVt66KSf6Fi/mezphZk0WXei5A+Ymbt9oZhDHh2xbESpHv
         nQvtqzrP96ZX136vFzVHkmVHfOnaCIgfnxnAbWpx6AxY4Rq2T6oZ3DUc52PxWGFo5iRg
         o+aA==
X-Forwarded-Encrypted: i=1; AJvYcCXvOrW4/B4cLp19Uykdhzl5kQWs/ALxVn5dkJ9dFUHaKZlWDQAmyY9R9sx67/t4AoqTni9qt9/Wlw+RDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ4lGDc392XaCD99tmJgJ53RwS/z4e4CFp8aQdXJOSyJDOIKiv
	LJSftcmFXyMoBu00Seh+J0c9e221h9XacCA2L2/Nw/7rsCxj/2UmRSyXzxP6Dxs=
X-Google-Smtp-Source: AGHT+IE+pGq513oDYSwzlCR3+veRZ0wcIsLmnHLa4KDvFAyR+Opj2KFGW5U0RftsuR8Py+wlzIITVQ==
X-Received: by 2002:a05:6e02:190e:b0:3a0:5642:c78 with SMTP id e9e14a558f8ab-3a3f4073e06mr31868635ab.15.1729274600995;
        Fri, 18 Oct 2024 11:03:20 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a3f402dfd5sm5125995ab.55.2024.10.18.11.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 11:03:20 -0700 (PDT)
Message-ID: <016ecb00-2331-472c-88e4-66b1dbecfc99@kernel.dk>
Date: Fri, 18 Oct 2024 12:03:19 -0600
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
References: <3400cf0b-85ca-4ec2-a8a0-c9d75889d573@kernel.dk>
 <20241017141314.GDZxEbenNT6XF4jIaA@fat_crate.local>
 <4d4bf52a-dd91-48ad-8949-198b2ffbc9da@kernel.dk>
 <20241017142707.GEZxEeu3YHvnEMmd32@fat_crate.local>
 <a395a18b-3478-45dd-aabd-ccc9d0851318@kernel.dk>
 <20241018115857.GBZxJNgZY-NedtPrxX@fat_crate.local>
 <20241018124943.GDZxJZZxtwA9O9eqiU@fat_crate.local>
 <79296353-1fa3-458a-b055-88bc6a772180@kernel.dk>
 <20241018155143.GIZxKED9YcF0Jg1CWZ@fat_crate.local>
 <320024ab-63af-45eb-a3ae-5486cb2015c0@kernel.dk>
 <20241018175606.GJZxKhNmW9nCLwNS6Z@fat_crate.local>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241018175606.GJZxKhNmW9nCLwNS6Z@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/24 11:56 AM, Borislav Petkov wrote:
> On Fri, Oct 18, 2024 at 10:48:19AM -0600, Jens Axboe wrote:
>> Funky... Not sure I'll have time to get a serial console on this
>> thing before next week.
> 
> That would be much appreciated.

I will probably have some time to get that going on Monday. Just to set
expectations in terms of timing, the above should've read "before the end
of next week".

>> Like I mentioned before -rc1, maybe we revert this change and I'll be happy
>> to test patches as time permits?
> 
> That's my plan if we can't resolve it until -rc6-ish or so.

That sounds fine.

-- 
Jens Axboe

