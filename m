Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3771637CD2C
	for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 19:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781639936; cv=none; b=ksMtigrttIH1CaJB/ODRaJavCkM+2Xd5TzceJSaJzx+0c6NczneCieB8Sf1sT5y9KyrMOVPOPu20cv5WXNw4RUA3bs2JB8m136iAeivuoRDEl2LaJitpfqVQQ9LuVqLJj7aAV5sbZef5bX0wHjjboqG3PFIBZK6CkuKcz42KK6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781639936; c=relaxed/simple;
	bh=BBO/04v2BmM6b235NKbqhyJ0da2WEH+508y8Lf0vfuI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kP8aT+z0GJie4/bE8I6f72LzKl/6bJWcfUqgETWDIpkOvqtxM4ILn6u75AjC2vj/Z0pzozF997aw74q3igztDZTonzL8p4XPJtSrQ5+38slOnJiLMweRUQjFMIXmHggV9EjCzfuGqyM9XWmUg8KblTfgLxjxaxaPlwl61s+EtCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6hyry4g; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6hyry4g"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-46013161068so2513745f8f.2
        for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 12:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781639933; x=1782244733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXZOSYUXeUZ9EP20mMZdKUAZCycX6LDoycPd1XgDjzY=;
        b=P6hyry4gJcFe39wc4XqWUN1QLTDeYe+yTOSyXVlBlGTYxL6Nxavuh/B7DTaHenh52R
         jjoxYK9uZWRRub04mVYuXnuOaX/h4bXU65W2J4F6w5VwQVf8lfY4Mv0IoQSA6QT1zr+4
         YdwGHjidq8S8heXfpw/ea/Plv4xYn6iKJgoze15D+kXzrPmfgZDWZKYMrSMZXOuBzRxj
         g67OlhXum6Vr+fwho5gFtxuJbEV31iOCRV7HANxPZiO6Ed3cN3VKcEsmbfZDqqh3Ss0y
         iFT6nUQUUP4urw6MQVAg+kaPegqZIQlAhK0xO/Ax3ue6yNwrFxbXau9BnA0maXQogud7
         ZocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781639933; x=1782244733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aXZOSYUXeUZ9EP20mMZdKUAZCycX6LDoycPd1XgDjzY=;
        b=pzbA6ZWa8Bt4DEWnwztK097zoOc+RUJi1fQF5zIl+II9XmwvsfHGVMM6GHBOmjxwna
         Hczo8Fxxk5L6U9bUAS8wkF5xcj20X+L2/Z0IZOJVxqduWySUN+zigVlJ884kkGC/Ducm
         0gLRmlga2JjwB+yBH/z+NaxOiYvlUztng3h1pZX0BoqjzV/RPNV3NgDYSGqkm243Zj2q
         lDuQOszAW2erQnAp3e2QZ048JRfk+XyejFEe72EvGF7XTMD8JKl5ZSbr5YKA9En3AU1A
         eM9rJ0QlqyJTCEa3QHSvOM6YBDOa0YPFsSTCH1MRVTeRn1bdC+76RXDbZKMmcLlB6WX/
         iJLg==
X-Forwarded-Encrypted: i=1; AFNElJ8+8SomVHYO4ftE1L7B5n/997Nwd7pcSJODJIH3N7CSM7e7XelN0Vy3rRO+43HUGTr9DuWkp5CBmwV3gQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHXXZ3X9Prd1AtZk6Ch7wj0YWv8Ptf36C557FHHWcbSuPcLq6e
	tf41MM8wsV6Dfq7LweNhMBQdGqSDM4IbxoxvqafNNNQKfgAcuqWJf9JD
