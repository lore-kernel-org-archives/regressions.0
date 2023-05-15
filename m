Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294B98469
	for <regressions@lists.linux.dev>; Mon, 15 May 2023 07:46:56 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-ba7327cd32eso4096490276.0
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 00:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684136815; x=1686728815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+sesuhYFb2sMrWYAczp8907eYFIY/Qn6ML1DW9XCIk=;
        b=K2GPf8rQ2rVbXA4G3KYwt3PN43rM6F5vie1bmgW+BP5ZmUi7AW9nTD7ZkeqHjlJjkn
         0q/+m84vZjijYcVXFCZsOfc5WfSDGelaKIoPUnprjtPqYVBecOT2px6ntzhsfCg9CL6K
         ShHiS6D4MDp6r0lHXMlYqId6VXnleC8MrkLBBnaIaAEZOR0gCgluuzxJqx3b262UejfA
         GXJvmwH2CQ2TBRsa2N8gsPTBKIuD4hC+SebI+tuauui3I1sItCLRPDrFeoTPJr1eMsez
         2hNwXhIaOpaaz+NDVRjmI8lwVpRZ3BJ91GZBuzhGKMzl5W7wZtSQCU1rxHyy+Ax3+p7L
         Hy6Q==
X-Gm-Message-State: AC+VfDwCSEctgeSF4Ke9b8oufTtFq5hnZ/5aCUrI6Ny3/DWUFneK1d/Z
	I439p9LC1CGOhMORpHJT8gtcoauwLo/KiA==
X-Google-Smtp-Source: ACHHUZ6NtpfOjoQ2P3vGPVRY/qWKDrbiDCZ51V7XaghajMXB9f3mkOm3MrPRwqiZIMQmhdNs7/ReSw==
X-Received: by 2002:a0d:d781:0:b0:55a:142e:b178 with SMTP id z123-20020a0dd781000000b0055a142eb178mr29957622ywd.50.1684136814806;
        Mon, 15 May 2023 00:46:54 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id w63-20020a0ded42000000b00561608bc0dfsm694494ywe.56.2023.05.15.00.46.53
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 00:46:53 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-ba7bf25a010so1294863276.3
        for <regressions@lists.linux.dev>; Mon, 15 May 2023 00:46:53 -0700 (PDT)
X-Received: by 2002:a25:d308:0:b0:b92:3ed2:1cae with SMTP id
 e8-20020a25d308000000b00b923ed21caemr33787915ybf.12.1684136812848; Mon, 15
 May 2023 00:46:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZElaVmxDsOkZj2DK@debian> <51cff63a-3a04-acf5-8264-bb19b0bee8a3@leemhuis.info>
 <CAHk-=wgzU8_dGn0Yg+DyX7ammTkDUCyEJ4C=NvnHRhxKWC7Wpw@mail.gmail.com>
 <20230510090527.25e26127@sal.lan> <55d5ec29-f30f-4596-a3b9-7e5b8adf0582@kernel.org>
In-Reply-To: <55d5ec29-f30f-4596-a3b9-7e5b8adf0582@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 May 2023 09:46:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=b8j=X3XEBWsAghsHrPT58xp7peaMiTZisqf7wRJf3w@mail.gmail.com>
Message-ID: <CAMuHMdV=b8j=X3XEBWsAghsHrPT58xp7peaMiTZisqf7wRJf3w@mail.gmail.com>
Subject: Re: mainline build failure due to cf21f328fcaf ("media: nxp: Add
 i.MX8 ISI driver")
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	"Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sun, May 14, 2023 at 1:01=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 10/05/2023 10:05, Mauro Carvalho Chehab wrote:
> > And another CI job testing bisect breakages as I receive pull requests,
> > applying patch per patch and using both allyesconfig and allmodconfig,
> > also on x86_64 arch with W=3D1:
> >
> >       https://builder.linuxtv.org/job/patchwork/
> >
> > The rule is to not merge stuff on media tree if any of those jobs
> > fail. I also fast-forward merging patches whose subject states that
> > the build has failed.
> >
> > In order to help with that, on normal situation, I usually take one wee=
k
> > to merge stuff from media_stage into media_tree, doing rebases at
> > media_stage if needed to avoid git bisect build breakages at media_tree
> > (which is from where I send my update PRs to you).
> >
> > Unfortunately, currently we don't have resources to do multiple randcon=
fig
>
> Is you media staging tree included in LKP (kernel test robot)? You would
> get huge build coverage after every push to your staging repo.

As (multiple[*[) fixes for the build issues were submitted before the
opening of the merge window, there must have been some build coverage,
with even some people acting upon it...

[*] General note, not limited to media: please apply build fixes and
    regression fixes ASAP, to avoid multiple people running into the
    same issues, and spending time on bisecting, investigating,
    fixing, ...
    Thanks a lot!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
