Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E727028EF
	for <regressions@lists.linux.dev>; Tue, 13 Dec 2022 09:46:57 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 87CBB240007;
	Tue, 13 Dec 2022 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670924809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aXJzSwNcbsXGXw+er67BUwq5ojiISWwUZ3aea+WpOLs=;
	b=Vrg8UKM8sm9AissTWxmh62QMeWakR3niVsOJHhKGNCHzJLe2GUPnprQqlq1XsPyDY++J8y
	k43/SvNndYsAh/k1NTrGZ8yzSR81oU1ngtDy3i/VzPu18we2P3Yok8Pd6Vl/OgGNKK07a8
	560/I//6C6KkuOuIv7nXP0Vjg/PjiH9rX8V5TEH3LjZzN2W2QVZGM6m4qAT0iTdLwIBm+Y
	ZNd2ja9G/q9LtNChFMy7yYUGsO3uFn2xl1UdOwe3lQph92fr0qyGZUOXmZIOASMwL3Czhg
	e1TeR8LfM8gw4j9LsdcrxC6T6iCb9UGsFEFHqHR7xUwMofoyIxMYmSzcvhmfrQ==
Date: Tue, 13 Dec 2022 10:46:43 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kiselev <bigunclemax@gmail.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Saravana Kannan <saravanak@google.com>
Subject: Re: nvmem-cells regression after adding 'call
 of_platform_populate() for MTD partitions'
Message-ID: <20221213104643.052d4a06@xps-13>
In-Reply-To: <b75a8769-0cc8-beb3-931a-6755aede3af0@inbox.ru>
References: <CALHCpMgSZOZdOGpLwTYf0sFD5EMNL7CuqHuFJV_6w5VPSWZnUw@mail.gmail.com>
	<CALHCpMgEZjnR39upkR6iozSk-b5A_GHRo9rcDSPXzzQi6x_qCw@mail.gmail.com>
	<b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info>
	<CALHCpMhsM2j=bSXEDC9BWYpOAyvCccgJpJmqXfiRTHvp6=y3tA@mail.gmail.com>
	<20221212101449.4e465181@xps-13>
	<CALHCpMimCqZB0bnHaOdCzucey+92NcRRZXCHXYYH5c9vj0nZaQ@mail.gmail.com>
	<20221212173730.64224599@xps-13>
	<b75a8769-0cc8-beb3-931a-6755aede3af0@inbox.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Maxim,

fido_max@inbox.ru wrote on Mon, 12 Dec 2022 20:57:49 +0300:

> Hi, Miquel!
>=20
> On 12.12.2022 19:37, Miquel Raynal wrote:
>=20
> > Let me try to recap the situation for all the people I just involved:
> >=20
> > * An Ethernet driver gets its mac address from an nvmem cell. The
> >    Ethernet controller DT node then has an "nvmem-cells" property
> >    pointing towards an nvmem cell.
> > * The nvmem cell comes from an mtd partition.
> > * The mtd partition is flagged with a particular compatible
> >    (which is also named "nvmem-cells") to tell the kernel that the node
> >    produces nvmem cells.
> > * The mtd partition itself has no driver, but is the child node of a
> >    "partitions" container which has one (in this case,
> >    "fixed-partitions", see the snippet below).
> >=20
> > Because the "nvmem-cells" property of the Ethernet node points at the
> > nvmem-cell node, the core create a device link between the Ethernet
> > controller (consumer) and the mtd partition (producer).
> >=20
> > The device link in this case will never be satisfied because no driver
> > matches the "nvmem-cells" compatible of the partition node.
> >=20
> > Reverting commit bcdf0315a61a ("mtd: call of_platform_populate() for MTD
> > partitions") would IMHO not make much sense, the problem comes from the
> > device link side and even there, there is nothing really "wrong",
> > because I really expect the mtd device to be ready before the
> > Ethernet controller probe, the device link is legitimate.
> >=20
> > So I would like to explore other alternatives. Here are a bunch of
> > ideas, but I'm open: =20
>=20
> How about to create simple driver with compatible=3D"nvmem-cell" and to m=
ove all the suff from main mtd driver which serves nvmem-cell to the probe =
function?

This is probably worth the try but I doubt you can make it work without
regressions because IIRC the nvmem registration happens no matter the
compatible (not mentioning the user-otp and factory-otp cases). You can
definitely try this out if you think you can come up with something
though.

But I would like to hear from the device-link gurus :) because even if
we fix mtd with a "trick" like above, I guess we'll very likely find
other corner cases like that and I am interested in understanding the
rationale of what could be a proper fix.

Thanks,
Miqu=C3=A8l
