Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832FC288CBD
	for <regressions@lists.linux.dev>; Wed,  6 Aug 2025 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754469623; cv=none; b=lQO/DKxLMqXxnWABwdrCP3BhF7k6F9RbPQYxHxccJIZZ/RRHHdOj+Nn71AXyLl7F8Fc65+esWl6nR3CeFUFZ2+AFbaix4ajAqaszM7nakc+/PjbBAyNKyE7Mrx3YoAoSJPJu8SXqJCUo/q2xFJ/TkQ9o3fOORgUTRutNmgqMDQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754469623; c=relaxed/simple;
	bh=BQS17Gx8nIJNb+Eu5z6Nn4tpeVvUU+ssz+FqyUsLAP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxexyABWZsfEk6rZVjrrXvM3LhoLo9rUD5YMSAAwnu+mtYoE+Oe0eS59xiOiNGfSVWW8lWrQtvvIqMoI0EeyMj77x2HKrj/31QybT1QIzMCvTUloV6p8H8RZtlwMso+Yovd/TqwfTVH/GlEjoGiRbx7u/HebDC2rimO1S1EglxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODARZ3Vl; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODARZ3Vl"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af66d49daffso934204566b.1
        for <regressions@lists.linux.dev>; Wed, 06 Aug 2025 01:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754469619; x=1755074419; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQS17Gx8nIJNb+Eu5z6Nn4tpeVvUU+ssz+FqyUsLAP4=;
        b=ODARZ3Vl+82lFdUkYjwDachqgUtaGJ8cbHGKsL74XjEyV932WcGIWaSWvfu8cQNAF5
         CtF7jWcKMTpjae49DdRmvvFoCtmJa+nf5CQ/dtLOsWywB/TU6dfSBtgWJd7cvkNXUBdS
         7K48oLuWPzfROPjfrvlhkuiezIseYf3lfiyXoged6XW2jyf38O+inTf/bHMxLYC2iq03
         fdn+doaHPulz9bas5ohIR3LNYKuExldcHcg4eOl8gbsAxpuLSpPaHXhKKBC7VGlWuyPw
         H6Yc/JL2Ui+JDRjkOjhYcGE8qgD816AUl/5h2wf0yxaF5wHoTKDKLqVOFJnKPDMnyO+s
         1vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754469619; x=1755074419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQS17Gx8nIJNb+Eu5z6Nn4tpeVvUU+ssz+FqyUsLAP4=;
        b=UY2rZ17WnvJaTPTK2Brghv1r0mm8HYbX9k7PMFa0IP53tb1nvWUVEv33EJzw7qWO6F
         06RtAylYlNSajTe5gRgS7rkif/NHwtlWuVsZvMIBdhZd1mvJE16IWYm3zXiqE/9iN/IW
         hdZzZ1loETldWFLM9VQsXthTMggoSiLzvvIfIekc5lQOoAH5b5ML5rz50ci4Uxk47GDo
         gGCgcDWDLOP0pMe0t/+gGmMNn+II+rE9IqQKG/xE47k3P7znwbzfyK/56iFYlGhHhCC5
         l9Si04zVizkpKNEC2UwpUhWWoDCEIOHSsa6XO/6f+jbL3NdP6uooxdCtMcNkBY6o8a/S
         PuVA==
X-Gm-Message-State: AOJu0YxHLaWregp5mbbnqThsDL0fwbcYfReh1m293lN6C9IJkJoRUUjc
	mW9+l9yOTV3PhWuLKnH4uTqwLN+tFdQ01w4AtnfxLZ93+1fcZnDCBY5AxuDzsuUcyyjN3GzwOpD
	/RxOmRjEWDchW9yAU0rkTw0IclNiSScmHOvgfl035Tg==
X-Gm-Gg: ASbGncsr4FnDoUwvbFdVcYP/yDdjsm3qCQrr3vdlNro9vIDJGpd0z736K/pQ11BeoBH
	4Bua2c44+LqbuiP3b57nxmCzAhEjltoK12FfdGaeKB89rg6c66+7wsZ4wLzkyb+AIoEMwklbTv2
	ObN4rn7PExmr8fj03fERYC1DEibl1gLQ6cIz7S2K2oycjwhcSav0yS6GMTOXR+Hkje+mEzJLgPj
	uWBVAJg
X-Google-Smtp-Source: AGHT+IHfJ9svIzWODa8rgbvEIq584AUL0oyBljvd+PygocMjYZHjM2aXI+fyfYg0JbEiFEnyH4qTbculH1RSbuT6U5U=
X-Received: by 2002:a17:907:980f:b0:aec:6600:dbe3 with SMTP id
 a640c23a62f3a-af992bc3acfmr138428466b.56.1754469619115; Wed, 06 Aug 2025
 01:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com> <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
 <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com> <CACTEcX47bUd2tp=LYkQnhK29Js=vLN0JfXL8Aq6mOFBVYumpzQ@mail.gmail.com>
 <CABgObfZKKeqMrAUyS8CB4ARkW_8Z9QREgpgYcq2jxoQ9ppS6MA@mail.gmail.com> <CACTEcX7oa+Shj=uYiRMoWpng+RZXDeQrOa-VTRmzVVtXJMCgLQ@mail.gmail.com>
