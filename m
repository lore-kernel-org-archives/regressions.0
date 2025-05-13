Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B25F28FA90;
	Tue, 13 May 2025 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143481; cv=none; b=tq4cBIxnyHB3MWZQGtm4sdUB5vhic5I5GaTyA+QznAggjOSdaOGhfqK8XpFyyENWhKpOMZr4bf0XuZY+wZQLZsIZI6EOH2lVSLlA4yc9fV0AsKK56U7tKwTi8cGebSjfoSh+czXvFQD0vK5TVChVY6XIxnt48D+rZgNZwKC1sLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143481; c=relaxed/simple;
	bh=8G5w6xfBLxSdUyuZjf/fIg87efI2wsjWS1VJBlCN4JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbms4PKcjcljZUIOG8dde9D0VNI4ZT7GA41cokaZ+GGZ9nWs4LX9WJP2NFcuJcUsq9Wu+1fYD0BKrJ9vSkQRhn2wDVGy46y4vThQgWWqs+21ljFhu2oxx1Dg7ob/u6RyCgaEGGjBLoXWDNVbxQsmGZ5n72xIZT0i+bpyEByjZlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=Lw91JOC5; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="Lw91JOC5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1747143474; x=1747748274; i=christian@heusel.eu;
	bh=ACb2/qTCKVj8FbXGKYkXf44fngtehSXsaEpRbHvpBws=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Lw91JOC5my6oSQT1qJQNmECo+VFkv36qqshg+sEDopx7hJR2G0/YCsGNJHv5xnaV
	 2Yh5qOaKXdawfuNtn4z52rTeE6H3+G+Rexxc16L2S2cnQMJQ3/kGD5kkyJQIX9VJ6
	 qJdJMLmWVeEjvzPwnahMuVg4kvS2HQAyIb9eJu7+0+I0xtW+Sl4Aoes08gYNhLSbq
	 Aleh1utjIX7Gi6VVuY4ZnbIo5VBGk1Y0qOHfHYwbsnnQ47sW4PgD8OVYOoN41Nciv
	 NOOtmvfbI90PMHzLQ3n0UDIf4CiZM0HaHeO9bp31p/9fj7y8xT9GZ7uzqrnBmjrLZ
	 zSSO7tzNDuOXvKN+OA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([89.244.90.58]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MPGiR-1udnlX18Y9-00JCY8; Tue, 13 May 2025 15:37:54 +0200
Date: Tue, 13 May 2025 15:37:52 +0200
From: Christian Heusel <christian@heusel.eu>
To: kernelci@lists.linux.dev
Cc: kernelci-results@groups.io, regressions@lists.linux.dev, 
	marcelo.santos@profusion.mobi
Subject: Re: [REGRESSION] next/master: (build) implicit truncation from 'int'
 to bit-field changes value from -1 ...
Message-ID: <37715c79-bac0-435d-822d-6956036cb454@heusel.eu>
References: <CAMVAkEvhR+Z28zhxBvnQ64VmXYuP0ZvFg_14e2VuFPQDEpSa+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nikpjjxuhoy7suvq"
Content-Disposition: inline
In-Reply-To: <CAMVAkEvhR+Z28zhxBvnQ64VmXYuP0ZvFg_14e2VuFPQDEpSa+g@mail.gmail.com>
X-Provags-ID: V03:K1:pecKXz7YbqZqbKkyuV9Ooz0Q0gWvIcNnqSEg6abUgdFZr+6JrV4
 VXBYZE3uo/xK2+DsWahFlUYFIcx9MRvd2DgyQocGwpCRmf7hIcusVwxz+x2ai97ikzHCltG
 4z9YunvoI6muDWTY0PoPngbbkPMgqBX25CaIpEzG2iOhNImtprhs3Zkp6tW9xQkMJXiU/sU
 EvafV3uEtThkeLY7XAMNw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Mgcr/LjqJmI=;4181P7eG9RU2lCVvrXvPWKsG8t3
 EPa3Y0DVoLiFK+rGcpUTIO5jvtwKdxdAinuB7cvXeIKsqwIZXIvVXEON7NVDUzkLBXe+bCtFB
 XzCaQA5n2MAlpc9uBr1ZcCmFSwhJi1Dy134+702GUi2oaCHJPKums8CNqVR3+x3P1V/gKeYZk
 aYZ8CQSShDDx6129YbJG3MyhWLLW80GHRPjP8Z0rmpaIpNLeJhbKME0K1sollBYOsUL9r9Nlj
 6K1T/JcJuRz/Fhs4Vq5+KG5g4aO6D8oUCS9RgaIARK230hpCSE1ktAWfInJNgrZo5ztBi3Ujb
 TC1aWdXDd/IREgDQ/Zw+ctYWld+3U7mqydKMm+PChV7MzVnbbiRiN8iYAoMrhnXveh4RiMaDW
 7uO6hggSsgWZFWm5RU5NUj6LAVE5idxsntL0StiFA0UyovlwhADlBFSNXhSyLelcSIcGD2tGf
 SIfUY3sj0/0kxIA5g49oN7mqHVxBwKsDJdZ5ZzbeFm57jhlF3mT0vmNITWWzGjQtSWQ2bvicl
 UUE9Ea+A4zGYSg8fW3u8FXKzUzJnGtsNgxzwpUoXNDp7XyfNuMZzujWvIJz7MxlPgjpj1BY6g
 Wq9pgdMpjfiCGwxrGf0KkMnkivYm9zSf4MMexTm4gKnzvzrPvw5zUcEoroGswFX/7xDfnUFGX
 +Fs1GmBTUkwSDtg0QlopN5Jb/blZ830tQqmejH8pR3zViE9a+/S/H4pL67QLBPHvbJmcflt7m
 ye7m7IdRwiHD5eNqFTgDWrDt4kdC+z/NXwaw3gxkRnxz4yVccCCf1ZjfbQJUsYCzrjNhq9Dnx
 IZM8zJ1hSyw1lZlhzEIKFdKIUthXRhfUxyG+83MzEwz2OXjPp9MFNfZuvCKKKAbjetE9lu/UA
 1Blhg4O55xvc3GiCQu37nnCANeAjt3jL54ewOmEhSsLzcejGdonSsdKYvTwgw774/eCC8T29B
 2C550iuDfU+UmG5Fsn0lUYMZvZSHPK7s+jxJgHAy/bs0wN2Yo/PA7F5K27wBfSvOmbqrDbsLC
 6PwkALbrQdUmq4yxI9IaF3NI/cCeDtnz3v5K8W9gTHJRD96ssaX20fMkosvwa68TfxkK5FauH
 5lXvU14QkRZN4LIajBPbHcz7RkLIPDiALe8ZZ+XWHgL1d4BydwoJNWvkdhGdHMlzJuE8akXGf
 XKAmJDxCV+tE17n2ruq4OmE0ltnHTqMZUjQF0s2SU8mgFbt+MsTlPgMhT45LzJKgCAvSAAmEF
 O/87sceyXFxRCsRQvDGTeeQCnPJmMtdeLGqKKCfLGi0i282tAChTFzOkj40yC5b3lYcSwIPG1
 w8bIxjcxNg7j8QYCpQGMFa5p+9OaYYcPc1KBNL4AetsXdUYCikUgcWGTMvcEc5PWi30VNT+fM
 p6O5K3GtsgvLU05g/1QIagtzfeT748oT3hdYRDW9U0sLRypeOgLmQv4Jc3


--nikpjjxuhoy7suvq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] next/master: (build) implicit truncation from 'int'
 to bit-field changes value from -1 ...
