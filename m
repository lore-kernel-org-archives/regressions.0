Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D951EE02F
	for <regressions@lists.linux.dev>; Mon,  4 Aug 2025 19:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754336999; cv=none; b=T2v5rAUGCM3xSe0CKWAidp1/b3I53ZUD2lKg0sMTUEje4PREIM29wN4N6P+mgdy5Dw3Bd6CrZ30KVtm6SxyBGOFEmDnvL6PT0mhZx/1wa5LbXohOEoGDpZMUEwwD+ZyZOcafay73Aclx+zL9hJ8P1Kkbp8xHQ9VWj5Sf1zh4zb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754336999; c=relaxed/simple;
	bh=GNzexns6pcPBUTEkIeqnIu/h9x9Gke1nRAkCyAK2Td4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FhFAX293N2KtFaH/E/RaXyhbKwxdo4Ya2NaF3zGsrEKuMQlBd7chmHnN4cTkbWM6FlYEZxelxrSi/GMayrZ2dwcb076YcDUdWUQw5RP1Ndyjo9ixitL2FJKCN76fZ8nq3DlDZU6JgCzGlhjOTvSpuNK+/t3Nwoc7UilE+eJ46iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+50GeB2; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+50GeB2"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-af93bcaf678so404791166b.0
        for <regressions@lists.linux.dev>; Mon, 04 Aug 2025 12:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754336995; x=1754941795; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNzexns6pcPBUTEkIeqnIu/h9x9Gke1nRAkCyAK2Td4=;
        b=f+50GeB2Cyo02Ji3cRU9oi6SERTpkOWne14Sub97Pk8eYZSHtgQxeMzC0FPgn/9Zbt
         rOVt3WEajCSnEsYhQQBz1HQqKFKkpwnwD8ZSbAt1JiCOlgzf6JRcP07ffNeL6EP1n3UP
         rpu4iXBAGmejJ48m7PQNN+6QkEbOll7ehpOHqe9ywa5qLLssJka0dzNaCGAIZQvWhG5m
         +I/N3bRouOnQwU0dalv3211oD01ExwF+g3aVs+CSiBXHCCtkQS1D2vnfnGzWWAD0aVt9
         TDZ2NjkBCTCPue7vKXWvoKK7h4Uacp3wKPAbEEw4E13prA/H+17ahwfhuYRZpVTicwsD
         Jbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754336995; x=1754941795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GNzexns6pcPBUTEkIeqnIu/h9x9Gke1nRAkCyAK2Td4=;
        b=CaVlG5GZu936eY5Q1SkayTK65xHLfwbWuWpXxpsIxEupyGr7fTiKNPJCdOPojhE55G
         qERCTBH2ucz2f3lEGPvocnDpOjXVsS1KuLtXLuUAs/MDvePJFyAAOOjH5nrfniC0KWbd
         LgYmXG4UmzkjQP1dFuMnNBIAHPkIRgscqzLr2h9IbuwMqpDJjRb4JwG3t/35luQYCIqL
         xFM6ZdvdiKz5vE/eZJik0WD+2EogHc0WGXprmQOlUiShrO49Y8FxU/7afFv/r1+Yfkuj
         RHLfjm71aV5MlfjlKCxXqeImj8I4ieB7GSwumlyHFHuPdVzy5dF2SfIQLyW7zDVeYwgY
         Meng==
X-Gm-Message-State: AOJu0Yw8qd0OntX9CJ6Ls+ndmVJJoSxQ2ed27fRP04liSyo6j4Y+0gwK
	WVARNnJcHdEECvG7rCgvE6yMLao7tH+W5pKadXX8UZ6J8EnSHywsLeTLvgJxeL05wbEgHALQMb0
	r224ypvLJBni+2xR1kJaCcSTYaxmR25ifRKUanmfn7A==
X-Gm-Gg: ASbGncsDWumrUzhbFPW26BDKR3uIqT/clPkqK1ASshMxzHP59L5sq4z+YFor3VsWtjr
	P/r/0PpxcoqKeHw696px7XoTw+mMbMdcspCa+VwkbxR9bG1N3bl8yLEkr8DVgt8rcV1HLCK8/yF
	bf84iqOumNFEzarnAmKwBgKKLgMfphCz2/6zBbPe718fnPxcV9rnqh4R1GJDxkS9zU0l4fOw6jD
	dRkPJQ=
