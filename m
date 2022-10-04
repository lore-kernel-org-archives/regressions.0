Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0285C210D;
	Tue,  4 Oct 2022 09:20:46 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id j8so8375683qvt.13;
        Tue, 04 Oct 2022 02:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Y+//hU1Yc4LQ2dGbJVOgmvwKDPAT2yhj8ciBdV7pT7o=;
        b=uCQm0XObJyt7+3jg86/Pyub2Ahzr2t/COKuupFVno1YGccwjrLWgodIVlukE8j9srQ
         mgZFvvriKfDAuxYtouO+6sfgoTlsynDuEZrynSrhGNQ4mU0FxYnENmzVIK/letSjvi8h
         5KPRXAp+CntcjKvXqYr7AjjlEmIxoXVud7GRPH2V5uaJxEIR48aKNf6kfMA1REcj4Vmf
         OmatYDMutaSHKuYkclV51Me32rpyUvrAJf1xaznqXcQlqgJCNsrurShMc9BzRconU6A8
         C95dMhPFTlwrc/1tysmVGGtVdW7rIWDQME5kAwOgDK4xDmJ/6KkzqF6jahFfT7cZQVPk
         gMrQ==
X-Gm-Message-State: ACrzQf2okullSpFY+Rh5apPFamluTKV00pHEMZge3ui1IZYf+mqO8Azf
	DdKukkL+NroRvLo78irl05s6bZ5NdBXbpA==
X-Google-Smtp-Source: AMsMyM7a1iWv+JJrYhSiZ4jtK8yGcTf+jtaV1w4Kzm+Y6CZKocQO/WDGRo1CaSDLJxR2OyjfKfrVzA==
X-Received: by 2002:a05:6214:f09:b0:4b1:7991:e846 with SMTP id gw9-20020a0562140f0900b004b17991e846mr11610349qvb.44.1664875245762;
        Tue, 04 Oct 2022 02:20:45 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id y4-20020a37f604000000b006bbc09af9f5sm13324076qkj.101.2022.10.04.02.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 02:20:45 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 81so8697516ybf.7;
        Tue, 04 Oct 2022 02:20:44 -0700 (PDT)
X-Received: by 2002:a5b:104:0:b0:6b0:429:3fe9 with SMTP id 4-20020a5b0104000000b006b004293fe9mr24063004ybx.543.1664875244639;
 Tue, 04 Oct 2022 02:20:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info> <63a8403d-b937-f870-3a9e-f92232d5306c@leemhuis.info>
 <534EB870-3AAE-4986-95F3-0E9AD9FCE45B@sladewatkins.net> <e9dd6af0-37ef-1195-0d3b-95601d1ab902@leemhuis.info>
 <20221003112605.4d5ec4e9@gandalf.local.home> <eb935178-995b-84f1-6cbe-3492ba74f85b@leemhuis.info>
In-Reply-To: <eb935178-995b-84f1-6cbe-3492ba74f85b@leemhuis.info>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Oct 2022 11:20:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWq+NntrPqMHzP3XEvKZgjEwSHW80vwWkZnaTORRrhpHA@mail.gmail.com>
Message-ID: <CAMuHMdWq+NntrPqMHzP3XEvKZgjEwSHW80vwWkZnaTORRrhpHA@mail.gmail.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Steven Rostedt <rostedt@goodmis.org>, Slade Watkins <srw@sladewatkins.net>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, "Artem S. Tashkinov" <aros@gmx.com>, workflows@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten,

On Tue, Oct 4, 2022 at 10:41 AM Thorsten Leemhuis <linux@leemhuis.info> wrote:
> But I consider explaining things like bisection and localmodconfig in
> the documentation as also important, as that's likely something the tool
> won't be able to automate any time soon (or never, as realizing that is
> likely hard and better left to a separate tool anyway).

Creating a simple Linux-specific wrapper around git bisect under
scripts/ might be useful?
The wrapper could copy .config to
$(srctree)/arch/$(ARCH)/config/bisect_defconfig, automatically run
"make bisect_defconfig" in each step, and show not only the bisected
commit, but also the impact on .config.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
