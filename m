Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB474A1D
	for <regressions@lists.linux.dev>; Wed, 19 Jun 2024 06:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718777151; cv=none; b=a2V1NySeBaTIkaKlIcpSphpLYptfu2LxhifpP+NSIdkZ3m8KCp06v6RJvMyELX7AWvm9tjpSiyeh0+8/XyrPFh0puj/FbKBR4hYkPRc3h8697CKJKJBp/mwA9a/zvGhw5GCLWRT9tI/Mkk4vz30l0xdo3zhc5tITAeERpkqLu3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718777151; c=relaxed/simple;
	bh=l0mNs/FsDmY5dBfAxFirPNKQAqbJFE+jk9p6H27x4nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGxt6Zz1pEiXM9n6BrbyPzy3xCht4WIxSLENQRZQuBmd9sf9r5ejcvzDmmK08LWE2YGyj5pk213IIyN+YKr0auJOVKaeN0EQcw0XCkMzakghyIqQDlxJ9z79+e/UEroiq614fXm97AK+vt0dMcCqPCgMgCFDCJFN0GQbx9AgHUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=rubDcka9; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="rubDcka9"
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0B12F40D7B
	for <regressions@lists.linux.dev>; Wed, 19 Jun 2024 06:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1718777140;
	bh=6Nv2YnUXwNhwZtcnR0l2iX9oZx8TMUNIK8n7g+2X8A0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=rubDcka99JK/9in+OTGFGfYGoumxjXi0kMZvJWAQjqfQHA2iqTtgcwRTasPzVoIu6
	 NiPw4EdlaRPPVWSv9YM9lcJulCOIfQ+ohOQf5hG3Mx+qTi5ETHEhxqN8E47NAW5uhq
	 Nc3H0vjtdBXiB0tZPEQw4RNH+edZnhFAWzW/B/WFl+tA3UBvNgMUlyCQemcIavzqhB
	 ttdI/aegEHtAAzFZaxtI/7xGPHpCG1bJMLzWMPTTKpNUvDoKkoaNgPikPZErrn+xyz
	 jmJIHehu8j9ZH49WUhRQXKWo3q8wN13fLFDg8v10HUGStIVoCcb8sjp5V5zXv+tzs6
	 atwIfUMoz6xKw==
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-6e3341c8865so6026944a12.1
        for <regressions@lists.linux.dev>; Tue, 18 Jun 2024 23:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718777138; x=1719381938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Nv2YnUXwNhwZtcnR0l2iX9oZx8TMUNIK8n7g+2X8A0=;
        b=gJDhOvab5/6OqSug0XNrRH8Zxy3NV8rT8nabnGmlaUjrlFU7Y0hfmCyQkqMPQYLtT9
         miDSDvjqkXInSXeYMsefvZM3UtJCsYaGhtl4gPWUWtR7w60gPW6lbehcvYWWdSqcBpVn
         vO+8VHP9XWMKFP9qrgtP2qD3Q8oIkAWV8P/LweBDWWnWZloX2du5ptnnbO/lBNa6yRv7
         iEK+VOIFK8cYcvUri58ZC1d7A8z9iqCSVnw6nZjJpDFd25nmIA7Vosora3j1pc9aoc/n
         5DML2bolJ2eGVrBkThaARDEa6mwlayN6WI3wWNX+h/H5a3VgqitbtbFE0y4k4MT6ZJEh
         2YLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3C9hiMX4+/7akgcdlGJmgiHKPcKA1oDW+nobdD2reBWW7DNDJ1eblBSwlWLenMZRuU4Kvl5tuS1Q0byQVPoTTb0Bzz2iLXov48HE=
X-Gm-Message-State: AOJu0YxdX+nZuTVxeA1NoqQ81PIvW43Ju4cR2raTZvIheKfaMM09ZlVU
	HFYcIYu1uXZvpeLABGblV7dR0godofvA3oQgYv9e3yme1M1BbHZG8kq/08ZQWKNLaa//sJYrGo+
	ifuwDTRj3yQxZkMzuZYJXyo+XLUD5mjTnI2lEMAShM7HSiU3+00SuK7VV360mjIic34YloVYHZh
	/1IoPr+bmDsZjE8c2iw4zFheUVu1UPDAoc5B0gE0VWLEj8S71tp/o=
