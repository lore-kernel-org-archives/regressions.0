Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B62413794
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 18:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374639; cv=none; b=HdQHY+hfFMTbpiwCqSiMVc9coBGUvwiizqiwlORoasNNq50bTAB66zT/MzxyUckUYkYPw2Z+NWH3C82EpMqydJj2bfSpZY4rtyC5EAl3Kg7/xCLugjgEu2VNvzWdfRkGOszXG0QdTh0SSya7Bqw6nFnL0fd1slaEXdeu4ksYnSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374639; c=relaxed/simple;
	bh=I8gng2i3lmLspHzQZSXxzctVXLA/Y9KmGoTqYty8al0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puRyr6WkCSoLf4D1s5OFblKLPy0EgAMqk8hIYIn/RhRHk7LiBNVcr8ZKmED6OX5zUt+a+x84Tj422om0QNHqwVCv1A2ZJ/tdssLHhkOPsanbLoYz6s6iZkpeZfERqYpafL/9SMyCS9ZbVoiy/Rses2kfnhwDfkLho923P16+9TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXlJCvSK; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXlJCvSK"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d032846c95so17780045ad.1
        for <regressions@lists.linux.dev>; Wed, 02 Sep 2026 11:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788374637; x=1788979437; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7hhLcfaaN6lTj7tOkHbTxkSZPJoatM6bB6WXeeH31i8=;
        b=AXlJCvSKk9oKSCdWzuXaAj9oay6DXhva4lbQY/DmPLTTavMgxwfpnYws7RGp27YyLo
         L5ldkaIvWcYf8kDMTilPBSCZR1KTRxcUHkuise0dnMD7j5E4trKW21xR72vNmmibGE2H
         J2KObVevIFGXeBiwZCjNgkPlD7fLkkT7etwgm048FpPmOCMuhq6Qh8PPuCs/uQ/UmyM5
         c0qbMPEDHXtM6DsslEmk4H1YIsOAn5tPtJqo3cZIDaM567Fy046LkiwyAnhmSbUrmTSJ
         RN0RTtD3AcjsPEcTXRY2IPwQx1cWAIq1BUp15g4fd4e+tHygf3iXUCijcq795pMdhw6g
         lvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788374637; x=1788979437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hhLcfaaN6lTj7tOkHbTxkSZPJoatM6bB6WXeeH31i8=;
        b=TzLdloI+gcVH6NBq1AxrohIQdbL5+8bbFCa2lnOBXNWjeroxBHAHUD2wi3/ydwGktP
         /bzhGMfpup+CDmQu18CSf1NhtIwMNufSwWKU4bU8vSRDUQTpxofezECkNrpKdMN06KFa
         JVfyc+Y2cJiu1OMG0Teg/EKnkIX9kiOW0VYSU/MWHriOP+RdbTU+khSrafgdVTvHka+i
         PFOxbMzWnpd0Ktg5yWQbDZ64LxxvXcUYGOPWUNZq32bKyu5w05mRDcvUkCd9xHc2o9c0
         NBalubLQcMuQXHLvb1Pz3Vy2uIW2yqDbS1ebxp+Zz1GtLiLoguUiew83VbBpwp1klkch
         UKgA==
X-Forwarded-Encrypted: i=1; AKwUvBw6a3hEg7oFz5k3T+KrM01rQD3iMoeRJLK+lfWIGwc44jnA5JsmLykxL3go54oaUdu1LrDQXpqDX8t05w==@lists.linux.dev
X-Gm-Message-State: AFuF++l1sQz0uVcTj+OYku08JTGFgxxDNfK0kEKx53S4QVeCfHbDyubi
	9fxmcFuaY55G1B1uA3eJYDP6lidGOtNl9h1qMwUv6yDOcCwkuuzX7vwa