X-Google-Smtp-Source: AGHT+IGcMq3bxCdaYN7JTYB4ZRdZj5ChB4GQUWGwwN1A04vvH51/5tRA4ycCUTXjUODp6yMy5vQnnC3OMmCbWz5atD4=
X-Received: by 2002:a17:907:9407:b0:ae0:cc5f:88ef with SMTP id
 a640c23a62f3a-af9401af514mr1075474166b.32.1754336995289; Mon, 04 Aug 2025
 12:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com> <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
 <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com> <CACTEcX47bUd2tp=LYkQnhK29Js=vLN0JfXL8Aq6mOFBVYumpzQ@mail.gmail.com>
 <CABgObfZKKeqMrAUyS8CB4ARkW_8Z9QREgpgYcq2jxoQ9ppS6MA@mail.gmail.com>
In-Reply-To: <CABgObfZKKeqMrAUyS8CB4ARkW_8Z9QREgpgYcq2jxoQ9ppS6MA@mail.gmail.com>
From: Andy Mindful <andy.mindful@gmail.com>
Date: Mon, 4 Aug 2025 22:49:43 +0300
X-Gm-Features: Ac12FXwoncyyo3lMGdVFGmeOSercSw0CMzqTN4N7YKEyC89vLmt21SqpqVGopCE
Message-ID: <CACTEcX7oa+Shj=uYiRMoWpng+RZXDeQrOa-VTRmzVVtXJMCgLQ@mail.gmail.com>
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in
 6.8+ on ThinkPad X1 Carbon Gen 10
To: regressions@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-acpi@vger.kernel.org, rafael@kernel.org, ville.syrjala@linux.intel.com, 
	tglx@linutronix.de, Christian Brauner <brauner@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you please advise on how to bisect further?

andy@lenovo:~/linux-stable$ git bisect bad
The merge base 0dd3ee31125508cd67f7e7172247f05b7fd1753a is bad.
This means the bug has been fixed between
0dd3ee31125508cd67f7e7172247f05b7fd1753a and
[6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1].

andy@DESKTOP-0R165CF:~/linux-stable$ git bisect log
git bisect start
# status: waiting for both good and bad commits
# good: [6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1] Linux 6.7.11
git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
# status: waiting for bad commit, 1 good commit known
# bad: [6613476e225e090cc9aad49be7fa504e290dd33d] Linux 6.8-rc1
git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
# bad: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
git bisect bad 0dd3ee31125508cd67f7e7172247f05b7fd1753a

andy@lenovo:~/linux-stable$ git status
HEAD detached at 0dd3ee311255
You are currently bisecting, started from branch '6fc5460ed8dd'.
(use "git bisect reset" to get back to the original branch)

It is not moving further.

=D0=BF=D0=BD, 4 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 17:50=
 Paolo Bonzini <pbonzini@redhat.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Aug 4, 2025 at 12:57=E2=80=AFPM Andy Mindful <andy.mindful@gmail.=
com> wrote:
> > Double-checked bisect, looks like I've have found broken commit:
> >
> > > > git bisect bad
> > > > The merge base ba5afb9a84df2e6b26a1b6389b98849cd16ea757 is bad.
> > > > This means the bug has been fixed between
> > > > ba5afb9a84df2e6b26a1b6389b98849cd16ea757 and
> > > > [1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > > > 61da593f4458f25c59f65cfd9ba1bda570db5db7
> > > > 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> > > > ba5afb9a84df2e6b26a1b6389b98849cd16ea757].
>
> This skip is messing up the results:
>
> # skip: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
> git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a
>
> and there are still 3858 commits in
> ba5afb9a84df2e6b26a1b6389b98849cd16ea757..{1b1934dbbdcf9aa2d507932ff488ce=
c47999cf3f,61da593f4458f25c59f65cfd9ba1bda570db5db7,ba5afb9a84df2e6b26a1b63=
89b98849cd16ea757}
>
> Any chance you can get 6.7 to work and restrict the range further?
>
> Thanks,
>
> Paolo
>
