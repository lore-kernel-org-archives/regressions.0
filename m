Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385567F8
	for <regressions@lists.linux.dev>; Fri, 26 Jul 2024 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721991470; cv=none; b=H29HZ+l8ZodHYyDf0DtMSDZbBc1wIECPwyxdBKYSY3EKTmy9KJXr2syyDfkVKNT6Xmfzfqx70/qsHD0SSTrZDE5IBBZVRAexW1LpJufl9BV0dKh/OybFGmJYU864sM20N6s8jYulmbc2s2gq5YEqL277AARG7z2KEKQbAYlG31w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721991470; c=relaxed/simple;
	bh=Ozb2LLBSd/XacVK8N7wriP6v0/q6N4DABGShkWSQG04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5im75y2Hm4U+QKFfW6cL8/z2hDHLVWcm6WYldypP0fiwM5dOP1Zvau9BEx9KzzOz5feLVSvYgSMOUPGaYzfimeiXV0RBeKAc5rG/MRo7P+NQ3lfxAjJLp2+5sTAOjjGko+bSvpkEW4g6pbiQ2OrX0xQ3YgsopyEmHP1I3+vlhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=dLy9QSkd; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="dLy9QSkd"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 721F340E026A;
	Fri, 26 Jul 2024 10:57:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id g9gKR9EN7_kO; Fri, 26 Jul 2024 10:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1721991454; bh=WqObjvSb0lB82imxVxCBk+bvZ78/tVzpB1GCr9aCPe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLy9QSkdrySyZyMDbJKVCao7R4TybB178RCUwWgM/YOQtUak0AEz4BsrTGPinJ132
	 W0xD0uzQ7xuC9fIOO8bHSRHUDugayPsWG1JM0jbLtV/EA6FFssRbic0X8m3dwxn6Ex
	 0p095OzqFkCWy5u2dsym3Y8m9rVZV0iDU6oDQXWCxQ2qCVJpMu4wtsBwD8TB7IGUQ/
	 +Z8FM8haESxRcOPIN+qKjl72p5sFwLekF+FU4VBVGojNfKk1ykJhtSExwoeYoM7Qgy
	 sRFpLhutmP89e6I/Pglw4IGHOypvItTnzsFN73Vs0JYgL5sYwXxsSwZtMvj3w8pkCf
	 FUi7Lki/wzhD8IZVtmngg+vX/cFPUdUtkLslkd/6q3Dryms4P+eTXdPBW1QPWb6q00
	 /fQZkjFm9tCe72Atf2rBssKaF2JRwrvGdRbGS5//JQnOAvQxSAHwI35+Pt9M1VsESF
	 M0o9AUMBg6b4VMMTog/NG/eRqY8Av2Q12r+QdqX+A8mEaemUMn97rxSKhdVBuOv78v
	 rScMogChqtEXRTk+fZwzzF4E1BNCuyZOcbaREIYzgNF6EaqN4g6NhQql0bbGg2eo86
	 Ol/z2RwSxDt1phl/uSen7a7DeJkx0lGxHa8zKThtjgxa+kcb3m4R/1JD7aZgVJJTIa
	 gO2A1xQcI2jhJ/sJ/de/7HFM=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 11CAA40E01B3;
	Fri, 26 Jul 2024 10:57:28 +0000 (UTC)
Date: Fri, 26 Jul 2024 12:57:21 +0200
From: Borislav Petkov <bp@alien8.de>
To: Christian Heusel <christian@heusel.eu>
Cc: Thomas Gleixner <tglx@linutronix.de>, regressions@lists.linux.dev,
	x86@kernel.org, rob@durendal.co.uk, Joerg Roedel <joro@8bytes.org>
Subject: Re: [REGRESSION][BISECTED] Early boot hangs since f0551af02130
Message-ID: <20240726105657.GAZqOA-Y32Kc9O2cqE@fat_crate.local>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a5i4whoz.ffs@tglx>

On Fri, Jul 26, 2024 at 12:50:20PM +0200, Thomas Gleixner wrote:

...

> Another data point to be evaluated is whether booting the unmodified
> 6.10+ kernel with 'nointremap' instead of 'iommu=off' on the command
> line makes the machine boot as well.

... one other thing to try, if possible: can you connect that machine over
serial to another one and then catch dmesg with the failing kernel so that we
can see what the failure actually is?

Might give us a better idea.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
