Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332C429B4
	for <regressions@lists.linux.dev>; Thu, 15 Jun 2023 18:36:00 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f7f7dfc037so16705e9.0
        for <regressions@lists.linux.dev>; Thu, 15 Jun 2023 11:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686854159; x=1689446159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/omKCOwcp2EQQ6DXjBeRhC2FJTA991mg7uA9FudSf/A=;
        b=7WdakyK4oshrb7I5mdAEawHE0gqSwfLUnysc+u81KTB9OE/I+XGjBLzBBp3ij1Rroi
         p+5EBevPxH87tpo3p3ieW1oj0qbl3XssFNbWV8YRR1BVb1DePQYjtvaKoPZXBGi/AwCV
         ykyKgG90f8VITucN+MA3Hre7wb28C1mpX2VXgUjdWwKmK4RsaEBv7adwXOV4dOUDZjNQ
         g7XDBzFN9y+PwMvzc35xpRyystMw8iseLKE9SuXRwRhPgM+LTT2jq/oTyyz8f6P0mJiS
         euovvm+o/bp6aOraSWwOXY4j20rWBPjWLMdzrVgGv2LUVLQylboa8sPwWcZr5/ktJiXg
         dhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686854159; x=1689446159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/omKCOwcp2EQQ6DXjBeRhC2FJTA991mg7uA9FudSf/A=;
        b=R2N50ecU4bV1yDH7NEzp0C563zeDiBHK3x85rNfFO7kHj51hn5bquekcHPHuJiGKWF
         blsINizHGl3BkOR0xnWmKvtr0jmINDTQXbgeMJDTjNy3/8iWsKFYQw7hx9JD/NcBANL0
         DLkSTl/j0C1yXO+2BFQzcHnCkpfH8YDkDkZvg9Je9PWk60DQBB/hjXbPC6ws/+PAFRGD
         AkmiwwpyiHRqXQj2pSfTl2WOb3DtafrcuQri/x8p2jMj9enp559wx7NS8UPdH7B8GEks
         vBqCslpx+CsnyZlig9zyO58l+3atdQwZeAUGhR1plQ9OJFIgQl288upMl9EyFPve6sg/
         5DcA==
X-Gm-Message-State: AC+VfDw33aPL3DtmfVeAVyLfW/EO4duBh8ROKqp45KAh27DSw80YjuOX
	VQ3HZ9mHpO62ksrVZYkfimILyCCsmpCq9JUaXIpP
X-Google-Smtp-Source: ACHHUZ79usijn1wldJc0UmWEzOBq8i+jS57yOqXyNMWUbtJum/djNxOiWYDRtdkAS1PE7qMfthc7LVkEy7WkdFS9y7M=
X-Received: by 2002:a05:600c:4e52:b0:3f7:e4d8:2569 with SMTP id
 e18-20020a05600c4e5200b003f7e4d82569mr224049wmq.5.1686854159080; Thu, 15 Jun
 2023 11:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJc0_fwx6MQa+Uozk+PJB0qb3JP5=9_WcCjOb8qa34u=DVbDmQ@mail.gmail.com>
 <2023061453-guacamole-porous-8a0e@gregkh> <CAADnVQLuHTNPEuXpSUgkNHoK1-X8KxU=spdYWB2bMp6icS+j0g@mail.gmail.com>
In-Reply-To: <CAADnVQLuHTNPEuXpSUgkNHoK1-X8KxU=spdYWB2bMp6icS+j0g@mail.gmail.com>
From: Robert Kolchmeyer <rkolchmeyer@google.com>
Date: Thu, 15 Jun 2023 11:35:46 -0700
Message-ID: <CAJc0_fwKZS2=9DfaNSNF7-UBsXTEaopNFXdK3i57KcxUm5rOvA@mail.gmail.com>
Subject: Re: BPF regression in 5.10.168 and 5.15.93 impacting Cilium
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, stable <stable@vger.kernel.org>, 
	regressions@lists.linux.dev, Martin KaFai Lau <kafai@fb.com>, 
	Alexei Starovoitov <ast@kernel.org>, Sasha Levin <sashal@kernel.org>, Paul Chaignon <paul@isovalent.com>, 
	Meena Shanmugam <meenashanmugam@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	bpf <bpf@vger.kernel.org>, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2023 at 2:48=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Jun 14, 2023 at 1:57=E2=80=AFPM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > On Wed, Jun 14, 2023 at 11:23:52AM -0700, Robert Kolchmeyer wrote:
> > > Hi all,
> > >
> > > I believe 5.10.168 and 5.15.93 introduced a regression that impacts
> > > the Cilium project. Some information on the nature of the regression
> > > is available at https://github.com/cilium/cilium/issues/25500. The
> > > primary symptom seems to be the error `BPF program is too large.`
> > >
> > > My colleague has found that reverting the following two commits:
> > >
> > > 8de8c4a "bpf: Support <8-byte scalar spill and refill"
> > > 9ff2beb "bpf: Fix incorrect state pruning for <8B spill/fill"
> > >
> > > resolves the regression.
> > >
> > > If we revert these in the stable tree, there may be a few changes tha=
t
> > > depend on those that also need to be reverted, but I'm not sure yet.
> > >
> > > Would it make sense to revert these changes (and any dependent ones)
> > > in the 5.10 and 5.15 trees? If anyone has other ideas, I can help tes=
t
> > > possible solutions.
> >
> > Can you actually test if those reverts work properly for you and if
> > there are other dependencies involved?
> >
> > And is this issue also in 6.1.y and Linus's tree?  If not, why not, are
> > we just missing a commit?  We can't revert something from a stable
> > release if you are going to hit the same issue when moving to a new
> > release, right?
> >
> > thanks,
> >
> > greg k-h
>
> Before jumping to reverts..
> how is it fixed in 6.0+ kernels?
>
> "BPF program is too large" can probably be worked around on the cilium si=
de.
> The kernel cannot guarantee that a particular program will
> always be verifiable. We find safety bugs in the verifier and often
> enough the fixes to such issues make the verifier work harder to prove
> the safety of the program.
> This is one of such cases. These two commits are necessary.
> Reverting them will prevent loading of valid programs.
> So reverts is a dangerous path.
> The best is to identify the other patches from 6.0+ and backport them.
> The second best path is to bump 1M limit to something higher to
> mitigate "more work by the verifier".

Thanks all for the pointers, this is super helpful.

I'm working on getting more details, and I'll post here when I have them.

-Robert
