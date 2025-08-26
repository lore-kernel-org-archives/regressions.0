Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B212221D3C0
	for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 12:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756210300; cv=none; b=U8CI34qfzK9v2qEQ/umG2/0fQc2aCsGh9oXCC5m6S3dHm881q0IRpS9iXLTG1BBUJ+916AAQo7auK0g0N9BDYa/+I+cgShyoSmu+N7rUaOqcsj+MXvIOv0CjQeP+OIDZFHglfsZAFA38KwMPDT5gYV8fSkgOXQkexnMiL9q2lnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756210300; c=relaxed/simple;
	bh=RhEbsQKmIX/lirH/uUzChufR/shylRIDYLkxgKJenr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C8dkTfjYtYYoXkBd0OoSQ5WMlNnrshM9L9UrV8RN7TFg5R89aMxvHxfvRcDJwVPdrHINh4jM3H4h82ZXXilhu+W0/CcXAayWaXFRqcj4658jPcaK3nOKwnkJLpQvolBo5ADLMWt9ZAtzIjSZ18HX7ATPjGq6vwArnS/eaAn9Zwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ng54ZzSE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ng54ZzSE"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3c98b309804so1677205f8f.1
        for <regressions@lists.linux.dev>; Tue, 26 Aug 2025 05:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756210296; x=1756815096; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bgo2eJak2Be9BA5zOK9ll3HUyMbKDaGl7xMwm/BsZe0=;
        b=Ng54ZzSE1rriGgAZ6Ea8B3ZsyjYap3VTfGhxWCvu3gN03xLe3tRvS23/mT2YNTbcy7
         4gJaHSsHqw1o7fjif6Eth3T5TS0DZdCkanEBkg1l+6IP0BB92mOkFamBRhyFOoyT5F61
         Xm/lNQHOG50MM8DsUROOp9mFDQJq1oPsj/qeGNNDhdMCovl15lXhEIYc+PrV0TEMur5t
         2MqUoKbZeUjFVRM7d97SsoORLDCP/WcVZ7ykAXSq+4BlCL4tD+/yw7V6RwKDuhi/Wz1F
         YYqSwQPVJ4YCvcl0XYkt1L3RrlrnJiuDoMaRsmRGe74RQrhum1uwzTGw9+xII2rSTeF9
         cRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756210296; x=1756815096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgo2eJak2Be9BA5zOK9ll3HUyMbKDaGl7xMwm/BsZe0=;
        b=TGI3BFBmxt4+RER7iMrL+HbCSFZa+ujCJ/mCjHcBSdoQ0RZqTfiELzfG2/+BNxYK2B
         5qRiL627ko5dgxylqVCC/vrhegidKpQPl9fgYjxjcMyRyWEH1NkAKooM4ZX4raShJodq
         CJCoE42XsS6yoSO5fspAcUA3Qnrq+Pea/SBPmSoJ3G7gffifyWrOVdwe8yRrIvGCjQoz
         99pKyfQ6tVlvq3BhicUv1liMNzlfaBSelzmB1zxS5A+zbl+O67zveXvEL2x+YSQmXMgY
         i2pVEsS9zbOJ4wsHNq/8+CPM7yDYhKmunOGNgPTUS3Kizp8Vl6eWART7RNF62RlvgO7L
         xMxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS7+PQWbzCHVgzO8VhoQ4TlP5Rz7BdNoalQhnBzQYkIeEWiKeDHNB97dJx2F//fZZnDJD44tOAsRDMlA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdZl6vXrP0nfGpv6XfEY/tkGzhu/uX4eVGrQDZwA3answsfMFq
	WJ8sVTHtE3QdPkbQpkNFukI0O7tkZOUqOX8Q3sWuBZWE4U4QHUfh8d5E
