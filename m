Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33262629D
	for <regressions@lists.linux.dev>; Sat, 15 Mar 2025 18:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742064344; cv=none; b=fl03XJmZJ5k0Y/1cJlvwlZs86QbBcJz3S6Dz+DvkH1M/5Ps2EtMZwOuLV4E23yIP95UQj4D8koMVX5ahoCxTxJ59AUYoEnOxgwlz/8CiqjFNlcIbrQcAgeYIj/gDZKiY5/B7K0NQMw7+Yxdf7fE9u3hK4vZx4TXSG8lNrSCF/AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742064344; c=relaxed/simple;
	bh=p44a16tauoX+HqPbdXXA7uLIeI1C+zfA5RPGpngneAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CzEUxHciZ9NH3j20VHLCrBCSlxSbn91Dw6X60gyBMEeJzjM588jMnrQ1sKO0ORwQUx19hn1qV4200XioQbsSAw1bwPD1S6PenXFeRe1/xdz8wnU89SMirTLmT28VUuqQwQrjfoPlMgZ6ZkOpcFR5ktBEChVCr5lqa8JEqwoPlwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tvtgv5/T; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tvtgv5/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742064342; x=1773600342;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p44a16tauoX+HqPbdXXA7uLIeI1C+zfA5RPGpngneAE=;
  b=Tvtgv5/TM3J6EZY7Bl3oU2LJUBtcaeXCVgm1YS6aD1kYrhlw5pZEyaek
   A3ckDGENHY3FGYcxuYR54UMNsZvv2BaruDCBy17QUZW1lMBR6UfrWMROA
   MSDzjzoqEG3vrJq29gEEYGkTYYlvyYcz+N0LjXM30NCTszwZvL2enO4sM
   MjypwgvOypOx4N8U1vtg2dFi3EVW74tq7mGvF+htKuPWhreQlBDWjeLxB
   drXLUgZO97hWDZI/fpyWSe/V26HIUJcWiqjh3utY+h4GUOqYoqYqNqrpu
   qJqRaQQMnlM8MapqaMpmPyDMRQIi4TadHpv/KpZ7TZ2ylC3tMTi+2ipNt
   Q==;
X-CSE-ConnectionGUID: LSCVKmAbRnCjTTzfH+UABw==
X-CSE-MsgGUID: LoKb0naxRd69tWxo9wXFFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="43232525"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="43232525"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 11:45:42 -0700
X-CSE-ConnectionGUID: aBanIHOOSWCST5e2PgfoHQ==
X-CSE-MsgGUID: UdpJzkWTTXO921fduloL8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="144749041"
Received: from mgoodin-mobl2.amr.corp.intel.com (HELO [10.125.109.10]) ([10.125.109.10])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 11:45:41 -0700
Message-ID: <1b8745e0-ae80-4add-b015-affdaa69b369@intel.com>
Date: Sat, 15 Mar 2025 11:45:39 -0700
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
 <09401d9f-6a5f-40d7-ac3c-e149ef57bcfd@intel.com>
 <CAG8fp8R2HaU0XQDsnFG4CyF=XbqLV3sv=U7-52QKomDptQY1Nw@mail.gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <CAG8fp8R2HaU0XQDsnFG4CyF=XbqLV3sv=U7-52QKomDptQY1Nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/15/25 06:09, Akihiro Suda wrote:
> Any chance to just merge "[PATCH] x86/pkeys: Disable PKU when
> XFEATURE_PKRU is missing"?
> (This revision checks the XCR0 flag, not the ACPI vendor string)
> https://lore.kernel.org/regressions/20250314084818.2826-1-
> akihiro.suda.cz@hco.ntt.co.jp/T/#u

Does that even work? X86_FEATURE_OSPKE isn't enumerated until setting
CR4.PKE. The XSAVE setup code (fpu__init_system_xstate()) looks at
X86_FEATURE_OSPKE, so *MUST* run after setup_pku(), right? Before
fpu__init_system_xstate(), cpu_has_xfeatures() doesn't work.

Even if that patch worked, I don't think it's the right solution.

We'd have this problem for any feature that depends on XSAVE
(ENQCMD/PASID, CET, AMX, AVX and even SSE) if the ISA feature was
enumerated but XSAVE support was not.

So if someone is interested in putting together a patch that would solve
this problem for all features, forever, I'd be interested. But I don't
think we should have a targeted PKRU-specific fix. A generic fix would
just be (famous last words) a matter of taking xsave_cpuid_features[]
and enforcing the dependency in both directions. Not just:

	* If you don't have X86_FEATURE_OSPKE, don't support
	  XFEATURE_PKRU

but also the inverse:

	* If you don't support XFEATURE_PKRU, then don't support
	  X86_FEATURE_OSPKE

It would likely be simpler to be quite tyrannical about it and do
fpu__init_disable_system_xstate() if any of this nonsense is detected
rather than trying to disable features or be fancy and recover.
Basically, if something goes wrong, disable XSAVE and limp along.

The other _debatable_ thing (in addition to disabling XSAVE) is if this
check is really correct:

static inline int update_pkru_in_sigframe(...)
{
...
        if (unlikely(!cpu_feature_enabled(X86_FEATURE_OSPKE)))
                return 0;

It _could_ arguably be:

	if (!fpstate->user_xfeatures & XFEATURE_MASK_PKRU))
		return 0;

Which is a better check than fpu_user_cfg.max_features (or
.default_features) because it's more specific to the _current_ task and
would, for instance, work for the AMX xfeatures.
