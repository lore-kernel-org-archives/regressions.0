Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54092207D
	for <regressions@lists.linux.dev>; Wed, 13 Dec 2023 21:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pPWEOseA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J6PvUke8"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702501737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=67db++YvS3wE3+UbdFxQbkYGN/aNiyxdzJwCP2a+IX0=;
	b=pPWEOseA2hApxvKScYjNQSwOOIa5Oz7r+5xF0aIAL7F532cd19SvbWnGNScaJn43Ckav2v
	VIyH3GDpBuhOIl0RAcL0kdTMZMROc5xA17JD91/8zdyOvqNGnW+go3HSv/r6N/YGbQkUCr
	EoDvLPqiaJNJaip0wLqcwV7D4y9kzmw81jY7/nzcVyh2SDNdbLYcWZf6ApLsamnSktPt/4
	6CE7g6MIdFTDDvjCr8Q4W/HolEh7ESLHJnbVvWSYz3esFBBjoCu5/AAe7U/x1V6oMIG8Uu
	rXeZc+Jy63B28+UAWhl5iEIsoX7k8QZfG0DTRWQW26kY9UEWMk8H6zeLlgBzLQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702501737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=67db++YvS3wE3+UbdFxQbkYGN/aNiyxdzJwCP2a+IX0=;
	b=J6PvUke8Ovc4DutDKdiHVSX+5WAO0Vjejsg6ylsYPfvMrkTJAJCi4dLiAzbXFSdjrmUmBl
	0O7hJRlNsJANijDA==
To: Chris Lindee <chris.lindee@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, regressions@lists.linux.dev, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Ashok Raj
 <ashok.raj@intel.com>, David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [REGRESSION] x86/smpboot/64: System will not boot on v6.5,
 v6.7-rc4
In-Reply-To: <87bkaup3w2.ffs@tglx>
References: <CA+2tU59853R49EaU_tyvOZuOTDdcU0RshGyydccp9R1NX9bEeQ@mail.gmail.com>
 <20231210110518.GAZXWbbn9+ZNF5kwQV@fat_crate.local>
 <CA+2tU585yW2z37NtYqjVe+ZMw+oU_vbS4X=Q=sAxME8GrPFDpg@mail.gmail.com>
 <87bkavqykk.ffs@tglx>
 <CA+2tU5_TzDQO2U8SGDYhsVPR8iYh8Q8vTqv9+HUc7LN3cV=2Sg@mail.gmail.com>
 <87bkaup3w2.ffs@tglx>
Date: Wed, 13 Dec 2023 22:08:57 +0100
Message-ID: <87y1dxolna.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Dec 13 2023 at 15:34, Thomas Gleixner wrote:
> On Tue, Dec 12 2023 at 13:11, Chris Lindee wrote:
> Though that does not really explain why the parallel bringup goes south
> as that is not really different from what the serialized bringup is
> doing in terms of kicking the APs into life.
>
> Can you try and add "ignore_loglevel earlyprintk=ttyS0,115200n8" to the
> kernel command line and capture dmesg on the serial port when booting
> with the parallel hotplug enabled?

Don't bother it wont tell us much and I decoded the issue already. Will
send a patch tomorrow.
