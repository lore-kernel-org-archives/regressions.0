Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113D518FDA9
	for <regressions@lists.linux.dev>; Wed,  6 Nov 2024 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730905376; cv=none; b=BmKQQGa5AMgJgkQXshedpn7pFwfjvJSPcFKgEIYCOMDVU0dw5/OHhrXViKmYOvc0SlcfaEQcjxvmyb0BWFnw1wiHd8ssd6XVZ+hSWqxcUx1PR5qSo9k7+iPD3lJdwCD0aL3V2Y88Lp/xXI4xRDixkGChnCBIhL8xt69pGYG8Mek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730905376; c=relaxed/simple;
	bh=xt8xrg9Nw7zYftpN2TsUBqt+zTEi4h4vrGilPKIcQ6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqx7kNjOS69KEiBXnay5JOlkXkOKnNGxkyJswPsxAcD9D5od43pC+tyZkyk8+XYRH7cVXW2ZuQe6bKhdiwfb/m9TWLHF0Bgj2wSkeUJUEj3XdlceetaBva5jrHYdipDi2/TNflPQ4EMiBW3gVk3klL/LOU0K5MUg7GfBitjmhDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhEDbU6S; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhEDbU6S"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so9943391fa.0
        for <regressions@lists.linux.dev>; Wed, 06 Nov 2024 07:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730905373; x=1731510173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cTAkvAt1GTT5JhiHrne6cf0l+gqjvi/U391LxCXcj8=;
        b=dhEDbU6SVNxNc4s1KSl/BdoioE4ZrqulQFlGkr1VkwOpcRmdiZzvmD0SI4KIxgt/4d
         xbJhfDVqrHoS6K5oJTWVwN4mSt8zyJPzwWprvd/Kzbys/Hcy1vqlE6M/59b3epBvBiA/
         JSXVBZh7yfYGAPzCRP/hvFlVVddWBCCmbZo56yx9zkpfcBHuem90B+VwgQarI9hNICsz
         Uk4v/FfLA2UNOqwOvUROurWrGOyOuzCEtIiwOXc2o/1gCmq+tHye9QJLOo7kZECND3HT
         k48Fo/ZY7OxF7MHO4a3VqzvM0a3sFUOzOKDtiiCS+5wEGoTKzHxA7/vdH+45ZPGyUOpN
         l3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730905373; x=1731510173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cTAkvAt1GTT5JhiHrne6cf0l+gqjvi/U391LxCXcj8=;
        b=CMGsfHkbue/ym17OYOzPdmlDyl6ofAgyFk3DFd2k4S7aGlklNjL4VRlJ4H2FbYlFSD
         DqSOnrIhUfrxn5TDY9gniXBNExBHffhG+skyoM+/P0aifkGoSU0BLeZ1jF3P9MRQjwMq
         AJduMTpGg1wG8zryOyheQzcMEqjuEn2ZInEZRgL0ga25ds0XPVnzj/56Oe69uBiEicqi
         GZ/+5jfSYjGIs0QDZ8Ha81Sv+69GBqMkHFzkA8HZropwRGX3c4WsF2p8d3PomflpExze
         NISA8FmqYlZP6vFT05i+yAILQnOJqJClTKOmmS+ny/ROKo+5dh4yM/qUli9stY2UjXDR
         SPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAF1Ra2cX7T4IVWGzlgNxOYYy1vevBRtTI0LntIIhd2KsezfcjsBGBYFr4vBkB+PBZAqSCp0srP67WBw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+0QFQWjObA/b/7vBrFvqMlqVXbdTZW5x87mxenJGBYYJMTv4E
	Mfx6DrEGCbNBT31519FXtnY3P4sdAuRlzF5cXezbMzfIjLZlOOIpoDU73Rfn25jcIm0XtXsGaKR
	k5wqP1c/WrjEXt09EOxN6bludCU0=
X-Google-Smtp-Source: AGHT+IEpuEOm8iNLXsM5Gsl5m7y2iA3iKf6cj5kdBBIB3ggcJKBIi+dCCD3Lik87gcUJqjzCJ9xP6B4uwW/IS3T+Re8=
X-Received: by 2002:a05:651c:1590:b0:2f7:6371:6c5a with SMTP id
 38308e7fff4ca-2ff0cce821bmr9288271fa.16.1730905372761; Wed, 06 Nov 2024
 07:02:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <30f4b18f-4b96-403c-a0ab-d81809d9888a@gmail.com>
 <c09d4f5b-0c4b-4f57-8955-28a963cc7e16@leemhuis.info> <2024061258-boxy-plaster-7219@gregkh>
 <d5aa11c9-6326-4096-9c29-d9f0d11f83b4@leemhuis.info> <ZyMkvAkZXuoTHFtd@eldamar.lan>
 <ab5e25d8-3381-452e-ad13-5d65c0e12306@leemhuis.info> <CABBYNZKQAJGzA8th8A7Foiy7YaSFZDpLvLZqDFsVJ3Yzn8C_5g@mail.gmail.com>
 <Zypwz65wRM-FMXte@eldamar.lan> <2024110652-blooming-deck-f0d9@gregkh> <Zysdc3wJy0jAYHzA@eldamar.lan>
In-Reply-To: <Zysdc3wJy0jAYHzA@eldamar.lan>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 6 Nov 2024 10:02:40 -0500
Message-ID: <CABBYNZKz_5bnBxrBC3SoaGc1MTXXYsgdOXB42B0x+2dcPRkJyw@mail.gmail.com>
Subject: Re: Bluetooth kernel BUG with Intel AX211 (regression in 6.1.83)
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Mike <user.service2016@gmail.com>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, 
	Paul Menzel <pmenzel@molgen.mpg.de>, Sasha Levin <sashal@kernel.org>, 
	=?UTF-8?Q?Jeremy_Lain=C3=A9?= <jeremy.laine@m4x.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Salvatore,

