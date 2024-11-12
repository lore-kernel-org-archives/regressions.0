Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE1420A5C7
	for <regressions@lists.linux.dev>; Tue, 12 Nov 2024 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731403962; cv=none; b=o9Yqq08EgKLR64AMQbHHbqGVQOIXplP2TubBkfWGeRFqJMipg4rScstmswl3zo2OjAtJE0QGpdy+5ssSkzhWXxHUvMGFiKUFVyP42bkchUYmpoBOXOYNen3UaBreV45L28ZN4hzhZvku8PkScQBytmTbCTeLKal0WHyZNKXv9oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731403962; c=relaxed/simple;
	bh=xhiLnT7ViC+xPWEdtdsGRkQ5s44xPT23j5kNrerdb+s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JnCejah1AMzecLapSqJhHLASFWLmpjOe+Nvl1SNfDWywmKo/PLcKLsI4VxBDYVUW/RDNEgwigxuUlOKS9nS8nb/jsQgvdASwvgvk8bzM2JRkzSPUgzcHMk+Ay1DgQE5hCSSWcDqkPaMNYoTVuwRSb4oBv6yaqZxDs9Z1i2e8fBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfR/yCEp; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZfR/yCEp"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53a007743e7so6363723e87.1
        for <regressions@lists.linux.dev>; Tue, 12 Nov 2024 01:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731403958; x=1732008758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmEMMtf/H6NHxiwIDkXtkXjM/8+TQ4BBA2hjpYSmZBc=;
        b=ZfR/yCEpZw1TV+LOhdPvCe96NMgJom7tc6FnbDfTOuvgJQoB+pb+3P2q1Yd3t/2wc9
         Ge3P98KyrVRR5gMdVl6EKZevPPv4xn7Uy3A0mBKSPLjwbLE1saMetIKUi2RwDjy2T3Fx
         gcKndKAbST7leg9v94dQF0fPoY3bGYaj/j0Ycn3PGRT5eFTsh4yRCldE36s67WJqBBgp
         kP7e/oAzK193eYqZPrV3MC385wTryYfeiE9pfRP2lkecqwfcL2hiP89jmbQvDlA+swNM
         NHHV9vIY0hlmQoqxccGMYgQdoQW/xeVzITN1AWvpKOGfR8NFlONVf/g1vo1D3CLtR+YO
         YjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731403958; x=1732008758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmEMMtf/H6NHxiwIDkXtkXjM/8+TQ4BBA2hjpYSmZBc=;
        b=P3a3oMDsjOxTyumZ+/qlvG3poviGTdGOSYcDb5SnSW1AaLGZLMDK8KgfNxsWPHScc2
         YN04pwTelyQS9z3Y5NRnrz9CqgmCciJWXh4n/7A4SehzUfikZAczAf8poAYrn6ZZyl86
         flUTDATD7MIAG0dkkLGvcHqzhlf9HCvSVqKit4ACQGHNfXQ0NYrY/+oYtzaLox1jhCqi
         F2658NtAsZR5SnzGGj7Nu5hBGojQcLI/hvkkl1PD2p2xEMYmoBKd50PL5LcdraEgZPHk
         WtUOmjKSMgr//lUnmJ/OkeH1qvjiMC4g0VuoPW8wv7vvBOaMIgjAyyRgWnv0Lx6xmyX+
         VfZg==
X-Forwarded-Encrypted: i=1; AJvYcCVbiIFxBNHWsHykkrOQ8ZpbV2n8gK3+2hBFzNJPJTvGA3cA/Y98pTkixBsHqDDHSXc9UC15jiKRWSr4bw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd2K3UAPhgGY5XOOKS1xkxZp0QG3klBhqfET6ZyBzVLu/XZGbG
	tPz9JMtx6l7SqEmcOzhgIEVCVd65Dwj1uH6q/iW/Ut4X2QvJ2xhm
X-Google-Smtp-Source: AGHT+IEGzMD4CQHrVZz7i2b8hgEFwUsv2cHjAkR8UPEY/r2EfFd9HA1jM+513+OHfjzmbNs4ECZmuA==
X-Received: by 2002:a05:6512:1255:b0:539:fcba:cc6d with SMTP id 2adb3069b0e04-53d8626c818mr6835328e87.42.1731403957725;
        Tue, 12 Nov 2024 01:32:37 -0800 (PST)
