Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0B53DDDAC
	for <regressions@lists.linux.dev>; Thu, 18 Jun 2026 08:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773069; cv=none; b=QAfRHrktxyZc1YCyc86PdVk7CM4xVxtFx1Y7wbbdJbbl2haGUIRUvbAnA4OxiNTHWw0rORluB8+gt4afFUgGAqnS8LRilS4g1DqdizbyQDoFBjzUqxcs0L+bpqeDSOAEJ0LZA1oqLB54c2QBuDHwUhsDEXybOusT9Tj89sem//E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773069; c=relaxed/simple;
	bh=eAUjlau1EAZVahWYq/WgumYGsddfbLKb5QwOQMvKCSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PkSoK5d34uE/2gGJOAFUK/WaR7FRGZWbSF66ZwK2n9Bysf69QtKO6qezTsb8x6z9veSvPUj7wa0rc5HT5Fjqk+n9mR91SmbytJOtONmO9VxEgV3fNkrWvt5//BuxrCqmfM6XM8RLPXczjW+1Y9jeml7J6GbueLfCwGB/IdrU4T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oWwIbsCN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oWwIbsCN"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eeea039ebso386883f8f.1
        for <regressions@lists.linux.dev>; Thu, 18 Jun 2026 01:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781773061; x=1782377861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zlx8fNrwPTM8LCb4ISwiLgS50BGt8ex2N3ipNfQcRgM=;
        b=oWwIbsCNX27m14LRZMzdWZTsJgG2M+zVavGdVTYMO9WXAFeHu8wqXB+la1iI/amPbB
         VeeUHeYrW9EnNOlYiuYqkTjGjejr8xNi+pKIFKPQJZrzfA8VD8GP33wf7+iQLv2smdgi
         AYDz/o9wWvt/QghrTYhdMbxCajOEl/vnwfbV+R2rp2G2D/fRjbxPpwxLZEspIVty+X6v
         VIosIWzuf4BOaTPNbiswgsQyl562+S+Bqykvc7fr1rJG3NWwjh/FHOZ84Y91Rxv8qCXG
         Ov74IAfMjNyCrrg7L/ZFQ3gxGBsYKJlql6qGxpWe3W4z3z3kQDpTJ40dQxVgnejxeEnz
         siCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773061; x=1782377861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zlx8fNrwPTM8LCb4ISwiLgS50BGt8ex2N3ipNfQcRgM=;
        b=M8qspecORnzS2KmUQbuMUmbbn66cQVslAW8j7QJM6E6U0zQqAnP0pIYd8y9oYeZV4l
         LuywDpLW7X8AvhcryIhDXVDniLHdhD0qJVL+L95xvAi6vPyDl8qCYowN1Vvq5VFAnYgo
         GjHGwAd5FukH5XN7+CqK9WmnpIu+t5YA9T33JpI0mLGSfCBkS+CJYz0s5PHMs7P9E+Yf
         OV3E9esAzORsBmqbfftrYB+fyZP7lQ1ewPFvpGsZVeFkdmDX7vHKtgNnQXy2XkCPCJc1
         IxCyUcaKKPhpE4AhsARweXwuH+UBVqvYw2vQFOxPaiIE6cZUR8RaCSKJ6gdkJXbLWqGf
         k5kA==
X-Forwarded-Encrypted: i=1; AFNElJ+kIHrqdKd+hELviewDkLNvDwAsL8NWolg8k7VtyGl6iLKOTucrb69RDY7K0zC8q+U8XahqMLDaaP6sFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw09dJrDo456qX3DlIpRMil2i5m6V5qUw9tjGHZNY/Ww6lvlPk2
	GlovZ2GI5jyN1byt4VPgxtVYukZhUyRU7i+MYi1mgsO65lmvhKuCYEID
X-Gm-Gg: AfdE7ckmOOSstoPWvWLaIq5/zoFzmIxGmZ2j95yedMBbgZY8oHoqaSNdbvyHIlYRSYA
	krjcKmiffyf3cc06HdvleixkZ9VMGGlgQz7Jde5Nwn3GczgpcIwU1gwJ0aKH/wp0M57/Ry4nclP
	mIFGrOpLM42bAt/nEBS7/4LeRBMsgnOAxl6rCZi4D2EEUE/BDJCIRAztxtjKaMVkGOEsDHbuEQn
	eXwSH4btwbyVN1a/39EPHpNwrvOTEh2LCB99zRyIfKEIYCy8u1I+BoAUCQ/qRt1ihPQN+C4EeQV
	KhBDAaSwLIyGj7vbeJRvGIjiatQDSTxJI781NYhRT8djIqwMdwhcbDETMnlSq7U32+51ddu4yEo
	OPdYZLYyrPzK0ap4Jn0rq3p5ylL3mPpPa29WC7X3L+o6NzDi3e4313GgsvWR8rPL3YH9m0XHBfG
	Jo/ayy5RlqLd2SFg11j5YSEZ+ux3mjsE6NIw4aj7wwYdPJIW3/1Q==
