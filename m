Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FAF18E03A
	for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727699228; cv=none; b=lrrImmzeST6rCQo30zZqtuhPUPMUdK/3B2ZPVjSDKB274yQPDfZtg0vSBNAFay9CSJIDl1S8grocy0Ws7gikYQj2OWdZVZSYKbiJeeJwSIyltubujG3TIUTGvP2fjyFWf/udzbS088huYgOql37OCEBN593Y+bmd9Cb2RxeLrKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727699228; c=relaxed/simple;
	bh=N886qxBamW3uIi+SusvihjfN/VNlxZj/xjBq2IJNRV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a7zMDNmeS0F/eGmwYZ+/wVPXAAaoNnIQbDZmZVgi7e3bj1P5blhZ5ldeZwh4uaWYrW4ad8CIYU5vpK0Jto2QCffGYoLLzAdbQX96R1mvcsI914R//fUG8AJGtWDBoxBvvdIRMUyChqKGti99vjQhac1ghZWRYgkIYYgaaV3+RYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=UkbhwM9f; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="UkbhwM9f"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20b8bdea19aso7033495ad.0
        for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 05:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1727699225; x=1728304025; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pfkdT8O6nyV9YZAFq8/FGOQnu7cHl5dBNbp1cBDwutg=;
        b=UkbhwM9f2JLALmYBQd5xJAzEkUGkm9GkLYkmCCPkEIALlTlL4bGyVWrQ+eEScGoe56
         5gpkx7JJnnId4Err37ykL4YXnIy0Rfco+Jhc6JM7Jg0QCljD8rNtzKLS9bjIZU/Tu6Yz
         cit8gzu5UlAcpbdnhn7rgXaIbvJSus6mfThVXpFYN0vI65itRjGnU7pK8XZf1IZAFx2O
         kVhlzWR1CTdL+KjuOMk9ox4EzvYm4jTGBZ7FAeXxgyzSYHCbEG74f3lwbyDU5SDpSBfJ
         hgLMOlGsUp6vSQb+ZE5D0nKY1L/+PMhSD3p9DikahbtRzTndBSOaq1qwE68kgnuh7Ku/
         eaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699225; x=1728304025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfkdT8O6nyV9YZAFq8/FGOQnu7cHl5dBNbp1cBDwutg=;
        b=t6XNpc76Biyq/6JiscoBao4bmst3THHC7FjOF/hGPC7nndJ8G5aS7159YvdYjtPJnm
         HR4MP2Uauu4Eehp2UKn63AYcWfsGwR4iWnX7+1S5SKirxUdlzC7vj/JmKJkKg3zB15Zj
         RIU70j42fa/r3zexGoHR/VfAuiN7ENfp4LzbTQg5bIAU1pIM+dKnRt71sRspXKt3lGYY
         gt4nypHYJU7LQMCiMAr5hN+rTQYDFVssf26aK67uLcrd5f2OUPBOTCaxP0CuuQ7kap7H
         qSotQXZztZtUx9GcOxWBj05WARcScd+21MVT1XJYzVYhcUknxUEmeXMYbd1PP/TG4PQu
         dRhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJFJ5c7u4QgFXoBZhWr2HeQu5NPijOuabVplLlBdOvQBSFc6poKAm5c0Q7sU9nf0p38AAITYY1ppHEjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YySBvaye1sNk0KHjpgEQvgqnCoLZLqTXtrKhroqQlM7gjC72qeR
	0Puh709ojejWITDi/So+SvKVQPbkH2JcJWGa5Y0eSUz4UTQgXxZy+U4eI5t3mSY=
X-Google-Smtp-Source: AGHT+IHG/wpBp/CtKceQ3qDWyrlnI+DUlP5VLVxTkPxbhjnxdWRhvjOT3cbFdqHYkCUtJlctO6FkGQ==
X-Received: by 2002:a17:903:986:b0:20b:6125:69be with SMTP id d9443c01a7336-20b61256b01mr108772115ad.49.1727699225518;
        Mon, 30 Sep 2024 05:27:05 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37da03bdsm53867485ad.95.2024.09.30.05.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 05:27:04 -0700 (PDT)
Message-ID: <d7aff674-ad92-4a36-9ebf-8d3c42774723@kernel.dk>
Date: Mon, 30 Sep 2024 06:27:03 -0600
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
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240930044313.GAZvosYZF5mHi2OZbC@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/29/24 10:43 PM, Borislav Petkov wrote:
> On Sat, Sep 28, 2024 at 05:31:36AM -0600, Jens Axboe wrote:
>> as the box is running debian testing/unstable.
> 
> Thanks, I need to go find a box like yours to try to reproduce it there,
> after I get back from vacation.
> 
> In the meantime, you can add "dis_ucode_ldr" to the kernel cmdline if
> you want to boot the box with -rc1.

Would it perhaps be an idea to revert the cleanup until then? I can't
be the only one hit by this. We obviously missed -rc1 now, but...

CC'ing the regressions list to keep track of this.

-- 
Jens Axboe

