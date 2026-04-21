Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073062F25F5
	for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 17:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792020; cv=pass; b=i426AXYrtCYCLsqGo/3G/AUGJvmBtPHeS8+J+4nxxT4VTo60loRB5YhRCrqzzceOV9Cp/XqAqwd/0k+QmPj/X/zMGE0pwCWSjtWRsS+P8iEIb2l+W1EFaSyeArJsIW0/D1VnQ71FEICkYDp6WaceLcclSCkd9ZxW9ApJCb3LPxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792020; c=relaxed/simple;
	bh=Vxeh3HrJSuiP4oJvDrptNJN1vnuRJPPVEP7iiGSRHi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=seT7A2DbjMy1v7bxwQQp16sjFPjLbD3Ow+oP/96Dij2peyKzJTH0OfocKVBfLO+r97y4oc0rScpGsxElP6MwrHdEtj2idjSZ5Efl+/+B212f80L7vF0an1LPwvl79AjGCFu/XdCwH8YEYgwHg5i2N7cQ8jhl41RiknbkGU/Ar34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JeqxOpj9; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JeqxOpj9"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50d836552daso2348171cf.0
        for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 10:20:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776792017; cv=none;
        d=google.com; s=arc-20240605;
        b=KgSk9IG1f54Ir0gvgLo+671LAUdp5bNPZeqpgu41uZin6QJT7CzdYWPIDdVz7UbXax
         AM2egFWEA9pgbthZc6rYxBx8OyXuVMC+/j5WBa/7fxuHbTYZO+0rOems/quNPz2GbqM2
         xZFBZrkp7sGcrVSAYuXIG8ipMyESmDTboXVqf9ycNg5GSvml6mg7eIsVdHk/B15pvj0d
         zj9LtuM32jTtfyMGLRh8D8mvwLCzfHnJinf5zdv4uESJ81cj7R3ed9OKVGXr6BGpprk8
         UZb9sbtKflEIuHNi7RGys2ZfJSIPR+gOY4fKd8vJr0Qg5R+D3pXSMJ5mV86KJDOTmaIv
         ZiKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ha9b3BYC/DPqvosH7Lf4u9Isf4lxfWOStmLn8gp6G1A=;
        fh=zd//6/VicY2y0j/bNwNTmCqoYPZwMoOHWEWTUHywOjQ=;
        b=NRlYsjEvom1UObnt5px4LK8uuCroiO1D7vJQytEXXkvdXbMwOOh2Q2WaEYbGJQHdj9
         x55LjEJv+fBeeXwX0UscWNqGCXy9cwd2i/Mu3cWhuoc3dazr7PwYfzyVsGQR2lBngPj3
         Gk96SqEozbxU2M8a6k29o9IRjUl9/Th2hQ5zJimgJxyy+gQF2qs3lopOuf1A3z4f7djm
         6996vBq41rh4fqO67zaLH5naB+xCkIaFsywPGT1/SWjqL5sjTLh/F83MREPgmJAJNaES
         PDNwmRlyaoFp7u18+5alkTEPDi2ehcgMbFLzJhbTgaviT/VHseR1YX0RlcZ/yw5b9lwl
         4imQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776792017; x=1777396817; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ha9b3BYC/DPqvosH7Lf4u9Isf4lxfWOStmLn8gp6G1A=;
        b=JeqxOpj9y4FX11JXaYojjqR3deWqroSITjEb8KF8ezKGNGbPScjNw9UYFsCESSfXSA
         PeBj2nEd+Hh3GLlufwOemJTd1yt981PttEZuGOswHa2DHdV/sDU5KPEMswFtLia7kmvl
         MIIP6gVcZnVyxeOo603EacxEF+i2t5onkbd+b06uboos5dYtvhcyhVJcR/mLEJXx45Zy
         yENUaNZB+475uDsa0OeW3wCI9ErMWLLoYl/B6W/cqTMtJB9U0vEHHZKoItC+PbDGizqm
         nTFUwWRab3uxJeFuI9z4C0HLM873Y0AqWSyARNhX+BZnQi+pH7eI+gDMZ3aoyzd39lAK
         RKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792017; x=1777396817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ha9b3BYC/DPqvosH7Lf4u9Isf4lxfWOStmLn8gp6G1A=;
        b=pCSs1MOJCLJjnQXkIKoYFDf79WjtQBsH8QObdlrSTmyFif9P05dzVMvgdsmki4ERrr
         EjQ2NUObgACrnTT3WR0Ihe5x1YVDy6VSu8iZFNJsRlj97WpvgV9aTn8dxMXLR5IYlu05
         a044clXRn/bJkCeVZ2K2huOJEEnTz8xGU0V5hNuHI7eNDOiMAexugMfr1e/6HJ8ajtT0
         dWZjnVI1mAFkhUdqt+jAZl6cWBdOvQ2+cnrq6anyVFesYVqyKnneBh0zb2ud5TxNjF93
         fc4g482bIvtEKXWNXZKK3wXxQPcdtFWrES4ct9liTOorOOVaFT08V+lFdyvbYzcUHToN
         D9lw==
