Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545685;
	b=Y/NxprJXgregWbYvlHfoXFmze8ZPeuZzBFHlLVK8ALgyXXSXBnDxQ6+Rhrk1L8xjF2SD
	 +smYIxRUdoRLfUb+xuDjmoFqC8xPWQ2Dc1qbRgTkMRyY2ghgBmchFyUXGZLo5UgiIjOLR
	 iczrWPheuIQeW270cQxarpk4U4kDbjKf1groP16IIo2Wmfijco4Uog/Cd15CE/xUnWh1D
	 VhGP/S2FUJHJP2wleer/erWBvU3cp84SCH+SyLipF58zcwaWzDMheI+YGOKX0zgBvDp/c
	 3pKVbZnGoMadXkPkbZQKLU0vukulBzT5GRS/frgJuiB0MILp+mByX/e+moUUTbjLR6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545685;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cyO2jPByXYN8pYPCmp71/uufHPRg/wGpWfA7IftFhZ0=;
	b=m8tLgtpWP4s/DKfLtP/BsA5UPx3zs2kyR0TbX2DnRkGm6Qz1C/N98OPOlCQnIu0aeBbl
	 UJaIXevyXGYrSiy8G6bTisNKpdXKsmmF9KlBDIHj8bm+hSON0sbw04XOZVSTR0keD6t/t
	 5TnNdOyQP5TuE7lRORSzDfMj2uHz0q36y/aY2GwPv0PMyRD0EdKIyi2HnZoHHHoYSPjR8
	 1VBZLrWh7c6LcKm4e0EOFL7aIsPdmpyLUTbA1om0nEMk4faw2yhA/fiRWnj33ib8FIwA0
	 6yecVYwnFnMM3i08Kmf/UktCu1Bx0DT2tAB1SR4M0ojVMSiQaMquS06JrtO8zkD0tGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=upmx746P;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152DA606A321
	for <regressions@lists.linux.dev>; Tue, 24 Nov 2026 18:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 152DA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=upmx746P
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B14D339;
	Tue, 24 Nov 2026 10:41:21 -0800 (PST)
Received: from [10.57.72.178] (unknown [10.57.72.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB5233F86C;
	Tue, 24 Nov 2026 10:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795545684; bh=qAIeeQEJhH5riHNs9KTeEu719Serj5lraRaIcwOnSzw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=upmx746PYjGwCrJLZJXl0DdLIApNw14ng5Yx4wvKRnLnjmpuBdfijDYws/SE2gN42
	 2Y8m3owZo+Ca44SKmLPoi3Wor2QQ/rwnDHBz8YsqX78BQUpBfpMUPEfbJ5inWGvFk+
	 xO+tqGD5h2GSOYL61klCSQAlhv0/Zp1zUGN0C798=
Message-ID: <cea5c1cb-5bad-49ea-88c7-bbf1cf6e02fb@arm.com>
Date: Tue, 24 Nov 2026 18:41:19 +0000
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] sched/fair: SIS_UTIL limit in select_idle_capacity()
 leaves busy tasks on little CPUs while big CPUs are idle
To: Vincent Guittot <vincent.guittot@linaro.org>,
 James Buck <jbuck2005.linux@outlook.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Andrea Righi
 <arighi@nvidia.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Valentin Schneider <vschneid@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
 <CAKfTPtDBk=V+ApVCxGHQ0A+juE-rwid-hBxAF_KoeXbg4Vn5nw@mail.gmail.com>
From: Christian Loehle <christian.loehle@arm.com>
Content-Language: en-US
In-Reply-To: <CAKfTPtDBk=V+ApVCxGHQ0A+juE-rwid-hBxAF_KoeXbg4Vn5nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/26 15:18, Vincent Guittot wrote:
> On Tue, 24 Nov 2026 at 12:56, James Buck <jbuck2005.linux@outlook.com> wrote:
>>
>> Hi,
>>
>> Since commit 61ea17a63719 ("sched/fair: Add SIS_UTIL support to select_idle_capacity()"), first in v7.2, CPU-bound multi-threaded work on my big.LITTLE arm64 board runs 12-19% slower than on v7.1 and earlier, because waking threads are placed on idle little CPUs while idle big CPUs are never looked at.
>>
>> Turning SIS_UTIL off at runtime restores the old speed. select_idle_capacity() and update_idle_cpu_scan() are unchanged in v7.4-rc4, so I expect mainline to behave the same.
>>
>> #regzbot introduced: 61ea17a63719
>>
>> System
>> ------
>> Orange Pi 6 (CIX CD8180 "Sky1"), 12 CPUs in five clusters, ACPI boot, no SMT:
>>
>> CPUs     capacity
>> 0-1       1024
>> 2-5         279   (little)
>> 6-7         905
>> 8-9         866
>> 10-11     984
>>
>> The firmware's PPTT gives one MC domain over all 12 CPUs. It has SD_ASYM_CPUCAPACITY(_FULL) and SD_SHARE_LLC, with a CLS domain per cluster below it. The kernel is v7.3.5 plus the out-of-tree Sky1 SoC
>> driver patches the board needs to boot. None of them touch kernel/sched/; the only one in drivers/base/arch_topology.c adds a helper that updates capacity_freq_ref when boost is toggled.
>>
>> Workload
>> --------
>> llama.cpp llama-bench, Qwen2.5 1.5B Instruct Q4_K_M, CPU only, 8 threads, pp512 / tg128, tokens/s:
>>
>> 6.18.64                           123.5 / 36.5
>> 7.3.5                               109.0 / 29.5
>>
>> 7.3.5, taskset to the 8 big CPUs   121.4 / 34.7
>> 7.3.5, NO_SIS_UTIL at runtime     122.1 / 35.9
>> 7.3.5, patch below                       121.7 / 35.7
> 
> I have something similar on radxa O6 and 7.4-rc4 with latest tip/sched/core
> - 7.4-rc4+tip : 124.4
> - 7.4-rc4+tip NO_SIS_UTIL at runtime : 136.3
> 
> I'm surprised that the newly_idle and/or periodic load balance doesn't
> pull the tasks earlier onto a mid/big core. It takes around 15/20ms to
> migrate a long-running thread to a bigger core when it runs on a
> little core whereas misfit should trigger an active load balance at
> next tick. I wonder if the Cluster level could slow down this
> migration.
I can reproduce the same on Pixel6 without any CLS, affecting CPU7 then.
The patch James posted it restores the good behavior and I currently don't
see a way to not do the full scan in select_idle_capacity().
