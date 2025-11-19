Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E2530DD0B
	for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 17:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763573470; cv=none; b=EvpipGqsxFvwynxKr7RbIyjgVdFQ2kgaAOqCL+8SDBoFJxGVlg9NIntxr0P86Vo0O2sLc/fGtqZs97f3eva+ioQFwUxgq1y0URZo985d52GPn1TIMHeyrIXon6AN8Y8cBWVpEblLO34xOKOwbD+mZ0mDO34TJh4fGvRMsJOTb9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763573470; c=relaxed/simple;
	bh=xDRTrNyAxxyeuaHghpbA2wfH98kVlXPgS++3kD6nJTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NuFQB/BtCZzThqn3y0y8sDTRWmEryX+NHn3L7AX4DekKujVslnKVTeKxbrLMQ/STi/S2Et8L3OyS0jcTfX/siw+NXS0EYcwuf5GglK0UfFHsZBy3AAXcSxf3x/cuQyTkbkgTH1Dy9lI7fGOiOC4PKbhUA9tD9OK2Wxu8mnz0/Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oMZYKqOD; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oMZYKqOD"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so12317913a12.1
        for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 09:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763573460; x=1764178260; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9shqnQLik0MBvQvkSLKR825xw1M6Btpip0qF9AlI/E=;
        b=oMZYKqODt6u9uSLZBNDmNlFlEqE89XdWGK2zxXh/NMgBPD7/liJFJCnoi9k1J4LvKJ
         Wlf260INFS12+wOS0CJaDK47CgY7j6t2qZwJryX0rVzGhJJ5r2Z2Klx6UeS0L4wNdwVc
         Bo35nIrYkyVIGqbS2UcvtSx/Q65EgmjDBvS5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763573460; x=1764178260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a9shqnQLik0MBvQvkSLKR825xw1M6Btpip0qF9AlI/E=;
        b=ka+GaZnzOgW1+0pQ3+eRFCWR2dQCU+O0a6OhiQ3ZYbAuoU6+vToT8S5oCXyvj0Aw5r
         0AqgwUHFqpOUVaZURD5kyzGcCemV7cUspUG0eC91asZ0rTtKStrSr7HzHnvjmFDR9H3v
         HuWFrTI4ZGYaG5fWyqlwm4a0/XWgth9BbHGeKsIzyomd/WQ3ITIv2ZFy+NcE80R/R3T6
         rjBc7w8CSDNoadE5yHZmf2LUF0u3gvSA1P1x2zOPFkA8k/Gb5JQS5FMBz/lrbNzX1j4d
         vyua0hya+HbjiH7tFl2+bUlXtQgagcv67SHjVZEUO5DI/ni0O3qgsb6yFSDuTXOJl0nQ
         vzOw==
X-Forwarded-Encrypted: i=1; AJvYcCVouZ4UdFidNVSQNhs7b/Uj9wA6p7RYlNHF/E5P0Az+s7cEFb4FJwgBRnY3sB5rKso2IvkSX14m0/yx3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlmSkXYWp0dbw7Ys3PThIdU92RlKO2illqszOZTQkRk6eFSP6I
	J79xjIi51JGL3rwtwfJ70uWy0/kDIxkexDbc+Cr7maFfipRhWm+Qfb8c2pZiNamU9wUvmu2ZZpp
	/4lHm84Nt
X-Gm-Gg: ASbGncuZy/FO5djozkozY74yuVN6c6QgOQ+SOo8KRg6XgKYGNwRzTdpcBgJwp/U1g9X
	M1V9qLWiXu2V3BE2xN0QuERAuHA6yyZJTAIOp/KpOCTjUm828RXrZo64/egXMNyIdMqdSOLmK1a
	wJ01H/wPPurQggupJeCe4NCk0FF0yHrV//pznJUTLhTDrpe8wI9zXhwO+s2a18KgUmb+2OtVeFi
	VD7FeV4pmX6bvExJBDoKneTMKNsgcXtQJepMLnrEjK6bTs6d2sxZaaaOmLW7polWELA9lbdYjxm
	Af6dxbilaVFnqYBPn6pyut2Bg43pzX9RFoNEyb/zC02eHfEsQ1XiOP+K9fpdrCS8gN9zMzhLpWW
	N2f1FZZASnIyv/7cXZW12eCg8QvoLB1XXb/ftHplOobNychLPfcyGvpNcyiTRyBP6el8C+gnLYk
	p1yCSLs6aPEcJj4BgtAnrV0dr0gIXjvrWVB9EcRJMU6pMttnTgcA==
