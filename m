Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0239814F9F1
	for <regressions@lists.linux.dev>; Sat,  3 Aug 2024 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722700108; cv=none; b=UW7VMLFXJbxywrkYqxrrKvY55dzTfEBVDHqnJEBzlW14zK3or8TfT4WGDlD1rpH5o3KnGPWeYc08A/xcU/gyRl5/A/X63TR/z4nrqgH6DiYYL2p1XIpaphIOaBr3FMc9G6qb1GxBVs2wuzICpSWgnaJodQHq+G1NmWs7Xc2vh+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722700108; c=relaxed/simple;
	bh=fIgR+HLJfTmDAaWxU6LJmI5nlywv/z9jP0Ucwc+N0Cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezvIkLQCcI9tL4X3KDX6aILe/T57N8tu9E+fnVqgZQc97woleTJGUJgMsVwfhc1rj8sH/jQJ8rhIblDhNQzM9gpzAPP2pdKvtEVaZW0C0HkX7pjVeOixprGi2zLg9o0SnYS+QiO/gJk0HDY4b3mm/EtZ4UasZ5M0rAd+ya6wZ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ra/17V55; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ra/17V55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722700103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l31j21mLxNy3zew5HKBy+ii9WMR6iWk+7TgHezIdgjE=;
	b=Ra/17V55yacFynmlhuMJQSqhWJpPxgnA9V1HSKpvl9D7yg4SEUEVGuxQ/1mVdXvBasETec
	atjwOMlXkV4IN60nCVmIbMftVrmmqhKfPVNEC0ak/NZb9D8eCPbG+AR0BRJ3TBgmKl8GA2
	Zr9FDtgzitQhRLrgrvm6X5+FmxKZXwA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629--Xl340t-ODC6gHeVhlFd0A-1; Sat, 03 Aug 2024 11:48:21 -0400
X-MC-Unique: -Xl340t-ODC6gHeVhlFd0A-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7aa5885be3so760222066b.0
        for <regressions@lists.linux.dev>; Sat, 03 Aug 2024 08:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722700100; x=1723304900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l31j21mLxNy3zew5HKBy+ii9WMR6iWk+7TgHezIdgjE=;
        b=YAGicpJQcN5HWeRfZt0XbWqzUe2RcNCGS6By8K8MYVC/isO4Q/j3ku5PliWNLTu0vX
         inDi23L5Y8Zzp3p/pPGWXHo2KwEGcfAQZxyHyybApWTrWNpZZOAy9THa+61ajPMDaVB9
         lJtvDXGJ5K3mh2ZzFQJfnjIsCo9ZxLmyFxGIdXuOmtDQcYsKQ8Lsep2fjwCHL4vQGYMG
         VFmI85dMmMy7pg98DmVp0IN4rdB/WgM27QIjq2Hc+6wtlHHbRa2JyFCQu5AFkmQrRSa6
         NYar1Eh2R9LIZgcGTXPt1Gl+m+HOhBL9bXuu4id0bw6qL3F/Ve/HTzYNcSKyJsvc+dwF
         3loQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvsc+tWT8ZBh5zC6hZRXKF2xKIdcy/Ly//vbYLVUI4e+SD06GD13vti6CIThTbPaJw7BcoLd0OO4HNxwOkh54a6/DSqoXlxDylUng=
X-Gm-Message-State: AOJu0YwOk1a9LRFvtWR9iu27CKeRn/wMPjWvEP2APWIUO0cS08ynMyD/
	19mn1e+Wzn+7mU01fRG3L2TUcI90b6oljCJOW9MmJOakQ+Hwe4l2+bXDK3ZVc70hrcfI5mZSw/S
	m0bY1MGnRTGBH7i18XaeGph+J+hNEonkpHAivu30HxIYIPK9h8VlQZErtk0AU