X-Received: by 2002:a05:6a20:a8a5:b0:1b2:a94d:4eca with SMTP id adf61e73a8af0-1bcbb5f705dmr1512750637.41.1718777138512;
        Tue, 18 Jun 2024 23:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmoBDk3wuIfStUvPkgN/DsQ3AqL87wGvMpH6BdkD1tmYIyQo/0+ajiApdNg790feEKy+jeMAf9CLNezX3NDog=
X-Received: by 2002:a05:6a20:a8a5:b0:1b2:a94d:4eca with SMTP id
 adf61e73a8af0-1bcbb5f705dmr1512734637.41.1718777138116; Tue, 18 Jun 2024
 23:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAd53p7O51mG7LMrEobEgGrD8tsDFO3ZFSPAu02Dk-R0W3mkvg@mail.gmail.com>
 <20240618204837.GA1262769@bhelgaas>
In-Reply-To: <20240618204837.GA1262769@bhelgaas>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 19 Jun 2024 14:05:26 +0800
Message-ID: <CAAd53p4gHQeyDkusDW7rkjVKjTnyi+RjHZLbPU5CqfsuVRtodQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] PCI/AER: Disable AER service on suspend
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, mahesh@linux.ibm.com, oohall@gmail.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, bagasdotme@gmail.com, 
	regressions@lists.linux.dev, linux-nvme@lists.infradead.org, kch@nvidia.com, 
	hch@lst.de, gloriouseggroll@gmail.com, kbusch@kernel.org, sagi@grimberg.me, 
	hare@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 4:48=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Thu, Apr 25, 2024 at 03:33:01PM +0800, Kai-Heng Feng wrote:
