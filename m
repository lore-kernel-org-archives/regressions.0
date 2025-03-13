Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B51A08AF
	for <regressions@lists.linux.dev>; Fri, 14 Mar 2025 00:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741910404; cv=none; b=p/sXpDpnFOsLEGswOV0z6VBYpQzPRj+xxV7gCvM2rGWPFeC55G0Sq+25Trcx3/tAdGkNAk0bI1CYiMKvHTC99wTVCKAnQmDBnIkTUJUi9/rVUbtO0KfSB+BU7jaZ7BA3fR4Yid793/2P5y4FEpYFhjs0xOgkFMysw9OVJ1e7Cpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741910404; c=relaxed/simple;
	bh=NYecN2d5FW84CUvbmtTU6zDtzpvTz/dA+S6eEZGrB7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TQFTX64hpFyodN3SVxq+PDX3Fm1pj2kfWTzDqvJ2B58XolNJsPgI29doz6D+TE13oO8wgch6zjhcb2b92jKoRcIEqO6lpYBE2WgvHRv88QQfOXEt8i3oLLrZ6agTlAnlsLRCNBTdmefi/rLjLeAPJFmoEYN2TlY+ZS4xF6gKH0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h89Soj+t; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h89Soj+t"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so3434520a91.3
        for <regressions@lists.linux.dev>; Thu, 13 Mar 2025 17:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741910401; x=1742515201; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wjE6f9jbNOkbcqnjaYOGa0DQ5kN4r+7bIti2jCK9d4=;
        b=h89Soj+tB79Mr7Q6FGNz/7KqptD3GEhP9pjDm47JQRoWO4UX0GYe5Ossjt953Z9lIV
         N++/uRSXHu2gOpO6ehS0NIePjqcZAI68CaaicZEJ2ayxRLs+hhVjwaQgsbtsmy8nmJLx
         T51kxzyYJzdCAP1135Vojp+pu9xIuGZG8BNfjk/F4o9/wxO8Ax8LV78PhcA0j5gxDTZT
         uur/flUV96TJ75LFrmrMwVnVvBCoMLWF3z7szfVroFdEctFDCFyXmZDk3UKP0H7wQXmo
         Bbyyvx5zYEY5IHBMRLehBBPUzkK1q5t1rpIeciFMn6a93jZJLInRE9MmJqMsGP3U6H8Y
         awOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741910401; x=1742515201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wjE6f9jbNOkbcqnjaYOGa0DQ5kN4r+7bIti2jCK9d4=;
        b=tZ9uRmlus8rqVaKHFXwReg34H+w8tbTExX8Rreu8zrUDX1NJgVymLdfgUw2lRodIw7
         91K1Xmj5w0LQMa/RaUcSBOW9NwQJgr5M+/wlrPXhRoX4OrbCpJYnNeDK6s2twNgEIu4w
         hYXNdFli79MxF8lyVqP0/Sl77Ko98KdF7seDBwGQd7N+5BSiWqj1iYJB8kKXr+Pmz2Ti
         I4pMzWzINg+toTeBasHdjMDxIM6g4H8TZ+0FxP2CCaj6cehKeLwYnZAcV163IsWxxEFs
         eHktiwZDwEXfdjhRaf6QO85qrvY7OjNtt30eCMG6bizRvkpQVRqtKtl66QeofR/dix5U
         6m7g==
X-Forwarded-Encrypted: i=1; AJvYcCU59KpC0YBhdHff8AwNwmaZJ0WzxuWwk8d2dhhNVUFgIakafGBKMtmbr5zgEnPavYvBvASEG60WaFObYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnlQJ5W7a+MrUNkY+qBNf/JKhBNLsYjH1U8FobuPBoFbOmlfi9
	+lKgEKCrQ+Tw2r9HJ3Y2ExMptvF3UsArHPQ47NVN1kB9hqU+VP6xFadUH2U13GXr63qMCHja6z1
	wzzh3i505x+GEd58pN8NJNHXkTb0=
