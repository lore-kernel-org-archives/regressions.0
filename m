Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D551991D2
	for <regressions@lists.linux.dev>; Fri, 10 Oct 2025 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760084161; cv=none; b=uh/ESb8GfCYHtLUXozGzkE4mhrOjrnF4ROsd4rVAKNHaqGX9yug+DKIgr3nrtj5zTbe6NL1S6e5niKGC06tk2lBm5jOufdtL8iLCiWFGekM1pgK8TbUI6PXOgpYmqFX5dI+Yg77Tz5L6wXnPX09b25qixucfNuglRBrM1nmfm1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760084161; c=relaxed/simple;
	bh=jOQ+1EB+xZR2bI8fkSuX+MnkwloxTSge0juOR5vXepY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/IfIAYfmETko1AwmLktSiNj3OkpRSGovxOKOY5eLPl/AHEdeiH4/EnZ3O2KSQJDueG0xDMUOtdP1EF279sHVy9MRtlHT51vutPbvD6i528cmKo/dMTH3d7uj4C0a72EAfV0skDhUaosFfVBQnSCpgD6teQF9DUpaDLsaVfLlfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7y/2xMO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7y/2xMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760084159; x=1791620159;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jOQ+1EB+xZR2bI8fkSuX+MnkwloxTSge0juOR5vXepY=;
  b=d7y/2xMOvjBhjOPXZ7IwK6dIUTSSMv/DpiKpvcBkCMfXk4pF+fn2qzta
   e1dL2xHNyBholFeh8bFRJ4EI6UG9DVihBi+p/XRsuDGoSjFjjgTTyw306
   KGfO69fVxueQ0FRpjCt7BUqBJbFwGQ/oOuGAz4aBoDoG5HAWzwbrU4Ewh
   QiL3Dxs7UaqGivXrNvZO7WUZJ/n7FU2vmFlJ/EwLmn15kRJY46slpQ5oW
   bQRvK0+3WRVYyaxUnkPsL8ZBCFNqGPqw3JA/p3/3ZslNpR8AtzfuLKZOn
   sQKb5cfgRyoMyC5DaUe51SYJbAuQdEQDjghgS01WAnWcjTysHwW9K+x5D
   A==;
X-CSE-ConnectionGUID: 266NyOiKSGGmtL1u+YM/+A==
X-CSE-MsgGUID: nm9JoZIoQGae490cxNQZ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73403648"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="73403648"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 01:15:59 -0700
X-CSE-ConnectionGUID: Iw3WUnGJSM2ZEYhV1HRhAw==
X-CSE-MsgGUID: atdz71oCTLyaFVtYe5a3tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="186192650"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.149]) ([10.245.245.149])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 01:15:57 -0700
Message-ID: <b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com>
Date: Fri, 10 Oct 2025 11:15:55 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] [REPRO] USB-A devices not working on boot after
 recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Arisa Snowbell <arisa.snowbell@gmail.com>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Niklas Neronin <niklas.neronin@linux.intel.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com>
 <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
 <20251008082055.5646dadc.michal.pecio@gmail.com>
 <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
 <20251008130532.49922d58.michal.pecio@gmail.com>
 <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
 <20251008223406.13f16f19.michal.pecio@gmail.com>
 <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
 <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
 <20251009131444.2c221922.michal.pecio@gmail.com>
 <90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com>
 <20251009152703.72e780b4.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20251009152703.72e780b4.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/25 16:27, Michal Pecio wrote:
> On Thu, 9 Oct 2025 14:30:20 +0300, Mathias Nyman wrote:
>> Maybe the xhci->allow_single_roothub = 1; flag could be set in xhci_pci_setup()
>> when called for primary hcd
> 
> Oops, I put it at the beginning so it is now executing twice on
> two-speed controllers.
> 
> I only understood this remark when I saw my confirmation printk()
> appearing twice after removing the "hide USB3 ports" hack.
> 
> 
> Should I do a v2 or leave cleaning it up for later?
> I suspect that imod_interval should also be moved a few lines down.

I'll happily take a v2 instead if Arisa has time to test it.

You're right about the imod_interval as well, but that is a minor cleanup
for a separate usb-next patch.

Thanks
Mathias

