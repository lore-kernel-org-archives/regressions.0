Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAC027AC54
	for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 02:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763604677; cv=none; b=jh8uctY9zuPByagIlyNfAeNcjtqL6yD6d7ZYbtzUpfLbuol3xYOzNuxDRlJkCgo5Zg34pamnn44dMZBCiuZ2VMWUYjUkLaqA4OKq2AEjBG9Jz8acdWEY6XZqo1Q1lsgvK8EDlG7vv1DsXhzdnwsU2lrjpH0MHYoFRy1nRQEeojc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763604677; c=relaxed/simple;
	bh=m/t0JipUvu61Lp9A1bNicjXVL42+ezMKUrjSPtwtcJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0ifUDeMZhcjjaZc3svus9c39a4aRjNbupIlYAfy7l5/UkHDHRjZVRZH+OVoX7gJKI53YdVK1QV1NECCOQsFmegSoXd/2WgA7+q5ixthadoMRpqfliQ6M2SFvKI8x6dTmwkJv2D9Z1Gx8UqMbXzvZ9tCXBDypDTkmDfyF6Earlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FE8PTmfr; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FE8PTmfr"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-29845b06dd2so4688355ad.2
        for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 18:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763604674; x=1764209474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTFNVmbRzXGZbT/LGhFHixBDUze2+iDNyRytGw9mv0o=;
        b=FE8PTmfrTqssra746y6ma+CyVINIvvZZ31z9auTpzeqBEGtoqHHv5MMMXV6MQmbj0x
         3gEq16EhwmcXSaZbnOfYHTW1THMEMlgnlvx9Fu+C1FbOzlQLSnV6WUlpLoo2GW62U8Z5
         j2WGaKgVrhcSWrd66eCwPYytqiJXKP8+hEfXEEw1E69Bh6ZoPs68o+x0d0eNe7rDFJYe
         9y2ub3Bkl74L48bjz7jQvWXYVqRr+EFP3JyADG2xuBoNYkECYV/Q9qHgiuLsYLJAmAht
         llalaVvVctdwodguw2CCMiFKwAr1/hchOor0UUpWTa35Z11fkLxgQMIHMe6oMkLCPYpr
         klxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763604674; x=1764209474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pTFNVmbRzXGZbT/LGhFHixBDUze2+iDNyRytGw9mv0o=;
        b=JwSz5MzemsyWd+en6GvdMyzm7+6Zaxao7c7vOYfWKtnN2wMHLOPb3/cQRqmZYUbpVm
         OBo1ojQ2vI2lqRXPaKUGf3CO5RRM9RPhX9XdbphQe4qFFJzgL00c+hKH7D9ysrLKeg+x
         r8pTTp9Ka6i/+lvRSXooV2oNxGmSo4Zw8zMECq0VjkiCzdwwjPKdEHKmLmNEuRW2s0PY
         heRJGq2SuZYUgTKj2PiZrfZBhN9NzYe5CGnMi+t0ZA0oTC1ixQkxG9byBxn9odbRe6H/
         IdLgXg9n6fbE+QXiZlYRtDcKZ378SmqnGnml9of93TrCMPaGpH+0JNa2nbtac3qM+cb6
         mgzA==
X-Forwarded-Encrypted: i=1; AJvYcCXYkMXe7QkJD1a19CLqDvBH4YRAaJlqIu820lM3wGqEjns7n2tZ8gwhvhXR0SmOlzNA7V3xj9kY+517Uw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjhqsZb+IUJdp30ZWluf5TSkXBUonrLzWRaTJ4i/dRVSVOGMmG
	3YMaHEtmEdm5Ow40OTcKMmJaRF2WJ8UynK/RenYD0Aipr8LDYAAvJfIm
