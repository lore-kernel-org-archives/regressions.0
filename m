Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B913A1699
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 19:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778180952; cv=none; b=Wk8ye8gYFQFyormz4u6q2SQ0F0Y9joEe9Q4alwdmwbtJAoTmzQKAML5C3irpX20HUPkzIQ17aUuqJDDrXCtnGr1XpGQrHGP1lvBIDKtdeb7NAEYQ5sC/f30Z29TuvBnUOt/6CzHwB0TlufcgW4PtMgPIfqCDub0ch29xb6gSVyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778180952; c=relaxed/simple;
	bh=Ms2KvJFVR6HYBltl81OHgXxkhjfuXDqHHtKaMZKJquE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qSTp/aZBPC2+llaNXnL/a34WetAZ44Fsf0XvvGK48n71lwu2cXFXnLxN4KpCj51A/E0C7NEkaWQPEOjT0I5tuSLOImsrcMVwQSIlI/dW15OYjM9rYZ9ReKBxbzgeKmkjKKa0oG0hBy3grrVdqSnFm6MVXw75WoOywLrGSW9iqoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pBQl3uBg; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pBQl3uBg"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso13366465ad.3
        for <regressions@lists.linux.dev>; Thu, 07 May 2026 12:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778180950; x=1778785750; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6KoXjOK5QFOjtrkDoTfqMRdZ3nPGO5a5QHereU923po=;
        b=pBQl3uBgOi26DAeAZYNhTaU8EIdS4BVp2FXFDex6BWsW/rhFi8SDZpdFiwiwdZSQq5
         VhV0t5uQsYSiRtKgQmfLVR6LTgmlLOUb/2DGnvvMPTJCR0gGySu1I1Q5DiKTlkgvObha
         La4v8LVXN4cX5Nl+2HAFcHgcoVfhAAMDZ/0/b5BPgiK0TIlNAOaKBMGDqlKrgKxD+dv0
         IXr6+nxivY3Z2samosw4JQKhVwjmSL0D6Sj4QLa9MW/qAqL7ib24Y8AAJFKsxDD5L/n9
         4PGC3st8PfmBQlyOcK7OvKRc56Bzsv/gPtl/iihJFs+Cp0A9mWEAQUgyCsGemgKc42Ck
         kz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778180950; x=1778785750;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6KoXjOK5QFOjtrkDoTfqMRdZ3nPGO5a5QHereU923po=;
        b=EPE9UCY/t8lC83/Sf3io34r2JNfS3Ra5eK++mXvcOOk/a7VtboryM0Sf19DMbylSKH
         4rj6FvldKhqQMEEqs22C0JEBbgDpgqrchBIWzechKZ2HInpI2f/spUMWJ47+SIIwWmW5
         bk/y7rO1DSY0cK3IlW33PRxlc0mTlGYzri4lnpJYeuKMqjjXPE8weUxv72R3VrW7qfmr
         aTvDO4RN//feTNd4jyaiBsG2JZpcVtjKLS6VLOKc2VDxhV63dQkaSTT1FDEIPZN6SMQu
         rDFqU3LchfA3p3Xa9hAPl/OyBJMnMyWz+2/4LP5EHVDnlFzEWgRHM33d0/ee/YABZpr6
         Uutw==
X-Forwarded-Encrypted: i=1; AFNElJ+/jWwtFRgqNfK7Q+rxpJmFlxGgPQn+wgvCKAhg6XWKDy0Ky6swIW+xUZCk1RDLfsC7dhjTEeMaqivLOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRt0DT5b2znaDnW2eZdNtOBmFtYXP8ltmwgdO69BfwrC5bj1fm
	kj+m7E2j5DOCRPSrL+KDEVN2oSB9BmqIrlHZFdIOnXJkM1djt3x563nwlnkYUALvFOHuSlz+12Q
	LCu4T7Q==
