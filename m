Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AA084DF1
	for <regressions@lists.linux.dev>; Sat, 17 Aug 2024 05:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723874117; cv=none; b=jc1/MAJqO9N4++6reebGQsS6bpBHyT3QZ0jPBZW+XY9Toeb0Wugi1J45+MryRjvQF58M1yTYhNJESEJ4mJFAW04jTvcEqrXEiLnY3E7odLp1YIu4AO+dxeh1Mxsx0aiBjmahQaSLsIalnBXfAwBloxL8xdKp9qoTeRdRNpVSIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723874117; c=relaxed/simple;
	bh=HKG2pveTsX+z1Xe9DReCbD4Qokg0N7ksaogIoX/ziqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDRCz2odJ1WRBKveeNjWJzd6IIY1gmZhrOa0+iyIsRsYaXbjEqJmkQa67OWYg7Ox5R5jBzQaUrC+Tjga3p02j7APT60BYrswKtPHGXuLGwspG88+IrQr8VEgme07Waykmpsd8LHTA29M8E3V7vFQY4lhNE4WLvUY5y4BdAjaEqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C29yt2ic; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C29yt2ic"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2d3ec4bacc5so831286a91.1
        for <regressions@lists.linux.dev>; Fri, 16 Aug 2024 22:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723874115; x=1724478915; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tcGPNa2OqtrLegopPjqkiD5lC5fpo5SZicIuaeN9D3o=;
        b=C29yt2ic2ojPycIxrHfAh7GN5EmpEs34MNPb4VOPP1+6KA9Q1xkF0N9wkj3wx448/7
         zCA+QCaAG+zxDSYnBH7vRrcxhusEmShnyaEx9JQSGhj2bQo4WY9unBCKtjc9COezd7OF
         NdTKpPj2r6FKfg6KM1vraIFVjM4Gm1W9h6YKl05TMKovDlCi4oFU7+HmzaGxFikWIW1j
         L6X3ie6NTxob3uVdIqEyhRnLfQdugf3zK/ORKYPIfVoa5lQ5df5+3QsVYEGTehw0eiNJ
         /rcYg5CbYgQnO2OMIPzeL+/PvGSPRa7OD2Om8PfKz0VOkpjcT/KOO3F2ew/cb8w3OVvI
         yLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723874115; x=1724478915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tcGPNa2OqtrLegopPjqkiD5lC5fpo5SZicIuaeN9D3o=;
        b=Vezao8MXb69XKIPNMPiSxzpH5LeEUd7ZPfP2H1dycFle/gamaqTXBBDkOXpEd9E1Hd
         W1WMxOEd8KRskiQ88H1ar8E1xQEJe89+vC8eFqq+Ry1AH73GE2ywBswtoe31xgoijs18
         lj6MqcW7uJrkSa8Vhb3cx3aHGqwI1FgDmZz8+X2L3M6Umu+GgFcY68QYjExru3f4XC1X
         F8WScg9SN/nCHx7C00M4lbQF5APcfBP97ig3MZS1hvfoUqZNPQAREHpn2DA+F4yckmz7
         wnFRGre/D9nGn7y/hKWrJec8G0VxaZ9VoSg9hnKx881kz9Hcv5v1nBYjz9jki4pvcwrB
         A6Pg==
X-Gm-Message-State: AOJu0YxnnV38Rw3p4glLpIQv+8AHR8Vilau6AYVvluewZgboJrOi7tIN
	WyGQqc/oNuWKiUII0emaOMCv7QFsKr3GKK+C9g3wYH66+jQxPe1e
X-Google-Smtp-Source: AGHT+IEEwioOC1xEMy2g9xf3Rrr/B/HzHjvzlQGeZZ7FWZdw4oqMAkK/JDXIipPJivoGID6UBn4Iig==
X-Received: by 2002:a17:90a:3ea5:b0:2c2:d590:808e with SMTP id 98e67ed59e1d1-2d3e4579733mr7071507a91.13.1723874115023;
        Fri, 16 Aug 2024 22:55:15 -0700 (PDT)
Received: from thinkpad ([220.158.156.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e2e6b2d1sm2978924a91.18.2024.08.16.22.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 22:55:14 -0700 (PDT)
Date: Sat, 17 Aug 2024 11:25:08 +0530
From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: regressions@lists.linux.dev, Kyoungrul Kim <k831.kim@samsung.com>,
	"James.Bottomley@HansenPartnership.com" <James.Bottomley@hansenpartnership.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>,
	"Ed.Tsai@mediatek.com" <Ed.Tsai@mediatek.com>,
	Minwoo Im <minwoo.im@samsung.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V4] scsi: ufs: core: Check LSDBS cap when !mcq
Message-ID: <20240817055508.iomq7c4wvsn5gvj3@thinkpad>
References: <CGME20240709232520epcms2p8ebdb5c4fccc30a6221390566589bf122@epcms2p8>
 <20240709232520epcms2p8ebdb5c4fccc30a6221390566589bf122@epcms2p8>
 <Zr/XrH1hsp0seP2Q@hu-bjorande-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zr/XrH1hsp0seP2Q@hu-bjorande-lv.qualcomm.com>

On Fri, Aug 16, 2024 at 03:50:20PM -0700, Bjorn Andersson wrote:
> On Wed, Jul 10, 2024 at 08:25:20AM +0900, Kyoungrul Kim wrote:
> > if the user sets use_mcq_mode to 0, the host will try to activate the
> > lsdb mode unconditionally even when the lsdbs of device hci cap is 1. so
> > it makes timeout cmds and fail to device probing.
> > 
> > To prevent that problem. check the lsdbs cap when mcq is not supported
> > case.
> > 
> > Signed-off-by: k831.kim <k831.kim@samsung.com>
> > ---
> > Changes to v1: Fix wrong bit of lsdb support.
> > Changes to v2: Fix extra space and wrong commit messeage.
> > Changes to v3: Close missing parenthesis and fix grammatical error.
> 
> This causes the probe of the UFSHCD in Qualcomm SM8550 MTP to fail with
> -EINVAL.
> 
> [    6.132937] ufshcd-qcom 1d84000.ufs: Adding to iommu group 4
> [    6.142509] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
> [    6.149843] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to find vccq2-supply regulator, assuming enabled
> [    6.209794] ufshcd-qcom 1d84000.ufs: ufshcd_init: failed to initialize (legacy doorbell mode not supported)
> [    6.226571] ufshcd-qcom 1d84000.ufs: error -EINVAL: Initialization failed with error -22
> [    6.348770] ufshcd-qcom 1d84000.ufs: error -EINVAL: ufshcd_pltfrm_init() failed
> [    6.363203] ufshcd-qcom 1d84000.ufs: probe with driver ufshcd-qcom failed with error -22
> 
> #regzbot introduced: 0c60eb0cc320
> #regzbot title: scsi: ufs: Qualcomm SM8550 MTP UFSHCD probe failing
> 

Fix got merged for v6.11: https://lore.kernel.org/linux-scsi/20240816-ufs-bug-fix-v3-0-e6fe0e18e2a3@linaro.org/

- Mani

-- 
மணிவண்ணன் சதாசிவம்