MIME-Version: 1.0

On 25/05/13 01:26PM, marcelo.santos@profusion.mobi wrote:
> Hello,

Hello =F0=9F=91=8B

> New build issue found on next/master:
>=20
> ---
>  implicit truncation from 'int' to bit-field changes value from -1 to
> 15 [-Werror,-Wbitfield-constant-conversion] in
> drivers/net/wireless/intel/iwlwifi/pcie/drv.o
> (drivers/net/wireless/intel/iwlwifi/pcie/drv.c)
> [logspec:kbuild,kbuild.compiler.error]
> ---

I'm a bit confused, this seems to be the same report as sent our by the
KernelCI bot, who sent this out just a few minutes ago:
https://lore.kernel.org/all/CACo-S-0GVFPOW60XRF89kE-hgoLLJku5BiiqLPt3yXztYM=
pwxw@mail.gmail.com

Cheers,
Chris

--nikpjjxuhoy7suvq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmgjSzAACgkQwEfU8yi1
JYXL5w//e0zc9OH+ZX3+Ghy3gyrMJ5nXM/6m6rJmXEhUwAtrpSUXon4mLmWeoBjP
TMeB6CKP6Octf51jLaW/GkbaG12UOYNO0L6xQHl85HerLKe6kPikpPwjN1CMX7/Y
oP/JzphiTdKGUCKt8HHP6srs7K5HMoVbQVY9nsgBxncQl6QEpCPUKXWtVXKRoPkI
3uf6GOQVNCvyQnqRCyo43or0KzZOUzPH316eJQxKQ/ZyAPHnEu4RytHP/snPay+p
Ziab9OEHIa4SBMiq8ajy2JbbRDIiEkk7ZCqVYien8sm8hCLY2qr/Wltar21mqReC
pKePr97FSlCZvJi40NiRUV4JpmB6UmQ9FV8ZVxshIqIVyPo5vomQ/FgUsUUIHoyv
DNgtLUZiebEQ/PNKQvSl3PoMxXbj3JZ00dQmEIZJ6RIVsEHxSvDXExVNYsVjdYYJ
O39jDBwXgFM57Nm8I38dLfdllIoUQW8R2JUU4SIuqkolB69x14MvjnF5qy0czOIn
CVj/XGMHOtAi9Q5Kd7xsIVMooLgIxqXvc2OVEqXgOKpMtqco2aqmcSmmo0D/FFrs
EuDs9B8lAB1R1IBpFbNM7Xiq+yq11Pm/L4nWOx+CpoEAJldCI0shNcXickSHpmFq
KhVU5WhQB5xlgWtJfxlfDzKTOIYnhDzHt/GjLTPS5CjLw79RNmo=
=Fi8p
-----END PGP SIGNATURE-----

--nikpjjxuhoy7suvq--