X-Received: from pgbcp6.prod.google.com ([2002:a05:6a02:4006:b0:c76:a6b1:ed23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:328e:b0:39c:643e:f062
 with SMTP id adf61e73a8af0-3aa5a9056b6mr10273614637.7.1778180950020; Thu, 07
 May 2026 12:09:10 -0700 (PDT)
Date: Thu, 7 May 2026 12:09:09 -0700
In-Reply-To: <CAK8fFZ7LEyyR2ChXCD7B8vjvDcyG1c4jtv3wYMV4GCiUkOi1Pw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <adVGrJaRlRooO4su@google.com> <20260409142226.2581-1-lei.chen@smartx.com>
 <adf8Q1VSeAMMyCa_@google.com> <f1c742e0-41c1-4bdc-867c-a768a5eb89c5@leemhuis.info>
 <afs6PJzU3rHZwGv3@google.com> <cd8a2ae6-a276-480d-b942-bcd318a30451@leemhuis.info>
 <aftct6WWHdOG_EwX@google.com> <CAK8fFZ4j1tYc+eYH79RQnNSjr9J-SocFL6duMuBg+76NHhRUxQ@mail.gmail.com>
 <afulNSVKMzrx35i_@google.com> <CAK8fFZ7LEyyR2ChXCD7B8vjvDcyG1c4jtv3wYMV4GCiUkOi1Pw@mail.gmail.com>
Message-ID: <afzjVYupUl-nlaDK@google.com>
Subject: Re: [PATCH v2] KVM: x86: Rate-limit global clock updates on vCPU load
From: Sean Christopherson <seanjc@google.com>
To: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Lei Chen <lei.chen@smartx.com>, igor@gooddata.com, 
	jan.cipa@gooddata.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pbonzini@redhat.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, May 07, 2026, Jaroslav Pulchart wrote:
> > On Wed, May 06, 2026, Jaroslav Pulchart wrote:
> > > > On Wed, May 06, 2026, Thorsten Leemhuis wrote:
> > I think the only remaining question is why/how KVM's master clock is getting
> > disabled.  But that's more of a question for your deployment than it is a question
> > for upstream; it's possible there's a different KVM bug lurking, but it's more
> > likely that something in your setup is incompatible with using the master clock.
> >
> > Note, it's certainly not "wrong" for the master clock to be disabled, but it's
> > quite suprising, especially for Firecracker VMs.  It's worth investigating as
> > there might be an underlying issue that's very easy to address, and "fixing" it
> > should provide (very) small performance benefits.
> 
> I've dug into the "master clock question" and have an idea.
> 
> Our Firecracker hosts are themselves L1 KVM VMs (nested
> virtualisation) running on AMD EPYC 9454P and EPYC 9455 hardware. Even
> though the compute nodes use cpu_mode=host-passthrough in qemu kvm,
> the invtsc CPUID bit is filtered out by QEMU, which I hadn't realized.
> Without it the guest kernel marks the TSC unstable at boot:
>     tsc: Marking TSC unstable due to TSCs unsynchronized
> and falls back to kvm-clock as its clocksource.
> 
> I suppose that in turn prevents KVM from enabling the master clock for
> any L2 guests (the Firecracker microVMs), am I right?
> 
> I have resolved the issue by explicitly adding +invtsc to
> cpu_model_extra_flags in our OpenStack nova.conf. After this change
> the L1 VMs now correctly show constant_tsc and nonstop_tsc in
> /proc/cpuinfo and switch clocksource to tsc. I also confirmed the IPI
> storm disappears without the v2 patch when +invtsc is present, and
> returns when it is absent on a vanilla 7.0.3 kernel.
> 
> So could this be the answer to your question: "the master clock was
> disabled because QEMU silently drops invtsc even in host-passthrough
> mode"?

Yep, that'd do it.   Linux-as-a-guest will prefer kvmclock over TSC if the TSC
isnt constant and non-stop.  That in turn will prevent KVM (as the L1 hypervisor)
from using the master clock, since it sees the kernel clocksource as not being
(directly) based on TSC.

Thanks for the follow-up!
