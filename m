Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAE248986A
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 18:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787682442; cv=none; b=B3aeXXckIjMJWYDR9sUs+fr/NKre73h2J+1ivO6Sw2dYqCZCgBrErPY1701BYZj97wB5jqYhN2xfzgshDVH9lLL+BTwRhEGt6uP1+6V2tusKgXqdyx1H2zOtCvOQ+ciiMGLfv+WUb0ajcAVArSF6BT8+cORCxbsjyDGA3kA9gSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787682442; c=relaxed/simple;
	bh=jyNY2JkAvWQwrHbS+NgO1le733UPx2Ae4Z9gCQskd7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ox8pGbS13ZKF8cd1igay7rgzfOxX6f2XqeQE68snU01K9ucalvpt933IdPZdV9w7gvnV/R+IANf1BTDXA6Tt4kkRTwpcS3cfgKcpA49epupopeSEsllLUI/hOXnzYk+/XrnbGeLKh/b0fDCUe5AdKg6MJQqCXYkbqywPhnmMQKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hl4n6aGR; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hl4n6aGR"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c74722e27so2131121fa.0
        for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 11:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787682437; x=1788287237; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cLhl7vMzATDfLTJ4Lrym/q2o4NDrnz3WBA6CQS/z/Wg=;
        b=Hl4n6aGR1vCNy5MJVmQulxlZm7sc30+O5tca88GwZSuOdbsxDjSpzQCCiWRglcFhQm
         TLelDb0WksHxekBwjKcO4yCHDgv3jPE1c37OZISVqthG22d+DgSJ4V5XFlTQpKgtaEp1
         KbJEH1vHmWG+wcnRlmvtcCl7a50lYarByEV6dierkGKrPnCX22YnEVxHL63/9+Z58sn9
         qTpRTZy3vqxFCGSBV6Vn9B4fY4m3Cd3tLl9gLlO85OhQLvEdOnkzk7GAOb9AbBtF2Qzj
         5GQ8K1+JLY/tW/7O2j4O2Vo3PkH/DbM5GzKMn1D5LrnjDRchC4pS1UU5MgjC3h38HqLx
         1UlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787682437; x=1788287237;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLhl7vMzATDfLTJ4Lrym/q2o4NDrnz3WBA6CQS/z/Wg=;
        b=JQpSdculLNTycWgQT4huC7coHWXCqv5efPK8qyvi/OyXKqyduEAg01bLx2lnxy6V4N
         KEPAoG9XwYjtUntSAgQ0K6RNc39K+qtRdC2NE3Z3qO6rlSIWyJj/e6OZj73lPq8TxbMB
         xk0i5N+JaH2PawbsZaiEDRbAGn3suEBb9CguaOFf9kM6NfjP1hqm87AKdAL5+FhbWnv/
         Cj+QWmIjrjD/G1/nSzWev+Yh6qGeOcgJUU/KTOt6/ggxrZTkdeqSWUMfcm7eEqws2hVG
         W76/JC+mKLSt+XpyWP0r8ML77bSdkWL4b8aBXF8gUiGtnYmVS8mNyMxab4pRUTF6JxHl
         o/Tg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+BsQdyM7JI8fxTSkOQXaesZ/2jH+gT74NwyrN2s3BqH9cB7gjWkh94b1w8XvzIcY15W6iZSGcMQTabg==@lists.linux.dev
X-Gm-Message-State: AFuF++lrHX1Nn8mKBA2jkZlY/nB7c2ygKE3t6CLK/8+ojs1dp74Fc2mZ
	37BU/PCxo3K7xJy4uO/NfAPEFQ+6Yh8XslL6lRL3NB4G/lu9tCyk6lsD
