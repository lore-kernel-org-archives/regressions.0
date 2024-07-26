Received: from avasout-ptp-001.plus.net (avasout-ptp-001.plus.net [84.93.230.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE4A1CA80
	for <regressions@lists.linux.dev>; Fri, 26 Jul 2024 21:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.93.230.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722028897; cv=none; b=CkdLL9pKwrZrDu9zFutT2ruXugwDyueB+XI/EAjXamkn/cAnfMDLVmv6vVOLSNavKao+9RjMxSLcerzJ4tEX4lkpbpp0npmTVuTtxvdrLF4BkvMA5Z+8og/6fG+K9AmU9OHtlL1Z6AzrwoIlZOsumaeo6Z6Elwdnu0Asg6DA+Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722028897; c=relaxed/simple;
	bh=+fQGq7FP+8GCBDddY8GyNLDMYtE6TTBfTBXaxeMJ8AU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQc5F/XHaw4e6ogJjKlmmWf0/NiqCMiN8Sn6SWLW1lmMLwBM77ArtNYVLlV+t/OpVo11sDE/Dk0eYDLuc3HD0U/4eNlNZhzOJeuPnt9ITh4iNzq/uLk1TzgVrgrjhxkcvoHI3nog4nM/dkJK6bjGXaU4Gk7oPEIGxpZtlMdzkuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=durendal.co.uk; spf=none smtp.mailfrom=durendal.co.uk; arc=none smtp.client-ip=84.93.230.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=durendal.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=durendal.co.uk
Received: from localhost ([146.198.41.26])
	by smtp with ESMTPA
	id XSKSsmvFt4PsgXSKUssYcq; Fri, 26 Jul 2024 22:18:25 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.4 cv=eeSefKEH c=1 sm=1 tr=0 ts=66a412a1
 a=uPaVN7U6Dr8slOeZeejB6w==:117 a=uPaVN7U6Dr8slOeZeejB6w==:17
 a=kj9zAlcOel0A:10 a=1A_nFRkuvXKRJ0p9eSIA:9 a=CjuIK1q_8ugA:10
X-AUTH: gnulinux@:2500
Date: Fri, 26 Jul 2024 22:18:19 +0100
From: Rob <rob@durendal.co.uk>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Christian Heusel <christian@heusel.eu>, Borislav Petkov <bp@alien8.de>,
	regressions@lists.linux.dev, x86@kernel.org,
	Joerg Roedel <joro@8bytes.org>
Subject: Re: [REGRESSION][BISECTED] Early boot hangs since f0551af02130
Message-ID: <ZqQSmw51ihns03ob@vendhya2>
References: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu>
 <20240723120246.GBZp-b5nHHT0BWmKMZ@fat_crate.local>
 <5e08cab0-c6b5-4169-8d42-ddb0ffb4a6c9@heusel.eu>
 <20240725105029.GAZqIt9aLsIaG7JqN5@fat_crate.local>
 <12df8b45-6100-4c8b-b82a-a6a75bed2e05@heusel.eu>
 <87a5i4whoz.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87a5i4whoz.ffs@tglx>
X-CMAE-Envelope: MS4xfN2cOj5j2kaxCiLZJI6nZpfvi60Lq1PmQ+7GbY8VIYKeMkNATxhCKEskr/HQfDeIyEBTzvsGlU2FlavYprjddCnkEUgB9U0r6vcpoFb9IbY0CkGyTSXZ
 sfcvwm/USJuw+VfHbyZJjKjKmTk3H7KKS3m3761PtlieH2LLXrE2rBWTFdZoQHI6uRqa0dCe57dLag==

>So in theory the same problem should happen with a pre 6.9 kernel and 
>'nr_cpus=4' on the kernel command line. Can you please verify?

Confirmed, 6.6.40-2-lts with 'nr_cpus=4' hangs

>Another data point to be evaluated is whether booting the unmodified 
>6.10+ kernel with 'nointremap' instead of 'iommu=off' on the command 
>line makes the machine boot as well.

linux-mainline 6.10-1.1 with 'nointremap' boots

>... connect that machine over serial ...

Unfortunately I don't have the hardware for this

Kind regards,

Rob


* Thomas Gleixner (tglx@linutronix.de) wrote:
>On Fri, Jul 26 2024 at 00:01, Christian Heusel wrote:
>> Sorry for causing some confusion on that part and I hope the above
>> outputs help with debugging this issue!
>
>Not really. The issue is completely unclear and nothing makes any sense
>here.
>
>The only difference is the resulting number of possible CPUs.
>
>[    0.026516] CPU topo: Allowing 4 present CPUs plus 12 hotplug CPUs
>
>versus:
>
>[    0.025251] CPU topo: Allowing 4 present CPUs plus 0 hotplug CPUs
>
>which really should not make any difference because the 1300X has only 4
>CPUs.
>
>So the bisected commit is the messenger for some other problem
>presumably in the IOMMU area which is just papered over when there are
>12 possible hotplug CPUs enumerated.
>
>So in theory the same problem should happen with a pre 6.9 kernel and
>'nr_cpus=4' on the kernel command line. Can you please verify?
>
>Another data point to be evaluated is whether booting the unmodified
>6.10+ kernel with 'nointremap' instead of 'iommu=off' on the command
>line makes the machine boot as well.
>
>Thanks,
>
>        tglx

-- 
Rob Newcater
