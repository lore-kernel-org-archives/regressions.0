Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64FE13DDAA
	for <regressions@lists.linux.dev>; Mon, 29 Jul 2024 11:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722253225; cv=none; b=X/aZJZscLCqCdq9iHgFLYMERc9/OCD2/78P0etvNMwYjfPAmJ3g5kHkGCvkLDPVLnVoPX5SGQ+IaIE7/0caXwiAXvETnJYU9xXd1yM3fgq5ec3nzjBnOhWgs3YCx3nFKgsMEL+tXGdYZWEJcrMQSg3Hnd5xsZaXvZJts7sUimB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722253225; c=relaxed/simple;
	bh=u6PeKF92llI1DdNMZvjP1sdulzCRGYxmKMJErbhj+wU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OrzzNXXcm5PfBQsUb+RdgtV4MRagw1f8XgnPPwg8+sI6x8AoyzO5lcKbrI4qyxGYkhz2/gYKZUiIG1Xd7PSUhDXzHCC8oEUrUN9gzoovJkuj4Z09AHbopFG3BY0CZEs6VvzoowyPddJNKXgOOe3AZf72gMIeW5G7fcTS5Y7RH7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DeMed2O3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KnHBcMJh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DeMed2O3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KnHBcMJh"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722253216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=94M1ZHgpWiyBrLavpWVI1M/6xVg1GAI3Q3mDFVuUqsU=;
	b=DeMed2O3bIGHSsOeMP2yVVapGbMCQoMEtCp1rFpDSafgSOc78P5nYbHoTVpmLP3n5dfRHU
	+Z6BpbtQigjY7JU0i4GtWPK349Q2YAeTA0BVz13fysqPxfkVPR+xR1r8BbBpAPzFHNSH00
	NTHkRr2t1vFyCHJa2emRHRtSlK44pvQbxPQm7NuWWP883OyKTJiT0EEEGnbc4hKKUA0dyp
	W27KCJnO6YNv7x7VSnd0/gDV5MYspCvKK1K1TNkBJMvjftR8vGc2K3O6MIGGMu5zvNIVtN
	YHe9UEOcG3sd5C7lytW/8Znf/dESpZhOzXlwcBCzlWDuLV1gFmDIEc7HClqflA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722253216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=94M1ZHgpWiyBrLavpWVI1M/6xVg1GAI3Q3mDFVuUqsU=;
	b=KnHBcMJhHHOX/OiJv7nWbU1GdA2qpdn3yHzkqY5SZonany/sgX/UIb2D8YZbkwRfpse2DP
	eB+AgzX156FjotAw==
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Mikhail Gavrilov
 <mikhail.v.gavrilov@gmail.com>, rafael.j.wysocki@intel.com,
 catalin.marinas@arm.com, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Terry.bowman@amd.com
Cc: linuxarm@huawei.com, guohanjun@huawei.com, gshan@redhat.com,
 miguel.luis@oracle.com, Linux List Kernel Mailing
 <linux-kernel@vger.kernel.org>, Linux regressions mailing list
 <regressions@lists.linux.dev>, shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH] x86/aperfmperf: Fix deadlock on cpu_hotplug_lock
In-Reply-To: <20240729105504.2170-1-Jonathan.Cameron@huawei.com>
References: <20240729105504.2170-1-Jonathan.Cameron@huawei.com>
Date: Mon, 29 Jul 2024 13:40:15 +0200
Message-ID: <87ikwo8m00.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jul 29 2024 at 11:55, Jonathan Cameron wrote:
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

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