X-Received: by 2002:a05:6000:2287:b0:464:32d2:ecc5 with SMTP id ffacd0b85a97d-46432e232cdmr1810998f8f.7.1781773061255;
        Thu, 18 Jun 2026 01:57:41 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f3dcsm57623540f8f.13.2026.06.18.01.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 01:57:40 -0700 (PDT)
Date: Thu, 18 Jun 2026 09:57:39 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Tony Rodriguez <unixpro1970@gmail.com>
Cc: Andreas Larsson <andreas@gaisler.com>, Andreas Larsson
 <andreas.larsson@gaisler.com>, davem@davemloft.net,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, thuth@redhat.com,
 regressions@lists.linux.dev, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH 1/1] sparc64: unify thread stack sizing and add explicit
 32KB stack
Message-ID: <20260618095739.1c71c2ba@pumpkin>
In-Reply-To: <d58e1648-65b9-479e-97f4-1bbe4cf44799@gmail.com>
References: <20260519075809.8993-1-unixpro1970@gmail.com>
	<20260519075809.8993-2-unixpro1970@gmail.com>
	<03111ac5-0055-425f-a7f2-54d4f2bb4988@gaisler.com>
	<20260616205851.428ca70c@pumpkin>
	<d634e2f2-daf0-4328-bf16-7f5bff6fe851@gaisler.com>
	<d58e1648-65b9-479e-97f4-1bbe4cf44799@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Jun 2026 00:29:59 -0700
Tony Rodriguez <unixpro1970@gmail.com> wrote:

> On 6/17/26 10:53 PM, Andreas Larsson wrote:
> > On 2026-06-16 21:58, David Laight wrote: =20
> >> On Tue, 16 Jun 2026 16:18:33 +0200
> >> Andreas Larsson <andreas.larsson@gaisler.com> wrote:
> >> =20
> >>> On 2026-05-19 09:57, Tony Rodriguez wrote: =20
> >>>> This patch restructures the thread=E2=80=91stack sizing logic into a=
 single
> >>>> if / elif / else chain and introduces an explicit 32KB kernel stack
> >>>> for SPARC64. The previous implementation relied on nested conditiona=
ls
> >>>> and PAGE_SHIFT=E2=80=91dependent behavior, which produced 8KB or 16K=
B stacks
> >>>> depending on configuration. SPARC64 requires a larger,
> >>>> architecture=E2=80=91specific stack due to its trapframe size, regis=
ter=E2=80=91window
> >>>> behavior, and deeper call paths.
> >>>>
> >>>> A reproducible failure case occurs when usbcore is enabled: USB hub
> >>>> enumeration (usb_new_device(), hub_port_connect(), PM/QoS helpers)
> >>>> allocates large on=E2=80=91stack structures and recurses through sev=
eral
> >>>> layers of device=E2=80=91model code. Combined with SPARC64=E2=80=99s=
 trapframe and
> >>>> register=E2=80=91window overhead, this reliably exhausts a 16KB stac=
k and
> >>>> results in early=E2=80=91boot panics.  A 32KB stack eliminates these=
 failures.