X-Gm-Gg: Acq92OE6ZjRgg8HqbChEC6Q9t9wgCcAOFI06Iv9XKdEIr3R6MOvFEhYGXf3lc424qyC
	XjwZb+sl6a+7SpdRWx9UaaGh6XiKjk89y7K1YSLD+vDzijQOgnskblCMeTNqWMyXRbJdqs4d1Mt
	GhQPbO3qmRLE0QUBp9Ebs+LkhcIW5kPuL/LjPqQN3Hq3oRAKvYjXFgdGVFhp1RjDFdv8l5i+AD4
	MBxFamHPbTSn6ixLSgis9pUGeNF95NM8ygcjcrBNNze7CH+ge0RhU+15pJr+PnZBR8jGXZmUCBb
	hi1P/yjCFd3r3NrA9f1VLIGygnb8fGoBB/K1gc75To67iigIogeBnICT0/fpShDH6NXrQxJJYyY
	bsnWuCA4A0K5SObxTXo0odOFZhRel1xqeUS34ksB0AwYNQKPdQIY4i2LhPvDm2kDAiRfQ7c5ZWa
	aRBPcw9nGj5kezH4DoazkuAp8eAGZUBRZco521kVxUV4Y2ThVCkn+xPLtb9kTd
X-Received: by 2002:a05:6000:25c2:b0:44d:1338:46b4 with SMTP id ffacd0b85a97d-46235e98c8bmr1642582f8f.9.1781639933566;
        Tue, 16 Jun 2026 12:58:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f4f6sm50956932f8f.16.2026.06.16.12.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:58:52 -0700 (PDT)
Date: Tue, 16 Jun 2026 20:58:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Andreas Larsson <andreas.larsson@gaisler.com>
Cc: Tony Rodriguez <unixpro1970@gmail.com>, davem@davemloft.net,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 andreas@gaisler.com, thuth@redhat.com, regressions@lists.linux.dev,
 glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH 1/1] sparc64: unify thread stack sizing and add explicit
 32KB stack
Message-ID: <20260616205851.428ca70c@pumpkin>
In-Reply-To: <03111ac5-0055-425f-a7f2-54d4f2bb4988@gaisler.com>
References: <20260519075809.8993-1-unixpro1970@gmail.com>
	<20260519075809.8993-2-unixpro1970@gmail.com>
	<03111ac5-0055-425f-a7f2-54d4f2bb4988@gaisler.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Jun 2026 16:18:33 +0200
Andreas Larsson <andreas.larsson@gaisler.com> wrote:

