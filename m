Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E17436B
	for <regressions@lists.linux.dev>; Tue, 27 Jun 2023 02:39:27 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a04e5baffcso3609799b6e.3
        for <regressions@lists.linux.dev>; Mon, 26 Jun 2023 19:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687833567; x=1690425567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v4yjUuUHEpCaP+ghkho/RPIBeQxQEP/tQ09KT6l5PAw=;
        b=llFkqqBLOJPE30qgsOOXK6LrX5TQhvgV0cu+09iiQefhoI2aMleqIqB9tyUokr8k0b
         ce3LknC5fDn70y3o5IgpA28ZQ2G3GDTFnoC2leg20krOOvDccvvCDnkNzoo0WaFwMivv
         OwDyMpqf9tiZSrhTl7/0LnJ8kW128IFQx2YfKnWqJwCjv2mnem66UooScWNqM+dFYyAJ
         2h/cGkJ/QqehUhzsYXS8UqMCIC8b4I5dlJpj8bok1sjRobq5Vn7M5h1TvZFGirKt2E2h
         NB6w4+G8JRnrT/KFbYgTQRb1jhxTY4IUy6VVrIziUYHda/Sb0Dg+R4nawbLDnQtrJcfH
         4Rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687833567; x=1690425567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4yjUuUHEpCaP+ghkho/RPIBeQxQEP/tQ09KT6l5PAw=;
        b=Ruc4DUsFt8t69kAqz5upTctFCkoiRCYO9rWskxdKuZXngLX/67shFHt2KOh3vy1xOO
         OUzwzcugpE7t9lz/hQSU/sqm+7ZPZrULQ8Gv3qHumOEUrA6jCAByW+yK4K6oSGWeDttg
         wY97lbJiJv+QCrMUN3MIbcO1POf7i5rsS4z4PLuPgXQcRXpeyVQOxmq64fDIQvXGuZMj
         Q+TD+NRI9bzAU9LTM2lsn+6m3N6qtUpVTKu4JsNs83JUsaDuyfaj2sYk5WcWia7dUtEW
         cNRylkHBWUpG5WGuFRNr+ptj16jE7BHL3seABt1z3nxXTjEOVSq8Q0T/Pkpw9/5su01b
         o/Sw==
X-Gm-Message-State: AC+VfDy9qw6F9IwGMcJkuT5xxEeycnfk1Va+06pWv9C7ZwYL4eHI1Cp4
	NW3ewMlFeyt+c6zZgbtxxKE=
X-Google-Smtp-Source: ACHHUZ6tDy7pQnSxhb+myr30blaGiiHnpAGwDgTqzzW8pcEPwP4ijxQpdeCtDQT/TutbeqjoUM/E3g==
X-Received: by 2002:aca:1a1a:0:b0:39a:531b:db6c with SMTP id a26-20020aca1a1a000000b0039a531bdb6cmr32888503oia.47.1687833566749;
        Mon, 26 Jun 2023 19:39:26 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm4837086plz.179.2023.06.26.19.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 19:39:26 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id CCB6F81BD58D; Tue, 27 Jun 2023 09:39:20 +0700 (WIB)
Date: Tue, 27 Jun 2023 09:39:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: bugzilla-daemon@kernel.org, Linux SCSI <linux-scsi@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	pheidologeton@protonmail.com
Subject: Re: [Bug 217599] New: Adaptec 71605z hangs with aacraid: Host
 adapter abort request after update to linux 6.4.0
Message-ID: <ZJpL2GD+VntdUXZp@debian.me>
References: <bug-217599-11613@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UP4jKEPv6Asbr+1k"
Content-Disposition: inline
In-Reply-To: <bug-217599-11613@https.bugzilla.kernel.org/>


--UP4jKEPv6Asbr+1k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[also Cc: aacraid and SCSI subsystem maintainers]

On Mon, Jun 26, 2023 at 10:36:13PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217599
>=20
>             Bug ID: 217599
>            Summary: Adaptec 71605z hangs with aacraid: Host adapter abort
>                     request after update to linux 6.4.0
>            Product: SCSI Drivers
>            Version: 2.5
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: high
>           Priority: P3
>          Component: AACRAID
>           Assignee: scsi_drivers-aacraid@kernel-bugs.osdl.org
>           Reporter: pheidologeton@protonmail.com
>         Regression: No
>=20
> The controller works fine for a few minutes. Then it hangs for a few tens=
 of
