Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A542E1DDC11
	for <regressions@lists.linux.dev>; Thu, 17 Oct 2024 14:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729173914; cv=none; b=tJLYfPN757lzsAbVz/szXhFIEGq2hI0w5ygy1/709ztorMyvlD6UtOB+Hoe3IJvMsT2SvDGz0FGwgpjKBzC449mxgeyuA6P8KEJqn3snBsp/fIRjhwSdFlaKarPjGavMPgDutbNr8mFXPV/M6q4muZBQh4hV0XTGnHLu6QTub94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729173914; c=relaxed/simple;
	bh=sDTmyRBhZeZQtrFrujlScwd8GcBMDV/Qu61nx/GWiyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxwX505V0K42rHBVm/j1cHQeV9gdITNRrOCQ9AZ417jowHMmdD7hQ+f1QteBmDCSSp/mCbYvR4R7I1IPPNHYkMh5hskt4VUZ5deDti9bZdCLlSopM64u/Z5og8WRBmYtPUYLw35IWCUI9LDxEASMeTmFaQ4ejHNNO6/XgiXV27Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=SDxFAOOE; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="SDxFAOOE"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so871217b3a.1
        for <regressions@lists.linux.dev>; Thu, 17 Oct 2024 07:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1729173911; x=1729778711; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3b9WTpgaEfQ62qsPZIMgsRHEUWTtDopign4ULhcO2Y=;
        b=SDxFAOOED2e9lXwfCfc+upHq+gfOpv9Ngd1WhrH3huSIP8JomcSpLNuEy6pHPKkuoA
         xfVw6RQViZUkQIz9QgjeLjLeGxRX6OzATC6O10Q6zsMjtZr7EonxFdJLlMd1CVgkl6dV
         Jc+3Jj025NDZqdjqRGUICT4tcIMoySgQ1ip5j5RPRXTkN3dbeANjiaHvwd1OKrAPOF7x
         eVRWIyX8aR9NMY12ZQtUhwN6Ao5eXEchrn64y8d151HFoaYF5ud/G81EbJXgv/kcZ+Rx
         4aN8THx1FVURseU4+msp7koG85mU1TnoJ9FOuTngJ1HlQ60VVoxtpSySTqB0dS0AupJC
         Ulmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729173911; x=1729778711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3b9WTpgaEfQ62qsPZIMgsRHEUWTtDopign4ULhcO2Y=;
        b=lE85ZyrrScMy7N+ZcnbQqf2inMWB6xDac/PTZ9zWiQOgIRoWc/K3wqJsgAtBzwwofH
         swQxouozBTUuR1Gl+nGeulwORMPLmMsyhWcG296LHRdkD/vnU0oiSqo3yo1eAtwDnoeP
         gess/TpyEXrbi72T8Q0mWQrWdcHykEmw1Eo6vVXuhy1lk8H0ynQjoycnwl3HtqerG8PL
         xd1YUXbb7K8HOhEWdiHs8hQGBsncGZhDIb605iR0BFoXlp7e4ApXTMdJjWjGyzs861fA
         Iz69w2cVdukSDMT4Pc/Xkw3HNnRWO6zqQEKbIvHxzF6PvON007OX69XOQdy10QF9s0fu
         rUPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtSesktumIvEaV4P6ZqrFrnltGk4My2iBpEsXMGvzcnHk/zIXeUI1xvx8C8qRxy7ONDsfuJB2qawNPsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHVw3bzJCJWOI5BzpFPqtuIDGD6PoXdSa4E3qk6T4K8BOts4ME
	dAVRpo+49EvUmOoUKEmMvZ/hc5S8ss/wqONsOIRLktNdHwWwqkm3S3GBR/j9mxg=
X-Google-Smtp-Source: AGHT+IE826OH5Qi8TBuZE8FFeZ78wE+lMdNZpV3vFd7r+PlC14bgo6QWYfG3qrQ7sSNf8eB2EMFBjQ==
X-Received: by 2002:a05:6a00:929e:b0:71e:768b:700a with SMTP id d2e1a72fcca58-71e7db05c3amr13164700b3a.23.1729173910861;
        Thu, 17 Oct 2024 07:05:10 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773ea180sm4923376b3a.90.2024.10.17.07.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 07:05:10 -0700 (PDT)
Message-ID: <3400cf0b-85ca-4ec2-a8a0-c9d75889d573@kernel.dk>
Date: Thu, 17 Oct 2024 08:05:09 -0600
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
References: <5fe1e264-c285-4988-b1e3-46771d07172b@kernel.dk>
 <20240930044313.GAZvosYZF5mHi2OZbC@fat_crate.local>
 <d7aff674-ad92-4a36-9ebf-8d3c42774723@kernel.dk>
 <CC418B80-5ED9-4F64-917F-BA6F94130F83@alien8.de>
 <ad9638b4-0a4a-4cd0-9fcb-2690693da157@kernel.dk>
 <20241009091247.GCZwZJDwFETmN5pEGe@fat_crate.local>
 <77f16324-47e1-41e6-a9e9-2cb7cbc8d14d@kernel.dk>
 <20241010134613.GDZwfapaZ8AKp0n72C@fat_crate.local>
 <842a76fe-3d6a-4846-83da-bb113634b8bc@kernel.dk>
 <13fe104b-d83b-4d6d-a348-1103d402540d@kernel.dk>
 <20241017100257.GAZxDg0VqDAesee00m@fat_crate.local>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20241017100257.GAZxDg0VqDAesee00m@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/24 4:02 AM, Borislav Petkov wrote:
> On Wed, Oct 16, 2024 at 08:34:09PM -0600, Jens Axboe wrote:
>> And then I totally forgot... Got it done now, but it still just hangs
>> after loading the kernel. No output.
> 
> Hmm...
> 
> Let's verify it still actually selects the correct patch. Diff below, it
> should boot with it as it won't apply the microcode and you should be able to
> gather dmesg.

Same thing, doesn't boot, just hangs after loading the kernel.

-- 
Jens Axboe

