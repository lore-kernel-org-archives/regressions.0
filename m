Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF2A3DD530
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 12:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786971225; cv=none; b=E/7biOPs7sXwy3CrqYCiJLMQEYQizs1zWcy9cq5e9yx2W5EsDvlJ7PyuWAht0ntkF81KkXLBe2yDkFmt+JXejte3xtHmPLzGX2AVHK4/2/kAwpcSnIAZ4pPfWydyyJck2Kw8lYko5U1ty9pPRlLhQnjwZCbL3wk54EaVTx4y9N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786971225; c=relaxed/simple;
	bh=92/LJ9ytiCnTo9nxdyNCfvLsbqsb1dRXtZFbNV2qfgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qN6cCLqDrm7gS81k8R7xWrXckrGDEJXQHF3mm1t1gWMe3fV7JiRYpToa/R6hBPxeCDJCPcU+ijCkVMJr+y4mn/TxitJ/Xk22SW0ncN6/rMoYIpBjR3fb5VPM23Y6NyVjOjvp2bWYycNB+YN+Bm0WbbE7iJE77xoMoOzB4SQRbuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wZbcqjKU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wZbcqjKU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d3b445a84fso241225ad.1
        for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 05:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786971224; x=1787576024; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U/HO5352xrmxomcN/usyEVXCVrY50VpsMFDwsFMZfKc=;
        b=wZbcqjKUE+rAS5SW1yW1xTPoLHicSRTAkptMqvdGRmwaLRlNf+vhFNMi0oTDYAEkTJ
         ggEq9heUJuuFDiVaM8QffDgXvJK8U79eXjpnl9eHOiM4k7RAlFGWhNzd3krm+7bEOUT5
         9fV4KoY3fP+wkhiYAfa2MJnUJ93ywcfpFZWSXGyJY6QdbRcAdsK0oTkxijQBGFXgYDeo
         MV+mo7iXurADe4FwurGvXSVrqwOvCIJ9AB/cJzKAbh5U5+JqyY3EMRjeR+KcfWocK5lY
         Vvkz4XuT1/Z/ccLPwBpoQnr4Gm6Me25HF4rkDm4MAVkDJbEwtm6hlKpHWT4AhJCMMDWA
         8Tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786971224; x=1787576024;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U/HO5352xrmxomcN/usyEVXCVrY50VpsMFDwsFMZfKc=;
        b=RQ7U1aKvnvDZcrTeinSFLDetkFV1cmy1haWGdv18KLAC5yakSsZrzWTuSibgL3j9w/
         09WXf4qsYPGIKbLasyrkFlXMT4aIFGBFD4qqM9X+U1DLZ2ETyplf12WBMeIHyCVM2LkN
         b4y5vthXAmyMxPoETrdQZMIT6XdjyAybLBUywLW/6jkr91YcBcNitc/rHP9GM39dCw90
         VJhM4gOovKQ8DE7CWp0f2orBy8lzUcKS6Vvy7gTFNUk9gEdI24JNBDOglQZALaMFttHS
         5mQmhJ8eJ9S9TN2nXq/AvvsX6DJqIO/WNrrSOrNwswazROtt27qiTxCtqrhm7izPOs0P
         ZPhw==
X-Forwarded-Encrypted: i=1; AHgh+Rql395HFQ83Rvmksgodqcd5xZNCXQ0rUV5wJDH82611nOggoYh/TPdrvQ0fpjEsY1/2xX3O46Ws7BHZiA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2zpZ+v35kRT2/d1VpZrwkatu47ACoPwmRG4pbgpr3R4HL8Ufh
	TwjfpQr2ziArPMXOlBUORgd1pTBG/yIzt4XoJ6JionspBeet2pNHP6z9ulJSItyj2Q==
X-Gm-Gg: AR+sD12jnyafKYf8AgBb8W+tHVpMOoZn37k2xt6J/IiZuTKYW/SJBCDH9bhHt7mvFq1
	4/EK+11jB9MmhOxVMpeDrN7PH/tz4enCc4ZbvHJk5xN7GLhDen2ZOSF6OW+jOOn3id0ed6Szqwt
	NaFL1H5gPxXZ7YjQ3+LbUaMhho7c/7IiyhMpKO4yTDA8I0ANloanKnarlVp/mR+wOk9VNqJ65QG
	euUVub7N+iltXHDRmT/IJyuX6qJ/A+xqWvpNJ7ExfauNV6mahe8nG3q5g0Eeh7mcMhCH6xb4599
	NyFMUFTemRGS5AEeg4Ec210hVYjBFa6JoT2/ML+SVXF/vLeMKebJ1p+EIFKc8ctDKptI4XmESPk
	PHJLi+ahqzO5WGEaIFBRg27P74nVKcQQ3uihnQIaNDsgvYg6jl3F010gJd9nug4GXm5GCXh3TRO
	wrOiVQUKD0DYg3Y/1Xrw0+aPKTU/eXKDvQgxKhO6D000jKpPpVk4qYd55pHJOTtICcEr0XW9NEI
	7/vZYC1oPytFsKSBvF4ut8=
X-Received: by 2002:a17:902:d983:b0:2cf:41ba:96b8 with SMTP id d9443c01a7336-2d590bad516mr5207305ad.6.1786971223287;
        Mon, 17 Aug 2026 05:53:43 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499d4bsm5258655ad.4.2026.08.17.05.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 05:53:42 -0700 (PDT)
Date: Mon, 17 Aug 2026 12:53:36 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dmitry Malkin <dma@nebius.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	NB-Core Team <NB-CoreTeam@nebius.com>
Subject: Re: [RFC PATCH] iommu/arm-smmu-v3: Allow nested attach for PCI
 bridges without vDEVICE
Message-ID: <aoMEUDQKlaWzvE8n@google.com>
References: <PA1P190MB25578C482C8A3B06A4DCC6FDDBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
 <20260814174825.GC510472@nvidia.com>
 <PA1P190MB25573D7CFE42EF7DD2A8CDE8DBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
 <20260814221103.GE510472@nvidia.com>
 <PA1P190MB2557D53CB7FCB70EB8F79D09DBA72@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
 <aoLtgeYLpYobpyKN@google.com>
 <20260817114407.GB1175472@nvidia.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817114407.GB1175472@nvidia.com>

On Mon, Aug 17, 2026 at 08:44:07AM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 17, 2026 at 11:16:17AM +0000, Pranjal Shrivastava wrote:
> > But, regarding PCI P2PDMA, you can still enable it with ACS enabled in
> > the upstream kernel *IF* your hardware supports TLP forwarding between
> > root ports.
> > 
> > When ACS is enabled, all TLPs get forwarded to the host's Root Ports
> > instead of getting routed directly through the switch.
> 
> Generally nobody wants to run like that, the performance is
> terrible. The reason these systems have a PCI switch is because of
> performance of the P2P path.

Ack. I was assuming the enablement was the major challenge. For perf we
definitly need to hairpin at the switch. 

> 
> Jason

Thanks,
Praan
