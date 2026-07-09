Received: from mail.sonarnerd.net (rankki.sonarnerd.net [213.186.235.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902393F0ABB
	for <regressions@lists.linux.dev>; Thu,  9 Jul 2026 08:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.186.235.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783586099; cv=none; b=Iyz5pbv1qXYwoRPZqCxa5Vf/6CMuHJcQDwOgy5v0snQCg+aI6LVviJmxlmnj61dcSj7Wn6N+aO3CBswWAUgS9mOs2sWQ3EZ8wZKe3U6cbMYuRgijAZEKCgLnaCZFkbxBGPHcMKJA+kG5A4AZGXCB6eWi1H0xZQCEB9DVXN01ijM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783586099; c=relaxed/simple;
	bh=NYRVenukqz40PT1ePEaJ4fI3HMqgJj2jGsXcYsqoaUc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=BDf2lxs5+D127qnCL+HojRqDBy8yMwrJm03BENjl7MJnWAvHJOzT9SQ9i0dYfiLglkT3seM8diqKpc3djhfk4yQOeTcKlwcELZT4A2AfP321/lvJvGJ544shv4IVGDo/+Y2CxEFozwXDtXNaRk8hBJUIfBJypzJRNbxc/aMR8XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sonarnerd.net; spf=pass smtp.mailfrom=sonarnerd.net; dkim=pass (2048-bit key) header.d=sonarnerd.net header.i=@sonarnerd.net header.b=5Lt6ZVt2; arc=none smtp.client-ip=213.186.235.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sonarnerd.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sonarnerd.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sonarnerd.net header.i=@sonarnerd.net header.b="5Lt6ZVt2"
Received: from smtpclient.apple (unknown [213.186.235.123])
	by mail.sonarnerd.net (Postfix) with ESMTPSA id D7918231114;
	Thu, 09 Jul 2026 11:34:54 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.sonarnerd.net D7918231114
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonarnerd.net;
	s=dkim; t=1783586094;
	bh=ZAAkhbKWvNqd/b8grpbrTpH7nLcwXHsjvIsE1piJsc8=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=5Lt6ZVt273pn8D8BkElVxsgps1JzMiIPwDplnN6RhDi9l2sW+Yq9/DQ5fd6hVnptA
	 l1ElRbsd1GTqjHKiUlONrNnXqL0lUq3KTD58h5ff7WprJxeRhA5+mouwvMTs9J3ihA
	 vAVkRD1t0dOtdmKekv2W5cwOWBqd8aNUNxBi7PJlXmxN966S4652ntTKPyNe6wCWUu
	 MAftfIQ/6RyJWLrjNA7Ty8ClYchHd6WB+p2naKc9YgSUbH45am5hTh/ASetIVJuEjn
	 /tSwxgvinLAofYF1VX5l7EgYzeeh+1Mzuf9g2vkRZ35y1JgEclS9XMTHiJfCgSwWUZ
	 dUh5sY0qnW4Gw==
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [REGRESSION] snd-usb-audio: commit da3a7efff64e ("ALSA:
 usb-audio: Update for native DSD support quirks") breaks DSD playback on
 Musical Fidelity M6s DAC (2772:0502), plays ~8.8% fast
From: Jussi Laako <jussi@sonarnerd.net>
In-Reply-To: <87bjcg4nyh.wl-tiwai@suse.de>
Date: Thu, 9 Jul 2026 11:34:44 +0300
Cc: Salvador Blaya <tiniebla6@gmail.com>,
 alsa-devel@alsa-project.org,
 regressions@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <0B949249-CB61-4D76-BD4B-6C9B467E97D6@sonarnerd.net>
References: <CAOdyq+qFaqCh=tK_wNnA64hv5pQuA1Y09ANxQ=xK8yR-t4mf9Q@mail.gmail.com>
 <4A4C8B42-D8BB-44D1-BE0B-CB5B4617F29E@sonarnerd.net>
 <87bjcg4nyh.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3864.600.51.1.1)

This is of course OK for me if it works. The newer Musical Fidelity =
devices work fine. For example M3x, M6x, M8x, MX and likely upcoming new =
ones.

So I would rather go with blacklisting broken ones.


	- Jussi


> On 9. Jul 2026, at 10.33, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Thu, 09 Jul 2026 00:28:00 +0200,
> Jussi Laako wrote:
>>=20
>> Hi,
>>=20
>> I don=E2=80=99t think we currently have exclusion method for devices =
with buggy firmware, which claim to support native DSD, but do it =
incorrectly. And reverting with device specific white-listing is not a =
good approach for future maintenance. Having to device-specific =
white-list each new device appearing on the market from the manufacturer =
just because some old device is broken is not really a sustainable =
model.
>=20
> While I fully agree that white-listing all needed devices won't scale,
> blacklisting the broken device might work.  We can an empty quirk
> entry for 2772:0502 for skipping the vendor match, something like
> below, as an ad hoc fix.
>=20
> Though, this blindly assumes that there aren't so many broken devices,
> and there will be no firmware fix or another model that works with the
> same ID.  If a model is relatively new and/or the vendor often updates
> the firmware, such an entry can be risky, too.
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> -- 8< --
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2463,6 +2463,8 @@ static const struct usb_audio_quirk_flags_table =
quirk_flags_table[] =3D {
>   QUIRK_FLAG_DSD_RAW),
> DEVICE_FLG(0x2708, 0x0002, /* Audient iD14 */
>   QUIRK_FLAG_IGNORE_CTL_ERROR),
> + DEVICE_FLG(0x2772, 0x0502, /* Musical Fidelity M6s DAC */
> +   0), /* for avoiding QUIRK_FLAG_DSD_RAW with vendor match */
> DEVICE_FLG(0x2912, 0x30c8, /* Audioengine D1 */
>   QUIRK_FLAG_GET_SAMPLE_RATE),
> DEVICE_FLG(0x2a70, 0x1881, /* OnePlus Technology (Shenzhen) Co., Ltd. =
BE02T */

