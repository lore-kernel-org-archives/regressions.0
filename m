Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B794189D8
	for <regressions@lists.linux.dev>; Mon,  6 Jul 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348815; cv=none; b=rCJga/GcTqHPQ1LO0IQUqN4ejTJA+XIl54IQ2hNUv5YBKw/KIvxGLf2IQ2RDASGATcmrRBj4+Vr3AkMn1dcs+My+vUHkFl8ZI2aiIYmII4ujcsZpebTgJ6TPEJRgB4jAMTBjuAe+7NODjKgH/K8qvahlxc0myd/0y4RhxZa3zhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348815; c=relaxed/simple;
	bh=+HJRPXWUR5wKFR7fxw0fX+rLOu+JjhItliDTQTLZ/1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6Pk9TylBltsa8EIrof+4u0dHzozXb9nhFU1Xhss0JJ1uZpkp6r8EavMlVezpAP5k+A7YyB+7/T+z5ZAbAslmjQSsxK5fC7BjTHay5ZkUENZBpKqNAGOwa3o4MIyt3Qpr7sc+Ejur9kDIMA33aHzqBjFsuoZ2dLqBvojPFKmoFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXcka3EL; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXcka3EL"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb11c7347so2317570e87.0
        for <regressions@lists.linux.dev>; Mon, 06 Jul 2026 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783348812; x=1783953612; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YkycRqxvjty9WMrqLNNOLyHpGeUgcD9g+5kM6fU1uwM=;
        b=hXcka3ELr6EbsyvaQEKkTXLW4sffPltIE8hIHb41u72D024htyb4sQpA20CldbWTrY
         u07zoHNdLaGa5zLnyqNe24JAcvYO0VdP06z6Fd0pIoDIhvionhZuBn6dGzPVKbw7xPKi
         a/VgxuTHX+iF3BLFVRwkNaSqSod15dx8hh98GskemUbtQmH5xl7eC8f4VeL1XAWGSREU
         +vOdgbIT7QX+jwG49+nk6pRLH3DRwAP9BWpu0kio5OLZLBQU+Prt7AQqFZzuwTHMX2se
         veSHGQ9wDYCXGZkUSnc0wolBYb+PbKRHYn/HG7Hcy5GGPfaDmgB2QkTG/ASlQscfHhM6
         jSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348812; x=1783953612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkycRqxvjty9WMrqLNNOLyHpGeUgcD9g+5kM6fU1uwM=;
        b=T8Oox8kpcZSzfctpa6DXYmRetN5krxqOhQ0jO15e2Oj3TNh6XhpSZH2RiGJ24ZDB6t
         /CdRzwgaMATfAiNHiXQxfmUF24DCusO2MyEpwW1bwuHXftUJRt2SfoAjsKNZL5Aneb1K
         OpMYOqC07tYBSjSRuOEwnS6rn+9IdzKGxSNx17uMbfctAB63K55+dlCFycfVYmavlDfJ
         Dlz7/57Gjyo2vA041O151MKUOh0pMzkE3lbhzQKCWlro5UXnz3ukL2jQH/mPKkRgi39k
         mweQYBQN4wCkZzJQhMc03/Y+K1OXiNpq+j5IHteF8KyIzcQa7iJg1vlS79UbnRSUN6Zi
         Fz6w==
X-Forwarded-Encrypted: i=1; AHgh+RpnLDmEcdYbPCTNPksstlskXZ2avnR+o+32wjt8cuAw5tYO37+ZOY/b0BnX0Tqc1XnmvUFBAAGxI0BkgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlJdT+9EfgEwX2b1cMzyUEd0KxN64c//rOQvmRS3Kv00Qndm4J
	CyGN2eMbl4i04q9ffeQQNkOu4Ed5MYiHMceAir7VDbptsCuszVyJsG8h
X-Gm-Gg: AfdE7cnRD/jBtzMPpPw7yAb961WWfJ/Q+0FqqHUbEDBcEqP6993/a5owEb/tzI3Zu95
	S5lm8SoZ2ase6RqElIJjKGa71LTZzkZF7uFHNyDuNRtQAATdT7qy/+LNtaIaxZTcqF1rIyQ3vjI
	dEK5NncsWWF+9+RGk6q5DXco5loIVXKpSSJs4nv9WKe07ZXV9pNfHXdSTW4rd/G6uvV2H+qC4BW
	792JRiyE0Wnd19qxHhTnuNOelaaX7oBNfUV6JuW0sr2EiR+2zurR36FA2kMR1dGv/TiVNlLBaVv
	sONtUZG5zw2O+nOcZw0zoZHZh2DjXfdEyj/5mjnwTA0dTzEyfnWoF0GAklHqJmopbmfLD7wyZ42
	cValVFSBvEOxx1uTzdJqnawirk5cqS8Kg144MeiGKfS8XAaEndtb8N/BnNBelKWvFVEWim9Pu6M
	PBuhTGploAzwk+I6Jm+vAq9tFbTco=
X-Received: by 2002:a05:6512:414d:b0:5ae:9de4:4907 with SMTP id 2adb3069b0e04-5b007bb9136mr132541e87.53.1783348811872;
        Mon, 06 Jul 2026 07:40:11 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm2947841e87.32.2026.07.06.07.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:40:11 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:40:10 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Tobias Klausmann <klausman@schwarzvogel.de>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH wireless-next] wifi: mt76: fix MAC address for non OF
 pcie cards
Message-ID: <aku9T5a__-8EqFM_@soda.int.kasm.eu>
References: <20260630210215.400379-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630210215.400379-1-rosenp@gmail.com>

On 2026-06-30 14:02:15 -0700, Rosen Penev wrote:
> If seems the check for err is wrong as the proper macaddr gets written
> to from the EEPROM itself. Meaning checking err from of_get_mac_address is
> wrong as the proper macaddr has been written by this point.
> 
> Fixes: 31ee1582717e ("wifi: mt76: fix of_get_mac_address error handling")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Tested-by: Klara Modin <klarasmodin@gmail.com>

> ---
>  drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> index b99d7452800f..afdb73661866 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -181,7 +181,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
>  	if (err == -EPROBE_DEFER)
>  		return err;
>  
> -	if (err) {
> +	if (!is_valid_ether_addr(phy->macaddr)) {
>  		eth_random_addr(phy->macaddr);
>  		dev_info(dev->dev,
>  			 "Invalid MAC address, using random address %pM\n",
> -- 
> 2.55.0
> 
