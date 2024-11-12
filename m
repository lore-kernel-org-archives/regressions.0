Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B612572
	for <regressions@lists.linux.dev>; Tue, 12 Nov 2024 01:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731374134; cv=none; b=mxHYel7hv6FPptX87r52asGmhQdsirymuAN5p4AQ20u+yrmrEae23peOL5wWYvEOlcan/vosaeRLfAVR4Uw1PQxKwRdZv1rw6YC7qUcJ03cPM08NqVrWsMz9SS2OjzzGaqf3O4ZDTkQJhvOFe9/Ng8P7mX7zuyeMb0leRRUEQM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731374134; c=relaxed/simple;
	bh=pJYatHg/6w82pS0t+o84nekeeckPDPHTBU7Vdyht5kY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zqnd/7Ix2j7QW+/1KqdnmXUu7h5oYwsgrdFcrj3dyidG4imuDh79clnJmubT/f2w2CfnGhDbAWxBx9XEEBznV8zV3uFM7W+P6pArTsqdlXto97CdouM5gFwrKLVUoTpewEJPtOsBoaUyvohJy+hdCdmCDR7mBTBjv+mIb4CJLb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYq7Iy4W; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYq7Iy4W"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so47426311fa.2
        for <regressions@lists.linux.dev>; Mon, 11 Nov 2024 17:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731374130; x=1731978930; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spUKRV7OxoGH84s6UjjK27+hvVkNjTU0eC0jz2ca18g=;
        b=jYq7Iy4WufP0yZ7H5q2oHMsM/vZP+Xo239axtgJb7LwgSW8DZaME2to0wCgyZifOGh
         cT3u11VxWHFNhj/cFkpIB6AwObMXq8JJLMALXLxetZc0HyLBuvQcOQYNMSQ3JTJLanEC
         laEAAq4/76UNpj8xXi4G5OiA3jbISL5lVhmmomlzSOyowthVtajaY5GbvYvX2kBV4Sc2
         zh8g180wgc9lkc6J9nkHsnHGH7nD0/Uc/z1Ac0dhPL1iwyRnkOcs9prvjZBOMGONWXcq
         Q/otVxQfTwr2ZPSOnhSfGi3v2jj9uKmbAXXh2UIba3o7bzfJ8wfR1y3RFVxLTKJ9tyrL
         R3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731374130; x=1731978930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spUKRV7OxoGH84s6UjjK27+hvVkNjTU0eC0jz2ca18g=;
        b=N8CYFx+SDUlHfQWJpEhxMaG4oHJZ7Wv5GJNg7XwqHzzWZrAmjsmobxvxyJNMaVzuS3
         9yFQk63oXK2I6HduczL0tua8RIRt51InJbJyzyLKwjidGixsniyREwTh/k+LAJC6LyDg
         QcVWvMCNDaWm4krCN28Q4ItIWZ32vxkhZluIkEvaZOPPa8ODvjaSMMLQga+FDZOKFHDQ
         cL7B4YNdRYp3w80kGFHF+Gn38ZQru1jcRzFkWr+lz1A8qL80ISipAKhiEhivVx+NbKvn
         n/JWQU4dFFDjss0RbvFDW4hq3xhOJPx4A7KMWJbFq9sNUS3evGh4I7J3lMD3QKjgevvt
         ZdsA==
X-Forwarded-Encrypted: i=1; AJvYcCXUk4YPdbkuaWUJX3vexY8xc6dWHZiZK+O+3dA0LDbZd22T3MQ6BUTCpDu5HJLR0N7yB21Yv0vJE+BQaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcfviUo9U2V8T7hjDmYrF6OLjwO0qjkhb0czuOZ6TNh5e/2UDy
	ZTVhqiG7lAxyd3c4GMEKC1zcoP74zguw2ZqAL4kmozveN8t4epJrjhrUIHgc7qWaxTwDX4G4+V6
	WWA9wuTkd26B6SNIC184FukX+EJ0LXdhere7EKQ==
X-Google-Smtp-Source: AGHT+IFhKWTwwBPu5jX7u89u+dUKj0C5//5o/QMl+RXh0GIkjzOyjBHHfqpvI+xl/jvzNzXbfa5GdbcAObQdme0kFAs=
X-Received: by 2002:a2e:a813:0:b0:2fe:fec7:8adf with SMTP id
 38308e7fff4ca-2ff2029fed5mr65047841fa.38.1731374130317; Mon, 11 Nov 2024
 17:15:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241111233817.2f824c19@foxbook>
