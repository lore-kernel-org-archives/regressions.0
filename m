Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5883863BE
	for <regressions@lists.linux.dev>; Thu,  5 Oct 2023 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WreirQsF"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-505748580ceso955853e87.3
        for <regressions@lists.linux.dev>; Thu, 05 Oct 2023 02:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696499988; x=1697104788; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHh0oBhZAG630AHNboT2hexNbuam5K6tY+jffHRgTKc=;
        b=WreirQsFFX223oKUQBmY+kdyavXMm9zGXxvVgRSi7IM0zvEL+v+lzoDJCO6EZpQxPy
         2oj0Z3gIDTbLodT/PLkl8pDkXDJEIhC2CUYcO3Kgl4iKgzvzrynqdu+4n+b1aJmiZnMe
         qNpSmEXY33/hm874Y7g+H0VsUzEiGpkfW+vzX/wDYrSiK1aKuKDVxZIgHMylYl3jlsxc
         /5hr/nqz8FqsMr5hKEX6xMpPUZSCcmKr4+1/8bBSdTaPcEQcWnEUkSyswtBt1QL1NmJL
         HI929xpf/7CLJgl6G/c9KxW/8Rd7fi2fHMgOHJBrf03BCxV61aLrZNci8qfoa2qok8Sk
         2npA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696499988; x=1697104788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHh0oBhZAG630AHNboT2hexNbuam5K6tY+jffHRgTKc=;
        b=YY1I8df8+yvBxKr2VWfu2ekim1J5nsWBulo0XfuAaTiCPGB8bhjJgI28V+VclzpBO1
         F5GPNt6JUziCwHbWKQEDWxh/38bBqsnB+E0FXw+l75jPkWLdmNe+RElJ5T44EwISo95j
         deXayxfpyMX0YtZ67IrttAh8xYQiPsmLZsyESQqCDaEkIhYnDiltRAL3buyA9afR4g2a
         0k/LZY6lGxZDiXmY73m0YiEbN4URSWYd+yF1QAJeEAvtpWW48Q/hVrq3H2SaND7fOgdU
         bi/PdFox48RqFX7ahGGX1NcyW5VzLM2gRfateKBVRjQBVbuln5zCzEy86SvJftEvbaVa
         yRrg==
X-Gm-Message-State: AOJu0YyR2gc4cYEUG2RKX6jqhVkOJ7FbRT3ctUmBMqOrOXU57cc1lsnp
	I8sZWT80JhOASEcaxqSrrDBiiFFLP5sWnobbHXA=
X-Google-Smtp-Source: AGHT+IFPACz7sGrDxBezV8qEBr3BzG13f2a87qwimWoz1maBHX2sPJvKE9svxA7G7+G6Ym0GhIJpzXKiz5DHQo/FB0E=
X-Received: by 2002:a05:6512:3a83:b0:505:7360:6023 with SMTP id
 q3-20020a0565123a8300b0050573606023mr5442022lfu.39.1696499987978; Thu, 05 Oct
 2023 02:59:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO+kfxTwOvaxYV0ZRESxZB-4LHsF9b_VBjAKahhwUm5a1_c4ug@mail.gmail.com>
 <ZPfPfyIoVxw5L6El@debian.me> <CAO+kfxQgXOsx6u+xLKGJe0KDiFsRAGstSpnrwxjQF6udgz5HFQ@mail.gmail.com>
 <CAO+kfxTvA6N=i+jGf0XbSyqf85i=q+vR6R9d_42OWfM2sWWXaA@mail.gmail.com>
 <CAH2r5mtUedfLSv81Z-Yb3_=AbD_QpT3tVbU1PRzMTituaw7bgA@mail.gmail.com>
 <CAH2r5mt6YzapEKDo=hQ64yvBn7=jwMmY1c85NOABKcMPKPp3KA@mail.gmail.com>
 <CAO+kfxQtOKoKdb+LtMeFxgu8VXa73nbmTPSfscbdwjUXM7ME_A@mail.gmail.com>
 <CAH2r5msNf9WDHrBZSi5FhHDSewSNxMAuXTetMJDnoNh3CF_oMA@mail.gmail.com>
 <a895f860-11fa-e6d9-d042-a32bd08f9e9d@talpey.com> <CAH2r5mszCxPtdURenMVgeVDX5zc8knumH=ASXyUufPa7SxbJBw@mail.gmail.com>
 <ZRN9MtBqYnT6oX60@vaarsuvius> <85d538fec5a086acf62d5a803056586a6c00e4bd.camel@uniklinik-freiburg.de>
In-Reply-To: <85d538fec5a086acf62d5a803056586a6c00e4bd.camel@uniklinik-freiburg.de>
From: Steve French <smfrench@gmail.com>
Date: Thu, 5 Oct 2023 04:59:36 -0500
Message-ID: <CAH2r5msDEs5Wi1aGc7KSDXXJv6FT_a5XmzM9oH-AnAWg2jCvTg@mail.gmail.com>
Subject: Re: Possible bug report: kernel 6.5.0/6.5.1 high load when CIFS share
 is mounted (cifsd-cfid-laundromat in"D" state)
To: "Dr. Bernd Feige" <bernd.feige@uniklinik-freiburg.de>
Cc: "tom@talpey.com" <tom@talpey.com>, "paul@darkrain42.org" <paul@darkrain42.org>, 
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>, "bagasdotme@gmail.com" <bagasdotme@gmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "pc@manguebit.com" <pc@manguebit.com>, 
	"ronniesahlberg@gmail.com" <ronniesahlberg@gmail.com>, 
	"nspmangalore@gmail.com" <nspmangalore@gmail.com>, "brian.pardy@gmail.com" <brian.pardy@gmail.com>, 
	"bharathsm@microsoft.com" <bharathsm@microsoft.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FYI - Paulo is looking at an additional patch to address this (and one
small patch was also just added)

On Thu, Oct 5, 2023 at 4:55=E2=80=AFAM Dr. Bernd Feige
<bernd.feige@uniklinik-freiburg.de> wrote:
>
> Am Dienstag, dem 26.09.2023 um 17:54 -0700 schrieb Paul Aurich:
> > Perhaps the laundromat thread should be using msleep_interruptible()?
> >
> > Using an interruptible sleep appears to prevent the thread from
> > contributing
> > to the load average, and has the happy side-effect of removing the
> > up-to-1s delay
> > when tearing down the tcon (since a7c01fa93ae, kthread_stop() will
> > return
> > early triggered by kthread_stop).
>
> Sorry for chiming in so late - I'm also on gentoo (kernel 6.5.5-
> gentoo), but as a client of Windows AD.
>
> Just want to emphasize that using uninterruptible sleep has not just
> unhappy but devastating side-effects.
>
> I have 8 processors and 16 cifsd-cfid-laundromat processes, so
> /proc/loadavg reports a load average of 16 on a totally idle system.
>
> This means that load-balancing software will never start additional
> tasks on this system - "make -l" but also any other load-dependent
> system. Just reducing the number of cifsd-cfid-laundromat processes
> does not fix this - even a single one makes loadavg report a wrong
> result for load balancing.
>
> So, if cifsd-cfid-laundromat must really be uninterruptible, the only
> solution would be to change the way loadavg is computed by the kernel
> to exclude uninterruptible but sleeping processes. But must it be
> uninterruptible?
>
> Thanks and best regards,
> Bernd



--=20
Thanks,

Steve
