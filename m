Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359861B1406
	for <regressions@lists.linux.dev>; Wed, 14 Aug 2024 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723645259; cv=none; b=GmxRMgqCcwb+XfxtoqgRGwNmKCyOMerQxmR3o5gB9GBozgiiYUZqxVAKHABTrozqdBW1AXqYw8vEfg9PaxSNvkECR5wL7MG0R/ngGjE6o4CK+25xtuI9c0T3lDkCDNYB4B0KvQPh47iwcv3jPIfwwEevb8yWWDxz/QlFfLEwBDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723645259; c=relaxed/simple;
	bh=nRvlg5T3TVmO2wGsoTVEhXhV9ceaX6CQnjjbPNXYW4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5N6XdmLj9J6nG0Thd5ssQQISuaqJc05vlIdJZppYwmWLAGG8LidhoLWm3wGlXRsGcU+K0sQzmzqdVo0MATLJLoulrsQjRLlW6mUojcJAqfdWsvWMqagKzi1NUVKCdBLV9QHmqwu3Cco5GknuzX+iyvnk0JTs2G1cDBx85+THKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzEs/c/c; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzEs/c/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723645258; x=1755181258;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nRvlg5T3TVmO2wGsoTVEhXhV9ceaX6CQnjjbPNXYW4U=;
  b=GzEs/c/cO/NgLsaoJg+QvsATPMF7DkpaBVMTBvAx8WF/HibIn31Bh7tO
   0VcJgKhnoWegzgrh4wBB9i9tZgmA/olnWh+Ep/9HhynY85Wjr5o1BdJVG
   TYC9QwUkRGi/Shk6MT9Wd0DNv3FPbyn8aa4ZUYR0fwJi4T+v85kbtAiqD
   v79l+ZiTO92hKYCkPurrrNxNZACvsnhEZYDGSVV8W4Eh1amS/L2AHRo7E
   qYwHxCZtDpeMCdB1/xl1YlR38MV2ZFq4sVlZfVSRn+KieRzkTCv5E1Tn3
   i+EE4j6aYqSTjeUhz9pFNEobrpu3QC6TJMEWJ9zM+n8+fvXez7L1vwA5E
   A==;
X-CSE-ConnectionGUID: EXCyPZGKT/meCXkaJo9G2Q==
X-CSE-MsgGUID: JyA/LE93QUieXbliSlgWYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21420390"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="21420390"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:20:57 -0700
X-CSE-ConnectionGUID: XgDpH3WfRhafsX7XjKWjBg==
X-CSE-MsgGUID: yATN6ovvR+GRRMYatfttng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="82257099"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:20:53 -0700
Message-ID: <5a8098a6-6ef4-4c33-9b84-aef5788a5f35@linux.intel.com>
Date: Wed, 14 Aug 2024 16:20:54 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for stable 2/2] ASoC: topology: Fix route memory
 corruption
Content-Language: en-US
To: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Vitaly Chikunov <vt@altlinux.org>, Mark Brown <broonie@kernel.org>
References: <20240814140657.2369433-1-amadeuszx.slawinski@linux.intel.com>
 <20240814140657.2369433-3-amadeuszx.slawinski@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240814140657.2369433-3-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/14/2024 4:06 PM, Amadeusz Sławiński wrote:
> It was reported that recent fix for memory corruption during topology
> load, causes corruption in other cases. Instead of being overeager with
> checking topology, assume that it is properly formatted and just
> duplicate strings.
> 
> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Closes: https://lore.kernel.org/linux-sound/171812236450.201359.3019210915105428447.b4-ty@kernel.org/T/#m8c4bd5abf453960fde6f826c4b7f84881da63e9d
> Suggested-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Link: https://lore.kernel.org/r/20240613090126.841189-1-amadeuszx.slawinski@linux.intel.com
> Signed-off-by: Mark Brown <broonie@kernel.org>

[ Upstream commit 0298f51652be47b79780833e0b63194e1231fa34 ]
