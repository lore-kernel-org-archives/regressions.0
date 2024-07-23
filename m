Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367CE1514D1
	for <regressions@lists.linux.dev>; Tue, 23 Jul 2024 11:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721735008; cv=none; b=obyKnb2xCuuJajZuykUXblNNdU811tP8gqzo4hGfXyx074SCvvZKhG6bjT7dBLFafC8HloDU97EZEgJwklgKz4M+UM9I9xU3edL1X8X4py2w+5QOZRF5N3723RJBt0RwUXLVCNgjz0f7icZd/8IYzjydvkUFJqv1SzinNbYpb0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721735008; c=relaxed/simple;
	bh=dcVzZh/D6SE/jVfzyebotgo/j2CwL3i4ws5sqPQiO0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHf5qx8Xnqh8GwLVfmjG1iK4w771Mm9GC7ZYzK/+k7Xi0gI5UoKcmdjOEm3CT0QqqiMeEDVAe6VL28/YojMhX6JqBm/e9GpzwWnmYl9wkOBqWabauw03ctUwpyoOE/RnYFhvJFAOpppuAS1edMpq+CuyIOYjW+Qx8JBvdSTByqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=wKPPdJnW; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="wKPPdJnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1721734974; x=1722339774; i=christian@heusel.eu;
	bh=teXtj4vslDTteJSMm7DSduOkkLrsgn82XW+LV0BIyuU=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=wKPPdJnWXklcFVZLQkZmwWlxAicSqeb6T3bV67b0EAuhD2LseLahP/r98h6k1oFH
	 UmBbdHU3cC35YYrirsKWD86hYu3p5CtzOtjUtYnAO5ys0T9bN05wGvWtwsin8a2kb
	 a6TYUIoH9Dtsf2/1Ng4G+3BVAxCn6Z1tYh7RDmUpy3CviwxPeYSXaibxuL85stA1o
	 e/QYKrYhdPMtiLFtuTjumUahilJcIV1adv51DdZ9pUSP/ohNzQsSmz+brgJdGV2rN
	 IHqZPlqBjNb8i/3aNE908sdIDbm0wnVR8HuW+2u6xxMhfEuxAJrOLzWgd45641Ix3
	 MJAVSTZn7cAcNw+ktg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N4h7p-1sLSS910C7-0111lw; Tue, 23
 Jul 2024 13:42:54 +0200
Date: Tue, 23 Jul 2024 13:42:52 +0200
From: Christian Heusel <christian@heusel.eu>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	regressions@lists.linux.dev
Cc: x86@kernel.org, rob@durendal.co.uk
Subject: Re: [REGRESSION][BISECTED] Early boot hangs since f0551af02130
Message-ID: <650596c2-f492-4a5d-87de-33fefe0641be@heusel.eu>
References: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="snfbcu2dbksqstvu"
Content-Disposition: inline
In-Reply-To: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu>
X-Provags-ID: V03:K1:jGHZup0tLxP+q5r23CZRrZoNtl3ia6iJw7Q1ENXdfSv9QKYbgrn
 gsczmmw4R36sLOXa9vMFtK8HMpYWypJdqMUacr4qmgkPksT9ekez4raTo3g9z2Su6ZmnxOe
 UO9GJf6xT+tWX/5M88B030LNn0G1o5q2NjLjVOaAy2I2kTd7gXW0Nb6qcgXOmuodbl/4oOi
 L2LZVHsoAtcwfay7fRdfA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dm29/pG9F24=;QjKETu07ceCtdrR8o0+OnZo8z5+
 iMMN8OpVqfQvSWt2GLFD9JMZTjPA2WE+yoRmZ6o5qFX3pfN8qu2MfvEI5dkUn5dyf4ixmkghl
 lFJQQo7ZcRQovWINXsKnITOXzHwgurV9AV6Bz+oPiClyVa8K/h6KrppDe6RYoxu5TkhOUQqs3
 FGlrpDJ5PX3PSDIPvPCqObOYzc0sp7yZVD+Z6Lw44rKil2P5y2C48wC35hwjyi6Fh87E9HwAI
 zbcLnOn/wV46GlhJ/crY/0nY6Cf55a/JaZX9PvUx0U56R9m7uXcCAnGUlGWLDlLuoqosEUFu9
 dxy+Zp85ShSArK78WwpS3rNUjJRX313FLeDLzdWHeqfiLLCVEz9XDxFUiUu0vXaMKRx0UNcIp
 t2zfwD3klhctlSS+YX/NC9OOoDAltDlRaD5Jb0sesJjYmFbVTaD65NJKsuD82N3U/78fF7lHC
 8h5T393lB4LV0FRBlkzY0vFKwb5JtUD+heYVfeziJ2gnTNKj3CQeFGqtmdvC7UXU6Yb2w74NM
 RSePhRTdQ+Q5fsTNsLzuj66c2xyA5Ri8A6LL426CkCL6xDS+7+gYDyZZ1e1HLCY4NqQwdC8ns
 gbL8KbkThWIFkqW61FbSZabrsu0OE2WhTnK078odfadJoQOsFW4bejfqWs6zQlhERn+cr6P7H
 sHo5rYOo/bR3PHfVD0V7K9FUBks69ZUUjAo/gESIU8gUHswoO7fHZVqKJM+inXs0O/ltRFxdk
 DUB+6jTywTMWmDbbDTUzMeuA+5YT5kUcg==


