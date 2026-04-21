Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C183A63E6
	for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 23:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776815667; cv=pass; b=r3/xUPfI0QufgBDYzLKKgYEsQesbSeidmkdBt7c9Gc3Zg4h9npH5Dg2sL3wN+T0f8W+BLA8QZ0KzIH5mUYQwMHcwIfO5m36RqVoD59jJJNnVGjoDceFUJ6qIP8GY0IMtOSl3aniC36WyWhCkwEsunbF+rJ61JTk1i0PnHVNL0NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776815667; c=relaxed/simple;
	bh=H1tHV2AxqvpQzt0bU5Pihn0mRHk/4Zw8qlVOIr0xMMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FM8YUwUlVeAj7nSMuRipgjGZbkaXYn/IfvF9U/9FJKJ786WrXN7kM4E6+ag4ACt93pOG04r+0XkNaHQZaqToLVd794tCAkllvpmpjMwtmZUYyUMo7jZXbC9QxUodszkj0SwPVQmr5o1cQMC+T+ToUfIVuh0x3LYz0cSHwD2e6bU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HymUXx95; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HymUXx95"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50e5ad864a6so24773661cf.0
        for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 16:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776815665; cv=none;
        d=google.com; s=arc-20240605;
        b=lUq/hwv4nTc6ykbYya9k6kb4XJAuBnHe0iG9u4Ju2noM/O2RuOPhsHWVtP8OcQWzYN
         Ik0+92mxR6EbaZhzElk91S+Gn4WQUfZ7UnqOBmT89f2RJvmLcXa95u2KE1CebgtzVfAD
         SZascO9gqqmcZTVUrYm+evKkUOkuLOtmEsTGDzXQnJjcMvYgEFBocs8b4Zd5BwvL0LRn
         4Gljt1O1F154FsALQd0tSt5aVIizlV23b8kvhPsIgSjpCa795e/Qoo+sXAKsN5mWiqo3
         UpkcDLTI056/VvSxMaGs97B+Z3C459GaqwwUvLzlnuJ3c00KLiIjYGWv7gM/Jl3gneNZ
         65Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aKcIgoAajVypMfQvXdPWBcTg4avBTwmW4grlivILcXA=;
        fh=yLM8n2LneVVuuCsokuyhTvsgmqb97PdnwB3WpC0vIGc=;
        b=IaQjVlJdCcDzixJyb8fw3Luc3k/kx6dwZETJFItpm5OPYec5j8pXMt8Uh4HxbAV828
         CULaXTDVUquEcUsamWY2zm44OH7FTxJ6E9c82e4dTlHNhB/b9XcYl/1jHhlgeUUAooqN
         YlXm2ogdACQr8rMkJ21ZmqlgrrosrTos+jezWFDYlMU4HkQLVR05v4CUnX1m3ibqn0k1
         GX4X8xYgNCdnEWSO7gAoDckbp/WZSdvaRJ/TmxDYMTTzCe4gsq/JyhDCYe9KCOHYhNUA
         OIp4mV7ESezG/uqpEeOUaNwvjjROD5HGARwVjD7WNyts8WZwKFLR/Ce8hlBg3z3b/uwF
         6XWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776815665; x=1777420465; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKcIgoAajVypMfQvXdPWBcTg4avBTwmW4grlivILcXA=;
        b=HymUXx95M5Ndc7b3IIg8MYtbtGF9WxeJ8Ldcgt29jAEo/AkbBHRWsn68GhXuXkcdHO
         ug42XedKwRuwefAktYp8hVu9+/I6ukPU5gJFnZNQgghFI3Ar7p84gaZlk8M4HHp8yOCE
         U7YEhCEO0XfEtZq+3cpAkxGbia7l9VoZTXQqffZfhOL44+Gf1jYS0Mt41UPT8+pyr+mQ
         28wEjFlv3IEVLSqOz2Z6hPyguHPM9BFgfMMMwLEFVFnkg8sOMpRhATElRuwY7YiOZBFU
         ZF1WpY9032efEHMdhaxBz96W1iAsKq+tfYZcElBkd51CmVcbOYYxOnGcuZo7UaYkriM+
         DzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776815665; x=1777420465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aKcIgoAajVypMfQvXdPWBcTg4avBTwmW4grlivILcXA=;
        b=GCI4FKqzWBPlClyp/gZM8jfQYguo+Ffz98BSMUvHy+zQsWhSLQhaXkCzu1zNzn5qf9
         23JZGJoPO62hQw8eFjNx1mknXbLoCPv/nyM9LKo+plhCHFzERUk1TXhJvocPjylGCCAC
         To0CU7bvDaGknDvAU1Rnx8WoCIu+9kar61fhaLXgyP6tdoYSQ+s+ve2UYrUlzUV/hF/m
         lQlQ78YqtyXvdgxMpDK9KX7vMW3mgpeoLRgLqq6UHrGKYGO6pJ10mv89XlJfRXfYI6yj
         9z/YFTU4V/ZxkbAsRRS0/f5+zXF7vH8KLUVgy7IoDodQ2mbagWvlGmOcka7I62j3wKy9
         qD+w==
