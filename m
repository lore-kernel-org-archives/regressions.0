Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA16A4963D6
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083121; cv=pass; b=DIty+VEKwFbPMCDr+S56OhFN7L71ZK0ABGq/AgKmoWjvD6pDge2v8rjtEWvaEHlAK26RN4otzdiE8zeuMoUfPr302V5UmwfoOdq5SY9KzCQqwcbw8DwFKcwQTDKcVuExsonHexa2kS3jUP44SDtkRcygq4jEO6dqdItVej9PtuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083121; c=relaxed/simple;
	bh=FhSYlENSAfffr0fB2hnLYwj9NycYdYCk8jtg8WRyAe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAuEligMyHaeUze8fG13nIcBj3o9GcpO0oiuxGjDpA2jUiumclqKfBrfFhS0qq4Hn2qM2WoyWdPX/+jVE1UOUTb/xUtuq0AR1uEgPleov4pfblhnSOjXw8JQWCRbdRfJAgRf/F3AdQAIiRCWUHidJ8Zk1sa491mNY6+IlBNZ3Wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com; spf=pass smtp.mailfrom=gooddata.com; dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b=OTbB0Z0d; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gooddata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b="OTbB0Z0d"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12dfee30612so404872c88.0
        for <regressions@lists.linux.dev>; Wed, 06 May 2026 08:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778083115; cv=none;
        d=google.com; s=arc-20240605;
        b=TJmWI/4351rmzFLZjnjj28J0mm6k1g3Zjbq7812YXt5rDTmbmDMUeuGhMtyRTs79Mj
         hQBThjaHTCn6xKNqT/kn2nbgz8Mv+lYKmyo453dJsAFjWfSxGct0PBV2txhjCqqz8p16
         anBnDuipKvfzPDV/w8bKE/zfSfBOhtXgVek/wV00I4AGAnq3g0rikgSsCY3OXcX1Am5y
         N+AMGVetlvCUBvvpPtR5VyNqsh3t8eS+0EskJvGtnS8TqFe+3H6LReZ/osinOkZV+9mg
         SWtaf2WA94MsTBg7JLpBUcyVz4KWjWEngJhd4M16HMx7hEomeSDACu53ACq70egxhxc4
         tp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o7GIM54i3SVstJr/lO8ZPGq5HIJS7v25gtjFcSTW0Uo=;
        fh=rLkGH0wxTiPcv1gS1UXFh8bLFWp1Pkxx8PT3dVLm+h8=;
        b=aolJR09lcTJCevFw4Q3Ol/CIYJNWcfq5IBMtfN9Ytm3Nl9gQkqeC2suHcuiPJHLe9p
         V7j9GAhxb79TxiMdmeOJh4XpPQHoLyoTcBdHyC8/UCm/0h1N0EtC47GgfH+RpHHIowFh
         Nmwuk6evnG1q7IzCXlnsr3Qv5VbejxH8Jm5+nGrBsIHi/XlgnZYCzikezGU7W5uhU5wV
         thBTuU6PwMWogeOoZS8tCgr3aRZWYY2k2Knv+YYsFUbsoIxp7jvKYE6z5L/svHNzCT4m
         qrKwKvNogAjppPTKEDKeiU5K1Rk7a5S8Lb5wwjJwRMGVgL7WeN7uAgg5LEPzVcLlhK1u
         Kiig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gooddata.com; s=google; t=1778083115; x=1778687915; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o7GIM54i3SVstJr/lO8ZPGq5HIJS7v25gtjFcSTW0Uo=;
        b=OTbB0Z0dk7Liu2zDCW0mwrmyfXsyvUsuPWn6/agmo+QTwltjOwQYod4rwCGRUmccDt
         6lg4Ayopss6FDNQwNPX0RNy+h1ImTd8BQaWBioZ9pM4gv/bkafsEQNMhRUYKIL/Gn29Q
         aBfZ8gwsOA4b2TMFm0FWx/3Pk/YwI40VlzV4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778083115; x=1778687915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7GIM54i3SVstJr/lO8ZPGq5HIJS7v25gtjFcSTW0Uo=;
        b=QUn9UH33vrk5uLl3ffbjdsS6ii6Qg6xzQJuOnWWeVINONMfvPltGFbm+dQB/5Abrn5
         4Ds0JlTnqv6wyB5C9TsIpMuv8DQZr/a44U57eU8KeavLNajGjYKKICvnRr42SRh1PAVY
         uoyuMKlexS3xRKX41QnWbZofz2e/8/BGLdwBKy3Z/m2AYoa5Y9UXe9hz80PUmdT/up/J
         bzonFKpb4PKLkWvtgFVkzEbm3MYYLJc4wz+OT6vik1G/rtsCSYj8Iu1KNTnmgQi+z4Lz
         l3cDZ0LwXHqGc/8H/MSc7cmFpGOw4kYkQjeJ9CjCKHj8mStn6XpmhgUg8rNr4PCFH+5V
         kMfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gq8RvozPp2yLmxB0J0htLGxQ9izeD39up0HvIz1+Zg+90MMwUnOhIE49+8lznvNOGLk8zkwW+xseKSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXkdwdg76HLqw/f9Mc/e+oMFIkBa7LItq9t9+SjrjtbYmNtIBn
	5lnY7RJayTOZyFbW2b7kfS4r7MZyREvhg+t9EoUFkbRA+aN05G9EZxVOgP5DQ8iXlMqTT9BhdI7
	r2wxN+JqAoxjAurXW7vGfXdYLL+yPQ7Iti5TuDn65PiETDuSMkIWhtOhr
