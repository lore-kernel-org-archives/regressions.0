Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E053202644
	for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 16:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729270103; cv=none; b=dQmsb3YlAi49R/Wq3LgUWNWvCNKhYQr3dEUs5NyU/e7ISg8lOXGSs3/OSdzVL49rpeS7d8EMUGmHm7HoIVJSzKX6jTvx9XZcdXZOAF1tGvAlUdAJ9DdzM/eIS3SInORSOSDb3aS3FhCwjgSdzjWci88dVoHc8RsIkCNZE2NGx3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729270103; c=relaxed/simple;
	bh=2gVazl7nKYfRtqHkuznO7IlKsAos0KEtPsC/2T5xRuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IkkJqxtRVWjpdM/0kGcTHtR4Uvi3nbetFnPV81hlMeeHEllVPJhU+gQMLOnESi13+OvveZ8Nbx7+nRJm032qXMMc1rD3q2ASqz4yxzayGk/+fNCZ5Hokezet5htqxsdR61Ak56NuEBCQN5bowymzAbh9azEWgM3KmJ70UKnGz8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=TVT1SWfM; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="TVT1SWfM"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a39620ff54so8904255ab.1
        for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1729270100; x=1729874900; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=av1dvVgxRINqjkfGwU1Y4hfZrkDbWWqwoh0Lu3GbIW0=;
        b=TVT1SWfMtZc1oQIAcLVER1tgHXGgK9OwPuFYmLKpMJY+E1UP/T4BSCW1qRv/xqUd5l
         6JSIjhid8x9YOsAedm5bQZaGd2Dw7kV254imlju7mXYsBIsf5tMiLffJPnBKNpk0jZ5W
         1NQqRaxLPAINh9bt915m4wss6tAptoAD6hkZW/wqlpoT/fgmSVtw+7TcfVfWPAOkTte2
         zhtgkMmGeoNcTUxe5knKFvpVKe/LEM0k/M95Cor1eoellkOGDiQlzt5PZ0EkwIj379Tb
         FsaF++NSc4QSa3yAWS5vaau6Z4mbYl8eLm3I57XKT58KHyydIxKBIIXEer0lLc82+8yh
         CZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729270100; x=1729874900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=av1dvVgxRINqjkfGwU1Y4hfZrkDbWWqwoh0Lu3GbIW0=;
        b=o0A1J8gDKopml5pY9fzSiuxs3eJ8czPiSd8dy0pVjoASVqyp6XdXRipmMXKkTlx9ku
         H5efZi3IMh9DS7LfAFJULY8H0sEnawoUp50lKTYbVj0RhOELeyU4rYtfl9kPbezwiyP3
         C5vXhCsAcXI1MfzqSlAqf4b80h8jF1znPXzcYb8rHwEcLUd5bIpYsNuO1xYJCxky2/RG
         IKWIwImxQywGncHKIxnt9CXNu/K8idmnRRYDE4859prWKu1HfXhBiaBZ5xKoVu7Mr7p2
         gcMs9+xQbGD0+pu16HIpA6/XszCC+M5Qe1kSqCVMr6aMRjUT4DZRyQhVgsQ5rJYQIZot
         F6pg==
X-Forwarded-Encrypted: i=1; AJvYcCWoUBDcrWLA+39qPKbR5lxv46Rsvy4GZMQ3nswi0dGObp9doYsaPqJZXDfLxBQ7hZ2v9R97ELrQZaDv+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBKstDnlhzU59u9T7NVFczSZqn/0CTnlVp8wrJ1eewi7EgZMHK
	4jeB2rQsF+/V0v2p/rdtv1PLwS2w2TJP88exzxdNteFpUb7tjlrMwmwZeHim5tc=
X-Google-Smtp-Source: AGHT+IFAh+je2v03pVnvhk/+yEtAQabCicAv13KOXe033JZQY+kaosl7Y0Zvxqb4nHpim46gA7G2Pw==
X-Received: by 2002:a05:6e02:b2d:b0:3a2:4cc4:cfd with SMTP id e9e14a558f8ab-3a3f40742b4mr30344645ab.14.1729270100431;
        Fri, 18 Oct 2024 09:48:20 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc10c6d327sm493873173.174.2024.10.18.09.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 09:48:19 -0700 (PDT)
Message-ID: <320024ab-63af-45eb-a3ae-5486cb2015c0@kernel.dk>
Date: Fri, 18 Oct 2024 10:48:19 -0600
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
References: <13fe104b-d83b-4d6d-a348-1103d402540d@kernel.dk>
 <20241017100257.GAZxDg0VqDAesee00m@fat_crate.local>
 <3400cf0b-85ca-4ec2-a8a0-c9d75889d573@kernel.dk>
 <20241017141314.GDZxEbenNT6XF4jIaA@fat_crate.local>
 <4d4bf52a-dd91-48ad-8949-198b2ffbc9da@kernel.dk>
 <20241017142707.GEZxEeu3YHvnEMmd32@fat_crate.local>
 <a395a18b-3478-45dd-aabd-ccc9d0851318@kernel.dk>
 <20241018115857.GBZxJNgZY-NedtPrxX@fat_crate.local>
 <20241018124943.GDZxJZZxtwA9O9eqiU@fat_crate.local>
 <79296353-1fa3-458a-b055-88bc6a772180@kernel.dk>
 <20241018155143.GIZxKED9YcF0Jg1CWZ@fat_crate.local>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241018155143.GIZxKED9YcF0Jg1CWZ@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/24 9:51 AM, Borislav Petkov wrote:
> On Fri, Oct 18, 2024 at 07:30:15AM -0600, Jens Axboe wrote:
>> At least on mine, the BIOS has an option that says something like "L3
>> cache as numa domain", which is on and why there's 32 nodes on that box.
>> It's pretty handy for testing since there's a crap ton of CPUs, as it
>> makes affinity handling easier.
> 
> Right, so two boxes I tested with this:
> 
> * 2 socket, a bit different microcode:
> 
> [   22.947525] smp: Brought up 32 nodes, 512 CPUs
> 
> * your CPU, one socket:
> 
> [   26.830137] smp: Brought up 16 nodes, 255 CPUs
> [   37.770789] microcode: Current revision: 0x0aa00215
> [   37.776231] microcode: Updated early from: 0x0aa00215
> 
> and both boot with my debugging patch just fine.
> 
> Hmm.

Funky... Not sure I'll have time to get a serial console on this
thing before next week. Like I mentioned before -rc1, maybe we
revert this change and I'll be happy to test patches as time
permits?

-- 
Jens Axboe

