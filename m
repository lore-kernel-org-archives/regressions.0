Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCC07F7
	for <regressions@lists.linux.dev>; Tue,  4 Apr 2023 06:57:56 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id i6so37532422ybu.8
        for <regressions@lists.linux.dev>; Mon, 03 Apr 2023 23:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680591475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMUOBSmsf+P2tOaipYQIbA2HBuBLhKgLLhCNUMVXeeQ=;
        b=3xomy6GrFhn51kLcM21ct3pANGXVuvmafYy2u+16m5bqwcgoFJ1Fmuc8VHfN0lSbzg
         6xsmblx47xSP+RXL62NFypumpvxJevDMnlw8OPHx9P1z+c1yRRMm3o1jDL4GrwE4jvxX
         Fod3BWgt+ARK8SsEBVxATBONODKPpPxEc/VHHxgiTqs100TQN+2rVdcw8LG6FdJZKKAw
         bccPBLLVDFInsT7g8YPao48Org0OROHAJcwFrf6VnVpXa0sBTkP2d30yfDdrkEd3RTud
         vf9fyDImAppiIxxYfMGT1uap/FNQWRNAFVv5Gx3IQ3g5WMaaiK0+sRFI51dDVIlxMoJ/
         C+BQ==
X-Gm-Message-State: AAQBX9dNnsp1R+X2pJ1vLKUjV7ztuhpOOGy8e6JmDOpTrj+yoi4Bc24H
	MkrNirSAgBCNL2TlxRHKjkdis+BCyvD66XsI
X-Google-Smtp-Source: AKy350aoRVxqAv7bnj9zp2q5CGd8KuFyZaM863gjkvG4g3ptkZOgy0Sf5lPicwxMoCROjvq2EOnbbg==
X-Received: by 2002:a05:6902:1545:b0:b8b:c9fd:8cf2 with SMTP id r5-20020a056902154500b00b8bc9fd8cf2mr48417ybu.44.1680591475550;
        Mon, 03 Apr 2023 23:57:55 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id z6-20020a254c06000000b00b7767ca7490sm3103356yba.45.2023.04.03.23.57.55
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 23:57:55 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id j7so37530476ybg.4
        for <regressions@lists.linux.dev>; Mon, 03 Apr 2023 23:57:55 -0700 (PDT)
X-Received: by 2002:a25:ca4b:0:b0:b77:d2db:5f8f with SMTP id
 a72-20020a25ca4b000000b00b77d2db5f8fmr1190961ybg.12.1680591474911; Mon, 03
 Apr 2023 23:57:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q> <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
In-Reply-To: <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Apr 2023 08:57:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6OOHXCB9pw-iO+ajHVP6eJwzK8mUTE5N4AKRXdNj66w@mail.gmail.com>
Message-ID: <CAMuHMdX6OOHXCB9pw-iO+ajHVP6eJwzK8mUTE5N4AKRXdNj66w@mail.gmail.com>
Subject: Re: Introducing bugbot
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, workflows@vger.kernel.org, aros@gmx.com, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 4, 2023 at 8:03=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis.in=
fo> wrote:
> On 03.04.23 23:45, Konstantin Ryabitsev wrote:
> > Per our discussion last fall, I've been working on a bridge between bug=
zilla
> > and public-inbox, which went live in the past few days. It's still a ve=
ry
> > early release, but it can do the following:
>
> thx for working on this.

Thx indeed, looks nice!

> >    New bugs will be created in the Linux/Kernel component of Bugzilla, =
but
> >    they can then be reassigned to any other component. As long as they =
remain
> >    open, bugbot will continue tracking threads for new messages until e=
ither
> >    the bug is closed, or it has been over 30 days since any activity on=
 the
> >    bug.
>
> 30 days from my experience sounds too short for me (but I have no hard
> numbers to back this up). I would have gone for 90 days, but I guess
> that would create too much load?

30 < release cycle (9..10 weeks) < 90, so 90 days sounds better to me.

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
