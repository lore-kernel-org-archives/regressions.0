Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F85168D4
	for <regressions@lists.linux.dev>; Fri, 15 Dec 2023 08:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wj0cogdk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qwcARWpO"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702630739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fVoqM5HU0JjZ4p80cACqYi9bMmDxTgM3jcL5EeiKqTo=;
	b=wj0cogdkWY+jXXnUx2egI8DMa738iGwFNFmOapfakDjjdQg/SSxz5NZEEQCIlDkPX1unx1
	D0yx6I9/KHIdw0YXE6W1G8ujDPvKGUdgqPc8qHmKT7xBKeEogb8c3eVywYhkIWNWp44Ftx
	tvJr96Zi1FE3xJFaFmqF4Qic4pT0qnLbKBCwSEABC1TUz9pPL9it/+3Mhe9YIHFslVQwlh
	i5d0XXKzPETvqWChyafhAKJAOixo5k78P4ib4oArocfQciG317lXIkE2QvOKl5MH0oUyvy
	niKur4Hm18kbWsCEWQk/I0TX5W/EUnN8I6hU6c4H6M/TA/B9iycYhX9kMbHv/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702630739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fVoqM5HU0JjZ4p80cACqYi9bMmDxTgM3jcL5EeiKqTo=;
	b=qwcARWpOhwNVwu/u/LbT99FhDgj35B0uEkkyoSDmxCwTIx2dZgKVfgop/xwJhr86a/YCBQ
	HIBOp8NSTeCw+rAg==
To: Chris Lindee <chris.lindee@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, regressions@lists.linux.dev, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Ashok Raj
 <ashok.raj@intel.com>, David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH] x86/smpboot/64: Handle X2APIC BIOS inconsistency gracefully
In-Reply-To: <CA+2tU596G+auWJ2MzYFJ3bv=Y4zP2NSrdtak7SdF9SH6Ht_dzg@mail.gmail.com>
References: <CA+2tU59853R49EaU_tyvOZuOTDdcU0RshGyydccp9R1NX9bEeQ@mail.gmail.com>
 <20231210110518.GAZXWbbn9+ZNF5kwQV@fat_crate.local>
 <CA+2tU585yW2z37NtYqjVe+ZMw+oU_vbS4X=Q=sAxME8GrPFDpg@mail.gmail.com>
 <87bkavqykk.ffs@tglx>
 <CA+2tU5_TzDQO2U8SGDYhsVPR8iYh8Q8vTqv9+HUc7LN3cV=2Sg@mail.gmail.com>
 <87bkaup3w2.ffs@tglx>
 <CA+2tU5-RoR8qCGRdsMH0wo5n8v4fV8A_H5yT+mZadsF7E+QkWg@mail.gmail.com>
 <CA+2tU5-18YQSpFzgUKyeZdJXe0Rs0GxtYY2s5QjznzTucJKCiQ@mail.gmail.com>
 <87ttolnu36.ffs@tglx>
 <CA+2tU596G+auWJ2MzYFJ3bv=Y4zP2NSrdtak7SdF9SH6Ht_dzg@mail.gmail.com>
Date: Fri, 15 Dec 2023 09:58:58 +0100
Message-ID: <87cyv7on8t.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Chris reported that a Dell PowerEdge T340 system stopped to boot when
upgrading to a kernel which contains the parallel hotplug changes.
Disabling parallel hotplug on the kernel command line makes it boot again.

It turns out that the Dell BIOS has x2APIC enabled and the boot CPU comes
up in X2APIC mode, but the APs come up inconsistently in xAPIC mode.

Parallel hotplug requires that the upcoming CPU reads out its APIC ID from
the local APIC in order to map it to the Linux CPU number.

In this particular case the readout on the APs uses the MMIO mapped
registers because the BIOS failed to enable x2APIC mode. That readout
results in a pagefault because the kernel does not have the APIC MMIO space
mapped when X2APIC mode was enabled by the BIOS on the boot CPU and the
kernel switched to X2APIC mode early. That page fault can't be handled on
the upcoming CPU that early and results in a silent boot failure.

If parallel hotplug is disabled the system boots because in that case
the APIC ID read is not required as the Linux CPU number is provided to
the AP in the smpboot control word. When the kernel uses x2APIC mode
then the APs are switched to x2APIC mode too slightly later in the
bringup process, but there is no reason to do it that late.

Cure the BIOS bogosity by checking in the parallel bootup path whether the
kernel uses x2APIC mode and if so switching over the APs to x2APIC mode
before the APIC ID readout.

Fixes: 0c7ffa32dbd6 "x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup() and enable it"
Reported-by: Chris Lindee <chris.lindee@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Chris Lindee <chris.lindee@gmail.com>
Cc: stable@vger.kernel.org
---
 arch/x86/kernel/head_64.S |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -268,6 +268,22 @@ SYM_INNER_LABEL(secondary_startup_64_no_
 	testl	$X2APIC_ENABLE, %eax
 	jnz	.Lread_apicid_msr
 
+#ifdef CONFIG_X86_X2APIC
+	/*
+	 * If system is in X2APIC mode then MMIO base mignt not be
+	 * mapped causing the MMIO read below to fault. Faults can't
+	 * be handled at that point.
+	 */
+	cmpl	$0, x2apic_mode(%rip)
+	jz	.Lread_apicid_mmio
+
+	/* Force the AP into X2APIC mode. */
+	orl	$X2APIC_ENABLE, %eax
+	wrmsr
+	jmp	.Lread_apicid_msr
+#endif
+
+.Lread_apicid_mmio:
 	/* Read the APIC ID from the fix-mapped MMIO space. */
 	movq	apic_mmio_base(%rip), %rcx
 	addq	$APIC_ID, %rcx
