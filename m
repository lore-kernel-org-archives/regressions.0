Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE951DDD9
	for <regressions@lists.linux.dev>; Wed, 17 May 2023 16:27:53 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6238daae378so667596d6.1
        for <regressions@lists.linux.dev>; Wed, 17 May 2023 09:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684340873; x=1686932873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKP3y2yRA1niickBAZNGt652pVuj+gN+BwTUxLrXHNQ=;
        b=x6IZmmBCbPWXYEV1s7cwpW+6JSUPvlKX/pEzz5bkryXn1zZebfylT4DUapS4sia6Bm
         593nM5GeWZJyZU3elQthsjSQjaLVUhiT1xATIBTlx6rJyiWe0BccHZKUZGy7Z49VVOLd
         ULfJnBAe1kcFUWU2OIxI2oQBL0av3WUv1TcT/EojkwXeF6gWCYxGzmC+msS0zdE7h2c6
         fFxl6SEEE9bf4C/2eLRqperK6PFAMdAo5Anph13Y+2ohfRM3KPQVKxLEiepYwlcZclQY
         Kbs6f6WlYEPs0MMgn7IKu31Wd88GMhBytneV3IfZ4EFpknd5ojk0j/bgaMZ1fWbTt4V/
         rOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684340873; x=1686932873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKP3y2yRA1niickBAZNGt652pVuj+gN+BwTUxLrXHNQ=;
        b=Qkc/s01ubFj/pLRnSaj4sSCcBJz3WZqqQo3RdOBUpNt1w9TzBNBpZOe5CKwkHPocQF
         bP19FNoLZ+cygo2i7WN59MNALubiDo+C5HWt4TLgqn7EeUG8AilOz3LP3LVq9AtJYQdu
         WReQ4y9TThPTYyfQws6guJV30Je7ffwIMCLtgnJk2J6k9NZLWE8AqP3BEnu+Cx4qYolC
         k6FXDeOqJTKFMjPnKU6hO+KfGOgcWWtvBzLFlVZ/vKX3du61+6lNHskvrtGitU7yIlI0
         ifMIxvgvRXQw7FWUxanBsasTJlzY2+b6OTnMCbIgpNntrdPa4E+fjYTS/vTzyrJwjnXG
         ayEw==
X-Gm-Message-State: AC+VfDxpvLb5TzcYyAsPyqR8xqDPM1Lopq30weTmqMXWXcfJCze77MrA
	buG7HjkYc4FCDPpyK767AiPVtvkMHKUCjSX9eFlXNA==
X-Google-Smtp-Source: ACHHUZ5i7gqrt52vlZ8Nnb/F0kMFD8QMC/x9Q5gQRUQ0nTJlG6e6Y29/q9q1G0M5KBatPnK9A2vJ9E/t/pXyL0yzlQ8=
X-Received: by 2002:ad4:5dc4:0:b0:61a:c2bf:9f0b with SMTP id
 m4-20020ad45dc4000000b0061ac2bf9f0bmr658197qvh.6.1684340872605; Wed, 17 May
 2023 09:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
 <20220919170828.3718437-1-ndesaulniers@google.com> <597ef55f-e7c1-ab60-b4aa-0071ff4b5e0e@collabora.com>
 <CAKwvOdmSrAxx-YY1Na3BSdYuxXCPKK+F0K5V6i+adTn_bVJEsw@mail.gmail.com>
 <89961dfc-d40f-78e4-5d34-b86b7d152182@collabora.com> <CAKwvOd=4hBcU4fAkddU0b-GOZc9FzTZoj3PFW6ZZrX0jS8x+bg@mail.gmail.com>
 <17c91d37-7d9c-0df4-2438-2b30ca0b5777@collabora.com> <CAKwvOdk4QO8x_bs64fFRCsMu__AjhXd4Ew2KfgzQOb9Q3FMqSA@mail.gmail.com>
 <b5d0cf82-0e42-f6a1-c9f5-c145fdc4c622@collabora.com>
In-Reply-To: <b5d0cf82-0e42-f6a1-c9f5-c145fdc4c622@collabora.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 17 May 2023 09:27:41 -0700
Message-ID: <CAKwvOdkFxu9hYSL_RCXadpR0dQd1+dZmAUVXdfFiLUfxg4D_Xw@mail.gmail.com>
Subject: Re: [PATCH v4] Makefile.compiler: replace cc-ifversion with
 compiler-specific macros
To: =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc: Shreeya Patel <shreeya.patel@collabora.com>, Michal Marek <michal.lkml@markovi.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, regressions@lists.linux.dev, 
	"gustavo.padovan@collabora.com" <gustavo.padovan@collabora.com>, 
	Guillaume Charles Tucker <guillaume.tucker@collabora.com>, denys.f@collabora.com, 
	kernelci@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 8:39=E2=80=AFAM Ricardo Ca=C3=B1uelo
<ricardo.canuelo@collabora.com> wrote:
>
> Hi Nick,
>
> On 16/5/23 1:01, Nick Desaulniers wrote:
> > Can you please help verify this failure by hand, and see if applying
> > https://github.com/ClangBuiltLinux/linux/commit/45c4fb6095d872785e07794=
2da896d65d87ab56b.patch
> > helps?  If you can repro; mind sharing your precise steps to reproduce?
>
> I ran a few tests but the commit that introduced your changes
> passes every time. There's a chance that the bisector got misled
> due to the test runs failing for whatever reason unrelated to the
> patch. There's definitely something introducing a bug somewhere,
> as current mainline/master makes this test fail on this target
> when kernel/configs/debug.config is applied, but it must be
> somewhere else. I'll investigate this some more to see what I can
> find.

Thanks for verifying/reporting.


>
> About the steps to reproduce it, we're using the current KernelCI
> tools (kci_build) to generate the kernel. To actually launch the
> tests I'm submitting jobs to Collabora's LAVA lab, which is
> something that isn't available to external users, so it might be
> a bit hard for you to reproduce the exact environment from the
> original test. If you need to test something, I can do it for
> you.

Shreeya mentioned upthread that `qemu_arm-virt-gicv3-uefi` was
failing, so I assume others should be able to repro in qemu. I'd guess
that LAVA lets you have VMs adjacent to physical hardware.  Having the
qemu command line, kernel config, and perhaps the initramfs are going
to be the three most useful things for any similar bug report.
--=20
Thanks,
~Nick Desaulniers
