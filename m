Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E1214B07A;
	Tue, 13 May 2025 14:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148235; cv=none; b=q/4W0SZrouHHmxnQaZHKZjL5yjPWwtitgMFV/7+g54+PxsV0EYAYXj99nMYMhkzLQZx+FiCGbGVWMRZDmlQyI/cvdDYrPulxKOK/6fld2uxkTIKgotgOZ2H5wcjzeN+9uoffLW07gIw32p5Pq+Gi3NjjSbt+NoTx4GnZejP6AZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148235; c=relaxed/simple;
	bh=2hlxQ4VkIs872qhS+k37M/KdmdnGidr/KYOCni8C5ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfoGpB0UBLLhK89+0qldlJw33lF3OOO5mF0FasUxpqg9yOfN+rZ0NUB6Z6Aw3xL8eEiYQCsQiW6s+DnjYNECgYtlkDt0sCuWDs8xqU20hgW3hFqS6i9+Su3di5T/ZHGEgB/htXQ+HejfAdBWAjn7v2c99HWkmdsFJqbYCNqKCL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=aebLgTYI; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="aebLgTYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1747148230; x=1747753030; i=christian@heusel.eu;
	bh=2hlxQ4VkIs872qhS+k37M/KdmdnGidr/KYOCni8C5ao=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aebLgTYIUTEebXPMbHmppZ8P7Jh7AOIaZbJgML6QiS4IgeXYbkRwez+1Zsfgyuxq
	 KFOjB7sFR/HOpos4Z4wm3D5MpB1QXHj03QAsgxd5uh7by/8VcWNcVWB6i0g+IzmOL
	 wHhumW1kd06n7lCxolFH8/OjdceHrYsEnbSNF13Wl10luFHyb2z/TBarcXLD43CtS
	 yiLPsDhsmBKtik0pxKtWDywbqe8cNU12lrP4hvKY+YmJVAMID7eytrgdbxLjMzeVq
	 tUA2O/H53C6GHYZ4C73QGe1sQKJkW/FTe6K6ZCLpsGYFNL19gL9XrTnn0vOLY1o4y
	 3QKiOoy3ArQ/yqXVHA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([89.244.90.58]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MOm9H-1udEZM2Bod-00TGPm; Tue, 13 May 2025 16:43:59 +0200
Date: Tue, 13 May 2025 16:43:58 +0200
From: Christian Heusel <christian@heusel.eu>
To: Gustavo Padovan <gus@collabora.com>
Cc: kernelci <kernelci@lists.linux.dev>, 
	kernelci-results <kernelci-results@groups.io>, regressions <regressions@lists.linux.dev>, 
	"marcelo.santos" <marcelo.santos@profusion.mobi>
Subject: Re: [REGRESSION] next/master: (build) implicit truncation from 'int'
 to bit-field changes value from -1 ...
Message-ID: <af8e188e-063f-44c3-9e9e-80180f754e8f@heusel.eu>
References: <CAMVAkEvhR+Z28zhxBvnQ64VmXYuP0ZvFg_14e2VuFPQDEpSa+g@mail.gmail.com>
 <37715c79-bac0-435d-822d-6956036cb454@heusel.eu>
 <196c9f897c8.f3ba9f462747628.3709906537041426345@collabora.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mawawmddugybcxuc"
Content-Disposition: inline
In-Reply-To: <196c9f897c8.f3ba9f462747628.3709906537041426345@collabora.com>
X-Provags-ID: V03:K1:zColWfJJXK+Yy/PYJ0VXF2GVHvH7GGHzvGNjALsWDt/H5TLf1KD
 83ergNAta+H+Pnwgh0o5hntMmHagjgYGTiuEdDsFkchb0u/2fqzNWbfH+tF/xfDEtdG4vSC
 tkvQDe1vQPcltPVzBQE78GBsjikjQLbpMlS9UoZVdgLgYAYCOi7/e86nFu6Yto/paDncKww
 g1WQ57/O9li6uxutP/s4w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/6EDUnoYi4w=;vxNugGRybZQxqPxJHyE6V3wUU1q
 o+L1xFw2WmrR9P0tMH3DSXSwodnyXJZyhIzGfLxYXQ1x/16WRtETSoDsA2jLCZj1XzE1FmEqm
 vARTWFAKvVgrxiiYpd8DCiVJJdjOzpbu7hQBKW3KkEBG9HcGovZqph6N35a695eoh0G7as2RC
 N2i68lZf47wWPSi9+ry22t9ZNWdtyfd2zxJ5HIHnagBSI0S6FqCbarNxlLEzhuJTyB4y84pjT
 iwdQPTeNpI3e0I5NZ79dIKIknJQ5yW6Z8XZ0cgg7hKiZ3r/Zk7HjfLKurz2N7Yz1/aqrXnsgO
 itfEeX9mys0M9pBCb4MTOuHhsBAAVG9HqlcQzzce9mf6D/SOBfGbyDxq5Q+df8eUZEAl+jc1N
 cqwVzKDYg9qwSoFebeZjJKHgsiz3hPdD8dVvUOJmfGE5fh1E0haklJQbFa/J3zrWMbS/8MHGG
 L3LPxspii4A1HiuOD7nqEim4gV+rM8irri3SIJc7cCytVqcK2jNHLkoane39xcXFW2Nj2Lypm
 fOG+xBuHNr3yQglh17+PnD1P6uHh5OjY7LfVhsxhXvQnEogrpK5NEDdyP3g57c05yN9EcnCNp
 H9ciCxFc+/ASCDuniXYCCL2FnLO9CFYlxEezy0q6ATQo1PpgZ/BJc7ZW61SPMxJ2UbGl2ujlV
 bDfOjmaPCGuiowK7ktxDjzYSb6FRP6c0XkeBSe5ByWXYEK5uYvSEVpAs9q3htbEJNx6mEWxjY
 4MsljZFeFdlh753T7MmL8WGHi7IgERkcy9VoaDzbB+yahT+quCh98u6H//e1d9vLh/koXp1cN
 Pa5OCUlIfoXcqMdaPuCP/0pEEaY9qy7c9Kv6JbJqop0hin0lgHg8HARCetGuSUEHf/U1dMnc9
 NtYGGSjGRQDr+/D8DSNoSLqdAcL/J4s3sgsmjMWJftOGhE4AtraGgNI21Otj3j9onULHT4D7B
 A+Hen32qXCA0vliQUqJJGpzqhQXWnfAXHLf8GSAJ/JplWkUPvp4LqCXm9NOTCkalq4gc22rdK
 3+yMgLlFJwMQA/nYOUe3t/zIzvbtBvrR/2jVIsW75igmdUxfsugmYc56Cq25Vc1yOnm8sgWED
 NTjaFFHbGvS29v2js5wsa8pIyyC9dK7XrildM6J8hoWsgQzvBrLH+aH6z60cYZmFGaIG+auxJ
 A/3TBTpq9JTk+uMR5hetb0x5iqgcPJ8z5nU/mfhVAe9yVCQhrwmGv8swex2zjApt1kG8yy4fd
 t6QGz0wYIwOkWbVhWOQE19H1wrnoN6/W9GgbIvrIG29resrgcfYDNn6pbuz4QD743fnCi0dYq
 1bLhfbpkVD9jYnWv8Xrk7yMQARPUBkVNYTcE7JbS2QVDo40xY0qinHb43+pnZLl9mE/uIcQi6
 UX1saXgIRhNSggxtbVQ6/Vujhw7SCF87GvFl2q6TYYxHvHmzHS3BFyZ4bi


--mawawmddugybcxuc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] next/master: (build) implicit truncation from 'int'
 to bit-field changes value from -1 ...
