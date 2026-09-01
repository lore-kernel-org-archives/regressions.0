Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935C342B74B
	for <regressions@lists.linux.dev>; Tue,  1 Sep 2026 15:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277812; cv=none; b=bAxEM+God1YXove7rWo3gS7n8Ot6OMFe2p6LJVnPhJjqOaxHXXcTEP+2CsjiB1CgCARqZUYcapltw4mSf+xAaC/6be1h3MQvp/dDq3wZqyPjF/jdHQ7rzwP5CQxYhSG82qSb2KUnltO4aCK5pApqgNRHx33ssMYmuTJfNx8pQYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277812; c=relaxed/simple;
	bh=ajyzEffsSBkOYLQIR3aRKBK1NS8kHj7P6PrDglE8xvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JENCwie9SYD4TB8SvUVLFLQxWYSs2+MX0SDxdYRPLoE/PsnAm/pAxNujzaeoIyxRTwLifXF23/r2dZYekeBvRzGku4WA+luHf16qEFPEXMp5q7wit6v0X1Uem1WoHTE8X1gDjFHddkwqruCeKv1vw8mSC+1l/x47EYatfVmd3Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENJdjzdj; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENJdjzdj"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8487214ad2bso1503971b3a.1
        for <regressions@lists.linux.dev>; Tue, 01 Sep 2026 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277811; x=1788882611; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gzaoCwMvhgrc258eCGx9+hCu2m0m8ZaOD9+JsPMrJD4=;
        b=ENJdjzdjEztXzkIDeeIK33zDSL6ks9bqBqtyL30Z3INt9CgAXK5wp2+0vHLxXZZtuB
         1c/jkGSDNqcjWCfsKn7VnfkocYnmsuu4TtgItWGl6Px1dClwt3Ewe9yAELYVYOi+tIv0
         BbCbAmI2FW1TNtrKzBMIpUrl2zZkeogOA/Uc8bCWV9b7vNt5tHLQyonQaKldpTYC9M+9
         HfaBRYsWGTgq0IxVVV6CsnCHxK2stm5oqRkM0HuieO4kho5Yaqh+WvK70Zp8cbVJhfBd
         kko0PLKEA6sgUriTQUhxrewlfAjeUQJjV+Igfnjg2/BiGhSCbbFwqPUw20Vgb8+2aMh/
         NVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277811; x=1788882611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzaoCwMvhgrc258eCGx9+hCu2m0m8ZaOD9+JsPMrJD4=;
        b=fEBXCYxtYoWibbopMRZAPstcwnLhBlyLqtt8uZUypyGanF4W1zLpunjNckNi+X8sGA
         atz6Y+mFNQGfT+KqlzvINJQ1T5FUs8Mdz4LLCm4KrW0TxzqfZKiPdoS81b6GonzxKhGa
         Kf0cO1phtOMRXjA9WA14XOZrM+gKyH/+fnBhTdkVXbvGA2rC8+SDl1DRs57+O/SPcNaE
         acy4S3LTfSXomfXTmFo2HPx7S7Claix7crlwsmiFScZBRY+ZQ8fShU1Q1dItRy69hTIS
         LlizOEWAMF/cZaNA9XobxTZnyFOaSd1CZXqZJouiNQ9qnzxriihn5UFJ2BNIiOnDSboe
         yq8A==
X-Forwarded-Encrypted: i=1; AHgh+Rpj9OgNXuaPu8/Olkq/U04+QJ+wGSA0egsw1/RBw8itDX27LFOv5qjv8XrJgqZ0RxIkrtFS2mG0Crpf/Q==@lists.linux.dev
X-Gm-Message-State: AFuF++mq74OMFPesaB2Ih/rz4p7kz02KEeW1NWXYL7lenHW47Jffw2iL
	TyeB1bBf+NrrFP8G8bbzAmCtSsBG8MjXzlh8nHJKEJzNdaiZOV9b45wt
X-Gm-Gg: AR+sD10AWZqsWURTf+7GKEtRZtLxu32VCf7ay5VjV9OwZA/3zbJoNimNPiJtD7/j7Oq
	TvUEhQDPofD9HUsiSZDzasVA6/XdA2zqrtg/gNFOZtSiOUeioor22ViOpVFQQjasYUYOMnE6RUx
	uj1CTOLmhb3ekfbUh4EkFuE7GEq6K5SQDDNGgU6bFa3VU0Y/3bg26L2riFhY77YTUrxz1kVun1r
	XH9XIIkIV4y7LSLc1J26T4/3AdIdMztbaaCgibqd0XiKJsSXZ04vTInO5USFJ0N+ncwcn+qsQSP
	KZ5nFf1yxMOkwe5YFRs6QJ+b5U/GAf8oPjFInbkEOT0mxivzq2eh/LP3YvmgG/vfltXU9qkP01a
	bPqrw5iAyRLcQcWDN1nteQ+jNbiJE6oZ4Ge/JN8qviUbGLv8n5PD46zP7YpDsF/gO6sYICDNF3a
	Yy93UOOPZ2iDk33AsGqGAA7vEwt99U9KAnhVXI7KFFyX8dkJ0/dZIkfKzHVUtUzv3qyud0/2opQ
	y0Wc+Jf1PQZwiHQk9mPiyOFlMTeXg==
X-Received: by 2002:a05:6a00:f0c:b0:852:5f99:1866 with SMTP id d2e1a72fcca58-8562514cfb6mr56762417b3a.0.1788277810606;
        Tue, 01 Sep 2026 08:50:10 -0700 (PDT)
Received: from localhost ([2409:40c4:10ef:9c41:92dd:ad43:5cf5:f6a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc0e01472sm105067b3a.55.2026.09.01.08.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:50:09 -0700 (PDT)
Date: Tue, 1 Sep 2026 21:20:01 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Pecio <michal.pecio@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: drop 120ms U3 LFPS wake retry wait from
 runtime resume
Message-ID: <apbrp8EaJoIfEg5X@eggarch>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
 <20260831190349.29590-2-lovekeshsolanki00@gmail.com>
 <a6a8526f-4b6f-46f7-9d02-05bfe3efcd48@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6a8526f-4b6f-46f7-9d02-05bfe3efcd48@linux.intel.com>

On Tue, Sep 01, 2026 at 03:53:47PM +0300, Mathias Nyman wrote:
> I looked into this again and remember now why we didn't remove the msleep(120)
> earlier.
> 
> If we want the hub driver to keep us awake to detect delayed port activity,
> then we need to wake the (root) hub driver in xhci resume.
> 
> That means always calling usb_hcd_resume_root_hub() in runtime resume cases where
> resume is caused by usb device remote wake. (xHCI PME# in PCI case), even if there
> isn't any port activity yet.
Got it, thanks for the explanation.

> We don't currently check if runtime resume is caused by xHC PME# wake in the xhci-pci
> driver. Not sure if there's a driver api for it.
> Instead we in resume sleep for 120ms if there exists connected and suspended USB3
> devices without port activity, and then check again.
> 
> This msleep(120) is unnecessary if runtime resume was caused by userspace instead
> of usb device initiated wake (seen as PME for PCI hosts)
So the better implementation will cross into the PCI side, are there any
plans to implement that? Or any interest in it at all that you know of?

> Probably best to just take Patch 1/1 and look at this xhci resume part separately.
Do I need to resend the 1/2 Patch independently now that this one is
dropped? Or it'll be taken as is..? I'm still figuring the process out.

Thanks,
Lovekesh