X-Forwarded-Encrypted: i=1; AFNElJ+zVTuHbVqnJlDaX5AQ0hcvBKsr2+ucgtEwAyng9iNI/3lZeDcsizc3cRf5qo5N4ffKZoFdRp7PVPTQvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrLHi+ckhLilJVb4x6OFMlTL2S5Cu/Oh0LVaCgTC9bW/Bcnvzo
	8S5h7WGC7PNTpEVFaSlGIj1F2QotFzfLhlYwFrrdOMlBzz7MZ3FramagwKvo/4pswSzseJO9vie
	Ngj5uGGP0vwM4N1k3gz35lu2ILKOXanimdwE+73Qv
X-Gm-Gg: AeBDiet1zGdw3RNqq9dCsGqinR188kNFEwCDZnANqwv2BqtKVz0oPBz3A8EY2Eb55eL
	rFRgHWC0KcqQ0EXecuwGCSdYXSN8BPtByS/Aucj0w1O1e3E42ud04i+/lDlQ2G054Fx7Hq7QOLZ
	NGsX01aujlKhUE2b+Y7cFuoM2ebCOOmmryGqg742y2AuAqiNHodn8ZKejDIi+oxRi7rSQhp9yG6
	5JiVGoe6+goUKu7l5kX8NH/2zUFw/s3JrkaQG3sMjp2JPuW2DEd/8uY9i04X+nSGKxvgCWna1ob
	1R6mKyshNSesmCinMKr5u1Fj0aM4
X-Received: by 2002:a05:622a:5a87:b0:508:fd42:fd05 with SMTP id
 d75a77b69052e-50e4420283bmr53961561cf.15.1776792014053; Tue, 21 Apr 2026
 10:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHWLEDHfXZScF5jNDzgOxGXf-MBDcVNtqW0DbNz8Ra8rtcuL+w@mail.gmail.com>
 <CAOdxtTbwipkyAfDakLAB6aVp6YkPWtKpDdVDUTz88WDB-18HXQ@mail.gmail.com>
 <CAOQ4uxhUn6oCBuVJqZu+FcMx8XeAQHZbXFAGon4Xeg2SPLJW_A@mail.gmail.com>
 <CAOdxtTaWWu_7eJWu68zf28zHQP3Y--vXTfbGFsceO47BpN3qxA@mail.gmail.com> <CAOQ4uxhCNhGinePrnkSfT9Mtf4o5FmBX7mTA2m4miCMOt3mJqA@mail.gmail.com>
In-Reply-To: <CAOQ4uxhCNhGinePrnkSfT9Mtf4o5FmBX7mTA2m4miCMOt3mJqA@mail.gmail.com>
From: Chenglong Tang <chenglongtang@google.com>
Date: Tue, 21 Apr 2026 10:20:03 -0700
X-Gm-Features: AQROBzDjNAxFnpR4sQRC9kzmG1vz5c9sq9OzKeP03GuQb7DjEPQ23ObObnZ8GC8
Message-ID: <CAOdxtTZGFxaayJpqsiFQrWBqXvDn7oyxSL3_9TWP919k0FhWTg@mail.gmail.com>
Subject: Re: [REGRESSION] Return change in 6.12.80+ with volatile mounting
To: Amir Goldstein <amir73il@gmail.com>
Cc: Derek Taylor <ddtaylor@google.com>, stable@vger.kernel.org, 
	regressions@lists.linux.dev, Kevin Berry <kpberry@google.com>, 
	overlayfs <linux-unionfs@vger.kernel.org>, Samuel Karp <samuelkarp@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC: Samnuel from containerd