> > On Fri, Apr 19, 2024 at 4:35=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.o=
rg> wrote:
> > >
> > > On Tue, Apr 16, 2024 at 12:32:24PM +0800, Kai-Heng Feng wrote:
> > > > When the power rail gets cut off, the hardware can create some elec=
tric
> > > > noise on the link that triggers AER. If IRQ is shared between AER w=
ith
> > > > PME, such AER noise will cause a spurious wakeup on system suspend.
> > > >
> > > > When the power rail gets back, the firmware of the device resets it=
self
> > > > and can create unexpected behavior like sending PTM messages. For t=
his
> > > > case, the driver will always be too late to toggle off features sho=
uld
> > > > be disabled.
> > > >
> > > > As Per PCIe Base Spec 5.0, section 5.2, titled "Link State Power
> > > > Management", TLP and DLLP transmission are disabled for a Link in L=
2/L3
> > > > Ready (D3hot), L2 (D3cold with aux power) and L3 (D3cold) states. S=
o if
> > > > the power will be turned off during suspend process, disable AER se=
rvice
> > > > and re-enable it during the resume process. This should not affect =
the
> > > > basic functionality.
> > > >
> > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D209149
> > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D216295
> > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218090
> > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > >
> > > Thanks for reviving this series.  I tried follow the history about
> > > this, but there are at least two series that were very similar and I
> > > can't put it all together.
> > >
> > > > ---
> > > > v8:
> > > >  - Add more bug reports.
> > > >
> > > > v7:
> > > >  - Wording
> > > >  - Disable AER completely (again) if power will be turned off
> > > >
> > > > v6:
> > > > v5:
> > > >  - Wording.
> > > >
> > > > v4:
> > > > v3:
> > > >  - No change.
> > > >
> > > > v2:
> > > >  - Only disable AER IRQ.
> > > >  - No more check on PME IRQ#.
> > > >  - Use helper.
> > > >
> > > >  drivers/pci/pcie/aer.c | 25 +++++++++++++++++++++++++
> > > >  1 file changed, 25 insertions(+)
> > > >
> > > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > > index ac6293c24976..bea7818c2d1b 100644
> > > > --- a/drivers/pci/pcie/aer.c
> > > > +++ b/drivers/pci/pcie/aer.c
> > > > @@ -28,6 +28,7 @@
> > > >  #include <linux/delay.h>
> > > >  #include <linux/kfifo.h>
> > > >  #include <linux/slab.h>
> > > > +#include <linux/suspend.h>
> > > >  #include <acpi/apei.h>
> > > >  #include <acpi/ghes.h>
> > > >  #include <ras/ras_event.h>
> > > > @@ -1497,6 +1498,28 @@ static int aer_probe(struct pcie_device *dev=
)
> > > >       return 0;
> > > >  }
> > > >
> > > > +static int aer_suspend(struct pcie_device *dev)
> > > > +{
> > > > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > > > +     struct pci_dev *pdev =3D rpc->rpd;
> > > > +
> > > > +     if (pci_ancestor_pr3_present(pdev) || pm_suspend_via_firmware=
())
> > > > +             aer_disable_rootport(rpc);
> > >
> > > Why do we check pci_ancestor_pr3_present(pdev) and
> > > pm_suspend_via_firmware()?  I'm getting pretty convinced that we need
> > > to disable AER interrupts on suspend in general.  I think it will be
> > > better if we do that consistently on all platforms, not special cases
> > > based on details of how we suspend.
> >
> > Sure. Will change in next revision.
> >
> > > Also, why do we use aer_disable_rootport() instead of just
> > > aer_disable_irq()?  I think it's the interrupt that causes issues on
> > > suspend.  I see that there *were* some versions that used
> > > aer_disable_irq(), but I can't find the reason it changed.
> >
> > Interrupt can cause system wakeup, if it's shared with PME.
> >
> > The reason why aer_disable_rootport() is used over aer_disable_irq()
> > is that when the latter is used the error still gets logged during
> > sleep cycle. Once the pcieport driver resumes, it invokes
> > aer_root_reset() to reset the hierarchy, while the hierarchy hasn't
> > resumed yet.
> >
> > So use aer_disable_rootport() to prevent such issue from happening.
>
> I think the issue is more likely on the resume side.
>
> aer_disable_rootport() disables AER interrupts, then clears
> PCI_ERR_ROOT_STATUS, so the path looks like this:
>
>   aer_suspend
>     aer_disable_rootport
>       aer_disable_irq()
>       pci_write_config_dword(PCI_ERR_ROOT_STATUS)    # clear
>
> This happens during suspend, so at this point I think the link is
> still active and the spurious AER errors haven't happened yet and it
> probably doesn't matter that we clear PCI_ERR_ROOT_STATUS *here*.
>
> My guess is that what really matters is that we disable the AER
> interrupt so it doesn't happen during suspend, and then when we
> resume, we probably want to clear out the status registers before
> re-enabling the AER interrupt.

Thanks for catching this. Clearing status registers does the trick for
my cases here.

>
> In any event, I think we need to push this forward.  I'll post a v9
> based on this but dropping the pci_ancestor_pr3_present(pdev) and
> pm_suspend_via_firmware() tests so we do this unconditionally.

Thanks for the v9.

Kai-Heng

>
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int aer_resume(struct pcie_device *dev)
> > > > +{
> > > > +     struct aer_rpc *rpc =3D get_service_data(dev);
> > > > +     struct pci_dev *pdev =3D rpc->rpd;
> > > > +
> > > > +     if (pci_ancestor_pr3_present(pdev) || pm_resume_via_firmware(=
))
> > > > +             aer_enable_rootport(rpc);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  /**
> > > >   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
> > > >   * @dev: pointer to Root Port, RCEC, or RCiEP
> > > > @@ -1561,6 +1584,8 @@ static struct pcie_port_service_driver aerdri=
ver =3D {
> > > >       .service        =3D PCIE_PORT_SERVICE_AER,
> > > >
> > > >       .probe          =3D aer_probe,
> > > > +     .suspend        =3D aer_suspend,
> > > > +     .resume         =3D aer_resume,
> > > >       .remove         =3D aer_remove,
> > > >  };
> > > >
> > > > --
> > > > 2.34.1
> > > >
