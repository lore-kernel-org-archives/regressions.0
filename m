Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88E920F9
	for <regressions@lists.linux.dev>; Mon,  8 May 2023 16:27:48 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-50bcb229adaso9027479a12.2
        for <regressions@lists.linux.dev>; Mon, 08 May 2023 09:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1683563266; x=1686155266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVAb8RwSaMOd+9poMiDAevwfkVDh6+GTnWJJXhYlKlU=;
        b=e8JGtPmLkYYwvJvBu5i4aqFu9fcudhyLRfOZVCQVUdVCzNdixsVzU05fQi78JBmV3p
         J7LqkeXDs1Q0EiAnFHpLpNn2DQKnApt405C9psxCRVKJ53+5Sb2RRG1IzN+mXVAq33wj
         YzeYc2SC2VMssxD9nAsOMSVBECU0T1Kk3GmyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683563266; x=1686155266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVAb8RwSaMOd+9poMiDAevwfkVDh6+GTnWJJXhYlKlU=;
        b=OUn5bdbpArqp6XUinfRPGjmK5bJGGS6EwL8R2FYMyCqhG/44SE+MZSq1nVMpMR6bPK
         lSMQ2vXgic35ojeefzqKmZ3HptW+4vLkp5eVdPKOBpTiQltRE1PKyaLMJcnkLtNXBGBe
         3sPiEGuIH/tfC6HfwkPyQJ5sfAf+AgXxqQsztFUJEwMhN16GwZ2VJ1x4Jek8/goteHhZ
         5yJp8Mu3KHLqMvbRja1mzB93PmYEESuDyeZS8zqEHxv25BJJMYe/CrHwx0fsFWAgudgq
         3cfwHWRXMcZuj6azGo68L6qdaI24N2Q3Qht4NKrbZjK0cBdNG8t8cceQ++02HSx2Oa0Y
         O7VA==
X-Gm-Message-State: AC+VfDwOEnkCjAmurJKD7JgBraM7lXviBtc4uKMHbl9ToTEATFUM5U9p
	ZV5nMk1V+C3YXfIu/xl34eTkEeInlTRl6gUFCvDgSg==
X-Google-Smtp-Source: ACHHUZ4MubsWhDnJHaqH5geOh9HZFAvnCEMXhGVHDnRxmRQndLOSjWVJlRzg4lWv03LnWghhjNqUqw==
X-Received: by 2002:a17:907:9482:b0:968:4d51:800b with SMTP id dm2-20020a170907948200b009684d51800bmr2203525ejc.1.1683563266549;
        Mon, 08 May 2023 09:27:46 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id ib10-20020a1709072c6a00b009531d9efcc4sm156038ejc.133.2023.05.08.09.27.45
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 09:27:45 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-965fc25f009so563709566b.3
        for <regressions@lists.linux.dev>; Mon, 08 May 2023 09:27:45 -0700 (PDT)
X-Received: by 2002:a17:907:8692:b0:967:142b:ff07 with SMTP id
 qa18-20020a170907869200b00967142bff07mr3121227ejc.21.1683563265068; Mon, 08
 May 2023 09:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZElaVmxDsOkZj2DK@debian> <51cff63a-3a04-acf5-8264-bb19b0bee8a3@leemhuis.info>
In-Reply-To: <51cff63a-3a04-acf5-8264-bb19b0bee8a3@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 8 May 2023 09:27:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgzU8_dGn0Yg+DyX7ammTkDUCyEJ4C=NvnHRhxKWC7Wpw@mail.gmail.com>
Message-ID: <CAHk-=wgzU8_dGn0Yg+DyX7ammTkDUCyEJ4C=NvnHRhxKWC7Wpw@mail.gmail.com>
Subject: Re: mainline build failure due to cf21f328fcaf ("media: nxp: Add
 i.MX8 ISI driver")
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 8, 2023 at 3:55=E2=80=AFAM Linux regression tracking #adding
(Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>
> Thanks for the report. The fixes (see the mail from Laurent) apparently
> are still not mainlined (or am I missing something?), so let me add this
> report to the tracking to ensure this is not forgotten:

Gaah. I was intending to apply the patch directly before rc1, but then
I forgot about this issue.

Mauro: I'm currently really *really* fed up with the media tree. This
exact same thing happened last merge window, where the media tree
caused pointless build errors, and it took way too long to get the
fixes the proper ways.

If something doesn't even build, it should damn well be fixed ASAP.

Last release it was imx290.c and PM support being disabled, and I had
to apply the fix manually because it continued to not come in the
proper way.

See commit 7b50567bdcad ("media: i2c: imx290: fix conditional function
defintions").

But also see commit b928db940448 ("media: i2c: imx290: fix conditional
function definitions"), which you *did* commit, but note this on that
commit:

    AuthorDate: Tue Feb 7 17:13
    CommitDate: Sat Mar 18 08:44

so it took you a MONTH AND A HALF to react to a build failure.

And see this:

    git name-rev b928db940448
    b928db940448 tags/v6.4-rc1~161^2~458

ie that build fix that you finally committed came in *AFTER* the 6.3
release, even though the bug it fixes was introduced in the 6.3 merge
window:

    git name-rev 02852c01f654
    02852c01f654 tags/v6.3-rc1~72^2~2^2~193

and now we're in the *EXACT*SAME* situation, with me applying a build
fix directly, because you couldn't get it fixed in a timely manner.

End result: you and the media tree is on my shit-list, and I will not
take any pull requests from you that aren't just fixes.

Not just this release, but the next one.

Because I'm completely and utterly fed up with you ignoring
fundamental "it doesn't even build" issues.

If you can't be bothered fix the build issues that get introduced
during the merge window, then I'm not going to merge new stuff from
you.

It's *that* simple.

                  Linus
