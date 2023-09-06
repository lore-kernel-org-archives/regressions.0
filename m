Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE357E
	for <regressions@lists.linux.dev>; Wed,  6 Sep 2023 10:59:40 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d7cbcfdf137so3013443276.2
        for <regressions@lists.linux.dev>; Wed, 06 Sep 2023 03:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693997979; x=1694602779; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TRaWE9RdpS1f61w4iMZcHsGOS8rUsx58CiFxRqJCtY=;
        b=JElDPwX8/8ISWCqKJ5z+0/94hfBxUZ51SxwaN73OAXz4xhv4Th3uryUhaypraFDbyU
         zP5usI7TJ8oUNZokdlrB+ZaI5T8gOkUtOUgM/wmzsA/ti1nGnzXWTmKKj7tVzIfvIGmJ
         cu7f4ufI25zdbcNzW9PIqC7kyBkbvkOrSWzZAAfzOuSsQDGLdVycPmcYwg4/tltM6/fP
         HdquiS4VnOQWDJbe0SbfYX0YKBkAVKgP7mETqEqp7+H1hVYL3iEM1Kzl+brbgMvHkQhA
         3rzhlq8ueeqz3UEiqnxjwr8s6kQLpcUSOB0k8OhK1UvN3EH7IjRmQZ/xMiMhDjn4S9zw
         RqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693997979; x=1694602779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TRaWE9RdpS1f61w4iMZcHsGOS8rUsx58CiFxRqJCtY=;
        b=AGWBTAjJqRWfGViC57co1MZRTtECyb8+m3IB0vDA9FlF2muWvWh0An8NEg5a1qnK2d
         ybF/NRZPUdUZEgEjwBm6+wQsM1UBfa2q4ItWofHqgG0385BqTS9E4HVSGY7M1RyPHUOC
         +jng/y+7mbCB+NI+t8nPflVP4DGPhM0AncPCpdTK8yDTrNo3s66MvYM9TgNSfd5TYJkZ
         qTAjZEjHprFvarvMDCY1RbW+9Nd8zIhd1y5YcMfXvXfp8HpN3j+ZgwlkGZEm9pwdKAWh
         M+DT4GDvk3eG8oZxdmXfANBXXouK//NooJ+P3pwUDfN3dLHqPQ4Mstpimuezsa61srjB
         mGNw==
X-Gm-Message-State: AOJu0YzUZmpfm52zPQ2WYH9+m7HDKXOKaq2ca/ltA1AQ5/Ofl0qDw5Sj
	oucEElL9JeQquzxx4NzGw/aC8VOiM08SMK+jJy8=
X-Google-Smtp-Source: AGHT+IGDVLUdQ05ge/G4dn3Y38GXLHKZ7EF0tbkdsL28txPHQxHktzsEeW+78m6I3GUAbE9DNyViC+klXVifYe3z/QM=
X-Received: by 2002:a05:6902:188:b0:d7f:95f6:e13e with SMTP id
 t8-20020a056902018800b00d7f95f6e13emr3169281ybh.33.1693997979142; Wed, 06 Sep
 2023 03:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHCN7xJjK=BaNHa=+OKzOmFtNRYKX_APTp5Zj3g-X_iQcpyK6g@mail.gmail.com>
 <ZPZ2zTS9loj06u31@debian.me> <20230905061739.GX11676@atomide.com>
In-Reply-To: <20230905061739.GX11676@atomide.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 6 Sep 2023 05:59:27 -0500
Message-ID: <CAHCN7xJo=pJkcChHm9AsNQGCJuHXgpRKKRK9ckEwdk3U-41ukw@mail.gmail.com>
Subject: Re: 6.1.y Regression found on AM3517
To: Tony Lindgren <tony@atomide.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Linux OMAP <linux-omap@vger.kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Linux Stable <stable@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 5, 2023 at 11:25=E2=80=AFAM Tony Lindgren <tony@atomide.com> wr=
ote:
>
> * Bagas Sanjaya <bagasdotme@gmail.com> [230905 00:31]:
> > On Mon, Sep 04, 2023 at 11:37:46AM -0500, Adam Ford wrote:
> > > I have an AM3517-EVM board that I am trying to use the latest 6.1.y
> > > stable, currently 6.1.51.
> > >
> > > With git bisect, I narrowed the regression between 6.1.15 and 6.1.16 =
to commit
> > > eaf9b5612a47 ("driver core: fw_devlink: Don't purge child fwnode's
> > > consumer links")
> > >
> > > In the regression, 48002000.scm appears as not ready.  This affects a
> > > variety of dependent peripherals making them unavailable:
> > >
> > > wl12xx_buf platform: supplier 48002000.scm not ready
> > > wl12xx_vmmc2 platform: supplier wl12xx_buf not ready
> > > 48050000.dss platform: supplier display@0 not ready
> > > 48064800.ehci platform: supplier hsusb1_phy not ready
> > > backlight platform: supplier 48002000.scm not ready
> > > display@0 platform: supplier backlight not ready
> > > dmtimer-pwm@11 platform: supplier 48002000.scm not ready
> > > hsusb1_phy platform: supplier 48002000.scm not ready
> > > gpio-leds platform: supplier 48002000.scm not ready
> > > 480b4000.mmc platform: supplier wl12xx_vmmc2 not ready
> > >
> > > If I build 6.1.51 but I checkout drivers/base/core.c from commit
> > > 2455b81afe68 ("driver core: fw_devlink: Add DL_FLAG_CYCLE support to
> > > device links"),
> > > the regression is gone.
>
> Adam, maybe check if 6.1 stable series is missing something to be
> backported from this mailing list thread:
>
> https://lore.kernel.org/lkml/20230207014207.1678715-2-saravanak@google.co=
m/
>
> That email thread version seemed to work for me based on my reply in the
> thread. I recall issues with the earlier revisions but don't remember
> what fixed them.

Tony,

Indeed, it does appear that a patch was missing from the back-ported series=
.

Applying commit 4a032827daa8 ("of: property: Simplify
of_link_to_phandle()") to the 6.1.y branch appears
to fix the regression.

Thanks for the pointer to the series.

Stable group,

Do I need to send a separate e-mail requesting the backporting of that
commit to the 6.1.y branch?

adam
>
> > > I checked the 6.5 kernel, and it appears fine, so I think there is a
> > > possible backport commit missing, and I was hoping Saravana or Tony
> > > might have a suggestion as to which one(s) I should try.  I don't kno=
w
> > > if this is found on other OMAP3 boards, but I wouldn't be surprised.
> > >
> >
> > Thanks for the regression report. I'm adding it to regzbot as stable-sp=
ecific
> > entry:
> >
> > #regzbot ^introduced: eaf9b5612a47f0
> > #regzbot title: keeping consumer links of child fwnode doesn't prepare =
AM3517-EVM suppliers
>
> Regards,
>
> Tony
