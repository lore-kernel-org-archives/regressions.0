Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFA522A1E3;
	Tue, 10 Dec 2024 20:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733863402; cv=none; b=bB4Zuo9FQd3cZ69iYlTyj6XLKSLqK9kBtFpqNk4jjkmRf8qQI50IYh6wrt6LQ9+3DVgSB1vzUMtCTcWk5+E9ILTd0BS6dKOF+RvEUm7bGbrbWz7RDjqz357GtW43+O43hmv++YYfOKBBiwAQb8fZqfbEd1bCVe3yxCCE9kXAoRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733863402; c=relaxed/simple;
	bh=bGHhrprHjsToC4P72S/FLs8cS2mBs18/lgIPgsVAUBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbHXbwkE744cqIl183lkYfslDSVVgoHMfbgbjR/0+5RZgKzqLgQJXesD1q83fP3QsEXwH6JJiyYCG2T9tO0hTfAp2PzyHFwMCJn8vqkkKCRNMkX8GASHVKIY89SYI2rMt6CLuF41YyAUKUSnkhTeuROXQO93r0L0Lki7zwFTR5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVla6AdU; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVla6AdU"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so24035a12.1;
        Tue, 10 Dec 2024 12:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733863399; x=1734468199; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7FUX9r36NLSxog04wPW5u0vmu66rr70tdVVE7HRO7I=;
        b=jVla6AdUGO6cGQInWObEmzEw3NC9mIvkM7Mlc/H+e/PzI38de4F8KtVUrQPwu9gg/2
         45ftQjaCn75zQNQa0EhNrleZWABqceb0DdmZ6TsX/fUNZU4jFdN5kFt2W4DIUIdBfyff
         QZNCF6wOrPptrWUiMT86eqGGjLjHIhPNjQ3f/BGcm3Bi13s6fjIYP/DWc5B5Qv/uxa3q
         83vQg3x2jCYSflkdoxTbo7ekZ2Yd3DdfyPUkSobPAJ1jopEL/EbrDRTmL3c00NODfIE0
         GMDtpQD1g/oSHKAZaLPcWvbOZAyyTZ++XmOqflj0bC3TUloGQ7Mb3PUbWkatxZNV8tYl
         Me/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733863399; x=1734468199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7FUX9r36NLSxog04wPW5u0vmu66rr70tdVVE7HRO7I=;
        b=fBcA7KVMF4F2QQnGbzwKOnEieYWw9pyT31zeCDuqt0KZM/Tfn43G+k2ncWVJfQgxSU
         Qk/cNeUkhVyeex9PgBemqvFmSIbKjJ6MHT3281jK3cveJAUuLV7lzXYFPtB5fStMxE+o
         ARjFgT0oOhLzCxf5jvCXmzyWs8ttnifUCskBshF/Hw8mVyORxDN/dMKOkza0c/KNQ00S
         rZJ0diLWR2R6OHsy+URkKpdh3ioaHbkOCAugXBdu7bo7gmn0I8RSre/f9uC9iaIeQ4m9
         IaUQ7pK1IMfsK56gpD+0HEXQDa9wodXZXM9LUAmr077PC2nwmqK7+D5gBoy70NDK7Nps
         tV8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfEwUyfrY0zf+1qRDKVXeItPPSxzfe6c0qZpZlEfD+JmncL4k0vVjoDTkC/OJ0e7sKL2Mw6fCwDmzvmNI=@lists.linux.dev, AJvYcCVqslt4F4ijLVVa3PHMmWQfV8bOCTu5yMkfvYEXNqo0IW1BGBob3GZryaY/6pqHyCT61k5uIf0lEaQ5VCPjBPU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa/f5BIdCzZtcu+RWQPkIqp4se8o1zgLJ2BFYOyYmRY4GtinAB
	YVv6YZOjvPAYhqXSHrh1TlZL8wGIMXHg5+E+6jHibqHW2f2rS3khSVmgS+M05zszwVeAi4D8L11
	TwJAbTXxmXAV9ljmGNuji6WJd562JA/R0
X-Gm-Gg: ASbGncuODEPqOpzyL/UJSZs9dOjuo1W4Sz1ECtG4HA81vt+cvkQt+Y7EdvvNxuq71xu
	hZo7gkbhl4ZFQOrVB+E1JJih7FpqsFgeaxo93ycsr481LtBtQcIHTCDK8oaz0mttuvH7L
