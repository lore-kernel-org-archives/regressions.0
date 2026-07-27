Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5613176EE
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 12:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156515; cv=none; b=I4WELHobnLZxOFO8MkelmbzgTjQ+rtDKvOVeHIQrIBOwOrmJLbqwG+kJPfyacCLOxBB6xL870dJJB6Sgq+nrZ4KQBQLGjVWfe8B0KK8lKthFGObtEE+lb40NLxXk81N+Lv0okbcrlSxOnwqxl+4zkkg0f989QNDE5+eTqIstIl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156515; c=relaxed/simple;
	bh=MgCxybrkKoLQuzWmyHCrET7izHx0wpC69vuu+M7Bi0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fD5irUEhcEDU1LHGSk0hUVf+lVPqspnry378bHdqd+cnIoYOZqlSW7xbFX8BXmlWs2csvIkYPxlAMSTXFQjIzcDqvxfj2Ra7OQMn//TlXpwUuqAoHe/+xRck0jqlQW1O0sInw2tmWA15Rgew1L3A04NhjXYtVH9VUlsOKmIs4vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2t/anw1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2t/anw1"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49553515a8bso31410895e9.1
        for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 05:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785156512; x=1785761312; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J6DdaVZ57Cvm8wo8IqS4pyHaIv3vcpLo2R5s1tMtqxI=;
        b=h2t/anw1EHyFs79OtvOBEWUDM1hrLqTWkGuYkBEFmTVeltVQljplR4iK0YMc+onr8j
         FHFzL1cMKzoJnt1hxpe4MAvbg3YsfRCjorCGXQQmWDZnRBhVvuh07q0pAWc4N5pY/Bbw
         sEqbqsWkWDqqEgP2BpjNOMMhRxnpS7INIr1+VkTvHorwT5aSQZwtR4Il7/XV+3H8avxE
         WsHFGSwvtEUJ0+aQthyY5lGGX/uUbSomCyFtXCCWp72y3XE6LN3KgWrMqlJ360q5k9Gz
         B++4JzoGhHSjWb5UqUk+qmw4Bo4C1+Cvw1DjwmLTL5m/cl3PkRbEhmeqKfu4EwZxHtrZ
         G0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156512; x=1785761312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6DdaVZ57Cvm8wo8IqS4pyHaIv3vcpLo2R5s1tMtqxI=;
        b=ONOWux2OxIy48c0AmEThSQChvyhIHUvRLqgHC6c5/TfJijW4sM0o8pUzvx1XDNPUAX
         Ek/cUxulQK9t97EUSurf9KYd3hZjY6H6nhcaRwV0Az+JtP+2MrpLay7/pOOShXu7EYyt
         scNNgWoo4GNIp5UMjDjS+jcBhaAwU/7PrC+8txAxdnRr7Q9vtE/LtBBO2W2vMFdji2wS
         rufLjmSxLEuunPm/4GLxJvkz5LHYIaU9TRLnJvxihUGhNBTcY4LrV7atVScYOMLol5PS
         bqWpOorZV6NsfZT2vB+MV3Fcj1QDD8RttuRkDS0hb4f9b5WYo9iofPtnBDKBK8F/dL9J
         6t4w==
X-Forwarded-Encrypted: i=1; AHgh+RourIJut1J9nYspqUlewGombWC2oDbLxknedxPrPvzmJwwEqKcV1Eo7td50/K+vjb97SLQMAX3vw9Bg8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YykvZ0UowCIPjIR+fS4b7DfTmb57XevXS5nJUlMVrXu1OhqPvRp
	pdfJccd2soWvhnuENuZEQvMGsFvqiJWoEQysMPrsIIA8gHdq79S0vnZP
X-Gm-Gg: AR+sD121CzfzqE+ZiSJxmNnB3pKHS7mNR6YXsLI6t2U30hihwfubk0olODfH3eLSczK
	dCfGDsPuSLUHaYp6sgtoXgPOTtAo2xj/PrEhmXc6xhoHdqLR6zL+fMq2xtzrbIgAwzJ4CITjuKi
	eInON9PBEfvArV/1lCjiIQa/fc1LRfEEXxSdXtD1QIvtBRWxfYt0u+3SotzOQw9XPh/us1+RLEz
	/blwvzJqoN5z1vfJr//2+7sm6hIprZ/nANF5VLpr4nX8H83zS87REsAwHOHllmOY0uWW6hc1lMk
	I7tsxyR5vfHrAQ0pbBK3baUSFPHuWYbpv8Np9aHM38t6NBIpVR4iohlKFeAcfwS9pCRIR79sjqd
	3OBaYf0TxAcXGSH1Se8b1qCr0DIEl3HSsT+vORtDe8RgkzyAhXU3xerrd3baHMkaGSTPJD+gySA
	==
X-Received: by 2002:a05:600c:8b47:b0:493:f176:dc69 with SMTP id 5b1f17b1804b1-496b572e886mr119294425e9.37.1785156512062;
        Mon, 27 Jul 2026 05:48:32 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:e302:2368:a20c:3848])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4858cfdsm238084945e9.3.2026.07.27.05.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:48:31 -0700 (PDT)
Date: Mon, 27 Jul 2026 14:48:30 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Adam Thiede <me@adamthiede.com>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
Message-ID: <amdTnudq48tZUTG2@owl5>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
 <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com>
 <aleM9Wy9otpd6Je3@owl5>
 <aRN3_2FHX8XmTcwduTAPwz4UFde4B0tbB09ajyeUg5qZxiIYMmbvMkG7CPoNTl4iySYMZawbLMWijO47R22gkg==@protonmail.internalid>
 <65558ccc-4f2c-492d-8c74-627d27dce864@collabora.com>
 <87h5m0mkca.fsf@geanix.com>
 <alpTEPsy-SIQv_Oc@owl5>
 <b26a4890-12e9-4995-a71d-d0b7458b1570@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b26a4890-12e9-4995-a71d-d0b7458b1570@leemhuis.info>

Hi Thorsten,

On Mon, Jul 27, 2026 at 02:28:56PM +0200, Thorsten Leemhuis wrote:
> [top-posting to facilitate]
> 
> Gary, Angelo, what's the status here? It looks like this fell through
> the cracks -- or was this issue fixed in between somehow? If yes: great!
> If not: Would be good to finally resolve this, as we are long past "fix
> within a week" rule of thumb from Linus:
> https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed

Not much happened I'm afraid. The status as I see is:
- this patch is necessary to have TI SN65DSI83 working
- this patch also follows the DRM guidelines saying that HS clock must
  be enabled during pre_enable (see previous answer / [1])
- this patch has been successfully tested against MIPI-DSI panels (by
  Angelo) and LVDS panels via TI bridge (by myself)
- Adam reported an issue with another bridge (PS8640) where resume is
  broken
- Esben offered a patch to the TI bridge that would fix the issue we
  were seeing in the first place.

But for the last two points, I'm not sure this calls for a revert yet:
- enabling HS clock in pre_enable still is what should be done [1]
- maybe the issue Adam is facing is due to the bridge driver instead as
  it could not be reproduced with another setup
- Esben patch would break the SN65DSI83 init sequence, suggesting that
  the culprit really is the MIPI bridge for not following the HS clock
  requirement in pre_enable instead [2]

So if we agree on the fact that HS clock must be set during pre_enable
then I don't see a reason to revert that commit.

Regards,
Gary

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_bridge.c#n169
[2] https://patchwork.kernel.org/project/dri-devel/patch/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/
