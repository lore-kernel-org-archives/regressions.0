Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A78215F7D
	for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 00:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763600002; cv=none; b=e39bptBL8PzfssfmfnNTvDNxsWbU6lM4KeUh4waHu4rhkgL2/l9gPbiV3o8m5NvqvvOM9XTfpXVF7Y7PERiD2Zvmsw+gW1loAOV1HogI2ZwTxId3j/qBbApGwN9ms5UPlseqWo0yticMOT0iQSnJa/qhT/QVrMOMe4DWeJJCC14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763600002; c=relaxed/simple;
	bh=aucR+9aT+lKrGwwXTyqF+EFKBa3URGwEfMKLSCv4XjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmyCK4Ay5NLgyGi/QHA0nV6H+awJHOWPL6qamRz+kZ2gFe6cOkiEkYv4/UcEWWCfiA5P5/cBFwDcGWxMRUyQUsbIPugwqSiHmmXR121lHeu4UIG8TALtPENdCqvjLVW6uaEsHi5A0nb9MSf2ublc2B67F9Rlw31xd+L3BCXf2eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QObxJhUS; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QObxJhUS"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7291af7190so49794166b.3
        for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 16:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763599996; x=1764204796; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GW8I6Fq9t2L7adxKOxyY9vGDX1ivVL7y0AgvnnUr40s=;
        b=QObxJhUSiB6Du85izCvgRaNGUF4unRNd19MpaZhHxdXYB7BHC86Oj3vD7w1cPJtND5
         leR4NtWZzstKyiYd3K2/B9jl2vyW7mD4Yp1WVYdc1E6tNz/nMlu2eahgVtozlW7MhJf/
         hTOXzMwGEjDR+izKembbZpYCnoOoGXQUn/dOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763599996; x=1764204796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GW8I6Fq9t2L7adxKOxyY9vGDX1ivVL7y0AgvnnUr40s=;
        b=H/qIHbgQ/UfLZGN4dqBG/R9fEdmyDOlZQ/vp+b9jo/dKHWZljrEOWolfZ6fgAWMAdz
         tP5ifyn/zh+f/Ivb4vtxWpw1haUmFPGNYcXqdGyXfQwj9UIoMslyaUek1QzyNlJzGxN9
         Wm57uwyWX++vBfz4CN6lDCg5cZBst8M1Ol9xvJB+jj1rAAm4SXTMUIWRQ/0SMsRLnVjC
         e5LKkKynlcA8WPs8J0I1+appl4pvekj3pupv1bou1fnLifsPdI98vOo/GMzc5bA/fKDh
         lVNOYFztuJV3HhMe3IRD90/vyLKee4CQEu8Z/E6mMuoLeUZRWW56WybgEJAkZ05QdLEO
         zDaA==
X-Forwarded-Encrypted: i=1; AJvYcCUTrJPqq03X6t2zJfXaqWGgGVX+IaiDYGvBuqL9ve8RpnmLUhCLwNakcXPD4AKOpoHLQ96lpf9AvMap1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeGnzscZTXP+zrMZagjMf5q0masj90MO7SkTckcnBz79WGimI+
	Lhv3olV5iuIx44SXXoBhRoHKFUOehwOzdcN1kLHdTqH9Ptc4aEJ5vJuWU1LXUEN1p/0ycLxUR/6
	vZzMFhVmV
X-Gm-Gg: ASbGncsp8iI97K2nFmhrogQyW+MnZqkhjwrqFbP72FiiF7G1FmUvR7OCZC2QtMgYltk
	H6kmDbXp+zKBFWEaUQ8iJmLgPaDsUMnymPjSgYxp2i1nUEaa26tqqfuzvmU4h/u8XPIc/orIpyR
	XJXGkct6Ff2qRHMkKOeY43m03TzaHuPDLoTTaOJ6FVdL9NWTuOsqvHp5UWyN7CKRxlnxrTHyiiR
	GC2Yw5KaV6NXci1J6y7BfW7cE0sm8+aQjrWJrGGHB3VyND7uOmv8GFXYBQze6iAKwQe8aV2HwOH
	id/KuhpsxbBwFbBDxhiHGIQPwOEPYXPqG3rWnDEsnnC9YevYa0a91cKSvZCjC6ptcjPUvSO8Q5J
	50AA9ZkUDsiW7yJ1dYIhlEyyXjzsJLgG2PaeLyfV0qF/+9be/UKcPXoIrUyJ71nLJpFgXssvxWs
	lIhW/tGnXQfTmLc2BQ8knjKC5WdU9xt13xStaUY0ojVqB/3Vkmxw==
X-Google-Smtp-Source: AGHT+IHigtx89yW3CGky1SuXvWNdp31ZzcCDUdku6mf30qNGDPiKZP+pqlDsVedt7IJyFRZt+ntilw==
X-Received: by 2002:a17:907:9722:b0:b73:80de:e6b2 with SMTP id a640c23a62f3a-b76588aff91mr32297366b.31.1763599996372;
        Wed, 19 Nov 2025 16:53:16 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655038011sm71428366b.62.2025.11.19.16.53.14
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 16:53:14 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b32a5494dso150390f8f.2
        for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 16:53:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVgf6ymnh0xllnhD0fFDvj8/0xqrsrpgA8OyPerHHx4mjtVx2l/LPf6YSmeCrzqvHqEPca9O9UzxOwlYQ==@lists.linux.dev