X-Gm-Gg: AeBDievr0dXjmAo19PyM4kfOYokLFlVKQ6I34wHRxP7L/D9gi9v5i9eqoHh9L8E15vB
	Eoz+0ENAOr/ZB6Zr4VLF1LAIq8vvt9b1Crt1ZxFT5GpddM0ityHvz3La2+xJyVz92PzHVg7aBgr
	f1Ziu5cb3uK/Gc1j4p5Ry1FyJnO0iYpGoDNU9fsGFPo9wsi22ZvVvPmoPwSK/QN2XU2nUmzVsdW
	Tkcf3HRAaDFBErTbtG3VUnqMMfLolsJFd6T5vSikhUYMZtMp5zVNatuLwmtNPmPb8XALjq+Jk3/
	4dlesdy+65o8kaRh1/s=
X-Received: by 2002:a05:7022:fa05:b0:128:ca6f:adf2 with SMTP id
 a92af1059eb24-131963a9b86mr2420082c88.32.1778083115090; Wed, 06 May 2026
 08:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <adVGrJaRlRooO4su@google.com> <20260409142226.2581-1-lei.chen@smartx.com>
 <adf8Q1VSeAMMyCa_@google.com> <f1c742e0-41c1-4bdc-867c-a768a5eb89c5@leemhuis.info>
 <afs6PJzU3rHZwGv3@google.com> <cd8a2ae6-a276-480d-b942-bcd318a30451@leemhuis.info>
 <aftct6WWHdOG_EwX@google.com>
In-Reply-To: <aftct6WWHdOG_EwX@google.com>
From: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Date: Wed, 6 May 2026 17:58:08 +0200
X-Gm-Features: AVHnY4ISyvq7t1Jo4cNzuW8GhcCkTyIWQpR3YIS4f7df6O_vWqMubXb7G9-3F-Q
Message-ID: <CAK8fFZ4j1tYc+eYH79RQnNSjr9J-SocFL6duMuBg+76NHhRUxQ@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: x86: Rate-limit global clock updates on vCPU load
To: Sean Christopherson <seanjc@google.com>, Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Lei Chen <lei.chen@smartx.com>, igor@gooddata.com, jan.cipa@gooddata.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

