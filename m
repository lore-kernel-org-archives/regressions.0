Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5992E633;
	Mon, 16 Oct 2023 16:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9b2cee55056so829320966b.3;
        Mon, 16 Oct 2023 09:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697472227; x=1698077027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1o1Sjx05gX0rIxT2he/9e9a3FERmo9S5QHOTVv8X/pQ=;
        b=K27/vGXOgssm6v99CPeETrMVWqTmUUiG5JHK+VFwN10/cvWxPR6NZ927NDG599pZjY
         6hfpruXzWJNHWzcI6EQfGQNiiM3Wcnm2psXT/cwcjQfKZSpitUU7YO2ch6898vbK8zI1
         Fv1yiPX+ZHcr7tCrWg2N4SYvcN7/6/0zBcfLw5MpIGizSEv+hNRVgXlX2Hw+zmUhaUuk
         Gkr2iEIQpdOc1O8X/uKgMS4EY4JBbOoK8d3JVG3RVklHL9+vDUlbHvGAyn30SELHkh4D
         aI9NTgxBrUvnKSOyN1x3sz3VNU4Ksn2rnrssuy7nHhEKaPJHQxGMjq7nfPjjPHnAOx/y
         M0Ug==
X-Gm-Message-State: AOJu0YxRDvxlGqV7iA1qvqVf+CB8aNnnXtRjeRRGnLZpnld/Q9gIeNx5
	DggrBr5ebeQDXOuCFtVIQbUHNMfyvk4eGxYU
X-Google-Smtp-Source: AGHT+IHhfJiosJMVRqTWKaYVOFefu6RUT1be2SdnwaG3h2siT8RvrBKreI7BW6MlBDC3mGpvBOQCog==
X-Received: by 2002:a17:907:7712:b0:9ae:46c7:90fe with SMTP id kw18-20020a170907771200b009ae46c790femr30172487ejc.72.1697472227385;
        Mon, 16 Oct 2023 09:03:47 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id dv23-20020a170906b81700b0099cb1a2cab0sm4348029ejb.28.2023.10.16.09.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 09:03:47 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9b95622c620so831299066b.0;
        Mon, 16 Oct 2023 09:03:46 -0700 (PDT)
X-Received: by 2002:a17:907:74b:b0:9bd:a669:d682 with SMTP id
 xc11-20020a170907074b00b009bda669d682mr8603309ejb.20.1697472226085; Mon, 16
 Oct 2023 09:03:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231016-bt-bcm4377-quirk-broken-le-coded-v1-1-52ea69d3c979@jannau.net>
In-Reply-To: <20231016-bt-bcm4377-quirk-broken-le-coded-v1-1-52ea69d3c979@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 16 Oct 2023 12:03:09 -0400
X-Gmail-Original-Message-ID: <CAEg-Je8rBdgAnpxfW_jP6io1x0MxLu+x_AHbCGrTmjc8XKCLiQ@mail.gmail.com>
Message-ID: <CAEg-Je8rBdgAnpxfW_jP6io1x0MxLu+x_AHbCGrTmjc8XKCLiQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Mark bcm4378/bcm4387 as BROKEN_LE_CODED
To: j@jannau.net
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 3:13=E2=80=AFAM Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> From: Janne Grunau <j@jannau.net>
>
> bcm4378 and bcm4387 claim to support LE Coded PHY but fail to pair
> (reliably) with BLE devices if it is enabled.
> On bcm4378 pairing usually succeeds after 2-3 tries. On bcm4387
> pairing appears to be completely broken.
>
> Cc: stable@vger.kernel.org # 6.4.y+
> Link: https://discussion.fedoraproject.org/t/mx-master-3-bluetooth-mouse-=
doesnt-connect/87072/33
> Link: https://github.com/AsahiLinux/linux/issues/177
> Fixes: 288c90224eec ("Bluetooth: Enable all supported LE PHY by default")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/bluetooth/hci_bcm4377.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4=
377.c
> index 19ad0e788646..a61757835695 100644
> --- a/drivers/bluetooth/hci_bcm4377.c
> +++ b/drivers/bluetooth/hci_bcm4377.c
> @@ -512,6 +512,7 @@ struct bcm4377_hw {
>         unsigned long disable_aspm : 1;
>         unsigned long broken_ext_scan : 1;
>         unsigned long broken_mws_transport_config : 1;
> +       unsigned long broken_le_coded : 1;
>
>         int (*send_calibration)(struct bcm4377_data *bcm4377);
>         int (*send_ptb)(struct bcm4377_data *bcm4377,
> @@ -2372,6 +2373,8 @@ static int bcm4377_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *id)
>                 set_bit(HCI_QUIRK_BROKEN_MWS_TRANSPORT_CONFIG, &hdev->qui=
rks);
>         if (bcm4377->hw->broken_ext_scan)
>                 set_bit(HCI_QUIRK_BROKEN_EXT_SCAN, &hdev->quirks);
> +       if (bcm4377->hw->broken_le_coded)
> +               set_bit(HCI_QUIRK_BROKEN_LE_CODED, &hdev->quirks);
>
>         pci_set_drvdata(pdev, bcm4377);
>         hci_set_drvdata(hdev, bcm4377);
> @@ -2461,6 +2464,7 @@ static const struct bcm4377_hw bcm4377_hw_variants[=
] =3D {
>                 .bar0_core2_window2 =3D 0x18107000,
>                 .has_bar0_core2_window2 =3D true,
>                 .broken_mws_transport_config =3D true,
> +               .broken_le_coded =3D true,
>                 .send_calibration =3D bcm4378_send_calibration,
>                 .send_ptb =3D bcm4378_send_ptb,
>         },
> @@ -2474,6 +2478,7 @@ static const struct bcm4377_hw bcm4377_hw_variants[=
] =3D {
>                 .has_bar0_core2_window2 =3D true,
>                 .clear_pciecfg_subsystem_ctrl_bit19 =3D true,
>                 .broken_mws_transport_config =3D true,
> +               .broken_le_coded =3D true,
>                 .send_calibration =3D bcm4387_send_calibration,
>                 .send_ptb =3D bcm4378_send_ptb,
>         },
>
> ---
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> change-id: 20231016-bt-bcm4377-quirk-broken-le-coded-599688e3c4a0
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
