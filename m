Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED87028FC
	for <regressions@lists.linux.dev>; Wed, 21 Dec 2022 17:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A73C433D2;
	Wed, 21 Dec 2022 17:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671643859;
	bh=F3rQjEuCT/Nq0S3JVc1uP7Z7hT1xeuLDQLKUL8W9PvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAVSH7F1Apb+LgBKPHHX2IN16IefkXDkLUjtTs3naha1fgT5r1C2/rXbnfsTXxEXK
	 kjTUOA5+CQVsaUqGj5LTLKaS4JwrWC/8YLfDR2bHpc8nl6kN+lQEY/Swroj/MxoMFf
	 Brj/eKkzy8vhIMuoorAPJ5wXIvLSlQfkMQzYRML3iAe+xObuYeyyJt1/qq++OMoBx6
	 WBSfa+tjOOk1sYzQ+l200WxVNkQ+35+YNr2n9YzHxMasIobIUYNq7zaXCPCGrQJf8R
	 MoIT2s1ShRro4FhpUH2pY8kEu+ObWGkHXiTtQqMCs5Xmjh6eBQ9f7wBnYI7OBuPb3x
	 ITgs3Mh99ztlw==
Date: Wed, 21 Dec 2022 17:30:54 +0000
From: Conor Dooley <conor@kernel.org>
To: "Neftin, Sasha" <sasha.neftin@intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Ivan Smirnov <isgsmirnov@gmail.com>,
	"Fuxbrumer, Devora" <devora.fuxbrumer@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	"Ruinskiy, Dima" <dima.ruinskiy@intel.com>,
	"Avivi, Amir" <amir.avivi@intel.com>, regressions@lists.linux.dev,
	"Lifshits, Vitaly" <vitaly.lifshits@intel.com>,
	"naamax.meir" <naamax.meir@linux.intel.com>,
	"Meir, NaamaX" <naamax.meir@intel.com>
Subject: Re: [Intel-wired-lan] igc kernel module crashes on new hardware
 (Intel Ethernet I225-V)
Message-ID: <Y6NCzgXZzv+oJKV1@spud>
References: <03f7dc73-3e7c-1e6d-275f-85539493cd7f@intel.com>
 <CAPAtJa8qupPZZ0AiMWSxNKSd-WMg0MQDQeZcCO_Z-GGBu3jZCg@mail.gmail.com>
 <CAPAtJa_-yMusW5-C3BDivMu=MOyfKF9VQkxQotX3L_P+Q48oMA@mail.gmail.com>
 <CAPAtJa_nL5edyiN61ghXZxVUSDBFQQR3uiYJM0uo9mEao=RC0w@mail.gmail.com>
 <CAPAtJa_hbFbVXQbiNnb_byLqtZ-Dy_EBcvTFH9GyPqt__dFmLQ@mail.gmail.com>
 <Y3gKkYeijrAIhxjc@spud>
 <20221118145443.427ecf10@kernel.org>
 <Y3gTdsg4l71L0vz9@spud>
 <a15508df-eab4-ce00-7340-69323c462fdc@intel.com>
 <Y3qGHROcvdL1vKip@spud>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XdTdINNilYUYYXgD"
Content-Disposition: inline
In-Reply-To: <Y3qGHROcvdL1vKip@spud>


--XdTdINNilYUYYXgD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 20, 2022 at 07:55:09PM +0000, Conor Dooley wrote:
> On Sat, Nov 19, 2022 at 08:06:05PM +0200, Neftin, Sasha wrote:
> > On 11/19/2022 01:21, Conor Dooley wrote:
> > > On Fri, Nov 18, 2022 at 02:54:43PM -0800, Jakub Kicinski wrote:
> > > > On Fri, 18 Nov 2022 22:43:29 +0000 Conor Dooley wrote:
> > > > > > Is there any update for the community? More and more folks are =
asking. We
> > > > > > are all techies and happy to help debug.
> > > > >=20
> > > > > Vested interest since I am suffering from the same issue (X670E-F
> > > > > Gaming), but is it okay to add this to regzbot? Not sure whether =
it
> > > > > counts as a regression or not since it's new hw with the existing=
 driver,
