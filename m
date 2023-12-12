Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BFA20DC1
	for <regressions@lists.linux.dev>; Tue, 12 Dec 2023 14:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zyliGe0P";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hcxAK+Ox"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702391676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eyE9buOUh7DfxvuagiOujMrDpshiO54wBdPgIfDSoBE=;
	b=zyliGe0PDwK7qbtO1ffRqQRCSHQSPTboYuJ1CEDeYtYRxMqCqctmwIs4ySKD+pUOD2j1Oh
	WFIraQL5Yrzey1tBhpoDiYBfWKCDYiA6orLePE+NvaYZSOkIia4uSysczu5qNs79WljS8L
	rFcXypqK8om9TtT49m3gs+YHaCSzSoa2uj8cFSmdQ8YjGVYsgot7Lk8tRw+hZOkYPUTY69
	nmr5VVMICe6RFowkna/YsYjDGfg3TrBrDPPD9CbCKIeGHqkxPy7aOqgLijytNb6w3Vy8Hx
	eLog1Vn6lv0REeZMaBrC49KU3/d9I7A0a+pAkSWVsDSE/2u7RzQvvGub4D/AHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702391676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eyE9buOUh7DfxvuagiOujMrDpshiO54wBdPgIfDSoBE=;
	b=hcxAK+OxUuIaY2+NwhyHJj74qBmGaksvxAZEcXvTrTmBI9hBKN16C8uypiVkgi9r/KJDuC
	kb8pFKJlI+Jhi4BQ==
To: Chris Lindee <chris.lindee@gmail.com>, Borislav Petkov <bp@alien8.de>
Cc: regressions@lists.linux.dev, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Ashok Raj <ashok.raj@intel.com>, David Woodhouse
 <dwmw@amazon.co.uk>
Subject: Re: [REGRESSION] x86/smpboot/64: System will not boot on v6.5,
 v6.7-rc4
In-Reply-To: <CA+2tU585yW2z37NtYqjVe+ZMw+oU_vbS4X=Q=sAxME8GrPFDpg@mail.gmail.com>
References: <CA+2tU59853R49EaU_tyvOZuOTDdcU0RshGyydccp9R1NX9bEeQ@mail.gmail.com>
 <20231210110518.GAZXWbbn9+ZNF5kwQV@fat_crate.local>
 <CA+2tU585yW2z37NtYqjVe+ZMw+oU_vbS4X=Q=sAxME8GrPFDpg@mail.gmail.com>
Date: Tue, 12 Dec 2023 15:34:35 +0100
Message-ID: <87bkavqykk.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Chris!

On Mon, Dec 11 2023 at 12:32, Chris Lindee wrote:
> My system hardware remains available for testing.  What further information
> do you need?

Can you please provide dmesg output from 6.7-rc4 with "cpuhp.parallel=0"
on the command line?

Thanks,

        tglx