X-Received: by 2002:a17:907:c291:b0:a7d:e5b1:bf65 with SMTP id a640c23a62f3a-a7de5b1c431mr65340766b.21.1722700100110;
        Sat, 03 Aug 2024 08:48:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgKX5w8FE5x/yWsgpmLhRPClUTzoxmhjH21zbqMY6OyWTdQgVnoHeQBRQi7az8kIYmM+iegA==
X-Received: by 2002:a17:907:c291:b0:a7d:e5b1:bf65 with SMTP id a640c23a62f3a-a7de5b1c431mr65339266b.21.1722700099587;
        Sat, 03 Aug 2024 08:48:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9ec8860sm226968366b.209.2024.08.03.08.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Aug 2024 08:48:19 -0700 (PDT)
Message-ID: <2dd6b8e1-6f06-4ab8-b610-c0bd95a397e8@redhat.com>
Date: Sat, 3 Aug 2024 17:48:18 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.11/regression/bisected - The commit c1385c1f0ba3 caused a new
 possible recursive locking detected warning at computer boot.
To: Thomas Gleixner <tglx@linutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, linuxarm@huawei.com
Cc: rafael.j.wysocki@intel.com, guohanjun@huawei.com, gshan@redhat.com,
 miguel.luis@oracle.com, catalin.marinas@arm.com,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Bowman, Terry" <Terry.bowman@amd.com>
References: <CABXGCsPvqBfL5hQDOARwfqasLRJ_eNPBbCngZ257HOe=xbWDkA@mail.gmail.com>
 <20240723112456.000053b3@Huawei.com> <20240723181728.000026b3@huawei.com>
 <20240725181354.000040bf@huawei.com> <87le1ounl2.ffs@tglx>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87le1ounl2.ffs@tglx>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/26/24 6:26 PM, Thomas Gleixner wrote:
> On Thu, Jul 25 2024 at 18:13, Jonathan Cameron wrote:
>> On Tue, 23 Jul 2024 18:20:06 +0100
>> Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:
>>
>>>> This is an interesting corner and perhaps reflects a flawed
>>>> assumption we were making that for this path anything that can happen for an
>>>> initially present CPU can also happen for a hotplugged one. On the hotplugged
>>>> path the lock was always held and hence the static_key_enable() would
>>>> have failed.
> 
> No. The original code invoked this without cpus read locked via:
> 
> acpi_processor_driver.probe()
>    __acpi_processor_start()
>        ....
> 
> and the cpu hotplug callback finds it already set up, so it won't reach
> the static_key_enable() anymore.
> 
>> One bit I need to check out tomorrow is to make sure this doesn't race with the
>> workfn that is used to tear down the same static key on error.
> 
> There is a simpler solution for that. See the uncompiled below.

I was seeing the same lockdep issue as the original reporter on my
AMD Ryzen 9 5950X machine and I can confirm that the suggested patch
(below) fixes this:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
> diff --git a/arch/x86/kernel/cpu/aperfmperf.c b/arch/x86/kernel/cpu/aperfmperf.c
> index b3fa61d45352..0b69bfbf345d 100644
> --- a/arch/x86/kernel/cpu/aperfmperf.c
> +++ b/arch/x86/kernel/cpu/aperfmperf.c
> @@ -306,7 +306,7 @@ static void freq_invariance_enable(void)
>  		WARN_ON_ONCE(1);
>  		return;
>  	}
> -	static_branch_enable(&arch_scale_freq_key);
> +	static_branch_enable_cpuslocked(&arch_scale_freq_key);
>  	register_freq_invariance_syscore_ops();
>  	pr_info("Estimated ratio of average max frequency by base frequency (times 1024): %llu\n", arch_max_freq_ratio);
>  }
> @@ -323,8 +323,10 @@ static void __init bp_init_freq_invariance(void)
>  	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
>  		return;
>  
> -	if (intel_set_max_freq_ratio())
> +	if (intel_set_max_freq_ratio()) {
> +		guard(cpus_read_lock)();
>  		freq_invariance_enable();
> +	}
>  }
>  
>  static void disable_freq_invariance_workfn(struct work_struct *work)
> 
> 
> 

