Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B830844C65
	for <regressions@lists.linux.dev>; Mon,  5 Feb 2024 17:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707152851; cv=none; b=BIPZLPO8cmWcCdrFdd5lUpHkTW9wVXbLkKaQhZyx9vQGH5pDDh+wrIRFYlGaaQuVqUC2WlilrIiPA75NouyrXtpDVWgO9CmNtOHo0ET/kUelKXW/IJugA7TC2WRacmcuPIm3VBJTp0Zq9GUSE4cYsT50jw8CgjO2TSxpHqHXUTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707152851; c=relaxed/simple;
	bh=2Q1i1RHrUxU6byBUfds2Q8JCnwTEHlAU9LNt9f1skVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJE3JALaZXWzH9Vtr96Didry99oKeM/5Ed37F3dvriPqfn90vsiOjOcLG4yw4EL/8Q3M9TO9r/qBBoV9b/Jvi2SqIKDhAmF0CjJ5Qyb+0tLOHmLSrsiWYcACxNzM6Qcjz8ik/Ev4KMe1IktDed0Sf+CipGbb3LKkG0XJCd1k+DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZyZSUXoh; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZyZSUXoh"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5ce2aada130so4296453a12.1
        for <regressions@lists.linux.dev>; Mon, 05 Feb 2024 09:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707152849; x=1707757649; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88D1RK/nOy77l4ZbsApJZs4VjFYfeQsWMWLEgTtNVGA=;
        b=ZyZSUXohLUafg3JQ8Zlbl6R/VqEfs3qKrmNolBzlqzmiCfbZbZ1DHuzThKGKWPS+Np
         KE6G9urgP+wzZEXaqwkWV6lFdVproJ5YBwlhjH49gLsIKdvLqgjUpkKTn9Bce26SKHAH
         drtsLZ5u1vmf/sH8gTE3M/t8M8z6mN42Uq4hw2T/8DJsnggHnmvXdX1+BTk1+g43uhIy
         T/FXyHMxILYLJyHU8R293JdsBA3lfzhe+kk9VBDIyg6Mr/1Zt3wWBVbzVcHsXxg5/i4A
         BK1r7I5XSBaflfdPbElcKdHU/HCQFU/V6I/ZdWczv2eR1BJy8eqidx0zsmcIpD0wlT7m
         PPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707152849; x=1707757649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88D1RK/nOy77l4ZbsApJZs4VjFYfeQsWMWLEgTtNVGA=;
        b=A4VMO3y/2lx+3EQAuxGLh4EhMNi382w7VgRGIjnNOGfEG5N+AyJCKPClf7Mf4BliHy
         qj+vzsGNP9RWneXxTnU/lxnrCr5scylbqNIldUoK6JQcng0EE3pAW+5c4n+kldpuyAID
         Qvsw0dL2GrixY7RVLapq9lg23Ymr0e1eBJwzgG95pYHaBT3kkT8v8l+vFn34PZwT22vj
         PMqnQI7mLk69NjreeMq/wHFyTyZ7xijgF1eo9SSsascvknIpfh2ZTFkuCYJgmJIgre78
         xn401o5V9DboCdycVerOAyWTzZoXoH5MQq2sm3xvw1VDcT0CiQ2wYT1CmI9urcc8Mb9y
         5Bhg==
X-Gm-Message-State: AOJu0Yxt8LUAB4PG06eQh7IU4+TrTTWbxPi1Nky1YSebnSRuGp0GCCLy
	JXFfZG1t/UTFjGU6YTLJ/8+yPI+LC/+WguSLF+Jr4o0WLr/2Z9TM30MXiARGxhbgIWZQXbHa7kj
	ns6i/9yUcdtL6hDLVO79U1lG9sqQ=
X-Google-Smtp-Source: AGHT+IG3d9Ex5sF4UKpwysbNM/TqGT2KKEe4K6rs/cP9WQWpfDJTFBMSBnqfKweEDscuLgchA+SD2nBAFH0HEM4EPng=
X-Received: by 2002:a05:6a20:7291:b0:19a:1cff:f574 with SMTP id
 o17-20020a056a20729100b0019a1cfff574mr141172pzk.36.1707152848960; Mon, 05 Feb
 2024 09:07:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240118133504.2910955-1-shy828301@gmail.com> <ad920491-9d73-4512-8996-badace520699@leemhuis.info>