X-Forwarded-Encrypted: i=1; AFNElJ980nadAsNp66MmGGTnshttrS5zB1kXXXi+H2u33x194xH7f2x35w1eYiAH9D1VL2IJVrkw7lxFZ25MmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4KdTExDoZoZ3i6KzdtfXmpP12a0bURLicplXYvD6LRH9VICqh
	h+Y3OOnKh0o83klPLHaw3uApgNLScQlilKS2efG4w+G4qLyfgLrT5L82Fe6rlZ4mOk9w+D60o/r
	LWyhpV5butHvY8dU8jZWhjYLu0JnctrtnZ66jcH4Y
X-Gm-Gg: AeBDievpNdmcNlqydmmtxFvWJk6pOyznyZpKr9NKwstzFcfRNPxVgDmJO/O/q5/lTjZ
	PqzJ5UZZxRdmjZ+/MKHSv1G4k8fwIb2MK3zEaN7XuQsamD63i6pLTP6asHbRdd+LS8F9f/q4uSn
	LkoA20Rnj6AxVo6yrtFgfwNhFkiuInGxCJaWDZS7wZNG5GncukDmZGyOHsnY8B+SHN546NtgaGi
	3DhbLqGdOlePh6kjpT+eRSohVJEqptZ1PEL2gZV8y/GFC/MzE0qQDYSD7t7hMnczVuGexrGzUXt
	BKfy6xntdnssbmWQWax6SA/QONw=
X-Received: by 2002:a05:622a:4d93:b0:50d:a5e8:39e9 with SMTP id
 d75a77b69052e-50e36b495e9mr297879961cf.20.1776815664530; Tue, 21 Apr 2026
 16:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHWLEDHfXZScF5jNDzgOxGXf-MBDcVNtqW0DbNz8Ra8rtcuL+w@mail.gmail.com>
 <CAOdxtTbwipkyAfDakLAB6aVp6YkPWtKpDdVDUTz88WDB-18HXQ@mail.gmail.com>
 <CAOQ4uxhUn6oCBuVJqZu+FcMx8XeAQHZbXFAGon4Xeg2SPLJW_A@mail.gmail.com>
 <CAOdxtTaWWu_7eJWu68zf28zHQP3Y--vXTfbGFsceO47BpN3qxA@mail.gmail.com>
 <CAOQ4uxhCNhGinePrnkSfT9Mtf4o5FmBX7mTA2m4miCMOt3mJqA@mail.gmail.com> <CAOdxtTZGFxaayJpqsiFQrWBqXvDn7oyxSL3_9TWP919k0FhWTg@mail.gmail.com>
In-Reply-To: <CAOdxtTZGFxaayJpqsiFQrWBqXvDn7oyxSL3_9TWP919k0FhWTg@mail.gmail.com>
From: Samuel Karp <samuelkarp@google.com>
Date: Tue, 21 Apr 2026 16:54:06 -0700
X-Gm-Features: AQROBzAkSzvOaq9x23mj12eG21nTUWOF2akExiQWk4MV82XnI5dSal-M0xoxtz0
Message-ID: <CAE6nXrPes8T9Cn4ihTt43qmtgCCZvmMwYXo-yG_HJgNO7y+vVg@mail.gmail.com>
Subject: Re: [REGRESSION] Return change in 6.12.80+ with volatile mounting
To: Chenglong Tang <chenglongtang@google.com>
Cc: Amir Goldstein <amir73il@gmail.com>, Derek Taylor <ddtaylor@google.com>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, Kevin Berry <kpberry@google.com>, 
	overlayfs <linux-unionfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We can fix the test case for the "volatile" option and expect either
