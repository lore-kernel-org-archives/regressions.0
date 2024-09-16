Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA2610A18
	for <regressions@lists.linux.dev>; Mon, 16 Sep 2024 17:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726506462; cv=none; b=MFzismMZtrvicQ5YpS1aU1d/mKdDNWUkGUtj6tXyTvhHwGrgSywNmN1cihxbPOA/StcZRRyjOfc6y0+SJHY2kVHwcdusq0B4BUmwRHSN4KoO/+KOwv2aED5zqFOxd/DUAaTZ8fyCRqzXZkNCAqIe4ikSEZE50SH9qxzwQpSQfCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726506462; c=relaxed/simple;
	bh=gmW8LMGPfq9XJ4q4c9Z/fIcE6999FiTf5uyI7KS4hfo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnNiB/wte/6I5CwQtwLdgIPKmW6YqoMo9yMuu/THycQqe/1r51IJf0k0jNFXXK9B4MxHTSls2oSgQWqU9u1mnfg1T78IrJN65fTr2MC72etyaIp+7S3NaG5JlX+YG4DJIOqun01o7ATkZwV/jWGHGmdVtThGB+3DrVOUf4jccVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=0CIkGXi3; arc=none smtp.client-ip=217.72.192.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="0CIkGXi3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1726506451; x=1727111251; i=christian@heusel.eu;
	bh=gmW8LMGPfq9XJ4q4c9Z/fIcE6999FiTf5uyI7KS4hfo=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=0CIkGXi3KF8IgidbevYalvwFY86PAA9RWxr0UNhuI7FRNYatoX1MqtwaoOt5hmhm
	 eyRNO0RutXaagivnVN3hEjwTBZtUJ9cSP+lVY6NqGzjnM3IhpUJaizuebuRv5q5qt
	 ooHIN5q2sw7YCrjx8tO6opb3uxxE6kmnAYmccClVs6zg2RvFE8p7/pYhkyOfUiCgD
	 Rl57bK0MGJ2NEqdAxKGGv+SssFIXPZ5UdKla8XKS7fNp9ZiFd2scJ+zkJmoq/f7Mr
	 zRGZIrCCLp0clA4Yi5RY4Zhxrkt12WEPALVeH66I0yWMIlbnAaF3rbmSawgWKbDl7
	 ktJo6q1nQ9fTDEzWOA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M8xwu-1swJCX348k-005eYk for
 <regressions@lists.linux.dev>; Mon, 16 Sep 2024 19:07:31 +0200
Date: Mon, 16 Sep 2024 19:07:30 +0200
From: Christian Heusel <christian@heusel.eu>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Message-ID: <80c2eac1-8b10-4f55-974a-881909be5af3@heusel.eu>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jvewxhhatfhrdwat"
Content-Disposition: inline
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
X-Provags-ID: V03:K1:thuvJnwNh5mUo89/2fhbrnrY7T3Gh+7pvRYu/2AA350iwFY4vHZ
 ExUGea/52/CDte4hpyk1y3um3H1LT+c+mJNFO6cDetf0xbB6PY7HtIMF6w77K8CiK7WMPSA
 z1nnGwGzhfj2kELtaw5Xh8mmLA3BKQCBmt1L9X/O2UYSUpHXPMwRLCDNjHuIAJpmsILMB+G
 1m0hQe5TI9Sy6JXRmm1Ag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:55d1IS4Au8k=;SkP0S7Cc06MjK+J+wLCH4y8UZet
 wP3lDtse+fl/kpfEPXi2PIrZfZs79XqpHc+JAwiupRkxxfR9L1RqODg2aDfeJqxQHgDPg6eGH
 lb1+2coSSiRvComJCjToCN3Qg1cy+8AIL2y2ho9Oq+3p1H26LWypXSjqNNWj3RGVIVOSweJjp
 u+10Us5hxp5cuoMySlhkpKdFOtfe9kaRT0e95qTh2vFtmOJAurNbCZt2DhGOidoJ2dFsEKnFj
 etrGKv9rVZ0Y1TGeqBV3O7wzrXDxTVEWQIUc7TxhdRHNqbOIc8v/3srGdN/Yvd1hPJmx5Lt/V
 sg4HyPTUi3HScfbafLaRLazjaumtFQkWcFWL3dmKa3Lfs+gv1S1W2A+YBHyrJxADkVgAtl3B8
 RWQuJYdQLevpMq87/wih11mQA8NI1U6WVzbMritD6fTN3yJZMpBkObm7BQvOM2lw0Ppy/BN+0
 9sxGmyetKIkH6DDpSoswT9fI/fI5XMkE3k9TeXEFke5ruPCHmsgLOTVckEIpnmvIhGv+PeWy4
 1z5n9AFZUkslSV88AP/OTy3NStKrmtv+qAC9bfc6aCBudObfblVWn4GqzHjOUJvwnMPws0Os/
 uRuyaGkWo6fg7v6pBF9Ki2PJJ5z5VdWnVyAmLTOlkkEOlrmiR74HPbDopVMMRkpxg0Qyza/ua
 gqSPOIsK1Sv4inXG9KUOq/YLXidmlOWgu+JtVh6b+D4JDF4bjO8GfKppcesgO2k17EXI4o19A
 LbpUthtSe2Qg2B68LlcBs6eVWQQf8ft2g==


--jvewxhhatfhrdwat
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 24/03/09 11:18AM, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

Oopsey, forgot to add the regzbot commands to my initial report ..

#regzbot report: https://lore.kernel.org/all/c930b6a6-64e5-498f-b65a-1cd5e0a1d733@heusel.eu/
#regzbot introduced: 4178d78cd7a8
#regzbot summary: ALSA: hda/conexant: Audio volume issues on the System76 Pangolin laptop

--jvewxhhatfhrdwat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmboZdIACgkQwEfU8yi1
JYUpMQ/+KMxZ+ft2MjR/kps0aWZKb9tZ2Hj+xvoPR04Gx7ziHg2qgpaER9MKNVNt
4XSLLLiBh3XtigtPWyLbYYTUFtiDbVjN1tzBBBbn4qRILnBmFjpTcttDLL2CouVs
0fB23wKPQ7M49TRhmpVVw8Cx8QwTvI8DXCzUk0zDFIzxp7tkgrUQluyR/bD3KImh
MxUNeRM/SmVAjMhakwLYCoZt280KyCnX32URDB35x95K/Gpim+TQIfIYgyysgvK3
DXChBQIPlPXN/6PGPCfjuf9HJJ9pV9DkjV2CST+DUhTQoMv4sbXut2S2bWKi3DYX
2Jo9Y/s3JFs9aR1nP31fa6q4IvaGPmDL9c3YuWR4me7o3yCOrQr7SQL863RPZX4C
y3XpY8tjCOZQvRdMPbfx/ymxED++b1SMctA6tViINO6aGpHk9jz0C1gWhcjaBdPv
pMdB169Z0sKCle2DUjpNTldze7eRKXpaI8n1kNUQF3UXl/SY7ZjMna3h0/COsuEo
eoGf3+uM9rjRAiVqCsNawaV3tiJLUKHWdj7EMcYlOcgFis4VUbWVzSycxR9zNYEe
EAHFiaz3Sep4Zy7sg3lb8mLZzu5aBzqWQOMy3Lf8fTt7tht8Jjql1d/64F9fr70i
QY9EGOTk6olzVauWLKGeF0BO0uHwovYQ2epnh2+vw+xEeZ9GHsw=
=9v48
-----END PGP SIGNATURE-----

--jvewxhhatfhrdwat--
