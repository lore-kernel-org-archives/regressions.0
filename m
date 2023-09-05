Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993F8EBC
	for <regressions@lists.linux.dev>; Tue,  5 Sep 2023 06:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 070D380A3;
	Tue,  5 Sep 2023 06:17:41 +0000 (UTC)
Date: Tue, 5 Sep 2023 09:17:39 +0300
From: Tony Lindgren <tony@atomide.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Adam Ford <aford173@gmail.com>, Linux OMAP <linux-omap@vger.kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Linux Stable <stable@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: 6.1.y Regression found on AM3517
Message-ID: <20230905061739.GX11676@atomide.com>
References: <CAHCN7xJjK=BaNHa=+OKzOmFtNRYKX_APTp5Zj3g-X_iQcpyK6g@mail.gmail.com>
 <ZPZ2zTS9loj06u31@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZPZ2zTS9loj06u31@debian.me>

* Bagas Sanjaya <bagasdotme@gmail.com> [230905 00:31]:
> On Mon, Sep 04, 2023 at 11:37:46AM -0500, Adam Ford wrote:
> > I have an AM3517-EVM board that I am trying to use the latest 6.1.y
> > stable, currently 6.1.51.
> >=20
> > With git bisect, I narrowed the regression between 6.1.15 and 6.1.16 to=
 commit
> > eaf9b5612a47 ("driver core: fw_devlink: Don't purge child fwnode's
> > consumer links")
> >=20
> > In the regression, 48002000.scm appears as not ready.  This affects a
> > variety of dependent peripherals making them unavailable:
> >=20
> > wl12xx_buf platform: supplier 48002000.scm not ready
> > wl12xx_vmmc2 platform: supplier wl12xx_buf not ready
> > 48050000.dss platform: supplier display@0 not ready
> > 48064800.ehci platform: supplier hsusb1_phy not ready
> > backlight platform: supplier 48002000.scm not ready
> > display@0 platform: supplier backlight not ready
> > dmtimer-pwm@11 platform: supplier 48002000.scm not ready
> > hsusb1_phy platform: supplier 48002000.scm not ready
> > gpio-leds platform: supplier 48002000.scm not ready
> > 480b4000.mmc platform: supplier wl12xx_vmmc2 not ready
> >=20
> > If I build 6.1.51 but I checkout drivers/base/core.c from commit
> > 2455b81afe68 ("driver core: fw_devlink: Add DL_FLAG_CYCLE support to
> > device links"),
> > the regression is gone.

Adam, maybe check if 6.1 stable series is missing something to be
backported from this mailing list thread:

https://lore.kernel.org/lkml/20230207014207.1678715-2-saravanak@google.com/

That email thread version seemed to work for me based on my reply in the
thread. I recall issues with the earlier revisions but don't remember
what fixed them.

> > I checked the 6.5 kernel, and it appears fine, so I think there is a
> > possible backport commit missing, and I was hoping Saravana or Tony
> > might have a suggestion as to which one(s) I should try.  I don't know
> > if this is found on other OMAP3 boards, but I wouldn't be surprised.
> >=20
>=20
> Thanks for the regression report. I'm adding it to regzbot as stable-spec=
ific
> entry:
>=20
> #regzbot ^introduced: eaf9b5612a47f0
> #regzbot title: keeping consumer links of child fwnode doesn't prepare AM=
3517-EVM suppliers

Regards,

Tony
