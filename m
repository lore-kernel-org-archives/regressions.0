Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E8ADDC5
	for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 06:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763620272; cv=none; b=LW6cHTvXcbMbQYQ5OSean91lB5AmPTxGyA26eEo0+7zsRHtfS85CWPPzdY50g4dRBktWWgncZ/ZHywi575heUUOp1GPV8IMD2/z++y0yXZrz5AVUZAlOZa++9EIu04mEtVlV6oJYt4oHgK/midGmHVHVbV5JzDhCmgQIbIjr6gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763620272; c=relaxed/simple;
	bh=Vj0oUqgdjXtka8x1D1nuQmVneuMX5ah24CpqJzt6DJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sglYuEzIBTGAycn4nRs4cXs0FoPRHGJJHwyhqiKc4U+mV43P0UowhXBzxxJtGRfgjo2q+hrh6UjLOaJnK8tWB09h7V2mEXXjMyrEb+pstUO6drT8SbZKEA6DssTnPilhV+nID7qXcxCRzRaN3wNPwWBUjeL/6ZMEqtCxbykhLQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Eqor244u; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Eqor244u"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b736cd741c1so99365366b.0
        for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 22:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763620262; x=1764225062; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UZzBLoi3OOPNC2jFhtLWiTjN8vln3eiSs4jfqveXB8=;
        b=Eqor244udeNAWDruFGTIuJ4/f8Tj7szv4j4x/viAR2m76UPO8nmvLNjDKpBwyu1JYs
         fWnndT0xgivh5JAT1YfezvrTU9LBYNw+Sqota19PbcnoMDeLQU9OvVV233yVJ5jyzqm6
         CBy4x32JWCOproj8k+7zYG0a/WDaHFFxoAvD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763620262; x=1764225062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3UZzBLoi3OOPNC2jFhtLWiTjN8vln3eiSs4jfqveXB8=;
        b=mWWBQsKE5iDlgCixfcNgMxgcIdrUmWqZB8lH2KuyWfI3dCrqtU2M6JX/zZ6iIgAY5h
         qtSHdny9pPMw5zjoSDukphMTwsTvwXGZZJSfSxeA1ZYo646ZDAKdPFSaDhp5G78pOKkB
         EudJmpZECo0CPLllbm2xD3oDejVpP+NBsqWZF+PUTmMynKA7b/Y6MFClZch1y3h86Iuf
         /CBg9hHy8s7fN3nQ+ZTBloDLwiAWT3KaDN7/T0qaQGyW/RuLgABPm6cm796Am5YknxDB
         zofVA6wdNmkEESCW/Z/GNwOBhjIJK7wt1EkterEhdRaJ4B9FWoV3SRHHQjmr0ceD/9bl
         dEag==
X-Forwarded-Encrypted: i=1; AJvYcCXleDf5Z7LFYCnf+B75knMwhtHU6QSOHSznhT/LPtwZYmH57+dqx0mR55U/UfQPdnZMdcHelHreJk5EFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBEKxeiUqBSMYf4JGSHramPlWyPvhiIhEo/aUcknDOjMKQP+G0
	yUWC3vGP12WJqEItxjZxVCx+lDMndLHgSEgzxGGFoELCrQBdpaD0pX7F+IjTRb642oPZGxxSdRU
	y9uK1/w5P
X-Gm-Gg: ASbGncuh0oRsu8/rQEmE8yq2hH4BP17x2CODmOWNDUDPcyIrBFxhs/IW5evKSjv00Bj
	YKURg2ddl5NO/dfb8Icwo7I49nj1ftp3LaNvsOnprCyC4BKezKmiDPdcmPhUCHZYdt+Wv2Q+PZZ
	FflShVEuPiz4Z4P8inoYfRvgFZB2J8f1IKto3PJukXV/kfDQWkb6PhbZhdkODk5Wqvnad8ud0oK
	paziHpH+qM8jllP5yB2fTpB6H1FMnpBxJf6M1cyUk6KOvUXTOedxZDvU5gVcpv60fd0qmUFfqIh
	edA0LZImTU19hoZ396yIZrCIp5ijVJSTPIMDL7kkd0Tii42AT4ZW7J5c9VaQdWquMLdUxX6kDJF
	QzLo4BDUgx4ZmCgCxsRWZPSIzMWlPyGT8UKUygn/nORcWHjrHw1VXtV8zsX3Km3MkRQULOqXe9A
	KNQ4NtEAZsOUGX2ctaCWx8vtSlSh9qPeDhMTv2WPGJJwTNQCanMw==
