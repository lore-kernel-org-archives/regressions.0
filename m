Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21BA1FDE3A
	for <regressions@lists.linux.dev>; Fri, 17 Jan 2025 12:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737115551; cv=none; b=ab4Jk29Chh1a0xOZuFmTi4rl9kiHoR1dBYL/5V7vDuXmrEpcf0+rNlDkpsfvZaq7sjGmx8E5NBD5T0786np0riDZTJ3djy/Sj6fIrjqfYChpOsDD+AR35M5/58+qf7fIpAY+MJRTtOTwVJnTvskWRNS4+V42Zj1YFbY60DWeKPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737115551; c=relaxed/simple;
	bh=yYt3XDsQk7qnGaJ1LQsjHyDm7yi/M/6MaAn8oaJskF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WeViyrOW9H+UpHo3TgwCz4XZ6PfpA0us/7oiUWwyjYMpRjKs9xydoQii1aoS628YbgsMNqqc4Y2C1Wf8aDc4CF02oEagmPNRL/YjO/ML7ralLea4kBJVtlayKUQaWTxhWmwRTBXsccQ5QimYhLjRiF+/Q2Lsx9rBHQ3RkxBEBcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=tjZfnjVd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e7Y/W0SY; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="tjZfnjVd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e7Y/W0SY"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id ACB0C114014A;
	Fri, 17 Jan 2025 07:05:47 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 17 Jan 2025 07:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1737115547; x=1737201947; bh=E4
	BKaLgjKwxl3qk+S8d/r25/8ei0FPAdbuCz0wO7smo=; b=tjZfnjVdV4QdGRwsEx
	DS2LMAOMtk8DiwivpYQoZQveZgUTBeCkOwXnvBWYNLUlfOZyxINj4xiRm6DfYVip
	ZPRUU9tT+BVC5q9ARmDvWAxDQgWhE/sVwNM0eSjwo+n6maMgYsRSf94eCihQ1kjv
	9YVkR5oVx10DT3akBe3w5WiXIr/mVyJWzmn+/ti37hgTTfuwo0PJvt94hAM5dYqO
	gSOhq9BBAu/INz+SmDoVxUg738UNeH8sVHGeiEKiVQUbW9dueqEN8/A4dTfOS4Sj
	yApXUW3Fuh/QwgHViOAYqBX6nO1W9T68hZE0NJPHLQ3fqea5yJM5tH4nzNz6sKKI
	+BUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737115547; x=
	1737201947; bh=E4BKaLgjKwxl3qk+S8d/r25/8ei0FPAdbuCz0wO7smo=; b=e
	7Y/W0SY4AGk1J1Qg9sa3BAnCAeTTNk++WFNqgZrMdlvFVxKPusThjMNoHK+odS54
	MqG/tDHrcYUH1co3lxeqgx+4Cw9eK0UptOcrf13GOlI1FeY2NFF2RfwTYnSlqAO7
	3rnDJ/bjvwtQ1Qkm5INUpq5qlqkgzodIt1rdtdzsjQt9EPkZOYAqmZqoMk0MxeNg
	ZjklWlwg4wl0BvuRuomCs7bYLZC8AEoAFRG4oZsHWS8S4srVQ/Y8VHSkLiQcjxke
	SCMopBFP/9TkGO+k2GZpGjnhT7Ij06gq172nnjaeq2d2AkHW6rSNIQzBzfKrk21v
	LLbL9dOBGwHClBwV16f9A==
X-ME-Sender: <xms:mkeKZ7tvasDCMxptcYa8_7KxesDN9FchzTWXK871Yh-5KsnnuzxZxQ>
    <xme:mkeKZ8ewDQBMtS_rRSXzHLuZwZHqaTDz7RESVDrWD-Bwd9RpFr4-7LdMhCH1cDtji
    Z9oJMbXuxojzA>
