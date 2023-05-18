Received: from nef.ens.fr (nef2.ens.fr [129.199.96.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857CE3C39
	for <regressions@lists.linux.dev>; Thu, 18 May 2023 08:15:15 +0000 (UTC)
X-ENS-nef-client:   129.199.127.85 ( name = mail.phys.ens.fr )
Received: from mail.phys.ens.fr (mail.phys.ens.fr [129.199.127.85])
          by nef.ens.fr (8.14.4/1.01.28121999) with ESMTP id 34I8EVjQ019440
          ; Thu, 18 May 2023 10:14:31 +0200
Received: from skaro.localnet (unknown [176.151.100.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mail.phys.ens.fr (Postfix) with ESMTPSA id B19771A1A55;
	Thu, 18 May 2023 10:14:30 +0200 (CEST)
From: =?ISO-8859-1?Q?=C9ric?= Brunet <eric.brunet@ens.fr>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
        jouni.hogander@intel.com, jani.nikula@intel.com,
        gregkh@linuxfoundation.org
Subject: Re: Regression on drm/i915, with bisected commit
Date: Thu, 18 May 2023 10:14:30 +0200
Message-ID: <5681706.DvuYhMxLoT@skaro>
In-Reply-To: <ZGU56n66OAe0DqN3@intel.com>
References: <3236901.44csPzL39Z@skaro> <ZGU56n66OAe0DqN3@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Rspamd-Queue-Id: B19771A1A55
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.38 / 150.00];
	 ARC_NA(0.00)[];
	 R_SPF_NEUTRAL(0.00)[?all];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 MIME_TRACE(0.00)[0:+];
	 DMARC_NA(0.00)[ens.fr];
	 RCPT_COUNT_FIVE(0.00)[6];
	 HFILTER_HELO_IP_A(1.00)[skaro.localnet];
	 HFILTER_HELO_NORES_A_OR_MX(0.30)[skaro.localnet];
	 NEURAL_HAM(-0.00)[-1.000,0];
	 IP_SCORE(-1.76)[ip: (-0.16), ipnet: 176.128.0.0/10(-4.87), asn: 5410(-3.66), country: FR(-0.09)];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 ASN(0.00)[asn:5410, ipnet:176.128.0.0/10, country:FR];
	 HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	 BAYES_HAM(-2.92)[99.66%];
	 ONCE_RECEIVED(0.10)[]
X-Rspamd-Server: mail
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (nef.ens.fr [129.199.96.32]); Thu, 18 May 2023 10:14:31 +0200 (CEST)

Le mercredi 17 mai 2023, 22:32:42 CEST Ville Syrj=E4l=E4 a =E9crit :
> On Tue, May 16, 2023 at 03:04:53PM +0200, =C9ric Brunet wrote:
> > Hello all,
> >=20
> > I have a HP Elite x360 1049 G9 2-in-1 notebook running fedora 38 with an
> > Adler Lake intel video card.
> >=20
> > After upgrading to kernel 6.2.13 (as packaged by fedora), I started see=
ing
> > severe video glitches made of random pixels in a vertical band occupying
> > about 20% of my screen, on the right. The glitches would happen both wi=
th
> > X.org and wayland.
>=20
> Please file a bug at https://gitlab.freedesktop.org/drm/intel/issues/new
> boot with "log_buf_len=3D4M drm.debug=3D0xe" passed to kernel cmdline, and
> attach the resulting dmesg to the bug.

Thank you for your answer, I have just opened the issue as requested.

https://gitlab.freedesktop.org/drm/intel/-/issues/8480

=C9ric Brunet


