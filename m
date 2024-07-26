Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4916217D35C
	for <regressions@lists.linux.dev>; Fri, 26 Jul 2024 18:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722016886; cv=none; b=tn8FNhu8WUmKzRwcUI9BzmbxlVBNyYjdYbQBLOTt3SEkY5URaAsbZ/idm46rbbOt/6idpKEDK7yrQKzOmxdSykeac/KjJFBz6mRUwvUcQ/BVNdDA4HCk4okQQL+cLPZfHwKP2/hM/mk6rt3N6rWlq9qzsy5sxBJwLw2cHAyud/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722016886; c=relaxed/simple;
	bh=fsPOQi8hZSnAkVNEphoW3BG3NXknge1cg+UsCj3f5rQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ut58JfVXiaVVrtTC7IyppyojmHYiFDLtyu4G0CMbwSfC9rt3iW4RdxKgpGRZIqO8Gm/6fKtk/RE/q+JR0FnK0tX69+JHv+k6ZGN1h6d6UfV0rUEVuejU5AyvIn3lw5Ahsn+JW4hpK9TxZTNetWW+Xe5jtfIFpXJqHjFMVKSRrVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WVwWD4kNgz6K5rw;
	Sat, 27 Jul 2024 01:59:36 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 46C62140C9C;
	Sat, 27 Jul 2024 02:01:21 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 26 Jul
 2024 19:01:20 +0100
Date: Fri, 26 Jul 2024 19:01:19 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, <linuxarm@huawei.com>,
	<rafael.j.wysocki@intel.com>, <guohanjun@huawei.com>, <gshan@redhat.com>,
	<miguel.luis@oracle.com>, <catalin.marinas@arm.com>, "Linux List Kernel
 Mailing" <linux-kernel@vger.kernel.org>, Linux regressions mailing list
	<regressions@lists.linux.dev>, Ingo Molnar <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Bowman, Terry"
	<Terry.bowman@amd.com>, Shameerali Kolothum Thodi
	<shameerali.kolothum.thodi@huawei.com>
Subject: Re: 6.11/regression/bisected - The commit c1385c1f0ba3 caused a new
 possible recursive locking detected warning at computer boot.
Message-ID: <20240726190119.00002557@Huawei.com>
In-Reply-To: <20240726181424.000039a4@Huawei.com>
References: <CABXGCsPvqBfL5hQDOARwfqasLRJ_eNPBbCngZ257HOe=xbWDkA@mail.gmail.com>
	<20240723112456.000053b3@Huawei.com>
	<20240723181728.000026b3@huawei.com>
	<20240725181354.000040bf@huawei.com>
	<87le1ounl2.ffs@tglx>
	<20240726181424.000039a4@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Fri, 26 Jul 2024 18:14:24 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Fri, 26 Jul 2024 18:26:01 +0200
> Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> > On Thu, Jul 25 2024 at 18:13, Jonathan Cameron wrote:  
> > > On Tue, 23 Jul 2024 18:20:06 +0100
> > > Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:
> > >    
> > >> > This is an interesting corner and perhaps reflects a flawed
> > >> > assumption we were making that for this path anything that can happen for an
> > >> > initially present CPU can also happen for a hotplugged one. On the hotplugged
> > >> > path the lock was always held and hence the static_key_enable() would
> > >> > have failed.    
> > 
> > No. The original code invoked this without cpus read locked via:
> > 
> > acpi_processor_driver.probe()
> >    __acpi_processor_start()
> >        ....
> > 
> > and the cpu hotplug callback finds it already set up, so it won't reach
> > the static_key_enable() anymore.
> >   
> > > One bit I need to check out tomorrow is to make sure this doesn't race with the
> > > workfn that is used to tear down the same static key on error.    
> > 
> > There is a simpler solution for that. See the uncompiled below.  
> 
> Thanks.  FWIW I got pretty much the same suggestion from Shameer this
> morning when he saw the workfn solution on list. Classic case of me
> missing the simple solution because I was down in the weeds.
> 
> I'm absolutely fine with this fix.
Hi Thomas,

I tested it on an emulated setup with your changes on top of
mainline as of today and the issue is resolved.

Would you mind posting a formal patch? Or I can do it on Monday if that's
easier for you.

Thanks

Jonathan

> 
> Mikhail, please could you test Thomas' proposal so we are absolutely sure
> nothing else is hiding.
> 
> Tglx's solution is much less likely to cause problems than what I proposed because
> it avoids changing the ordering.
> 
> Jonathan
> 
> 
> 
> 
> > 
> > Thanks,
> > 
> >         tglx
> > ---
> > diff --git a/arch/x86/kernel/cpu/aperfmperf.c b/arch/x86/kernel/cpu/aperfmperf.c
> > index b3fa61d45352..0b69bfbf345d 100644
> > --- a/arch/x86/kernel/cpu/aperfmperf.c
> > +++ b/arch/x86/kernel/cpu/aperfmperf.c
> > @@ -306,7 +306,7 @@ static void freq_invariance_enable(void)
> >  		WARN_ON_ONCE(1);
> >  		return;
> >  	}
> > -	static_branch_enable(&arch_scale_freq_key);
> > +	static_branch_enable_cpuslocked(&arch_scale_freq_key);
> >  	register_freq_invariance_syscore_ops();
> >  	pr_info("Estimated ratio of average max frequency by base frequency (times 1024): %llu\n", arch_max_freq_ratio);
> >  }
> > @@ -323,8 +323,10 @@ static void __init bp_init_freq_invariance(void)
> >  	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
> >  		return;
> >  
> > -	if (intel_set_max_freq_ratio())
> > +	if (intel_set_max_freq_ratio()) {
> > +		guard(cpus_read_lock)();
> >  		freq_invariance_enable();
> > +	}
> >  }
> >  
> >  static void disable_freq_invariance_workfn(struct work_struct *work)
> > 
> >   
> 

