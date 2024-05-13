Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF821474B0
	for <regressions@lists.linux.dev>; Mon, 13 May 2024 08:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715588939; cv=none; b=pRKaRx5UQPUdNmE86uavfnTlKMHWlWnY9birpUncJt4O/kzg7TY1dVxrVgVAyOyey2Putj6jDg6sySGGxEmbovwlBt1CnjW/O5npJSGgC2d2uKAf4NXqdzm0UBMyDL3Yv3YqkGlGz+1OwLBsavR5gvAarUf8g+L8KavNtgclq/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715588939; c=relaxed/simple;
	bh=1l1gBuhAghDzGTpmKFRmMZDa6k+2TjMJBTuOI8PxFZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dtUGb6iGhk+tX5oJZzwotMy6FGi+A5L8VMPEfULLNT6r5iXwmT2KSojNPUlLfpyXQ8Bsd+8frrpUSBp7oxLMtdkLAP30RqnXsU1AgAXXDc2tCiroB9l0x37MNZHnPSXIG3yIO9/Vl9AVLpyWTW0bqtzkHCZuhpzNuhf9dlG2TyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gS7vWV9o; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gS7vWV9o"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ec486198b6so29578185ad.1
        for <regressions@lists.linux.dev>; Mon, 13 May 2024 01:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715588937; x=1716193737; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1l1gBuhAghDzGTpmKFRmMZDa6k+2TjMJBTuOI8PxFZE=;
        b=gS7vWV9o5B/f4p34De41/pLli5mwcqELKY3wRneil5eApqtKBYiFtdrVpPYQtQBe3I
         TzBhc6CWMQApidwSanyQ76chzYZ7ev0eg4O1tOif0f04ZUd7EU/1WpmjkK4/BOHOHHvP
         rIciOPbMHPil1hI5bALTJZh2fx2RAUAbvxZPOr/o+31xYq/jlgxAeHLIDnwcXJvxe+Ml
         Kc6wG6b39cWBAiIu5IIxpxmMK5mrjue9qWSBfMsWdy7+eKLVgD+G44Trqa2a3fZ/zNxj
         FfHX20Uz9hjb6FnemInGU5cbYuLAnc2gDCIKj7gtG+PZI4pFRKkUxuetq9G1Mmt6PPUP
         sa1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715588937; x=1716193737;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1l1gBuhAghDzGTpmKFRmMZDa6k+2TjMJBTuOI8PxFZE=;
        b=VI9iquyantJrXHmFlpoSKfn8uAUz9ST9//zw39RXTp11U43+80dududs5UgUPz+WHg
         BshNJbM8DyhfdRwqe2HvxrCPp6QsheXvGYJiVT4VwqsjTZMJJO21bmOwYbu+HBN6vMYn
         EeVn0qcSdRILWMjKu4z6f/VuPyvH7OxnWUAA3ljzyODxpaLmudoNrtDWuOWWYEWfPUPB
         7OtMcEiv6OOOwEazAnqNIhEjKJ23YdscQF0TPvMB4xaVtq/MaunwJkvKQlCgssiPV55Z
         NvrPXPxRIcydPIv0Tu5s8AzyZNUlspVYf8CPZejHY5Z+hP87iZnmdjUXY7IUBMQi62bY
         Pf+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJRm/N2aZIVliRc/5LOJ2I1/dLPeNK9N6qg0LPOovE2HWxFs9TSZ1DaaZrhDVC491ezzC239IapxHu39gND0p31n8NLC3cBzGYuwo=
X-Gm-Message-State: AOJu0Yx5W8KlemxpdNcUbcyp7g0F1d0X0ZpSlocgMAFkBBoz3otdXv/J
	Laplo3rGk7eXGeasa618/X+2BR/i8DZHkqUEJ0FGppqUc6OOqB21
X-Google-Smtp-Source: AGHT+IEyFi9OkHesvUDKD8WJBIa2kU2vFMcbgW2nT+sM0xKfUBCZ7S9sE6dvQzu9KaR545YjlGNXYw==
X-Received: by 2002:a17:902:da8c:b0:1eb:4a72:f468 with SMTP id d9443c01a7336-1ef4416113fmr111274895ad.52.1715588937322;
        Mon, 13 May 2024 01:28:57 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d1807sm73594535ad.59.2024.05.13.01.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 01:28:56 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 26731184762DF; Mon, 13 May 2024 15:28:52 +0700 (WIB)
Date: Mon, 13 May 2024 15:28:52 +0700
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
Subject: pi
Message-ID: <ZkHPRBLlHJpRytIB@archie.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MqJ187FVOnOf64oY"
Content-Disposition: inline


--MqJ187FVOnOf64oY
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

--MqJ187FVOnOf64oY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZkHPOgAKCRD2uYlJVVFO
o5k0AQCvBu6nHDzpTwo8OJz3jjdqc5D6AsxCg7E3p+QX6zJ72AEA1/QI1liupwSO
V+b6OxS6Ih+R0okARxUMwGuT3svVQw8=
=hyi0
-----END PGP SIGNATURE-----

--MqJ187FVOnOf64oY--
