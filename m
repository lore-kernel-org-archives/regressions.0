Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259702264CC
	for <regressions@lists.linux.dev>; Sat,  1 Nov 2025 08:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761984193; cv=pass; b=F9zPwEnABwvyXXUzp7icA1mIbxgB0G15RVqEGdG7t62lOaZCWAB2g7zLiLiavyeuKUBcnXEkz75jh+3mRzeFghmFFubbragWFWZlt5Yik0p01fC7rg//yTiW+m5I9MFoGjd7wgvigCytZ4gbENmdVN/CVwIRuagZCZyj64OHjEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761984193; c=relaxed/simple;
	bh=XjP5x5Bgsvr5wyyEs5OOp+96vR7qcdY9kYxub87Mn84=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Cc:Date:
	 Message-Id:References:To; b=qiQ5rPpsIOVjaTlHu37+51mFd/qPy3PWenwmWNqgg9x91qY8eaUrhaRjAVFUEU6pek01hDood1g1HN26c28MTu4f/ggg8krBKI8dMmj7ES3BNkckid5ZML9Kmo+H4tkhCf6YI1o1aT2ojLoo4bFikS06fd738jD4ImoE1iYhE68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; spf=none smtp.mailfrom=xenosoft.de; dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b=rho8inx4; arc=pass smtp.client-ip=85.215.255.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xenosoft.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xenosoft.de header.i=@xenosoft.de header.b="rho8inx4"
ARC-Seal: i=1; a=rsa-sha256; t=1761983988; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kufDPCqeXbYJsOOdu0bImnvOK2gNUmSBIp44LrgnNbw2Ry3Aeo8XJl2UwWQecMbTRH
    7NwZqWkk7v0LmZd1WugxShkYzbGu3PDjR0AG9yz0BfXsZAz5A9/K9VqZdCyAEaaiglo2
    8cFaDivdFcFkPpJhW0PkhFwTEeEMqzGv3Kw/30tTb5+be6IQS1ZFjhvunZkUzhVuv/Bx
    cc1icUUYa+XvhorGdEUY4mqw71E2GHAGjOjJwC1rVhPxpOLjZlByZMxpyVKCUZPjvH0n
    /7VSKyyFvFBhZiIjX4rkiPBkHnZ4OTFqAqIjhplOrlHXd/WCaPOqkxRSaGJS5U0M/oxs
    ZN7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1761983988;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Date:Cc:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=+3zUXjN3NTSdTgmydFFZq3v8qUJDNiC8H0mmxBV6SGs=;
    b=JyRIx7E2YTEWOKv6FSLcd0vicxmYS2A4NYq08sUW05Tk+txajKh7OHXa+HbeDeTfYU
    l7gbTVfK/3d91BknF2sxWaKl153iaJ2EP3ncshFoKCaOVjxKNyfEgLMdfZdjyZDMk2Jo
    LlP5sDLOoakF9PE+/No0bj3cBDhDjUaQWsrk30GOOwxHmJIZa755Yv1ZceskwTsBgU2j
    Vuow7W2wigY1K1rBeVOgUa7U3lvMIKTzUCM/+VHy2qu6nXDorK1co2vak+vtJ3P/zkSs
    VOb1JPrnCriY3sRFLRyZaXh7oOxmp/v8IY8X7me8mbepCdWYFbphO13nMZ+Cs1TIwWj2
    +7MA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1761983988;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:References:Message-Id:Date:Cc:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=+3zUXjN3NTSdTgmydFFZq3v8qUJDNiC8H0mmxBV6SGs=;
    b=rho8inx4rPVjAto+1VxN8lJscQ1smSsIPBGY8zHDOSafiS4+Mh3EUgQWJcEBakhy5O
    PIwItm069ecrfsxh6zZ2eVyRwqAVVpg3yE1nL4616em30YtTTJiEUUy+5uxSar0bIld2
    /NU4vNbnA3kSWe6N39U3NmwmHY0ATiSdD9TEguUiXY5v5CJFCtMxUATdKg+/Qlgmahu7
    JM2fI15BAL8cUc6uSR9TDzgA3mD2u9JprBdtxdw59lZdI3exTkKylYJAgr8YHQswVuhD
    v4d41zmwFB0DzfFauRDFlkWMocXdop3LzujIFjiLXBk1f1G4rEa0N5LnM4BEL8kJkBVf
    RQXg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7VZi2s3yVXnhFqLkx1Gy5BXrtBsVfqVNFrP47WD4="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e288661A17xmX2D
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 1 Nov 2025 08:59:48 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: [PPC] Boot problems after the pci-v6.18-changes
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <545ac5c9-580c-5cf7-dd22-10dd79e6aabf@xenosoft.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lukas Wunner <lukas@wunner.de>, Manivannan Sadhasivam <mani@kernel.org>,
 regressions@lists.linux.dev
Date: Sat, 1 Nov 2025 08:59:37 +0100
Message-Id: <AEBA92BD-B46D-4D1B-A4D1-645B276E34CF@xenosoft.de>
References: <545ac5c9-580c-5cf7-dd22-10dd79e6aabf@xenosoft.de>
To: Bjorn Helgaas <helgaas@kernel.org>
X-Mailer: iPhone Mail (23A355)


Bjorn Helgaas <helgaas@kernel.org> wrote:

Oops, I made that fixup run too late.  Instead of the patch above, can
you test the one below?

You'll likely see something like this, which is a little misleading
because even though we claim "default L1" for 01:00.0 (or whatever
your Radeon is), the fact that L0s and L1 are disabled at the other
end of the link (00:00.0) should prevent us from actually enabling it:

pci 0000:00:00.0: Disabling ASPM L0s/L1
pci 0000:01:00.0: ASPM: default states L1

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 214ed060ca1b..27777ded9a2c 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *=
dev)
* disable both L0s and L1 for now to be safe.
*/
DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0=
s_l1);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_FREESCALE, 0x0451, quirk_disable_asp=
m_l0s_l1);

/*
* Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain

=E2=80=94

Hi Bjorn,

Thanks for your patch. I patched the RC3 of kernel 6.18 with your new patch a=
nd compiled it again. Unfortunately the FSL Cyrus+ board doesn't boot with y=
our new patch.

Sorry,

Christian

--
Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/Web-Browsers-and=
-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)

=E2=80=94-

What about with=20

+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, PCI_ANY_ID, quirk_disable_aspm_l=
0s_l1);

?

- Christian=

