Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CB73B530D
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146097; cv=pass; b=nBWEsaUftQjSTrD8UUX9mBXeLgdOwIdbnDy1C5vlPO/VZOKUpD3R9dFINNzv0MJV+9jfdoMWX0dwPcii1iOjXuRyP3ix9/lF3sZMKBm7/5rerLj2wqJqBuoTujsuq/LG95sSj4Iejg7j9zBZqu8dYf+/Ux5qKsmjoW8KmGw69uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146097; c=relaxed/simple;
	bh=uG48gz07/ERrhaEalqaDAFGeCiIQvVWR0mawwwMKVPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPfRkcEP102cNP+HUhKo3cs+fPr+O7W8EZ6Ijwhdo60uMCEYiRrn095E2TzbL3v1g8tEdEelAc3SsG5SjuOxHxO421mdlcQ8vc7EB9iDITWnnzv+9/l8989y0ClXli1AD8eTASFXe7d+VtxhmK1aKqvZC/E9I2bPotRx2Gv816w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com; spf=pass smtp.mailfrom=gooddata.com; dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b=W63xX7FB; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gooddata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b="W63xX7FB"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso908578eec.0
        for <regressions@lists.linux.dev>; Thu, 07 May 2026 02:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778146095; cv=none;
        d=google.com; s=arc-20240605;
        b=OXfVtsY727H2kaPm9yqG9UGwKdVyfgSQDfvxR4zrzZt6eW0w3iJDqE8GKEaCUPsM6Z
         kB7AB0X8g9V3mTamVYsykd2nY6hKla4ww3xg8jkW2FKyR/vtMog6dBquUBWbk9/RDVEu
         3r0z6gwyUiKnAo2rzOa0b87Eg+lYBKaSHEflo1D7MP9FKeA/8qH/LNFELCg5ZfR8Qy0D
         jHIFy+1AGQP4lTY1bqyBuVVYouHuWg0TwYxYxh813vXWhltOtbEARJcQL2cJZRO/oDig
         +t5SKdYpQQSsEASkiE1KrAkkwbayPGSIommuYU0xpTNbzM1tNQZlPL/RTZ4zVjyMwbu9
         KGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=st4j4yDNd/Vgs2qSKmrVzYM5MgTRPVOHyQ3pVjtByHs=;
        fh=jQLUbJgCj9qrK5MUEd3MPGBDHYxCzUFd9txaW6D/ECE=;
        b=IQb1D84A344gEIFaXqiTOpcaYeoMqe4hgKQH9T/dfEIA2iCMpni84HJFvIb0WP1/gA
         sNmu7ZA/VD8ge0RVk0b4CQq+OIiagD6Db0hnO3rjU0aMZ8RU1/+MFItHlzptv5ujOQCj
         YUJMI/vZ2LiC9uZLAJA7OB67+XA27+6f3D0LZU2PHpcVZgU8S6/w/5uERu2yDQmCCr9q
         x7t6ijQQ5v5HwhbQQg/32eJ0Li7MWmmqQLMTWvpFjXVoCISvi4OmXeqJAvuQiWoisXZe
         9Vwcf7a21PXVV1l95mY+tYPejkplTAwaz65adoug4Uv3WON7BYknzXQDPbWocpsXrPdS
         sihA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gooddata.com; s=google; t=1778146095; x=1778750895; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=st4j4yDNd/Vgs2qSKmrVzYM5MgTRPVOHyQ3pVjtByHs=;
        b=W63xX7FBWzhaGW9P9CgpzRxeam9eW4MoFsct4IeqSPFmnW0uYzdrDw/S0lYkQ8q/LK
         hLEvY6mdkatqkjUX64snFLDlsKMQcQOmSCemZ5x+vJ3WwvjuzqHpkh0jjQ5GLtXYlE/4
         hmchdrx8FNp/dAMHVKv+VarFKQ/uY5TRUf6qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146095; x=1778750895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=st4j4yDNd/Vgs2qSKmrVzYM5MgTRPVOHyQ3pVjtByHs=;
        b=pC6oqjAfoOyvKjPpdYuapdMBbZ22XIrQ/QytJDw3ihSy1Bo6rGF8DHhD67ofztMQnG
         9S+wnuPhFWNXt+4dmsVGoZLTKcD4dp1fz6fPbvXHAxlcWwzEBkGV4N50g7AK//vEZQms
         j6tNjny8/V/KNRX539YCiaXBdQD8oqWB8VsrPM44VkIZ2kCJ7NF6Zh1PgAxk7vz0MVUA
         fMWIv+JJcF/Sg4DMSYmxpG0BM6vrXTDSSjRAjNK4szRN00gs7+u5BSR53CWtWWm2zuyE
         WHUxLChBHd7EIzMgQQZppwXO3MUE9yl1c/ASNPBBc8uTbMhmB9UuhcJ8DDv/HtnQqs41
         nYmg==