"volatile" or "fsync=3Dvolatile". Existing use within containerd beyond
the test code involves us producing the "volatile" option and passing
it to the mount syscall (or _not_ passing it, depending on the
situation). This seems like it should still work if "fsync=3Dvolatile"
is an alias rather than a replacement.  However, containerd is not in
full control of the mount options; as part of snapshot (layer)
management external snapshotter implementations can provide mount
options to containerd which containerd then passes to the kernel.  The
protection in RemoveVolatileOption will break if a newer snapshotter
produces "fsync=3Dvolatile" and provides it to an unpatched version of
containerd.  I think the breakage scenario then becomes new kernel +
new snapshotter (producing the new option) + old containerd.

--=20
Samuel Karp

--=20
Samuel Karp


On Tue, Apr 21, 2026 at 10:20=E2=80=AFAM Chenglong Tang
<chenglongtang@google.com> wrote:
>
> CC: Samnuel from containerd
>
> On Mon, Apr 20, 2026 at 12:59=E2=80=AFAM Amir Goldstein <amir73il@gmail.c=
om> wrote:
> >
> > On Mon, Apr 20, 2026 at 8:31=E2=80=AFAM Chenglong Tang <chenglongtang@g=
oogle.com> wrote:
> > >
> > > Hi, Amir,
> > >
> > > Thanks for looking into this! To answer your questions:
> > >
> > > 1. Production vs. Test Suite Impact
> > >
> > > The immediate failure we encountered is in containerd's integration
> > > test suite (TestImageVolumeCheckVolatileOption). The test explicitly
> > > reads /proc/mounts and expects the exact string "volatile".
> > >
> > > In default production, containerd passes the legacy "volatile" string
> > > to the mount syscall, which your patch correctly handles under the
> > > hood. So the standard "happy path" is not broken in production.
> > >
> > > 2. The purpose of WithTempMount() / RemoveVolatileOption
> > >
> > > Containerd regularly makes temporary overlay mounts (e.g., for
> > > unpacking layers). Because overlayfs rejects reusing upper/work dirs
> > > from a volatile mount, containerd uses RemoveVolatileOption to strip
> > > the volatile flag before these temporary mounts.
> > >
> > > Currently, containerd's RemoveVolatileOption does an exact string
> > > match for "volatile". While it works for the default path, there is a
> > > production edge case: if a user explicitly configures their container
> > > runtime to use the new "fsync=3Dvolatile" option, older containerd
> > > binaries will fail to strip it, and the temporary mounts will be
> > > rejected by the kernel.
> >
> > I need to challenge this specific argument because I do not agree
> > that this edge case could be considered a regression at all.
> >
> > An admin from the past could not have set an explicit
> > "fsync=3Dvolatile" mount option.
> >
> > Though experiment - overlayfs adds a new mode fsync=3Doff
> > which is more loose than "volatile" because "volatile" can actually
> > return error on fsync in some cases.
> >
> > Overlayfs would also not allow to reuse workdir from such
> > a mount.
> >
> > So would you then claim that adding the new mount option
> > "fsync=3Doff" is a regression because of the edge case that an admin
> > decided to explicitly add "fsync=3Doff" and RemoveVolatileOption()
> > does not handle it.
> >
> > I don't buy it.
> >
> > There is a more correct way to handle this situation and it is
> > documented in overlayfs.rst:
> >
> > "When overlay is mounted with "volatile" option, the directory
> > "$workdir/work/incompat/volatile" is created.  During next mount, overl=
ay
> > checks for this directory and refuses to mount if present. This is a st=
rong
> > indicator that the user should discard upper and work directories and c=
reate
> > fresh ones. In very limited cases where the user knows that the system =
has
> > not crashed and contents of upperdir are intact, the "volatile" directo=
ry
> > can be removed."
> >
> > containerd unpacking layers falls under this very limited case.
> > containerd can syncfs() workdir after unpack & unmount of temp
> > overlayfs and remove the "incompat/volatile" directory and then
> > the upperdir/workdir are are free to be remounted.
> >
> > >
> > > Conclusion
> > >
> > > While containerd could theoretically patch their code to accept
> > > strings.Contains() or fsync=3Dvolatile going forward, there are many
> >
> > Following the documentation advise would be better.
> >
> > > existing containerd binaries in the wild. Given that this patch break=
s
> > > containerd's CI tests and introduces an edge case for
> > > RemoveVolatileOption, it might be safest to fix ovl_show_options in
> > > the kernel to continue outputting the legacy "volatile" string to
> > > strictly guarantee backwards compatibility with userspace.
> > >
> >
> > Considering my comments above, I think we have not yet reached
> > the point where the backward compat "volatile" string is called for,
> > but with other reports from production workloads, we could get there.
> >
> > Thanks for the clear and honest explanations of the containerd situatio=
n!
> > Amir.
