Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0D22E0923
	for <regressions@lists.linux.dev>; Thu, 16 Oct 2025 22:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760653383; cv=none; b=n9ZltopBkDehNHqHeFXdA/3UYC0QPy7y6dNyVPUrl2UokiJMgX1SpAAM3CXMu6kOrVkS5MUMQVcgS9FT/wiHfSADIFdqlw7e2UEHxF8W7ixD/VLhxtuOhLPwvEXTWIKyrrPP19D+2LCs7E+I8PgQEUZmGhbtcYS2uxKpLbIvsVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760653383; c=relaxed/simple;
	bh=3ekii4Padoo4vLo5RlCV8aomTzPPeL5/QviVnlsRBu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeSR/vsjuFyLEoBe91+emheN9bJC8mQmnkzJcL0igKQNwBrOES+WVCiAQ5MXyj/Pa+QSV5HWnggCYYgqQXL1wZip2drC7EWPXstC+RT5fbN5nd35NF9sUP/udPbHIRvFur4FIgyFvdUT+k9jLb/jzVqwc+lSCWQU1AbLvDATriI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=m3pmgw7D; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="m3pmgw7D"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-290d14e5c9aso4382795ad.3
        for <regressions@lists.linux.dev>; Thu, 16 Oct 2025 15:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760653381; x=1761258181; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rkSN+UnBTkzCG3PwDHFkCHOX5m2YbVVWNnREzEnFMow=;
        b=m3pmgw7DQ5tQda6wKkYfWx8VOqejOCt6pbHmhsf8nsoW3zO0kY88EdvzGd2oJyhyQu
         QxnwF5xIH7aKsbjKAbt2wZ5bTNMnhsTP7JIZphKgKGb5ZgyscAneiuNnHNKZTmOv3bSM
         +w6ZmlUarRf0nZyOYeGkA8gpJxS+t4IOXXEwf0HK2TRPEj5rQy2amKUItZVYDghY0oFa
         uW9YgsXnqRmj7ZHuK0+Vfzpg8wU8U382ngUI/NDDslVJgUy9MMynR+tIOqUcgwaJKG4/
         E1d6M/ga/P2hajOVyh49FhI9a1OLt08YbtLFF9J9YvJfMKOLvqudcw0FxS4I+O50wltj
         EIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760653381; x=1761258181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkSN+UnBTkzCG3PwDHFkCHOX5m2YbVVWNnREzEnFMow=;
        b=osQkoTc4qkxEL/SsODiL+70Hj4fzkzrzZDR9YNOOMP2O4D8T0WXtb64PenXpphHtAC
         CvWYAKQYlK4ni0YsYwnGl1S7gRBcZj9OEujcL/AkLVZvV3gOvWkztF6uWgkWBAYhdSVF
         VYxLzso0eR01N66OPqtSAYzENxjcramFMLoU1TB7yA7G/VZQCamLao/WaxvmJS9ow3de
         +FJHTE4DbiHgEOIwsL4JRHVCPeuAqugVyv2pUy8Cf2PWkjC5/UEydKkNDf5NVbJJCR25
         gdwxUSt51k83uyzPpXyBCBfa0OzFScOQ7weBkI3d15h58Zu4VD63yNV0dc22JbERfyGk
         Fiqw==
X-Forwarded-Encrypted: i=1; AJvYcCU/DUbSfXi58MU3BHu6Q/n2V1UVbvZUqszaUAWzKG6n5vQeI/CK18bYeIWpZETrTplLB/6F0Fz7cxoQ1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyojdKv+1FxHJ3zMuYuwj09hy3daSff+ojvHbvcqiE3QPv6PuE1
	8jgrNjYynrXe83fv+zVCTtylL8mzFs63YHeAPXOWKblV4mDeiBKfRbSN6x0CdCKMuyw=
X-Gm-Gg: ASbGncvj+2geIT8UBzJHXCael1/4S0LLN2Bwnu9wZvCOeqa6OxwCZ5qOv+UJmEIqFZg
	1B2JU39Om9822DxCFQ/H+7YbXalNTpickfcpj0ibV40jKqqsv/uGqnBvJIkWlAeoJXCo/ku0pqF
	feYT/JimpFkkrPnidxkOdDeQaGWYOw5GSVg3KIY6aCBxTXbmpsxQGIEGSigEL64ZnoXKfz+R43M
	jmuYwHTUGeQPqb62jdOIu86piQadHlRhpUSiBTSj9NrXVrDTliepNOFdeUcCvajhSEAWz59vKlG
	l70WnoUgLYd4UaVX5l3Vu8c3E6qrdgLr+9mefuCq6EAm9NKk59YHgbQU1TnALo7juYDy9Zf1wwA
	vvbcnfFkJTswmEvztfCUwJjeYCewBg7gUJ3j3gctxxoE8pTtT01Fhh3tHTTEM5jpIuyNvJAt6PV
	DoBfZpAg==
X-Google-Smtp-Source: AGHT+IG6Ed2MBjmz0upGafcO94uC04MsCaD920R4+63rtx35D385DHJTV6ADNuxL5fUjZODV+u2KRA==
X-Received: by 2002:a17:902:ea01:b0:267:d2f9:2327 with SMTP id d9443c01a7336-290c9cf2d88mr20529015ad.27.1760653380873;
        Thu, 16 Oct 2025 15:23:00 -0700 (PDT)
Received: from sunil-laptop ([106.51.195.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909934b0b5sm41627735ad.38.2025.10.16.15.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 15:23:00 -0700 (PDT)
Date: Fri, 17 Oct 2025 03:52:53 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: rafael@kernel.org, regressions@lists.linux.dev, lenb@kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	apatel@ventanamicro.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Daniele Cleri <DanieleCleri@aaeon.eu>
Subject: Re: [REGRESSION] in 6.18-rc1, failed to query a GPIO using a name in
 ACPI
Message-ID: <aPFwPR2A0CN6k1Vl@sunil-laptop>
References: <c321423b-3cdb-41a5-9939-dc5c846cfcd4@bootlin.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c321423b-3cdb-41a5-9939-dc5c846cfcd4@bootlin.com>

On Thu, Oct 16, 2025 at 02:47:40PM +0200, Thomas Richard wrote:
> Hello,
> 
> While testing the AAEON UpBoard MFD driver with the v6.18-rc1 release, I
> noticed a regression. The driver does not probe anymore and I get the
> following error:
> 
> [    1.977831] upboard-fpga AANT0F01:00: error -ENOENT: Failed to
> initialize FPGA common GPIOs
> [    1.977854] upboard-fpga AANT0F01:00: probe with driver upboard-fpga
> failed with error -2
> 
> The driver fails to get some GPIOs using a name [1] in the ACPI tables [2].
> 
> I did a bisect and I found the commit which introduced the regression:
> e121be784d35 ("ACPI: property: Refactor acpi_fwnode_get_reference_args()
> to support nargs_prop")
> 
Hi Thomas,

Could you please try with below change and see if it resolves the issue?

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 1b997a5497e7..43d5e457814e 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -1107,7 +1107,7 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
                                       size_t num_args,
                                       struct fwnode_reference_args *args)
 {
-       return acpi_fwnode_get_reference_args(fwnode, propname, NULL, index, num_args, args);
+       return acpi_fwnode_get_reference_args(fwnode, propname, NULL, num_args, index, args);
 }

Thanks,
Sunil
