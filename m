Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A758FBE47
	for <regressions@lists.linux.dev>; Tue, 14 May 2024 05:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715662824; cv=none; b=OLxIavDig9HPorldqTTdkIQJbXcYOWtqDK83auuMCqyPZlmmoh2GBKCWHiOJIrVUvupTzzeeDV83weKWq4SClIGWN4aSNJbrKGuxif1P1ynBi2DJCmJhkXwuw927/X6T2mnFhMnA+pgOY04+x2h32H2yKS6oupHURf1NegxkwoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715662824; c=relaxed/simple;
	bh=WX7VG3BVk9XSoR5DqCAUrIPNR1eRdJyWanKtGcOcsYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MtgbxVvCxC+EDIhTqtiwptiVt0BeWakc/qiu77oHFpfoNxem7RLS6X5Ql+59iC+1EUBkl2+5XszPwtXz9uZu0oazfg32ay0jYt60mO4qXi6kHj7BwufQbP4MWQfXQQogucvKY1gj9Ae26pP9ONDnnQKzWqc0UIhI9bsN/7m/jcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBSy7xMV; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBSy7xMV"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6f4603237e0so3555625b3a.0
        for <regressions@lists.linux.dev>; Mon, 13 May 2024 22:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715662822; x=1716267622; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZXNx2Z+E3SWT+ukr47s2ttlE9TfM7OSzxxKe700bUPs=;
        b=TBSy7xMVOfWwiZWCL7w4WEkVvF3uXQg/5FSUJw74/x0qYsCkVOG3bjkdFz6yLPG6YV
         FW76gFyKTw1oCheLVDMfhWP+uHSJriHRQwdEISz7Nkx/6avi37tYI2k/9oU/y4v7ZyTm
         rl2lF+Miawh5VgnliHSy2SDfUMtNYQuGQibpV6aApYXLCSlmAbll4KCNbapYj2OIvJbm
         iP3wycZGeP2RriPMBJRI+Fl6hMTwCyQCVuvEp8UxGVR5+yqyza+zUSSKdPz88iFxsGBQ
         E9YTzzHXlyJlVwIbPUFK7z0g/oLyP7dXIFcGfRZMIXuIkwBnzsFxQbtiXSHBZffoyR4f
         Soyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715662822; x=1716267622;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXNx2Z+E3SWT+ukr47s2ttlE9TfM7OSzxxKe700bUPs=;
        b=pAESgMYBFVHp9i/lJeVa+J7csatyt+jHhdApvuXNLzwnZOQPkUMG+i1fzPDKiKmH2w
         vx0ediEwuY/D19aET4ME1s/CZyhqcxplvzkKPZ8pChmUJc42f1yOpEdxnpkgmA1MIhZp
         R5A0ZoOBqRAn+F/sxg6KKLBpRj/k/98Jh8lHnZQRKWdFgC9SKxJPa9eQZAzOeDEwNxH5
         cfzvEqBUy8auTtbqXZuSKTIY8StZg8YbyJSq88vHsEsTNl8vlxWKb075mt0/WksLt0oY
         +E8oQI5yDgUBeWaL3E5ggtpjUTPOcQwcLWWJGek48kzzA1YJVKpvQAIofk6/16q+36MW
         iQlA==
X-Forwarded-Encrypted: i=1; AJvYcCUOzwev3I8jq3PiRXObYlzsPCLearwHeQ4+9klDRapxa1U1t56FhVIcO3ZHm3hii3vCgYUWTI7wkqsycIMS246Wf/Jq4wZD1Qn9HBE=
X-Gm-Message-State: AOJu0YxVmiiefqsdoTaT67CUr+v9iOz1hXsSyR6UomO3eaJ7dllJMvpY
	l375fWxUtmrSImihLNJ85bKD6k+fyEU/68hPscP6jfHvnsEOuB2A