> On 2026-05-19 09:57, Tony Rodriguez wrote:
> > This patch restructures the thread=E2=80=91stack sizing logic into a si=
ngle
> > if / elif / else chain and introduces an explicit 32KB kernel stack
> > for SPARC64. The previous implementation relied on nested conditionals
> > and PAGE_SHIFT=E2=80=91dependent behavior, which produced 8KB or 16KB s=
tacks
> > depending on configuration. SPARC64 requires a larger,
> > architecture=E2=80=91specific stack due to its trapframe size, register=
=E2=80=91window
> > behavior, and deeper call paths.
> >=20
> > A reproducible failure case occurs when usbcore is enabled: USB hub
> > enumeration (usb_new_device(), hub_port_connect(), PM/QoS helpers)
> > allocates large on=E2=80=91stack structures and recurses through several
> > layers of device=E2=80=91model code. Combined with SPARC64=E2=80=99s tr=
apframe and
> > register=E2=80=91window overhead, this reliably exhausts a 16KB stack a=
nd
> > results in early=E2=80=91boot panics.  A 32KB stack eliminates these fa=
ilures.
> >=20
> > The new logic is:
> >     SPARC64:
> >         THREAD_SIZE =3D 4 * PAGE_SIZE (32KB)
> >         THREAD_SHIFT =3D PAGE_SHIFT + 2 (log=E2=82=82(32KB))
> >         THREAD_SIZE_ORDER =3D 2 (4 contiguous pages) =20
>=20
> Yes
>=20
> >     Non=E2=80=91SPARC64 with PAGE_SHIFT =3D=3D 13:
> >         Retains the existing 16KB stack behavior
> >     Fallback:
> >         Retains the existing 8KB stack behavior =20
>=20
> No, not to my understanding, see comments below.
>=20
> >=20
> > Signed-off-by: Tony Rodriguez <unixpro1970@gmail.com>
> > ---
> >  arch/sparc/include/asm/thread_info_64.h | 28 ++++++++++++-------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/arch/sparc/include/asm/thread_info_64.h b/arch/sparc/inclu=
de/asm/thread_info_64.h
> > index c8a73dff27f8..6b12a2b66385 100644
> > --- a/arch/sparc/include/asm/thread_info_64.h
> > +++ b/arch/sparc/include/asm/thread_info_64.h
> > @@ -99,13 +99,20 @@ struct thread_info {
> >  #define FAULT_CODE_BLKCOMMIT	0x10	/* Use blk-commit ASI in copy_page */
> >  #define	FAULT_CODE_BAD_RA	0x20	/* Bad RA for sun4v		   */
> >=20
> > -#if PAGE_SHIFT =3D=3D 13
> > -#define THREAD_SIZE (2*PAGE_SIZE)
> > -#define THREAD_SHIFT (PAGE_SHIFT + 1)
> > -#else /* PAGE_SHIFT =3D=3D 13 */
> > -#define THREAD_SIZE PAGE_SIZE
> > -#define THREAD_SHIFT PAGE_SHIFT
> > -#endif /* PAGE_SHIFT =3D=3D 13 */
> > +/* thread information allocation */
> > +#ifdef CONFIG_SPARC64
> > +	#define THREAD_SIZE (4 * PAGE_SIZE)
> > +	#define THREAD_SHIFT (PAGE_SHIFT + 2)
> > +	#define THREAD_SIZE_ORDER 2 =20
>=20
> As far as I can see, given that this header is included by
>=20
> #if defined(__sparc__) && defined(__arch64__)
> #include <asm/thread_info_64.h>
> #else
> #include <asm/thread_info_32.h>
> #endif
>=20
> the code above is the only code that will ever be compiled, while leaving=
...
>=20
> > +#elif PAGE_SHIFT =3D=3D 13
> > +	#define THREAD_SIZE (2 * PAGE_SIZE)
> > +	#define THREAD_SHIFT (PAGE_SHIFT + 1)
> > +	#define THREAD_SIZE_ORDER 1
> > +#else
> > +	#define THREAD_SIZE PAGE_SIZE
> > +	#define THREAD_SHIFT PAGE_SHIFT
> > +	#define THREAD_SIZE_ORDER 0
> > +#endif =20
>=20
> ...this code dead, where the else branch code already was dead (but then
> in two separate else braches).
>=20
> I'd rather see the else branch here and the else branch below cleaned up
> by a separate patch with a fixup tag for commit 15b9350a177b ("sparc64:
> Only support 4MB huge pages and 8KB base pages.") that as far as I can
> see should have removed the else branch. The else branches was to use
> only one page when the page size was _larger_ than 8 KiB when that was
> an option.

That whole logic is impenetrable.
Why not set the 'desired thread size' in kB, then work out how many
pages that ends up being based on the page size, and finally get the actual
stack size.
I'm not sure, but with vmalloc()ed stacks and 8k pages can't you have 24kB?

	David


>=20
> >=20
> >  /*
> >   * macros/functions for gaining access to the thread information struc=
ture
> > @@ -127,13 +134,6 @@ register struct thread_info *current_thread_info_r=
eg asm("g6");
> >  extern struct thread_info *current_thread_info(void);
> >  #endif
> >=20
> > -/* thread information allocation */
> > -#if PAGE_SHIFT =3D=3D 13
> > -#define THREAD_SIZE_ORDER	1
> > -#else /* PAGE_SHIFT =3D=3D 13 */
> > -#define THREAD_SIZE_ORDER	0
> > -#endif /* PAGE_SHIFT =3D=3D 13 */
> > -
> >  #define __thread_flag_byte_ptr(ti)	\
> >  	((unsigned char *)(&((ti)->flags)))
> >  #define __cur_thread_flag_byte_ptr	__thread_flag_byte_ptr(current_thre=
ad_info())
> > --
> > 2.53.0
> >  =20
>=20
> Apart from the above I agree with David Laight that more investigation
> of the situation that leads to this problem would be good. Granted,
> sparc and sparc64 in particular is a bit special with its stack frames,
> but among other arches it seems to be uncommon with 32 KiB of thread
> stack unless KASAN is enabled.
>=20
> Cheers,
> Andreas
>=20

