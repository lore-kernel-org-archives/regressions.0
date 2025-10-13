Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C6BE555
	for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 16:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760372527; cv=none; b=kQV18lxcr5c8g1jyU7SB8kYMLgslhdeZnS8bt10qNqs/OL+3iCy3RUBIW/gfHcxqMt2/tpT2feV7x3Yzvvnr9zi4DCoCJ8HUyjWtNz0VvVmV27mrpPcSzMS7pG2ItqHQA+rET9xo4ROjAv5nmlZcgzoWC91rn3VuBPRODtQZl3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760372527; c=relaxed/simple;
	bh=rVYd3MSh3MZ/3aZ7DJLPRC8DJq7DqKiA99+k9MYhq6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hrd4bd1cr8JjuIsVfvd5gnmmX73b7V3SGjqJQMUkIO2sw/tpt3Q3oGd1hO+RGhe7hB4MC+F/X6WH4TUGFGs4NWMgUH8vlneRrotWCIzFkXJeEGg5ix8lwJReIphSv7B2V2VvxINV8sjFiXERAl9S4F5cCGRAOqXf61t5ENh4NLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cWi4qd30; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=boW4uRVB; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cWi4qd30; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=boW4uRVB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cWi4qd30";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="boW4uRVB";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cWi4qd30";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="boW4uRVB"
Received: from lion.mk-sys.cz (unknown [10.100.225.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C6A4E21B5C;
	Mon, 13 Oct 2025 16:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1760372523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ivCeth8SMjaYeJ1iglN5yZRuL5l9i7tk6pf+H9260Xk=;
	b=cWi4qd30S9/GygzOAHalnoUGPsLvWzGgqUUlTtMKuxfkKhS64+nKIDqBL50aGKgaJVaqHt
	R3X0K1AXdfJ14m2tDHWht8zQJUpB4pPv9b94rjTUn1eW1DxvHzqTzoX5V5vJCdeALs3Yu0
	ZcZMWeEt5+utVawPnDhHuL4n/q6ZQtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1760372523;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ivCeth8SMjaYeJ1iglN5yZRuL5l9i7tk6pf+H9260Xk=;
	b=boW4uRVBCMFVy3DzAMNt4oemX+US9K+5XevXFQHJiO3+AUF1QXVnyIXpRKcBuy2BH0JvI3
	JFAvyaNxMEvPUCCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1760372523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ivCeth8SMjaYeJ1iglN5yZRuL5l9i7tk6pf+H9260Xk=;
	b=cWi4qd30S9/GygzOAHalnoUGPsLvWzGgqUUlTtMKuxfkKhS64+nKIDqBL50aGKgaJVaqHt
	R3X0K1AXdfJ14m2tDHWht8zQJUpB4pPv9b94rjTUn1eW1DxvHzqTzoX5V5vJCdeALs3Yu0
	ZcZMWeEt5+utVawPnDhHuL4n/q6ZQtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1760372523;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ivCeth8SMjaYeJ1iglN5yZRuL5l9i7tk6pf+H9260Xk=;
	b=boW4uRVBCMFVy3DzAMNt4oemX+US9K+5XevXFQHJiO3+AUF1QXVnyIXpRKcBuy2BH0JvI3
	JFAvyaNxMEvPUCCQ==
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
	id B574220057; Mon, 13 Oct 2025 18:03:45 +0200 (CEST)
Date: Mon, 13 Oct 2025 18:03:45 +0200
From: Michal Kubecek <mkubecek@suse.cz>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, 
	Arisa Snowbell <arisa.snowbell@gmail.com>, linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH v2 RFT] usb: xhci-pci: Fix USB2-only root hub registration
Message-ID: <7jhwqwragngnswtutxn2rusleorhk4ffew3k6tnu236atgccqt@45ibtawev6h7>
References: <20251008223406.13f16f19.michal.pecio@gmail.com>
 <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
 <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
 <20251009131444.2c221922.michal.pecio@gmail.com>
 <90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com>
 <20251009152703.72e780b4.michal.pecio@gmail.com>
 <b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com>
 <20251013092250.699bf60f.michal.pecio@gmail.com>
 <21741b98-4844-4218-8bd9-10b8bf5cd869@linux.intel.com>
 <20251013100424.42d5b9d2.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gwxlkycjwclgrxa6"
Content-Disposition: inline
In-Reply-To: <20251013100424.42d5b9d2.michal.pecio@gmail.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.40 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,vger.kernel.org,lists.linux.dev];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.cz:email]
X-Spam-Flag: NO
X-Spam-Score: -4.40