Received: from foxbook (bff246.neoplus.adsl.tpnet.pl. [83.28.43.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a721csm1833134e87.160.2024.11.12.01.32.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 Nov 2024 01:32:36 -0800 (PST)
Date: Tue, 12 Nov 2024 10:32:29 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Linux kernel regressions list
 <regressions@lists.linux.dev>, Kees Cook <kees@kernel.org>
Subject: Re: cacheflush completely broken, suspecting PAN+LPAE
Message-ID: <20241112103229.566b1ff3@foxbook>
In-Reply-To: <CACRpkdYsgnBFsyF9upr=xoLdMJ25DCXMEJ-co7rJTnRanJncug@mail.gmail.com>
References: <20241111233817.2f824c19@foxbook>
	<CACRpkdYsgnBFsyF9upr=xoLdMJ25DCXMEJ-co7rJTnRanJncug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

On Tue, 12 Nov 2024 02:15:19 +0100, Linus Walleij wrote:
> We are trying to locate the issue, which I think is the same as this
> but not sure:
> https://bugzilla.kernel.org/show_bug.cgi?id=219247

You can verify by asking the reporter to run the crashing program under
strace. If SIGSEGV follows a failed cacheflush, it's my bug most likely.

A straightforward repro of this bug:
gdb
GUILE_JIT_THRESHOLD=0 gdb
GUILE_JIT_THRESHOLD=-1 gdb

Expected outcome: segfault, segfault, shows command prompt.

> I have been trying to replicate it on a Chromebook but didn't get so
> far yet because the installation is pretty idiomatic :/ also there is
> only appears in a single Qt program and not as predictable as here.

My bug also appears in a single program ;) This system works fine, but
any JIT is broken by this kind of bug. The failure may be random if the
caches resynchronize by a fluke, but with gdb it was every time so far.

> But. It appears the code is issuing cacheflush() which I guess ends
> up in arm_syscall() here:
> 
>         case NR(cacheflush):
>                 return do_cache_op(regs->ARM_r0, regs->ARM_r1, regs->ARM_r2);
> 
> To here:
> 
> static inline int
> do_cache_op(unsigned long start, unsigned long end, int flags)
> {
>         if (end < start || flags)
>                 return -EINVAL;
> 
>         if (!access_ok((void __user *)start, end - start))
>                 return -EFAULT;
> 
>         return __do_cache_op(start, end);
> }

Yep. I added printks here and it is particularly the call to
flush_icache_range() from __do_cache_op() which returns -EFAULT.

> Here userspace access should be fine because we have entered a
> syscall from userspace. I tried to emulate the situation with this
> program:
> 
> #include <stdlib.h>
> #include <stdio.h>
> #include <errno.h>
> #include <unistd.h>
> #include <fcntl.h>
> #include <sys/mman.h>
> 
> #define NR_cacheflush 0xf0002
> 
> /* libgcc */
> extern void __clear_cache(void *, void *);
> 
> int main (int argc, char **argv) {
>   void *addr;
>   int ret;
> 
>   printf("Test()\n");
>   addr = mmap(NULL, 0x1000, PROT_READ|PROT_WRITE|PROT_EXEC,
>               MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
>   if (addr == MAP_FAILED) {
>     printf("mmap() failed\n");
>     exit(1);
>   }

This seems incomplete, there is no __clear_cache(). But if you add it
at the end then yes, it should fail. Confirm it with strace.

> I added prints in the cacheflush trap:
> 
> diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
> index 480e307501bb..400650519bd1 100644
> --- a/arch/arm/kernel/traps.c
> +++ b/arch/arm/kernel/traps.c
> @@ -592,11 +592,14 @@ __do_cache_op(unsigned long start, unsigned
> long end) static inline int
>  do_cache_op(unsigned long start, unsigned long end, int flags)
>  {
> +       pr_info("%s(%08lx-%08lx)\n", __func__, start, end);
>         if (end < start || flags)
>                 return -EINVAL;
> 
> -       if (!access_ok((void __user *)start, end - start))
> +       if (!access_ok((void __user *)start, end - start)) {
> +               pr_err("ACCESS NOT OK\n");
>                 return -EFAULT;
> +       }
> 
>         return __do_cache_op(start, end);
>  }

You also need to check what __do_cache_op() returns.

Regards,
Michal
