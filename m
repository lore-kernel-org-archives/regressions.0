Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4171243B4A2
	for <regressions@lists.linux.dev>; Tue, 21 Jul 2026 08:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621557; cv=none; b=B74WIDJR46jOGj1QdSIpS2VI3Hd+RS/MtUpm5WQPATQnU1trpeZNMN37XMzsmDgXelgoE3eXLGkcyXBd4TsyeyCO8hwhtu4Fnn9EiLnfZowCdXBASKqHkh3CD50Atm4ZE5fhL5k0ytMEfy1Zzw+H7hNHzGTwHejo26xRwcatIJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621557; c=relaxed/simple;
	bh=6FQTffWDvYzOcAq6L+iPIF760gNSytTuPOb97cG3yIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4YF22LM5ybxCVsljoLRdlvMW36Z5ORBpqz5nYWVY39jL5en0JLKZw8olEJuFYMDtZbBhJGWrZjSCBk0cSJuRlrzn4/zmmbDcsq6lgp2aUvUcFkR+63l4PxjZymXnLKl4Nv/1Fi0bTAr/3v6EqES7p5Zu8suogca3JwQFzsmwGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FWCSAnvx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FWCSAnvx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784621547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XAx37NgIikC1yEJzl1y/wDUAlNIlXDU8MqE4p0RIg9I=;
	b=FWCSAnvxsVBMvIKwHvKsABrQKPRo3TyCbNBtrEwhzkPhsmAHkxmM6YwpzrL2Nj4/oTs+X+
	zPwORZG4ngbku5inVFl6T8we5mUOBzE0krMDGIKZoTxmEWcdZBqaEtDpw7EIBz6gTm6HIw
	IhOPVTvxiirp7LK6tSO6OQDhKXsl9A8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-YSqBRHnIPH61RvPl1DjDyg-1; Tue, 21 Jul 2026 04:12:26 -0400
X-MC-Unique: YSqBRHnIPH61RvPl1DjDyg-1
X-Mimecast-MFC-AGG-ID: YSqBRHnIPH61RvPl1DjDyg_1784621545
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47407691804so7696547f8f.1
        for <regressions@lists.linux.dev>; Tue, 21 Jul 2026 01:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621545; x=1785226345;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAx37NgIikC1yEJzl1y/wDUAlNIlXDU8MqE4p0RIg9I=;
        b=OJjLwwIIYGMAisGKi2lqEXypgNjEZLJpiRA6CaT+AsHXds3/NxOomDnBRFatWbXv+j
         EAto2c/Ey5b2+mt/nVlP9GzRo0fOC6GSUVqXNdw10tJf17Qothu7AzSpwwGfJuR53vJa
         YSBf7wvSBdS8fPfSNmCxzU0ecaxtLGOCoV2qEVjE5GPC1rI3SQfzLDBO5xEAEHRNKC9+
         5oGlcovx1yYoqg5IoGbiwa+u7ed7wvsDDKPhNS2F4k/+LdU3hNXgo4Am7cWVV2twd9wM
         AM41K3r8q+EAyo5sRcnlg6snP8WO1Mn36cc/UeOOaHXcmncY6It1dpDDsETAzrftwMlM
         aiGw==
X-Forwarded-Encrypted: i=1; AHgh+RoIcv9rsc96nNLrosB7Pw2ZP9UmyeU/F42bk2dMmr0aoEWgF3/HGWdpqeILcpL6snT2DjkVav4oF+hO8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHv3Bod3EGVpj0Gmt7KEUgDsXFnNGGfMw0GmZFFSJYQpCYgyGR
	1bmIYsUENIQG/dLNHLrMV5vabAOhY6VspIOyyXiZI5iNtO2QSG4nDkxEpt09eHAsSrlogp7rbVs
	Q2Ok5kByS7CKajf19QPu/Td4nB3ZD2w+kl2FUcc2pul8UrEKVGbIF0NHCtQRG9V4V
X-Gm-Gg: AR+sD130nYgEr6QAXLOKZ4NQu6tFAnHXJGXF7PJ4yah1TgqohFwVuJrrc1G+iN/jTIZ
	ipzMIEsNOFg+eYm0SBjEC6T3+uTXVtGgENW1txpo2RSlpIunOwRQu4nBrQJTuvxgo9xrQKmGS3S
	5Y9HM98n17sowWsHNhpGSprXovHSusDiQGgk+YvQNGWIboBPcnFiaHfLzpfc1cjYuNVPxszyzki
	m836HJ4Wpfx30H8e8WJ8fDBVh3XdPHBNTydMggxtoANU38Ru6VEKytjQoKP4i5ckvnf60D4Uy8r
	ztZbYMufOZe1nUeGTc3qxpc5jLQ5t65yY8Gp8SDj5Lg+cWKJWCp6LOCyWgnmkx3k4bN5tCXEQQ3
	COLvKgg/gKKGfVHuNmBRb+UzE+YH556DrCcpxMYRZcZs5D8LNoQITffzVrrHaw0GG+2RJE0DtT/
	pK1Q==
