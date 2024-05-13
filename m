Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD87147C78
	for <regressions@lists.linux.dev>; Mon, 13 May 2024 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715589775; cv=none; b=FaEMJ8RMP3Lb1ct0v/9YiO48GciyAV+IHLSfRJksrbhHhvo+1mGfT9RQc7XlisRIvPUVVbj++WJQ6HqHh216L283PYiiKQNKcbYYY9WVzbpBmX78dRxe+mtV3QPeUpBpn5DqegvAkrEZIPBE+M3vHR61oMo0IbRIxgnhMQh+sVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715589775; c=relaxed/simple;
	bh=y7lPqf6Kbd8pfKb7R0gWDlNSm18f/VWp7Do2LxaEh3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h5e3AKyGl3a0ECVAMz3sv3vk7mohDnmRiPg7FI5I+bC7lZIMdvurdkJSPkMf7NMPL3pVPv47IZcL4f31KoM12Y2gLfq2JsRHFBsW+KcLRiE9H3cs9+RabjQSci5l8GoPVEWUwOrQjrfxWxxOLQOJ3a88vGK09H5e3yFpVcHIQao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLV449BA; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLV449BA"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ee5235f5c9so30432545ad.2
        for <regressions@lists.linux.dev>; Mon, 13 May 2024 01:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715589774; x=1716194574; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7lPqf6Kbd8pfKb7R0gWDlNSm18f/VWp7Do2LxaEh3w=;
        b=aLV449BAjUQfGXYJD8gehMTlrLrAlhKToPwA7id28EVq6gh+DXQ9WMtzLoan+R59z9
         BjaHbHTuBaMRNuw3BlCqNGNyaKQCI1Lla4flZT3W17WBb4KnTakNmK0VN/DSc2eS6Ign
         cu1eiKV31jNtaqdgV/V2WjxYAvTAUGVf4e+sffQfyksg0aYa46VhotR2CxZeHp8vLivt
         Z1zKYCZdpBGXcOc1UCq6oLb/OmBk0N7aN/XJtQuWpdJdjuRYd1thCA5IXt3SwqY0WL+X
         W00ptrMNvsGMMdBrxbTzyIs68b1xujTFZXdBx2xGtKEf7Qs3atxoaHCiVzWVvS/fz6oj
         pp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715589774; x=1716194574;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y7lPqf6Kbd8pfKb7R0gWDlNSm18f/VWp7Do2LxaEh3w=;
        b=BcIYJsBCXmDMV9vjq9glxQfJIdBxu9SzdBfyZI8MUf1VwxuzZ+VMvZNjV5WFWV7aIB
         H/Qwyh89Aqefxc5rwgaMXCDe4DYE/kFRBuon8pWn7tstu3x3w7AiNC8BiHAvCZcuuKqA
         ASCJXR81uP1fBfUiAE6LYv72kZ8LmxOIxQ6HNfHEqRVY61wUWEVuquZMYn1a7PN+SuP4
         pid3wZvyWGyGSxCMPT1FoBECw08WN4pfWgdm94GK51jXhPP+QVm/7yoDdH6M+l2473FY
         csYNSd2pd5Xze+gfIo6s+MkzmYptEt9Pqw8bjahz/Eyf0QAuXZhkj2EABNuaXpqSkOcr
         srZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7n98SUpIB1jM7rXrqfKcd8vbYMuh/j1hfGcctn4fedbnrbVjC5H8yxXQS+H8up1oMF45ZUDaCOVvlZSTeBNIYcAEw8GdellTfS7M=
X-Gm-Message-State: AOJu0YxGmpUQ6kqgMEnPrx5sY7srypqnU7B82hma0+3dGGFNxhOtISe3
	X7OIIiet1dsMoalx2YkM6cOvOi1XVSqXHf86i6ftYM5eRJ5SlpKT
X-Google-Smtp-Source: AGHT+IG75rkNOpcpo5GhLpsIDduIrQUEWF6yC924gDigs5v7pfDFIFCXraNZ7Di0/yOikq6t4XIz3Q==
X-Received: by 2002:a17:903:1251:b0:1eb:5344:6a01 with SMTP id d9443c01a7336-1ef4404a25bmr103311395ad.44.1715589773717;
        Mon, 13 May 2024 01:42:53 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a32sm75607045ad.123.2024.05.13.01.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 01:42:53 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id EB5A2181C8FA4; Mon, 13 May 2024 15:42:50 +0700 (WIB)
Date: Mon, 13 May 2024 15:42:50 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Networking <netdev@vger.kernel.org>,
	intel-wired-lan@lists.osuosl.org
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	lukas.probsthain@googlemail.com
Subject: Regression of e1000e (I219-LM) from 6.1.90 to 6.6.30
Message-ID: <ZkHSipExKpQC8bWJ@archie.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ae47ss+eiIbn41c"
Content-Disposition: inline


--2ae47ss+eiIbn41c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

<lukas.probsthain@googlemail.com> reported on Bugzilla
(https://bugzilla.kernel.org/show_bug.cgi?id=3D218826) regression on his Th=
inkpad
T480 with Intel I219-LM:

> After updating from kernel version 6.1.90 to 6.6.30, the e1000e driver ex=
hibits a regression on a Lenovo Thinkpad T480 with an Intel I219-LM Etherne=
t controller. The system experiences a freeze when an Ethernet cable is plu=
gged in. The issue is not present in the previous kernel version 6.1.90.
>=20
> System Information:
> - Model: Lenovo Thinkpad T480
> - BIOS Version: N24ET76W (1.51) dated 02/27/2024
> - Ethernet Controller: Intel Corporation Ethernet Connection (4) I219-LM =
(rev 21)
> - Kernel Module in Use: e1000e
> - Operating System: Manjaro Linux, kernel version 6.6.30-1
>=20
> Steps to Reproduce:
> 1. Boot system with kernel version 6.6.30.
> 2. Connect the Ethernet cable to the laptop.
> 3. Observe that the system freezes.
>=20
> Expected Behavior:
> The system should remain stable and maintain network connectivity without=
 freezing when the Ethernet cable is connected.
>=20
> Actual Behavior:
> The system freezes immediately upon plugging in the Ethernet cable.
>=20
> Additional Information:
> The regression seems to be introduced in one of the updates between kerne=
l versions 6.1.90 and 6.6.30. The issue does not occur with the older kerne=
l version 6.1.90.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--2ae47ss+eiIbn41c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZkHSigAKCRD2uYlJVVFO
o0Z/AQCIkJz7plid8wPPU7db5xKtA7Ftq60HC/uJ7718jfmBkgEAtvtduKsDn2CB
sliUh8IN6Cx7oNQTIYq+Il73paLXMAk=
=lNxt
-----END PGP SIGNATURE-----

--2ae47ss+eiIbn41c--