> > > > > but this seems to be falling through the cracks without a respons=
e for
> > > > > several weeks.
> > > >=20
> > > > Dunno, Thorsten's will decide. The line has to be drawn somewhere
> > > > on "vendor doesn't care about Linux support" vs "we broke uAPI".
> > > > This is the kind of situation I was alluding to in my line of
> > > > questioning at the maintainer summit: https://lwn.net/Articles/9083=
24/
> > >=20
> > > Yeah & it is /regression/ tracking which I don't (or rather didn't)
> > > consider this situation to be. I'm generally a little unsure as to wh=
en
> > > I should trigger regzbot in general:
> > > - immediately when I find something?
> > > - only if it goes a while with nothing constructive?
> > > - is it okay to use it outside of "this used to work and now doesnt"?
> > >=20
> > > Either way, but I did some more googling and found this reddit thread:
> > > https://www.reddit.com/r/intel/comments/lqb4km/for_people_having_i225=
v_connection_issues/
> > >=20
> > > That's being reported against windows & I dunno if the dude is using
> > > firmware and driver interchangeably etc. But the disabling power savi=
ng
> > > etc sounds oddly like the issue we have here, since that was a propos=
ed
> > > workaround in Ivan's 2022 reddit thread.
> > >=20
> > > Supposedly I am on firmware-version 1082:8770, but /I/ I have no idea
> > > how that corresponds to windows versioning. That may lend some creden=
ce
> > > to your assertion about firmware being the source of many issues.
> > >=20
> > > > Finding a kernel release which does not suffer from the problem
> > > > would certainly strengthen your case.
> > >=20
> > > Aye, likely to be a little difficult to do a meaningful bisection for
> > > me at least, since the motherboard I have with the problem is an AM5
> > > one for the new Zen4 stuff. I'm not an x86 person, so not entirely
> > > sure when that support landed. I may do some poking tomorrow..
> > >=20
> > I do not think we can resolve this problem on this forum.
> > In early Ivan's report was reported error to netdev "PCIe link lost, de=
vice
> > now detached"). Since the PCIe link unexpectedly drops it could lead to=
 many
> > problems (not only crashes).
>=20
> Hmm, I'll take a look at what mine spits out next time it dies, but I
> would imagine that you're correct and I see it too.

It does in fact say that, but interestingly only this peripheral has any
issues. My GPUs etc have no problem at all.

> > Before you go to SW/FW bisection (change FW(NVM), go back with a kernel
> > version) - please, contact your board vendor (ASUS). Why PCIe link drop?
>=20
> I dunno, I suppose it just entered a lower power state!
>=20
> > Circuit problem on board, the system performs power management flows and
> > does not stop the driver.
>=20
> My GPU and other PCI devices are returning from lower power modes properl=
y.
> I wonder what's different about this specific device. As I said, not too
> familiar with x86 stuff - is there someone from AMD worth poking as the
> output from lspci is a wall of AMD bridges w/ endpoints mixed in.
>=20
> Doing a cursory look at other x670 stuff - the non-asus ones that I
> looked at are not using Intel ethernet.
>=20
> > "failed to read reg 0xc030" (just symptom) happen after PCIe link lost.
>=20
> Per 47e16692b26b ("igb/igc: warn when fatal read failure happens"), it
> looks as though this is not a *new* problem though as you guys have seen
> this while testing.
>=20
> I've got a 1 G NIC, I like my dev machine to "just work" so I'll probably
> throw that in and see how far that gets me. IIRC it's an igb one so will
> at least make for a datapoint.

FWIW I gave up on the igc driver and am using my NIC, couldn't be
bothered with the disruption. I'll give the bios stuff mentioned
elsewhere a go over Christmas now that v6.1.1 exists and see if that
helps. Hopefully it does!

Conor.


--XdTdINNilYUYYXgD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6NCzgAKCRB4tDGHoIJi
0gIwAQDh7mXOiqQoCyqrOP20dYw0RJbgxjlPYGXaz3N81qKWwAD/U2DsXu3JRw5b
rIXhqpaFGm+DlE3ri1r0kQ6KDoikTwU=
=NO96
-----END PGP SIGNATURE-----

--XdTdINNilYUYYXgD--