X-Gm-Gg: ASbGncuMJlvo1azj/KjjktoNwONNHtFf/IAPqSiAdI9Nop/nJQ9PxXfAvzTTgn3RjQH
	lCVgQQEAjL3w7CiNir/aYuj1cTSGMz4/RvMXbG0sGp4Mr6ETeZqg1BnQSbp9+xV2EA+b7/7ZuWA
	C0YX/gBs5X27xgS8ZzSNPJL3PHl+HVwOlNfizCY/kg51Vvxm6NqEi/iJyi4G9X/kuoFcScRG/Wi
	T/f+yRoQuQN6BYRMVQ2j4F1DVQa+SuKEykp0QRE309Y+6JQzNUcu4eRY9Bzl05U3TvzbcnLgblZ
	HM7y65uyMipakjmG2mCio2cEJ322SBCfANgBhVBlhwyj+FaX7G1q0DCfsK9Y6+KhuJ3GCn+C9Hk
	lbOPxAOGTq1Rjmt2bSPzJWX5pwfaQEwMNyLM=
X-Google-Smtp-Source: AGHT+IFyt1noHdTU+Lxyu4hFFrhdSpjqHvjbZWL24i076P4M6ZzzL90XYNqTJ7uxCxOxl+awWvRnUA==
X-Received: by 2002:a05:6000:24c9:b0:3b7:93d3:f478 with SMTP id ffacd0b85a97d-3c5dce01212mr12959641f8f.51.1756210295606;
        Tue, 26 Aug 2025 05:11:35 -0700 (PDT)
Received: from localhost.localdomain ([45.128.133.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711211e87sm15670520f8f.44.2025.08.26.05.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 05:11:35 -0700 (PDT)
Date: Tue, 26 Aug 2025 14:11:26 +0200
From: Oscar Maes <oscmaes92@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: bacs@librecast.net, brett@librecast.net, davem@davemloft.net,
	dsahern@kernel.org, netdev@vger.kernel.org,
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: ipv4: fix regression in local-broadcast
 routes
Message-ID: <20250826121126-oscmaes92@gmail.com>
References: <20250825060229-oscmaes92@gmail.com>
 <20250825060918.4799-1-oscmaes92@gmail.com>
 <20250825155630.5848c357@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825155630.5848c357@kernel.org>

On Mon, Aug 25, 2025 at 03:56:30PM -0700, Jakub Kicinski wrote:
> On Mon, 25 Aug 2025 08:09:17 +0200 Oscar Maes wrote:
> > Commit 9e30ecf23b1b ("net: ipv4: fix incorrect MTU in broadcast routes")
> > introduced a regression where local-broadcast packets would have their
> > gateway set in __mkroute_output, which was caused by fi = NULL being
> > removed.
> > 
> > Fix this by resetting the fib_info for local-broadcast packets.
> 
> Meaning that 9e30ecf23b1b would still change behavior for the subnet
> broadcast address?
> 

Yes. This is OK because subnet broadcast addresses have separate entries
in the local fib table.

> > diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> > index f639a2ae881a..98d237e3ec04 100644
> > --- a/net/ipv4/route.c
> > +++ b/net/ipv4/route.c
> > @@ -2575,9 +2575,12 @@ static struct rtable *__mkroute_output(const struct fib_result *res,
> >  		    !netif_is_l3_master(dev_out))
> >  			return ERR_PTR(-EINVAL);
> >  
> > -	if (ipv4_is_lbcast(fl4->daddr))
> > +	if (ipv4_is_lbcast(fl4->daddr)) {
> >  		type = RTN_BROADCAST;
> > -	else if (ipv4_is_multicast(fl4->daddr))
> > +
> > +		/* reset fi to prevent gateway resolution */
> > +		fi = NULL;
> > +	} else if (ipv4_is_multicast(fl4->daddr))
> >  		type = RTN_MULTICAST;
> >  	else if (ipv4_is_zeronet(fl4->daddr))
> >  		return ERR_PTR(-EINVAL);
> 
> nit: please add curly braces around all branches of this if / else if /
> else ladder, per kernel coding style guide.
> -- 
> pw-bot: cr
