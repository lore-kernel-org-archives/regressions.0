Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818714084E
	for <regressions@lists.linux.dev>; Wed, 12 Jun 2024 18:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718216974; cv=none; b=jXFyPYkfaOqXF0rTEeOnt2BVWLK++jdShOfahlPCPVX7uqd44417WbGe6Yhc4bo1aGXjeslFf4P0N8g9x9Be8vzgN1k0F++tbK/qBqqgOKntAPNCxJ7hJhNdu9DNJBtpWEwad6ltO8CG/+v+DmacaCCT02PBb+QpIk0psbbiMXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718216974; c=relaxed/simple;
	bh=OmrPRsVW/SqHsQ62oU68f2r5XqKqs5zc1yIXlgibcIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssOLY+K348ine7Cf3lArNJl4I6X6ynKbRj2RCvvzB6ByK0JW/LrsUwhg4NHXhy5duO1/GrjLw68QTYse9LnKs6b7zMVSmSPQ1GTX7c9bg7brgPsd6Z5FiHdPTO0XOGN9sZKU8XSY+t88JqlCj4gIksS/2RLtogqTTkUdPJfY1Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/dquGCX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/dquGCX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AEEC4AF53
	for <regressions@lists.linux.dev>; Wed, 12 Jun 2024 18:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718216974;
	bh=OmrPRsVW/SqHsQ62oU68f2r5XqKqs5zc1yIXlgibcIs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O/dquGCXvAxrRygH/CqVz2yzYjWsHv5N018YAEkDe+7Fyl5LIoSLyUtbnBOlbwysC
	 /JrlDtmeKJL9vog0MNqK2W+RWk5s3yv++MSCT3PTUDe7nts83W3XUaLDQtjyNIFk8T
	 Mn9lm/u6OcXbMziw0zVEl8H3EihKkUp99DXmGluwXETEh4umt33AOHXawDcOED8RU9
	 X9gdAqvjfZL9wTF14k6iQKxXzELI1b6KTcmstmom3QQ+80zkf9ffZCLYc/7AcItzqv
	 nqYm6dKUhCb1nHdwTr0iWp7Z87VrgsuwIrTCe3SliZJrw7ySEq5iccmwSv8Dt/1utZ
	 wuP1dhmt6Njsg==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-25496e90cf5so7096fac.1
        for <regressions@lists.linux.dev>; Wed, 12 Jun 2024 11:29:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwbtCNShEVxlD20TT5+aZVc4BiVX9LaH6ejU5uQ03Sn9tDUUh0KCCAHB4TzQpU6eSyDGFfL2hs0HwwHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFuRVm4x0TodCeJxKUvBk6SOkFukhSIG9nZVvLHzZiOIVEGsTc
	HDXzOD/qSamxrQE2UhqosRrTOlcukkOc/N6Onmw+sg5S2Xgu4RcvLNg0mjkFyjqr95phqnZPpzJ
	PDtky1WHHeGX88BvEp+mQ1zSuV0U=
X-Google-Smtp-Source: AGHT+IFylrCsWLsKLPqjnXt++1LHB3b3Atfwm0DR77ZFQrwea2y+55nezG7Xq+Di2smKAkN62xbjg85zPihLMpPy22E=
X-Received: by 2002:a05:6871:4e91:b0:24f:ddd5:a21d with SMTP id
 586e51a60fabf-255151f70fcmr2841268fac.5.1718216973099; Wed, 12 Jun 2024
 11:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240528084413.2624435-1-sakari.ailus@linux.intel.com>
 <a05df025-a0be-49cd-84a9-7d7fb2eeb33e@redhat.com> <e9062095-b312-44df-a9e3-0b09f3ec9eff@redhat.com>
 <4b387b4d-f778-4891-9f07-df5fc0a093cd@redhat.com> <ZmmQLt7wB-yGQBTw@kekkonen.localdomain>
 <CAJZ5v0ii3WFQRPdfHeeW4M9kXSWDVxxxy02zThcf25mjNwqDAw@mail.gmail.com>
 <ZmmT56Cyvb2FCyav@kekkonen.localdomain> <CAJZ5v0hOBggQR_=uA3VuhruQnZihVxHHovpTz4=qfcbiSunsYw@mail.gmail.com>
 <ZmmY3he9vfWVWU3I@kekkonen.localdomain> <CAJZ5v0j7HTfg1wY+B+7vhE6tBKPVHMuu_MsFHjaLK70VS_cNEw@mail.gmail.com>
 <ZmnnFueL-Cgw5Eqp@kekkonen.localdomain>