--gwxlkycjwclgrxa6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 10:04:24AM GMT, Michal Pecio wrote:
> A recent change to hide USB3 root hubs of USB2-only controllers broke
> registration of USB2 root hubs - allow_single_roothub is set too late,
> and by this time xhci_run() has already deferred root hub registration
> until after the shared HCD is added, which will never happen.
>=20
> This makes such controllers unusable, but testers didn't notice since
> they were only bothered by warnings about empty USB3 root hubs. The bug
> causes problems to other people who actually use such HCs and I was
> able to confirm it on an ordinary HC by patching to ignore USB3 ports.
>=20
> Setting allow_single_roothub during early setup fixes things.
>=20
> Reported-by: Arisa Snowbell <arisa.snowbell@gmail.com>
> Closes: https://lore.kernel.org/linux-usb/CABpa4MA9unucCoKtSdzJyOLjHNVy+C=
wgz5AnAxPkKw6vuox1Nw@mail.gmail.com/
> Reported-by: Michal Kubecek <mkubecek@suse.cz>
> Closes: https://lore.kernel.org/linux-usb/lnb5bum7dnzkn3fc7gq6hwigslebo7o=
4ccflcvsc3lvdgnu7el@fvqpobbdoapl/
> Fixes: 719de070f764 ("usb: xhci-pci: add support for hosts with zero USB3=
 ports")
> Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Tested-by: Michal Kubecek <mkubecek@suse.cz>

> ---
>=20
> New in v2:
> - don't set allow_single_roothub twice, it's harmless but lame
> - credit and Cc another reporter
>=20
>  drivers/usb/host/xhci-pci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 13454bef14d3..d292adc65e5a 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -588,6 +588,8 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
>  	if (!usb_hcd_is_primary_hcd(hcd))
>  		return 0;
> =20
> +	xhci->allow_single_roothub =3D 1;
> +
>  	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
>  		xhci_pme_acpi_rtd3_enable(pdev);
> =20
> @@ -643,7 +645,6 @@ int xhci_pci_common_probe(struct pci_dev *dev, const =
struct pci_device_id *id)
>  	xhci =3D hcd_to_xhci(hcd);
>  	xhci->reset =3D reset;
> =20
> -	xhci->allow_single_roothub =3D 1;
>  	if (!xhci_has_one_roothub(xhci)) {
>  		xhci->shared_hcd =3D usb_create_shared_hcd(&xhci_pci_hc_driver, &dev->=
dev,
>  							 pci_name(dev), hcd);
> --=20
> 2.48.1

--gwxlkycjwclgrxa6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEWN3j3bieVmp26mKO538sG/LRdpUFAmjtIt4ACgkQ538sG/LR
dpVvLgf9FKchtB/PkMMmsrp+7pKjyZklpwVepwINOSAqDRdkfKCTS5HCXkhsNeVM
2AficNPmfAXRV3viCRLzvP2NRBbDOaV37xVXoz48IjNqWZ5pjHr4O4NwhmnUJyfD
Fg7AhrM/3LLGBf6oHmIiIVklD9g9eLuSPYXejS+jXgD0RQNKPkx/tG/SxnkpSc4/
IrdnMrIzHnO8Qz0MM8Iz3KyXT5ScpJvFDOKQ4NYS/i7ajWL2kkZcOsTrkxslCJj9
+b1+aDbSGx2UgqYfREm3kWnmRCvzlMcFmZ4VLHLY3g337hwpYaq+xA+XHdBKfojZ
yTdvTMC5anZuC2L4ENr4jr/8bexdXg==
=s+10
-----END PGP SIGNATURE-----

--gwxlkycjwclgrxa6--
