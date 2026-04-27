Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38233D170C
	for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 18:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777315840; cv=pass; b=YPZAJWkKwnHPKToAqNIzrtBgWCJY7dmTMlQKkRbmzOj22LYN4s55m86rwxwGBrXUnAJEUXdn+Jms/n0OqEgfnu2uYExCjus+picuPHrrsXC3Tfh2IIDTJU2OYLoJ8N3QLiW1TzLoFsdPfhklloi9zukIE7xa1MzRGKui4UqMdFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777315840; c=relaxed/simple;
	bh=dSOLFHYy9SI+n2qm+x6JMljLNJ1ZfRjTG3TVFgX8eK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqC9/qPcFRCLTCoYewWAsBh+ZHOfGmEM/GNCVlqz46noEj/LKvGIMtLm02+eg5u4KgaH9uB68Z32L5VxJviJR6EW9f8QSLMFQMY3zIDJTmiGfiwOt3KmUjcN/icEZrnZnDB65j6Hb61fvLGCFeA6kAPJqGcCY194Sv45X27ekM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s1CKj0KB; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s1CKj0KB"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a15ebb3abbso145990586d6.1
        for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 11:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777315837; cv=none;
        d=google.com; s=arc-20240605;
        b=XFRW1rj5OUEcq4itfRyOOSnovGKEKRGmfg2Y+6hbC8IqBpZn3Z/npcArlI/31lNkmQ
         6mADZxtKAjPNmEJqmfSyHs7FzEEv286d6DqI5LyJtO4D6Nm09bNx9xMMibYVGzH21DNd
         8AI+/OaYlDfwFBFQhA9iiGBMlIc0FA3lLN7RU65PKHJtXus1r/h80iQpw6eGctGxowyN
         3iHoTkTGaDk0udDbROQuLDbaWLlD9U4EljyJa0GJp8SUIPsafLE43kxtEVoNqilCayVo
         sw34ZQwOMAKQqXSTcWi0u2cGSjiyTM8y76lhzk8RapNetEuxOE2dfY3sQ2d3GMjZHu2V
         nKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dSOLFHYy9SI+n2qm+x6JMljLNJ1ZfRjTG3TVFgX8eK8=;
        fh=FD2iB81F+mH5kDNT814deRmOgId4/hIbTmwYloS3lCE=;
        b=eNK5cb/OaAl1xpEMxxlB0IWJPN4B9weoEBq4OQNLTp4LFwVl8oW7H/iQi5bfhbTx5s
         6zjzAVBwLYkUa6vr2JHK/Qwe4eEezVMk3ljkz8cFKx47vzzIO4EPonQ/Mr9w9DibkjmE
         V/pK+U93jzo2fK/FY2y3GNn9Mq4m5qPF29YSuXS5l4K2I0Iivc5nlVxt/6f7GKHiT2Cr
         WTO+FIc+ExfUfWkl1fQZe9Ijt0CdYLQevZnWToySmELZ8enNpH+dNzH3rdX7viLadjIG
         JQb9QMca7LE1MPkYw+rs3Vvo1hKpJgsPCU7wGc6UjYXh6/xW3qBfT2JRatfvuDfpH1PH
         4IdA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777315837; x=1777920637; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSOLFHYy9SI+n2qm+x6JMljLNJ1ZfRjTG3TVFgX8eK8=;
        b=s1CKj0KBJSyTmS1QwwEp92WXyw6pLA47RmiEMLjLm2acXZX/dZcHRp0590QAClMyEm
         fp/JGDtC3IF1F/gS9sbzb90epiLU0bCCDu1G4BkSKRna0McrkRhTsffVsqbrO1yU01uB
         qYG2jjM5qUy0a9ALRhSPG7cd7GYIMSZTnzArqmHHZsGT8S9VJLtiUcIAFHwFVQz72pKY
         xjsrjKj6B4/FmCjvluCV0sBRsYRq3bcW8WLoqECYgcM7Jb8sz5iVH2KDOjLcdVlLAqff
         DlTL+X+/kcDb3KsAkocia2PbIJAJfM8R5cUp1BWFJGMfcXjAYDUl2OHKLsP5vKGFikBL
         bNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777315837; x=1777920637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dSOLFHYy9SI+n2qm+x6JMljLNJ1ZfRjTG3TVFgX8eK8=;
        b=pHIYffGF3Fl8CDsxR/eEPypwSNqpwJdo5xrM3WD8LKSHUk4ZvmKRUTRBJ9rubzCN9d
         K9jDY/2EczcIAXjhzclZohm6QIoFklO172LCAz/TlknKbnU1Y4v40a6fQTk2g/i0MmIs
         TR13V3VzRRCRlgwgPTJNuOWGAwkJahvagMbi5doUWUp/PY4Q3Yt1vbqo6pknmgzMPw8b
         GDDbk2LWTRZvSwTXHooBXwxINYUWhN35zd3K4R9xg/tGQBNUOl59eLuw/6SCSOH6mVTd
         Vo5c/+U42Yagl4r7zHqxN+0vYDU7UhPQgI0zH71bDbw8G2cUSgc2ebTe8NO7qHd7+cy3
         8o2A==
