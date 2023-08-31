Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C075010E1
	for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 01:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FCB1C433CC
	for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 01:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693444545;
	bh=/GzOoeS9IMqEaWMOStyGqmqIPHMn2UclD/Jy+ErIxqQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SR04DyWk+8bpGGOEP5ZNNkMHaB/Qd1OzdznW7sCYASPDR10mru69Lmoq9TBj30cEz
	 fL2qBKXKUT1NpK1zAfPsn6BNG/+XGs/nLTtU076Xn/5zJAp2w6Q3xVOCG1NRgcZZHW
	 iFkTugblkqUfzuERq59bjBAUZ2EBLOuOJxYsbwSTOFQrKYMT5SMchvibK8XfP5Y+DK
	 SnUnu5hDlXluOGzgCxZhip3LlD3rWD6bLN6220gYEjBXpTuEnzqlvAgLbbOo1qODm6
	 7R+pH3oZ6Y9umh9y4CzZ4laHiXnZ1cgCV8VN1041aneZCgPT5GnGlfvCEqDZqTpYtb
	 2BdYpDx4n/vUQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-500b0f06136so732464e87.0
        for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 18:15:45 -0700 (PDT)
X-Gm-Message-State: AOJu0YwSvgJ3RIKFG+fkPCyEFSXSHxPrY79+QG174gluPp7ahlt6Fazo
	cHZLEAUQMDDlEhuf3VV+6ThOaLK+e01ghm87iXI=
X-Google-Smtp-Source: AGHT+IFMI0XICvOxep1KkiT7TXvtmbnTrF2Hinm9tQH3PUqzjE1OWf8hlGEdMkT/79MzecgXSwMIBXNRce+hOjeOmSU=
X-Received: by 2002:a05:6512:1196:b0:500:adc6:141d with SMTP id
 g22-20020a056512119600b00500adc6141dmr3178899lfr.45.1693444543034; Wed, 30
 Aug 2023 18:15:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZO8qkS0Skg9L4xzr@debian> <527df158-7d32-42ba-d5f1-9dad30704cc1@leemhuis.info>
In-Reply-To: <527df158-7d32-42ba-d5f1-9dad30704cc1@leemhuis.info>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 31 Aug 2023 09:15:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQWWi_Cb1iQiLOr4114kZW7L93KNwjCu3ArKb7ffxcO+A@mail.gmail.com>
Message-ID: <CAJF2gTQWWi_Cb1iQiLOr4114kZW7L93KNwjCu3ArKb7ffxcO+A@mail.gmail.com>
Subject: Re: mainline build failure due to c8171a86b274 ("csky: Fixup
 -Wmissing-prototypes warning")
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>, Guo Ren <guoren@linux.alibaba.com>, 
	Oleg Nesterov <oleg@redhat.com>, linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 9:07=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 30.08.23 13:40, Sudip Mukherjee (Codethink) wrote:
> >
> > The latest mainline kernel branch fails to build csky allmodconfig with
> > the error:
>
> Thx for the report and involving regzbot. To make one thing more obvious:
>
> Guo Ren, it seems to be caused by a commit of yours.
>
> And fun fact: seem 0day bot found the same problem nearly thee weeks
> ago, but nobody cared afaics:
> https://lore.kernel.org/all/202308120502.MXpchFC1-lkp@intel.com/
>
> Ciao, Thorsten
>
> > In file included from ./arch/csky/include/asm/ptrace.h:7,
> >                  from ./arch/csky/include/asm/processor.h:8,
> >                  from ./include/linux/prefetch.h:15,
> >                  from drivers/net/ethernet/intel/i40e/i40e_txrx.c:4:
> > ./arch/csky/include/asm/traps.h:43:11: error: expected ';' before 'void=
'
> >    43 | asmlinkage void do_trap_unknown(struct pt_regs *regs);
> >       |           ^~~~~
> >       |           ;
> > ./arch/csky/include/asm/traps.h:44:11: error: expected ';' before 'void=
'
> >    44 | asmlinkage void do_trap_zdiv(struct pt_regs *regs);
> >       |           ^~~~~
> >       |           ;
> > ./arch/csky/include/asm/traps.h:45:11: error: expected ';' before 'void=
'
> >    45 | asmlinkage void do_trap_buserr(struct pt_regs *regs);
> >       |           ^~~~~
> >       |           ;
> > ./arch/csky/include/asm/traps.h:46:11: error: expected ';' before 'void=
'
> >    46 | asmlinkage void do_trap_misaligned(struct pt_regs *regs);
> >       |           ^~~~~
> >       |           ;
> > ./arch/csky/include/asm/traps.h:47:11: error: expected ';' before 'void=
'
> >    47 | asmlinkage void do_trap_bkpt(struct pt_regs *regs);
> >       |           ^~~~~
> >       |           ;
> > ./arch/csky/include/asm/traps.h:48:11: error: expected ';' before 'void=
'
> >    48 | asmlinkage void do_trap_illinsn(struct pt_regs *regs);
> >       |           ^~~~~
> >       |           ;
> > ./arch/csky/include/asm/traps.h:49:11: error: expected ';' before 'void=
'
> >    49 | asmlinkage void do_trap_fpe(struct pt_regs *regs);
> >       |           ^~~~~
> >       |           ;
> > ./arch/csky/include/asm/traps.h:50:11: error: expected ';' before 'void=
'
> >    50 | asmlinkage void do_trap_priv(struct pt_regs *regs);
> >       |           ^~~~~
> >       |           ;
> > ./arch/csky/include/asm/traps.h:51:11: error: expected ';' before 'void=
'
> >    51 | asmlinkage void trap_c(struct pt_regs *regs);
> >       |           ^~~~~
> >       |           ;
> > ./arch/csky/include/asm/traps.h:53:11: error: expected ';' before 'void=
'
> >    53 | asmlinkage void do_notify_resume(struct pt_regs *regs,
> >       |           ^~~~~
> >       |           ;
> > In file included from ./arch/csky/include/asm/processor.h:8,
> >                  from ./include/linux/prefetch.h:15,
> >                  from drivers/net/ethernet/intel/i40e/i40e_txrx.c:4:
> > ./arch/csky/include/asm/ptrace.h:99:11: error: expected ';' before 'int=
'
> >    99 | asmlinkage int syscall_trace_enter(struct pt_regs *regs);
> >       |           ^~~~
> >       |           ;
> > ./arch/csky/include/asm/ptrace.h:100:11: error: expected ';' before 'vo=
id'
> >   100 | asmlinkage void syscall_trace_exit(struct pt_regs *regs);
> >       |           ^~~~~
> >       |           ;
> >
> > git bisect pointed to c8171a86b274 ("csky: Fixup -Wmissing-prototypes w=
arning").
> >
> > Reverting the commit has fixed the build failure.
> >
> > I will be happy to test any patch or provide any extra log if needed.
> >
> > #regzbot introduced: c8171a86b27401aa1f492dd1f080f3102264f1ab
>
> #regzbot monitor:
> https://lore.kernel.org/all/202308120502.MXpchFC1-lkp@intel.com/

Sorry, Fixes have been sent, I'm waiting for it into the linux-next,
and then I will send 2nd pull request.

https://lore.kernel.org/linux-csky/20230830094653.2833443-1-guoren@kernel.o=
rg/

--=20
Best Regards
 Guo Ren
