Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107BC154BE2
	for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 07:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760340179; cv=none; b=jh+ZG0mI8j93AKhQAIxNGvEX0R9c4PeVTO6vBAB/sU6E/qCw26+QOEgaW9r3jTpQUtNe0apEouPjs8HCb8xFEVgpIJJBsXfAEEAzfCnwgnoeIX3Bi4TPl1a4+/RbC9LGgTlkAMzjD53AXn2rnbPRlEQwZrT2+YZvt0C6wnCxQvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760340179; c=relaxed/simple;
	bh=RL1qx7lnDW2k+goEWt8CO7eKfJt37lqpyYCrWGhYjBs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AM47Cj9/Vtel6t11YiyRoReYbmEvI2WkggiGg6RDAlOLqH/Y2KAW9YAJGW3+kZTx5xija1P6Skczp9NOzFxVKz+d20wdrgFdVqTfg/8MW11LhIt1sjHHnRALHtzgmlye90iiO8JvmzLuhCBrFRvrzWly1wE5ECxo9mMbtprBckM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5nbZQYU; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5nbZQYU"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6318855a83fso8802695a12.2
        for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760340175; x=1760944975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gAXAJVhyEp1HKMGFh/TvbuN8pteWkQ54oK6Wcz/IpI=;
        b=T5nbZQYULX3xOA6FxbSIfpVpmiE/jIRdfvwMcJu+WAOECtN7lge/jHeRaRMLcQpa5o
         cM75NY/2528Nfb40qL4TF4so+t2lKA+5LtGgVm24llh+rmCseBrKXRLZRotCxoui9wls
         Y9KSx+X2vW92LxlXrq9FEJaQBp2QyFmadjqZTGGlgMR8Yiq4m4tOfR4WTsQ+pXLdSTNJ
         6a5IltGZ73nR0AKpZYWlwoE4VsUZObuEJF/wRxRK9Sm1H83iuF0km2CeayAxsXr+MNev
         4pgh+cbRMQJ0u+XL/FCp8zVbcJYZoFK9DuvyIBYCBSwnAkBZtYVQlt5+HcdYLD09S6rq
         8NUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760340175; x=1760944975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gAXAJVhyEp1HKMGFh/TvbuN8pteWkQ54oK6Wcz/IpI=;
        b=Ha5kabf4opBOZPvzisk+AVC4gLx9G5mkhr6YUkkFzz2k7doyrRBrxbb+C72ZM04AhG
         iiaNqDr48T+usBeu6QqlgExWiYO7v0/rsfc7Q5FD8gLuT5GaA+thGLrtSOID3Cu65rvj
         r2sf9mDB8lkMBe4tFj5tExvjZj7c7C2vOKnA6eMR7wIClsDdzbfB1XP3O4sHT5iI//RS
         BNM2hMLn/Nwn5ICxmaFvRKPwnIc3vB7LMH8826xhZ9Uo4pw3lqBUvZhJpsGQ4uGNXAdk
         bef05nLWsW3Fm5vmyLuqa7R6JC0+XWbi6ppb5DqZfzi9geKlrnQpO+cFRRpc4tYF9ycT
         gWLg==
X-Forwarded-Encrypted: i=1; AJvYcCV94briX87056KJfY6Aj1xepbFk/JbnXDnjiBhQWKvYbRu05nNbv3C/V5T/wRmLmIKCThU61L8I8grTrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz70w3H6ZIzuJg+Q8eUr3nVCLnPTIgjt6H3qw7VnkrA4b+o8OXn
	alJB46XuELYhWLbaqI3mrGTPitxixQ9oFrQVPSSvey98eEV/MmBVeKdo