X-Forwarded-Encrypted: i=1; AFNElJ+t6a98W82bPy7EFa4xi5ktkuzY0dx8LDd71Dlzo7KikwSHOHKU07uXw2ZbZcc8dvWB+UVAyKcnA5YC/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjFek+wJBiQS0Wb3W5xrYHPvRlBkSGim9PuStgb8pVLHpKbidI
	9mjh0Qj9dovvpCcOduJlwUUzno1OHA77Nb4bM0ztJei37jRD0aOFBLkIpSc6qvUjfykouOyZ6+O
	GkuxthnNbi6Zp/2AUZwGsjyWXsEACK7s=
X-Gm-Gg: AeBDievnnxnbJ8vDh4VPvLtDKiKYfSnJyfS3Am+61ESnIfk5/70rz6JJlAChhjQx7/i
	I8Y2BpB3DPfEXVqBRjVOgj0OHjVu1xjehp+/OdnwomafScWepmfmxs+g+fMo5ie4+dw4nGkXqx4
	lt3u6jtDiXdGAr/dJgBtgs3oLm3KIbTpAVjvGgH//tkLgpQkywIXf006w/iO+i5J8j7IkAnlUJe
	gysyKzHiKAzIy6a+BQXl1RkmfJpzk9uZ9r1GJGwv8SZ58x8HwMCGCWegfoU9IjtUmH7zuRBRR7l
	A5C77ie5lQ7+CHplgZJl2ZN1ndZex6r0AaEe0db+itilZuNpWjWMI6YRXm+9HUT89fNXwEZ0dor
	Fr0wl
X-Received: by 2002:ad4:5ded:0:b0:8ac:b402:9af1 with SMTP id
 6a1803df08f44-8b3e3205df3mr441996d6.47.1777315836740; Mon, 27 Apr 2026
 11:50:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMYTvdA+yCqU4_9mzMUkX_3S=myExKMBCyB88dYWCMwA1edsrw@mail.gmail.com>
 <6c48aff5-b6ee-40af-98f0-c26ded3095bc@leemhuis.info> <ed3171ef-eda8-4907-a35b-2e2b8185e574@leemhuis.info>
 <2730559.vYhyI6sBWr@timur-hyperion> <CAMYTvdCtpKsHAjBtZOK8MK4dYJUTUMCwgsur50Np3+yJhnic+A@mail.gmail.com>
In-Reply-To: <CAMYTvdCtpKsHAjBtZOK8MK4dYJUTUMCwgsur50Np3+yJhnic+A@mail.gmail.com>
From: Brandon Taylor <br.ta.2818@gmail.com>
Date: Mon, 27 Apr 2026 13:50:22 -0500
X-Gm-Features: AVHnY4IQNm3dpuDauCnGB_2PCuwhP_WQrG9Oj5XltDol9MaO7I-m1eWlHy-qYHo
Message-ID: <CAMYTvdAbvH9EDz1jBpx2gc4-S=JML-CqiuH1e9eGJHzS7O3wOw@mail.gmail.com>
Subject: Re: [REGRESSION] amdgpu error -22 first encountered in kernel 6.19,
 not fixed in 7.0
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sometimes I hate copy-and-paste with a passion... Here's the corrected
link. https://gitlab.freedesktop.org/drm/amd/-/work_items?show=3DeyJpaWQiOi=
I1MjIwIiwiZnVsbF9wYXRoIjoiZHJtL2FtZCIsImlkIjoxNTAxNzl9

