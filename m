Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E32A63C2
	for <regressions@lists.linux.dev>; Wed, 13 Dec 2023 14:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="q7UbZsTV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1f/Y8cga"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702478093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XyAu/dvaY/DkWjDuVbo4YHooKe5rm235YodJSmmx5Es=;
	b=q7UbZsTVnS40P+tI/PLuhSi06fTEF/HhSF0zp8iFzVI6gjtPvmcmZ98oOL38rwyTZf6fkp
	bpNmxD6GJleMrMvwskcZogFzaCkAnI0tIcccdezf6OgxDS3HSFVYDUZTS/zJyx4lKxkny5
	kp7NRMDXsIJW5cD8TR12OnxXGP1BCQxxdne2QIXIFSDRprczqwmT+PpAfl2H/2kpsCNiTS
	WwNTPf/vEiMfTr4PVcIUetdI3FuhVHHxIb6clu6ZUNhrDwa2g0YmB67jkPy5M1zDvhnXn5
	F2afe6gFfDW97kkqVjrS1tYSf9/qrsszX9EKJBRAIVt5L+r7+pBFVqEE/08ApQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702478093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XyAu/dvaY/DkWjDuVbo4YHooKe5rm235YodJSmmx5Es=;
	b=1f/Y8cgaQkYFFSGHDGLqtYcB2BEFeyx0zohtDEk+WYxMyirlVYWjVs6M8R+g3LtwvFYL/0
	+8QUvHw9+i8oqDAw==
To: Chris Lindee <chris.lindee@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, regressions@lists.linux.dev, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Ashok Raj
 <ashok.raj@intel.com>, David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [REGRESSION] x86/smpboot/64: System will not boot on v6.5,
 v6.7-rc4
In-Reply-To: <CA+2tU5_TzDQO2U8SGDYhsVPR8iYh8Q8vTqv9+HUc7LN3cV=2Sg@mail.gmail.com>
References: <CA+2tU59853R49EaU_tyvOZuOTDdcU0RshGyydccp9R1NX9bEeQ@mail.gmail.com>
 <20231210110518.GAZXWbbn9+ZNF5kwQV@fat_crate.local>
 <CA+2tU585yW2z37NtYqjVe+ZMw+oU_vbS4X=Q=sAxME8GrPFDpg@mail.gmail.com>
 <87bkavqykk.ffs@tglx>
 <CA+2tU5_TzDQO2U8SGDYhsVPR8iYh8Q8vTqv9+HUc7LN3cV=2Sg@mail.gmail.com>
Date: Wed, 13 Dec 2023 15:34:53 +0100
Message-ID: <87bkaup3w2.ffs@tglx>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12 2023 at 13:11, Chris Lindee wrote:
> On Tue, Dec 12, 2023 at 8:34=E2=80=AFAM Thomas Gleixner <tglx@linutronix.=
de> wrote:
>> Can you please provide dmesg output from 6.7-rc4 with "cpuhp.parallel=3D=
0"
>> on the command line?
>
> Oops, I already upgraded to 6.7-rc5
> <https://koji.fedoraproject.org/koji/buildinfo?buildID=3D2332379>; let me
> know if you would prefer I downgrade.

Nah. That's fine.

> [    0.002775] x2apic: enabled by BIOS, switching to x2apic ops

So BIOS has x2apic enabled, but ...

> [    0.136888] smp: Bringing up secondary CPUs ...
> [    0.136888] smpboot: x86: Booting SMP configuration:
> [    0.136888] .... node  #0, CPUs:      #1
> [    0.013471] x2apic enabled

this is really strange as it means that the APs do not come up with
X2APIC enabled. Oh well. BIOS creativity is unlimited...

> [    0.137980]  #2 #3
> [    0.139937] smp: Brought up 1 node, 4 CPUs

Though that does not really explain why the parallel bringup goes south
as that is not really different from what the serialized bringup is
doing in terms of kicking the APs into life.

Can you try and add "ignore_loglevel earlyprintk=3DttyS0,115200n8" to the
kernel command line and capture dmesg on the serial port when booting
with the parallel hotplug enabled?

Thanks,

        tglx
