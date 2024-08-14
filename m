Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BA61B1421
	for <regressions@lists.linux.dev>; Wed, 14 Aug 2024 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644483; cv=none; b=loh1Zb9hP8oOqAFtFuOzsahHz2uWBmN+4DRN8ZIxrdn5bv49jvAUK2sRrE5pGbUIvhMUXYxLdPiXJ23qkXskBdYvB6MMCP3vY7DehOE+/i5gyFZTve6kvMnGZvC+vr7xVuSIPVQ3K6ZOPVbjP77295bmNhwhUz5OJmPlY5TaeeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644483; c=relaxed/simple;
	bh=UXD7Yz5uxT3M095WHjvjkFG6zafPrLrj0PbfzPxqi1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpRdNvQEtVNT9FimfoNGHvzWvsYPuG3ehVDsKuaSo1Jj8MGyqF6V1waCP5ICyI/mCmGpc9szI+xboFcuY9KTf3aXuqUvs773jstOz/eyWBAGeGTHd6vqN0yMlszMp6Cu+NL6RS+Ebhe4hhL7fUScJJTU4Hx6UGXyMgDPsiTClto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ou+dN3aF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ou+dN3aF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723644481; x=1755180481;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UXD7Yz5uxT3M095WHjvjkFG6zafPrLrj0PbfzPxqi1M=;
  b=Ou+dN3aFka5zsQom5DBLno8czqukn0N59kApVZeUmFsYy3OgHH+8Fjie
   vwxCSts9CKk9owKCjURiK/xH+r2xOsjKCPCm9YgffG6lr5rVV+LFiJpUM
   Z7neC2yr7/quJaCaX2vemVVkYokfApft4iO6G8mopaMJTh6AKLIxyO2DS
   m+q2aCOILNvcVr2xxKha1mpnd8Bu/lIsPnxPCMxNvFkC0jqu9s5Q5hoXe
   52K4xxI7ovbpQ2qjOTswYtBdpwuYtOn5xoFKAF50gxGUozoG5E/RK7mr6
   PaEx9d6MVIFj73ExbTcLc3+KrVOV1uCf5SzFa2R+EysZ8XcgxflGtBr9l
   g==;
X-CSE-ConnectionGUID: hKkplfWRSeqT5M/K1D9iLw==
X-CSE-MsgGUID: nDCSzieDR1eNDQfAZixG0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="33270339"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="33270339"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:08:01 -0700
X-CSE-ConnectionGUID: J+nroZkKTMKZPQmgrrvMaQ==
X-CSE-MsgGUID: 7BKcIl+6Tv+ml9wfo0Tz+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="58709885"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:07:57 -0700
Message-ID: <1ea93e69-80da-4dc3-b63c-217b1f9f0447@linux.intel.com>
Date: Wed, 14 Aug 2024 16:07:55 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 6.9 17/40] ASoC: topology: Fix route memory
 corruption
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Vitaly Chikunov <vt@altlinux.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <czx7na7qfoacihuxcalowdosncubkqatf7gkd3snrb63wvpsdb@mncryvo4iiep>
 <14e54a89-5c62-41b2-8205-d69ddf75e7c7@linux.intel.com>
 <e95a876a-b4b4-4a9d-9608-ec27a9db3e0c@leemhuis.info>
 <210a825d-ace3-4873-ba72-2c15347f9812@linux.intel.com>
 <2024081225-finally-grandma-011d@gregkh>
 <20240812103842.p7mcx7iyb5oyj7ly@altlinux.org>
 <2024081227-wrangle-overlabor-cf31@gregkh>
 <53ab1511-b79c-4378-b2b5-ea9e19e8f65b@linux.intel.com>
 <20240814000053.posrfbgoic2yzpsk@altlinux.org>
 <e7b0597c-72d8-4cb6-bcec-19e29c1b864e@sirena.org.uk>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <e7b0597c-72d8-4cb6-bcec-19e29c1b864e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/14/2024 12:33 PM, Mark Brown wrote:
> On Wed, Aug 14, 2024 at 03:00:53AM +0300, Vitaly Chikunov wrote:
>> On Tue, Aug 13, 2024 at 04:42:04PM +0200, Amadeusz Sławiński wrote:
> 
>>> Should this be cherry-pick of both (they should apply cleanly):
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/sound/soc/soc-topology.c?id=e0e7bc2cbee93778c4ad7d9a792d425ffb5af6f7
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/sound/soc/soc-topology.c?id=0298f51652be47b79780833e0b63194e1231fa34
>>> or just the second one adjusted to apply for stable trees?
> 
>> I think having commit with memory corruption fix is more important to
>> stable kernels than not having the code cleanup commit. So, I would
>> suggest stable policy to be changed a bit, and minor commits like this
>> code cleanup, be allowed in stable if they are dependence of bug fixing
>> commits.
> 
>> Additionally, these neutral commits just make stable trees become closer
>> to mainline trees (which allows more bug fix commits to be applied
>> cleanly).
> 
> The reason I nacked the cleanup commit was just that there was no
> indication that it was a dependency or anything, it just looked like
> standard stuff with not reviewing bot output.

I've send both patches for stable in 
https://lore.kernel.org/linux-sound/20240814140657.2369433-1-amadeuszx.slawinski@linux.intel.com/T/#t
