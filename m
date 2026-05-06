Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA5848C405
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 15:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080957; cv=none; b=ONulvEEzyrD2ykaj7PDv00ta7LR1/L2iygNQUUZYmL/8Z1Pgq3ZPqzIR4+2OC4wolbmRPsJFa3Mf0p81s3buC+eHqmUKUrPzanI1hPPfqonpkFZsePZP+efklCsD3h/z9dzji5TWfNlGrodKiduOYvOB6UI/CDrB2QCARbHXeY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080957; c=relaxed/simple;
	bh=hbB68Mo6u/IPP2ovVkT2sj3ajh8a4Sa30RDg6ZHW2tU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I1/YIzHz7xhaPdNY42d5CWQVzbpH8GvLjau9FiqJ4lQ2eydkv8zJ47QOYLZ/XYGoGYybpLDNh6ApCWh1f8ET8g0djnzPfbEv+SA50XVW5BrHrh+jVr7PoAQJynRGwvg+1H91jkxkns+KUcm/BSveK2iPtsh3OFX/ZNZ4+PKDK7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h2+BrOw5; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h2+BrOw5"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c7985752be1so2383293a12.0
        for <regressions@lists.linux.dev>; Wed, 06 May 2026 08:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778080952; x=1778685752; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=buwWB1nkgqPih7qI3rf/2APZUYQhP2m22o6eBnTuB5o=;
        b=h2+BrOw5nzQudWD7b8LlWoXE5nXdbVavIgOuTbAK0MrG/fGw46xfJDf7JqVjXbyixS
         hvyE10orBoBY1xwt99WFkHeYd6WTiMZifu88fB7JkoESPrYZP2iiwjMJN4Fn5oiQ+2Ln
         jEbuntiOfiyacDI034RLGjnvOI1gbsV7kGHr4zw09Sab/78p3DeBM7NW0+CsnumVKfhF
         FHz1yzGFcKI/c9d1nXmTvpIwdVsjMN1u6PBE4EGBt9hYS02YrLFTbKVSKkiTii5cg7UZ
         NaoHan7UyzRjM53piTD2pxg1fKXjwyuvs4TcZZZ9CkJO0GO8FsZ9zgmhPj3x8g6PwWdQ
         1aZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080952; x=1778685752;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=buwWB1nkgqPih7qI3rf/2APZUYQhP2m22o6eBnTuB5o=;
        b=diO8OtE9GQEpr7d0O0wxjIRqbIZxOxgw3kJ92KU6El9ydGVJLssh1WoWhFOJFcnmUw
         XCBQiQqeLJBd+9iZxs2az/CO5n7xm72ZmCEaculF+IUCvos6UGJDzDNhryNZSeOhSqAa
         tjPdx+TdBTz10kT58PE+Lfb+B2cETgVDgK5b/b+JFUgrUR3yiFmlUYAAITu6vf0xpx2q
         +DEuHDFHxaUBNr3jqWGnIIjIVVWW5c262mXFkUo9x+HO/61R0OE6MgNuzbGnBpGSzzFN
         4Qx6alR/B3ZeglFj6ttlrCUtZcmPnXD9gtWuyLsp/H1Vt41CdVqMhLha3WUoTkahSFuT
         +5ww==
X-Forwarded-Encrypted: i=1; AFNElJ8Qo9VVvrvPe0Cq5gOBh8JyXcLipNECGPWbTbvoJeMUEe/qEFF23IGu4+0lhTsHmeCYwKpcStlwrKc3BQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyycpkXj0eCnYGqupQCAPovtTqxL/mWNSAY//F1Ct0fkafDNhA6
	HU6Qo2e7JSQT2drlkWFMnrMHKzEjJPV3sdsDWHCN49+QLf58RavB2pO1m2vhLK18xVmt1XyaNvc
	5drceQQ==
