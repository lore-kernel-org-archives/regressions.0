Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3CB1898F8
	for <regressions@lists.linux.dev>; Fri, 26 Sep 2025 19:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758916266; cv=none; b=jDitXmG2nvNrs57ydbVN/QlKESvo53B5R7YoxZ2gfoWMzAfSa5rYECYRMF34Y7dc3LRc4rhe+LU/QbxSLaZz8DD1FdVKDXN38UnqnSMNqmbJeX9xZ9SxEjjufU0wzp1G48VyXkSEEfTe/PfJGmCAC99SitqOMakdrxS160PgNgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758916266; c=relaxed/simple;
	bh=mIgdAucLc1u+3OkJJI1pbpONXxhzgedhI+0k2CsiHM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WS2moAeVXFouZiJi5S+wFkq3m2akWwUGP15yB1ptqny432LTi+lLbsMelLLoNnX7AJMn95OT2c/s5/XRbWQ7ijWatEnU+WkM9RUPjJEaeEOFis3CzXfOoFLp+7It0t56/IjV0j6oYveaFle1UecNCq1CkiRM51qgHaqAJGV2LZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OMTO7uim; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OMTO7uim"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57d97bac755so1404e87.0
        for <regressions@lists.linux.dev>; Fri, 26 Sep 2025 12:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758916263; x=1759521063; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ip017FMnVxrXIHAt9kopjLMyNWF+o8u1hHFJYtAWs5k=;
        b=OMTO7uim1kA5hDKyUFlYexOQQsBqwVEVZpiLieWNJeyBkxRPMlg8BLtb8XkmkOMFF0
         rSwam8U6DfMrfU9p5fu0mLEfr2kYGzsYNwXj4ygLBzSX41vQOjEBsA25He2beBAO0aMG
         8pFVS99a5ydK9h+N/ojQ2YkIyXC2UfG8oxuCBkxXZPhvTNkr2pGaE/9ypwDsMmQM21DZ
         zZIGwVi+e2kg5Le2bFRzKwGSIS8k/q4A3Y66S8ta02ulnTbGHiotCMRysWcu1oFjZt/E
         4IP61+5RnU1FctAh2zxNEGnUP52jRoCzyU1WEoTI1YcW569gtGqV2yucp/lURYOhHFAO
         CaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758916263; x=1759521063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ip017FMnVxrXIHAt9kopjLMyNWF+o8u1hHFJYtAWs5k=;
        b=RBvB/j+lpxYWOrhWFgZ5JQP7x1ddk0cnwa0eFbsEBan2lExI5N4nVPslcl9+LCxEBb
         UVewwvUQKnuDg1E9q2j4y9zsZ7kU2Mn0JWx01qU5/L39ZJ7aA/GVyKnj79c7vrVFaFOR
         aoAXXmjkl96nNCTr1cppRBJjgPjx44xJas04cEeiWZ+Zzm0hi55E+pIFlUyC0MqxXsud
         Dn4kmDguQr7NfLp/tJfZjJN/yomRvgpndc6RUsfBk1ZeXivOv9XGvvSnj3rrILfRwrjm
         KEitfLRZTdOVYEOKeO3rkqAa2Iedv5F9Uq//KviTqaUp6i+urtRLZxHIW2/b6Mft+sgO
         jgaA==
X-Forwarded-Encrypted: i=1; AJvYcCXmfJqU8B1/n/cvvIfzrxFIzhgh/RNyBCZ5UtIj3wpuOlyk/OKUKfdhl1upne+QuKdcXErRR8+3NxLOeA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/py6+fy5+9n2Cy/ZFfOSBaDUpQPyAOIuym8Evff5Rbl9noh+9
	RfQBuX9vpZ1kpQJKHAbGNFnhW3z7CQL3zgZLeEH8HVPtTabnk5qekyog2SgbQps7JVian4Iuc5O
	A+a6l7T2g17kFL1NLZrZppFuCBNYd16jXSnqpIkke
X-Gm-Gg: ASbGncvzMuayM9ivm1fJS7+ghHyOKp69a+l1N9nYdbk4eYZN+AbMVYS/IuI60na311r
	HQQ6fmW/SCpRytx/iEmf5QRskazR9LcL9RgZXifgR9qjtSgieH4blLpZ3mmlTa9T+DF4hM4lQB5
	CMTdvrGjNgsRoajTZZQ1CPdlA+jQdMEIN+PEVm4JZOoJ/ockRnSmzftKgSPv8/UzOlyo4qbAQ50
	o8bLYI7qWRu5g==
X-Google-Smtp-Source: AGHT+IEE5OaYdO0IaMGFY36b6MbwvrxUfn/XZsaRUGWhiPwBfx1smyDXptqX2r5rZlNLWNxdoLF1cU0Oyz9dS7BV5oA=
X-Received: by 2002:ac2:4349:0:b0:579:49:344f with SMTP id 2adb3069b0e04-584303cd819mr413762e87.0.1758916262755;
 Fri, 26 Sep 2025 12:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOdxtTZJqgDNMtqsq51hQ0azanFPLXHMAJ-mRhRS6yjzYhMf_A@mail.gmail.com>
 <aNSSNgUeMSTtlimW@slm.duckdns.org>
In-Reply-To: <aNSSNgUeMSTtlimW@slm.duckdns.org>
From: Chenglong Tang <chenglongtang@google.com>
Date: Fri, 26 Sep 2025 12:50:51 -0700
X-Gm-Features: AS18NWAN5nGcUSbNskAJzYe71VDRCVrJaJpdw8gBe4Wx0-59iqP8y5qS9LyHsiY
Message-ID: <CAOdxtTZmqGpT85ER+c4VsQfoo+AHDyWC+6MG__hm5i6+sVoaWQ@mail.gmail.com>
Subject: Re: [REGRESSION] workqueue/writeback: Severe CPU hang due to kworker
 proliferation during I/O flush and cgroup cleanup
To: Tejun Heo <tj@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, lakitu-dev@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just did more testing here. Confirmed that the system hang's still
there but less frequently(6/40) with the patches
http://lkml.kernel.org/r/20250912103522.2935-1-jack@suse.cz appied to
v6.17-rc7. In the bad instances, the kworker count climbed to over
600+ and caused the hang over 80+ seconds.

So I think the patches didn't fully solve the issue.




On Wed, Sep 24, 2025 at 5:52=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> On Wed, Sep 24, 2025 at 05:24:15PM -0700, Chenglong Tang wrote:
> > The kernel v6.1 is good. The hang is reliably triggered(over 80% chance=
) on
> > kernels v6.6 and 6.12 and intermittently on mainline(6.17-rc7) with the
> > following steps:
> > -
> >
> > *Environment:* A machine with a fast SSD and a high core count (e.g.,
> > Google Cloud's N2-standard-128).
> > -
> >
> > *Workload:* Concurrently generate a large number of files (e.g., 2 mill=
ion)
> > using multiple services managed by systemd-run. This creates significan=
t
> > I/O and cgroup churn.
> > -
> >
> > *Trigger:* After the file generation completes, terminate the systemd-r=
un
> > services.
> > -
> >
> > *Result:* Shortly after the services are killed, the system's CPU load
> > spikes, leading to a massive number of kworker/+inode_switch_wbs thread=
s
> > and a system-wide hang/livelock where the machine becomes unresponsive =
(20s
> > - 300s).
>
> Sounds like:
>
>  http://lkml.kernel.org/r/20250912103522.2935-1-jack@suse.cz
>
> Can you see whether those patches resolve the problem?
>
> Thanks.
>
> --
> tejun
