Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E56125A3
	for <regressions@lists.linux.dev>; Thu,  5 Oct 2023 12:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QiOnrnlZ"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696510492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8FnzjHBE5EOyFgL2R5kZRhAxL9Ra2YWa3jEQV7PDUY=;
	b=QiOnrnlZ2RNq/BaiR48OT+0eEtilt07V3fD6RMCq45czuPXMFtcjXqpffzBFom7iPyaW4I
	709jzYDsYam9ORDYkGEjQ7n3xpelnez+vpFcCV1l5ANZBAe2uD1ZSAWOdnYrjsMXnNmXzA
	jI3GBxQriZf4tuXqbLl1fLmZqE79QDE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-1TwhoRVXMBKDFBDI5F4akg-1; Thu, 05 Oct 2023 08:54:51 -0400
X-MC-Unique: 1TwhoRVXMBKDFBDI5F4akg-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-27911ce6206so865996a91.0
        for <regressions@lists.linux.dev>; Thu, 05 Oct 2023 05:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696510491; x=1697115291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8FnzjHBE5EOyFgL2R5kZRhAxL9Ra2YWa3jEQV7PDUY=;
        b=il7WqetOtX8zxQR0HXMdQslm3ZsergxoxJmZAFChKTpvodJn+HK3Fmx7Bph7I2GMqP
         /eL6hERveSy5CSj5kz9Y6mQemqeP/X32fRh48CZAQ3cmB/GcjlsfG845/tGxQlJBBXNo
         boHSFRfzCmkuHIqtEga5fugpQagxbTUuBZiH9KI6u2614hkhV9mdUUli0a//8lXscdJb
         NN+Kk0UgoUXsUZZtO4GiwRBGYgpHbJXUbDlBZNbeijDwb39SahtTIeCXmljgsUfKDZ8V
         rWoEj0fYD8kVu/qdbbqkzOuaOodSTRHjY/JlcKYEyYbALpI+POEXbYqgfHZyG91vId8B
         U69w==
X-Gm-Message-State: AOJu0Yx6IQa1vYzUYdPiRCwGuzGz3e7BMOOAVtoMAVcMqbBVomg39G9x
	CXe8DhFShBQ2OE0buzyIJJFBFUTifg6e/Uw0oh4QVf6sk4MG8nGtpK9k4oH/l6QMZYauBzuhLPu
	XFB63QQGIghVg+HcXjHOUdUnxM3hbLxjiPT01RA==
X-Received: by 2002:a17:90a:4ec3:b0:274:84a2:f0d8 with SMTP id v3-20020a17090a4ec300b0027484a2f0d8mr5221949pjl.25.1696510490750;
        Thu, 05 Oct 2023 05:54:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcYgRZ3g9ugJyDEXZ+o2uh/VNC6urawc/m9Q8Xhjnb3KyySGrMPNhWT9qVeAunp4rh394LMoha3asVQfoH5EU=
X-Received: by 2002:a17:90a:4ec3:b0:274:84a2:f0d8 with SMTP id
 v3-20020a17090a4ec300b0027484a2f0d8mr5221937pjl.25.1696510490503; Thu, 05 Oct
 2023 05:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230925141930.GA21033@wunner.de> <20230926175530.GA418550@bhelgaas>
 <20230927051602.GX3208943@black.fi.intel.com> <CA+cBOTds9k1Q2haC_gTpsUvjP02dHOv9vSconFEAu-Fsxwf36A@mail.gmail.com>
 <20230927135346.GJ3208943@black.fi.intel.com> <CA+cBOTfCy-KOptir9yfkVz1=bfOTPQanqe9ofX-jphm7oeBEXg@mail.gmail.com>
In-Reply-To: <CA+cBOTfCy-KOptir9yfkVz1=bfOTPQanqe9ofX-jphm7oeBEXg@mail.gmail.com>
From: Kamil Paral <kparal@redhat.com>
Date: Thu, 5 Oct 2023 14:54:23 +0200
Message-ID: <CA+cBOTdzp+6whm=Sj5nE2=MC4a+45y0CFtk4hDGq0XgF6f0f2A@mail.gmail.com>
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org, 
	regressions@lists.linux.dev, bhelgaas@google.com, chris.chiu@canonical.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 4:12=E2=80=AFPM Kamil Paral <kparal@redhat.com> wro=
te:
>
> On Wed, Sep 27, 2023 at 3:53=E2=80=AFPM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > If you apply the patch from here:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=
=3Dpm&id=3D6786c2941fe1788035f99c98c932672138b3fbc5
> >
> > Does the problem go away with the disconnect case too (and so that you
> > have "secure" enabled)?
>
> Thanks, I'll test it, but I can't do it this week. I'll reply next week.

Hello Mika, sorry for taking me so long. The URL above gives me a "Bad
commit reference" error, but I found a patch mentioned in a different
thread, so I used that one, and I hope it's the correct one :-) It's
quoted below.

With the patch applied, I can confirm that disconnecting and
reconnecting the cable during suspend is no longer a problem. I tested
both "user" and "secure" Thunderbolt security levels. The resume is
fast in all cases, and I've found no issues. Thanks for working on it!

The patch I used:

> ---
>  drivers/pci/pci-driver.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index a79c110c7e51..51ec9e7e784f 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -572,7 +572,19 @@ static void pci_pm_default_resume_early(struct pci_d=
ev *pci_dev)
>
>  static void pci_pm_bridge_power_up_actions(struct pci_dev *pci_dev)
>  {
> -     pci_bridge_wait_for_secondary_bus(pci_dev, "resume");
> +     int ret;
> +
> +     ret =3D pci_bridge_wait_for_secondary_bus(pci_dev, "resume");
> +     if (ret) {
> +             /*
> +              * The downstream link failed to come up, so mark the
> +              * devices below as disconnected to make sure we don't
> +              * attempt to resume them.
> +              */
> +             pci_walk_bus(pci_dev->subordinate, pci_dev_set_disconnected=
,
> +                          NULL);
> +             return;
> +     }
>
>       /*
>        * When powering on a bridge from D3cold, the whole hierarchy may b=
e
> --