X-Received: from pgbcq2.prod.google.com ([2002:a05:6a02:4082:b0:c73:97d4:afe0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a09:b0:3a2:f14a:4290
 with SMTP id adf61e73a8af0-3aa5aa7a02dmr4080837637.38.1778080951955; Wed, 06
 May 2026 08:22:31 -0700 (PDT)
Date: Wed, 6 May 2026 08:22:31 -0700
In-Reply-To: <cd8a2ae6-a276-480d-b942-bcd318a30451@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <adVGrJaRlRooO4su@google.com> <20260409142226.2581-1-lei.chen@smartx.com>
 <adf8Q1VSeAMMyCa_@google.com> <f1c742e0-41c1-4bdc-867c-a768a5eb89c5@leemhuis.info>
 <afs6PJzU3rHZwGv3@google.com> <cd8a2ae6-a276-480d-b942-bcd318a30451@leemhuis.info>
Message-ID: <aftct6WWHdOG_EwX@google.com>
Subject: Re: [PATCH v2] KVM: x86: Rate-limit global clock updates on vCPU load
From: Sean Christopherson <seanjc@google.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Lei Chen <lei.chen@smartx.com>, igor@gooddata.com, jan.cipa@gooddata.com, 
	jaroslav.pulchart@gooddata.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 06, 2026, Thorsten Leemhuis wrote:
> On 5/6/26 14:55, Sean Christopherson wrote:
> > On Wed, May 06, 2026, Thorsten Leemhuis wrote:
> >> On 4/9/26 21:21, Sean Christopherson wrote:
> >>> On Thu, Apr 09, 2026, Lei Chen wrote:
> >>>> commit 446fcce2a52b ("Revert "x86: kvm: rate-limit global clock updates"")
> >>>> dropped the rate limiting for KVM_REQ_GLOBAL_CLOCK_UPDATE.
> >>>>
> >>>> As a result, kvm_arch_vcpu_load() can queue global clock update requests
> >>>> every time a vCPU is scheduled when the master clock is disabled or when
> >>>> the vCPU is loaded for the first time.
> >>>>
> >>>> Restore the throttling with a per-VM ratelimit state and gate
> >>>> KVM_REQ_GLOBAL_CLOCK_UPDATE through __ratelimit(), so frequent vCPU
> >>>> scheduling does not generate a steady stream of redundant clock update
> >>>> requests.
> >>>>
> >>>> Fixes: 446fcce2a52b ("Revert "x86: kvm: rate-limit global clock updates"")
> >>>> Signed-off-by: Lei Chen <lei.chen@smartx.com>
> >>>> Reported-by: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
> >>>> Closes: https://lore.kernel.org/all/CAK8fFZ5gY8_Mw2A=iZVFNVKQNrXQzVsn-HTd+Me9K6ZfmdgA+Q@mail.gmail.com/
> >>
> >> Was this performance regression ever addressed?
> > Nope, not yet.
> > 
> >> Looks like this fall through the cracks, but it's easy to miss something.
> > 
> > It's in my list of patches to apply (probably for 7.2?).  I didn't want to squeeze
> > it into the initial 7.1 pull request for a variety of reasons.
> 
> Hmmm. CCing Linus so he can speak up if he wants to about the following:
> 
> Given that this is a fix for a performance regression[1] I'd say it's
> not as urgent as a "something stopped working" case -- so I guess it's
> something where the "[fix] "within a week", preferably before the next
> rc" approach Linus recently mentioned does not need to be applied strictly.
> 
> But Jaroslav OTOH reported it more than 7 weeks ago already and back
> then called it something that "severely impacts KVM hosts running many
> Firecracker microVMs."[1]; 

For a setup that is likely broken.  On modern hardware, the path in question
should never actually be hit.  I do want to resolve the bug since older hardware
and funky setups do rely on the old behavior, but it's not pants-on-fire urgent.

More importantly, the original reporter(s) hasn't responded to any of our questions,
or to the proposed fix.  I'm not going to rush in a fix if I don't actually *know*
it's going to fix the original problem.

> and a potential fix exists for 4 weeks already. Due to that, 7.2 feels a bit
> too far away for me, as that is still ~15 weeks away. But maybe that's just
> me.

The "user" is also a fairly sizeable company, not some random person that's trying
to use KVM and is blocked.  I highly doubt they are still actually running a buggy
kernel.  E.g. based on a "same workload after rollback" comment in the bug report,
I assume they simply rolled back to the last good kernel (6.18).

Who knows, maybe they also took our hints/suggestions about theire setup being
wonky and addressed whatever hiccup was sending them down the uncommon, already-
slow path.

All in all, AFAICT the only difference between sending this into 7.1 vs. 7.2 is
that the reporter won't be able to upgrade their kernel (without patching) for an
extra ~8 weeks.
