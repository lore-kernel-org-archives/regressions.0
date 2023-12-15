Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25FD2C6A3
	for <regressions@lists.linux.dev>; Fri, 15 Dec 2023 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JGLDH07/"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 00F4540E014B;
	Fri, 15 Dec 2023 18:35:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mFzpOCpG6yy0; Fri, 15 Dec 2023 18:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1702665351; bh=esMWiu+2+HvCyFKD/K0fUoXEyPCj6cIIHqBvquBUcQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JGLDH07/qWkECg8rc4YZQlTnQexGcvRYwk5akgL3vZ/KL7UhOvadun0bQGdjcRYCg
	 edLlseyDCldhidoVF0UF2gDJp7NgGpuQGIKxO7OBIVP9TOGdv015JiB3ut6UBX1z74
	 4mqXRpptWvr+d17RDpBH/cpuMYz1kzWVDWw33K3IFCI/3ez43Mi5sbOSsaVyOkYqmF
	 YTcXFjIALt38NO7ErdCfJcYs0i+Sy53D6/mdUGZT3G/J0YHSsXqVeeBC+oDvGGzdiE
	 LbC5f16tiQqPxoqBrQRKfCV4siYxPxjGKQDEgrN2+mFrp+jHzgkpD4n8/Ri42KrTWK
	 f1A9Vs4VnimPsK4Je0EfTAWD4+mhoQz4UDf4TlPvIyp+1NQRCy3its5Xh0qQvY/IZS
	 cQByyNEoF6lSy3wpm0eK0pJslTVdsbphi5qHFF5L3sEDbSfnYA1FherN42AKS+JW5L
	 KwoMdFrAvIeTCjHFBrw3cpp3zHyoMFN8wb55HxGA0S6HTUWo7hh2DILO5uJFdWL6xm
	 DeBQEYU5UFf2XhyMZHxnk/z++VODaS0L/JhsNi+uyPyPG4hVVIlmysda4p6FetI5PH
	 i6NLG1Q9eANd/TpWbAsDrOBy0D9SW3IlOa8K1o3KjGpM+PzO+GcEhFA6AjpdV7g64S
	 MDG0WYGdOcdMZozSjxisXZxU=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 791AE40E00C6;
	Fri, 15 Dec 2023 18:35:42 +0000 (UTC)
Date: Fri, 15 Dec 2023 19:35:37 +0100
From: Borislav Petkov <bp@alien8.de>
To: Chris Lindee <chris.lindee@gmail.com>
Cc: Ashok Raj <ashok.raj@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	regressions@lists.linux.dev, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH] x86/smpboot/64: Handle X2APIC BIOS inconsistency
 gracefully
Message-ID: <20231215183537.GDZXyceaXr33Vc/DaK@fat_crate.local>
References: <87bkavqykk.ffs@tglx>
 <CA+2tU5_TzDQO2U8SGDYhsVPR8iYh8Q8vTqv9+HUc7LN3cV=2Sg@mail.gmail.com>
 <87bkaup3w2.ffs@tglx>
 <CA+2tU5-RoR8qCGRdsMH0wo5n8v4fV8A_H5yT+mZadsF7E+QkWg@mail.gmail.com>
 <CA+2tU5-18YQSpFzgUKyeZdJXe0Rs0GxtYY2s5QjznzTucJKCiQ@mail.gmail.com>
 <87ttolnu36.ffs@tglx>
 <CA+2tU596G+auWJ2MzYFJ3bv=Y4zP2NSrdtak7SdF9SH6Ht_dzg@mail.gmail.com>
 <87cyv7on8t.ffs@tglx>
 <ZXxzs7j3Ag2hBaoP@araj-dh-work.jf.intel.com>
 <CA+2tU5_hD-atkp9UcCJnL6TMneSOBxL87=ppvrQ1ugUn_0-7NA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+2tU5_hD-atkp9UcCJnL6TMneSOBxL87=ppvrQ1ugUn_0-7NA@mail.gmail.com>

On Fri, Dec 15, 2023 at 12:18:43PM -0600, Chris Lindee wrote:
> I think there is a typo in the code comment: s/mignt/might/

Fixed, thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