X-Gm-Gg: AYBFou1OQ0vaAiqTWtxV7C2Hi/vt2OhtYLJu7CCsWXUhW5lLp/lfAaVwz1ePsLlREpS
	wrE1Sjw01tcRqmqSeduxgixYVg2aLp8TUCyGFmPO7uS5EqAIDMu1iqj4e5nYnLJAYD2svh1lcvQ
	djDChGS7XXlPj15tZITMxB2IZpkyA7d4dhg2NJd5hD/5N2ceBLdzWF4GSG66+9WkcFzMmDwXvYY
	RXIP+OFk8M0VHwFmaJQ0OLj3T+Jk+RFsXlC7NpzvZvTS1zue37XoZ10TgFofbv5ci9iwX9Fzd88
	pqu2j+vd56N1rsL28qsIzkIWoAblwOeAJg6btetJ8EXZXMPsBJFh1Cn7O+3yF89bEULBMYddwvp
	3s/8sApyL8XG6iJ438pTM3hUCudjaxudr06bBsKS9b05EDFWL83zi5mRKD4lu+H2aqpZDNSwgX8
	4pJ43mF5Wfjb0mHK/H/EjXm05fqRfvyG16cDrXdp9243HNByYS9z9uHMw1SDLlUmBhYQEBODRo/
	jz2xM+HBs1QpqaRxk0+GJ+32VQ=
X-Received: by 2002:a17:90a:e7c9:b0:398:9bd4:d12 with SMTP id 98e67ed59e1d1-39aee219f45mr9553381a91.17.1788374637221;
        Wed, 02 Sep 2026 11:43:57 -0700 (PDT)
Received: from localhost ([2409:40c4:d:5c19:7852:60e7:cc2f:a6de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8ccdecdsm1678251a91.2.2026.09.02.11.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:43:56 -0700 (PDT)
Date: Thu, 3 Sep 2026 00:13:53 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Pecio <michal.pecio@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: hub: use shorter 120ms post resume hold for SS
 root hubs
Message-ID: <aphpX-0WxWQOR4mQ@eggarch>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
 <9f8fae96-0865-4b0e-9650-00e92e324f9e@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f8fae96-0865-4b0e-9650-00e92e324f9e@linux.intel.com>

Thanks for the feedback,

On Wed, Sep 02, 2026 at 04:29:40PM +0300, Mathias Nyman wrote:
> I'd highlight the fact that this patch mitigates the AMD platform issue.
> 
> Maybe begin commit message with something like
> 
> "Holding a USB3 hub PM runtime reference for 200ms at hub resume triggers a
>  AMD platform issue. Users running Android adb report crashes after adb has
>  been polling and waking up the USB subsystem once a second for some time.
>  Vendors are working on a solution. Disabling USB runtime PM is one way to
>  prevent this issue, but it is also proven that reducing the hold time to 120ms in
>  resume also mitigates it. See Link for more details.
> 
>  Reducing the hold time to 120ms for the USB3 roothub is in itself a valid change
>  and optimization as the current 200ms is excessive...
> "
I will re work the commit message in v2 along those lines. But if the
mention of the commit 8f5b7e2bec1c is removed, should I keep the Fixes
tag or remove it as well?

> I'd do minor changes to the original code comment above the first #define,
> and just add the second define right after it
> 
> /*
>  * modified original comment
>  */
> #define USB_SS_PORT_U0_WAKE_TIME	200  /* ms */
> #define USB_SS_RH_PORT_U0_WAKE_TIME	120  /* ms */

I could change it to something like:

/*
 * Give SS hubs 200ms time after wake to train downstream links before
 * assuming no port activity and allowing hub to runtime suspend back.
 * Root hubs have no upstream hub whose wake propagation needs to be
 * accounted for, so they need less time, use 120ms for them.
 */
#define USB_SS_PORT_U0_WAKE_TIME	200  /* ms */
#define USB_SS_RH_PORT_U0_WAKE_TIME	120  /* ms */

If everything else's fine, I'll send a v2 with these changes.

Thanks,
Lovekesh
