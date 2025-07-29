Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35A3288C3A
	for <regressions@lists.linux.dev>; Tue, 29 Jul 2025 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753784433; cv=none; b=KPTeAbnKxjvUaZkZ9DUKrcaIxMFwgNLbZbmvykaodOdIzZtbUCyFCiE2Kcz0fKdpmNnN7W65cHaY6FC8bsq+wLVSP0RwUgvivptU7S3La3HVx7m7F2z3DJUt6LQgx1yoxhoRZ3v8stT2K/Zmif8XE0+rV9vZptGKQEHrjjbCPsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753784433; c=relaxed/simple;
	bh=u9g9xTirDI5BoZdPd2gtcPkZvUCKI6czZ27irfE2iIU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gPJIe4rvyC6OURzuYEVCma4SkuXkfOkLo9fzanAw/AYsRggibDgqnXgjnjeLiY/dvJSD2+kZPO9t/i31IzjvncjyEaanEk3d9+CkFlVC4VcliEb17GTzKH/4YJzyDVVCKJgzKKYPZxq8M4N2mzrs8z+NcbiR/in2Qe6zfTOU2bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MogjU+in; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MogjU+in"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753784431; x=1785320431;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=u9g9xTirDI5BoZdPd2gtcPkZvUCKI6czZ27irfE2iIU=;
  b=MogjU+in8CINj/Jb2fL/Wfeu2+Ki0htBeI3fQtuyCM759PCHzv3KB52z
   Pl9TrLeZcI58YVl+Dl+FlTwSCSVcJrohZGfzUBE5IM/69lMRWnfilQgWz
   oNXA00OqauxLVZOfZJF9PTeeU+HEcYO38A54FX5sREqSQaFZdkVFQ56DJ
   AdafgKqOGBJFuDsGAdfjnZER38QgXJcv/La3Hhv0s5mkeq3J0E5OqdRNK
   hKBtHoe6JeyqNiA/3rHEXvSpgzrO5YmrVH6Uw6ZKjeXWkM1AigHpqzCR5
   cCwle7sEcB2ryPs317uibRhk5/nq+r2MGolUsx8M6o0MvAk3PSsskHF93
   A==;
X-CSE-ConnectionGUID: c8INwNjnSj286PW1F1w/5w==
X-CSE-MsgGUID: lE4CY5KtTKycjV6G67bR/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59872760"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="59872760"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 03:20:31 -0700
X-CSE-ConnectionGUID: RXJlBpLLQlWpDWW8k/7zRw==
X-CSE-MsgGUID: b62qSJQPQKun17BHcYAXTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="163006701"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.22])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 03:20:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Mindful <andy.mindful@gmail.com>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, linux-pm@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, rafael@kernel.org,
 ville.syrjala@linux.intel.com, tglx@linutronix.de
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend
 in 6.8+ on ThinkPad X1 Carbon Gen 10
In-Reply-To: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
Date: Tue, 29 Jul 2025 13:20:25 +0300
Message-ID: <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 29 Jul 2025, Andy Mindful <andy.mindful@gmail.com> wrote:
> Please let me know if any further information or testing is required.

Likely the quickest way to find the root cause is to bisect the issue.


BR,
Jani.

-- 
Jani Nikula, Intel