X-Google-Smtp-Source: AGHT+IED/FDIqZjd+pjzL6M2mZKkK4nwgYtSITAYtDSf47BelW+pgQGsieNiCMEsJeuVPNlVRnJq6Q==
X-Received: by 2002:a05:6a00:2d9c:b0:6f4:54f1:ccae with SMTP id d2e1a72fcca58-6f4c90b608amr20178902b3a.6.1715662820941;
        Mon, 13 May 2024 22:00:20 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2bccsm8904470b3a.170.2024.05.13.22.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 22:00:20 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 80098181C8F95; Tue, 14 May 2024 12:00:16 +0700 (WIB)
Date: Tue, 14 May 2024 12:00:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Serial <linux-serial@vger.kernel.org>
Cc: Gilles Buloz <gilles.buloz@kontron.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Vincent Whitchurch <vincent.whitchurch@axis.com>, vkrevs@yahoo.com
Subject: Fwd: [regression] [bisected] commit
 6bb6fa6908ebd3cb4e14cd4f0ce272ec885d2eb0 corrupts data sent via
 pseudoterminal device
Message-ID: <ZkLv3wn62jqMVpSF@archie.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FhXQwPKZX4lMLcx3"
Content-Disposition: inline


--FhXQwPKZX4lMLcx3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

