Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793216668;
	b=UqCiYbldTqEr8E7Kl0m8V5IeQRNvte/azZJeAkPi6GCO+UrEssAmuyD/KwwuAGvFnnMY
	 fXhz4YF8KVtbgi2RorAVUqA/jxM1OozjmvGaROIEoUR+rwG9nfmkatp42WTMxg0y/Rrrj
	 cDCShaHXS6Hnv8MTzH+bJmWv9MfRgqm5FBy/B18ahpZOuwL+/ytM/N8PvGF7/qh+9N7bT
	 qCwbXfQxmkj+ys01lqotWu30HK0RuBzydbHJr3gEkNO1XBJvqDgP6v64AT/MYAIQJsl6s
	 gH8Pc6jVhXy9IA0xudiNwS+qDPHsPXmlUdQQqyIPuXg2gvWyawvprJGMS944CKFqNSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793216668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=;
	b=BsRThATJkViFNy4eY8Q0z4z4juhiyK+PT9kDlb3vyozpVWSjC9mok1mmZLcTTMkXXijr
	 o2kChY4ZJIW9AjYmEAIf8sdmLl/b4zyXQMBvdS1CKp76K7fBRozeJ0YRyL+XXx1xEVXH3
	 PECP3nCpOThG8UbIRXln1YXRwwshQek/v5eTibiS8DN5M9p1yecvk6We8utiEa+qkhmRR
	 HSaYQEvFac0TBNKy2uxmGfQUZOpLiPz17dEQU87TE/pJ2CXUYmHMfpL3USNXDqi1I726r
	 cBcEcFTaq3hWPHRQhfRDIm/t1bRv7/HiFLgnk9ciOWddMf8wJdZI5A9gkvALDkwrY3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDZ5onn5;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA58606A31A
	for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 19:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CA58606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDZ5onn5
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e3b22e971so750026f8f.0
        for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 12:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793216665; x=1793821465; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=;
        b=lDZ5onn5MCcfq3rtJpm6BjA2C3bofiqR5Trd9CBt56o98C/p6xY7uytmYMl8fDfOpT
         0vcpf2XM9IsDmz/E4zig9QUtCNYIwaKlHywkBWNSZKz6mgpoNvC5Ubg1D76NQ+/H3mzT
         NnN80vgr6FyjqxHmMPYHONMnilSuNgy/epCMdrcThjhckAG/YI9rwzHIYb1mDXbHK/ko
         xkJrm+G5hAvR9JEItILFx7EHo+60MKz41UKx42BLuRgyugrgZft+XkFI+3snOdeXARvJ
         qJxfdWm8So3USH+LLtAlROil4mvlcLRnX1sk698GOSWy2ApHdiZ5xu8gN/kVBd2wqC1+
         Efpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793216665; x=1793821465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWPweQHpDk6gsD/jh1PHflXPo0KH1KSnlzsF/PJ0brU=;
        b=AclluXoJhg6UQrYvPc3iBH44D4pqlaUHxAxo7h8BKLIP5tGfznA4d79b9xm/ku5EFP
         vr6o0nwYXNajIeUZpY+EVRmqy7oGRM+ZRM9TPST+lBxwYvELwf9c96asbzex2jIVO2Xd
         3v+BhLF2kpkD+1ECtk3YVlU9nmGQjh+8b8Qckp8U7e57lp625eJRP0GJJb9kNPpTET3J
         HCA6t9PjfMURSDFJfUR1yllem4nYRx3O9vsIOGbABOzRkGAdYl1JHIaQ2gCz1/rs0Wez
         49cZ0l1hdWu7VNcSrkHVTyIvJOWnzWtpyd0e3kJbhVYlEWZpctOFc/scDB7rSyawkPuf
         b6LA==
