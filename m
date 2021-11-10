Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B012C85
	for <regressions@lists.linux.dev>; Wed, 10 Nov 2021 22:24:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E51D761268
	for <regressions@lists.linux.dev>; Wed, 10 Nov 2021 22:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636583055;
	bh=0fre3SfK7wolFNYE3+elp2EAeuxzNIUlhw2MJlqR2YI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qJwZtK0YNM4LSAIpSGnz+GMPkKwY05rEjGKMOVkYvw1I/fkCQb5+NVkaJ9TMiUUhB
	 oOneNgf//xVucjOdymwI1SYmNF5DLu0FiKFdkc3HgqGm6Os2e7CA2RTNZZTzxLG9Px
	 62EgLOqgf22/mKhHkxiCjBY+lYYqIujKHlIRGDJrnKcE17hLo5ofrDiGd+cr1A6smN
	 V/1xBUBbXum6TyYTOcBOrLgJsabIfldqU/cITk6ebhCoZsK2hJRIaNwRk6vDWgNUTq
	 /uimdCnaxoEtcg697CvcPGPO7Kwd1ZUmCznmOOwhCVWhh81uR5QUZC+Os2tFbbML+3
	 EUnOyoe1pRgjA==
Received: by mail-oo1-f46.google.com with SMTP id v19-20020a4a2453000000b002bb88bfb594so1264784oov.4
        for <regressions@lists.linux.dev>; Wed, 10 Nov 2021 14:24:15 -0800 (PST)
X-Gm-Message-State: AOAM532s9oULvEdKMRwBZP1JPKlxNcNFAOJXCkgV8eAkV45csgZCfCyp
	V9Ca/vAzpal3tpWfHiGRB895pUsuFVUQR/0BdAI=
X-Google-Smtp-Source: ABdhPJwTbANCR4LyGDnbFZlq9QNtUtJ2ht9HKEiYvAszj6gDBkZxO/hSaVifqPNefuFrcmHrEmsRPVYdZZNQeOj2G0Q=
X-Received: by 2002:a4a:a641:: with SMTP id j1mr1471623oom.63.1636583055093;
 Wed, 10 Nov 2021 14:24:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211110200253.rfudkt3edbd3nsyj@lahvuun>
In-Reply-To: <20211110200253.rfudkt3edbd3nsyj@lahvuun>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 10 Nov 2021 23:24:03 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHuU8dFBUeM41bHu13nd2qQVPJizt8Epw596K89_samiQ@mail.gmail.com>
Message-ID: <CAMj1kXHuU8dFBUeM41bHu13nd2qQVPJizt8Epw596K89_samiQ@mail.gmail.com>
Subject: Re: [REGRESSION]: drivers/firmware: move x86 Generic System
 Framebuffers support
To: Ilya Trukhanov <lahvuun@gmail.com>
Cc: "# 3.4.x" <stable@vger.kernel.org>, regressions@lists.linux.dev, 
	linux-efi <linux-efi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	Javier Martinez Canillas <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, pavel@ucw.cz
Content-Type: text/plain; charset="UTF-8"

Hi Ilya,

On Wed, 10 Nov 2021 at 21:02, Ilya Trukhanov <lahvuun@gmail.com> wrote:
>
> Suspend-to-RAM with elogind under Wayland stopped working in 5.15.
>
> This occurs with 5.15, 5.15.1 and latest master at
> 89d714ab6043bca7356b5c823f5335f5dce1f930. 5.14 and earlier releases work
> fine.
>
> git bisect gives d391c58271072d0b0fad93c82018d495b2633448.
>
> To reproduce:
> - Use elogind and Linux 5.15.1 with CONFIG_SYSFB_SIMPLEFB=n.
> - Start a Wayland session. I tested sway and weston, neither worked.
> - In a terminal emulator (I used alacritty) execute `loginctl suspend`.
>
> Normally after the last step the system would suspend, but it no longer
> does so after I upgraded to Linux 5.15. After running `loginctl suspend`
> in dmesg I get the following:
> [  103.098782] elogind-daemon[2357]: Suspending system...
> [  103.098794] PM: suspend entry (deep)
> [  103.124621] Filesystems sync: 0.025 seconds
>
> But nothing happens afterwards.
>
> Suspend works as expected if I do any of the following:
> - Revert d391c58271072d0b0fad93c82018d495b2633448.
> - Build with CONFIG_SYSFB_SIMPLEFB=y.

If this solves the issue, what else is there to discuss?



> - Suspend from tty, even if a Wayland session is running in parallel.
> - Suspend from under an X11 session.
> - Suspend with `echo mem > /sys/power/state`.
>
> If I attach strace to the elogind-daemon process after running
> `loginctl suspend` then the system immediately suspends. However, if
> I attach strace *prior* to running `loginctl suspend` then no suspend,
> and the process gets stuck on a write syscall to `/sys/power/state`.
>
> I "traced" a little bit with printk (sorry, I don't know of a better
> way) and the call chain is as follows:
> state_store -> pm_suspend -> enter_state -> suspend_prepare
> -> pm_prepare_console -> vt_move_to_console -> vt_waitactive
> -> __vt_event_wait
>
> __vt_event_wait just waits until wait_event_interruptible completes, but
> it never does (not until I attach to elogind-daemon with strace, at
> least). I did not follow the chain further.
>
> - Linux version 5.15.1 (lahvuun@lahvuun) (gcc (Gentoo 11.2.0 p1) 11.2.0,
>   GNU ld (Gentoo 2.37_p1 p0) 2.37) #51 SMP PREEMPT Tue Nov 9 23:39:25
>   EET 2021
> - Gentoo Linux 2.8
> - x86_64 AuthenticAMD
> - dmesg: https://pastebin.com/duj33bY8
> - .config: https://pastebin.com/7Hew1g0T