<vkrevs@yahoo.com> reported on Bugzilla
(https://bugzilla.kernel.org/show_bug.cgi?id=3D218834) pseudoterminal data
corruption regression. He wrote:

> Hello. There appears to be a regression in pseudoterminal support introdu=
ced by commit 6bb6fa6908ebd3cb4e14cd4f0ce272ec885d2eb0.
>=20
> We have a wrapper program that uses a pseudoterminal to transform data fe=
d into input/read from output of a child process. Transformed data is writt=
en to the master device, the child process, whose stdin/stdout are mapped t=
o the slave device, reads data from parent by reading from its stdin, proce=
sses that data and sends it back to parent by writing the response to its s=
tdout, and then data from the child process is read by the wrapper from pse=
udoterminal master descriptor.
>=20
> This used to work fine on various Linux distros such as Amazon Linux2, SL=
ES 12/15, openSUSE 15, RHEL 8/9 with pre 6.0 kernels. However, running our =
regression suite on Amazon Linux 2023 which uses a 6.x kernel revealed regr=
ession. Sometimes, when a lot of data is written by the parent process into=
 the master device's descriptor, some data is lost or corrupted when the ch=
ild process is reading it from the slave device's descriptor. We've verifie=
d that this is a kernel regression introduced via commit 6bb6fa6908ebd3cb4e=
14cd4f0ce272ec885d2eb0 by performing kernel bisection as described in https=
://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html#intr=
oguide-bissbs. Bisection was performed using openSUSE 15.5 in VirtualBox (s=
o the kernels had the tainted flag set) but the issue can also be reproduce=
d outside of VirtualBox.
>=20
> Bisection logs and a repro test case used to perform bisection are in the=
 repro+bisect.zip attachment.
>=20
> -------------------------------------------------------------------------=
----------
> The test script, ptybug.sh, pipes a large plain text file containing 1027=
800 plain text records separated by newlines into the wrapper program. Each=
 record is a 0-padded record number padded with spaces to 80 bytes.
>=20
> The wrapper program sends the unmodified data read from its stdin to the =
child program via a pseudoterminal, reads the output from the child and pri=
nts it on its stdout. Wrapper's stdout is redirected to a file which is the=
n compared with expected output.
>=20
> The child process reads exactly 1000000 records from its stdin, strips of=
f trailing whitespace, and prints the record on its stdout.
>=20
> Both the wrapper and the child process mirror the data written into the p=
seudoterminal master descriptor/read from the pseudoterminal slave descript=
or into separate files - which are identical on kernels prior to commit 6bb=
6fa6908ebd3cb4e14cd4f0ce272ec885d2eb0 and which differ on kernels that incl=
ude that commit.
>=20
> -------------------------------------------------------------------------=
----------
> How to reproduce:
>=20
> tar xvf repro+bisect.tar.zstd
> cd repro
> ./ptybug.sh
>=20
> Expected output (on 5.19.0-rc1* kernels prior to commit 6bb6fa6908ebd3cb4=
e14cd4f0ce272ec885d2eb0)
> rm -f ptybug ptybug_child gen  *.o
> cc     ptybug.c   -o ptybug
> cc     ptybug_child.c   -o ptybug_child
> cc     gen.c   -o gen
> Test run 1 ...
> Test run 2 ...
> Test run 3 ...
> Test run 4 ...
> Test run 5 ...
> PASS
>=20
> Actual/bad output (on 5.19.0-rc1* starting from commit 6bb6fa6908ebd3cb4e=
14cd4f0ce272ec885d2eb0 and later kernels, including latest)
> rm -f ptybug ptybug_child gen  *.o
> cc     ptybug.c   -o ptybug
> cc     ptybug_child.c   -o ptybug_child
> cc     gen.c   -o gen
> Test run 1 ...
> FAIL Actual and expected output does not match (gen1027800)
> FAIL
>=20
>=20
> To see the difference between data written by the master into the pseudot=
erminal master descriptor and data read by the child from the pseudotermina=
l slace descriptor (stripping off trailing spaces) run:
> diff -u gen1027800_sysin.txt.nospace gen1027800_a_out.txt.copy |more
>=20
> One possible output is below (every time you run this on a kernel startin=
g from commit 6bb6fa6908ebd3cb4e14cd4f0ce272ec885d2eb0 the results are slig=
tly different). As you can see lines corresponding to records 17861-17862 h=
ave been erroneourly replaced with lines 17858-17859, and so on.
>=20
> --- gen1027800_expected.txt     2024-04-26 14:39:22.287121535 +0100
> +++ gen1027800_a_out.txt.copy   2024-05-13 15:52:48.915952662 +0100
> @@ -17858,8 +17858,8 @@
>  000000000000017858
>  000000000000017859
>  000000000000017860
> -000000000000017861
> -000000000000017862
> +000000000000017858
> +000000000000017859
>  000000000000017863
>  000000000000017864
>  000000000000017865
> @@ -51261,7 +51261,7 @@
>  000000000000051261
>  000000000000051262
>  000000000000051263
> -000000000000051264
> +0000000000000512651264
>  000000000000051265
>  000000000000051266
>  000000000000051267
> @@ -104576,9 +104576,9 @@
>  000000000000104576
>  000000000000104577
>  000000000000104578
> -000000000000104579
> -000000000000104580
> -000000000000104581
> +000000000000104576
> +000000000000104577
> +000000000000104578
>  000000000000104582
>  000000000000104583
>  000000000000104584
> @@ -110897,8 +110897,8 @@
>  000000000000110897
>  000000000000110898
>  000000000000110899
> -000000000000110900
> -000000000000110901
> +000000000000110898
> +000000000000110899
>  000000000000110902
>  000000000000110903
>  000000000000110904
> @@ -279673,9 +279673,9 @@
>  000000000000279673
>  000000000000279674
>  000000000000279675
> -000000000000279676
> -000000000000279677
> -000000000000279678

See Bugzilla link for the reproducer mentioned.

IMO, this is quite different from the case fixed by 56c14fb4086b2d ("tty: F=
ix
lookahead_buf crash with serdev").

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--FhXQwPKZX4lMLcx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZkLv2gAKCRD2uYlJVVFO
o18gAQCN9uc+cZ4uY13FfkF0y4a9fH5vuQL1tKXciJwjsC8lAQD9H/5fOYmkf3V8
p7cTZrOxl9rYUWA35/QaSWAO2w5S8gQ=
=8tYJ
-----END PGP SIGNATURE-----

--FhXQwPKZX4lMLcx3--
