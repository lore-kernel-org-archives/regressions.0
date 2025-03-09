Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC781C5D69
	for <regressions@lists.linux.dev>; Sun,  9 Mar 2025 21:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741555201; cv=none; b=pTFQwmgJvsboXhTOA5Bp+Nhw4FgVQINYtqvpay1wiP6uT/E6UGaZgYP3LrWAXB5LcujxtsUPAN4b021MEoZuITZwQj7PzedP6ttRH2LaKcjrAG0D2oPKZ4SMC0g+KMK4oyfIOLjhh7Qnr8UOfKqpHjIhRwYeVDVdHs/55hoFo3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741555201; c=relaxed/simple;
	bh=dtR5CVcOAvr3fjS6ELh01V1WmVDywwgTqyYVOdVtHP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JlIyjaOM+R7YeTab9f71xk8eLgoSTTz59sYUlQACXrlYGd0Xtm+X7VC0dWGXV4NtWRRAHKG+q0HcSlQyt5vkiUr8MHIkyooiNLraAHeK2eBH1hCArgMNmktDBJ7UinUGVrut/OEpiQeiFOcwsUefOZQjBkjGEmuktH1eadZLFno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u6Lbh/0v; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u6Lbh/0v"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2240aad70f2so156135ad.0
        for <regressions@lists.linux.dev>; Sun, 09 Mar 2025 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741555198; x=1742159998; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtR5CVcOAvr3fjS6ELh01V1WmVDywwgTqyYVOdVtHP0=;
        b=u6Lbh/0vVSkF4zBh7R2JubHRdA1WdEKNumph6+ZhxjVw2xBTMRrLtHzbwoyWpqMxWM
         MuIwrLL+Nqr4TGAb7sSviDo8wA0kl1DtCqRzJkCQ0Ag9kQaoE4nJafKp7M6hwQeMh4Um
         fXT9QSdBSdY7Uk4A5/5ZL7FWhhap5lFBQvfOxqaqRaXgWW9bgeyC7bJwPUNaKfr4Emgu
         207FHcBYakrc+o8v7LgeAd8ek+eVW0Ac/g7H8MhwLaRZbejTkMPiKrJZO7eX9hnhrxfH
         GBvdHEk1y5WELpsfseJF38O8r463NmQMSa4RIox8Ij+Uhp5eud9EiyEnjvYmEozFTDgz
         u4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741555198; x=1742159998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtR5CVcOAvr3fjS6ELh01V1WmVDywwgTqyYVOdVtHP0=;
        b=GLGEXjrQH90UYbAuEdH+qIlcAuAqzAa6X2TuGV/0gF3HE3vb9D42lgJB8GKBZgZPEA
         x4iyqN12WvxBL1c0oazOYqU/z3Z9Z3cKmNkj+NtYQC5ot6gSHoGx9W/wQ0XL1W4O35GJ
         mUiHVXo5JhdQ9mKneN4bDbklMuS1Ym5Vo3TXcU3aypSMpXBpb/OaDCThMbumAN09cF3e
         SeI04BXfEwxAQekAKYaSUB29qvoZak10k3u37VoknkPBIIeLZx+N5eVcSt7UAjYyTElW
         CcU5iuv0/vt54V9zgUZZhrF6fdel44bHkB7lvDyw0da+QBZlajxBcYWTMW74Yrph8FL0
         R7Ew==
X-Gm-Message-State: AOJu0Yzq46POJb0cqQDmPOOhWub77N5T2oy92Mk2KVCUY5MpTu6UyElQ
	7PVT7G24oyxZ+7RZ9mMGhN2KAMQQbjWwHDxJTsAQ5nIyU+g67An54FPMCy8yqHlZDGS1vU1sIzs
	fXRdTFSH+lbdWOPFypFKR2Dr9V3mXewl91kw9oOBLqGSDHQQ7+1WrWlc=
X-Gm-Gg: ASbGncvGLi5rWVAI0FYVg6Fh4Okc2xri2eVWYaXB68v8GTEzP0wJv15BL0B1vAeK/Ap
	rjyTsZIOPrJQ3dizHNvSQ2tONmMlc3zyrSSy76uRlkHeB7xB1+u8FsYoKH5NpHjmkPYLn3Sy8Cb
	4EJinMB8Nf/4P1dM0Dpn0UusHGPpvLeofA4zeMZA==