In-Reply-To: <20241111233817.2f824c19@foxbook>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Nov 2024 02:15:19 +0100
Message-ID: <CACRpkdYsgnBFsyF9upr=xoLdMJ25DCXMEJ-co7rJTnRanJncug@mail.gmail.com>
Subject: Re: cacheflush completely broken, suspecting PAN+LPAE
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Mon, Nov 11, 2024 at 11:38=E2=80=AFPM Micha=C5=82 Pecio <michal.pecio@gm=
ail.com> wrote:

> I installed v6.11.5 on Tegra K1 (Cortex-A15) with tegra_defconfing +
> CONFIG_ARM_LPAE + a few drivers + minor patches for driver issues.
>
> gdb segfaults on startup, strace shows this:
>
> openat(AT_FDCWD, "/usr/lib/guile/3.0/ccache/ice-9/psyntax-pp.go", O_RDONL=
Y|O_LARGEFILE|O_CLOEXEC) =3D 11
> _llseek(11, 0, [477309], SEEK_END)      =3D 0
> mmap2(NULL, 477309, PROT_READ, MAP_PRIVATE, 11, 0) =3D 0xb378a000
> close(11)                               =3D 0
> mprotect(0xb37da000, 43512, PROT_READ|PROT_WRITE) =3D 0
> mmap2(NULL, 262144, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONY=
MOUS, -1, 0) =3D 0xb374a000
> cacheflush(0xb374a000, 0xb374b000, 0)   =3D -1 EFAULT (Bad address)
> cacheflush(0xb374a000, 0xb374b000, 0)   =3D -1 EFAULT (Bad address)
> cacheflush(0xb374a000, 0xb374b000, 0)   =3D -1 EFAULT (Bad address)
> futex(0xb6f0bb14, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> cacheflush(0xb374a000, 0xb374b000, 0)   =3D -1 EFAULT (Bad address)
> cacheflush(0xb374a000, 0xb374b000, 0)   =3D -1 EFAULT (Bad address)
> --- SIGSEGV {si_signo=3DSIGSEGV, si_code=3DSEGV_MAPERR, si_addr=3D0x4} --=
-
>
> guile is apparently a scripting language with JIT compiler, disabling
> JIT resolves the crash, so cacheflush is a big suspect at this point.
>
> No apparent valid reason for those failures and no recent changes to
> cacheflush handling that I see, so I searched for commits touching LPAE
> (perhaps the most uncommon part of my system) and I quickly found the
> ARM_PAN feature, which claims to monkey with page tables. Hmm...
>
> Disabled ARM_PAN, cacheflush returns 0 now and gdb crashes no more.
>
> So I guess it looks like there is a problem with this feature, perhaps
> a missing "permit user accesss" somewhere?

We are trying to locate the issue, which I think is the same as this
but not sure:
https://bugzilla.kernel.org/show_bug.cgi?id=3D219247

I have been trying to replicate it on a Chromebook but didn't get so far
yet because the installation is pretty idiomatic :/ also there is only appe=
ars
in a single Qt program and not as predictable as here.

But. It appears the code is issuing cacheflush() which I guess ends
up in arm_syscall() here:

        case NR(cacheflush):
                return do_cache_op(regs->ARM_r0, regs->ARM_r1, regs->ARM_r2=
);

To here:

static inline int
do_cache_op(unsigned long start, unsigned long end, int flags)
{
        if (end < start || flags)
                return -EINVAL;

        if (!access_ok((void __user *)start, end - start))
                return -EFAULT;

        return __do_cache_op(start, end);
}

Here userspace access should be fine because we have entered a
syscall from userspace. I tried to emulate the situation with this
program:

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>

#define NR_cacheflush 0xf0002

/* libgcc */
extern void __clear_cache(void *, void *);

int main (int argc, char **argv) {
  void *addr;
  int ret;

  printf("Test()\n");
  addr =3D mmap(NULL, 0x1000, PROT_READ|PROT_WRITE|PROT_EXEC,
              MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
  if (addr =3D=3D MAP_FAILED) {
    printf("mmap() failed\n");
    exit(1);
  }

The libgcc version is what guile uses.
But it all just works fine for me.

I added prints in the cacheflush trap:

diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index 480e307501bb..400650519bd1 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -592,11 +592,14 @@ __do_cache_op(unsigned long start, unsigned long end)
 static inline int
 do_cache_op(unsigned long start, unsigned long end, int flags)
 {
+       pr_info("%s(%08lx-%08lx)\n", __func__, start, end);
        if (end < start || flags)
                return -EINVAL;

-       if (!access_ok((void __user *)start, end - start))
+       if (!access_ok((void __user *)start, end - start)) {
+               pr_err("ACCESS NOT OK\n");
                return -EFAULT;
+       }

        return __do_cache_op(start, end);
 }

And they all work fine with the test program.
This is on v6.12-rc1.

Does this test program work also on your set-up?

Yours,
Linus Walleij