On Wed, Nov 6, 2024 at 2:40=E2=80=AFAM Salvatore Bonaccorso <carnil@debian.=
org> wrote:
>
> Hi Greg,
>
> On Wed, Nov 06, 2024 at 08:26:05AM +0100, Greg KH wrote:
> > On Tue, Nov 05, 2024 at 08:23:59PM +0100, Salvatore Bonaccorso wrote:
> > > Hi Luiz,
> > >
> > > On Tue, Nov 05, 2024 at 12:53:50PM -0500, Luiz Augusto von Dentz wrot=
e:
> > > > Hi,
> > > >
> > > > On Tue, Nov 5, 2024 at 12:29=E2=80=AFPM Thorsten Leemhuis
> > > > <regressions@leemhuis.info> wrote:
> > > > >
> > > > > On 31.10.24 07:33, Salvatore Bonaccorso wrote:
> > > > > > On Tue, Jun 18, 2024 at 12:30:18PM +0200, Thorsten Leemhuis wro=
te:
> > > > > >> On 12.06.24 14:04, Greg KH wrote:
> > > > > >>> On Thu, Jun 06, 2024 at 12:18:18PM +0200, Thorsten Leemhuis w=
rote:
> > > > > >>>> On 03.06.24 22:03, Mike wrote:
> > > > > >>>>> On 29.05.24 11:06, Thorsten Leemhuis wrote:
> > > > > >>>>> [...]
> > > > > >>>>> I understand that 6.9-rc5[1] worked fine, but I guess it wi=
ll take some
> > > > > >>>>> time to be
> > > > > >>>>> included in Debian stable, so having a patch for 6.1.x will=
 be much
> > > > > >>>>> appreciated.
> > > > > >>>>> I do not have the time to follow the vanilla (latest) relea=
se as is
> > > > > >>>>> likely the case for
> > > > > >>>>> many other Linux users.
> > > > > >>>>>
> > > > > >>>> Still no reaction from the bluetooth developers. Guess they =
are busy
> > > > > >>>> and/or do not care about 6.1.y. In that case:
> > > > > >>>>
> > > > > >>>> @Greg: do you might have an idea how the 6.1.y commit a13f31=
6e90fdb1
> > > > > >>>> ("Bluetooth: hci_conn: Consolidate code for aborting connect=
ions") might
> > > > > >>>> cause this or if it's missing some per-requisite? If not I w=
onder if
> > > > > >>>> reverting that patch from 6.1.y might be the best move to re=
solve this
> > > > > >>>> regression. Mike earlier in
> > > > > >>>> https://lore.kernel.org/all/c947e600-e126-43ea-9530-0389206b=
ef5e@gmail.com/
> > > > > >>>> confirmed that this fixed the problem in tests. Jeremy (who =
started the
> > > > > >>>> thread and afaics has the same problem) did not reply.
> > > > > >>>
> > > > > >>> How was this reverted?  I get a bunch of conflicts as this co=
mmit was
> > > > > >>> added as a dependency of a patch later in the series.
> > > > > >>>
> > > > > >>> So if this wants to be reverted from 6.1.y, can someone send =
me the
> > > > > >>> revert that has been tested to work?
> > > > > >>
> > > > > >> Mike, can you help out here, as you apparently managed a rever=
t earlier?
> > > > > >> Without you or someone else submitting a revert I fear this wo=
n't be
> > > > > >> resolved...
> > > > > >
> > > > > > Trying to reboostrap this, as people running 6.1.112 based kern=
el
> > > > > > seems still hitting the issue, but have not asked yet if it hap=
pens as
> > > > > > well for 6.114.
> > > > > >
> > > > > > https://bugs.debian.org/1086447
> > > > > >
> > > > > > Mike, since I guess you are still as well affected as well, doe=
s the
> > > > > > issue trigger on 6.1.114 for you and does reverting changes fro=
m
> > > > > > a13f316e90fdb1 still fix the issue? Can you send your
> > > > > > backport/changes?
> > > > >
> > > > > Hmmm, no reply. Is there maybe someone in that bug that could cre=
ate and
> > > > > test a new revert to finally get this resolved upstream? Seem we
> > > > > otherwise are kinda stuck here.
> > > >
> > > > Looks like we didn't tag things like 5af1f84ed13a ("Bluetooth:
> > > > hci_sync: Fix UAF on hci_abort_conn_sync") and a239110ee8e0
> > > > ("Bluetooth: hci_sync: always check if connection is alive before
> > > > deleting") that are actually fixes to a13f316e90fdb1.
> > >
> > > Ah good I see :). None of those were yet applied to the 6.1.y series
> > > were the issue is still presend. Would you be up to provide the neede=
d
> > > changes to the stable team?  That would be very much appreciated for
> > > those affected running the 6.1.y series.
> >
> > We would need backports for these as they do not apply cleanly :(
>
> Looks our mails overlapped, yes came to the same conclusion as I tried
> to apply them on top of 6.1.y. I hope Luiz can help here.
>
> We have defintively users in Debian affected by this, and two
> confirmed that using a newer kernel which contains naturally those
> fixes do not expose the problem. If we have backports I might be able
> to convice those affected users to test our 6.1.115-1 + patches to
> verify the issue is gone.

Then perhaps it is easier to just revert that change?


--=20
Luiz Augusto von Dentz
