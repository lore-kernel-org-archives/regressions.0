Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706218;
	b=4s7mi5nRlq3GnaVXUQFIT+7X6hftynvbUu6o463m1+Wq4YgXot0ELJJiI2bVmC9nJcN9
	 rqGKgb9Bxum5J9SJ5rxxkUFBtbXhxP6FLHgCh/ZFjXDV8EhxgnVbrdP1MWhW7VvT3vnny
	 cUuStqGz7cjqgNwlz/FjtrQQ5p2VPS3ToiZU/lAA5vw2nlrPOQbm7kdUGq9kIG1nLj5fx
	 0Q+3XAJ5Gnau5pL1T9BdhIIZdy30HFv/N2JQfFDFmKkQLSSTrcoT8zrnE7CAA8C4v4CkB
	 +Z5LpU2Dz6L0TrkLlulGmVR5BMrGjVrkkFAP5Hcrd9zNOCXr3zt5Bm769ToIyF9EBPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706218;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=ke2iiy+5bPFA2Qh7Wbg/X9FR3jHVJljstab3aXxJ3pk=;
	b=p4ZjzY5ZcqtdMVgqUMA/95GhkCRg3t4vCwXm16Gxghe35aPGxd4BhBPyUGxTuHjUlA42
	 LRG6LEj2jJq0oBNV1lhm39FNOlf0Wnikc7IVervE5wX+BvJUPxO2q8azVu+NlsF8UxKUA
	 GKnmKJfm5a/HM4AFLwE1so0KwYTQTp1oC4mGF1KhIdM1Jfwey86OZgJw3OttCSkEjYlBA
	 qRhDrAOnZFlC6WAr56SVMai1xedghVKRnO4cPjSRL81uktvaXzrQ7GCAkFC8/D/euf3gc
	 ZxA2CgLjYbFBgiYUIIS+6sqhaE8Nk+2JFjU7c3G8zftRORT9lBr5scbQnoCXj8NYD9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JjYBD9rD;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793D5606A330
	for <regressions@lists.linux.dev>; Tue,  3 Nov 2026 11:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 793D5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JjYBD9rD
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 26FCBC8F45C;
	Tue,  3 Nov 2026 11:44:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9BD936046C;
	Tue,  3 Nov 2026 11:43:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57C35103291E2;
	Tue,  3 Nov 2026 12:43:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793706209; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ke2iiy+5bPFA2Qh7Wbg/X9FR3jHVJljstab3aXxJ3pk=;
	b=JjYBD9rD0vsN/BIRrCSyjvM0/rLF7ga7LoE78CJtvmkvkA3NI9ACU6hCK9+SA+iGlzm2rz
	uUGYJfvkH5Hd+zYkXRqJU2SmYGldH8R8uq49DCw/022mPwZKa2aMnZiU/qgMx95QMjMmOL
	47emcUh+0g8jJFFw7wFTMQu2Wz+j46egu1+W01OR8oSRf08if6LL3Yigrgv4hqZtoA6WuG
	PO7czrEGk5nmRibJMIvFudAIwYMDiVyge3qTAE6lLQd75nGpzV03JAzpDZ7K/fwlJIIomd
	s5MRy6aa3zOjxWePs4OmSm1Rdi60bdsFLg5gk0MGxyrtU4AaAunTtjeBuzy8Tg==
Date: Tue, 3 Nov 2026 12:43:23 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Angel J <iamanaws@httpd.dev>, linux-pci@vger.kernel.org,
 bhelgaas@google.com, robh@kernel.org, lizhi.hou@amd.com,
 andrea.porta@suse.com, florian.fainelli@broadcom.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v3] PCI: of_property: Omit bus properties without a
 subordinate bus
Message-ID: <20261103124323.0f8b1071@bootlin.com>
In-Reply-To: <20260918202045.GA1191948@bhelgaas>
References: <20260918195540.GA1187209@bhelgaas>
	<20260918202045.GA1191948@bhelgaas>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Bjorn,

On Fri, 18 Sep 2026 15:20:45 -0500
Bjorn Helgaas <helgaas@kernel.org> wrote:

> On Fri, Sep 18, 2026 at 02:55:40PM -0500, Bjorn Helgaas wrote:
> > Author: Angel J <iamanaws@httpd.dev>
> > 
> > PCI: of_property: Omit bus properties without a subordinate bus
> > 
> > A bridge (a device with a Type 1 header) may not have a secondary bus
> > allocated (pdev->subordinate), e.g., if there are no available bus numbers
> > or the bridge secondary/subordinate bus numbers are not writable.
> > 
> > The dynamic OF helpers of_pci_prop_bus_range() and of_pci_prop_intr_map()
> > dereference pdev->subordinate without checking it.  When
> > CONFIG_PCI_DYNAMIC_OF_NODES is enabled, this can cause a NULL pointer
> > dereference and early boot hang.
> > 
> > Generate 'bus-range' and 'interrupt-map' properties only when a subordinate
> > bus exists.  Keep the node and its remaining properties for bridges without
> > one.
> > 
> > The problem was latent since 407d1a51921e ("PCI: Create device tree node
> > for bridge"), but wasn't reachable until 1f340724419e ("PCI: of: Create
> > device tree PCI host bridge node"), which appeared in v6.15.  Before
> > 1f340724419e, of_pci_make_dev_node() returned early because the parent OF
> > node was missing.
> > 
> > Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> > Signed-off-by: Angel J <iamanaws@httpd.dev>
> > [bhelgaas: move pdev->subordinate test to callees, commit log]
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: stable@vger.kernel.org	# v6.6+
> > Link: https://patch.msgid.link/20260912043106.10715-1-iamanaws@httpd.dev  
> 
> I put this on pci/for-linus, planning to be in v7.3, but I would love
> to have testing reports to make sure it still works as the v2 does.

I know it's too late to add a tag but well, just to mention my test somewhere:

It works for the LAN966x use case. Tested with v7.4-rc1.

Tested-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