> seconds to a few minutes, then also works normally for a while. This bug =
is
> present in the 6.4.0 kernel release (6.3.9 works without hanging)
> The messages in dmesg are as follows
>=20
> [  287.137901] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137909] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137912] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137914] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137916] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137919] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137921] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137924] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137926] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137928] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137930] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137933] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137934] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137937] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137939] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137941] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137943] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137945] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137947] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137949] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137951] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137952] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137954] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137956] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137958] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137960] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137962] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137964] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137966] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137967] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137969] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.137971] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  287.157697] aacraid: Host bus reset request. SCSI hang ?
> [  287.157706] aacraid 0000:02:00.0: outstanding cmd: midlevel-0
> [  287.157708] aacraid 0000:02:00.0: outstanding cmd: lowlevel-0
> [  287.157709] aacraid 0000:02:00.0: outstanding cmd: error handler-0
> [  287.157711] aacraid 0000:02:00.0: outstanding cmd: firmware-32
> [  287.157712] aacraid 0000:02:00.0: outstanding cmd: kernel-0
> [  287.167040] aacraid 0000:02:00.0: Controller reset type is 3
> [  287.167042] aacraid 0000:02:00.0: Issuing IOP reset
> [  321.029712] aacraid 0000:02:00.0: IOP reset succeeded
> [  321.066201] numacb=3D512 ignored
> [  321.066843] aacraid: Comm Interface type2 enabled
> [  344.845370] aacraid 0000:02:00.0: Scheduling bus rescan
> [  358.294342] sd 10:0:0:0: [sda] Very big device. Trying to use READ
> CAPACITY(16).
> [  442.109147] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109155] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109158] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109160] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109162] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109164] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109166] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109168] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109170] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109172] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109174] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109176] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109178] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109179] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109181] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109183] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109185] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109187] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109189] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109191] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109193] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109194] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109196] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109198] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109200] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109201] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109203] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109205] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109207] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109208] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.109210] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.137144] aacraid: Host adapter abort request.
>                aacraid: Outstanding commands on (10,0,0,0):
> [  442.154292] aacraid: Host bus reset request. SCSI hang ?
> [  442.154302] aacraid 0000:02:00.0: outstanding cmd: midlevel-0
> [  442.154305] aacraid 0000:02:00.0: outstanding cmd: lowlevel-0
> [  442.154307] aacraid 0000:02:00.0: outstanding cmd: error handler-0
> [  442.154308] aacraid 0000:02:00.0: outstanding cmd: firmware-32
> [  442.154310] aacraid 0000:02:00.0: outstanding cmd: kernel-0
> [  442.171131] aacraid 0000:02:00.0: Controller reset type is 3
> [  442.171133] aacraid 0000:02:00.0: Issuing IOP reset
> [  476.040983] aacraid 0000:02:00.0: IOP reset succeeded
> [  476.078055] numacb=3D512 ignored
> [  476.078606] aacraid: Comm Interface type2 enabled
> [  494.747632] aacraid 0000:02:00.0: Scheduling bus rescan
> [  507.896453] sd 10:0:0:0: [sda] Very big device. Trying to use READ
> CAPACITY(16).
>=20

Thanks for automatically forwarding Bugzilla report. I'm adding it to
regzbot to ensure it doesn't get fallen through cracks unnoticed:

#regzbot ^introduced: v6.3..v6.4
#regzbot title: Adaptec 71605z hangs with aacraid: Host adapter abort reque=
st after update
#regzbot monitor: https://bugzilla.kernel.org/show_bug.cgi?id=3D217599

--=20
An old man doll... just what I always wanted! - Clara

--UP4jKEPv6Asbr+1k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZJpL2AAKCRD2uYlJVVFO
o3h6AP0UHUgte+hmsV1B8lgpxfg0Z8WIM6rSRvF2JulKb/mETAEA4tgz+w3A4+3s
KUec4pRjaCQC7oUHVyQHnQ/KPRrkkgI=
=QwX3
-----END PGP SIGNATURE-----

--UP4jKEPv6Asbr+1k--
