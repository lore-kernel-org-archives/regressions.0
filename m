Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D951351C09
	for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 17:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777310246; cv=pass; b=MNXSMvySrdIMFs0aoaKCK/vpn1GIQSj0u2Lx4YIl5n5oIN8q+ofgOjKJHkSQJla7nAsH2JVNn7hspZO43oLIfhcnCVjOdmw1VAGxyTB7h2TPLflpCHh8hRfQiIKkbrsVECOVNYDBQUfIHvDlB36+HySEqx/fiSaSELZvh8ZZCWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777310246; c=relaxed/simple;
	bh=d76/vhNDwu/QAcZIz5Xx/7XZ2Yg2CBZFye37EPl8zpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAkoCVRNqi0lXPgThJvRf1ocKqILcFoRtoN3+vUZHvOGF6I6eHeiEKOGpCkqiseuoCYR01urjbYVWUHc39jyTfmHtHea3WGxVlDDlR2pgTYIPzqR6Fisfb8UEj2HKqsNHcSc3oOXVkUE2x7agPfwnH5UWJD8cgMyO2VJGqhnL9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EC7pDzZN; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EC7pDzZN"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c7212836bso81173c88.0
        for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 10:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777310244; cv=none;
        d=google.com; s=arc-20240605;
        b=cqok6EvbYhNBE1UIS83CQwbCAlXmraiuFd0YZOYSsmq5QbVyoBbx+HPCDPcPlCHLEt
         0mtI7ZRkmCJ1BJsDkrWywm73EDMfzbuNMP9i4Wb/0BDmHLbGNtfV3Vigndyz57tmEvyf
         Fse3acbFwvIqt5lNNmacHU4Zl4hnTU7+sKWyOYPh8aq4IaLweWJVrIOc1BrINCSqkOSI
         A9agsryYdlhxNbouTE5LDaHdIwHV5keVtg/iXlKftKPHaO1tM4uXEKz0M8IAkomz4k39
         U0nZFTybxtY99ufN1UuGrfXxvbyUoCUJVX4WdExXerw/rxBgp+1ByJalUi6ZAyxNUwl4
         M04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d76/vhNDwu/QAcZIz5Xx/7XZ2Yg2CBZFye37EPl8zpI=;
        fh=V/ykDqLe5C0r2nHiRPsHfy/Y58+pWl8x7ORH+AW2g5U=;
        b=BfCMKZog6Z4JeCqet1iJWMvXeiJXaGjy5MelE3dCMjEZeDv/q42HrECcd/dZyAsSGh
         JiKMsc+yKO/jxo0OwfpwQk5bQ/Myomq4O6joIEisOMvS+6rFWvNtvO2U77tx1i1vQFPz
         aTJvYNX5fSNb/i9f3ETxrI8QbI1Yuu6QvAEqrhAc5ozDqKorduo2Eq0g/hqv/U/9QJKi
         cOU8y4j21/sE/+BsNAOKbCX8R6YbufHTG6oatplIwS+2J+Hc1Kqsv3VUzt27zpT4H1j+
         6rL2/TnbdtTsILGmeXrHPBcXGIn26NizeY0TOfS56raPlwqSGc8cCwp1rf0M78zGKvwn
         KjrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777310244; x=1777915044; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d76/vhNDwu/QAcZIz5Xx/7XZ2Yg2CBZFye37EPl8zpI=;
        b=EC7pDzZNi+lmw+IdVtYIwsc5JL+3JTudiqJaE6Oy1PuThk5ZAl+owjmjaBJOuNmLGg
         vvLJT0560MJ9PQq09pzh3yFu29FKhQB0j1tNrVj2GCLIergY8jiC8GEszzM1AJgMWU8x
         cxpUZnWP/guwZGVz58iytvBXlg6A+/oLzxTPmXUHZxGWcTPc3qW4d6eU59MN8d6BTRge
         LmiL+fS8WkZAiCeSiMRtxs/5UjlYagunYHkvE6ktQoxzJ5QzDqsVob0CGmb/JSlOgSbv
         +wf+DKEKU+/2x3cvuagpHFdCBxeYDGchiPOARE6XagmHsegc7GBMBW7c8cZI+S9wQE4f
         NDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777310244; x=1777915044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d76/vhNDwu/QAcZIz5Xx/7XZ2Yg2CBZFye37EPl8zpI=;
        b=kc51ZP1u0/WHrsYkMfwc7GJZILlxGy3Ycsp831V+0/E9FensHYt+FqVy9SzyPT/kEC
         4BkjwHXgTupCaeYBZK9GKlJ/3NAbzyI6eK6efhCtx5mtyrZeLfVVpAFpYcynha3oSRiG
         PVheLABjV8XehHh5rikBLsN+6YW3r3ROM0fkGI/dd+TL4Ik5FrsHcvzKqCEzs+R8ErMZ
         UxwmOEgZtC8vM+c1j+oL8vPZurNENkk890Qkaa+0ae1xb1vmStSKyJufg5C0cErvDTWX
         lOib/p5cWJaXMqjAtUboZAO5zS72ImspE+jfuz0OxqVolDw1JmnyDPLlmnEb2z4UfV6D
         ZsXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dFhw0ybaEka8dhzCB2GtH5TJJuMeyebxNByeiHxZLUsok4x8lsVM9y3CH5tepv9eonUY6BfkBr8sD3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBF0pZUg9jGfMEjogyWINgQSFrfPBgJdXtcuKeHUMRWbtp6R2e
	kh4ODgHhUjRwgQyKNS7W19MtJFgrPIDlqBeanPEqT9OR6UUUJZaIvW93UCYkC85eDD4lTUdhBPd
	+fqeFAyV8KHdaAfD1wmas13hDR4Kt+RY=