--snfbcu2dbksqstvu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 24/07/15 03:11PM, Christian Heusel wrote:
> Hello Thomas, hello Borislav,
>=20
> Rob reports a regression on his AMD Ryzen 3 1300X CPU that causes him
> early boot failures when he does not specify "iommu=3Doff" on the command
> line.=20
>=20
> We have bisected the issue together [in the Arch Linux bugtracker][0]
> and landed on the following commit as the culprit of the failure:
>=20
>     f0551af02130 ("x86/topology: Ignore non-present APIC IDs in a present=
 package")
>=20

Just asking again, did anybody have a chance to look at the above report
so far? It has now been a week since it has initially been sent out :)

Cheers,
Chris

#regzbot poke

--snfbcu2dbksqstvu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmaflzsACgkQwEfU8yi1
JYXMFw//QxMphn8c0BlrvCgRAbqfyBXgQm7i4SMoLi8u/CJjMmcd+4HNyIDY10qZ
l8jc1/z9XFOO/buOAsYY7HnTcT6SO5VXZS0ZdEjOuqLEAYTbJbdguFTjnLcvD+gw
S6RQgpwyFX4jIAjL8ubh9KNL5t4qiAreo72VnxTmyXHaOkGQS6Cn3cIb5o/hFn9h
7sMw/Ayh0QDPe6YL9ZauT8aNwpvreMqjPH0dFPLkQhgLdb5HWRK9g3O7YDEJdtfs
70CeSsR/EDd/6UA6GYS6dCVfgPB+vxIHbft9lgY9G0Xmv+Zer/NOpzcITzrCVL7v
aS7AxJ379JV2OSeASZ3NpnIiy5TPLMGtFBO/j4W8wH1ZVBigj8mrLU9nXhlt703x
iumVkKu51wI+uICun3FkTLDDJIQD7vlm5pnJlz9rgkd1R2zNQO1pr+JCBo0f1dcR
OtKCJgKZTEKtTyh6y+HZf5RO4611Egp/DvXEi13azEQ8phr/0xBGdxtCX1LOzQ8O
IAPCywbQAbTtsPeLS1efgTFAz1nlbqoA4lBypkTVfiqbOgKGYS3cq4QHcAYhrWj7
fVsix06CZ1TomVGGXNuKyyBlylsXbKXm7zmeLX6e2BzUsl8kx3XheZVq8OyKirHv
VjUwn1G+QauPIyVCJh27HiJywroYYGHAJDLZQ5+iTcu3SBRl7qM=
=i7A8
-----END PGP SIGNATURE-----

--snfbcu2dbksqstvu--