X-Gm-Gg: ASbGncuV2N4jvuUOOijcMJY6SDNU922zP3DRHCek72bbtUJzHmP+romwADYM+jNVuzR
	XoWAy89B3Kxt3xrlUEJU2a7dxS2swp4pOE4vYMsGCuz4CtwpDSHF3pbWpUYJIMwumi+FVW2Pzzv
	jLfCqcRSraa96rTre2y5gDMuTrBEP+aaMwfirpBBdq3gJjSpGIDYgZorZzIB0l2yM/LzqNkhntQ
	UWAvrYvUFPN2qCN52vYEY1tpaWbsA+6inIY7NEIjwdGBTs69qkqh4kSjNxFVi+tatdqVjP4awcq
	VQLF/NLGoZ78CVCX2bmREJ1rRlaeSF9r5hJ0HzwMg3CgKBEPvP2yTIl2LMr+EPFM2NZBsvbqU5S
	dvBHbsJXLAdTPENFAKAWaXEAFg9ubjF/7wvydlJ8K/zT26NRxBg2bp4UVotXsFRxv59LVRQVebp
	2uzvAx/+tCCzuRAqsA9nKrAw==
X-Google-Smtp-Source: AGHT+IGJI/oKAsUQ7D64r7YwPy+QegsmPvmtzc+SJksMMBWokoHdWjKxouE6QVbTqg1qQ+RNiAulBQ==
X-Received: by 2002:a17:902:f650:b0:295:54cb:16ac with SMTP id d9443c01a7336-29b5b088815mr20802785ad.18.1763604674349;
        Wed, 19 Nov 2025 18:11:14 -0800 (PST)
Received: from Incog ([2404:7c00:42:f150:fd7c:4ceb:3809:3323])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25defasm7635325ad.49.2025.11.19.18.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 18:11:13 -0800 (PST)
From: Incog <incogcyberpunk@gmail.com>
To: dianders@chromium.org
Cc: angelogioacchino.delregno@collabora.com,
	incogcyberpunk@proton.me,
	johan.hedberg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	luiz.dentz@gmail.com,
	marcel@holtmann.org,
	matthias.bgg@gmail.com,
	regressions@leemhuis.info,
	regressions@lists.linux.dev,
	sean.wang@mediatek.com
Subject: Re: [PATCH] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
Date: Thu, 20 Nov 2025 07:57:17 +0545
Message-ID: <20251120021217.87602-1-incogcyberpunk@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
References: <20251119085354.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: IncogCyberpunk <incogcyberpunk@proton.me>

On  Wed, 19 Nov 2025 08:53:55 -0800 , Douglas Anderson <dianders@chromium.org> wrote:

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


Proposed patch:

> index a722446ec73d..1466e0f1865d 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2714,6 +2714,11 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
>  	struct btmtk_data *btmtk_data = hci_get_priv(data->hdev);
>  	int err;
>  
> +	if (!btmtk_data->isopkt_intf) {
> +		bt_dev_err(data->hdev, "Can't claim NULL iso interface");
> +		return;
> +	}
> +
>  	/*
>  	 * The function usb_driver_claim_interface() is documented to need
>  	 * locks held if it's not called from a probe routine. The code here


I tested this patch by manually updating the drivers/bluetooth/btusb.c file with the proposed patches as above ; which solves a REGRESSION issue `bluetooth adapter provided by btusb not being recognized and hence bluetooth not working` since kernel version 6.13.2 .
This REGRESSION issue has been present in both the stable and the mainline kernels since 6.13.2 release due to the below mentioned commit in v6.13.2 :

Troublesome Commit Details:
- Title: Bluetooth: btusb: mediatek: Add locks for usb_driver_claim_interface()
- commit id: 4194766ec8756f4f654d595ae49962acbac49490
- [ Upstream commit e9087e828827e5a5c85e124ce77503f2b81c3491 ]
- Author: Douglas Anderson <dianders@chromium.org>
- Date:   Wed Jan 15 19:36:36 2025 -0800

Tested-by: IncogCyberpunk <incogcyberpunk@proton.me>

Regards,
IncogCyberpunk
