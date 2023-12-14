Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61442D28E
	for <regressions@lists.linux.dev>; Thu, 14 Dec 2023 07:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MVhEOQVR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6F3HU04L"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702537454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qkdckGl6H1OUajWpL3Dmpe6Cq9exini64n9IkyrdXTw=;
	b=MVhEOQVRhR/GPIheUQyFPc4KG1WbMZjP1aj3gLoOlIBjPd8XAkhcn67Z5BBgMnRhW7W6MP
	g8GBfluxddaY14uw1dt7whoVC/geGatUd3plI+vTonruppbz1TktLrkgzZsqrpShd5wYR5
	tx2JR8vTTYep99hwSF290A/SNrBtag2K2t+CGH89RAsrsImnHnMMhzZrVpYycYl1hEkCS8
	9FWWnV+xu4X74igizvgPphdMtyEmaec8dKziQKK5uSVfbXej1K+5I+gwQoUVogKXjBMwD+
	hloxhbyhe1RTVLdToamfDUh82i6iePONFXJl901KRgbmGAFm8cFBo/tIX52vIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702537454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qkdckGl6H1OUajWpL3Dmpe6Cq9exini64n9IkyrdXTw=;
	b=6F3HU04Ldat+rgvNuHxLugx9dfbKUmFWwmqoUO0L7RniqVO/Ct9PuGYrP8DdymIzkP75o4
	HwNDrUMBlkypwKAg==
To: Chris Lindee <chris.lindee@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, regressions@lists.linux.dev, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Ashok Raj
 <ashok.raj@intel.com>, David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [REGRESSION] x86/smpboot/64: System will not boot on v6.5,
 v6.7-rc4
In-Reply-To: <CA+2tU5-18YQSpFzgUKyeZdJXe0Rs0GxtYY2s5QjznzTucJKCiQ@mail.gmail.com>
References: <CA+2tU59853R49EaU_tyvOZuOTDdcU0RshGyydccp9R1NX9bEeQ@mail.gmail.com>
 <20231210110518.GAZXWbbn9+ZNF5kwQV@fat_crate.local>
 <CA+2tU585yW2z37NtYqjVe+ZMw+oU_vbS4X=Q=sAxME8GrPFDpg@mail.gmail.com>
 <87bkavqykk.ffs@tglx>
 <CA+2tU5_TzDQO2U8SGDYhsVPR8iYh8Q8vTqv9+HUc7LN3cV=2Sg@mail.gmail.com>
 <87bkaup3w2.ffs@tglx>
 <CA+2tU5-RoR8qCGRdsMH0wo5n8v4fV8A_H5yT+mZadsF7E+QkWg@mail.gmail.com>
 <CA+2tU5-18YQSpFzgUKyeZdJXe0Rs0GxtYY2s5QjznzTucJKCiQ@mail.gmail.com>
Date: Thu, 14 Dec 2023 08:04:13 +0100
Message-ID: <87ttolnu36.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13 2023 at 23:04, Chris Lindee wrote:
> On Wed, Dec 13, 2023 at 7:35=E2=80=AFPM Chris Lindee <chris.lindee@gmail.=
com> wrote:
>
>> The following are the processor options made available by the BIOS, with
>> the currently selected value.  If there are any interesting combinations
>> that you'd like tested, I can try a handful of them.
>>
>
>> x2APIC Mode: Enabled (requires Virtualization Technology to enable)
>>
>
> I disabled x2APIC and the system would boot, both without "cpuhp.parallel"
> and with "cpuhp.parallel=3D1" on the command line.

I would have expected that.

With the completely untested patch below it should also boot in X2APIC
mode even with the broken AP configuration in the BIOS.

Thanks,

        tglx
---
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -255,6 +255,22 @@ SYM_INNER_LABEL(secondary_startup_64_no_
 	testl	$X2APIC_ENABLE, %eax
 	jnz	.Lread_apicid_msr
=20
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
