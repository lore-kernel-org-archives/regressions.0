Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D81630
	for <regressions@lists.linux.dev>; Fri, 24 Nov 2023 00:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIt7dcEj"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cf856663a4so9781385ad.3
        for <regressions@lists.linux.dev>; Thu, 23 Nov 2023 16:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700785486; x=1701390286; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T4kHw1IEOWLCc0iUVyj4T53bQEDzx7dBqOAEY7sPSe4=;
        b=EIt7dcEj3Zk1byOmqIH9AlZ6YXsfRI9OfN50pDqXz7bRLxhz0cj0J34REDKUHYthc/
         25N1AIheizUVUmqh5ClqQtlVJSVff+lFkfsU3xUKt8cf0EEyFCpNe1DjPXEHOE7L2j0h
         DYmWdFW2u2PMDqJ1zrJR6yDUD9RZKCQmyzoa2qZx0EmzMaKqnsJad7wUQT90QGkcA288
         BD+WxoLYSiuC6OF5Um2McOQBrKhd4EDkHYmxecAffBeLa5C4Sz07TpM0lWEimHMNMcZ8
         JfisBTZI+NRoIjZOMY2CPtO1B6wK8t+dqLdq+ujOMz6Yp/tL572Aqa831Z6S+UxysKxT
         0HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700785486; x=1701390286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4kHw1IEOWLCc0iUVyj4T53bQEDzx7dBqOAEY7sPSe4=;
        b=sE/l+/42Q4jIQ3//tF5FEjPefyykIrrS36RSfWI7M0k89jAH8L2Hdn5OOJ7XfVAO70
         WDGdEKvbCdTCOA61TVxuqWGaMOni6aCiOmqFDpaoa5eUdy6+hq0Bs8PcUSfnICboRb/R
         y+N83ZHBvKPmKlXq6V+QzrBpIOeaVC52Rpoa49PkDf8i/EZ8imoEaOXfXCRsKzkXPewX
         iw0urg8JP/G+8ARwep/fz79FoSzaT8Cop+Ss9EXT/jfA2whFbKKmDxIiIIBQwMj0aj5H
         W5oRzPiwlD9H6IZxweVl/hnLrnIj7ObF9r6R/vQnrVodkOSzqCxCR+ZRe7kWy8FtPcdY
         bOyw==
X-Gm-Message-State: AOJu0YwKIe7hRSxxIZWQaiKQ10mUWs913H8NRszY+3CQ/WbQtC+QBogs
	vdgQHpNdvHtAhuNQ0bLbjus=
X-Google-Smtp-Source: AGHT+IE0AbirN4EPAGp8x3ojd0q7YIX53yxJbTEI12sxLmOzL+HCMIMYWQvirdykzrOdP1DuhOIMJQ==
X-Received: by 2002:a17:902:7584:b0:1cf:9c0b:b3dc with SMTP id j4-20020a170902758400b001cf9c0bb3dcmr752099pll.69.1700785485675;
        Thu, 23 Nov 2023 16:24:45 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902ed0600b001cc3875e658sm1933335pld.303.2023.11.23.16.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:24:44 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 6BCE710210547; Fri, 24 Nov 2023 07:24:42 +0700 (WIB)
Date: Fri, 24 Nov 2023 07:24:42 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux ACPI <linux-acpi@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Common Internet File System & SMB3 <linux-cifs@vger.kernel.org>
Cc: Hugh Dickins <hughd@google.com>, Chuck Lever <chuck.lever@oracle.com>,
	Christian Brauner <brauner@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Steve French <sfrench@samba.org>,
	Namjae Jeon <linkinjeon@kernel.org>, Tom Talpey <tom@talpey.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	walter59 <walter.moeller@moeller-it.net>,
	Fabio Rossi <rossi.f@inwind.it>
Subject: Re: Fwd: kernel 6.6.x and higher , apci reboot problems
Message-ID: <ZV_tShakEUDCpZiu@archie.me>
References: <0fd91726-942d-40dd-adef-5b43e25ec49c@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="39DFDqbGIbbwtrT9"
Content-Disposition: inline
In-Reply-To: <0fd91726-942d-40dd-adef-5b43e25ec49c@gmail.com>


--39DFDqbGIbbwtrT9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 19, 2023 at 09:16:35PM +0700, Bagas Sanjaya wrote:
> Hi,
>=20
> I notice a regression report on Bugzilla [1] (albeit terse). Quoting
> from it:
>=20
> > since kernel 6.6 problems , reboot fails or me muss use double enter ke=
y .
> > under xfce4 it jumps on console and hangs.
> >=20
> > restart under xfce4 fails shutdown also --- 6.5.11 it works all fine=20
> >=20
> > regards=20
> >=20
> > ps: all pcs . notebooks , nucs, workstation
>=20
> Then another reporter can reproduce the regression with bisection:
>=20
> > I have found a similar problem but in my case I don't think it's relate=
d to ACPI. In fact the problem is still there after adding the kernel optio=
n acpi=3Doff. @walter59, can you test on your system by disabling ACPI too?
> >=20
> > During system shutdown, started by "shutdown -h now", the process hangs=
 (but the system is still working) during stopping of samba service. Instea=
