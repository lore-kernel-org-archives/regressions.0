Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640742;
	b=obUaYIZzTeU+kY+hhgQI0eKfx91xeXujED8DP8nnOiqck8B4ciftwCfiEe7QEtmVoAu3
	 mHrXE/dZf6+b1KMa3/E1wf/V3qdaRvFk+qEelUcLD/Js0BlFiLGTQrEF3F9tvrNu8JPYz
	 sj7XpWMTlskRE6FN8zQ+yiKBfqBBdM+mlHRrKJHwHLqI17Mp7PQsPZqZ+68qOhLVwJuF7
	 +oEEEfDik/N64+bTObos1P/hiGuPorzOV+kwsYICq6CMqoZZ0xZHki3cWQZDIQ3OH6XRv
	 Gom8ecfckwpMlxL4+KXArlr65lySAf2KeEn4HwSd2QJ7Ayk5DkVtwn66Vqg5HjAEN2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=;
	b=v4X2+ixApIqxGTJkGppJ7AbKIoO1JXd6M59/NC30iiRZ9faxNrXRJsXKM02mfeoc2/3z
	 Df0n4aD/SfZ1fk9Wb+anaDhDmHit2uiPTeQ7FhtRMAqXWWcnwvJFfwd4uVdi/K9ri2C9+
	 iBmbUcQpchyufm86Rd+G/ZYxViH9RzuDFKFgaafRMPAub1E/q4j5ikRjsg2jFi4kAFEk4
	 gMTuI/JOKGsVpXFMUBJ9dcrWWM0ypS3m3rnNJl0aMkJevGgFUytm7xN2iBEwi0PGvUM1j
	 VS3SB15w81vttOBz8Jwpn9MSUPchAAgYMP7DaGwsI0ftNdh1KcHU06FrfmUVvxiKlJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AfETbmFM;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E08C606A33D
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 17:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E08C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AfETbmFM
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so17157005e9.0
        for <regressions@lists.linux.dev>; Mon, 02 Nov 2026 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640740; x=1794245540; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=;
        b=AfETbmFMCiXzJSEYhjpc/dfrJ7Kqytrb5xVCqbNb7jcLjAfpeSxAMviD2qPovZhsaJ
         8zxTp570mYH2Y2RR/zAbqdZ+0NCLRS3XAEw63d1Konvr3Mmy8D8w9fo4t4MAElxk++AN
         m84v57TJGjNx9wASFpMXDABB8BHA4M8G11EpmA2lOz4v+O/mhKDJUB6s0Y1PhyJMYnmz
         cbJCupZ47/Mq5fgfb4+nBkmv7MnjhnTKHanCiwx1+FB0EAp1UpviPirYSpzmWf6IpvoJ
         EgAxIbTUbONQzMWtTi4Y1ig1+c62UF/k5HITE+qAhGlyNowyrTk+T7pmcQJmZyDmnY1X
         GCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640740; x=1794245540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kq9Yzc8kYPuDZCKpCPFJzDuGUxfrJXPPIpmBSRkumE8=;
        b=rKBhcsEcX6pJFyryOdrAZGLD/AiKRFXxH0L6h7dvAJlbino53ePOjFe4k/WRpDKH0w
         O/ywFFj1ful26JGjMbwwgyiC7FmJtTyB1cOGKxCkv/WJciuupukUJDPVd11toT31cXEC
         H3sfovUjfLc6OrLMKL412ZqjfGZZrbdYmPAlIgD1PsZnwqwd+cDztEBYs+vUOPqIM+MS
         mcxz3J4TwcnYxpbtzkLME+PfG4v1ZY3tGTKaeWiP5L9QLRlOe5WSYUapjFV+LRB5iLf5
         I2S8n4SwKTJB2CodnULSYX9TzUPcrC3CSDOChlRtWDyzKRQDN+J84hCVmLWi5ZNYlzTa
         z+MA==
X-Forwarded-Encrypted: i=1; AKwUvBxrWS8nbeJ2S3kCGkTrTK2IggzZ31kCfgB4IaZ9j/dUAsfkghsNEwSbJHRWMuKl0kMHUyyt5KvFl/0q/g==@lists.linux.dev
X-Gm-Message-State: AFq9FYKJ30hp43UG+dd2QPmjJS+4Fzk0xWJ246fLLmpW8Gtb/Q9iKbNW
	1GPkjwYWQvQTcDeD4FsVb/b21z23lrzczMxSFUZrSq/7LD620jPjDV2t