X-Gm-Gg: ASbGnctVCX6zvTDgmTIVM+4c+S4EhGm3UzcdNJf6EtvNEgoy3SUmdidzlYS6ZnqpCkQ
	OCPzQxSH1nMox5c0oCoQcw5x20LySe7j8ujl6Va10IynOfanD5Qy4N9MtMjMkkIE/a9sbce95F+
	JYhmNtY6N3fp/+AAPa45G8F1FH
X-Google-Smtp-Source: AGHT+IEHkMskZfm5WUkKtYAViNZ8nMkrivbEqLkd9kTor8r6fGxxbprbYeRfyximuVn0fue9V+9v67zGOYeX+rqtClc=
X-Received: by 2002:a17:90b:3d85:b0:2fe:a79e:f56f with SMTP id
 98e67ed59e1d1-30151ca0b77mr546513a91.13.1741910401281; Thu, 13 Mar 2025
 17:00:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG8fp8Qdmt9vLk=8ORccY5B+ec1huhazXG4PBaNyLEkq31HDjw@mail.gmail.com>
 <20250312100926.34954-1-akihiro.suda.cz@hco.ntt.co.jp> <Z9MPmA-myNZxcc-E@gmail.com>
In-Reply-To: <Z9MPmA-myNZxcc-E@gmail.com>
From: Akihiro Suda <suda.kyoto@gmail.com>
Date: Fri, 14 Mar 2025 08:59:49 +0900
X-Gm-Features: AQ5f1JoZyeOCRp5_8DpQtv90_RPgHEmesRvIxoyfNUozBXTXt9IsmaD09aaUU04
Message-ID: <CAG8fp8Tjt2utmE79DfkETE96DnnwtvzHqEXmuYDi4O4azWQRLw@mail.gmail.com>
Subject: Re: [PATCH v2] x86: disable PKU when running on Apple Virtualization
To: Ingo Molnar <mingo@kernel.org>
Cc: Akihiro Suda <suda.gitsendemail@gmail.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, regressions@lists.linux.dev, aruna.ramakrishna@oracle.com, 
	tglx@linutronix.de, Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Ingo, and sorry for adding #ifdef CONFIG_ACPI

Regards,
Akihiro Suda

2025=E5=B9=B43=E6=9C=8814=E6=97=A5(=E9=87=91) 2:02 Ingo Molnar <mingo@kerne=
l.org>:
>
>
> * Akihiro Suda <suda.gitsendemail@gmail.com> wrote:
>
> > OSPKE seems broken on Apple Virtualization.
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
> > Tested on macOS 13.5.1 running on MacBook Pro 2020 with
> > Intel(R) Core(TM) i7-1068NG7 CPU @ 2.30GHz.
> >
> > Fixes: 70044df250d0 ("x86/pkeys: Update PKRU to enable all pkeys before=
 XSAVE")
> > Link: https://lore.kernel.org/regressions/CAG8fp8QvH71Wi_y7b7tgFp7knK38=
rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com/T/#u
> > Link: https://github.com/lima-vm/lima/issues/3334
> > Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
> > ---
> > v2: check oem_table_id rather than oem_id for better robustness
>
> So this is rather weird, but I've applied the quirk as it upgrades
> broken guest side code into a boot time warning.
>
> > +     /*
> > +      * OSPKE seems broken on Apple Virtualization.
> > +      * https://lore.kernel.org/regressions/CAG8fp8QvH71Wi_y7b7tgFp7kn=
K38rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com/T/#u
> > +      *
> > +      * TODO: conditionally enable pku depending on the DMI BIOS versi=
on when Apple
> > +      * fixes the issue.
> > +      *
> > +      * However, this would be still not enough because DMI is missing=
 when vmlinuz
> > +      * is directly loaded into VM.
> > +      */
> > +     if (!memcmp(acpi_gbl_FADT.header.oem_table_id, "Apple Vz", 8)) {
> > +             pr_info("pku: disabled on Apple Virtualization platform (=
Intel) due to a bug\n");
> > +             pku_disabled =3D true;
> > +     }
>
> Note that I updated the comments here (the git log gives enough
> information), plus enclosed this into #ifdef CONFIG_ACPI, as
> acpi_gbl_FADT is not available on !CONFIG_ACPI builds.
>
> Thanks,
>
>         Ingo
