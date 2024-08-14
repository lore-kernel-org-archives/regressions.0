Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A8E1B32B1
	for <regressions@lists.linux.dev>; Wed, 14 Aug 2024 14:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723645224; cv=none; b=OlRUfZLJJgMjNAq/LZG/FSoH70rkaH77xv1QE9c2PfKYfEiPR3REjGlmB0tGXUS+L1XFo0Mx9SGI43Yzx+yntKN/pcUShuNoHktiiPuMJXhPuJLqX339Kbp2NDvxy3em0Oh55biJpSLvs/2K/6Y/aa4RVUvqM+BA1JZe6tZOKRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723645224; c=relaxed/simple;
	bh=nPfDO7gKZi/bJKeY7gL6Dcqtu+BTztV6qEx3uaa7S10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2NTeY/QJOma3CO8VVky5yhIDkr5QNRjQdJftqwaxZXR+yQSYFoZjbmcsb8sCPcEcIz7h0xt/KFaleEdMMw5GGiMPLZ3/LX9SvwoLoJkJf/sBABrOnUX3eZWpUDVXQQDHO+IorNMShakczGOZVrA5LuZ8OO3r68XxzrqFFrMXxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bn24ilNd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bn24ilNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723645222; x=1755181222;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nPfDO7gKZi/bJKeY7gL6Dcqtu+BTztV6qEx3uaa7S10=;
  b=bn24ilNd3bnvgoJmf0NVO8hAo1BjYIDvVnxCEwLhbx7+NJpoCmVK2ZAz
   G7rgPYTDoIIf8Oe6TLz+cnlZZYfMx2lcul4MgHxF+WeA6eTq//0H2ujck
   0A3gsZS26Rm87dIu8xE9jvfgkHoBFd1lLF38euwfD68dTf397rdvQ20Wt
   de/L4XLE2WfXntLLtwKQB82XcA+sXrVtbP8CDtoTJY8lQaDB7rlChyOgv
   HaNHpJyJw2PhtFOZnEtlrmMq7bWiaHDaLs4RYJO8e9NyRHjWvs/enYtcG
   Ac6w+V7SEKlDWaapqFEF7XU+Nm2S229wMhcEoq5eowssYU98iL0s+fM5p
   w==;
X-CSE-ConnectionGUID: AUgfWQfnRvq48rXElq+c7g==
X-CSE-MsgGUID: jxcumg0XRM6pq7uW8Zc6og==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21420274"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="21420274"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:20:21 -0700
X-CSE-ConnectionGUID: 91bZk2woTF2yAN/lSFHdLw==
X-CSE-MsgGUID: VqA0Gy3BTAyUPiI/RLco4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="82256972"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:20:17 -0700
Message-ID: <1cb2dfee-0846-4854-947e-4483b7a1817d@linux.intel.com>
Date: Wed, 14 Aug 2024 16:20:17 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for stable 1/2] ASoC: topology: Clean up route loading
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Vitaly Chikunov <vt@altlinux.org>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20240814140657.2369433-1-amadeuszx.slawinski@linux.intel.com>
 <20240814140657.2369433-2-amadeuszx.slawinski@linux.intel.com>
 <2024081404-plow-residual-202b@gregkh>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <2024081404-plow-residual-202b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/14/2024 4:12 PM, Greg Kroah-Hartman wrote:
> On Wed, Aug 14, 2024 at 04:06:56PM +0200, Amadeusz Sławiński wrote:
>> Instead of using very long macro name, assign it to shorter variable
>> and use it instead. While doing that, we can reduce multiple if checks
>> using this define to one.
>>
>> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Link: https://lore.kernel.org/r/20240603102818.36165-5-amadeuszx.slawinski@linux.intel.com
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> ---
>>   sound/soc/soc-topology.c | 26 ++++++++------------------
>>   1 file changed, 8 insertions(+), 18 deletions(-)
>>
> 
> What is the git commit id of this change in Linus's tree?  Same for
> patch 2/2
> 

[ Upstream commit e0e7bc2cbee93778c4ad7d9a792d425ffb5af6f7 ]