In-Reply-To: <CACTEcX7oa+Shj=uYiRMoWpng+RZXDeQrOa-VTRmzVVtXJMCgLQ@mail.gmail.com>
From: Andy Mindful <andy.mindful@gmail.com>
Date: Wed, 6 Aug 2025 11:40:07 +0300
X-Gm-Features: Ac12FXxTKMWG1pZklTF0P1qlwOqSdhMr6Q33eeVUrsVUud3FdPfuQWhVKcJIN3Y
Message-ID: <CACTEcX7hsRkzYEBg4pQd5s36p_ZXJM=dtxSGmBjfkt5sWrXP8g@mail.gmail.com>
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

Hello,

Can somebody advise how to properly bisect issues in linux-stable
repository between v6.7.11 to v6.8-rc1 tags?

I tried two options:

1. No skip

git checkout v6.7.11
git bisect start
git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
git bisect bad 0dd3ee31125508cd67f7e7172247f05b7fd1753a

Leads to:
The merge base 0dd3ee31125508cd67f7e7172247f05b7fd1753a is bad.
This means the bug has been fixed between
0dd3ee31125508cd67f7e7172247f05b7fd1753a and
[6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1].

What should be done next?

2. Skip
git checkout v6.7.11
git bisect start
git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
git bisect bad 0dd3ee31125508cd67f7e7172247f05b7fd1753a
git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a
git bisect good ba5afb9a84df2e6b26a1b6389b98849cd16ea757
git bisect good 61da593f4458f25c59f65cfd9ba1bda570db5db7
git bisect bad e38f734add21d75d76dbcf7b214f4823131c1bae
git bisect bad 5d197e97fb106c09d3d013be341e5961fd70ec8a
git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
git bisect bad 8c9244af4dc8680a453e759331f0c93d5bde1898
git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
git bisect bad 1c3c87d720cbd1ff86dc1bfc6df8ee9adce5879b
git bisect good 8d99e347c097ab3f9fb93d0f88dddf20051d7c88
git bisect bad 6c370dc65374db5afbc5c6c64c662f922a2555ad
git bisect good 43f623f350ce1c46c53b6b77f4dbe741af8c44f3
git bisect good 8a89efd43423cb3005c5e641e846184e292c1465
git bisect good 5d74316466f4aabdd2ee1e33b45e4933c9bc3ea1

Leads to:

# first bad commit: [6c370dc65374db5afbc5c6c64c662f922a2555ad] Merge
branch 'kvm-guestmemfd' into HEAD

Which is incorrect as per Paolo Bonzini comment.

I'd like to test this thing, because hibernation is quite crucial in a
multi-boot environment and may save a lot of time while working with
different systems.

Thank you in advance.

=D0=BF=D0=BD, 4 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 22:49=
 Andy Mindful <andy.mindful@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Can you please advise on how to bisect further?
>
> andy@lenovo:~/linux-stable$ git bisect bad
> The merge base 0dd3ee31125508cd67f7e7172247f05b7fd1753a is bad.
> This means the bug has been fixed between
> 0dd3ee31125508cd67f7e7172247f05b7fd1753a and
> [6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1].
>
> andy@DESKTOP-0R165CF:~/linux-stable$ git bisect log
> git bisect start
> # status: waiting for both good and bad commits
> # good: [6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1] Linux 6.7.11
> git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> # status: waiting for bad commit, 1 good commit known
> # bad: [6613476e225e090cc9aad49be7fa504e290dd33d] Linux 6.8-rc1
> git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
> # bad: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
> git bisect bad 0dd3ee31125508cd67f7e7172247f05b7fd1753a
>
> andy@lenovo:~/linux-stable$ git status
> HEAD detached at 0dd3ee311255
> You are currently bisecting, started from branch '6fc5460ed8dd'.
> (use "git bisect reset" to get back to the original branch)
>
> It is not moving further.
>
> =D0=BF=D0=BD, 4 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 17:=
50 Paolo Bonzini <pbonzini@redhat.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Mon, Aug 4, 2025 at 12:57=E2=80=AFPM Andy Mindful <andy.mindful@gmai=
l.com> wrote:
> > > Double-checked bisect, looks like I've have found broken commit:
> > >
> > > > > git bisect bad
> > > > > The merge base ba5afb9a84df2e6b26a1b6389b98849cd16ea757 is bad.
> > > > > This means the bug has been fixed between
> > > > > ba5afb9a84df2e6b26a1b6389b98849cd16ea757 and
> > > > > [1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > > > > 61da593f4458f25c59f65cfd9ba1bda570db5db7
> > > > > 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> > > > > ba5afb9a84df2e6b26a1b6389b98849cd16ea757].
> >
> > This skip is messing up the results:
> >
> > # skip: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
> > git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> >
> > and there are still 3858 commits in
> > ba5afb9a84df2e6b26a1b6389b98849cd16ea757..{1b1934dbbdcf9aa2d507932ff488=
cec47999cf3f,61da593f4458f25c59f65cfd9ba1bda570db5db7,ba5afb9a84df2e6b26a1b=
6389b98849cd16ea757}
> >
> > Any chance you can get 6.7 to work and restrict the range further?
> >
> > Thanks,
> >
> > Paolo
> >