X-Forwarded-Encrypted: i=1; AFNElJ+aB4yO5aNE7p2WJyOkqxhfHGXdXtg2q5CZyTThWOJTec+0uhmGqn0fhsw4FECUXsFZpDdYgTmaaJ17kQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKbw30NFNAY1UeVrrhRqOAhspDD+Dgv8Qrq0Jk+EgN+xwIFAmY
	v8TCuxpwS4QYzakGia9FEmQFcYDbx9jyzEKZoFG3V0wVvs8C2AztOeB1jxOCi1q8YAgIxMHZEVh
	8w2pvALWPkaYH1zjrOlGmvrX+aXmEOZ5v44DV8FY8
X-Gm-Gg: AeBDievAiayFwiWJWtjWg6ieZe6udxmrcEn4w+rketh7BGdzd8KEZx25VTfX43G3c8q
	gFurNTaixjXEvGHcwsjAPQGKSTquoupbHyll3F5UbANps01i3Nrn/b750pgW8Fqi6W2TwTrsDCE
	mfqkLYhOsprgqCHMlx1tVWo0A8iAekUD0wrpCxNXIiiVsh5TAu48HuRsmOdOFfZLU+6KH6MJNO8
	mQ/Wo10IhB1P31glThIDaTA9W/6drRxWFwQ1ZmJ8ClSoWT0ns1tXoOfAbFOXlKLSwhjdea6b0qg
	e5orjcrhjqLjaIaOcMI=
X-Received: by 2002:a05:7022:4384:b0:12d:b7e5:a67b with SMTP id
 a92af1059eb24-131851cd4edmr4445274c88.14.1778146094940; Thu, 07 May 2026
 02:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <adVGrJaRlRooO4su@google.com> <20260409142226.2581-1-lei.chen@smartx.com>
 <adf8Q1VSeAMMyCa_@google.com> <f1c742e0-41c1-4bdc-867c-a768a5eb89c5@leemhuis.info>
 <afs6PJzU3rHZwGv3@google.com> <cd8a2ae6-a276-480d-b942-bcd318a30451@leemhuis.info>
 <aftct6WWHdOG_EwX@google.com> <CAK8fFZ4j1tYc+eYH79RQnNSjr9J-SocFL6duMuBg+76NHhRUxQ@mail.gmail.com>
 <afulNSVKMzrx35i_@google.com>
In-Reply-To: <afulNSVKMzrx35i_@google.com>
From: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Date: Thu, 7 May 2026 11:27:47 +0200
X-Gm-Features: AVHnY4LukJFzBmfOx9MgTOo0UGn0C_rQ5CqYrphbLKyaHN6po0yvNBI3CgZDb6I
Message-ID: <CAK8fFZ7LEyyR2ChXCD7B8vjvDcyG1c4jtv3wYMV4GCiUkOi1Pw@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: x86: Rate-limit global clock updates on vCPU load
To: Sean Christopherson <seanjc@google.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Lei Chen <lei.chen@smartx.com>, igor@gooddata.com, 
	jan.cipa@gooddata.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pbonzini@redhat.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