X-ME-Received: <xmr:mkeKZ-xme9OmWV3NosHuPlo-4-01iUdfFSNvDiEJ5dM6aNqV1-su9bPn3p8stfzw1OUDqhNPFMLjei9AmNtMHmq79Zj993q1hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeifedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkgggtugesghdtreertddtjeenucfh
    rhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrh
    hmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgr
    thhtvghrnhephfetuefhiefgtddtlefggffggeevhedtvdefffeugfeiieeiheefteefge
    fggeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprh
    gtphhtthhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtoheprhhoghgvrhdr
    phgruhestghithhrihigrdgtohhmpdhrtghpthhtohepsghorhhishdrohhsthhrohhvsh
    hkhiesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishht
    shdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgvghhrvghsshhiohhn
    sheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehnsggusehnsggurdhnrg
    hmvgdprhgtphhtthhopehlohhrvghniihosehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:mkeKZ6NGdri_FRzbilqE0iPwZQ5mER2Nt835O87c-hsPeJcSIXO9Tw>
    <xmx:mkeKZ79JWoKaeCfzhawdpNTD6_HUFHL-pNoDj9nr6cDcR1woi2uSVw>
    <xmx:mkeKZ6Wcrb0PrFd_-xuRybEXr3-OfjWb5gv6w2VbzI6HIIz06cCO3A>
    <xmx:mkeKZ8eBYa7pmyU9aKDnEyGfLpIWcF4fOUqwgmGSpNkcZOaU9PP5Ng>
    <xmx:m0eKZ83JcmhpKN0VmRnx_g48kqQHNlsKPfxwtB0dAomm_J7mCpF7-YZp>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jan 2025 07:05:44 -0500 (EST)
Date: Fri, 17 Jan 2025 13:05:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
Message-ID: <Z4pHll_6GX7OUBzQ@mail-itl>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sWxZVOYUfcZCOYXA"
Content-Disposition: inline


--sWxZVOYUfcZCOYXA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jan 2025 13:05:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Subject: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)

Hi,

After updating PV dom0 to Linux 6.12, The Mediatek MT7922 device reports
all 0xff when accessing its config space. This happens only after device
reset (which is also triggered when binding the device to the
xen-pciback driver).

Reproducer:

    # lspci -xs 01:00.0
    01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express =
Wireless Network Adapter
    00: c3 14 16 06 00 00 10 00 00 00 80 02 10 00 00 00
    ...
    # echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
    # lspci -xs 01:00.0
    01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express =
Wireless Network Adapter
    00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
    ...

The same operation done on Linux 6.12 running without Xen works fine.

git bisect points at:

    commit d591f6804e7e1310881c9224d72247a2b65039af
    Author: Bjorn Helgaas <bhelgaas@google.com>
    Date:   Tue Aug 27 18:48:46 2024 -0500

    PCI: Wait for device readiness with Configuration RRS

part of that commit:
@@ -1311,9 +1320,15 @@ static int pci_dev_wait(struct pci_dev *dev, char *r=
eset_type, int timeout)
                        return -ENOTTY;
                }
=20
-               pci_read_config_dword(dev, PCI_COMMAND, &id);
-               if (!PCI_POSSIBLE_ERROR(id))
-                       break;
+               if (root && root->config_crs_sv) {
+                       pci_read_config_dword(dev, PCI_VENDOR_ID, &id);
+                       if (!pci_bus_crs_vendor_id(id))
+                               break;
+               } else {
+                       pci_read_config_dword(dev, PCI_COMMAND, &id);
+                       if (!PCI_POSSIBLE_ERROR(id))
+                               break;
+               }
=20
   =20
Adding some debugging, the PCI_VENDOR_ID read in pci_dev_wait() returns
initially 0xffffffff. If I extend the condition with
"&& !PCI_POSSIBLE_ERROR(id)", then the issue disappear. But reading the
patch description, it would break VF.
I'm not sure where the issue is, but given it breaks only when running
with Xen, I guess something is wrong with "Configuration RRS Software
Visibility" in that case.

BTW, shouldn't PCI_VENDOR_ID be accessed via pci_read_config_word()
instead of pci_read_config_dword()?

I'm also CC-ing MT76 driver maintainers in case it turns out to be
device-specific issue, not a generic one.

Initially reported at https://github.com/QubesOS/qubes-issues/issues/9689

#regzbot introduced: d591f6804e7e1310881c9224d72247a2b65039af

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--sWxZVOYUfcZCOYXA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmeKR5YACgkQ24/THMrX
1yyDjQf+JBoWE4mxxNyZATD6m9P70rRJd0JhGqotS5b1B5P6bMIEGSophssWxldE
+p9xAUihpymf67AQsqMP1bEgUuQUHbBE+VuQp12aFb1AdKgGCjsKK1sZgx+1WjlM
mWxC8vWyXEmRXUBU+0j531yBb9JbO93HULXk8EC0DYHqt1YSH68b0vHYNoRVBVqZ
S4fOb7LhEsIWpprx/yWtRlcKwFUSK96KabmpGSeXgkZ+LSM8eMQgLfTXcpRLxNaR
yKIeadTj2I2wjwZ0LnGSFjDGfMqhWl/myprlcyoonnEGs/lenDpMQ8Ja2QHzpSKx
GrUjgFoZdghTv4mOtnDPTarPl0e6KQ==
=9sOx
-----END PGP SIGNATURE-----

--sWxZVOYUfcZCOYXA--