X-Google-Smtp-Source: AGHT+IH6/kVdCtFLUgKn/dMiQKnQ9X+KOaQspRb/5dceLHrlZ3p371HZVEd2uTvW2I21VnUEN5e5BjgD/7YKKFjempg=
X-Received: by 2002:a05:6402:3588:b0:5d3:d79a:6d6d with SMTP id
 4fb4d7f45d1cf-5d433023b05mr184216a12.0.1733863399397; Tue, 10 Dec 2024
 12:43:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241113093703.9936-1-laura.nao@collabora.com>
 <20241115171712.427535-1-laura.nao@collabora.com> <Z1LvfndLE1t1v995@krava>
In-Reply-To: <Z1LvfndLE1t1v995@krava>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 10 Dec 2024 21:42:43 +0100
Message-ID: <CAP01T76qFo-fzRh2PjGPtWd-N4tgMyoh_rz2GdZwePy=dRHFgQ@mail.gmail.com>
Subject: Re: [REGRESSION] module BTF validation failure (Error -22) on next
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>, alan.maguire@oracle.com, bpf@vger.kernel.org, 
	chrome-platform@lists.linux.dev, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Dec 2024 at 13:37, Jiri Olsa <olsajiri@gmail.com> wrote:
>
> On Fri, Nov 15, 2024 at 06:17:12PM +0100, Laura Nao wrote:
> > On 11/13/24 10:37, Laura Nao wrote:
> > >
> > > Currently, KernelCI only retains the bzImage, not the vmlinux binary.=
 The
> > > bzImage can be downloaded from the same link mentioned above by selec=
ting
> > > 'kernel' from the dropdown menu (modules can also be downloaded the s=
ame
> > > way). I=E2=80=99ll try to replicate the build on my end and share the=
 vmlinux
> > > with DWARF data stripped for convenience.
> > >
> >
> > I managed to reproduce the issue locally and I've uploaded the vmlinux[=
1]
> > (stripped of DWARF data) and vmlinux.raw[2] files, as well as one of th=
e
> > modules[3] and its btf data[4] extracted with:
> >
> > bpftool -B vmlinux btf dump file cros_kbd_led_backlight.ko > cros_kbd_l=
ed_backlight.ko.raw
> >
> > Looking again at the logs[5], I've noticed the following is reported:
> >
> > [    0.415885] BPF:    type_id=3D115803 offset=3D177920 size=3D1152
> > [    0.416029] BPF:
> > [    0.416083] BPF: Invalid offset
> > [    0.416165] BPF:
> >
> > There are two different definitions of rcu_data in '.data..percpu', one
> > is a struct and the other is an integer:
> >
> > type_id=3D115801 offset=3D177920 size=3D1152 (VAR 'rcu_data')
> > type_id=3D115803 offset=3D177920 size=3D1152 (VAR 'rcu_data')
> >
> > [115801] VAR 'rcu_data' type_id=3D115572, linkage=3Dstatic
> > [115803] VAR 'rcu_data' type_id=3D1, linkage=3Dstatic
> >
> > [115572] STRUCT 'rcu_data' size=3D1152 vlen=3D69
> > [1] INT 'long unsigned int' size=3D8 bits_offset=3D0 nr_bits=3D64 encod=
ing=3D(none)
> >
> > I assume that's not expected, correct?
>
> yes, that seems wrong.. but I can't reproduce with your config
> together with pahole 1.24 .. could you try with latest one?
>

As a data point, I ran into this problem with pahole 1.27 on
bpf/master, I see the same rcu_data duplication.
For now I'm probably going to test patches with the latest pahole.

> jirka
>
> >
> > I'll dig a bit deeper and report back if I can find anything else.
> >
> > [1] https://people.collabora.com/~laura.nao/dbg-btf-mismatch-next-20241=
113/vmlinux
> > [2] https://people.collabora.com/~laura.nao/dbg-btf-mismatch-next-20241=
113/vmlinux.raw
> > [3] https://people.collabora.com/~laura.nao/dbg-btf-mismatch-next-20241=
113/cros_kbd_led_backlight.ko
> > [4] https://people.collabora.com/~laura.nao/dbg-btf-mismatch-next-20241=
113/cros_kbd_led_backlight.ko.raw
> > [5] https://pastebin.com/raw/FvvrPhAY
> >
> > Best,
> >
> > Laura
> >
>
