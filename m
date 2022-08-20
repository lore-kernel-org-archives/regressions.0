Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092B56113
	for <regressions@lists.linux.dev>; Sat, 20 Aug 2022 01:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9801C433B5
	for <regressions@lists.linux.dev>; Sat, 20 Aug 2022 01:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660957488;
	bh=/+ZC0w82kc/bfDuYBIgG/HR+pney7i1yXva3ldnJsgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Nqrf7/wprdMflE6z7u3/RsY/8GlHVm0ErKB266r85igMtX+wGaWRjA5jX9bmQ6ms1
	 JZnmDLzscLdh/ESskjXJt5cU/QrapTi75ZHM+xHDmFjQuApJD8QErjZ8jvM1aM/KO4
	 wsh9/zsMdP6Rb8lSetTusajeyQpNsleXOcpqS6VOI2sc84io31YoDrM03gRjIAO4zR
	 lsV4ALl/GfTzRIoLI8DbB2eke2BLyJZXXG9N/XypG9wXA/+AzHaIhGIbBMqeGn593C
	 YKsJAtkSltbYgULkrCi9f5rGXvfhb6TruhAzyzGayLqn/oe4uc7NhmaTZ3metZKn9B
	 ChVu310QMOuUA==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-335624d1e26so162918487b3.4
        for <regressions@lists.linux.dev>; Fri, 19 Aug 2022 18:04:48 -0700 (PDT)
X-Gm-Message-State: ACgBeo0jpwu56UqvQgwAbJkis3eZIzLeg9fx0W5xmsClMMV06+dNkkom
	VrYHwJJ6hBwfGEZTsXMh+2I/zbTlHGsrcRj204o=
X-Google-Smtp-Source: AA6agR7+9THx7w6NR2eGp9SXeAJVzTaUBuGXj6rYMP1Mivt8CtTu5kKiRiMhoIy3tpqheVPCJg35nk+7wp3SWDlhDQU=
X-Received: by 2002:a81:63c3:0:b0:323:ce27:4e4d with SMTP id
 x186-20020a8163c3000000b00323ce274e4dmr10313901ywb.472.1660957487793; Fri, 19
 Aug 2022 18:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <000401d8a746$3eaca200$bc05e600$@whissi.de> <000001d8ad7e$c340ad70$49c20850$@whissi.de>
 <2a2d1075-aa22-8c4d-ca21-274200dce2fc@leemhuis.info> <0FBCAB10-545E-45E2-A0C8-D7620817651D@digitalocean.com>
 <CAPhsuW5f9QD+gzJ9eBhn5irsHvrsvkWjSnA4MPaHsQjjLMypXg@mail.gmail.com>
 <43e678ca-3fc3-6c08-f035-2c31a34dd889@whissi.de> <701f3fc0-2f0c-a32c-0d41-b489a9a59b99@whissi.de>
 <0192a465-d75d-c09a-732a-eb2215bf3479@whissi.de>
In-Reply-To: <0192a465-d75d-c09a-732a-eb2215bf3479@whissi.de>
From: Song Liu <song@kernel.org>
Date: Fri, 19 Aug 2022 18:04:36 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6yLLcj3GtA+4mUFooQmfGo3cVTYn-xBEY2KuP1wwmQNA@mail.gmail.com>
Message-ID: <CAPhsuW6yLLcj3GtA+4mUFooQmfGo3cVTYn-xBEY2KuP1wwmQNA@mail.gmail.com>
Subject: Re: [REGRESSION] v5.17-rc1+: FIFREEZE ioctl system call hangs
To: Thomas Deutschmann <whissi@whissi.de>
Cc: Vishal Verma <vverma@digitalocean.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 18, 2022 at 7:46 PM Thomas Deutschmann <whissi@whissi.de> wrote:
>
> On 2022-08-17 20:29, Thomas Deutschmann wrote:
> > I will do another round with 2b7196a219bf (good) <-> 5.18 (bad).
>
> ...and this one also ended up in
>
> > first bad commit: [fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf] Linux 5.16-rc1
>
> Now I built vanilla 5.18.18 and fsfreeze will hang after FIFREEZE ioctl
> system call after running my reproducer which generated I/O load.
>
> => So looks like bug is still present, right?
>
> When I now just edit Makefile and set KV <5.16-rc1, i.e.
>
> > diff --git a/Makefile b/Makefile
> > index 23162e2bdf14..0f344944d828 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  VERSION = 5
> > -PATCHLEVEL = 18
> > -SUBLEVEL = 18
> > +PATCHLEVEL = 15
> > +SUBLEVEL = 0
> >  EXTRAVERSION =
> >  NAME = Superb Owl
> >
>
> then I can no longer reproduce the problem.
>
> Of course,
>
> > diff --git a/Makefile b/Makefile
> > index 23162e2bdf14..0f344944d828 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  VERSION = 5
> > -PATCHLEVEL = 18
> > -SUBLEVEL = 18
> > +PATCHLEVEL = 15
> > +SUBLEVEL = 99
> >  EXTRAVERSION =
> >  NAME = Superb Owl
> >
>
> will freeze again.
>
> For me it looks like kernel is taking a different code path depending on
> KV but I don't know how to proceed. Any idea how to continue debugging this?

Hmm.. does the user space use different logic based on the kernel version?

I still cannot reproduce the issue. Have you tried to reproduce the
issue without
mysqld? Something with fio will be great.

Thanks,
Song
