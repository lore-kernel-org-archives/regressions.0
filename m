Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1AF224247
	for <regressions@lists.linux.dev>; Thu, 20 Mar 2025 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742480514; cv=none; b=UT1nYK1kuZbpAIaKMdzAxZdX7ttCP6iYSYsUlb/+r2C2GlbUq/tNDxP22ndy5kuoaG7XDa2671S77tCY5vpDyNMcYhBg29GA5zI/agp6eDefoQml0IgwL+CzPJdi8/ke0eU2Np5Esc9Zz7n0cQu2P0nruWtNomxokk+ijqhiA8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742480514; c=relaxed/simple;
	bh=HWKsylmiW+BtMJkGcvcEyJY9de3c+e5FoR9mNHAPy0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oebNduOCBmOSCKf4gutC2n0eo0fLihBgvTuux/mffuf6W4/AD5gttMsgxfY761Z2W5fSVGWCzfWUZwFhTabX0TE9W1P+UTOhhfAbqXRVQT+a0QoqLZYeWepq8tx9ZrV1LpRXeEC/w/1i5gyms0tOvAXZcViPeexqW0BrpLUMBBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXlVs/7y; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXlVs/7y"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22409077c06so21099105ad.1
        for <regressions@lists.linux.dev>; Thu, 20 Mar 2025 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742480512; x=1743085312; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuntvFFwYkgUpcM/9nWOVbv7/IiYbYMm3ul7xyRax3Y=;
        b=BXlVs/7yoNQ/AW9lELw5YG6+/8RQVhIiZkFuvAYJYVtJOzaGWIYOvlWQpNC3NUyT1s
         5a3dc6KUl7X0cp02OMNtdzC0WOts0PlTJueUvSgPTZAUZevRkuq1QD4Izc5k6wI47wp2
         SttLYvLam26OatxhwVGfq5mEwVnjuPG0qY31ZNFdaETC6A08IzIn7uG6JrUg9vSJS7sp
         Y/pXVpsZYEY+ZqHZMpqWFbggdAn5FT2wtxqKgOQKQVFLtklzeHZziqIeVuIp2dra5Xqp
         rswSR87gis0HLdpYoB6P6ACguxmP4coB5gXCu15CIzPxpYp9SMNDySnpTM8Qd/I41CtF
         zr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742480512; x=1743085312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zuntvFFwYkgUpcM/9nWOVbv7/IiYbYMm3ul7xyRax3Y=;
        b=IDFx+UmEYuos2HA9JK0rmPVwc/rJyl1CW6R2giMXqsEmUYpIO1jwxVQSxHLQd3XtVL
         MNo0KNcW/xTcfYmp6ga7H8CHsn81ZIbtuH9rlzKhWHWsPhVVxpdeFR3C+phtMFw/9pGC
         8P6m9uH8pJ203tGbGqdnCT8iQN1t/ZsJH9xycoCqyDuSywGEFYTCOWwbcoiMNBFB/VIZ
         K8mzEJvzHajaGPulM8obF04HYIKAmcknN4V6nTisgBnKskw26jpYT04m7Y7+88sEsmcb
         S8+NNAiTEuIohaildeD3xpGK8wyT0NjPIoKJEkmL3RAE95wUVyz7D5+8wVBR8g9Sibir
         jEIg==
X-Forwarded-Encrypted: i=1; AJvYcCUubSOCQjrBDiKFblM/a5BLyu7vGILrBGh3azZpaHRHP6D6zv2m0KoO6HXLSbfnF/OIzddbw4NIwNSn+A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2lSv167Xz+uG47ySzbb5DLczcWZkVvOFbYue3pqIPsbhiRXV4
	PInQQ0j35Pw2DxgW9zviUKS2P3Ty3deEN1AcZLwHGwcFjRjCZgjSBK5PyovKzxF+hmeYBWZBwT9
	+4+fHX70Va13JNwJ8OYDHki37aAo=
X-Gm-Gg: ASbGnct0QGIc31ViX8kMLyxcYJmCTvlp5MRr3QdTyEGxkbPqA6TX24gvB/Efrcl0Hpj
	KjmAndL1c0/V9pMx62lxNdqMpekz60mWHz/jb99fKEHE0Li6Am0wEpPTe/i5wC1G67XUFjso1Ee
	6OjWu15Ermj7319drLaBJxHHGD
X-Google-Smtp-Source: AGHT+IEmYnUjCOXTNebABlXp5ns/0/fK6wHTVWN79SrrFblEXcoUnIgnSXUvB8rlNMcc/HVHPlN1hjo8fPoqtb++oe0=
X-Received: by 2002:a17:902:f711:b0:223:28a8:6101 with SMTP id
 d9443c01a7336-2265ee1ce6amr66594665ad.29.1742480511710; Thu, 20 Mar 2025
 07:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG8fp8S92hXFxMKQtMBkGqk1sWGu7pdHYDowsYbmurt0BGjfww@mail.gmail.com>
 <20250314084818.2826-1-akihiro.suda.cz@hco.ntt.co.jp> <Z9s5lam2QzWCOOKi@gmail.com>