In-Reply-To: <ZmnnFueL-Cgw5Eqp@kekkonen.localdomain>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 12 Jun 2024 20:29:21 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gtK9yusimCOVV2dGkQWDwQ6=r=vfbgC-eE60Cg-5wk_Q@mail.gmail.com>
Message-ID: <CAJZ5v0gtK9yusimCOVV2dGkQWDwQ6=r=vfbgC-eE60Cg-5wk_Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] ACPI: scan: Ignore Dell XPS 9320 camera graph port nodes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Genes Lists <lists@sapience.com>, linux-kernel@vger.kernel.org, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	wentong.wu@intel.com, linux-media@vger.kernel.org, linux-acpi@vger.kernel.org, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Wed, Jun 12, 2024 at 8:21=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rafael,
>
> On Wed, Jun 12, 2024 at 03:06:53PM +0200, Rafael J. Wysocki wrote:
> > Hi Sakari,
> >
> > On Wed, Jun 12, 2024 at 2:47=E2=80=AFPM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Rafael,
> > >
> > > On Wed, Jun 12, 2024 at 02:32:26PM +0200, Rafael J. Wysocki wrote:
> > > > > > > > I just hit the same problem on another Dell laptop. It seem=
s that
> > > > > > > > all Dell laptops with IPU6 camera from the Tiger Lake, Alde=
r Lake
> > > > > > > > and Raptor Lake generations suffer from this problem.
> > > > > > > >
> > > > > > > > So instead of playing whack a mole with DMI matches we shou=
ld
> > > > > > > > simply disable ACPI MIPI DISCO support on all Dell laptops
> > > > > > > > with those CPUs. I'm preparing a fix for this to replace
> > > > > > > > the DMI matching now.
> > > > > > >
> > > > > > > DisCo for Imaging support shouldn't be dropped on these syste=
ms, and this
> > > > > > > isn't what your patch does either. Instead the ACPI graph por=
t nodes (as
> > > > > > > per Linux specific definitions) are simply dropped, i.e. this=
 isn't related
> > > > > > > to DisCo for Imaging at all.
> > > > > >
> > > > > > So it looks like the changelog of that patch could be improved,=
 right?
> > > > >
> > > > > Well, yes. The reason the function is in the file is that nearly =
all camera
> > > > > related parsing is located there, not that it would be related to=
 DisCo for
> > > > > Imaging as such.
> > > >
> > > > So IIUC the camera graph port nodes are created by default with the
> > > > help of the firmware-supplied information, but if that is defective=
 a
> > > > quirk can be added to skip the creation of those ports in which cas=
e
> > > > they will be created elsewhere.
> > > >
> > > > Is this correct?
> > >
> > > Yes.
> >
> > So it would be good to add a comment to this effect to
> > acpi_nondev_subnode_extract() where acpi_graph_ignore_port() is
> > called.
> >
> > And there is a somewhat tangential question that occurred to me: If
> > the nodes are created elsewhere when acpi_graph_ignore_port() is true,
> > why is it necessary to consult the platform firmware for the
> > information on them at all?  Wouldn't it be better to simply always
> > create them elsewhere?
>
> Simple answer: for the same reason why in general system specific
> information comes from ACPI and not from platform data compiled into the
> kernel.
>
> Of course this is technically possible but it does not scale.

While I agree in general, in this particular case the platform data
compiled into the kernel needs to be present anyway, at least
apparently, in case the data coming from the platform firmware is
invalid.

So we need to do 3 things: compile in the platform data into the
kernel and expect the platform firmware to provide the necessary
information, and add quirks for the systems where it is known invalid.

Isn't this a bit too much?

> On laptops shipped with Windows some additional information is also avail=
able
> from ACPI via custom objects but a lot of information is just hard coded =
into
> the IPU bridge as well as the INT3472 driver.

Well, that's how it goes.
