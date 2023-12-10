Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F706ABC
	for <regressions@lists.linux.dev>; Sun, 10 Dec 2023 11:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="jJVyuM3b"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C1C8140E00CB;
	Sun, 10 Dec 2023 11:05:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uK7Ep6hwe_-O; Sun, 10 Dec 2023 11:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1702206328; bh=7l269ABKGvld3vh3H19A5zWWvuhVOYhQh2qZD/ePAr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJVyuM3b2w9Z/E8sTRG9hUN63106Jp4Nea7iGy04HrbYzqSLrAn+4gYk4q1bsTZob
	 1+nRZLjTYymWrQJfUI/XSL8tOK1nsyH8wsG5d8Im1Jho4I0o8b3R/bZPtRSKQBrJLN
	 962ysWQqll1Loc7nXZ9ToCZ/aOQgqMltuqMzsMbasv9XVk/ZcbthHxkiiDDZ3ib8RE
	 mjMLCWAjtzNTxV5fysDl6umnV8LeNuZBVZRBH7xq2gDmcIBPKVk2fzEyysv10w1kNN
	 OwluBoUktcaQOR5zooHbnfYrPEZXA4iA1dJRjeqZZfu2ePc31BWBH1lTi7dSXvYiO9
	 UxYfupnr1pfHtxXXMnrLZg48vjKEvTTc/RjyOz9P39t/0zi+hhmzm4QvSVAzW5DIJt
	 48bsh/0KK3vmeIH28uUU4pFJISjZnBgIiaNxkCarArVtqovpI2Qii0doSdEpm/bQTR
	 Gx3sPm+4tlDBxLj3xsNGLEthT4sNmswGW1Rw9+bzOK0AI0jcK/y8IBrS/a5wO51fdq
	 26nEWmw9GkaFaCS3k/v37hXySxdkuSBhihzBpK5tmhMNPDNDioTQbIo+8e+YXB2WgO
	 CBS2skJnlsPs2OYuvLqKqBSiIEUoXdArav3FMyppDFs+HBrR2ZxAYfsAvy/tcC5xCI
	 +HVSbs3YVDS0i/Pibg8S2kyw=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C3D9340E00A9;
	Sun, 10 Dec 2023 11:05:19 +0000 (UTC)
Date: Sun, 10 Dec 2023 12:05:18 +0100
From: Borislav Petkov <bp@alien8.de>
To: Chris Lindee <chris.lindee@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, regressions@lists.linux.dev,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Ashok Raj <ashok.raj@intel.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [REGRESSION] x86/smpboot/64: System will not boot on v6.5,
 v6.7-rc4
Message-ID: <20231210110518.GAZXWbbn9+ZNF5kwQV@fat_crate.local>
References: <CA+2tU59853R49EaU_tyvOZuOTDdcU0RshGyydccp9R1NX9bEeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+2tU59853R49EaU_tyvOZuOTDdcU0RshGyydccp9R1NX9bEeQ@mail.gmail.com>

On Sat, Dec 09, 2023 at 09:31:48PM -0600, Chris Lindee wrote:
> My Dell-EMC PowerEdge T340 server worked with v6.4.15, but it will not
> start with v6.5.x - it won't even display dmesg events during boot.  I
> reproduced the issue on v6.7-rc4 and bisected the first problematic commit
> to:
> 
> 0c7ffa32dbd6 x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup()
> and enable it

I presume booting with "cpuhp.parallel=0" on the kernel cmdline fixes
it?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