>
> On Wed, May 06, 2026, Thorsten Leemhuis wrote:
> > On 5/6/26 14:55, Sean Christopherson wrote:
> > > On Wed, May 06, 2026, Thorsten Leemhuis wrote:
> > >> On 4/9/26 21:21, Sean Christopherson wrote:
> > >>> On Thu, Apr 09, 2026, Lei Chen wrote:
> > >>>> commit 446fcce2a52b ("Revert "x86: kvm: rate-limit global clock updates"")
> > >>>> dropped the rate limiting for KVM_REQ_GLOBAL_CLOCK_UPDATE.
> > >>>>
> > >>>> As a result, kvm_arch_vcpu_load() can queue global clock update requests
> > >>>> every time a vCPU is scheduled when the master clock is disabled or when
> > >>>> the vCPU is loaded for the first time.
> > >>>>
> > >>>> Restore the throttling with a per-VM ratelimit state and gate
> > >>>> KVM_REQ_GLOBAL_CLOCK_UPDATE through __ratelimit(), so frequent vCPU
> > >>>> scheduling does not generate a steady stream of redundant clock update
> > >>>> requests.
> > >>>>
> > >>>> Fixes: 446fcce2a52b ("Revert "x86: kvm: rate-limit global clock updates"")
> > >>>> Signed-off-by: Lei Chen <lei.chen@smartx.com>
> > >>>> Reported-by: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
> > >>>> Closes: https://lore.kernel.org/all/CAK8fFZ5gY8_Mw2A=iZVFNVKQNrXQzVsn-HTd+Me9K6ZfmdgA+Q@mail.gmail.com/
> > >>
> > >> Was this performance regression ever addressed?
> > > Nope, not yet.
> > >
> > >> Looks like this fall through the cracks, but it's easy to miss something.
> > >
> > > It's in my list of patches to apply (probably for 7.2?).  I didn't want to squeeze
> > > it into the initial 7.1 pull request for a variety of reasons.
> >
> > Hmmm. CCing Linus so he can speak up if he wants to about the following:
> >
> > Given that this is a fix for a performance regression[1] I'd say it's
> > not as urgent as a "something stopped working" case -- so I guess it's
> > something where the "[fix] "within a week", preferably before the next
> > rc" approach Linus recently mentioned does not need to be applied strictly.
> >
> > But Jaroslav OTOH reported it more than 7 weeks ago already and back
> > then called it something that "severely impacts KVM hosts running many
> > Firecracker microVMs."[1];
>
> For a setup that is likely broken.  On modern hardware, the path in question
> should never actually be hit.  I do want to resolve the bug since older hardware
> and funky setups do rely on the old behavior, but it's not pants-on-fire urgent.
>
> More importantly, the original reporter(s) hasn't responded to any of our questions,
> or to the proposed fix.  I'm not going to rush in a fix if I don't actually *know*
> it's going to fix the original problem.

Hi Sean, Thorsten,

sorry for the missing response from my side, this thread unfortunately
ended up in trash due to mail filters on my side and I completely
missed it. I currently don't have the full context loaded back in yet,
but I'll re-read the thread and follow up properly once I do.

For additional context, we are currently running the latest 6.19/7.0.y
kernels with a revert of the commits causing the reported regression,
and the hardware is AMD EPYC 9454P 48-Core Processor.

Jaroslav

>
> > and a potential fix exists for 4 weeks already. Due to that, 7.2 feels a bit
> > too far away for me, as that is still ~15 weeks away. But maybe that's just
> > me.
>
> The "user" is also a fairly sizeable company, not some random person that's trying
> to use KVM and is blocked.  I highly doubt they are still actually running a buggy
> kernel.  E.g. based on a "same workload after rollback" comment in the bug report,
> I assume they simply rolled back to the last good kernel (6.18).
>
> Who knows, maybe they also took our hints/suggestions about theire setup being
> wonky and addressed whatever hiccup was sending them down the uncommon, already-
> slow path.
>
> All in all, AFAICT the only difference between sending this into 7.1 vs. 7.2 is
> that the reporter won't be able to upgrade their kernel (without patching) for an
> extra ~8 weeks.