On Mon, Apr 27, 2026 at 12:17=E2=80=AFPM Brandon Taylor <br.ta.2818@gmail.c=
om> wrote:
>
> > I'm happy to help, there is no need for personal insults.
>
> Sorry if I came across as insulting; that was most definitely not my
> intention. I simply know Linus' penchant for going insane when an
> error is found in his kernel. But I'm thinking Timur's probably right;
> this may merely be a "me" problem, with my particular GPU.
>
> At any rate, I've created the issue ticket as requested, and here it
> is. https://gitlab.freedesktop.org/drm/amd/-/work-items/5220
>
> Brandon Taylor
>
> On Mon, Apr 27, 2026 at 9:01=E2=80=AFAM Timur Krist=C3=B3f <timur.kristof=
@gmail.com> wrote:
> >
> > Hi,
> >
> > Thank you Thorsten for forwarding this to me, indeed I am working on im=
proving
> > the driver for these GPUs. See my replies below.
> >
> > On Monday, April 27, 2026 11:37:53=E2=80=AFAM Central European Summer T=
ime Thorsten
> > Leemhuis wrote:
> > > [note: please remove Timo Lindfors when replying to this mail and
> > > include Timur Krist=C3=B3f =E2=80=93 sorry everyone and especially Ti=
mo, my mailers
> > > address book tricked me]
> > >
> > > On 4/27/26 11:35, Linux regression tracking (Thorsten Leemhuis) wrote=
:
> > > > On 4/26/26 01:22, Brandon Taylor wrote:
> > > >> I have an AMD Radeon R9 270X GPU (yes, I know it's old) which used=
 to
> > > >> default to the `radeon` firmware
> > > >
> > > > FYI, as using the wrong terms can lead to confusion while dealing w=
ith
> > > > bugs: that's not a firmware, that's the driver (sometimes also call=
ed
> > > > kernel module)
> >
> > - "radeon" is the old kernel driver for these GPUs that didn't support =
Vulkan
> > and therefore was mostly useless for gaming.
> > - "amdgpu" is the new driver, which supports Vulkan and offers better p=
erf,
> > this is the default since Linux 6.19.
> >
> > I don't think this is a firmware issue.
> >
> > > >
> > > >> on kernel versions up to and
> > > >> including 6.18. I could manually change this behavior to use the n=
ew
> > > >> `amdgpu` firmware by setting `radeon.si_support=3D0 amdgpu.si_supp=
ort=3D1`
> > > >> as kernel parameters in the GRUB bootloader. Everything worked fin=
e,
> > > >> and I was able to play my Windows games without any problems.
> > > >>
> > > >> That was, until kernel version 6.19 came out.>
> > > >> 6.19, from what I was able to Google, was supposed to have AMD GPU=
s to
> > > >> default to the new `amdgpu` firmware. Unfortunately, when I update=
d
> > > >> the kernel and rebooted, I got a black screen.
> > > >>
> > > >> Further Google searches led me to reboot, set `nomodeset` in the
> > > >> kernel parameters, switch to a TTY, login, and investigate the out=
put
> > > >> of a `dmesg` command =E2=80=94 and what I saw ... Well, let's just=
 say it's
> > > >> the kind of thing that would make Linus go Chernobyl:
> > > >>
> > > >> `amdgpu: probe with driver amdgpu failed with error -22`
> > > >
> >
> > I am sorry this happened and understand the frustration.
> >
> > Please open an issue here:
> > https://gitlab.freedesktop.org/drm/amd/-/work_items/new
> > and upload your full dmesg log. Please ping me personally @Venemo on th=
at
> > issue after you opened it so we can start investigating what is wrong t=
here.
> >
> > I got curious so I plugged in my R9 270X right now. I am typing this em=
ail on
> > a computer with a Radeon R9 270X using Linux 6.19.12 on Fedora 43 and i=
t works
> > fine. We are going to need to need more details in order to diagnose wh=
at the
> > problem really is. We might ask you to test some proposed fixes, consid=
ering
> > that the issue doesn't happen on my R9 270X, I don't have a way to veri=
fy it.
> >
> > > >> Now, I hope to God that this email finds whoever is responsible fo=
r
> > > >> breaking this `amdgpu` firmware before the same thing happens to L=
inus
> > > >> via Fedora 44, and he goes berserk. I realize that's not a heck of=
 a
> > > >> lot of time, but God only knows HOW many Linux users with AMD GPUs=
 are
> > > >> pissed off by this kind of issue =E2=80=94 and I for one can only =
imagine how
> > > >> Linus' reaction will compare when it happens to HIM!
> >
> > I'm happy to help, there is no need for personal insults.
> >
> > (Note that the issue clearly doesn't affect all AMD GPUs and it clearly=
 doesn't
> > even affect all R9 270X GPUs.)
> >
> > Thanks & best regards,
> > Timur
> >
> >
> >
