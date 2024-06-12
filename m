Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCB416E881
	for <regressions@lists.linux.dev>; Wed, 12 Jun 2024 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718195559; cv=none; b=DtB+qqgYf0R0JSIiOaT4VuRTo+XWPbP+zClEz1/UvaQLNq0nBl0aPMiMyjRRjM530eZ/pWDnlyBsxBOseHTck4X9W0+iTJpgNPeZf8lTbvEB9a/vzbpL3AuFjHk05sQI69EOr/EpUAOVj4rEbMzg8u0OfFUcgHq+Ya9WrrCnF5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718195559; c=relaxed/simple;
	bh=aWxvhXYl7WmnMjLN+jrZVKd1UIrUjxzDb4m7CnLQOOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CoFl1fbBNuawuBrcHzZpgsCE0kYlabkZcomqMICe1Nz1y80dZ1vi8fre4+ZCa1uvWpMKiMVpe4bUQ9qvRFWZmaB0adx0uyVpORkEcRYh+83LohMa6O782I3+2hyIZUHwNeYiHknlzQC04RY3CGElYoq0s3vbCYBp6ELZImXsEcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxyzOfpm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxyzOfpm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B1BC32789
	for <regressions@lists.linux.dev>; Wed, 12 Jun 2024 12:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718195558;
	bh=aWxvhXYl7WmnMjLN+jrZVKd1UIrUjxzDb4m7CnLQOOU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JxyzOfpmIw/cCnjS8kjKvcHJVPssD2VuB0iwGfruv5mnLGlh/BM7HiNvMyea4/Z4n
	 pztPPvQINHei1tglxa+pknBk3S6s6b9nCZAsoc/tibIdCmewB4yu+9pUK3PzS+qEj3
	 2V8xA6pVeiWS3g0UvGm+yLvk4rToTXh7tc8/bPj/wtQ0iER0cGFVDmxVkOFsZe6Uqb
	 YgRsd/WgtUdj1pvIpm4N3kyT+qYx0NksqmkSURWwANgI+LtGvkE578rABK43SZjRDO
	 hjqS4Y2NyJwGgGv0hpfsS1ZGw898AS/8Wy55xwQnYptPmj+lFGFQTLwUcoeMxEh3ay
	 9KuHcjDI9sqmQ==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5b3356fd4f3so735603eaf.1
        for <regressions@lists.linux.dev>; Wed, 12 Jun 2024 05:32:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsmVy1DItBW5Fn+FGNE4jpA+uStjeTnym427O9b4GF8q6v2Kh8z3l2J9Rg8VATPVctl0wPm/mdRJF9BQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7Cuj7ZoDVaHq0/0r4m/vzgsBn2fiWdj3Zc/DCdC9yUgpYxUkS
	EWRUpTS1RBpozoOZ55BsWAQ0t0ulbKAnEMHOxLANd1zeVkTsFsgA/nt9OcoxEfEhsTJdaDSr46h
	n1JeNzFuokcP/7nByxBE8YVzT6sA=
X-Google-Smtp-Source: AGHT+IFR8h0kytuWOp+ktZ19InJGNg+BPq/zkCFx41afNMr9L2B+GaQBgE3iUq8bHh3fiOtf9oFxvOGgoDjfdriaCOY=
X-Received: by 2002:a05:6870:658d:b0:24f:cabc:4fa3 with SMTP id
 586e51a60fabf-255147c7724mr1817288fac.0.1718195558086; Wed, 12 Jun 2024
 05:32:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <988e48090982c89ce0c906954832fdfb09a1ce34.camel@sapience.com>
 <20240528084413.2624435-1-sakari.ailus@linux.intel.com> <a05df025-a0be-49cd-84a9-7d7fb2eeb33e@redhat.com>
 <e9062095-b312-44df-a9e3-0b09f3ec9eff@redhat.com> <4b387b4d-f778-4891-9f07-df5fc0a093cd@redhat.com>
 <ZmmQLt7wB-yGQBTw@kekkonen.localdomain> <CAJZ5v0ii3WFQRPdfHeeW4M9kXSWDVxxxy02zThcf25mjNwqDAw@mail.gmail.com>
 <ZmmT56Cyvb2FCyav@kekkonen.localdomain>