X-Received: by 2002:a5d:5f45:0:b0:42b:3c3e:5d53 with SMTP id
 ffacd0b85a97d-42cbb2783c3mr86119f8f.16.1763599994388; Wed, 19 Nov 2025
 16:53:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <jOB6zqCC3xjlPPJXwPYPb4MxHJOhxVgp380ayP7lYq-aT2iA5D8YCdMeCvq5Cp_ICZmqjpfgX8o9siQdlPu9DY4qgnL_zCjgqP23fXc-P4U=@proton.me>
 <1b59d3c2-1ed0-40df-a3ba-cca2316e866b@leemhuis.info> <a03739b9-3a54-4ecb-b55f-6aaa69da3fc6@leemhuis.info>
 <a380d061-479e-4713-bddd-1d6571ca7e86@leemhuis.info> <CAD=FV=Xt58+WGK_j_TvTxpUfXrm-=Cec1-oodkuf5xiDGrsKuA@mail.gmail.com>
 <T4YKnjuw-ZdA4uQjGVxQh-vqahAK_69kn20zfC_8R45iOxbdjo_tlIDwP5rTUyjn3NVUHYhG09VO2ryFtfLtgptBBhfXggFNAD2CVAwPcjU=@proton.me>
 <CAD=FV=WDx-WcosBWf2yd3sLx5pEyjOgbs_Y5RBF=+b=0q3dBww@mail.gmail.com> <5rFwJreAVujrYXDGZZxW32PHa6HZ29PEP4R5-dqS9dbU3FI__qe3zIUx31TIHO_LjuURCSwaGucSFBPeXAjf00XzAxTzXbmf1AaY6neyQ3Q=@proton.me>
In-Reply-To: <5rFwJreAVujrYXDGZZxW32PHa6HZ29PEP4R5-dqS9dbU3FI__qe3zIUx31TIHO_LjuURCSwaGucSFBPeXAjf00XzAxTzXbmf1AaY6neyQ3Q=@proton.me>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Nov 2025 16:53:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UCnt3nUktRyzUDp1agDFp3ZJo=t+xBbLCD6W7Jd0aF7Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnxqYh2GblOKOFIt0kJU2HklGRNL4MV5MetawgKuhQ8ix4i6fyRlr-tsRI
Message-ID: <CAD=FV=UCnt3nUktRyzUDp1agDFp3ZJo=t+xBbLCD6W7Jd0aF7Q@mail.gmail.com>
Subject: Re: [REGRESSION] Bluetooth adapter provided by `btusb` not recognized
 since v6.13.2
To: incogcyberpunk@proton.me
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "marcel@holtmann.org" <marcel@holtmann.org>, 
	"luiz.dentz@gmail.com" <luiz.dentz@gmail.com>, 
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, 
	"johan.hedberg@gmail.com" <johan.hedberg@gmail.com>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 19, 2025 at 4:43=E2=80=AFPM <incogcyberpunk@proton.me> wrote:
>
> Yes, manually updating `drivers/btusb/btusb.c` , with the below proposed =
patch fixes the regression issue.
> The proposed patch solves the regression of `bluetooth adapter provided b=
y btusb not being recognized in both the stable and the mainline kernel sin=
ce 6.13.2`
>
> The proposed patch:
> `
> index a722446ec73d..1466e0f1865d 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2714,6 +2714,11 @@ static void btusb_mtk_claim_iso_intf(struct btusb_=
data *data)
>         struct btmtk_data *btmtk_data =3D hci_get_priv(data->hdev);
>         int err;
>
> +       if (!btmtk_data->isopkt_intf) {
> +               bt_dev_err(data->hdev, "Can't claim NULL iso interface");
> +               return;
> +       }
> +
>         /*
>          * The function usb_driver_claim_interface() is documented to nee=
d
>          * locks held if it's not called from a probe routine. The code h=
ere
> `
>
> I applied the patch as suggested, but now what do I have to do to get thi=
s fixed upstream and fixed in the next mainline & stable releases.

Excellent. The best way to get the fix landed is to respond to the
post I made at:

https://lore.kernel.org/r/20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd817=
36649568a@changeid

...and add your "Tested-by" tag. With that, the Bluetooth maintainers
(if they're happy with the patch) will land it and it can start
working its way to stable.


> Also, could you brief a bit, on how this proposed patch containing , a NU=
LL check for the `btmtk_data->isopkt_intf`; solves the problems introduced =
by the problematic commit with: [ Upstream commit e9087e828827e5a5c85e124ce=
77503f2b81c3491 ]

Check out the commit message on the patch I posted. I explained why
the NULL check fixes the problem there. If that's unclear, I can try
rewording.


-Doug