> >>>>
> >>>> The new logic is:
> >>>>      SPARC64:
> >>>>          THREAD_SIZE =3D 4 * PAGE_SIZE (32KB)
> >>>>          THREAD_SHIFT =3D PAGE_SHIFT + 2 (log=E2=82=82(32KB))
> >>>>          THREAD_SIZE_ORDER =3D 2 (4 contiguous pages) =20
> >>> Yes
> >>> =20
> >>>>      Non=E2=80=91SPARC64 with PAGE_SHIFT =3D=3D 13:
> >>>>          Retains the existing 16KB stack behavior
> >>>>      Fallback:
> >>>>          Retains the existing 8KB stack behavior =20
> >>> No, not to my understanding, see comments below.
> >>> =20
> >>>> Signed-off-by: Tony Rodriguez <unixpro1970@gmail.com>
> >>>> ---
> >>>>   arch/sparc/include/asm/thread_info_64.h | 28 ++++++++++++---------=
----
> >>>>   1 file changed, 14 insertions(+), 14 deletions(-)
> >>>>
> >>>> diff --git a/arch/sparc/include/asm/thread_info_64.h b/arch/sparc/in=
clude/asm/thread_info_64.h
> >>>> index c8a73dff27f8..6b12a2b66385 100644
> >>>> --- a/arch/sparc/include/asm/thread_info_64.h
> >>>> +++ b/arch/sparc/include/asm/thread_info_64.h
> >>>> @@ -99,13 +99,20 @@ struct thread_info {
> >>>>   #define FAULT_CODE_BLKCOMMIT	0x10	/* Use blk-commit ASI in copy_pa=
ge */
> >>>>   #define	FAULT_CODE_BAD_RA	0x20	/* Bad RA for sun4v		   */
> >>>>
> >>>> -#if PAGE_SHIFT =3D=3D 13
> >>>> -#define THREAD_SIZE (2*PAGE_SIZE)
> >>>> -#define THREAD_SHIFT (PAGE_SHIFT + 1)
> >>>> -#else /* PAGE_SHIFT =3D=3D 13 */
> >>>> -#define THREAD_SIZE PAGE_SIZE
> >>>> -#define THREAD_SHIFT PAGE_SHIFT
> >>>> -#endif /* PAGE_SHIFT =3D=3D 13 */
> >>>> +/* thread information allocation */
> >>>> +#ifdef CONFIG_SPARC64
> >>>> +	#define THREAD_SIZE (4 * PAGE_SIZE)
> >>>> +	#define THREAD_SHIFT (PAGE_SHIFT + 2)
> >>>> +	#define THREAD_SIZE_ORDER 2 =20
> >>> As far as I can see, given that this header is included by
> >>>
> >>> #if defined(__sparc__) && defined(__arch64__)
> >>> #include <asm/thread_info_64.h>
> >>> #else
> >>> #include <asm/thread_info_32.h>
> >>> #endif
> >>>
> >>> the code above is the only code that will ever be compiled, while lea=
ving...
> >>> =20
> >>>> +#elif PAGE_SHIFT =3D=3D 13
> >>>> +	#define THREAD_SIZE (2 * PAGE_SIZE)
> >>>> +	#define THREAD_SHIFT (PAGE_SHIFT + 1)
> >>>> +	#define THREAD_SIZE_ORDER 1
> >>>> +#else
> >>>> +	#define THREAD_SIZE PAGE_SIZE
> >>>> +	#define THREAD_SHIFT PAGE_SHIFT
> >>>> +	#define THREAD_SIZE_ORDER 0
> >>>> +#endif =20
> >>> ...this code dead, where the else branch code already was dead (but t=
hen
> >>> in two separate else braches).
> >>>
> >>> I'd rather see the else branch here and the else branch below cleaned=
 up
> >>> by a separate patch with a fixup tag for commit 15b9350a177b ("sparc6=
4:
> >>> Only support 4MB huge pages and 8KB base pages.") that as far as I can
> >>> see should have removed the else branch. The else branches was to use
> >>> only one page when the page size was _larger_ than 8 KiB when that was
> >>> an option. =20
> >> That whole logic is impenetrable.
> >> Why not set the 'desired thread size' in kB, then work out how many
> >> pages that ends up being based on the page size, and finally get the a=
ctual
> >> stack size.
> >> I'm not sure, but with vmalloc()ed stacks and 8k pages can't you have =
24kB? =20
> > No, the next step up is 32 KiB as the stack allocation is sized by
> > THREAD_SIZE_ORDER.
> >
> > Cheers,
> > Andreas
> > =20
>=20
> After additional testing and debugging on a SPARC64 S7-2 system running=20
> kernel v7.1-mainline, I've made several important observations regarding=
=20
> the USB core stack overflow issue.
>=20
> 1. The Stack Overflow is Real and Consistent
>=20
> My initial patch (increasing kernel stack to 32KB) appears to work with=20
> v7.1-mainline as well. However, the underlying problem remains: the USB=20
> core's stack usage consistently exceeds the default 16KB limit during=20
> hub enumeration.
>=20
> 2. The "Static Analysis vs. Runtime Reality" Contradiction
>=20
> When I compile the kernel with -fstack-usage to generate .su files, the=20
> static analysis shows small stack frames for all USB core functions.
>=20
>  =C2=A0For example:
>=20
> hub_event:=C2=A0 =C2=A0 =C2=A0 2457 bytes=C2=A0 (static)
> hub_activate:=C2=A0 =C2=A01892 bytes=C2=A0 (static)
> usb_control_msg: 1248 bytes (static)

Those aren't that small.
The stack frame for a minimal function seems to be 176 bytes.

While there might be other places that allocate stack, most will be
allocated by the 'save %sp, -nnn, %sp' instruction that rotates the
register window (so the %sp it writes to is different from the one
it reads from).
Should be easy so find in the output of 'objdump -d vmlinux.o'.
(search for function_name.: to find the start of a function)

>=20
> However, my runtime stack tracing shows a dramatically different picture:
>=20
> STACKTRACE: hub_event():entry: 31856 bytes used
> STACKTRACE: hub_activate():entry: 31680 bytes used
> STACKTRACE: usb_control_msg():entry: 30768 bytes used

31856 - 31680 =3D 176
31680 - 30768 =3D 912
Those might match the code being run.

That makes it look like a lot of the problem is much earlier in the call st=
ack.

	David


