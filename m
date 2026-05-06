Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C9F3F23DF
	for <regressions@lists.linux.dev>; Wed,  6 May 2026 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072136; cv=none; b=dzIYJfwVt4cby1veXOMIGVXl+Uo75BvfSUcGU+fk/lBt589COrLLzt0Ba8vyx0jPov16D/iytseBxojMEKhM4n5LLcGHhCLf3D7IlNCPgAXqaX7aHj864haXwmrD2yViMAAty4iyq3dq3Zm+w/sp6EceCRQNqSt0Mh6m0SKd3P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072136; c=relaxed/simple;
	bh=BJQMw0Dh46S8PcBKryF9N9BDyA2dfY6w0ySC4+x6YQc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NIeTQMGO3NECPtaJcRPAnHywJoTOFwU2x8DN4vHgJrsfqz9hc57AKnIMdUrZYLCjaRfi4F11zyKGQfHaKYmXXmi8jDMVBk9Lx6dbtay1wsEwiPRI49IPLSMCA3JmBbHx60ozTbUJnMvsOmlhDK0UJCjEhxGx7dfuqPTT3iAFvtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DEDIAG3f; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DEDIAG3f"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c7985752be1so2305888a12.0
        for <regressions@lists.linux.dev>; Wed, 06 May 2026 05:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778072126; x=1778676926; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EcBCFuoSCXIkQ6NjTEoF6df40RIio8PzOnuLVmySm0w=;
        b=DEDIAG3f7PKz2tILjS4b3KYka4I5KCC3a/bTD40xZ2ltGp6RURRvzQPZPaa96Csvio
         7KdOazsev2yZ9hLeUMLnN/ZDjd4YZuHjWGC6/39Ke7cazRVlIAfabwpwL5aYtwptytZE
         3wG3duGkYxNwQx3QK45TVbPdqE9ZD1RavNssRXvR+On3gY/97RGVfQn6x5maz9ugrTgu
         pGdZ1Aas+qnL+RYcGaaCqa3xM+6WAuw6WwPMNXk07r6ISx+1oDvadN3K0xYxFbHf5cSn
         A88n9digWYHH9IytByzEjW9x+7nwW/Pd7VwrYQ3J9nGfTNvF+tT70T/CYSnOlFSTyCch
         GDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072126; x=1778676926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcBCFuoSCXIkQ6NjTEoF6df40RIio8PzOnuLVmySm0w=;
        b=HwdEbHmnyL3VhYLkRESg/MZnu3r93W8Ds3EqM6+2CYNZwQH5R63TW9vj8asUmR+gBG
         amCYFS1VoVDDwJtNu/JHoCxZfWw1p3FwCnBGHlAKfrbi9sZkhO7n4AQSnLi6Gjjm6+/5
         GSUHN/BW6GGFRVF8j+Z6zdN59fQNvPqFS/ffG6XMFO1fv7npPW0omZr+PsyVejgpLkIu
         PVFJ0V5zduPvX5tcw9NcTJjsdT8nTZHUX5t4IGDoT9RemiXS4WE8hShXaNN04hY7udb7
         B6VfrM7DvlpuCv4eSnYIA2+i3JEc+NGptZDu4R4nIF+5bc8exggCRktHs+Qmvlofqo9Z
         PoRw==
X-Forwarded-Encrypted: i=1; AFNElJ+UiHWbHSRuULKSsp2voz7AJiU+V2UfCLuDyQrHL5aZ3PHcvfNFJSpkuVuba2GCigszSY4CJpjf8ZoyLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVEl+50cXMymkO/UAU82vy+ZFtjydx4wn2hh0Uzl9XU7oGWYEj
	NHHKXeUMsp5EF03JbcttkS0QsUgk9qDNos7WfbiEhyTkJSgiz9UViclMyAgXDo+DLmVNeQwMUi7
	pOPa0Mg==
X-Received: from pfbhs6.prod.google.com ([2002:a05:6a00:6906:b0:82e:7f41:df84])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2990:b0:82f:390a:69df
 with SMTP id d2e1a72fcca58-83a5dc5df2emr3180240b3a.35.1778072125801; Wed, 06
 May 2026 05:55:25 -0700 (PDT)
Date: Wed, 6 May 2026 05:55:24 -0700
In-Reply-To: <f1c742e0-41c1-4bdc-867c-a768a5eb89c5@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <adVGrJaRlRooO4su@google.com> <20260409142226.2581-1-lei.chen@smartx.com>
 <adf8Q1VSeAMMyCa_@google.com> <f1c742e0-41c1-4bdc-867c-a768a5eb89c5@leemhuis.info>
Message-ID: <afs6PJzU3rHZwGv3@google.com>
Subject: Re: [PATCH v2] KVM: x86: Rate-limit global clock updates on vCPU load
From: Sean Christopherson <seanjc@google.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Lei Chen <lei.chen@smartx.com>, igor@gooddata.com, jan.cipa@gooddata.com, 
	jaroslav.pulchart@gooddata.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 06, 2026, Thorsten Leemhuis wrote:
> On 4/9/26 21:21, Sean Christopherson wrote:
> > On Thu, Apr 09, 2026, Lei Chen wrote:
> >> commit 446fcce2a52b ("Revert "x86: kvm: rate-limit global clock updates"")
> >> dropped the rate limiting for KVM_REQ_GLOBAL_CLOCK_UPDATE.
> >>
> >> As a result, kvm_arch_vcpu_load() can queue global clock update requests
> >> every time a vCPU is scheduled when the master clock is disabled or when
> >> the vCPU is loaded for the first time.
> >>
> >> Restore the throttling with a per-VM ratelimit state and gate
> >> KVM_REQ_GLOBAL_CLOCK_UPDATE through __ratelimit(), so frequent vCPU
> >> scheduling does not generate a steady stream of redundant clock update
> >> requests.
> >>
> >> Fixes: 446fcce2a52b ("Revert "x86: kvm: rate-limit global clock updates"")
> >> Signed-off-by: Lei Chen <lei.chen@smartx.com>
> >> Reported-by: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
> >> Closes: https://lore.kernel.org/all/CAK8fFZ5gY8_Mw2A=iZVFNVKQNrXQzVsn-HTd+Me9K6ZfmdgA+Q@mail.gmail.com/
> 
> Was this performance regression ever addressed?

Nope, not yet.

> Looks like this fall through the cracks, but it's easy to miss something.

It's in my list of patches to apply (probably for 7.2?).  I didn't want to squeeze
it into the initial 7.1 pull request for a variety of reasons.
