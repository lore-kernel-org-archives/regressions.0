Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B27C139D
	for <regressions@lists.linux.dev>; Tue, 30 Jul 2024 00:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722301184; cv=none; b=Va+WqdGnpCt5gNXh3O1yBGKwWWew8f1ERV21G6V4+kx4Qae7i3IOE0OPpeUvC/Cz10RmG5j8vRIQg/tJuuudjM1+Eg5Mpi3n8YQG2E7BgJ/1RqsXLJ7uKWvOEPOZS7pkflmEbDsH0kS9Zmt2AP/FthDgm222K0NAtu0V41bvd0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722301184; c=relaxed/simple;
	bh=hCqS+gATuiSNsPHqmsj3ZpZ+hs+LXgdx1d7Z/zn+hyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfViCE9XMF3f6Jk44LikFI1g/Uh34nLnkMN/FulkTK3ewZIjQ3pfQtjGxbB+5qt+poBjwTtij8h/E3lhZQxywfNZHC7QiwkCXuWorhOIthCY4wB31HkTBHzuqwncAPGsOORPm30Vn5/jJK+Yyx8QQ2yQ3x4jQn7CBoZeba73RH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MS062Onl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MS062Onl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722301180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wlQLbFShtGMFNw4a9BwZ9YXN8ivenvafdtuakdDThQo=;
	b=MS062OnlohkXfa/fT8NhLQTDQlKgM516Sf5tJUNiu9fdloC++ZqGnwW+4D23A+avkxG1D5
	Bu2jAGXSfz1f0v85P7v55bBo13xNlCmGG8p1TKzcDWIkVk0PEpVP997UgoGNlukH8b/FzP
	LU7u44gGAzUAAWvFUrZgcPlkaG51o18=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-p58NJlBPO2-9Fmxe4AGpag-1; Mon, 29 Jul 2024 20:59:38 -0400
X-MC-Unique: p58NJlBPO2-9Fmxe4AGpag-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-7a267d9e7b0so2768037a12.2
        for <regressions@lists.linux.dev>; Mon, 29 Jul 2024 17:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722301178; x=1722905978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlQLbFShtGMFNw4a9BwZ9YXN8ivenvafdtuakdDThQo=;
        b=r7OVDoQOR28kBc/H3HO4KmLGwLdiUekAQBHSS554C3g9Zzvo5TTwXTD4fgEwgEGtex
         fmXXQ/HYbpsr+aKwgz1JVX4NEj/4mePg9DtAr1Y0yNfrHHPXGRY+HfIzSRNtkaLXObmT
         axc128xa24wwVfXPZYa10vHxeUsQoHSxgvcv2ddrs8M2NKteyFqN5NYnmWTxgXh/2/BH
         z3zr/ImxN3JkMTYv/8fVeH4qEOVFZW1iQPHeUDK6S68QLvc1U9VZqH4Z0Zfd+mPRJBys
         v7JwZR8RTkfrGGJiBVkMzdm9TwGfpOV6AeyIq2FYyC67LgBRewucKa0sQ1TGy89Zya3/
         JR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoDtm8EKvjdvGqK03c59thLxKznpfL3CgDIW55mkjLFbtXDu+lMg1si/7gqu5ML6fvSdikIREnkak5wNCZVhJglgRbhdQTTlL/ajs=
X-Gm-Message-State: AOJu0YzPnZacHQNrRM7o7DK1R6z72EreIkkRaU7Z3evF1Cfsiw3hekAm
	JDjmuHJR6BEdFo2GiV066iP6ic1kFNaJZt/CZ7OSl2GcW9gNb97m98RGLLW7RGNNqB2qmgXg82J
	HoSE8JHIr6fG/RKeXitSUG7kvIciK6D6Nb9/SFrjWpduLE2tlUEOKYgzqmHri
X-Received: by 2002:a05:6a20:9f8c:b0:1c0:e4d6:9c05 with SMTP id adf61e73a8af0-1c4a130df35mr8584754637.32.1722301177770;
        Mon, 29 Jul 2024 17:59:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5zoRfUcqcon+k8GME2L0SdMCToEh9aYEGehCVh/L5s1baauFlHQ6qI225tH+ayi+XLEyYDg==
X-Received: by 2002:a05:6a20:9f8c:b0:1c0:e4d6:9c05 with SMTP id adf61e73a8af0-1c4a130df35mr8584727637.32.1722301177165;
        Mon, 29 Jul 2024 17:59:37 -0700 (PDT)
Received: from [192.168.68.54] ([43.252.112.134])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f9fbd256sm6627844a12.58.2024.07.29.17.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 17:59:35 -0700 (PDT)
Message-ID: <280d48b0-d915-4130-8aa1-53395ef6d4ab@redhat.com>
Date: Tue, 30 Jul 2024 10:59:28 +1000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/aperfmperf: Fix deadlock on cpu_hotplug_lock
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, rafael.j.wysocki@intel.com,
 catalin.marinas@arm.com, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, Terry.bowman@amd.com
Cc: linuxarm@huawei.com, guohanjun@huawei.com, miguel.luis@oracle.com,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 shameerali.kolothum.thodi@huawei.com
References: <20240729105504.2170-1-Jonathan.Cameron@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240729105504.2170-1-Jonathan.Cameron@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/24 8:55 PM, Jonathan Cameron wrote:
> The broken patch results in a call to init_freq_invariance_cppc() in a CPU
> hotplug handler in both the path for initially present CPUs and those
> hotplugged later.  That function includes a one time call to
> amd_set_max_freq_ratio() which in turn calls freq_invariance_enable() that
> has a static_branch_enable() which takes the cpu_hotlug_lock which is
> already held.
> 
> Avoid the deadlock by using static_branch_enable_cpuslocked() as the lock
> will always be already held.  The equivalent path on Intel does not
> already hold this lock, so take it around the call to
> freq_invariance_enable(), which results in it being held over the call to
> register_syscall_ops, which looks to be safe to do.
> 
> Fixes: c1385c1f0ba3 ("ACPI: processor: Simplify initial onlining to use same path for cold and hotplug")
> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Closes: https://lore.kernel.org/all/CABXGCsPvqBfL5hQDOARwfqasLRJ_eNPBbCngZ257HOe=xbWDkA@mail.gmail.com/
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>   arch/x86/kernel/cpu/aperfmperf.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

