Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E45A17E0
	for <regressions@lists.linux.dev>; Tue, 19 Nov 2024 14:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732025125; cv=none; b=ViZTmAeB4XssSkd9xvRNzjpZFAFyRHLzNsB2a3zJQTmnyVltuVBZCAYB9H/MbeI0RHq2zgq7mZ8d6khzbxrvdvuzlYlw+Q21j8r2avyWbt8cmrJsdFZBBb3AlGd4GF9riNmtFhOK3bifGrXLLnVU0T6wV6kPskv8WlT2v5xTU8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732025125; c=relaxed/simple;
	bh=CJ8MaQ6Pc80WIqscYCu1eno+cbsbvM0V81tsiR9K60g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bKCLMo5gAPX5zx3px8uRzla3r5LG3TbtWGFXQXCjMK9rOuY+uta/mV3zhzy/tk9IVfvzoqVZJ90mjhUD0MyElPowB+a9MW89r0SjssNBleoLsbwoQfL0uA8VdNKu/3bJ0ik5bIYXwg7vxnRs8tFCKDat5IKH5sHnQyhRqQraqXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIGJG9f/; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIGJG9f/"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7f8b01bd40dso3825683a12.0
        for <regressions@lists.linux.dev>; Tue, 19 Nov 2024 06:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732025123; x=1732629923; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBPalY9b5mWlkTSpEFxpCuN7/q0yodTJdlXJYJftjf4=;
        b=ZIGJG9f/HLDHfIiw+JZBOc42AALiasBIsQWcyPmtJLqThB0aUas+VobfOMYrQI14fq
         7/o36WAghGgxUw8HxS7mCNLOO3m9ZzIJ7CO5pBs5FqOGEd6mZPxrEvIxSuGusn30x8H8
         iZJH3pF8yUEGDR9mUGIv7F/LT50uX6UdQFCzvzq7Mbyx9mXIUHXpmsAB5ltpuw2VFqRR
         KkstNkxnNHSY8/IEAn78qnZjPa9A0U2l4jwD65WGPivN/evwRS3FtO4kn8w8guamGwvI
         lK0mNRvfmgAy9H6D+ncYpi7iE8SMQt1YLK7rz1il18XjS2j4ulMKXxQn19BFD4NkxXsX
         U3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732025123; x=1732629923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBPalY9b5mWlkTSpEFxpCuN7/q0yodTJdlXJYJftjf4=;
        b=m6mENky1bFPdZsovWOo6IID8/nWM4HnCjTh1mKpkxfpcZh8ZP1av4fWVaSiA6V70KO
         4eHTFmKW35DZY/tSdKV63RbPrwQiBa9ZSnfysK2rz3IxgrBPBDGuNebAAIv/twDvm8IJ
         53oO7KYQZOxAP4L9b5do5QztVBqhlUnUm+Tv7YCwYunj6EAkAyMGxBvPRai4TU3aDFUd
         SUVgci1EvsSJzv0DcbMeHLmKhjLxWuR0jK6jGGY3ZZdo+f4jWqhBHfmvmhy82eX0el/s
         /JGTuGx4pQipposynZCiDNHUgqYNsei8tNPhorHi9juLuAVWOydx8M9ZrU0N+uxPfDo1
         Kg3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNFGJT/+97dE7rHM8ESK83K0mzezbqXVcaFDRU2QuNpAKxP+LjQxejpvI6NUDywkcVtuEYdHnEMdrpuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnJA++y2FsxvBYX6QS+ncABDojAJ7X8DnTFSMNh+x+WD5pzH/I
	R0IWxem8KAMsPVCXBzi8oeGBiDXsBTT637mdOo6npoNKfVEceZ8Y1STSMBZI6ehTYwerDvsiufS
	ZMfynLFkuCjYklHCXKF+ZOu10mJY=
