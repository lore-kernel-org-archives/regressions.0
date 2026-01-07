Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE65331AAA3
	for <regressions@lists.linux.dev>; Wed,  7 Jan 2026 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792093; cv=none; b=aqk0zrddJjW8SlZMYh6Yn9qUY1EvQfXot3NS68D0SVAf/XTuQMvU53yHUI8ERTRzTFbO/XTEh8m7acj6nbV5ntbV2DCgTxQeoOGxHLhK7b92EEPbU88KQ5i60SHtSvNlbNmZBcb/3iYlygcIJDgK5KnuBBD6Xkx5InCZzTV8COw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792093; c=relaxed/simple;
	bh=g2bpzg0N58vFRxyxOe0ZX8/2xpmR86fmVDqw+8tf3Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPq6ikAXfA31Dcl3e7TamL7WOCDENHH88TOxeEgan0b32hH6OkHDwmnqeY7XfYH1fyO6afJlEM+O2xRHyqvoAkqkCF6KNmcvEMVGOXvtJwtbfEz0do+5+idkpzlCjSYF2TBMNOQY5KigkDozi+CDCUBdyzH/s6ziBob8RuJISHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=znYN+6sd; arc=none smtp.client-ip=217.72.192.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="znYN+6sd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1767792089; x=1768396889; i=christian@heusel.eu;
	bh=g2bpzg0N58vFRxyxOe0ZX8/2xpmR86fmVDqw+8tf3Ng=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=znYN+6sdtIEfb0H6iZbLhHQJqXXiuEtuy7qq8HFynbw0kbDxp80wMJKyE//1mJPP
	 Ewy9kr4KJ0zdhmhQMgLRsz+GbOcoZqJn4Jx5BZuIcAt6xiZ2gUe6ue5e+W4EH/4Bn
	 OIQDM/kG8dNLAgDchQTuyCE30jnJidiDvSNG/wlrHJqcv6d5FWYWLuAT5OdtnT7H5
	 PPNyC+ZjCzQYnLmaGt7U2uxYFaZ96mrEopPZfuCoroldg2CuHanl7ZidZOysDEkfu
	 zPB38Iu69/tW8OhbvbUq+/5d8g0YrXIDZuEgJfL4O/0LuPpXgs/xeCLoFYekA/Exq
	 9YO9ZoNQeLcV4OsD8A==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([94.31.75.239]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MZT2u-1vOZRp3lO2-00YL9t; Wed, 07 Jan 2026 14:16:00 +0100
Date: Wed, 7 Jan 2026 14:15:56 +0100
From: Christian Heusel <christian@heusel.eu>
To: Leo Martins <loemra.dev@gmail.com>
Cc: Gideon Farrell <gideon@solnickfarrell.co.uk>, 
	linux-btrfs@vger.kernel.org, regressions@lists.linux.dev, arch-devops@lists.archlinux.org
Subject: Re: refcount_warn_saturate in __btrfs_release_delayed_node for
 6.18.2-arch2-1
Message-ID: <584c770b-8e59-457c-a8a4-0f9630ec9635@heusel.eu>
References: <DFHUFTKLUCB5.11QUC5R2L77DO@solnickfarrell.co.uk>
 <20260107011054.2694891-1-loemra.dev@gmail.com>
 <46fba8b4-c694-48d8-b20b-6d0fdd18bf8b@heusel.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xbscq4523oipo3tj"
Content-Disposition: inline
In-Reply-To: <46fba8b4-c694-48d8-b20b-6d0fdd18bf8b@heusel.eu>
X-Provags-ID: V03:K1:QJh7KtLRMXZEOaSP4it1VKyXyLYjPvkSwz/kkxtZQ0SdAgUr/B8
 CDErthotMgPojfSfNAKbJKhzqOd7u4O6HS4aSMI3REPmvswDzeNT0WJbxT5o6Q3u/VffKJd
 2Y82T7U0yv4sj8b9hUiaQ/id+aM6bDINxrryYW9+EzAr8HAIhrDHU/lTmX0GAjlrevpoVKw
 7fTPTOpb3SX1Kt34jD9Ow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SXnaPXqL/8c=;bujtpPpEap+1GIm7c5ysqHCceRA
 ETZ1kULNNTO5YzVBNQ9gUcIPQ0KLPj7QYmVojVyZbOXhSYI8Yfael+HXNM6s1l6wgqfXJ7XJ5
 K7xL5f16S6/CeRTBzsWRRmGnwyICYN50LUnt16gDXUyhotr7Y0qWPMmtR6mm3Xt4SwIJHP1YM
 uyo5N0/kGk6KDBSmZOglVwlrnuqXdtb+k8P0A6Pz/VuJ8A7dZqjPPpPIH8cr+cwKBy6jGFONN
 ZWh0ABfWdBC9DOdeftiEOp6kmdct4P3gu+WgIxyIOUFCxm4vaYF3bI13/GJavbCK7BpXgEiB6
 yvA4V0nuegd0jqywJ+UJoq8euXCB/SRQX8idZmOiGr4RkRfa5j0eJ+FWUtBpR+s21kEax6jV0
 pzNCx77Gj/h8ZvUXXy0OnZezhpfuSTb/cjmGugYzBLPT3zUbY6s0NfXRWXJri58dN+AwXDlV8
 4P8rOWuwoin0UbXgZmY9TcAZebDJKozYQjr/UAmj+M+qL0S6wP/iGKez9YKzzIvRs71yaLhiH
 4U0m7PJNz+Lzft16mbyh2JvpE7JYH0+tIkBQTnMCXbR0wRB1Av4dSUfIHD3wwk6wV3wGaWtS8
 Du7nWGTvmA9hyBvxnOVqDsjXCJIlQgtjDRQ994Ndf8FDug6kHlBFZzIXg7/F2yDgJDQCLQ+jz
 WqPN4P3YtpIQlABftAimXZdqTj8SOorprXwsaqK9hDgaal1INCIjCviUva2vw0dhh422HJ9hq
 ieBqjohsdw/m9nLuuxvMypkRSDLHnP4etAKYiLsZu074N+pJUC2UPqCuxufWJ9ntwBCez7FTb
 NiA3AUPzJJ1zlfc+4cG/qsOUqAPNDvp3KVY17PPmTSBcQAUyfg7T8rQmQsJsAi9esY/WCMPh+
 37aBe04bRyTF/UKonzG/SSR7yXuWFaRFeJuE+lC+tjY4JpMk1GA7cIGwaPwIOCt4rNoa3qtLs
 5anKj7Vvm6E1vIBKB/DC9bSKBJwYt907EPbQ0fc15cF5DBn5ElhSqWbWwMKLEQ8SqyhxcwdcA
 repg9HnV38b+FQnGr5YzQk0Fesem9RHJ3Ibt0mRwNkX1k0B+DshQWjBv2cmV+VbvzEB8oc48c
 DacNXzx9/9cjkJTsQWi1ONZJiJeToTf28RwLHKnMvTZP6z5KaICxt7di62AI09gVquNa4X+T0
 5RGX5zplVFpXXsnGtUfna+4O6LqWZ6SFe5mhfuTykOtCRJaLzZaGLyeRu5MC8+a0Umia6eqA9
 7oRZQLGDk0yCb494ONGGyulYupjW3TA6TzEitlqq00QTJXS5gaWoTS9Ca8KGRQtSuE2I0iLo4
 s44YtFbnoYveQ0jz80LBvltgS8xkOMQeebBipEZumKZFr/J/9vQppV3tXNA8BfipS+a2SuT61
 RmViR8A/dpCH8iXk/1PAknIrBvzAxdNo2hB7GBbK4RqS5YmudikW8HYGU1pMQyZkYKCmxQv5W
 w1Mb6xA+MjKjCWPaWYqZL5KdqoKKg4oPsQQD+Us74MFu0iSvt3nWZxcpj2jhq3xuIBkMMUZXp
 JnyBzVkA3rcL/n+I+fW945xPPAKlSID6N091b3dJF83M3IJx07P5f1auUB5kvQwpdC9sdUPO2
 t6f0aYQxvC1k3OW0YRBeUYNB/EOGxG5ifwPOeOSLG3oLWoyoQBNzTTJZ+JTjk2kr6aSn7IxaL
 nTfwnTXKXc2AfWNv9aBCXMAX5tVFF/nnk8oRWMWUqkDgvVmrEOxU1Hl7OKpaApuMAYiAmErfA
 ZZp0TOjS/TKvK8yyEdVVOa4CQx5rOrh7muk4cDhza/NigMhYajD83TH2Avpym/nBSD/oIZWGJ
 7uG6


--xbscq4523oipo3tj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: refcount_warn_saturate in __btrfs_release_delayed_node for
 6.18.2-arch2-1
MIME-Version: 1.0

On 26/01/07 02:52AM, Christian Heusel wrote:
> On 26/01/06 05:10PM, Leo Martins wrote:
> > On Tue, 06 Jan 2026 22:01:58 +0000 "Gideon Farrell" <gideon@solnickfarr=
ell.co.uk> wrote:
> >=20
> > > Hi there,
> > >=20
> > > I recently experienced a type of crash I haven't seen before on this =
system which seems to originate in __btrfs_release_delayed_node on Kernel 6=
=2E18.2-arch2-1.
> >=20
> > Hey, thanks for the report. This looks very similar to a different
> > report that has been fixed in 6.19-rc5.
> > Report: https://lore.kernel.org/oe-lkp/202511262228.6dda231e-lkp@intel.=
com/
>=20
> I think this is the issue we have been seeing on the Arch Linux
> infrastructure aswell, see this issue for reference:
>=20
> https://gitlab.archlinux.org/archlinux/infrastructure/-/issues/788#note_3=
85420
>=20
> This has caused us to downgrade the kernel on all hosts in our
> infrastructure due to the crashes caused by this.
>=20
> > Fix: https://lore.kernel.org/linux-btrfs/7c89417ac3352ce3cb0a6373a17461=
55c1e2754d.1765588168.git.loemra.dev@gmail.com/
> >=20
> > Please let me know if this fixes your issue.
>=20
> So far we have not found a good lab-setting to reproduce the issue
> outside of the production machines workloads (but we have also not
> looked into the issue a lot).
>=20
> Do you have a good reproducer already that we could use to verify the
> fix?
>=20
> Also the fix is not yet even scheduled for inclusion in the stable
> trees, since it is still not in linus tree right?

Sorry, I messed up here! I got fooled by the output of `git log --grep`
and therefore missed the commit! As pointed out by heftig on gitlab the
commit already is present in 6.18.3 which I'll try to roll out to our
systems shortly! :)