In-Reply-To: <Z9s5lam2QzWCOOKi@gmail.com>
From: Akihiro Suda <suda.kyoto@gmail.com>
Date: Thu, 20 Mar 2025 23:21:40 +0900
X-Gm-Features: AQ5f1JoCemEwjjJ1t8QAlfRbPd3hmNLLAzSmBA2xrOQAsbuzCMbLQ9EipLAQ1bc
Message-ID: <CAG8fp8RgxFz2pwv3BXJ=dMWxoLSKjBL8PN0N8kWqkDOCB2_ivg@mail.gmail.com>
Subject: Re: [PATCH] x86/pkeys: Disable PKU when XFEATURE_PKRU is missing
To: Ingo Molnar <mingo@kernel.org>
Cc: Akihiro Suda <suda.gitsendemail@gmail.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, stable@vger.kernel.org, regressions@lists.linux.dev, 
	aruna.ramakrishna@oracle.com, tglx@linutronix.de, 
	Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Ingo, but we may have to reconsider whether cpu_has_xfeatures
works in this place
https://lore.kernel.org/all/1b8745e0-ae80-4add-b015-affdaa69b369@intel.com/

The current code might be accidentally disabling PKU on other
PKU-compatible environments?

2025=E5=B9=B43=E6=9C=8820=E6=97=A5(=E6=9C=A8) 6:39 Ingo Molnar <mingo@kerne=
l.org>:
>
>
> * Akihiro Suda <suda.gitsendemail@gmail.com> wrote:
>
> > Even when X86_FEATURE_PKU and X86_FEATURE_OSPKE are available,
> > XFEATURE_PKRU can be missing.
> > In such a case, pkeys has to be disabled to avoid hanging up.
> >
> >   WARNING: CPU: 0 PID: 1 at arch/x86/kernel/fpu/xstate.c:1003 get_xsave=
_addr_user+0x28/0x40
> >   (...)
> >   Call Trace:
> >    <TASK>
> >    ? get_xsave_addr_user+0x28/0x40
> >    ? __warn.cold+0x8e/0xea
> >    ? get_xsave_addr_user+0x28/0x40
> >    ? report_bug+0xff/0x140
> >    ? handle_bug+0x3b/0x70
> >    ? exc_invalid_op+0x17/0x70
> >    ? asm_exc_invalid_op+0x1a/0x20
> >    ? get_xsave_addr_user+0x28/0x40
> >    copy_fpstate_to_sigframe+0x1be/0x380
> >    ? __put_user_8+0x11/0x20
> >    get_sigframe+0xf1/0x280
> >    x64_setup_rt_frame+0x67/0x2c0
> >    arch_do_signal_or_restart+0x1b3/0x240
> >    syscall_exit_to_user_mode+0xb0/0x130
> >    do_syscall_64+0xab/0x1a0
> >    entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > This fix is known to be needed on Apple Virtualization.
> > Tested with macOS 13.5.2 running on MacBook Pro 2020 with
> > Intel(R) Core(TM) i7-1068NG7 CPU @ 2.30GHz.
> >
> > Fixes: 70044df250d0 ("x86/pkeys: Update PKRU to enable all pkeys before=
 XSAVE")
> > Link: https://lore.kernel.org/regressions/CAG8fp8QvH71Wi_y7b7tgFp7knK38=
rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com/T/#u
> > Link: https://github.com/lima-vm/lima/issues/3334
> >
> > Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
> > ---
> >  arch/x86/kernel/cpu/common.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.=
c
> > index e9464fe411ac..4c2c268af214 100644
> > --- a/arch/x86/kernel/cpu/common.c
> > +++ b/arch/x86/kernel/cpu/common.c
> > @@ -517,7 +517,8 @@ static bool pku_disabled;
> >  static __always_inline void setup_pku(struct cpuinfo_x86 *c)
> >  {
> >       if (c =3D=3D &boot_cpu_data) {
> > -             if (pku_disabled || !cpu_feature_enabled(X86_FEATURE_PKU)=
)
> > +             if (pku_disabled || !cpu_feature_enabled(X86_FEATURE_PKU)=
 ||
> > +                 !cpu_has_xfeatures(XFEATURE_PKRU, NULL))
> >                       return;
>
> Note that silent quirks are counterproductive, as they don't give VM
> vendors any incentives to fix their VM for such bugs.
>
> So I changed your quirk to be:
>
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -519,6 +519,17 @@ static __always_inline void setup_pku(struct cpuinfo=
_x86 *c)
>         if (c =3D=3D &boot_cpu_data) {
>                 if (pku_disabled || !cpu_feature_enabled(X86_FEATURE_PKU)=
)
>                         return;
> +               if (!cpu_has_xfeatures(XFEATURE_PKRU, NULL)) {
> +                       /*
> +                        * Missing XFEATURE_PKRU is not really a valid CP=
U
> +                        * configuration at this point, but apparently
> +                        * Apple Virtualization is affected by this,
> +                        * so return with a FW warning instead of crashin=
g
> +                        * the bootup:
> +                        */
> +                       WARN_ONCE(1, FW_BUG "Invalid XFEATURE_PKRU config=
uration.\n");
> +                       return;
> +               }
>                 /*
>                  * Setting CR4.PKE will cause the X86_FEATURE_OSPKE cpuid
>                  * bit to be set.  Enforce it.
>
> This is noisy in the syslog, but it's a WARN_ONCE() and it doesn't
> crash the bootup.
>
> Thanks,
>
>         Ingo