X-Gm-Gg: AYBFou2QXKMe6D0OL5Ow8kTJNqbn1ayx4NzdlSNQ2njv3PQNHlFC2YtSJYGSmKWa6QX
	8A7N8ewnC68WJwRYpHQS3ecir9ckI9OUhvHOWaF1FYis/gpy8ZtUEuU1+EHdHmuI612fjtyboSh
	8ItDts3t9bJFmP1azWDrJwAIOil9fZ5ePiNPy95+q2MWApo57MdIROrCwiM7mLZjZpn6j1EPHTi
	XMZwUXnPqr9DJ8hK9PaFW1dPMSMk9IHcj0U2bYM0UvPtblacS0vQMfm74GcQAKdkQjq8Vij/XXQ
	KckppstleAkGuDWjeA2c8/fIGlCm/egUHg7IwtW0eXjBAdA/zC/HeyshrPsZ5fsDRE4mKYCScJB
	4dAmtvi840s1IRP6K/mg+38WCq3K0/tBgFLbPQdDsrQwQz/DzNJp791O3aln2NtGb3Qn8m/mBts
	EuZU0Hdtg74QKaEuM9Q1SILFDAOUFwzzHhy0+AB6M2CVK3loA7wXizxc17t0FOu+hTEVty98eNa
	xkQY+TbWvetUgxJWzI2n50Jdt645d6ASqXwEp836oP7XdNf/35h1Nynl3TPCHMYm8g89QZ4muPP
	oarInJWBqCJfkI+cs9JN7kH4W6AQAYVQIG04fd5NTbM7yoW0Nn5zb8REW1sjffzQlM3afJX8bm3
	mH+gJnb7UnHkjgSHtWspT
X-Received: by 2002:a05:600c:1385:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4ac182dc0a1mr263780855e9.16.1793640740359;
        Mon, 02 Nov 2026 09:32:20 -0800 (PST)
Received: from [10.0.1.67] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm2039345e9.15.2026.11.02.09.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 09:32:19 -0800 (PST)
Message-ID: <8abc611c-525e-4450-b924-87dcad57a578@gmail.com>
Date: Mon, 2 Nov 2026 18:32:18 +0100
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
To: Frank Li <Frank.li@oss.nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
 Frank Li <Frank.Li@nxp.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
 <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
 <auJjlYWf2JCa22Ai@lizhi-Precision-Tower-5810>
 <2a1eb85c-8a30-4594-bdad-8a1dec17b141@gmail.com> <auTPTxt5ioBJrr27@SMW015318>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <auTPTxt5ioBJrr27@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/30/26 18:09, Frank Li wrote:
> On Thu, Oct 29, 2026 at 07:55:41AM +0100, Emanuele Ghidoli wrote:
>>
>>
>> On 10/28/26 22:05, Frank Li wrote:
>>> Does it only impact superspeed? High speed work?
>>
>> No, it's not even enumerated, on the Dev board.
>>
>>>
>>> Thank you report this problem. Suppose below patch should fix this problem.
>>>
>>> I have not time to test it today.
>>>
>>>
>>> Frank
>>
>> Tested, it doesn't help.
>>
>> xhci-hcd.1.auto has no fwnode, so platform_dma_configure() never calls
>> of_dma_configure() and the new code in of_iommu_configure() is never
>> reached.
> 
> Finially, it is hack at uboot.
> 
> 592: static int config_smmu_fdt_device_sid(void *blob, int device_offset, int sid)
> 601:     prop = fdt_getprop(blob, device_offset, "fsl,sc_rsrc_id", &proplen);
> 618:     ret = fdtdec_parse_phandle_with_args(blob, device_offset,
> 620:                                          "power-domains", ...
> 578:     err = sc_rm_set_master_sid(-1, rsrc, sid);
> 681:     prop = fdt_getprop(blob, offset, "iommus", &proplen);
> 848:     if (is_imx8qm()) { ret = config_smmu_fdt(blob);
> 
> 
> Need combine power-domains with iommus.
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> index 176e2e332f87c..cc2b9a212780f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
> @@ -189,6 +189,7 @@ usbotg3_cdns3: usb@5b120000 {
>                         phys = <&usb3_phy>;
>                         phy-names = "cdns3,usb3-phy";
>                         cdns,on-chip-buff-size = /bits/ 16 <18>;
> +                       power-domains = <&pd IMX_SC_R_USB_2>;
>                         status = "disabled";
>                 };
>         };
> 
> Frank
> 
>>
>> Emanuele

Hi Frank,

this works. xHCI comes up fine and SuperSpeed devices enumerate again, with no
Host System Error and no SMMU faults. Tested on Apalis iMX8QM and iMX8QP on
Ixora carrier board.

A comment: imx8-ss-conn.dtsi is also included by i.MX8QXP and i.MX8DXL, which
have no SMMU. I get if we should put the property in imx8qm-ss-conn.dtsi, next
to the iommus property it goes with.

Thanks,
Emanuele