MIME-Version: 1.0

On 25/05/13 11:07AM, Gustavo Padovan wrote:
> Hi Christian,

Hey Gus,

> We are sorry about that. As part of the work on the new KernelCI
> system, we have been growing our notifications system in the past few
> weeks. Unfortunatelly this duplication was caused by a mistake during
> the development process. These should happen rarely. We apologize.

all good, thanks for your awesome work on KernelCI! =F0=9F=A4=97

> Best,
> - Gus

Cheers,
Chris

--mawawmddugybcxuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmgjWq4ACgkQwEfU8yi1
JYUH4g//ZERukG8IvzofSjQfCbdnHT6lHDIid/O4sFzROeKV/edG2cHKl4AItjmK
GOe2ZsnraYIb2BSsmzxqm1XHIBTNkK2YoHee93BgyB0SLu8RNN45dZbygFpvRAhJ
8jS3Y7FA2GxuoTqBHOhJtVas8e1cL1XGSDr+N4JHDXFUOyBdSvrv2ty8hBSO1Dy/
aWgntWzji+Lq0wmQXiwfdU+DAZxxSGUphEiPLhhPGc36SIu13QpjXbeBGAm/+XRn
hp3/B2TCLLG+NNiWOV9FRwxPBM37DldhHaJNln8o4wPNDxpZzzPlQzuj3nSlXJg1
ilfLFzheQQ5PkbZ5H2DF25FUxWvXMp2uQ9CYQHFVTzREnHAqEl/XDvuIUHKDh6Sg
fvVRIY0UqyZtK0UV8Vh+nFKvjSOBuRsa55v/vxE2qVzp8GEC5KVQgiDmI7bpqHgz
A9zh+8MmlITyRK60eg9uKeGJo7FWgs2ozeLmLl8nqiW3TTt1NehbYHQUNz5P4XBq
T9gWHXkPYTu0Bz+fZY5M+MOulEyC5kd4wBQT3Xy2Ta6Loz1c0drGqsalxcMXlaAL
BfwIaG0spoC+/H2rEPg9b9CJCYS4ENeNPWiwfYxGvrZuPFqEdL9xdeFswCZ7PN/d
b7KNF0tYuUQ+8vmbGcAapGiyg4iiW2PX+dSXqjg3m8Fk6HV6Rwk=
=cWlT
-----END PGP SIGNATURE-----

--mawawmddugybcxuc--
