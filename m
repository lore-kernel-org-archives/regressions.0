Received: from master.debian.org (master.debian.org [82.195.75.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452FC5478D;
	Sun, 15 Mar 2026 00:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773535072; cv=none; b=KNAasKwB5Q1uFV1nDWDhaBh0cLF1b/QB9wbzINcVoSxy5Xlz0BDy6a9sEko7maAU6wb6Qfe1mtyOaa6XKYArKeqmBfqSG96tACUbHt+vDh06DTkMQUpDs6xdXtt6HUqoMQU21U+P++WXISN2Oquese9ryge8bv/Kk4gEqnrL8Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773535072; c=relaxed/simple;
	bh=hDYPrVjjx41bKrfl/ikSMDZM3Ls0t7MDTOMlc+7pcmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DM/EyvWprsk5jzl+YDw/+KbMkiqsoAfeKrBf9hxdaPFRcluBQDXJ+Rv10ejJmEbPWed05kfm/NHAh6yPNLhJ45kRqpyfqATaYywjgJFP07BqbjqTT7TlkECIzWyODjyExpOt6ZVxvOXzCm0VFP5CA9g8m7PvG76k3GdDWw+vtAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=master.debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=w0XURBVL; arc=none smtp.client-ip=82.195.75.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=master.debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="w0XURBVL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description;
	bh=qQjj9J4spuAdNma8qjIGtf7fmYqmZXfhy3etCegZ9lc=; b=w0XURBVLisQDTW3k7nYhdk+cUW
	KJrCgjuI/P4Co6MmgK1YJO89VF7QQ76pE2StF+Px9uj7ShK9p65PLpBaytg72jzRXW8IEPHiZAo62
	QjOpwlOIfRCxSKrVQPpjTLL3Ro+p5wbpcDiTPwaoEMy8MGSiIN3c8hNm6cGw9CzMrGG9QpFF6eQ5+
	EGNfFu1O75imTtKqHMe+r3hR8zSqPx2usbsZrRfEQ+mX1jFhQSNlsL3f4w/68syfXZfVz6ebLwFbQ
	dAcgC1tJ7pQWnnKfzElJNOgnOI6s0Bs/veh5Mm+68ny3RxQHbwKyWSkF/0yG5BaXSAzT4zupjQGmg
	nlAydE4w==;
Received: from ukleinek by master.debian.org with local (Exim 4.96)
	(envelope-from <ukleinek@master.debian.org>)
	id 1w1ZU3-002ktt-13;
	Sun, 15 Mar 2026 00:37:31 +0000
Date: Sun, 15 Mar 2026 01:37:29 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, 
	Salvatore Bonaccorso <carnil@debian.org>, Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	regressions@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, benh@debian.org
Subject: Re: BUG: kernel NULL pointer dereference, address: 0000000000000000
Message-ID: <abX53NWDsG8oW7H6@monoceros>
References: <6ba903ad-9897-42bb-8c2d-337385cc3746@molgen.mpg.de>
 <db387081-345f-423a-a0ff-e13f3bec2d51@molgen.mpg.de>
 <CADVatmM_mRnkDX=hpUjbyKkZnGynxJfRSujGxm2LaWWMEL_2ew@mail.gmail.com>
 <ef9223ee-0a4e-468c-bfd0-0cf190d262f1@molgen.mpg.de>
 <aVgjpWaIRkerdgCa@eldamar.lan>
 <49cdd663-bcbd-48b4-ac38-77ce94ef0c8d@molgen.mpg.de>
 <aVj-mz8vaw53TWtX@debian>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uose2pk73ch6jhan"
Content-Disposition: inline
In-Reply-To: <aVj-mz8vaw53TWtX@debian>


--uose2pk73ch6jhan
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: BUG: kernel NULL pointer dereference, address: 0000000000000000
MIME-Version: 1.0

On Sat, Jan 03, 2026 at 11:33:47AM +0000, Sudip Mukherjee wrote:
> On Sat, Jan 03, 2026 at 12:01:19PM +0600, Paul Menzel wrote:
> > Dear Salvatore,
> >=20
> >=20
> > Thank you for the follow-up.
> >=20
> > Am 03.01.26 um 01:59 schrieb Salvatore Bonaccorso:
> >=20
> > > On Mon, Dec 01, 2025 at 05:05:59PM +0100, Paul Menzel wrote:
> >=20
> > > > Am 01.12.25 um 14:25 schrieb Sudip Mukherjee:
> > > > > On Thu, 27 Nov 2025 at 22:55, Paul Menzel wrote:
> > > >=20
> > > > > > Am 27.11.25 um 19:51 schrieb Paul Menzel:
> > > > > >=20
> > > > > > > Unfortunately, not reproducible, but starting with Linux 6.18=
-rc7, I got
> > > > > > > the oops below *once*:
>=20
> <snip>
>=20
> > >=20
> > > https://bugs.debian.org/1124075
> >=20
> > This is
> >=20
> > AMD AM5 ASUS ROG STRIX B650-A GAMING WIFI, BIOS 3067 12/10/2024
> >=20
> > > https://bugs.debian.org/1124463
> >=20
> > This is
> >=20
> > Dell Latitude E5470/0VHKV0, BIOS 1.34.3 11/20/2022
> >=20
> > > Does it make a difference to cold-boot or reboot into the system?
> >=20
> > I only did cold boots, and I am not able to reproduce it anymore, and w=
rote
> > it off to some hardware issue =E2=80=93 despite the system working fine=
 otherwise.
> >=20
> > I am adding the x86 folks, and regression lists.
>=20
> Thanks Salvatore for the Debian bug links.
>=20
> I had been trying to reproduce this but have not seen it on my machine so=
 far.
>=20
> But looking at the traces from the Debian bugs and the trace from Paul, m=
y best
> guess is that its happening because the low level driver, parport_pc in t=
hese
> cases, has not completed setting up the hardware.
>=20
> When 'lp' starts registering, parport driver will check if there is any p=
ort,
> if no ports are found then it will try to load the low level module.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/parport/share.c?h=3Dv6.19-rc3#n198
>=20
> As mentioned in the comment request_module() is not trying to load a real=
 module
> and it depends on the alias. Also, mentioned in the Documentation.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/admin-guide/parport.rst?h=3Dv6.19-rc3#n45
>=20
> I am not sure why the problem is seen now, but is it possible to test the
> below diff please and see if that fixes the issue.
>=20
> diff --git a/drivers/parport/share.c b/drivers/parport/share.c
> index 427abdf3c4c4a..8f45daf7b3825 100644
> --- a/drivers/parport/share.c
> +++ b/drivers/parport/share.c
> @@ -287,8 +287,16 @@ int __parport_register_driver(struct parport_driver =
*drv, struct module *owner,
>          */
>         ret =3D bus_for_each_dev(&parport_bus_type, NULL, NULL,
>                                port_detect);
> -       if (!ret)
> +
> +       /* Return if no port has been found. The driver has been
> +        * registered, so whenever a new port registers
> +        * attach_driver_chain() will be called which will then check
> +        * all registered drivers.
> +        */
> +       if (!ret) {
>                 get_lowlevel_driver();
> +               return 0;
> +       }
> =20
>         mutex_lock(&registration_lock);
>         if (drv->match_port)

There are several backtraces, I looked at two of them and both trap at
an address that corresponds to:

        /*
         * This has to be run as last thing since init_state may need other
         * pardevice fields. -arca
         */
->      port->ops->init_state(par_dev, par_dev->state);
        if (!test_and_set_bit(PARPORT_DEVPROC_REGISTERED, &port->devflags))=
 {
                port->proc_device =3D par_dev;
                parport_device_proc_register(par_dev);
        }


in parport_register_dev_model(). However the trapping machine code
doesn't match the kernel modules of the respective kernels, so that's a
bit strange and I'm unable to tell which of the pointer dereferences
there results in the NULL pointer exception.

Maybe this is also an instance of the hardware disappearing? At least
port->ops and pardev are non-NULL earlier in that function and all
static initialisations of a struct parport_operations have an
init_state() callback.

I didn't try to reproduce, but maybe adding a sleep before that call
makes it more reliable to trigger the problem.

Best regards
Uwe

--uose2pk73ch6jhan
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmm1/0cACgkQj4D7WH0S
/k7w7Qf/YDFqDdl1ikNbsRrCYn09s/ORe636Y1y6Zrxj3C3wh/iC1SzviEqGTHGR
np7DjJXGWkqgAu68RRUt4Cd2c6j+CrhS0QHQHvIals7OFvQk/m80+7iEd91cOUGo
BfSxvK+xYDXU85HQFpGy8Kd/Ag+gauala01DI7WbtyhzutJI4ecFfn4MKtnig+p4
1QGNDFljO7kcHjODlUrDX9lrL88WNzFOgyB1/jZhnPC2btGcrFhUwu+/smzwmfXg
p1fWF/Zzr+Fd837UntPMFpeypzrJMYTArxQ4l7SJ/Deai3GKA61pdn7boNwiMPeG
bKuuHuT5N9nH83fVvN/Sdw5hvXXdCg==
=wbgD
-----END PGP SIGNATURE-----

--uose2pk73ch6jhan--
