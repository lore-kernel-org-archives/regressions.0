Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D484C5667
	for <regressions@lists.linux.dev>; Mon,  2 Jan 2023 17:44:09 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-15027746720so19237354fac.13
        for <regressions@lists.linux.dev>; Mon, 02 Jan 2023 09:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ralston.id.au; s=google;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpUdWNyPhWU5w8o3Zwx5VFBr6NeDV2N4F/Qnpa1vL6I=;
        b=m6MfbMmfrvFMSUgheX+b1ukF1/bEA3TEehvz5R5uFzBKT/TyBoKBSLtWV+njwJqx8v
         tspcNCE91UZXack1P2u1PQvk1cXE+2YnYZHlKYOb5AC1nlfaVGG0yK6X797LnQg2TtTy
         H3iwEfDsHqXGhUBEoKw+B8vG5Zosq/HWi/kQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpUdWNyPhWU5w8o3Zwx5VFBr6NeDV2N4F/Qnpa1vL6I=;
        b=2r8Cy+hTvVN7RLADnTjnJAQTqa6ggrIyz/9lmMgLO2cDrfa7kWR4P2ybf7Pls1IxQD
         HgXnpOdTzLySEYyRvJzcHteCh7SKa80YgvPfgeBDZQLuLHkq5s7w7+O7stIkZAzKjobF
         PWoAQ477osZqUiE1o+sfoJj5LPBMCTjXlYJtTu2jqU6luBXSfwx47v/PebzBb4h3z6bP
         tJcJwmYOnHvbzu+mEjyIshdryVrMkdY2Mgj/zoal/tEglvUyY465vnZaHV9c4SPZTAiH
         MQwGmvzCtWioeyIG5DsmL1VO3A1WqsrVLLBPHSKPpIXJ1kOX6KChOPNRkryQPjeoch4Q
         dN2A==
X-Gm-Message-State: AFqh2koDUgtNKrif8txzRXmC/GSMntUnbMASxrhafreUra3sBGU3MN8e
	DeCwVmYy7P5+EBzwHqP9Bx4dcC7wVBb+FO2gU/6lhQ==
X-Google-Smtp-Source: AMrXdXt300OkGf3B2NgvxWo1oA2JPnVGjbbRXY38U1mSSmMdpmnqxV4oDKEOoFyumXSsZZDh0jag4jDM2UvUsf2wacQ=
X-Received: by 2002:a05:687c:189:b0:14f:a2ed:988f with SMTP id
 yo9-20020a05687c018900b0014fa2ed988fmr1910155oab.220.1672681448813; Mon, 02
 Jan 2023 09:44:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
In-Reply-To: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
From: Michael Ralston <michael@ralston.id.au>
Date: Tue, 3 Jan 2023 04:43:32 +1100
Message-ID: <CAC2975KFpfPXb06Mfx9oEawbvV_bAoV=YOCCh7g1vfgfLrJWyg@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
To: alsa-devel@alsa-project.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For comparison, on a working kernel version, my audio devices are
listed in a different order:
http://alsa-project.org/db/?f=3Deff15e3b674b313f12121c95d4cf330f9d48897c

--
Michael

On Tue, 3 Jan 2023 at 04:29, Michael Ralston <michael@ralston.id.au> wrote:
>
> I'm currently experiencing a regression with the audio on my Behringer
> U-Phoria UMC404HD.
>
> Alsa info is at:
> http://alsa-project.org/db/?f=3Df453b8cd0248fb5fdfa38e1b770e774102f66135
>
> I get no audio in or out for this device with kernel versions 6.1.1 and 6=
.1.2.
>
> The versions I have tried that work correctly include 5.15.86 LTS,
> 5.19.12, and 6.0.13=E2=80=9316.
>
> When I run this on 6.1.1, it will just hang until I ctrl+c:
> aplay -D plughw:1,0 /usr/share/sounds/alsa/Front_Center.wav
>
> I've run strace on that command, and its output is at:
> https://pastebin.com/WaxJpTMe
>
> Nothing out of the ordinary occurs when aplay is run, according to the
> kernel logs.
>
> Please let me know how I can provide additional debugging information
> if necessary.
>
> Thanks
> Michael