On Mon, Apr 20, 2026 at 12:59=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Mon, Apr 20, 2026 at 8:31=E2=80=AFAM Chenglong Tang <chenglongtang@goo=
gle.com> wrote:
> >
> > Hi, Amir,
> >
> > Thanks for looking into this! To answer your questions:
> >
> > 1. Production vs. Test Suite Impact
> >
> > The immediate failure we encountered is in containerd's integration
> > test suite (TestImageVolumeCheckVolatileOption). The test explicitly
> > reads /proc/mounts and expects the exact string "volatile".
> >
> > In default production, containerd passes the legacy "volatile" string
> > to the mount syscall, which your patch correctly handles under the
> > hood. So the standard "happy path" is not broken in production.
> >
> > 2. The purpose of WithTempMount() / RemoveVolatileOption
> >
> > Containerd regularly makes temporary overlay mounts (e.g., for
> > unpacking layers). Because overlayfs rejects reusing upper/work dirs
> > from a volatile mount, containerd uses RemoveVolatileOption to strip
> > the volatile flag before these temporary mounts.
> >
> > Currently, containerd's RemoveVolatileOption does an exact string
> > match for "volatile". While it works for the default path, there is a
> > production edge case: if a user explicitly configures their container
> > runtime to use the new "fsync=3Dvolatile" option, older containerd
> > binaries will fail to strip it, and the temporary mounts will be
> > rejected by the kernel.
>
> I need to challenge this specific argument because I do not agree
> that this edge case could be considered a regression at all.
>
> An admin from the past could not have set an explicit
> "fsync=3Dvolatile" mount option.
>
> Though experiment - overlayfs adds a new mode fsync=3Doff
> which is more loose than "volatile" because "volatile" can actually
> return error on fsync in some cases.
>
> Overlayfs would also not allow to reuse workdir from such
> a mount.
>
> So would you then claim that adding the new mount option
> "fsync=3Doff" is a regression because of the edge case that an admin
> decided to explicitly add "fsync=3Doff" and RemoveVolatileOption()
> does not handle it.
>
> I don't buy it.
>
> There is a more correct way to handle this situation and it is
> documented in overlayfs.rst:
>
> "When overlay is mounted with "volatile" option, the directory
> "$workdir/work/incompat/volatile" is created.  During next mount, overlay
> checks for this directory and refuses to mount if present. This is a stro=
ng
> indicator that the user should discard upper and work directories and cre=
ate
> fresh ones. In very limited cases where the user knows that the system ha=
s
> not crashed and contents of upperdir are intact, the "volatile" directory
> can be removed."
>
> containerd unpacking layers falls under this very limited case.
> containerd can syncfs() workdir after unpack & unmount of temp
> overlayfs and remove the "incompat/volatile" directory and then
> the upperdir/workdir are are free to be remounted.
>
> >
> > Conclusion
> >
> > While containerd could theoretically patch their code to accept
> > strings.Contains() or fsync=3Dvolatile going forward, there are many
>
> Following the documentation advise would be better.
>
> > existing containerd binaries in the wild. Given that this patch breaks
> > containerd's CI tests and introduces an edge case for
> > RemoveVolatileOption, it might be safest to fix ovl_show_options in
> > the kernel to continue outputting the legacy "volatile" string to
> > strictly guarantee backwards compatibility with userspace.
> >
>
> Considering my comments above, I think we have not yet reached
> the point where the backward compat "volatile" string is called for,
> but with other reports from production workloads, we could get there.
>
> Thanks for the clear and honest explanations of the containerd situation!
> Amir.