X-Gm-Gg: AR+sD12cnFFQQgUQL2cXF2Uwb1UrOeAuo+RMUPnCRm3N/mbCJQg3s6skYeb2sakr8vh
	4WZUU6sNgNRfEs24t/oxM1Nxx4Wq1vRETtxOS6K5tX9u5DlQrK/T/T4Dv9eW09X4cITQJMXbqlg
	akVZZSqoLFyI1t6pbMCLWeeZJ85TqFRW3CLksL/jKI74j4UgkSttp8Hc0Z5QcV9AoQZEL9JXdKj
	KbvPz28PNtG1uW8ioYZq59QUaYiJvaosldJrILZrph3e19ohdtTHf5mos0W7QFaDOis9Rsjd+Qx
	kbWtCczPHs0kiRjGzA6O0w2+3lNBVyK4EjD30Cv7Czv6njbVI7aO2TiXN3Xr9Z0KgLEFvmuwBAp
	WtvpKFzS693Rcz1fswRH1MZAnlRnyfM2yamF/gdhvJHGYCqZX4sGfCv4EV1Y9ivv/F5GVjJBm4a
	PJJABy/72yCQcNr3pcAH38tjSuqZVECxJQ/WeJvp59KBR/LKkK2vj8hEop5FpxlTmDQTZV4e8bG
	/o=
X-Received: by 2002:a05:651c:54a:b0:3a1:4530:fb2 with SMTP id 38308e7fff4ca-3a1edab181bmr15138391fa.5.1787682436763;
        Tue, 25 Aug 2026 11:27:16 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1fd13a484sm393461fa.38.2026.08.25.11.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:27:16 -0700 (PDT)
Date: Tue, 25 Aug 2026 20:27:15 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>, JB Tsai <jb.tsai@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH wireless] wifi: mt76: mt792x: fix NULL dereference in
 ACPI SAR init during probe
Message-ID: <ao3dyqWJ3nf3rMMW@soda.int.kasm.eu>
References: <20260825181712.28548-1-lucid_duck@justthetip.ca>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825181712.28548-1-lucid_duck@justthetip.ca>

On 2026-08-25 11:17:12 -0700, Devin Wittmayer wrote:
> Some laptops carry a MediaTek power table in their firmware, and the
> driver reads it to set a transmit limit for each frequency range. It
> only fills in the ranges themselves when it registers the device.
> 
> The startup step that does this existed already, but it never programmed
> anything. These two commits made it run a regulatory update instead,
> which sets the limits on the way through, long before registration. So on
> a machine that has the table the driver reads through an empty pointer
> and the interface never appears:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000004
>   RIP: 0010:mt792x_init_acpi_sar_power
>   Call Trace:
>    mt7921_set_tx_sar_pwr
>    mt7921_mcu_regd_update
>    mt7921_regd_update
>    mt7921_run_firmware
>    mt7921e_mcu_init
>    mt7921_init_work
> 
> Skip it when the ranges are missing. They are applied again once the
> device is up, which is where they came from before.
> 
> Reported-by: Klara Modin <klarasmodin@gmail.com>
> Closes: https://lore.kernel.org/linux-wireless/aoyxqHYvSuaBeubf@soda.int.kasm.eu/
> Fixes: 9b80bd9cab40 ("wifi: mt76: mt7921: add regulatory wiphy self manager support")
> Fixes: e9f3f1cc133f ("wifi: mt76: mt7925: add regulatory wiphy self manager support")
> Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
> ---
> 
> Reproduced on both chips before sending, an MT7922 and an MT7925, and the
> fix clears both. Neither machine here ships a vendor power table, so I
> supplied one through an ACPI override in the initrd. It also wants recent
> firmware. The June builds do not turn on self-managed regulatory and
> nothing happens; the builds now in linux-firmware do, and then it dies
> exactly as reported with no interface at all. Patched, both come up and
> scan normally, and the injected limits still show through in the power
> table afterwards, so the skip does not lose them.
> 
> With that table still in place and the fix absent, backing out the mt7921
> commit on its own also boots clean, so the table is not what causes this.
> 

Thanks for the quick fix!

Regards,
Tested-by: Klara Modin <klarasmodin@gmail.com>

>  drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> index 946dd7956e4a..b468051fbe68 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> @@ -323,7 +323,8 @@ int mt792x_init_acpi_sar_power(struct mt792x_phy *phy, bool set_default)
>  	const struct cfg80211_sar_capa *capa = phy->mt76->hw->wiphy->sar_capa;
>  	int i;
>  
> -	if (!phy->acpisar || !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
> +	if (!capa || !phy->acpisar ||
> +	    !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
>  		return 0;
>  
>  	/* When ACPI SAR enabled in HW, we should apply rules for .frp
> -- 
> 2.55.0
> 