X-Received: by 2002:a05:6000:402c:b0:47f:7759:89df with SMTP id ffacd0b85a97d-47f77598aeamr9608888f8f.3.1784621545064;
        Tue, 21 Jul 2026 01:12:25 -0700 (PDT)
X-Received: by 2002:a05:6000:402c:b0:47f:7759:89df with SMTP id ffacd0b85a97d-47f77598aeamr9608820f8f.3.1784621544539;
        Tue, 21 Jul 2026 01:12:24 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eddd1csm36838340f8f.29.2026.07.21.01.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:12:23 -0700 (PDT)
Message-ID: <2946c0f7-1c79-4890-a4b3-94141f42bc1a@redhat.com>
Date: Tue, 21 Jul 2026 10:12:22 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: resume PHY before hardware setup when
 opening the interface
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Stefan Agner <stefan@agner.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
References: <message-id-of-your-v1-mail>
 <20260707195425.405989-1-stefan@agner.ch>
 <c8cbf359-e224-44c6-8692-9e1d1527ae0c@bootlin.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <c8cbf359-e224-44c6-8692-9e1d1527ae0c@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8dfDjm87OK2eiqQPMCj8Xd2RSMEP2Wpof6nNaAWpjyA_1784621545
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/8/26 11:16 AM, Maxime Chevallier wrote:
> On 7/7/26 21:54, Stefan Agner wrote:
>> Since the referenced commit, changing the MTU on a running interface no
>> longer disconnects and reconnects the PHY; __stmmac_release() merely
>> stops phylink, which also suspends the PHY (BMCR power-down) when WoL
>> is not enabled. __stmmac_open() then performs the DMA software reset in
>> stmmac_hw_setup() before phylink_start() resumes the PHY again.
>>
>> IEEE 802.3 22.2.4.1.5 allows a PHY to stop its receive clock while
>> powered down, and stmmac requires a running receive clock for the DMA
>> software reset to complete (the phylink config sets mac_requires_rxc).
>> On such setups, e.g. the RK3566-based Home Assistant Green with an
>> RTL8211F-VD PHY in RGMII mode, any runtime MTU change now times out and
>> leaves the interface dead:
>>
>>   rk_gmac-dwmac fe010000.ethernet end0: Failed to reset the dma
>>   rk_gmac-dwmac fe010000.ethernet end0: stmmac_hw_setup: DMA engine initialization failed
>>   rk_gmac-dwmac fe010000.ethernet end0: __stmmac_open: Hw setup failed
>>   rk_gmac-dwmac fe010000.ethernet end0: failed reopening the interface after MTU change
>>
>> In the field this is triggered by NetworkManager applying an MTU while
>> activating the connection, breaking networking entirely.
>>
>> Resume the PHY in __stmmac_open() before the hardware setup, making it
>> the counterpart of the phylink_stop() in __stmmac_release(), like
>> stmmac_resume() already does for the same reason. phylink_start() also
>> resumes the PHY, but only after stmmac_hw_setup(), and it cannot be
>> moved before the hardware setup since it may bring the link up
>> immediately from a workqueue, racing with the initialization (see the
>> comment in stmmac_resume()). For the regular ndo_open path the PHY has
>> just been attached and is not suspended, in which case
>> phylink_prepare_resume() does nothing.
>>
>> Fixes: db299a0c09e9 ("net: stmmac: move PHY handling out of __stmmac_open()/release()")
>> Link: https://github.com/home-assistant/operating-system/issues/4858
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> I was able to reproduce the issue on imx8mp and socfpga. Adding this case to
> my periodic test list...
> 
> Indeed the assymetry isn't very nice, OTOH there's not phylink counterpart
> for phylink_prepare_resume(). This helper was added for the suspend/resume
> case, and only for it as the doc states, it just happens to do exactly
> what we need to fix the issue :
> 
> /**
>  * phylink_prepare_resume() - prepare to resume a network device
>  * @pl: a pointer to a &struct phylink returned from phylink_create()
>  *
>  * Optional, but if called must be called prior to phylink_resume().
>  *
>  * Prepare to resume a network device, preparing the PHY as necessary.
>  */
> void phylink_prepare_resume(struct phylink *pl)
> 
> I think this helper should be renamed and the doc updated, stmmac is the
> sole user, and it's really about controlling that rxc and not about
> suspend / resume. Resuming from suspend is just one of the cases where we
> need that RXC early on.
> 
> So either something like 'phylink_prepare_start_or_resume' but it's long,
> or maybe we can be more explicit about it and simply call it:
> 
> phylink_start_rxc(pl)
> 
> (without a corresponding stop)
I read the above as a possible follow-up more than actual changes
requested to this patch, am I correct?

Thanks,

Paolo

