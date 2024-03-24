Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E2F17C64
	for <regressions@lists.linux.dev>; Sun, 24 Mar 2024 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711282769; cv=none; b=ikirkiW/UDl27bNSgLzMM6CEV7ZxwLyEOLJWk5goL1DnGR+yqcfdP6oSvHdgDVxH73D3XlHItTY0BcnQpOA88KVOTVi0nwD4vwPABZtpgaZNVi4CwTNXBWYWKAbAcnOyD6ILREWybDRlcrVKgogonmEIL6ufC/SSI8GEoP12o9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711282769; c=relaxed/simple;
	bh=yBX68Xikv2rP8bZjBVlK9D0R5VpbUnY1v5WiTs3tP1Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qnXhvtrPTbDzmywnB94tsrEHvw2g+aSnxpQnvw82M/xgSeJRW1Gig18/Qk4WntWQ0Yl1cFDtLhPEW5rXmCFR1gMUQnu/Kv81xzLFVNC0ZC6COgtENvQlb3N0S580Z2bjxlNia+2/Qda02rG/+icMQU8UcdBnmLN+ZOhH+cpJezs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thefossguy.com; spf=pass smtp.mailfrom=thefossguy.com; dkim=pass (2048-bit key) header.d=thefossguy.com header.i=@thefossguy.com header.b=Kn3U7uFE; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thefossguy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thefossguy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thefossguy.com header.i=@thefossguy.com header.b="Kn3U7uFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thefossguy.com;
	s=protonmail; t=1711282764; x=1711541964;
	bh=yBX68Xikv2rP8bZjBVlK9D0R5VpbUnY1v5WiTs3tP1Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Kn3U7uFEgnmGYtPYg5gvtf/OVEvxfIID8t+IFT+N0wyTW8X3JNhI4YTEFib7Unptk
	 E0lBJvJAmkY251WCN0cSGDOGbhTF1AmQ977yEurro3Ju+4KZZgje6JPcNSEXe00TcV
	 z/lQo7/ffocEy5bTR7HgciCxVDxZ/9wOcdCNw+Yo55HjHeqcEYA80GZC50k4ClUZ/P
	 DWf8PUkHVLah9POZm9Nf4UFXKmv9kw0wB+NNjfdDpgaLDALVHbJeYOgXclFtBnTlaG
	 hRONLTTUN2HKZgGub5I0Nmu06SbbhAyk5A6gXggqZ6chxLfppdyE09OrHxXQlmQF4E
	 QWzwRefySnf7Q==
Date: Sun, 24 Mar 2024 12:19:10 +0000
To: Linux regressions mailing list <regressions@lists.linux.dev>
From: Pratham Patel <prathampatel@thefossguy.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: disable analog audio for rock-5b
Message-ID: <MVRWlsBI3ytGeanEiplqESaeJxicfYRfOPHHhMJTQNRzd8XWTWlOoIFc949rG06cF_DAj5EpN2vMRFt3s34Di5nzfVgTfbWAH4A9R6SfqeI=@thefossguy.com>
In-Reply-To: <db6ae45b-ff34-433f-8a31-1547423768ce@leemhuis.info>
References: <20240324062816.145858-1-prathampatel@thefossguy.com> <0005257d-8022-4a66-a802-0c920d259ccd@linaro.org> <TbQeSy-AWAKVHo2Alb8hXUvplVNvohDJ2ztRM1x3Fo5PMmGLMsJxtHR-OIms9FlUshfUD9x45EghBCB9gVtcUPlxeMRUJQ_C95DVhu3AJrk=@thefossguy.com> <XJ_dGL-0X07dJ8GOKvrXbRD2FAHN1A7keAtohcSaU41DEF0FbeWwswLEqkrYiwwulyXDwJ6SZHfWukhHO3t3tOWX7ZGM7ya9lwXfn8Xh1nU=@thefossguy.com> <db6ae45b-ff34-433f-8a31-1547423768ce@leemhuis.info>
Feedback-ID: 104309535:user:proton
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Sunday, March 24th, 2024 at 17:44, Linux regression tracking (Thorsten L=
eemhuis) <regressions@leemhuis.info> wrote:

>=20
>=20
> On 24.03.24 12:43, Pratham Patel wrote:
>=20
> > On Sunday, March 24th, 2024 at 16:51, Pratham Patel prathampatel@thefos=
sguy.com wrote:
> >=20
> > > On Sunday, March 24th, 2024 at 16:15, Krzysztof Kozlowski krzysztof.k=
ozlowski@linaro.org wrote:
> > >=20
> > > > > + /*
> > > > > + *analog-sound {
> > > > > + * compatible =3D "audio-graph-card";
> > > > > + * label =3D "rk3588-es8316";
> > > >=20
> > > > Do not comment out code. Instead disable the nodes and provide
> > > > appropriate comment describing reason.
> > >=20
> > > I tried changing the status from okay to disabled. That didn't work. =
The SBC
> > > still locked up during boot.
> >=20
> > I think setting the status to fail should do the trick, instead of sett=
ing it to disabled.
> > Will try that and be back with a v2.
>=20
>=20
> Please CC the author of the change that broke things when submitting v2,
> which you afaics failed to do in this thread.
> =20
> Ciao, Thorsten

Ack, will do.

 -- Pratham Patel
