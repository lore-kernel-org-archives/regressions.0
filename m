Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649531F2389
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 23:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959317; cv=none; b=G3Ls1ERXbndHDsFAEUDem1EZhdEqTHh1hMhmmvjeCnyWKK1wP/YQoCTco6soo7Asr4wLlKXogB7xwCdBTdBK+3V6oaAda4ZVroIwD7c6qQ8bFoFkCZR/PLJjNiXIe3uF8idzLv7ODqjBCSj6ZlNTIIOPH9haq8xLCZAe7Vnvp0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959317; c=relaxed/simple;
	bh=v1DYXGhF/uypWf2eJL6oU0sHrTP7Z1jM0RXmunwqHhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiZK022J0UFVH1hZJN3PcYcDZ/6Mr+cQJ1D1q6oZGYr4+CpfZqj1VvO6A6lO69QKT3kHIMqYHJJJhAJk6Xl1/9PaS14w3B9PS+2sN2FeBLVTROFYcI6X2GnjFqOs7e0ySBVLGqkd3rUqfueS1Nc+2jgnM/CUP1fHHrAz6OWASSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=meZ7K8wp; arc=none smtp.client-ip=217.72.192.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="meZ7K8wp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1733959297; x=1734564097; i=christian@heusel.eu;
	bh=X+C0SkHj3MaQtDSgienyW0MYtS9PYkivpmVdSFfEqAs=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=meZ7K8wpISnGb7HlNSceUMlXxcFdIy5ldwCI0nJ/h2znE5vOdfisEQGVxfnjcEPg
	 sNkfQvXTfmyR0wb207zB/BwnibGuBKyVBSEt2vB4yfTmlDUY999MVL5ZblFZo7vq6
	 PV3WYIAeNI5OBHBoSr5GBRomfE3kZcrbyzoewoTnqm3akHkIvqSYK7dqll6DJ8pjZ
	 uHTaWVrT8SYjdMDg7+OeiFFB+Zm7nkIkIKaf3m3LeymwvCNSzMRfcVA4r8TdC0LGw
	 fkel85g7Tud6xL3+UwFbjBDmsDfBkOS9kWiN3ID49PHMr7QnGeyIScIFwIQiZRPqP
	 urt8cv0MvRvO6sZZxQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([141.70.80.5]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mo6zF-1twmb41wmx-00fwPC; Thu, 12
 Dec 2024 00:21:37 +0100
Date: Thu, 12 Dec 2024 00:21:36 +0100
From: Christian Heusel <christian@heusel.eu>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	Jason Andryuk <jandryuk@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, regressions@lists.linux.dev, 
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU
Message-ID: <222e15c2-ca70-421e-8034-9dace7087920@heusel.eu>
References: <Z1l6XbHP6BTTZSwr@mail-itl>
 <fe8db5b2-7524-49ea-ab8e-21f831dc009f@suse.com>
 <CAMj1kXHSiCo7FH0Mo-_R9HjxhthddPUZfgm5c8yj7vjGvgfTPg@mail.gmail.com>
 <Z1mF0UZPNLjYAJI7@mail-itl>
 <CAMj1kXFVd+2n1fRoOriwmAPH8yX22gSy7_m_1SVjtoG3r_=-Tw@mail.gmail.com>
 <Z1mWFcm_036BrvEq@mail-itl>
 <2024121144-false-playtime-968e@gregkh>
 <CAMj1kXEH4jaFyFMMN41UqdkjfSrN19cwJsiAYnX6jETvDagF-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eiwstsylbaon5chu"
Content-Disposition: inline
In-Reply-To: <CAMj1kXEH4jaFyFMMN41UqdkjfSrN19cwJsiAYnX6jETvDagF-g@mail.gmail.com>
X-Provags-ID: V03:K1:gYOQOD8hQSxhz/imGEOxyxSITQEnr51PQ7bwoMIEojzMxnDQlrr
 wRBmSyAVuIljmPHF8pmYIBqn07c59anH/TtteXadd2OZppBhArWssnkxI2gMjeDaYM1v32j
 FVs3R0xzbshxbk2AAVBFQAWSx+zyZ3xc+329hxy3Hva1UvQIxAb3RKxwU/J4CrMtvonuLAU
 chlnTa1IV25Tq4zwzaRog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dDW7J3i4cKs=;sEte6PkHw1QrIQQmlfc6bdJ0xQj
 3xvV+jsFn/MVN/uyiK+HOJM4WkUZCv3jJSn7qIuDXSaYNtnlytLYm49WlysiFGZ/jOPJXxLzn
 fu0o4mv2051dToibcTJgV2SJZ52pYKlRHcYxNPjLx0Pzl5w7zfDojUhLvqqiazPKPJSEgGQB6
 DntUmKj2WowVf1TCGWhuiqdGlJ22HGO4bxRUvEv43u6jxk0jC83Z0y1UwLCFblU1TUTHcJ9+a
 uNI47KVMcYIqpujCfPONaIrclmExxqb6LEtJMA0Pu1j5kzfjRJ8s6wTAI6qUyGm1Mp/dmvxKP
 kYvmYVIge0TcatPSl49NVjR2/BlyLkLGGaPZ64UEkX5ptaDyjZl/4OemDJdTMDrqC5yF2Y0ly
 js8JuetTUx21VqJ1U/vmRxAS5S3lX5+6EpmrCaI1+jLkEO56yYjcvfZhIRtAl+O1l31wA7A5f
 Q/vu1RcgfAXx7kdBd5//+K6R8aYQj+YnEt8RuWX/G1xmNgg3y3Qg0P8oALlK2AEeKmbHTJSFx
 QI+PjX/h9g421R1wTeNNnHcHgiB2TKAJJ1K88YYt83jyEcEA3gpAg3xXLl1AxzJn3bEISk4yR
 HOvt0h23d8KfdCIkaQNS+bqFdfNjN+5/zRSbo01xGVpahPZp9RYSHJ2tTT8UOWeHTIZwjar9D
 1tTGv/8hEKrlnWV/2oqdyaYef1t5tOQ5PWSvuPINxdLWxbJIAHPJkPxV4umpTXA21RF/aeSdO
 UNchJgEoT9LYUdzenHsgp5d6C1Y7T1nnnuslGk4t3NXkpMuhKkWJUwDUml+4NaMcegLFKrG5+
 a0vpOyNes2g8sQkuSVfwjUk0fjTPfPqtn7WmxmpbgCxsFbFOGJEycZWdUctfEEKvpPlA5MB8B
 vI2uqa8DIXoewE7fH/CuwiUxQ2oCOamnlpJLrGJt5XMpbkIf5HIsMY/Op2sl4A8u80aLOACH/
 JsNExE0uWd7EZhl4BR6gvkLDgy9aLmYyle/gM7BkgD2dJxJ54/PVM98WBR3w+iTgrJ9w310WU
 8QRERib5sQHfnwmM09nJxTLxi0BJbfHWiv/HNQi


--eiwstsylbaon5chu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] Linux 6.6.64 crashes when booting as PVH domU
MIME-Version: 1.0

