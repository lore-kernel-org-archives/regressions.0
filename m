Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F3259B78
	for <regressions@lists.linux.dev>; Thu, 25 Apr 2024 06:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714026417; cv=none; b=Fb2fK2WHA9Jq8u4TPGa52BB9Ef1Lo5vgKb+77kcdknpCh3RkO1C95UKBDi6FvToGyceeXYucPN7ZNMEtJKhdDqGBfE3AcR2FMY2Huf6xdoi9+MMSpqwfhqJD52bHWVxjUPc1WXnNauMRtdgvxSPnyivfUnUIl1tuRiDWzhqtpak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714026417; c=relaxed/simple;
	bh=738bx0ebszciNfqD7UVbAZya1SA+u1TcvpkDfJNU9Gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erp6ygyDlNJw96/8vNwnxhNtJHg3kW9io6XiqtA4TrEl7RBLW3UmvksU+aWP5K1ABkf1hm9eDTritR2SR26ZB2v94CdIkeoheaf83uJe9WRYZNNPclsyGZtC+Gssf43IrG3C7ULCyrH0LvPKYhl+0ob4jOdalefxbX6oAVlCUJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=MEfmFbjR; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="MEfmFbjR"
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3EFAC3F8DF
	for <regressions@lists.linux.dev>; Thu, 25 Apr 2024 06:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714026408;
	bh=vEKVDSHMK5F/yU8ggTZJjhUhsGYpK1yP0OK1ux8Mb5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=MEfmFbjRMHbZe7dqKwQyqOt/C1ykvWE0CHezyTR5NdnJ/yXWOxAhZij4rJ0BHJ59P
	 g9tO6H09BFy2sJ9DfyZHEcKvuyNH6an4/LpFXjvN1G9eLHJ+ma0DuKmzmER88ZIARk
	 wacon9ThfyZzGXp2ZKMmZfmyNZd1nT+63+BZ33ecTNaKonLXmSZbrDyRHOb+JEh1M5
	 nXeas9O8OqokbLCWhj4nLePWlCz3gUw8d0cZItwMgOG2inHQ6G62ngKt7XfyUjOdMu
	 /j3gH+IzNUBWGjhHg3DjUndwsCvYEi5GzPLfKQwfoCD31vERC2ElQ5ElYlVw1SETIp
	 ov4L7a/Bdmqdw==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ae0abc0b41so819191a91.2
        for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 23:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714026407; x=1714631207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEKVDSHMK5F/yU8ggTZJjhUhsGYpK1yP0OK1ux8Mb5o=;
        b=M+U4PWct+Z5Cz9wiJpOjEmIkq8CHKt2fs30DNcPKLtYulbskPLIZMhH45F5Am+gRPJ
         tSR5Q97fpPkIV6J8Q+N9MDWIioHTLXAsgHsLxA4g1EUPO7knY3TbU7LIu80sXXl1rT6a
         eya92QfRRTqEjFjd4lhsgAxsh5Ovsw9Uemnmgp1ucEhk93dediCC1BbQJB+nJPEC/Fxz
         wKOnLYS0qKT/GpFrGNQ/eok2Mr5oiVAIl21MtqPZsACJ3Fiv4A8TRxNSakvdfqUAiKf9
         SLbBW+9qf2AcNv+xw/CbajwmDgBzgvIsDvNHDlCY0czjUSIxMVhtIc/ws/TSKBM2VI9Y
         DTNw==
X-Forwarded-Encrypted: i=1; AJvYcCVMY7CxfJc+lQJnhjBrFCuBAkdg4ANzdq0d4HDpsv7VxRg5Ybcg4bXA+JUzWmGn06vvCkfr1CJsB7uloJSL/ftTq6UkEUuhs11aIWE=
X-Gm-Message-State: AOJu0Yw8r46ePd621Hkp7b9gDJKULf7YwXlIiw2QMPuD2ZsRSFBMwKM0
	IFf3QbSphOkuTaUA//FkOj4I11zf4osU8g3IedpTP4ltYPXXGllzR2lOr+2/UgEO3DydBIfzPKC
	haG2HFtMborHtePiiAeCuEbu2/xwYka0zZjAsu/9kfFd41w2/N2kzeEyeZv/ynLJMSdhePZUppw
	EC7opqQCVJ9s9GgP3Z6xX13RhBHhKnKHBdC/kgC6AIhC6y1AC8OIM=