X-Gm-Gg: ASbGncsLkwf9pVu5PRzbgRKATz4+jXsdR0UpYFmCJ/tHVr0vFVuOScXRJq7aPCRZ9n6
	sa76ltO36moV9v5h/JlRphW9qAI6Bl5cm3KP72jI/+qf4HCl5I6svnnrYpQ9GeG5Ge75MIzIdUC
	w8r+5N4C5WGZs60BVRmVGmmO0dNS08BEL792G/cbsxAqjEfj/+v4JOyo9CbrNqoCWOE1ShhKEER
	9yI+S83+zGB/v42e10pSmJDkY21E3cMZHYSKSU0rdWEwySFYSZNuOr8udzg/bBOSz/sXBBQXZJt
	JS5n/oPJmqCPzkzSQ169tnVEUjFdxbdT6PbLjukRvcK1G7sjVvQD6yMMJ3wuyQeXvGNp2r2pFQC
	juLC4Obmzvu3JFJcmN+LScyzMMUl1p9jt9IIG+uVspJC/UW3QZrpZ1Q==
X-Google-Smtp-Source: AGHT+IFdNf+EnoFJ3+b6Mq1YD80Ap6/ZdahX+x7QzDtoMhFwkCwxcZCMAPQMd2MY84qPqh+jH/FUAA==
X-Received: by 2002:a05:6402:13d1:b0:634:ab80:d84b with SMTP id 4fb4d7f45d1cf-639d5c5a3f8mr18291541a12.32.1760340175044;
        Mon, 13 Oct 2025 00:22:55 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5235e7ebsm8195076a12.1.2025.10.13.00.22.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 13 Oct 2025 00:22:54 -0700 (PDT)
Date: Mon, 13 Oct 2025 09:22:50 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Arisa Snowbell <arisa.snowbell@gmail.com>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>
Subject: [PATCH usb-next] usb: xhci-pci: Cleanup xhci_pci_setup() for shared
 HCD
Message-ID: <20251013092250.699bf60f.michal.pecio@gmail.com>
In-Reply-To: <b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
	<20251007231709.6c16802e.michal.pecio@gmail.com>
	<CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
	<CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
	<20251008082055.5646dadc.michal.pecio@gmail.com>
	<CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
	<20251008130532.49922d58.michal.pecio@gmail.com>
	<CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
	<20251008223406.13f16f19.michal.pecio@gmail.com>
	<CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
	<CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
	<20251009131444.2c221922.michal.pecio@gmail.com>
	<90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com>
	<20251009152703.72e780b4.michal.pecio@gmail.com>
	<b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

This function will be called again when/if the shared HCD is added.
Little to do in this case and there is no need to set some de-facto
read-only properties of the xhci again, even if it was harmless.

Don't bother passing the unused xhci_pci_quirks in this case either.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

This is an alternative to the cleanup discussed last week, which
doesn't require a v2 bugfix. But I also have a v2 bugfix ready if
you think the original option was better.

Both variants were tested with and without "fake USB2-only" patch.

The idea here is that there will hopefully never be anything PCI
specific to do with the shared HCD, so make it patently clear.

It is actually more likely that xhci_gen_setup() might try to use
allow_single_roothub or imod_interval, in which case this version
avoids creating another surprise like the one last week.

 drivers/usb/host/xhci-pci.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index cb7f5dd34333..e09f5fb52cf3 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -568,7 +568,7 @@ static void xhci_pme_acpi_rtd3_enable(struct pci_dev *dev) { }
 static void xhci_find_lpm_incapable_ports(struct usb_hcd *hcd, struct usb_device *hdev) { }
 #endif /* CONFIG_ACPI */
 
-/* called during probe() after chip reset completes */
+/* called during probe() after chip reset completes and again on the shared HCD */
 static int xhci_pci_setup(struct usb_hcd *hcd)
 {
 	struct xhci_hcd		*xhci;
@@ -576,6 +576,10 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
 	int			retval;
 	u8			sbrn;
 
+	/* nothing PCI-specific for the shared HCD, just core setup, no quirks */
+	if (!usb_hcd_is_primary_hcd(hcd))
+		return xhci_gen_setup(hcd, NULL);
+
 	xhci = hcd_to_xhci(hcd);
 
 	/* imod_interval is the interrupt moderation value in nanoseconds. */
@@ -586,9 +590,6 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
 	if (retval)
 		return retval;
 
-	if (!usb_hcd_is_primary_hcd(hcd))
-		return 0;
-
 	if (xhci->quirks & XHCI_PME_STUCK_QUIRK)
 		xhci_pme_acpi_rtd3_enable(pdev);
 
-- 
2.48.1
