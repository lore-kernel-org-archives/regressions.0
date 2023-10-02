Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD7B1E521
	for <regressions@lists.linux.dev>; Mon,  2 Oct 2023 23:47:05 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-27758be8a07so255593a91.0
        for <regressions@lists.linux.dev>; Mon, 02 Oct 2023 16:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696290424; x=1696895224; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MsrzhgDbcJtwYX/2EGwafIR0w5juOFXJIQAbPgvHjTw=;
        b=MjnfW3CbIR4fGw/WjYVLgDvTmOSkTiNW8Q20CBaGWH3ULZypEAOgTZT//Sfdc7FW4W
         0zKo7SKGHl8XH5E3LZ5MvB3I/s+kM4RDvxZFu2o5+5vVNrrfyeIfqf4lJCTVMY1VfTqI
         b696jXKJawhAS832tEmG/ls5GZCIKLFAZalpZZwbztFVLEKH7UGgcERDv7hK8VXsEfFp
         ZuxnoleDGd0L9y1QAOQRUKUq7aPqe5+7+n08NhOhbv3llU+Qf2uzOUkm0LTik9Kxc2G4
         ndfM48mwbjNEX6AFPsqM9XuPguV3m56XshabUd4lDbvQD89waNW7BGNHsPo03iRj9Pk/
         9ZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696290424; x=1696895224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsrzhgDbcJtwYX/2EGwafIR0w5juOFXJIQAbPgvHjTw=;
        b=iuPOW1T/UYJTw4MflVn4t3xOrjH2zOJvKQbX85k/rnn6vIdEN+nk5xWQtFCxzmg6L1
         RVD6q3qwKFHKuMiHF19r1DmSCFjrQ5QbOPp60LOQMLK09E9/alKJJIOeJcmCdOo0cRMg
         OnPnzIaviRiNhDkqsumJjQjqAAF7OGY9MP9tOEQt6ClcSYlvW5SzsFreLVEMNmc90J0s
         UUTocxmFuNb6KXtI6iTYMEM9LDwNIXpEIkfwtGWNfIWU0NjLE1/ipR0klK7APkapRe4Y
         7WbBZMOeD+QcoJ48P48fo9ryw9iCvXykcjNMACUIsQIvr5KETv3Mbiogb+YDpBemeB2w
         r5Yw==
X-Gm-Message-State: AOJu0Yx/lKPavjnxPoTsjUv/oScDgCpClqb3MOPBcwZL+Lk1disKCrlO
	Jfulz1wzB0JSMK4RxE1q3Z8=
X-Google-Smtp-Source: AGHT+IEBCTbSZM/8E/uKaeav4fYt2K5qKUh3CuUFJFJQXANJT3CbxyYRJqvtwNk3zj/OuJrUW2TzCQ==
X-Received: by 2002:a17:90b:1194:b0:269:32d2:5ac4 with SMTP id gk20-20020a17090b119400b0026932d25ac4mr13277538pjb.25.1696290424438;
        Mon, 02 Oct 2023 16:47:04 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id ft13-20020a17090b0f8d00b00276b60aa43bsm6884452pjb.17.2023.10.02.16.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 16:47:03 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 8117881A3121; Tue,  3 Oct 2023 06:46:58 +0700 (WIB)
Date: Tue, 3 Oct 2023 06:46:58 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Erik =?utf-8?B?RG9iw6Fr?= <erik.dobak@gmail.com>,
	Linux Stable <stable@vger.kernel.org>,
	Linux Bluetooth <linux-bluetooth@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Mediatek <linux-mediatek@lists.infradead.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tomasz =?utf-8?Q?Mo=C5=84?= <tomasz.mon@nordicsemi.no>
Subject: Re: bluetooth issues since kernel 6.4 - not discovering other bt
 devices - /linux/drivers/bluetooth/btusb.c
Message-ID: <ZRtWcgiH5JhD5NU2@debian.me>
References: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fW063juLwqeEFwfL"
Content-Disposition: inline
In-Reply-To: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>


--fW063juLwqeEFwfL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 01, 2023 at 07:47:54AM +0200, Erik Dob=C3=A1k wrote:
> Hello!
>=20
> I bought a new laptop fujitsu life book and everything is going fine
> on artix just the bt makes trouble:
>=20
> /var/log/error.log
> Sep 30 18:43:48 nexus bluetoothd[2266]:
> src/adapter.c:reset_adv_monitors_complete() Failed to reset Adv
> Monitors: Failed (0x03)
> Sep 30 18:43:48 nexus bluetoothd[2266]: Failed to clear UUIDs: Failed (0x=
03)
> Sep 30 18:43:48 nexus bluetoothd[2266]: Failed to add UUID: Failed (0x03)
> Sep 30 18:43:48 nexus bluetoothd[2266]: Failed to add UUID: Failed (0x03)
>=20
> i searched a bit the webs and found a new commit at kernel org that
> does do the trouble:
> https://bugs.archlinux.org/task/78980
>=20
> follow the linkeys inside the commits there or read this one:
>=20
> ---------------before------------------------------------
> /* interface numbers are hardcoded in the spec */
>         if (intf->cur_altsetting->desc.bInterfaceNumber !=3D 0) {
>                 if (!(id->driver_info & BTUSB_IFNUM_2))
>                         return -ENODEV;
>                 if (intf->cur_altsetting->desc.bInterfaceNumber !=3D 2)
>                         return -ENODEV;
>         }
> -----------after----------------------------------------------------
> if ((id->driver_info & BTUSB_IFNUM_2) &&
>     (intf->cur_altsetting->desc.bInterfaceNumber !=3D 0) &&
>     (intf->cur_altsetting->desc.bInterfaceNumber !=3D 2))
> return -ENODEV;
> --------------------------------------------------------
>=20
> the dude just hooked up 3 conditions in a row with && where before it
> was 2 conditions in 1 condition. + the comment was removed.
>=20
>=20

Try latest mainline first (currently v6.6-rc4). Because you have to
compile your own kernel, please refer to
Documentation/admin-guide/quickly-build-trimmed-linux.rst if you don't know=
 how to do the compilation.

Also, don't top-post when replying; reply inline with appropriate context
instead.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--fW063juLwqeEFwfL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZRtWagAKCRD2uYlJVVFO
o0d+AP4oNwd9Cjay1Ao/Mm5lLmmn0rZYovuJO9UIOSdBN/w/sAEAuTvELS2Y3NZ+
a45nNYc16F/Qn5lYdAjNfJcrgNQwyQE=
=X3ML
-----END PGP SIGNATURE-----

--fW063juLwqeEFwfL--