In-Reply-To: <ad920491-9d73-4512-8996-badace520699@leemhuis.info>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 5 Feb 2024 09:07:16 -0800
Message-ID: <CAHbLzkp7s1CcSE0rc-CpfcCrNtMdepAA5-K+0P4wz11x4SK6=g@mail.gmail.com>
Subject: Re: [PATCH] mm: huge_memory: don't force huge page alignment on 32 bit
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: jirislaby@kernel.org, surenb@google.com, riel@surriel.com, 
	willy@infradead.org, cl@linux.com, akpm@linux-foundation.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>, yang@os.amperecomputing.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 3, 2024 at 1:24=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 18.01.24 14:35, Yang Shi wrote:
> > From: Yang Shi <yang@os.amperecomputing.com>
> >
> > The commit efa7df3e3bb5 ("mm: align larger anonymous mappings on THP
> > boundaries") caused two issues [1] [2] reported on 32 bit system or com=
pat
> > userspace.
> >
> > It doesn't make too much sense to force huge page alignment on 32 bit
> > system due to the constrained virtual address space.
> >
> > [1] https://lore.kernel.org/linux-mm/CAHbLzkqa1SCBA10yjWTtA2mKCsoK5+M1B=
thSDL8ROvUq2XxZMw@mail.gmail.com/T/#mf211643a0427f8d6495b5b53f8132f453d60ab=
95
> > [2] https://lore.kernel.org/linux-mm/CAHbLzkqa1SCBA10yjWTtA2mKCsoK5+M1B=
thSDL8ROvUq2XxZMw@mail.gmail.com/T/#me93dff2ccbd9902c3e395e1c022fb454e48ecb=
1d
>
> [FWIW, this is now 4ef9ad19e17676 ("mm: huge_memory: don't force huge
> page alignment on 32 bit") in mainline]
>
> Quick question: it it okay to ask Greg to pick this up for linux-6.7.y
> series?

Yes, definitely. Thanks for following up.

Yang

>
> I'm wondering because Jiri's report ([1] in above quote) sounded like
> this is something that will affect and annoy quite a few people with the
> linux-6.7.y.
>
> Ciao, Thorsten
>
> > Fixes: efa7df3e3bb5 ("mm: align larger anonymous mappings on THP bounda=
ries")
> > Reported-by: Jiri Slaby <jirislaby@kernel.org>
> > Reported-by: Suren Baghdasaryan <surenb@google.com>
> > Tested-by: Jiri Slaby <jirislaby@kernel.org>
> > Tested-by: Suren Baghdasaryan <surenb@google.com>
> > Cc: Rik van Riel <riel@surriel.com>
> > Cc: Matthew Wilcox <willy@infradead.org>
> > Cc: Christopher Lameter <cl@linux.com>
> > Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> > ---
> >  mm/huge_memory.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 94ef5c02b459..e9fbaccbe0c0 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -37,6 +37,7 @@
> >  #include <linux/page_owner.h>
> >  #include <linux/sched/sysctl.h>
> >  #include <linux/memory-tiers.h>
> > +#include <linux/compat.h>
> >
> >  #include <asm/tlb.h>
> >  #include <asm/pgalloc.h>
> > @@ -811,6 +812,14 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
> >       loff_t off_align =3D round_up(off, size);
> >       unsigned long len_pad, ret;
> >
> > +     /*
> > +      * It doesn't make too much sense to froce huge page alignment on
> > +      * 32 bit system or compat userspace due to the contrained virtua=
l
> > +      * address space and address entropy.
> > +      */
> > +     if (IS_ENABLED(CONFIG_32BIT) || in_compat_syscall())
> > +             return 0;
> > +
> >       if (off_end <=3D off_align || (off_end - off_align) < size)
> >               return 0;
> >
