Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4EA1EEA5D
	for <regressions@lists.linux.dev>; Fri, 14 Mar 2025 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964830; cv=none; b=ZQDAgzzd0NpASKbfaefAWeHVJwv/4Le4X52jMX1q0Gl0OvvEda/ez6jZOnioIS5VDTpEEFQJ2cP1NfQDZaM+Ljk/fgmad9/FwfqjCmfAS7UTZoWYU+JInb4oYY6spyJsJBPrRDAxJY33bVXtwEE/OHKbjAf22KGlzNy+tdA64VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964830; c=relaxed/simple;
	bh=FnPbCoy33AjOrz1MVB9uPnmzBz6MWp6J0dOlJuALjCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPAG77nq0wG0tS0ZkAMEonLARQzH5IXVcCjZuQio9ARtDl3USpA643PhKosyIoCmLVHoxVo1fMDlTf5m1PF3UoKMJhqM9/FWULYpJOP2Jut1DF6AkYzOOqFVXpoqEjio4+8DLdZGnfJN1I7ywX4krN0Bo3Nv3bvZKZZ6OfLiwcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZpKJZCP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZpKJZCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741964828; x=1773500828;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FnPbCoy33AjOrz1MVB9uPnmzBz6MWp6J0dOlJuALjCY=;
  b=fZpKJZCPdZu5KbtqGXyQqrVIMFMqAYeqAIG6vPjeeVycka+3LuXsvjr7
   LRRHwZFuxwb2MXmIb1CNUPjgDFd+GwVBzjEB4GymvQG+6nLgoUwZbXYgd
   60b1anS7P54X/QVNw2ms5XJUag56B6VNgp59HNfs8jesLIubLJeG1KJFa
   qYXKDmwtGx9UQ4Ic+bhkyVkuUmkzuYdao+isIeEg4WPRIsRJ6nrRYzaaJ
   m+P4jG4dcxswATPSPIOdUT20NIz0kxiNEOLV561+dbRMGcOSHOH8faoU6
   pJwIvx9deKQbqYY/KU9zx/dR7sXPnfxOLWbUlWZqyY39tMlS/lYIvtLWM
   Q==;
X-CSE-ConnectionGUID: mfJFzPWRTu2H2H+GX2ZCQQ==
X-CSE-MsgGUID: vjQ0q1daRqumZXcmZxpugA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="60659107"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="60659107"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 08:07:08 -0700
X-CSE-ConnectionGUID: SOcHPCYQTeWehVJypVZuXA==
X-CSE-MsgGUID: qNXLVwo9T3uFmsj1LNHfDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126516083"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [10.125.108.155]) ([10.125.108.155])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 08:07:07 -0700
Message-ID: <09401d9f-6a5f-40d7-ac3c-e149ef57bcfd@intel.com>
Date: Fri, 14 Mar 2025 08:07:06 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] x86: kernel 6.12 crashes during
 get_xsave_addr_user on Apple Virtualization
To: Akihiro Suda <suda.kyoto@gmail.com>
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Linux x86 <x86@kernel.org>, aruna.ramakrishna@oracle.com, tglx@linutronix.de
References: <CAG8fp8QvH71Wi_y7b7tgFp7knK38rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com>
 <3f4758be-df0e-44f3-b259-af02a2d7b3b3@intel.com>
 <CAG8fp8S92hXFxMKQtMBkGqk1sWGu7pdHYDowsYbmurt0BGjfww@mail.gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <CAG8fp8S92hXFxMKQtMBkGqk1sWGu7pdHYDowsYbmurt0BGjfww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/13/25 23:22, Akihiro Suda wrote:
>> The warning here seems to be because the kernel thinks protections keys
>> is enabled (X86_FEATURE_OSPKE) but also thinks XSAVE management of
>> protection keys is _dis_abled. That's a valid hardware configuration,
>> but it's a configuration the kernel never expects to see.
> Right.
> The VM seems missing XSAVE feature 0x200: 'Protection Keys User
> registers', while it has ospke in cpuinfo.
> This configuration seems still weird, as both features seem missing on
> the macOS host.
> (See `physical-macos-host.txt`)

Yeah, so the CPU is enumerating support for protection keys but missing
XSAVE support for managing PKRU. We've envisioned the _reverse_
situation before, but not this specific scenario.

One option is to do nothing. Throw up our hands and declare the VMM so
broken that it's silly to go chasing a fix.

Another way to fix it is to throw this hunk in somewhere:

	if (!fpu_kernel_cfg.max_features & XFEATURE_PKRU) {
		setup_clear_cpu_cap(X86_FEATURE_PKU);
		setup_clear_cpu_cap(X86_FEATURE_OSPKE);
	}

but that's PKU-specific.

There are other features that would have similar issues if the VMM did
something similar for them, like:

        [XFEATURE_PASID]                        = X86_FEATURE_ENQCMD,
        [XFEATURE_CET_USER]                     = X86_FEATURE_SHSTK,

which kinda calls for a more generic solution like:

diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 0bab497c94369..a358d45c781ec 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -800,6 +800,10 @@ void __init fpu__init_system_xstate(unsigned int
legacy_size)
 		/* Careful: X86_FEATURE_FPU is 0! */
 		if ((i != XFEATURE_FP && !cid) || !boot_cpu_has(cid))
 			fpu_kernel_cfg.max_features &= ~BIT_ULL(i);
+
+		if (!(fpu_kernel_cfg.max_features & BIT_ULL(i)) &&
+		    boot_cpu_has(cid))
+			setup_clear_cpu_cap(cid);
 	}

 	if (!cpu_feature_enabled(X86_FEATURE_XFD))

Which leads me back to thinking that doing nothing may be the best
approach here.

Let me noodle on it a bit more.
