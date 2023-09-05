Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4591375
	for <regressions@lists.linux.dev>; Tue,  5 Sep 2023 00:31:14 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-68a1af910e0so1052297b3a.2
        for <regressions@lists.linux.dev>; Mon, 04 Sep 2023 17:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693873874; x=1694478674; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KahAxRhz3wgRQR6LYRmsSMVDqlviJZ+3n3aTM3fwp30=;
        b=XA+nB//WRwB/lMinS5cp4Dl29D9ernEbhUyACnZpQO226DzTvtfKe92SizjJ2laaJj
         1F9dBqYKOTPhmkonE+d3gSmtOXQITk4ZoMYJMBWMXsSl/fM8srGrFGJwi9xPRsM6hbo3
         Bd/TnvIFdKqsQ1i3ehzve1xlpOWJNC9/kP/XI7qEGZI0PxzC0xNIYXZ03UpDQAYJkJfq
         OkIOQII8WeIWyGTrCvLXUWI4+nz8kaPZhaie9oN6muvMDbGlekji4WxVMIsDVZ4nUaGK
         0up33VFcGQsHHtDrloJ/T/+PpoIcgO4TFhBnjI8I1Z8iZgtutl9P7rBvMvATBKW5h/Dr
         N0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693873874; x=1694478674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KahAxRhz3wgRQR6LYRmsSMVDqlviJZ+3n3aTM3fwp30=;
        b=PYS7e++9ZFI204c0j63jTubWjPZgOf48LFeETM9gSuEMFKxqu83bCJfswI7up2huoH
         Zij/cJVHcrfQWE0Wuj+nwXFTHnjcfRFE3UTDVGpgtro8oJ+b14QPvn7ZtX4GMBxIIhQV
         b1UoLhb56H4E3q1SXEqFEtitMf9kL/Zz6GfxMEwwr4f0/HugkQdfYi95Em1tBYkxJQxH
         QeCxa2Az8HtjLjdMDzcID/xIwtOkNRV4Ndzn3mH/wSj3VknsIEKqAlGj9X0/OAXTybsC
         iW2clYQIUSWQUM6CiLJFM1V3MCe/Zt+EaLfacjTaL33jR0ygxEJWK9GX9sf/iZqZgqKo
         wlCg==
X-Gm-Message-State: AOJu0YzEIOfdfKXIlD/S1i9emFyHwPO8fUS+uDwjDEFLHaIHDPivTQl/
	i4HQB3hxc9MhoMBWbN0BCFI=
X-Google-Smtp-Source: AGHT+IH2Nn8EYpPw2lv1daEhr7GqVp/qmLMwcHTb+vcj7H9xfK/s+1xTMyzOZol0NEzvBYUNI0eNQA==
X-Received: by 2002:a05:6a20:a103:b0:135:38b5:7e58 with SMTP id q3-20020a056a20a10300b0013538b57e58mr11807695pzk.37.1693873873895;
        Mon, 04 Sep 2023 17:31:13 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id e5-20020a63ee05000000b0055386b1415dsm7185342pgi.51.2023.09.04.17.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 17:31:13 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 98525991F66C; Tue,  5 Sep 2023 07:31:09 +0700 (WIB)
Date: Tue, 5 Sep 2023 07:31:09 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Adam Ford <aford173@gmail.com>, Linux OMAP <linux-omap@vger.kernel.org>,
	Saravana Kannan <saravanak@google.com>
Cc: Linux Stable <stable@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: 6.1.y Regression found on AM3517
Message-ID: <ZPZ2zTS9loj06u31@debian.me>
References: <CAHCN7xJjK=BaNHa=+OKzOmFtNRYKX_APTp5Zj3g-X_iQcpyK6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4TN05Y37ezUfG4hO"
Content-Disposition: inline
In-Reply-To: <CAHCN7xJjK=BaNHa=+OKzOmFtNRYKX_APTp5Zj3g-X_iQcpyK6g@mail.gmail.com>


--4TN05Y37ezUfG4hO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 04, 2023 at 11:37:46AM -0500, Adam Ford wrote:
> I have an AM3517-EVM board that I am trying to use the latest 6.1.y
> stable, currently 6.1.51.
>=20
> With git bisect, I narrowed the regression between 6.1.15 and 6.1.16 to c=
ommit
> eaf9b5612a47 ("driver core: fw_devlink: Don't purge child fwnode's
> consumer links")
>=20
> In the regression, 48002000.scm appears as not ready.  This affects a
> variety of dependent peripherals making them unavailable:
>=20
> wl12xx_buf platform: supplier 48002000.scm not ready
> wl12xx_vmmc2 platform: supplier wl12xx_buf not ready
> 48050000.dss platform: supplier display@0 not ready
> 48064800.ehci platform: supplier hsusb1_phy not ready
> backlight platform: supplier 48002000.scm not ready
> display@0 platform: supplier backlight not ready
> dmtimer-pwm@11 platform: supplier 48002000.scm not ready
> hsusb1_phy platform: supplier 48002000.scm not ready
> gpio-leds platform: supplier 48002000.scm not ready
> 480b4000.mmc platform: supplier wl12xx_vmmc2 not ready
>=20
> If I build 6.1.51 but I checkout drivers/base/core.c from commit
> 2455b81afe68 ("driver core: fw_devlink: Add DL_FLAG_CYCLE support to
> device links"),
> the regression is gone.
>=20
> I checked the 6.5 kernel, and it appears fine, so I think there is a
> possible backport commit missing, and I was hoping Saravana or Tony
> might have a suggestion as to which one(s) I should try.  I don't know
> if this is found on other OMAP3 boards, but I wouldn't be surprised.
>=20

Thanks for the regression report. I'm adding it to regzbot as stable-specif=
ic
entry:

#regzbot ^introduced: eaf9b5612a47f0
#regzbot title: keeping consumer links of child fwnode doesn't prepare AM35=
17-EVM suppliers

--=20
An old man doll... just what I always wanted! - Clara

--4TN05Y37ezUfG4hO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPZ2xwAKCRD2uYlJVVFO
o5IOAQCIGavurK5E7nfTaIRDBoo892kQOqYZMQk0+2UlRBIopQEAjVjV5/kU645H
VdDDpJxC+ONryhpYy6J5KLZwuF+6wQA=
=czyX
-----END PGP SIGNATURE-----

--4TN05Y37ezUfG4hO--
