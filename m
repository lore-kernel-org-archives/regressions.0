Received: from avasout-ptp-003.plus.net (avasout-ptp-003.plus.net [84.93.230.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF091E52C
	for <regressions@lists.linux.dev>; Sat, 27 Jul 2024 12:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.93.230.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722085003; cv=none; b=LxOiz7RH744X3rm1fzGiA/AImKcO4aHNovdzBHsluB9KMhi88o9Ry8zgf8G01LLgkhXiIYY13Q3F62yI7U06l5sHKpDJeahqUUjGCgZPPL8wO3XPZQz8v0civursomEHaMhrKGdUkVQRxecsMRLVNEPpaCwCnvQewRohTMIGtLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722085003; c=relaxed/simple;
	bh=cWWDL9wowXRCI6ezjWDxzDNxKysDrfTyQ24JcaYDOcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHHRsYVLcA+AXgpN3VGG1fVWlmgWXRvQ3GNGnuKtClha8IUarP1eVWFwTv3X7IcYYCtHbUmeRSo3x6FdIxDsgHSt0Bs52yLWgenv6l8lCpby9dAfzEmvITJOYPfg2KaD7Nms0gufEVi78vldp6RGrZxC1xaGmf4VCBlijCipuGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=durendal.co.uk; spf=none smtp.mailfrom=durendal.co.uk; arc=none smtp.client-ip=84.93.230.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=durendal.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=durendal.co.uk
Received: from localhost ([146.198.41.26])
	by smtp with ESMTPA
	id XgyKsad6WdfdlXgyLsUj5M; Sat, 27 Jul 2024 13:56:31 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.4 cv=DtP1+3/+ c=1 sm=1 tr=0 ts=66a4ee7f
 a=uPaVN7U6Dr8slOeZeejB6w==:117 a=uPaVN7U6Dr8slOeZeejB6w==:17
 a=kj9zAlcOel0A:10 a=UpoIEAoSAAAA:8 a=VwQbUJbxAAAA:8 a=jzGXcOu5GZFBxstxWeIA:9
 a=CjuIK1q_8ugA:10 a=i2QCTZlBeuS6jn7WOjAa:22 a=AjGcO6oz07-iQ99wixmX:22
X-AUTH: gnulinux@:2500
Date: Sat, 27 Jul 2024 13:56:28 +0100
From: Rob <rob@durendal.co.uk>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Christian Heusel <christian@heusel.eu>, Borislav Petkov <bp@alien8.de>,
	regressions@lists.linux.dev, x86@kernel.org,
	Joerg Roedel <joro@8bytes.org>
Subject: Re: [REGRESSION][BISECTED] Early boot hangs since f0551af02130
Message-ID: <ZqTufKvJKvotC-o_@vendhya2>
References: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu>
 <20240723120246.GBZp-b5nHHT0BWmKMZ@fat_crate.local>
 <5e08cab0-c6b5-4169-8d42-ddb0ffb4a6c9@heusel.eu>
 <20240725105029.GAZqIt9aLsIaG7JqN5@fat_crate.local>
 <12df8b45-6100-4c8b-b82a-a6a75bed2e05@heusel.eu>
 <87a5i4whoz.ffs@tglx>
 <ZqQSmw51ihns03ob@vendhya2>
 <ZqQl79UhhSQ5IobX@vendhya2>
 <8734nvuvrs.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <8734nvuvrs.ffs@tglx>
X-CMAE-Envelope: MS4xfMTjjX1UgzFQvsfvOaFfiuKDFeKg40br69YAJ/k9njM+gS6kYpwOieuT4faqUAVFw0434CP8FBCef6yvTtXVUax/xjMFRjasYUAQeaImD58YBagqDla6
 vc7+wNKw/w2HtAFv4GGUamXCahqcNJHcNhHH4M0Lv2a5dKBLm7g1DEP7LbL8aXfQkYSH7cO62URERA==

* Thomas Gleixner (tglx@linutronix.de) wrote:
>On Fri, Jul 26 2024 at 23:40, rob@durendal.co.uk wrote:
>> I have also tested on the non-patched mainline version 6.10 with
>> 'nointremap' and it also boots
>
>Thanks for confirming. I'm pretty sure by now that this is the same
>problem as the one in this thread:
>
>   https://lore.kernel.org/r/87wmntkhak.ffs@tglx
>
>That got resolved by a BIOS update, but for testing sake it would be
>useful to give the patch in the link above a try on your machine.

Yes this boots.  I'll look into updating the BIOS.

Thanks,

Rob

>
>Thanks,
>
>        tglx

-- 
Rob Newcater