X-Gm-Gg: AeBDietlIu5j0yEL3+Myt4JN44j8hj3cHZnnAIEqsjuzdd4IuPg83bmxiLr23qRYl9/
	3XlOdrMQimWKUQb1BtbUIUtAf3WaeJPN7R1jIlqCFVxyD1+esvxIw1iEOsxcWGmNWQsejdtoNVp
	UNvTJiyomB31hzSiddqy5V3n+H3DOxMX1EzHH+GnkrEJr3mqVhbER4OSN3OkerYsVxL1Bv9AA6u
	ZXOxYtOKoehTT6CcjA3p0h0vvPmQcWueEVfipfMsL8z2Py2aZ15iRJwkT3QoXLg5bV57H1UyJH/
	XmQgeTwIHphFcrdf0hI=
X-Received: by 2002:a05:7022:42:b0:12d:ca31:f1b5 with SMTP id
 a92af1059eb24-12ddd538ab8mr116171c88.26.1777310244307; Mon, 27 Apr 2026
 10:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMYTvdA+yCqU4_9mzMUkX_3S=myExKMBCyB88dYWCMwA1edsrw@mail.gmail.com>
 <6c48aff5-b6ee-40af-98f0-c26ded3095bc@leemhuis.info> <ed3171ef-eda8-4907-a35b-2e2b8185e574@leemhuis.info>
 <2730559.vYhyI6sBWr@timur-hyperion>
In-Reply-To: <2730559.vYhyI6sBWr@timur-hyperion>
From: Brandon Taylor <br.ta.2818@gmail.com>
Date: Mon, 27 Apr 2026 12:17:13 -0500
X-Gm-Features: AVHnY4IAw3_4fcOnTdNIs8ulSKBdL22VjTacDK_lOq82_bswTKBvGSkYygld3KU
Message-ID: <CAMYTvdCtpKsHAjBtZOK8MK4dYJUTUMCwgsur50Np3+yJhnic+A@mail.gmail.com>
Subject: Re: [REGRESSION] amdgpu error -22 first encountered in kernel 6.19,
 not fixed in 7.0
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I'm happy to help, there is no need for personal insults.

Sorry if I came across as insulting; that was most definitely not my
intention. I simply know Linus' penchant for going insane when an
error is found in his kernel. But I'm thinking Timur's probably right;
this may merely be a "me" problem, with my particular GPU.