X-Received: by 2002:a17:90a:4485:b0:2a6:ff2e:dce0 with SMTP id t5-20020a17090a448500b002a6ff2edce0mr5440124pjg.5.1714026406792;
        Wed, 24 Apr 2024 23:26:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLNR3SuwzJ2NqCuDu7XgA6QzggBx2sXnYGhGItyhdXG9zOH57lKQGVFKFleuFQOUiHqsV2LTxk6EPDijTfycg=
X-Received: by 2002:a17:90a:4485:b0:2a6:ff2e:dce0 with SMTP id
 t5-20020a17090a448500b002a6ff2edce0mr5440111pjg.5.1714026406400; Wed, 24 Apr
 2024 23:26:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240416043225.1462548-1-kai.heng.feng@canonical.com> <2aff18aa-32b7-4092-8235-aead9b708ea0@linux.intel.com>
In-Reply-To: <2aff18aa-32b7-4092-8235-aead9b708ea0@linux.intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 25 Apr 2024 14:26:34 +0800
Message-ID: <CAAd53p7e5dWEsSdrvpZ_5b9LLrhVwQEChUkFityN_nOuT2K=zQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] PCI: Add helper to check if any of ancestor device
 support D3cold
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: bhelgaas@google.com, mahesh@linux.ibm.com, oohall@gmail.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, bagasdotme@gmail.com, 
	regressions@lists.linux.dev, linux-nvme@lists.infradead.org, kch@nvidia.com, 
	hch@lst.de, gloriouseggroll@gmail.com, kbusch@kernel.org, sagi@grimberg.me, 
	hare@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 9:15=E2=80=AFAM Kuppuswamy Sathyanarayanan
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>
> On 4/15/24 9:32 PM, Kai-Heng Feng wrote:
> > In addition to nearest upstream bridge, driver may want to know if the
> > entire hierarchy can be powered off to perform different action.
> >
> > So walk higher up the hierarchy to find out if any device has valid
> > _PR3.
> >
> > The user will be introduced in next patch.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
>
> Since it has been a while, I was not sure what this series is about.
>
> IMO, it is better to include a cover letter with the summary of your
> changes.

OK, will do in next revision.

>
>
> > v8:
> >  - No change.
> >
> >  drivers/pci/pci.c   | 16 ++++++++++++++++
> >  include/linux/pci.h |  2 ++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index e5f243dd4288..7a5662f116b8 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -6225,6 +6225,22 @@ bool pci_pr3_present(struct pci_dev *pdev)
> >               acpi_has_method(adev->handle, "_PR3");
> >  }
> >  EXPORT_SYMBOL_GPL(pci_pr3_present);
> > +
> > +bool pci_ancestor_pr3_present(struct pci_dev *pdev)
> > +{
> > +     struct pci_dev *parent =3D pdev;
> > +
> > +     if (acpi_disabled)
> > +             return false;
> > +
> > +     while ((parent =3D pci_upstream_bridge(parent))) {
> > +             if (pci_pr3_present(pdev))
>
> I think it should be "parent" here?

Thanks for catching this.

But this patch will be dropped in next version for better simplicity.

Kai-Heng

>
> > +                     return true;
> > +     }
> > +
> > +     return false;
> > +}
> > +EXPORT_SYMBOL_GPL(pci_ancestor_pr3_present);
> >  #endif
> >
> >  /**
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 16493426a04f..cd71ebfd0f89 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -2620,10 +2620,12 @@ struct irq_domain *pci_host_bridge_acpi_msi_dom=
ain(struct pci_bus *bus);
> >  void
> >  pci_msi_register_fwnode_provider(struct fwnode_handle *(*fn)(struct de=
vice *));
> >  bool pci_pr3_present(struct pci_dev *pdev);
> > +bool pci_ancestor_pr3_present(struct pci_dev *pdev);
> >  #else
> >  static inline struct irq_domain *
> >  pci_host_bridge_acpi_msi_domain(struct pci_bus *bus) { return NULL; }
> >  static inline bool pci_pr3_present(struct pci_dev *pdev) { return fals=
e; }
> > +static inline bool pci_ancestor_pr3_present(struct pci_dev *pdev) { re=
turn false; }
> >  #endif
> >
> >  #ifdef CONFIG_EEH
>
> --
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
>
