Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9778BE0
	for <regressions@lists.linux.dev>; Thu,  6 Apr 2023 15:36:41 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-29-UuMCYDyaOwWGz8MYzNkIwA-1; Thu, 06 Apr 2023 16:36:38 +0100
X-MC-Unique: UuMCYDyaOwWGz8MYzNkIwA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 6 Apr
 2023 16:36:36 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 6 Apr 2023 16:36:36 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Bjorn Helgaas' <helgaas@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Jason Gunthorpe <jgg@nvidia.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Linus Torvalds
	<torvalds@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: RE: revert bab65e48cb064 PCI/MSI Sanitize MSI-X checks
Thread-Topic: revert bab65e48cb064 PCI/MSI Sanitize MSI-X checks
Thread-Index: AdlodgFkFYa3Wd45RlGJwWEgKJXFDwAGyW4AAALDCHA=
Date: Thu, 6 Apr 2023 15:36:36 +0000
Message-ID: <be2acdf424b74d948c3ff45093dc6332@AcuMS.aculab.com>
References: <caca6879210940428e0aa2a1496907ab@AcuMS.aculab.com>
 <20230406150742.GA3703273@bhelgaas>
In-Reply-To: <20230406150742.GA3703273@bhelgaas>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Bjorn Helgaas
> Sent: 06 April 2023 16:08
>=20
> [+cc linux-pci, regressions]
>=20
> On Thu, Apr 06, 2023 at 11:05:14AM +0000, David Laight wrote:
> > The change in bab65e48cb064 breaks pci_enable_msix_range().
> > The intent is to optimise the sanity checks, but it is
> > somewhat overenthusiastic.
> >
> > The interface allows you to ask for a lot of vectors and
> > returns the number that were allocated.
> > However, after the change, you can't request a vector
> > that is higher than the largest the hardware supports.
> > Which makes that rather pointless.
> >
> > So code like:
> > =09for (i =3D 0; i < 16; i++)
> > =09=09msix_tbl[i].entry =3D i;
> > =09nvec =3D pci_enable_msix_range(dev, msix_tbl, 1, 16);
> > Now returns -22 if the hardware only supports 8 interrupts.
> >
> > Previously it returned 8.
> >
> > I can fix my driver, but I suspect that any code that relies
> > on a smaller number of vectors being returned is now broken.
>=20
> Thanks for the report!  bab65e48cb06 ("PCI/MSI: Sanitize MSI-X
> checks") appeared in v6.2-rc1, so this is a recent regression and it
> would be good to fix it for v6.3.

I do try to test every release at around rc3.

> bab65e48cb06 only touches drivers/pci/msi/msi.c, but since it didn't
> go through the PCI tree, I'll let Thomas handle any revert (or better,
> an improvement to pci_msix_validate_entries()) since he wrote and
> applied the original.

Looking it:

static bool pci_msix_validate_entries(struct pci_dev *dev, struct msix_entr=
y *entries,
=09=09=09=09      int nvec, int hwsize)
{
=09bool nogap;
=09int i, j;

=09if (!entries)
=09=09return true;

=09nogap =3D pci_msi_domain_supports(dev, MSI_FLAG_MSIX_CONTIGUOUS, DENY_LE=
GACY);

=09for (i =3D 0; i < nvec; i++) {
=09=09/* Entry within hardware limit? */
=09=09if (entries[i].entry >=3D hwsize)
=09=09=09return false;

=09=09/* Check for duplicate entries */
=09=09for (j =3D i + 1; j < nvec; j++) {
=09=09=09if (entries[i].entry =3D=3D entries[j].entry)
=09=09=09=09return false;
=09=09}
=09=09/* Check for unsupported gaps */
=09=09if (nogap && entries[i].entry !=3D i)
=09=09=09return false;
=09}
=09return true;
}

It probably needs to return an updated 'nvec'.
The gap/duplicate check is also a bit horrid, why not:
=09=09if (nogap) {
=09=09=09if (entries[i].entry !=3D i)
=09=09=09=09return false;
=09=09=09continue;
=09=09}

=09=09if (!i || entries[i].entry > entries[i - 1].entry)
=09=09=09continue;

=09=09horrid, expensive loop...

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

