Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EA711193
	for <regressions@lists.linux.dev>; Fri, 19 May 2023 15:57:36 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7577ef2fa31so48389485a.0
        for <regressions@lists.linux.dev>; Fri, 19 May 2023 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684511855; x=1687103855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlIVAJkfUZuaa/mIdEmkmyvFCFGMfQ33OBwJnbKZILY=;
        b=lGGNkc8nfCv/+xd2tZWAVIdZN9LnuxzOUwfAxn6XE17QzOycTPTNHliz2ZFhtUh+YF
         JfMZXk0Yo/TMVeGFSlU3/F7eUMtnFJBCXPCt26x0DGb+Aw7txIF2aO5F9oHYF/FDUcxh
         GExjFkSKHEtoweTKlQE9o4+WW11YS3OY+aZ7a09D+dQPabHwOa1Epx/EnbWh1XUYda7+
         wI2uhfXAkB4w3HxyEfqCNZpJflCbxhnWPV8BVHOI9XqeBIuKc62zGR/nGqmcLpxtjnMu
         G1upkcZHOuuu1ofZSEnNwVWpvUkbkyTS+oBc8BsvaswqSUBCY2+6kDIgIaX8H9VOpJ92
         viYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684511855; x=1687103855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlIVAJkfUZuaa/mIdEmkmyvFCFGMfQ33OBwJnbKZILY=;
        b=jZ1b6sER5UOo2o1ucpPbowLLGULd0lLaMGYTgK/l8b7tk1Vy66obdRsEVmLCHge/do
         rpARNlIsBH5gM2ZDthJjkZ8WIOlCQJqoxXQxsjme7uGEkr7mT8ZWvFixny7IzmLIh1mL
         V2kIOCE49cXkBB1U6EQQZc31XvrX4M9CRSAlJma7QIy8xUHJ8mY4p9Z7ruprxsKHXudA
         y29AapPatMiOATDtYREWF2+IUx9Fajtu0gXIo9ISLC/SHv2CAIYqHvfvncnFKv9SBMcc
         S/gBc6IUrPUFVXQnZgFSf3yu4+bUQODwvxKcVaPQarsGIHPTlzdsZUIgh88zxVJVpKyg
         iI0g==
X-Gm-Message-State: AC+VfDyUJKLr2w62fuhwb29SCfipjMN56UYq+11S7gz9tgh0YnyqHHqw
	sKKuYlNNjuEf3CjDEb2UfAmqh3mvj7jByHb/3PYSAQ==
X-Google-Smtp-Source: ACHHUZ7am3g5K1M8XXYl0TVpF1TkbnbjfGOU5itzTMNk/WigjyM4lXkOk9kRkA/Mj26X0uyicFXOI+bHipdr7bUnf/U=
X-Received: by 2002:a05:6214:401d:b0:616:859a:471a with SMTP id
 kd29-20020a056214401d00b00616859a471amr5347827qvb.17.1684511855305; Fri, 19
 May 2023 08:57:35 -0700 (PDT)
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
 <b5d0cf82-0e42-f6a1-c9f5-c145fdc4c622@collabora.com> <CAKwvOdkFxu9hYSL_RCXadpR0dQd1+dZmAUVXdfFiLUfxg4D_Xw@mail.gmail.com>
 <878rdlk9bi.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
 <CAKwvOd=8LVU+iANkFx18Wm1jg7gYiAXovAmo9t5ZZaVdMULn-Q@mail.gmail.com> <875y8ok9b5.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
In-Reply-To: <875y8ok9b5.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 19 May 2023 08:57:24 -0700
Message-ID: <CAKwvOdmJJibt6sHSp91v2s7BxUWBC6xG7F7+3C6gUxNMzZ2xRA@mail.gmail.com>
Subject: Re: [PATCH v4] Makefile.compiler: replace cc-ifversion with
 compiler-specific macros
To: =?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc: Shreeya Patel <shreeya.patel@collabora.com>, Michal Marek <michal.lkml@markovi.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, regressions@lists.linux.dev, 
	"gustavo.padovan@collabora.com" <gustavo.padovan@collabora.com>, 
	Guillaume Charles Tucker <guillaume.tucker@collabora.com>, denys.f@collabora.com, 
	kernelci@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 1:35=E2=80=AFAM Ricardo Ca=C3=B1uelo
<ricardo.canuelo@collabora.com> wrote:
>
> On jue, may 18 2023 at 14:12:30, Nick Desaulniers <ndesaulniers@google.co=
m> wrote:
> > That's a higher risk change (and has my name on the tested-by tag, yike=
s).
> >
> > So is that the culprit of the boot failure you're observing?
>
> Right now it is.
>
> Here's a test run using that commit
> (5750121ae7382ebac8d47ce6d68012d6cd1d7926):
> https://lava.collabora.dev/scheduler/job/10373216
>
> Here's one with the commit right after that one
> (26ef40de5cbb24728a34a319e8d42cdec99f186c):
> https://lava.collabora.dev/scheduler/job/10371513
>
> Then one with 26ef40de5cbb24728a34a319e8d42cdec99f186c with a revert
> commit for 5750121ae7382ebac8d47ce6d68012d6cd1d7926 on top:
> https://lava.collabora.dev/scheduler/job/10371882
>
> But I'm not confident enough to jump ahead and call this a kernel
> regression, specially after the bisector confidently said that about
> your commit and then it turned out none of us could reproduce it.

It could be; if the link order was changed, it's possible that this
target may be hitting something along the lines of:
https://isocpp.org/wiki/faq/ctors#static-init-order i.e. the "static
initialization order fiasco"

I'm struggling to think of how this appears in C codebases, but I
swear years ago I had a discussion with GKH (maybe?) about this. I
think I was playing with converting Kbuild to use Ninja rather than
Make; the resulting kernel image wouldn't boot because I had modified
the order the object files were linked in.  If you were to randomly
shuffle the object files in the kernel, I recall some hazard that may
prevent boot.

>
> There have been some cases where a commit made a test fail (kernel
> failing to load, for instance) and the real problem was that the kernel
> got bigger than the target was capable of handling. So not a problem
> with the commit at all, it was just that the memory mappings needed to
> be redefined for that target. What I'm saying is that sometimes a
> regression report is really uncovering a problem in the test setup
> rather than introducing a bug. Maybe this is one of those cases.
>
> Cheers,
> Ricardo



--=20
Thanks,
~Nick Desaulniers