d the reboot still works.
> >=20
> > My problem appeared with the upgrade 6.5.11 -> 6.6-rc1 so I have bisect=
ed until I have found the first bad commit:
> >=20
> > $ git bisect log
> >=20
> > git bisect start
> > # status: waiting for both good and bad commits
> > # good: [799441832db16b99e400ccbec55db801e6992819] Linux 6.5.11
> > git bisect good 799441832db16b99e400ccbec55db801e6992819
> > # status: waiting for bad commit, 1 good commit known
> > # bad: [0bb80ecc33a8fb5a682236443c1e740d5c917d1d] Linux 6.6-rc1
> > git bisect bad 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> > # good: [2dde18cd1d8fac735875f2e4987f11817cc0bc2c] Linux 6.5
> > git bisect good 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> > # bad: [461f35f014466c4e26dca6be0f431f57297df3f2] Merge tag 'drm-next-2=
023-08-30' of git://anongit.freedesktop.org/drm/drm
> > git bisect bad 461f35f014466c4e26dca6be0f431f57297df3f2
> > # bad: [bd6c11bc43c496cddfc6cf603b5d45365606dbd5] Merge tag 'net-next-6=
=2E6' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> > git bisect bad bd6c11bc43c496cddfc6cf603b5d45365606dbd5
> > # good: [6c9cfb853063f317b2953c5e852b6bac1eb0cade] net: ethernet: mtk_w=
ed: minor change in wed_{tx,rx}info_show
> > git bisect good 6c9cfb853063f317b2953c5e852b6bac1eb0cade
> > # bad: [ccc5e9817719f59b3dea7b7a168861b4bf0b4ff4] Merge tag 'pm-6.6-rc1=
' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
> > git bisect bad ccc5e9817719f59b3dea7b7a168861b4bf0b4ff4
> > # bad: [68cadad11fe2ddd126b37a8fba3726be7fa0f5c6] Merge tag 'rcu.2023.0=
8.21a' of git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu
> > git bisect bad 68cadad11fe2ddd126b37a8fba3726be7fa0f5c6
> > # bad: [dd2c0198a8365dcc3bb6aed22313d56088e3af55] Merge tag 'erofs-for-=
6.6-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs
> > git bisect bad dd2c0198a8365dcc3bb6aed22313d56088e3af55
> > # bad: [ecd7db20474c3859d4d01f34aaabf41bd28c7d84] Merge tag 'v6.6-vfs.t=
mpfs' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs
> > git bisect bad ecd7db20474c3859d4d01f34aaabf41bd28c7d84
> > # good: [e9d7d3cb9fb3f142df574664507ac0ee4a26365a] procfs: convert to c=
time accessor functions
> > git bisect good e9d7d3cb9fb3f142df574664507ac0ee4a26365a
> > # good: [6f4aaee3faa84f00d38bfaba88a9f75d8c78e7e0] fat: make fat_update=
_time get its own timestamp
> > git bisect good 6f4aaee3faa84f00d38bfaba88a9f75d8c78e7e0
> > # bad: [2daf18a7884dc03d5164ab9c7dc3f2ea70638469] tmpfs,xattr: enable l=
imited user extended attributes
> > git bisect bad 2daf18a7884dc03d5164ab9c7dc3f2ea70638469
> > # good: [6faddda69f623d38bb097640689901a4b5ff881a] libfs: Add directory=
 operations for stable offsets
> > git bisect good 6faddda69f623d38bb097640689901a4b5ff881a
> > # bad: [2be4f05af71bb2a9958c5680c19e5a489636ff42] libfs: Remove parent =
dentry locking in offset_iterate_dir()
> > git bisect bad 2be4f05af71bb2a9958c5680c19e5a489636ff42
> > # bad: [a2e459555c5f9da3e619b7e47a63f98574dc75f1] shmem: stable directo=
ry offsets
> > git bisect bad a2e459555c5f9da3e619b7e47a63f98574dc75f1
> > # good: [23a31d87645c652734f89f477f69ddac9aa402cb] shmem: Refactor shme=
m_symlink()
> > git bisect good 23a31d87645c652734f89f477f69ddac9aa402cb
> > # first bad commit: [a2e459555c5f9da3e619b7e47a63f98574dc75f1] shmem: s=
table directory offsets
>=20
> See Bugzilla for the full thread.
>=20
> Anyway, I'm adding this regression to regzbot:
>=20
> #regzbot introduced: a2e459555c5f9d https://bugzilla.kernel.org/show_bug.=
cgi?id=3D218147
> #regzbot title: shmem's stable directory offsets hangs samba shutdown
>=20

#regzbot fix: 796432efab1e37

--=20
An old man doll... just what I always wanted! - Clara

--39DFDqbGIbbwtrT9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZV/tSgAKCRD2uYlJVVFO
o8ZbAQDCV4FZXYwIy8ASBIAt3hb7RHOZyFsBr+L/iHbLle10pgEAzYqgvIzyHEUT
MovqzV4L+4yX0QW5ste3Jlw7YDWa0Ac=
=9gzb
-----END PGP SIGNATURE-----

--39DFDqbGIbbwtrT9--