X-Google-Smtp-Source: AGHT+IHN2X3+KsLG0JVN7r44rQEZ8ebKhX8M6uEwMSP1SZdk5g0B3chImRYuYL7XqwX5ZBfDOc47yg==
X-Received: by 2002:a17:907:7e81:b0:b72:b8a9:78f4 with SMTP id a640c23a62f3a-b76588b1f31mr110132266b.39.1763620261730;
        Wed, 19 Nov 2025 22:31:01 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd43e2sm129135266b.39.2025.11.19.22.31.00
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 22:31:00 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso3212955e9.2
        for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 22:31:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUtn56fa/KPE8ZS6qSYJ9jCb+BhaOttxh164SO+CJJ7/emu414yYL5eAwedDoRAnCatsXRLAV1pXt6LeQ==@lists.linux.dev
X-Received: by 2002:a05:6000:2f86:b0:429:bc68:6c95 with SMTP id
 ffacd0b85a97d-42cbb2aa2b8mr781529f8f.47.1763620259551; Wed, 19 Nov 2025
 22:30:59 -0800 (PST)
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
 <CAD=FV=WDx-WcosBWf2yd3sLx5pEyjOgbs_Y5RBF=+b=0q3dBww@mail.gmail.com>
 <5rFwJreAVujrYXDGZZxW32PHa6HZ29PEP4R5-dqS9dbU3FI__qe3zIUx31TIHO_LjuURCSwaGucSFBPeXAjf00XzAxTzXbmf1AaY6neyQ3Q=@proton.me>
 <CAD=FV=UCnt3nUktRyzUDp1agDFp3ZJo=t+xBbLCD6W7Jd0aF7Q@mail.gmail.com> <5vLxmZlxKXfznaWPi2ndxyj90dJN1FML_fINz027uaJP2rZK_nQu_41m7WA7Gnc1yy_XLw8KMWF18Y_keW-qKjHy0BBOQl0A92QiY7Kg004=@proton.me>
In-Reply-To: <5vLxmZlxKXfznaWPi2ndxyj90dJN1FML_fINz027uaJP2rZK_nQu_41m7WA7Gnc1yy_XLw8KMWF18Y_keW-qKjHy0BBOQl0A92QiY7Kg004=@proton.me>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Nov 2025 22:30:48 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WRYYYB+G4-7y7uVR8QCEEMp2iRfmtsAa29UfyNCVD=4Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnTsU355qMVV2Ab2pAuyymcavgyaDDrdQfCxFRSS9uXEOwFEsBZmxvs2zM
Message-ID: <CAD=FV=WRYYYB+G4-7y7uVR8QCEEMp2iRfmtsAa29UfyNCVD=4Q@mail.gmail.com>
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


On Wed, Nov 19, 2025 at 5:04=E2=80=AFPM <incogcyberpunk@proton.me> wrote:
>
> Excellant , i will reply to the lore so that further progress from the Bl=
uetooth maintainers can take place.
>
> Also ,
>  Yes .Simply because this is an unknown territory for me, i had a hard ti=
me understanding the problems just from the commit patch message.
>
> I would be grateful if I could understand how the `btmtk_data->isopkt_int=
f` being NULL caused a crash due to the commit in 6.13.2 and what it means =
to say `Prior to that
> commit we'd pass the NULL pointer directly to
> usb_driver_claim_interface() which would detect it and return an
> error, which was handled.`.
> How was the pointer passed directly such that the device_lock mutex , wor=
ked in an undesired manner to lock the adapter and turn it on.

In 6.13.1, the following could happen:

1. We'd be running btusb_mtk_setup()

2. In btusb_mtk_setup(), we'd run:
  btmtk_data->isopkt_intf =3D usb_ifnum_to_if(data->udev, MTK_ISO_IFNUM)

3. If usb_ifnum_to_if() returned NULL, "btmtk_data->isopkt_intf" would be N=
ULL.

4. Next, btusb_mtk_setup() would call btusb_mtk_claim_iso_intf().

5. btusb_mtk_claim_iso_intf() would pass "btmtk_data->isopkt_intf"
(NULL) to usb_driver_claim_interface() as "iface".

6. usb_driver_claim_interface() would see that its parameter "iface"
is NULL and would return an error.

7. btusb_mtk_claim_iso_intf() would notice the error, print "Failed to
claim iso interface: %d", and return.


In 6.13.2 after commit e9087e828827 ("Bluetooth: btusb: mediatek: Add
locks for usb_driver_claim_interface()"), we'd add in this step after
step 4:

4.5 btusb_mtk_claim_iso_intf() would call:
  device_lock(&btmtk_data->isopkt_intf->dev);

If "btmtk_data->isopkt_intf" is NULL, this is the same as
"&(NULL->dev)", so we'd pass a number that's very close to NULL in as
the dev pointer. Then device_lock() would try to dereference that and
crash.
