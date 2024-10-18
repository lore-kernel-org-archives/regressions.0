Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CD420371D
	for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729270060; cv=none; b=KetTdvf6zKUu12Q/IhWs5xHXcm/RQ21RmoX3oKbUrkujufRjcXcGwpILfxx8QcYy1VGbMWtUlt8x44xFTlqPld+NI7rbFjnHbIYUUWKX/eUUQlM8z3lHA9V7eQNR+TFSTXU4q4OIIb3DAxkX3vt8wAeVzRD+3NFuDcO4cjR1Xew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729270060; c=relaxed/simple;
	bh=xOigHZi6vJGJCP887ppV80pj6xxRD92G/nmgaWkqArE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fqcy54YZOyFvh7lSRgtqFNblxzyoiNTQOtT64Z1LyFUEsMrTRjeLHlATyLbOwA1OpI+x5p1t+f24lFftr2ltAqgeFcxZNLtIP4LAMkdiEuh8fZnJE+mVFnJUh9260Fta5yVaaxcSVov3zasFcP3g8IzQP/oon562IzdV/9+uWR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=TDS6nocJ; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="TDS6nocJ"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-8323b555a6aso132744339f.3
        for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 09:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1729270057; x=1729874857; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1xrAsGY1eEGZc5Yu+CpN7tXZ0WTm20eWqNXI9YXSfRI=;
        b=TDS6nocJNL+ihtbINR4bwQCG1EvS90jLRJik8hgQVWN5rzaYlge9d41bARKVPWXGoM
         9OlzkuhYaRdt8U545sP2wnGApEz2L2+TQ3uyDsnGZ1ThGWuWxVQJ2gOG4m1tREoRuml9
         IvXMOJjWFWvB5SeNIvPCYRHF4pMxZbiKKMhy6/vpXxJROEVciS5ETI5x/CWaU9IHJlX8
         t6fEF+OE1/m8NDZZtFtO1oaxnTM7Kbu7TbjTcOTLwp45Htk6+OCHvzxs2liJQ40XmQuC
         no0k+IPoVlWZ1W8I38/7tobWNZggCWvJbxJO07bgtxivilzNa/qyB7MLAt8lAWiZoezO
         Vyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729270057; x=1729874857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xrAsGY1eEGZc5Yu+CpN7tXZ0WTm20eWqNXI9YXSfRI=;
        b=okLsyZD5cvk5+rLp5yknG8Ute2bnasgs2UzIl65dBs0GmvfvAXClnwEhj6gM7imuTQ
         WUolD6/gumyID/SkOzyx4Nv2RQGMmEwo2sPHPz3S69xgEScZub9MgmRfb+jlDXGmuMPS
         KxGVlVh7xeMT/M29YExOt8moBvXuq8xAmfeW2MHaNUKf4iOzT5ANCt2VOwmD7MivKF8d
         viotZimBzJsGxe6qTdJI6dnK2hgro+jRxY0gqiH7WznOLq8fCPJtLnG6h0bWH9i1BjQg
         7dQSEm4FqOmd1Sl+2ag3zSE485M1b1Z1ztlwOXRXqXiC3+aw2vXHS+Vn0N00ju8aGgzX
         IRww==
X-Forwarded-Encrypted: i=1; AJvYcCX67RtVXIijP0+VZTZ3kruaFosD+YZn0JDBq7Mw9xYEzpCQ5rIfmn7E1WPdPbE/fQPtnmde9TpmGuuJ3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg8N8J4w0dCvEzVgzlICN2U7+RZDlDSvEGfZejLLndJH66ZUCG
	nKyYJWq1RjVK1bjmkcPdqsdkMoWMloF3DMscza8rlQShpV0H6K1OxOWFyiGJAm0=
X-Google-Smtp-Source: AGHT+IGRZ5eg+vk3mqFXMeZHbFvptacsGMvZAkLKGH1anWYrHQLxW0thEDoHSVJdXnmUIcdGae9biQ==
X-Received: by 2002:a05:6602:2b8d:b0:82c:e4e1:2e99 with SMTP id ca18e2360f4ac-83aba64bf11mr384868939f.11.1729270057395;
        Fri, 18 Oct 2024 09:47:37 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc10c4efb1sm487582173.155.2024.10.18.09.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 09:47:36 -0700 (PDT)
Message-ID: <aaf25389-e0c3-408a-ae05-a166c1720bf8@kernel.dk>
Date: Fri, 18 Oct 2024 10:47:35 -0600
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD zen microcode updates breaks boot
To: "Dr. David Alan Gilbert" <linux@treblig.org>,
 Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20241017100257.GAZxDg0VqDAesee00m@fat_crate.local>
 <3400cf0b-85ca-4ec2-a8a0-c9d75889d573@kernel.dk>
 <20241017141314.GDZxEbenNT6XF4jIaA@fat_crate.local>
 <4d4bf52a-dd91-48ad-8949-198b2ffbc9da@kernel.dk>
 <20241017142707.GEZxEeu3YHvnEMmd32@fat_crate.local>
 <a395a18b-3478-45dd-aabd-ccc9d0851318@kernel.dk>
 <20241018115857.GBZxJNgZY-NedtPrxX@fat_crate.local>
 <20241018124943.GDZxJZZxtwA9O9eqiU@fat_crate.local>
 <79296353-1fa3-458a-b055-88bc6a772180@kernel.dk>
 <20241018155143.GIZxKED9YcF0Jg1CWZ@fat_crate.local>
 <ZxKQux4I8We0Ax3-@gallifrey>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ZxKQux4I8We0Ax3-@gallifrey>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/18/24 10:45 AM, Dr. David Alan Gilbert wrote:
> * Borislav Petkov (bp@alien8.de) wrote:
>> On Fri, Oct 18, 2024 at 07:30:15AM -0600, Jens Axboe wrote:
>>> At least on mine, the BIOS has an option that says something like "L3
>>> cache as numa domain", which is on and why there's 32 nodes on that box.
>>> It's pretty handy for testing since there's a crap ton of CPUs, as it
>>> makes affinity handling easier.
>>
>> Right, so two boxes I tested with this:
>>
>> * 2 socket, a bit different microcode:
>>
>> [   22.947525] smp: Brought up 32 nodes, 512 CPUs
>>
>> * your CPU, one socket:
>>
>> [   26.830137] smp: Brought up 16 nodes, 255 CPUs
> 
> (Probably unrelated but...)
> What happened to number 256 ?

Quick guess, maybe iommu was off, will cap it to 255. IIRC...

-- 
Jens Axboe