At any rate, I've created the issue ticket as requested, and here it
is. https://gitlab.freedesktop.org/drm/amd/-/work-items/5220

Brandon Taylor

On Mon, Apr 27, 2026 at 9:01=E2=80=AFAM Timur Krist=C3=B3f <timur.kristof@g=
mail.com> wrote:
>
> Hi,
>
> Thank you Thorsten for forwarding this to me, indeed I am working on impr=
oving
> the driver for these GPUs. See my replies below.
>
> On Monday, April 27, 2026 11:37:53=E2=80=AFAM Central European Summer Tim=
e Thorsten
> Leemhuis wrote:
> > [note: please remove Timo Lindfors when replying to this mail and
> > include Timur Krist=C3=B3f =E2=80=93 sorry everyone and especially Timo=
, my mailers
> > address book tricked me]
> >
> > On 4/27/26 11:35, Linux regression tracking (Thorsten Leemhuis) wrote:
> > > On 4/26/26 01:22, Brandon Taylor wrote:
> > >> I have an AMD Radeon R9 270X GPU (yes, I know it's old) which used t=
o
> > >> default to the `radeon` firmware
> > >
> > > FYI, as using the wrong terms can lead to confusion while dealing wit=
h
> > > bugs: that's not a firmware, that's the driver (sometimes also called
> > > kernel module)
>
> - "radeon" is the old kernel driver for these GPUs that didn't support Vu=
lkan
> and therefore was mostly useless for gaming.
> - "amdgpu" is the new driver, which supports Vulkan and offers better per=
f,
> this is the default since Linux 6.19.
>
> I don't think this is a firmware issue.
>
> > >
> > >> on kernel versions up to and
> > >> including 6.18. I could manually change this behavior to use the new
> > >> `amdgpu` firmware by setting `radeon.si_support=3D0 amdgpu.si_suppor=
t=3D1`
> > >> as kernel parameters in the GRUB bootloader. Everything worked fine,
> > >> and I was able to play my Windows games without any problems.
> > >>
> > >> That was, until kernel version 6.19 came out.>
> > >> 6.19, from what I was able to Google, was supposed to have AMD GPUs =
to
> > >> default to the new `amdgpu` firmware. Unfortunately, when I updated
> > >> the kernel and rebooted, I got a black screen.
> > >>
> > >> Further Google searches led me to reboot, set `nomodeset` in the
> > >> kernel parameters, switch to a TTY, login, and investigate the outpu=
t
> > >> of a `dmesg` command =E2=80=94 and what I saw ... Well, let's just s=
ay it's
> > >> the kind of thing that would make Linus go Chernobyl:
> > >>
> > >> `amdgpu: probe with driver amdgpu failed with error -22`
> > >
>
> I am sorry this happened and understand the frustration.
>
> Please open an issue here:
> https://gitlab.freedesktop.org/drm/amd/-/work_items/new
> and upload your full dmesg log. Please ping me personally @Venemo on that
> issue after you opened it so we can start investigating what is wrong the=
re.
>
> I got curious so I plugged in my R9 270X right now. I am typing this emai=
l on
> a computer with a Radeon R9 270X using Linux 6.19.12 on Fedora 43 and it =
works
> fine. We are going to need to need more details in order to diagnose what=
 the
> problem really is. We might ask you to test some proposed fixes, consider=
ing
> that the issue doesn't happen on my R9 270X, I don't have a way to verify=
 it.
>
> > >> Now, I hope to God that this email finds whoever is responsible for
> > >> breaking this `amdgpu` firmware before the same thing happens to Lin=
us
> > >> via Fedora 44, and he goes berserk. I realize that's not a heck of a
> > >> lot of time, but God only knows HOW many Linux users with AMD GPUs a=
re
> > >> pissed off by this kind of issue =E2=80=94 and I for one can only im=
agine how
> > >> Linus' reaction will compare when it happens to HIM!
>
> I'm happy to help, there is no need for personal insults.
>
> (Note that the issue clearly doesn't affect all AMD GPUs and it clearly d=
oesn't
> even affect all R9 270X GPUs.)
>
> Thanks & best regards,
> Timur
>
>
>
