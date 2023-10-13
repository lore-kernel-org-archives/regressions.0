Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEEC21A0A
	for <regressions@lists.linux.dev>; Fri, 13 Oct 2023 19:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ligLbR3I";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tbH9+L9P"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1697226009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fCGKxzLZWj4S4hrSXmX4P870KGjXpVAyocmh4+CYbI4=;
	b=ligLbR3II+rQuW3nERxkfAV4vIwezv3LZTd5q3RS+zzYk4aYdY3Dwo/+oSyF9DAdAQvxVA
	upgaXl6SoCuc7+OJrYvbjX5NtX3RjrO2t3iCb5XjDSgsfVaM5v+xOPApvbWMTskksmRdzl
	W4QVOcDC+EctWHdinlOGIVOY1aUlDYj+USyNxJJWEtZPdvcTD2CM/JPKg/SJGItsYl/UfL
	A+HvOPBXPNYAAiw2wfNF6s6UCEKPSu3RSnmYzbq74Kqbscv1AmzQCVMVKjDFRkZFLSLN5j
	+QdU8SPaIYeUX4aqXuzZlgel8zXBBDsLcpzLffGN+FU2XAtbYWpNhAKVb9tLvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1697226009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fCGKxzLZWj4S4hrSXmX4P870KGjXpVAyocmh4+CYbI4=;
	b=tbH9+L9P8/gKKy+nwLESO74sTCLWDX7T59YT/ZAVNZsKpam+mFI8bFJLrFKB+oDmnYi7X2
	+D99R10IjkfTx0Aw==
To: Linus Torvalds <torvalds@linux-foundation.org>, Linux regressions
 mailing list <regressions@lists.linux.dev>
Cc: Yanjun Yang <yangyj.ee@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Ashok Raj <ashok.raj@intel.com>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 the arch/x86 maintainers <x86@kernel.org>
Subject: Re: [regression] some Dell systems hang at shutdown due to
 "x86/smp: Put CPUs into INIT on shutdown if possible" (was Fwd: Kernel 6.5
 hangs on shutdown)
In-Reply-To: <CAHk-=wj99i00K5ZD_OJj3d8rLG07bnTH=0_GxpzxrSzNF-WYQQ@mail.gmail.com>
References: <e6d1dae8-e28a-455a-a851-661c825fbdcf@gmail.com>
 <9787bd09-91b3-4a79-9ca9-e7199c925f36@leemhuis.info>
 <CAHk-=wj99i00K5ZD_OJj3d8rLG07bnTH=0_GxpzxrSzNF-WYQQ@mail.gmail.com>
Date: Fri, 13 Oct 2023 21:40:08 +0200
Message-ID: <87pm1i71lz.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 13 2023 at 10:48, Linus Torvalds wrote:
> On Fri, 13 Oct 2023 at 05:05, Linux regression tracking (Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> Thomas, turns out that bisection result was slightly wrong: a recheck
>> confirmed that the regression is actually caused by 45e34c8af58f23
>> ("x86/smp: Put CPUs into INIT on shutdown if possible") [v6.5-rc1] of
>> yours. See https://bugzilla.kernel.org/show_bug.cgi?id=217995 for details.
>
> That commit does look pretty dangerous.
>
> If *anything* is done through SMI after the code does that
> smp_park_other_cpus_in_init() sequence, I wouldn't be surprised in the
> least if the machine is hung.
>
> That's made worse since it looks like the shutdown sequence isn't
> necessarily run on the boot CPU, so the boot CPU itself may be in
> INIT, and any SMI quite possibly ends up treating that CPU specially.

smp_park_other_cpus_in_init() bails out early when it's not invoked on
the boot CPU because sending INIT to the BSP results in a full machine
reset. So that's definitely not the problem.

> Who knows what SMI does, but the fact that the affected machines seem
> to be mainly from one particular manufacturer does tend to imply it's
> something like that.

It's mostly DELL machines. The rest seems to be Lenovo and Sony with
Alderlake/Raptorlake CPUs - at least that's what I could figure out from
the various bug reports. I don't know which CPUs the DELL machines have,
so I can't say it's a pattern.

Bagas, can you please provide the output of /proc/cpuinfo ?

> And the code does do a fair amount *after* shutting down cpu's. Not
> just things like calling x86_platform.iommu_shutdown(), but also
> things like possibly the tboot shutdown sequence (which almost
> *certainly* is some SMI thing).

That should not matter, but who the heck knows.

> I dunno. Thomas - I htink the argument for that commit was fairly
> theoretical, and reverting it seems the obvious thing, unless you have
> some idea of what might be wrong.

I agree with the revert for now.

The problem is not entirely theoretical in the kexec() case, but yes for
shutdown/reboot it's irrelevant.

The reason why I ended up with this is the initial problem of soft
offlined CPUs sitting in MWAIT. The kexec() kernel can end up writing to
the monitor cache line reliably after it overwrote the original kernel
mappings, which results in completely undebugable chaos or triple
faults.

The MWAIT issue is mitigated by writing to the monitor cache lines and
forcing the CPUs into HLT.

Extensive testing revealed that HLT is not entirely safe either, so we
ended up with the INIT trick, which turned out to be very reliable in
testing. Though it's obviously making some BIOSes very unhappy. Sigh...

Did I mention before that I hate computers with a passion?

Thanks,

        tglx