X-Google-Smtp-Source: AGHT+IG1aysL6t4C9IernGXL30k345k+PBsNlhzYF4lh5IJ2kFH0xeB7ryutd3bpqBAgNKxFW0JjpQ==
X-Received: by 2002:a17:907:728d:b0:b73:8903:f4b9 with SMTP id a640c23a62f3a-b738903fc0bmr1697629366b.24.1763573459983;
        Wed, 19 Nov 2025 09:30:59 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed80f0sm1676820666b.66.2025.11.19.09.30.58
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 09:30:58 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso99165e9.1
        for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 09:30:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5N4xfIciWwOCcb3LLCuMCVeImwRziSDDERQHoXypN1DDOD9WFYKyq8AM3uqUVfmRxi+dOJFK5qwtGSw==@lists.linux.dev
X-Received: by 2002:a05:600c:4694:b0:477:952d:fc11 with SMTP id
 5b1f17b1804b1-477b8a8eb4bmr414775e9.16.1763573457648; Wed, 19 Nov 2025
 09:30:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
In-Reply-To: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Nov 2025 09:30:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X+mjEYu4WU-0nbHMtW-HAzm6EUeBnZj46g27O3iobKBQ@mail.gmail.com>
X-Gm-Features: AWmQ_bn88skAW9xgPWrFrlEJQJC-r-nYEqb-FQnzB2AAJsIY30EVaWKYqaJSmTs
Message-ID: <CAD=FV=X+mjEYu4WU-0nbHMtW-HAzm6EUeBnZj46g27O3iobKBQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf()
 NULL deref
To: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, incogcyberpunk@proton.me, 
	johan.hedberg@gmail.com, regressions@lists.linux.dev, sean.wang@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 19, 2025 at 8:54=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> In btusb_mtk_setup(), we set `btmtk_data->isopkt_intf` to:
>   usb_ifnum_to_if(data->udev, MTK_ISO_IFNUM)
>
> That function can return NULL in some cases. Even when it returns
> NULL, though, we still go on to call btusb_mtk_claim_iso_intf().
>
> As of commit e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for
> usb_driver_claim_interface()"), calling btusb_mtk_claim_iso_intf()
> when `btmtk_data->isopkt_intf` is NULL will cause a crash because
> we'll end up passing a bad pointer to device_lock(). Prior to that
> commit we'd pass the NULL pointer directly to
> usb_driver_claim_interface() which would detect it and return an
> error, which was handled.
>
> Resolve the crash in btusb_mtk_claim_iso_intf() by adding a NULL check
> at the start of the function. This makes the code handle a NULL
> `btmtk_data->isopkt_intf` the same way it did before the problematic
> commit (just with a slight change to the error message printed).
>
> Reported-by: IncogCyberpunk <incogcyberpunk@proton.me>
> Closes: http://lore.kernel.org/r/a380d061-479e-4713-bddd-1d6571ca7e86@lee=
mhuis.info
> Fixes: e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for usb_drive=
r_claim_interface()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> I have no way to test this commit myself other than to compile it. It
> looks fairly straightforward, though, so I'm hopeful it will fix the
> problem.
>
>  drivers/bluetooth/btusb.c | 5 +++++
>  1 file changed, 5 insertions(+)

Ugh, the bluetooth bot properly told me that my patch doesn't apply to
bt-next. I'll send a v2 right away. Sorry for the noise.

-Doug
