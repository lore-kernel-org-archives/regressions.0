Received: from avasout-peh-004.plus.net (avasout-peh-004.plus.net [212.159.14.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C40714D28A
	for <regressions@lists.linux.dev>; Fri, 26 Jul 2024 22:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.159.14.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722033663; cv=none; b=kdn40+6XOyBkVeJgLvFjz6uUfc2sEo1gxAd9FU6T2SAJHVoEPCvPD/BID7E8k5ngSF99Y+UtnVctsk7Bl+76oRJlsc/c4q+5LyY5e1fuAHbOH2jJsbk71XQ80iUpFSEjO3Ie6wnQScoBTzEUtcw94BZVcKOLO00uq+f8c+58Tq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722033663; c=relaxed/simple;
	bh=nbxyhmvQwGBMGN3M9d5yxz7d/Rlmkv1KKZqilRx85cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJEQFAnRPj1Ap0+kCOP6aZsuiONCBjHdMaSkvdegeS5DRS0kp9Bgpd6BuColFkIUG2A+k/Gu77QOtLCRlT6X5/nTafS0bqwud0EOvCwe2himGEB2FXMp6sIqegQgo4fBxGS7KvcsXFV9qufVj3v/pRfypGLj6E9QRFf9qAgXBKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=durendal.co.uk; spf=none smtp.mailfrom=durendal.co.uk; arc=none smtp.client-ip=212.159.14.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=durendal.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=durendal.co.uk
Received: from localhost ([146.198.41.26])
	by smtp with ESMTPA
	id XTcFsLcsbX9c9XTcGsAjGg; Fri, 26 Jul 2024 23:40:52 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.4 cv=NPx2+F6g c=1 sm=1 tr=0 ts=66a425f4
 a=uPaVN7U6Dr8slOeZeejB6w==:117 a=uPaVN7U6Dr8slOeZeejB6w==:17
 a=kj9zAlcOel0A:10 a=UpoIEAoSAAAA:8 a=E8U297PRLMU9RVS8rI0A:9 a=CjuIK1q_8ugA:10
 a=i2QCTZlBeuS6jn7WOjAa:22
X-AUTH: gnulinux@:2500
Date: Fri, 26 Jul 2024 23:40:47 +0100
From: Rob <rob@durendal.co.uk>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Christian Heusel <christian@heusel.eu>, Borislav Petkov <bp@alien8.de>,
	regressions@lists.linux.dev, x86@kernel.org,
	Joerg Roedel <joro@8bytes.org>
Subject: Re: [REGRESSION][BISECTED] Early boot hangs since f0551af02130
Message-ID: <ZqQl79UhhSQ5IobX@vendhya2>
References: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu>
 <20240723120246.GBZp-b5nHHT0BWmKMZ@fat_crate.local>
 <5e08cab0-c6b5-4169-8d42-ddb0ffb4a6c9@heusel.eu>
 <20240725105029.GAZqIt9aLsIaG7JqN5@fat_crate.local>
 <12df8b45-6100-4c8b-b82a-a6a75bed2e05@heusel.eu>
 <87a5i4whoz.ffs@tglx>
 <ZqQSmw51ihns03ob@vendhya2>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZqQSmw51ihns03ob@vendhya2>
X-CMAE-Envelope: MS4xfCol3hvb9RPdjTEhq+DC+CcfdNVg2UAeP3dmfVHTUtb00Zb8yQ7JSCpjkF3ZE1w58kR3A/7RPRTESxalCgchjj24xZ6Isivz13RanBvuppwFHeIEQiWB
 6faBPwQvmYJRmzpNBNBw4wU0ESAYysADT/U1JGDoBuNv6zb1ME2+HSVZoKICYpiOXSF8dWxOCzX18Q==

* Rob (rob@durendal.co.uk) wrote:
>>So in theory the same problem should happen with a pre 6.9 kernel 
>>and 'nr_cpus=4' on the kernel command line. Can you please verify?
>
>Confirmed, 6.6.40-2-lts with 'nr_cpus=4' hangs
>
>>Another data point to be evaluated is whether booting the unmodified 
>>6.10+ kernel with 'nointremap' instead of 'iommu=off' on the command 
>>line makes the machine boot as well.
>
>linux-mainline 6.10-1.1 with 'nointremap' boots
I have also tested on the non-patched mainline version 6.10 with 
'nointremap' and it also boots

Kind regards,

Rob

>
>>... connect that machine over serial ...
>
>Unfortunately I don't have the hardware for this
>
>Kind regards,
>
>Rob
>
>
>* Thomas Gleixner (tglx@linutronix.de) wrote:
>>On Fri, Jul 26 2024 at 00:01, Christian Heusel wrote:
>>>Sorry for causing some confusion on that part and I hope the above
>>>outputs help with debugging this issue!
>>
>>Not really. The issue is completely unclear and nothing makes any sense
>>here.
>>
>>The only difference is the resulting number of possible CPUs.
>>
>>[    0.026516] CPU topo: Allowing 4 present CPUs plus 12 hotplug CPUs
>>
>>versus:
>>
>>[    0.025251] CPU topo: Allowing 4 present CPUs plus 0 hotplug CPUs
>>
>>which really should not make any difference because the 1300X has only 4
>>CPUs.
>>
>>So the bisected commit is the messenger for some other problem
>>presumably in the IOMMU area which is just papered over when there are
>>12 possible hotplug CPUs enumerated.
>>
>>So in theory the same problem should happen with a pre 6.9 kernel and
>>'nr_cpus=4' on the kernel command line. Can you please verify?
>>
>>Another data point to be evaluated is whether booting the unmodified
>>6.10+ kernel with 'nointremap' instead of 'iommu=off' on the command
>>line makes the machine boot as well.
>>
>>Thanks,
>>
>>       tglx
>
>-- 
>Rob Newcater

-- 
Rob Newcater