X-Forwarded-Encrypted: i=1; AKwUvBzcGDesIG3nCkeoZ6GVAUYn28aB8dFmmiU0LbVDLwluW5EHJ8uaf4vUVjtRo7Ow8kJS+MPWVSCyTScCng==@lists.linux.dev
X-Gm-Message-State: AFq9FYLywHYX/yWHcFE0mANNweD27bNWRnlxdECct+9aUvSU1xXvZstp
	Qt5Yks5oBSUKpkr8aqF5ArjcHkian/KfGd5/C3WyOjkywqnCQzTQqI79
X-Gm-Gg: AYBFou2f8Nku9DJN9LfTh24ewF/zzC2d8FxPswoeiyp8c2jC9eWinVWhllMOV7qwvkS
	FEUnoOr1J693WE6DsrZRLIwhkPvLKe1WEquaWPbACvSh2zwZFS1ig8bqwVGAhz7zQn6J4pH3zkp
	l0uSGUiXWYgOmSJhUvh2WNzXT6WRNqQjUxbi0wivWI2wIdG+9zde7x8jMjyhtnqV9VygevvcFtl
	M9kc3rY+NEdU9IpwpgaoheKQl6PCuQAnDt8kYJ43JZQfuSnWuWweszz7QvsZYaho2KCH8CMzn+4
	Tv1SvC0+xUc9UnGc9j/o2k0+NwLKCb8K05wJ6jx8MIMH7B76IcRlVfzv4bRTAZC5UNbCsnWectL
	N66EyXEovsII/HishxsZg3dHJLzmbFkJXzlHTunie0dElX8+SVyfzaKw38R/DFSRTqHIuCfSOVs
	gA7PwJe1lwCEJMf2v+ArJfNQ45nsqSzLlFqvuyu0gkXOF5z5illWkdLo1tRGvhBMtc1O2t+NCjr
	bXe8usaz36fRXk72Nk4nX9Y/h+lYdlgnl889hUZsT7uyCQZ/+kvawFfsvYN57M39MM5lgy86rWv
	MpcXt1ouhlEwAPXpYZ3uJP8E0HU15uA4OG9bmU2Lkurhog9E1t9Kosa2MT3jMPZuCryY80kbMY8
	5JYkwO45qq/iY+zm+LO4ap1nTIc3TiD0=
X-Received: by 2002:adf:fc8b:0:b0:48d:ca32:e90f with SMTP id ffacd0b85a97d-48e5d5e0167mr6431684f8f.55.1793216665283;
        Wed, 28 Oct 2026 12:44:25 -0700 (PDT)
Received: from [192.168.68.70] (host-87-10-175-32.retail.telecomitalia.it. [87.10.175.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm27766389f8f.3.2026.10.28.12.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 12:44:24 -0700 (PDT)
Message-ID: <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
Date: Wed, 28 Oct 2026 20:44:21 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
To: Frank.Li@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/20/26 23:10, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add usbotg3 iommu information.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> index ccf9f510e0f88..1370a571153a5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> @@ -32,3 +32,7 @@ &usdhc3 {
>  	compatible = "fsl,imx8qm-usdhc", "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
>  	iommus = <&smmu 0x11 0x7f80>;
>  };
> +
> +&usbotg3_cdns3 {
> +	iommus = <&smmu 0x4 0x7f80>;
> +};
> 

Hello Frank,

this patch, now in mainline as 73c3b40e536d, breaks USB 3.0 on Apalis iMX8QM
(both on Ixora and on the Apalis Evaluation Board). Right after xHCI starts:

  xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
  xhci-hcd xhci-hcd.1.auto: WARNING: Host System Error
  ...
  xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume dead
  xhci-hcd xhci-hcd.1.auto: HC died; cleaning up

SuperSpeed devices no longer enumerate, and no SMMU fault is reported.
Reverting only this commit on top of current master fixes it. The other commit
seems fine.

Adding the same property to the parent as well, like the NXP downstream tree
does, also fixes it:

&usbotg3 {
	iommus = <&smmu 0x4 0x7f80>;
};

With that, SuperSpeed devices enumerate again.

Could you please take care of a fix? Otherwise I think we should revert this
patch.

#regzbot introduced: 73c3b40e536d

Thanks,
Emanuele