>=20
> >=20
> > >=20
> > > Here's the stack trace:
> > >=20
> > > ```
> >=20
> > Are these the first refcount_t: warnings in your dmesg? I would
> > expect an earlier warning that looks like
> > refcount_t: addition on 0; use-after-free.
> >=20
>=20
> This is what our stacktrace looks like:
>=20
> [...]
>=20
> Cheers,
> Chris



--xbscq4523oipo3tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmleXIwACgkQwEfU8yi1
JYVgrw/+JaeFMDKO81WKxdImmgz+4Wc4Ucnj8IjVtaPS65Vav/75VTLuRMPfqZ9y
YAoh+dXUcRdR+LYT3pYp3bycd4e8e7CORsJvMV8cm9eiebKBXU1LeZamCQhi4MzZ
EVvZPMXR51CJgkZ/ruME9alzbnIFj2UGMVvUfZL8htvZTTi2R6oWn4otucxxFrKd
OuLO0lXE+48LQs5RCqg4VdxQpHSG6eCcMJHLGczdLEQD3WrMOdUrulHC+xWU73xY
N1+BgYAtHz6iGTptA3+fWcNybuDln9926bzI83g39HY4OYUxHj/PkUh8E2s9wftD
Zo36g+fhf7sHkMPNBku7RyuUzkoNUTKY/G5gF91JLYJ/iAuKAFZ4tH9UgI3XiByv
vnPFG3NPruR7LUeHFRETgovzQNgZ/nmNUQravsejdl8tTgjzPxrWPcxVNoacdfjW
lUj48cIKXiTeIZaGckrk5YOP36zkPQ9d+9i+qPkQhaiM3/w/TuHx8RW49u6Z4Pgo
pPvfX4UpNYZXagWm5A6JMYhM/J890UYnuy7tTPccF1iurw3JZtoeFdJI1TbADFzw
QXJ6f9iSuRwnlVzKyGuwTlw2ZGmjnYcQe/TXkjTj2Pm7exrlxTW/XIRiSxJuBltY
kBBod5gV4xGpiMJZvrSY17PJGTap/Q5G5WDlMdhaROm7iL+9AsM=
=TXE9
-----END PGP SIGNATURE-----

--xbscq4523oipo3tj--