In-Reply-To: <ZmmT56Cyvb2FCyav@kekkonen.localdomain>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 12 Jun 2024 14:32:26 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hOBggQR_=uA3VuhruQnZihVxHHovpTz4=qfcbiSunsYw@mail.gmail.com>
Message-ID: <CAJZ5v0hOBggQR_=uA3VuhruQnZihVxHHovpTz4=qfcbiSunsYw@mail.gmail.com>
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

On Wed, Jun 12, 2024 at 2:26=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rafael,
>
> On Wed, Jun 12, 2024 at 02:21:51PM +0200, Rafael J. Wysocki wrote:
> > On Wed, Jun 12, 2024 at 2:10=E2=80=AFPM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Hans,
> > >
> > > Just read this discussion, too...
> > >
> > > On Wed, Jun 12, 2024 at 12:08:49PM +0200, Hans de Goede wrote:
> > > > Hi,
> > > >
> > > > On 6/6/24 8:12 PM, Hans de Goede wrote:
> > > > > Hi,
> > > > >
> > > > > +To: Rafael since this was Cc-ed to linux-acpi but never send
> > > > > to Rafael directly.
> > > > >
> > > > > Rafael this fixes a crash in 6.10-rc1 for some users and is neces=
sary
> > > > > to make the cameras work on the Dell XPS 13 plus 9320 .
> > > > >
> > > > > On 5/28/24 7:09 PM, Hans de Goede wrote:
> > > > >> Hi Sakari,
> > > > >>
> > > > >> On 5/28/24 10:44 AM, Sakari Ailus wrote:
> > > > >>> Ignore camera related graph port nodes on Dell XPS 9320. They d=
ata in BIOS
> > > > >>> is buggy, just like it is for Dell XPS 9315. The corresponding =
software
> > > > >>> nodes are created by the ipu-bridge.
> > > > >>>
> > > > >>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > >>> ---
> > > > >>> Hi,
> > > > >>>
> > > > >>> Could you test this and see whether it fixes the warning?
> > > > >>>
> > > > >>> The camera might work with this change, too.
> > > > >>
> > > > >> Thank you I just received a Dell XPS 13 plus 9320 myself to use
> > > > >> for VSC testing and I can confirm that with this patch 6.10.0-rc=
1
> > > > >> works, including giving a picture with the libcamera software IS=
P +
> > > > >> 3 small libcamera patches.
> > > > >
> > > > > I forgot to add:
> > > > >
> > > > > Tested-by: Hans de Goede <hdegoede@redhat.com>
> > > > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > >
> > > > I just hit the same problem on another Dell laptop. It seems that
> > > > all Dell laptops with IPU6 camera from the Tiger Lake, Alder Lake
> > > > and Raptor Lake generations suffer from this problem.
> > > >
> > > > So instead of playing whack a mole with DMI matches we should
> > > > simply disable ACPI MIPI DISCO support on all Dell laptops
> > > > with those CPUs. I'm preparing a fix for this to replace
> > > > the DMI matching now.
> > >
> > > DisCo for Imaging support shouldn't be dropped on these systems, and =
this
> > > isn't what your patch does either. Instead the ACPI graph port nodes =
(as
> > > per Linux specific definitions) are simply dropped, i.e. this isn't r=
elated
> > > to DisCo for Imaging at all.
> >
> > So it looks like the changelog of that patch could be improved, right?
>
> Well, yes. The reason the function is in the file is that nearly all came=
ra
> related parsing is located there, not that it would be related to DisCo f=
or
> Imaging as such.

So IIUC the camera graph port nodes are created by default with the
help of the firmware-supplied information, but if that is defective a
quirk can be added to skip the creation of those ports in which case
they will be created elsewhere.

Is this correct?