On 24/12/11 04:10PM, Ard Biesheuvel wrote:
> On Wed, 11 Dec 2024 at 14:46, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Dec 11, 2024 at 02:39:33PM +0100, Marek Marczykowski-G=F3recki =
wrote:
> > > On Wed, Dec 11, 2024 at 01:37:52PM +0100, Ard Biesheuvel wrote:
> > > > (cc Greg)
> > > >
> > > > On Wed, 11 Dec 2024 at 13:30, Marek Marczykowski-G=F3recki
> > > > <marmarek@invisiblethingslab.com> wrote:
> > > > >
> > > > > On Wed, Dec 11, 2024 at 01:24:08PM +0100, Ard Biesheuvel wrote:
> > > > > > On Wed, 11 Dec 2024 at 12:53, J=FCrgen Gro=DF <jgross@suse.com>=
 wrote:
> > > > > > >
> > > > > > > Jason, Ard,
> > > > > > >
> > > > > > > I guess there are some prereq patches missing in stable 6.6.y=
 branch?
> > > > > > >
> > > > > > >
> > > > > > > Juergen
> > > > > > >
> > > > > > > On 11.12.24 12:41, Marek Marczykowski-G=F3recki wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > With Linux 6.6.64 I get the following crash on domU boot:
> > > > > > > >
> > > > > > > > (XEN) d5v0 Triple fault - invoking HVM shutdown action 1
> > > > > > > > (XEN) *** Dumping Dom5 vcpu#0 state: ***
> > > > > > > > (XEN) ----[ Xen-4.19.0  x86_64  debug=3Dn  Tainted:  M     =
]----
> > > > ...
> > > > > > > >
> > > > > > > > Linux 6.6.63 works fine.
> > > > > > > >
> > > > > > > > Looking at the changes, I suspect one of those:
> > > > > > > >
> > > > > > > >      83d123e27623 x86/pvh: Call C code via the kernel virtu=
al mapping
> > > > > > > >      f662b4a69e1d x86/pvh: Set phys_base when calling xen_p=
repare_pvh()
> > > > > > > >
> > > > > >
> > > > > > The second patch shouldn't have been backported. It is unnecess=
ary,
> > > > > > given that in the old situation, the kernel image needs to be l=
oaded
> > > > > > at a fixed address. And it assumes  that %rbp is set to the phy=
sical
> > > > > > load offset, but those patches were not backported.
> > > > >
> > > > > It has this tag:
> > > > >
> > > > >     Stable-dep-of: e8fbc0d9cab6 ("x86/pvh: Call C code via the ke=
rnel virtual mapping")
> > > > >
> > > >
> > > > That was added by the stable maintainers - someone grabbed a patch
> > > > from the middle of an unrelated series to make e8fbc0d9cab6 apply
> > > > without lexical conflicts.
> > > >
> > > > > Does it mean neither of them should be backported?
> > > > >
> > > > > But then, the e8fbc0d9cab6 has "Fixes:" tag (pointing at very old
> > > > > commit).
> > > > >
> > > >
> > > > If someone thinks e8fbc0d9cab6 should be backported, they should
> > > > rebase it onto v6.6.y, not backport random other patches until
> > > > git-apply stops complaining. And ideally, someone would build and b=
oot
> > > > the result to check whether it works.
> > > >
> > > > For now, it would be better to revert both.
> > >
> > > I can confirm that reverting both commits fixes the issue.
> >
> > Ok, thanks, let me go rip all of these out and do a new release now to
> > fix the issue.  Sorry about that, and thanks so much for the testing and
> > letting us know!
> >
>=20
> I guess 6.11 is beyond repair?
>=20

Yes 6.11 is not a supported stable series anymore.

    $ curl -s https://kernel.org/releases.json | \
        jq '.releases[] | select(.version=3D=3D"6.11.11") .iseol'
    -> true

Cheers,
Chris

--eiwstsylbaon5chu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmdaHoAACgkQwEfU8yi1
JYUe1xAArNQyyXyedV1N5sISRckfRL/ugQDTAAVDy53kYTtPjn3nyQX0oX0qceAC
AB0OQewAksKLHbxOOteciFC0muwh3XOBSDR9HcpsMTGeyGuW0V33olkDB81+o2S2
5Hl7xPl3KRYg/ygKOUABKoaXOjtZ2KHOpHzBm3QNgsYo/uFqW1IUp/t7o0EqAGdd
F68aoYA7f+oYcPWuuppuvvZBjvmU9TSIcuIuLwgqjcQpzWzlxe5I3djc8dVHNZQY
SUVffEP2GGZ+QhUFXObqi6NeI195toUpsjUjUDagBS9Bt0ui3I5ETCw1opZ4J6Lt
imLxfKetO7Lqjpmtu8wxNNkG7gKyvcuEr3ks/ag9zWt/Wv0KHFjxnS+SueskXDgT
xGXGifcoCOmiZE2CUE+91eaBrj6hRLthX5JUW03vrO1EAVx5kOevGVv6Elirr/y0
4isn6P6Vjjb0oY3ypeTCnrNwE7TF25T0QoiAUEGUhGV9YTWAMuOceeeszKXlQPf4
JVTLq6W4e1FEQef8t6rkSA8RNRGGfOgCNoQ2b7SNFmqPeo70O05Zdwom3P3JJOzR
WZf0FUHUOwIw++pMKfRBQ6ZARrI5izfo1mvN5+qo977FdFKof3AqvbxtFbbzcjF/
R2BRG1WqXRbHfQQtras4pzPAWtLC01vq478WyoCsBGDToDRoUaY=
=afDJ
-----END PGP SIGNATURE-----

--eiwstsylbaon5chu--