X-Google-Smtp-Source: AGHT+IEJhR3+rAaQ++E8V7FlJFmxvewAFVWUxbni6Q/weWuILkW9h8lVbhaRFIAoOBCVNK4tn41KNeajHrpHSiTrwaw=
X-Received: by 2002:a17:903:1b6c:b0:216:4d90:47af with SMTP id
 d9443c01a7336-22547831402mr2023965ad.29.1741555198167; Sun, 09 Mar 2025
 14:19:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <08f1f185-e259-4014-9ca4-6411d5c1bc65@marcan.st>
 <ZV1AnNB2CSbAUFVg@archie.me> <a9c14dfd-3269-4758-9174-4710bef07088@leemhuis.info>
 <CAP-5=fXqx_k1miPTkcAmS3z2GBPt2KeDtP5fknmdDghZqxXPew@mail.gmail.com>
In-Reply-To: <CAP-5=fXqx_k1miPTkcAmS3z2GBPt2KeDtP5fknmdDghZqxXPew@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 9 Mar 2025 14:19:46 -0700
X-Gm-Features: AQ5f1Jr0j4M0q4yr27RXXddbvVfIfIUCYvtAcp0Yo5MNNrZjrteczA0JQZhgbJs
Message-ID: <CAP-5=fUUn_VFKLjUV=VDby09oHRAbvUkWwheqO8Yq=7v56i12g@mail.gmail.com>
Subject: Re: [REGRESSION] Perf (userspace) broken on big.LITTLE systems since v6.5
To: Linux regressions mailing list <regressions@lists.linux.dev>, "to: Mark Rutland" <mark.rutland@arm.com>
Cc: Linux perf Profiling <linux-perf-users@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Clark <james.clark@arm.com>, 
	"cc: Marc Zyngier" <maz@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 12:05=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> On Wed, Dec 6, 2023 at 4:09=E2=80=AFAM Linux regression tracking #update
> (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
> >
> > [TLDR: This mail in primarily relevant for Linux kernel regression
> > tracking. See link in footer if these mails annoy you.]
> >
> > On 22.11.23 00:43, Bagas Sanjaya wrote:
> > > On Tue, Nov 21, 2023 at 09:08:48PM +0900, Hector Martin wrote:
> > >> Perf broke on all Apple ARM64 systems (tested almost everything), an=
d
> > >> according to maz also on Juno (so, probably all big.LITTLE) since v6=
.5.
> >
> > #regzbot fix: perf parse-events: Make legacy events lower priority than
> > sysfs/JSON
> > #regzbot ignore-activity
>
> Note, this is still broken. The patch changed the priority in the case
> that you do something like:
>
> $ perf stat -e 'armv8_pmuv3_0/cycles/' benchmark
>
> but if you do:
>
> $ perf stat -e 'cycles' benchmark
>
> then the broken behavior will happen as legacy events have priority
> over sysfs/json events in that case. To fix this you need to revert:
> 4f1b067359ac Revert "perf parse-events: Prefer sysfs/JSON hardware
> events over legacy"

This still hasn't been fixed and I'm at the point of saying I no
longer care except I want consistency. Let's revert the prioritization
of sysfs/json events for PMUs. I don't want to carry around patches
like:
https://lore.kernel.org/r/20240926144851.245903-2-james.clark@linaro.org
If this re-opens this bug then I'm fine with that, and I'm happy to
point to James and Arnaldo's comments [1] saying that somehow legacy
events are better, because drill down or something (what a bit pattern
has to do with that, no idea, we already default on Intel to
non-legacy events and drill down just dandily for topdown). Whatever,
I'm fed up with dealing with mine and others' comments being taken out
of context. I'm fed up with the ambiguity of two encoding systems, one
with and one without PMUs specified. I'm fed up with working on PMU
and event encoding, ordering, matching, metrics, etc. where it is
unclear what the behavior should be. I'm fed up with ARM choosing bad
uncore event names, refusing to correct them and creating a massive
mess they barely help clean up other than by largely reposting my
patches. I'm fed up that all of this was done for ARM and then they
don't seem to care about its resolution or testing the original
regression. Yes, this sucks as user land won't be able to be a source
for event configuration fixes. Yes, this sucks as such functionality
would slim down PMU drivers and was a behavior requested by RISC-V
face-to-face with a maintainer. I don't see why I should have to fight
for this other than I unexpectedly broke things in the first place
(this regression report) and I was trying to help RISC-V.

To be specific, I don't want the event 'instructions' be encoded as
type 'hardware' and config 'instructions', be reported as
'cpu_core/instructions/' but then that event to be encoded as type 4
(RAW) and config 0xc0.

The fact with this cpu-cycles will only wild card on core PMUs, but
cpu_cycles will wildcard on all of them. Again, why do I have to try
to fight for sanity, let's just back everything this regression report
created out. We check legacy events and do their behaviors, otherwise
we fall back on sysfs/json.

Thanks,
Ian

[1] https://lore.kernel.org/all/Z8sMcta0zTWeOso4@x1/