X-Google-Smtp-Source: AGHT+IHky1OvgLHwzwgiLW/QNIajFXu1TBxWI4HEOm7TpfDRvYiij2GU3eyxjDv2GEFkYwJe1zG3oZP6GKeX5/y0ZtE=
X-Received: by 2002:a17:90b:1809:b0:2e0:7b03:1908 with SMTP id
 98e67ed59e1d1-2eaaa78b464mr5012734a91.10.1732025123370; Tue, 19 Nov 2024
 06:05:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241007132555.GA53279@francesco-nb> <20241112075958.GA8092@francesco-nb>
 <20241112092054.GA18139@francesco-nb> <CAA+D8AO3a5WsZ4=V-9CDifDZYjJjwQmQQDDQM7ZKgZ6_-CNDPA@mail.gmail.com>
 <Zzde9xS0zGJhcoUb@gaggiata.pivistrello.it> <CAA+D8AMx14hp51aH7Y=Sgu+X+_KxQ8zdJdrQHFY84nKtQsKKrw@mail.gmail.com>
 <20241119112201.GA17768@francesco-nb>
In-Reply-To: <20241119112201.GA17768@francesco-nb>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 19 Nov 2024 08:05:12 -0600
Message-ID: <CAHCN7x+AU9-xiZo4-Lu2A_0M5XaEYgYtQbumFkmpvJ2AAbj0rg@mail.gmail.com>
Subject: Re: clk_imx8mp_audiomix_runtime_resume Kernel panic regression on v6.12
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, abelvesa@kernel.org, peng.fan@nxp.com, 
	mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Mark Brown <broonie@kernel.org>, 
	ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 5:22=E2=80=AFAM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> Hello Shengjiu,
>
> On Tue, Nov 19, 2024 at 05:35:36PM +0800, Shengjiu Wang wrote:
> > On Fri, Nov 15, 2024 at 10:47=E2=80=AFPM Francesco Dolcini <francesco@d=
olcini.it> wrote:
> > >
> > > On Fri, Nov 15, 2024 at 11:13:58AM +0800, Shengjiu Wang wrote:
> > > > On Tue, Nov 12, 2024 at 5:20=E2=80=AFPM Francesco Dolcini <francesc=
o@dolcini.it> wrote:
> > > > >
> > > > > On Tue, Nov 12, 2024 at 08:59:58AM +0100, Francesco Dolcini wrote=
:
> > > > > > On Mon, Oct 07, 2024 at 03:25:55PM +0200, Francesco Dolcini wro=
te:
> > > > > > > it seems that an old regression is back on v6.12, reproduced =
on -rc2
> > > > > > > (not sure about rc1).
> > > > > > >
> > > > > > > The original report is from https://lore.kernel.org/all/20240=
424164725.GA18760@francesco-nb/
> > > > > > > and it was fixed with https://lore.kernel.org/all/1715396125-=
3724-1-git-send-email-shengjiu.wang@nxp.com/.
> > > > > > >
> > > > > > > Is it now back?
> > > > > >
> > > > > > I was able to reproduce this issue once more, this time with 6.=
11.7.
> > > > > > As I wrote in another email the issue is not systematic as it u=
sed to
> > > > > > be.
> > > > > >
> > > > > > Any idea?
> > > > >
> > > > > Frank, Shengjiu, could it be that the udelay(5) in imx_pgc_power_=
up() is
> > > > > too short and therefore we have such non-systematic failures?
> > > > >
> > > >
> > > > Francesco,  it seems hard to reproduce it on my i.MX8MP-EVK board.
> > > >
> > > > If it is easy to reproduce on your side, you can try to enlarge the=
 delay
> > > > time to see if there is any improvement.
> > >
> > > It's hard also for me to reproduce, we just have a relatively extensi=
ve
> > > test farm and 2 times it happened while doing unrelated tests. I was =
hoping we
> > > could have some idea on what's going on, I'll see if I can put togeth=
er some
> > > kind of stress test, being able to reproduce it more systematically w=
ould
> > > certainly help.
> > >
> >
> > With my test,  the issue reproduced with delay 5us/6us. but hard reprod=
uced
> > with 7us.
> > I think we may need to use a delay of 10us for safety.
>
> Great that you were able to narrow this down and confirm the issue.
> I wonder if you would have any information on what is the actual delay
> that the HW would need, instead of guessing numbers. If not, well, let's
> go with 15usec, or 10usec, your call in the end.
>
> Will you send a patch?

Peng (or anyone from NXP),

Do any of the clock speeds have an impact on the propagation time?
If the clocks are running at overdrive speeds vs nominal speeds vs
underclocked, could this time be adjusted accordingly somehow?

adam

>
> Francesco
>