>
> On Wed, May 06, 2026, Jaroslav Pulchart wrote:
> > > On Wed, May 06, 2026, Thorsten Leemhuis wrote:
> > > > On 5/6/26 14:55, Sean Christopherson wrote:
> > > > > On Wed, May 06, 2026, Thorsten Leemhuis wrote:
> > > > >> On 4/9/26 21:21, Sean Christopherson wrote:
> > > > >>> On Thu, Apr 09, 2026, Lei Chen wrote:
> > > > >>>> commit 446fcce2a52b ("Revert "x86: kvm: rate-limit global clock updates"")
> > > > >>>> dropped the rate limiting for KVM_REQ_GLOBAL_CLOCK_UPDATE.
> > > > >>>>
> > > > >>>> As a result, kvm_arch_vcpu_load() can queue global clock update requests
> > > > >>>> every time a vCPU is scheduled when the master clock is disabled or when
> > > > >>>> the vCPU is loaded for the first time.
> > > > >>>>
> > > > >>>> Restore the throttling with a per-VM ratelimit state and gate
> > > > >>>> KVM_REQ_GLOBAL_CLOCK_UPDATE through __ratelimit(), so frequent vCPU
> > > > >>>> scheduling does not generate a steady stream of redundant clock update
> > > > >>>> requests.
> > > > >>>>
> > > > >>>> Fixes: 446fcce2a52b ("Revert "x86: kvm: rate-limit global clock updates"")
> > > > >>>> Signed-off-by: Lei Chen <lei.chen@smartx.com>
> > > > >>>> Reported-by: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
> > > > >>>> Closes: https://lore.kernel.org/all/CAK8fFZ5gY8_Mw2A=iZVFNVKQNrXQzVsn-HTd+Me9K6ZfmdgA+Q@mail.gmail.com/
> > > > >>
> > > > >> Was this performance regression ever addressed?
> > > > > Nope, not yet.
> > > > >
> > > > >> Looks like this fall through the cracks, but it's easy to miss something.
> > > > >
> > > > > It's in my list of patches to apply (probably for 7.2?).  I didn't want to squeeze
> > > > > it into the initial 7.1 pull request for a variety of reasons.
> > > >
> > > > Hmmm. CCing Linus so he can speak up if he wants to about the following:
> > > >
> > > > Given that this is a fix for a performance regression[1] I'd say it's
> > > > not as urgent as a "something stopped working" case -- so I guess it's
> > > > something where the "[fix] "within a week", preferably before the next
> > > > rc" approach Linus recently mentioned does not need to be applied strictly.
> > > >
> > > > But Jaroslav OTOH reported it more than 7 weeks ago already and back
> > > > then called it something that "severely impacts KVM hosts running many
> > > > Firecracker microVMs."[1];
> > >
> > > For a setup that is likely broken.  On modern hardware, the path in question
> > > should never actually be hit.  I do want to resolve the bug since older hardware
> > > and funky setups do rely on the old behavior, but it's not pants-on-fire urgent.
> > >
> > > More importantly, the original reporter(s) hasn't responded to any of our questions,
> > > or to the proposed fix.  I'm not going to rush in a fix if I don't actually *know*
> > > it's going to fix the original problem.
> >
> > Hi Sean, Thorsten,
> >
> > sorry for the missing response from my side, this thread unfortunately
> > ended up in trash due to mail filters on my side and I completely
> > missed it.
>
> No worries, gmail's Spam filter is my nemesis :-)
>
> > I currently don't have the full context loaded back in yet, but I'll re-read
> > the thread and follow up properly once I do.
>
> I think the only remaining question is why/how KVM's master clock is getting
> disabled.  But that's more of a question for your deployment than it is a question
> for upstream; it's possible there's a different KVM bug lurking, but it's more
> likely that something in your setup is incompatible with using the master clock.
>
> Note, it's certainly not "wrong" for the master clock to be disabled, but it's
> quite suprising, especially for Firecracker VMs.  It's worth investigating as
> there might be an underlying issue that's very easy to address, and "fixing" it
> should provide (very) small performance benefits.

I've dug into the "master clock question" and have an idea.

Our Firecracker hosts are themselves L1 KVM VMs (nested
virtualisation) running on AMD EPYC 9454P and EPYC 9455 hardware. Even
though the compute nodes use cpu_mode=host-passthrough in qemu kvm,
the invtsc CPUID bit is filtered out by QEMU, which I hadn't realized.
Without it the guest kernel marks the TSC unstable at boot:
    tsc: Marking TSC unstable due to TSCs unsynchronized
and falls back to kvm-clock as its clocksource.

I suppose that in turn prevents KVM from enabling the master clock for
any L2 guests (the Firecracker microVMs), am I right?

I have resolved the issue by explicitly adding +invtsc to
cpu_model_extra_flags in our OpenStack nova.conf. After this change
the L1 VMs now correctly show constant_tsc and nonstop_tsc in
/proc/cpuinfo and switch clocksource to tsc. I also confirmed the IPI
storm disappears without the v2 patch when +invtsc is present, and
returns when it is absent on a vanilla 7.0.3 kernel.

So could this be the answer to your question: "the master clock was
disabled because QEMU silently drops invtsc even in host-passthrough
mode"?
