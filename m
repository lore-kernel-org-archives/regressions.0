Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBBE12E48
	for <regressions@lists.linux.dev>; Thu, 19 Sep 2024 01:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726710200; cv=none; b=ZOMamVLX9yyvy7Z05dmNF4OwelP/+U3QPAOjBVAQlUQa/pAfp6+exza1KtwC4tdmZA2dYLiHdNHRj6fefEmsL1cIWZ5E1SaowL0MVLwAXrvUR4b57DHI8vnO+v+uY1+Dltfe6tAHavvpUltPMOyC8cX3N7cw1KZR8OHRD0D61TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726710200; c=relaxed/simple;
	bh=oNXPqtyDgLu9Kh2ue6NBD6CfWTrY2WHFnxBQrLR39sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=av7xSP3zGwD17hW+ECugot2v1IJJhi4yMzLnYFS+k0rWzaLBzTLu+zQ403HtsypFwiqkTpnrmt5IqO3nmWLU+PlysFbMZTFFWUCMST8Bz5lR1NKxcqxBjy7jj4b2p599r7jpWOnDHoYsuUeYiLE7ctqVOtFBwmj8ijJwXD3kBhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=rVuhPXZM; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="rVuhPXZM"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71971d2099cso227979b3a.2
        for <regressions@lists.linux.dev>; Wed, 18 Sep 2024 18:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1726710198; x=1727314998; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+jwxQJbxpwl4voWuXzYITDQeat0ESjsMo2U9Mc7bSDY=;
        b=rVuhPXZMFIJYvG+O2FnJBbhlUGJjN92d4yx/JTiMLhLGzas54RO05q+1hcN77busbA
         h/NeF6JwWxahPWZydYiv+P3uqM4BPB13sqmYtrPcMYE27mfNhKGBSsgjxGf1+jGNSCFO
         2Vx6qVkuZmpb3lKRBFXRb74YAqyMLaHiiGiAANjSZCgOtcNDlCGjbFLmY3cVQrXkd500
         eUEXu7bwPSBMJvQQysyttEiP9G4Q4hkXJnorSavwX9fq3F0o18JcpaiD/miDqmg1lHGe
         b/skfcW3Bj8D8IHNUyiB4Mx2fYIGywMAoJ+hto1LZyTL+ecKov7nXEKlJMRTRkNYbzem
         z65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726710198; x=1727314998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jwxQJbxpwl4voWuXzYITDQeat0ESjsMo2U9Mc7bSDY=;
        b=Iq2ftlfM2WlBPO4Dc8lzDFDi1zgtwjl0jRyyjYnk5w5ZziZTLGfT8QpATnoO74fdGQ
         6dTBUqTIWcPHaVn9P3mR7K5w+Dyba0zAmCeCnwgVymw4jOpHJLbMl916gbRoNVvI28lb
         9zVAl+YtPOF5BKF1mjhPJ/HWrxxqgt26GKf/0aw23HmJ+PiA9NVbKpPn/Np/qs3KN8pB
         Tyfky96QNXvQuNtcPXHgVJ2JdsXj2eV4b5ZG3NmpOXz/ba+gNEfARTgOnZquCLVyyc22
         n8qpxsORl8lvoaNj8b3yqBFXQATQJziowRx6u5S1pK4LY+AOyYTyVolEbGfaLd99B7C5
         qs7g==
X-Forwarded-Encrypted: i=1; AJvYcCVbqmaViafVLy2T/iV9WZzKsE1HalGaoi69S/Z8qkjqUteZdkRBwlyn9LwgDcGkucRUDxru6QKxZhpYxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjR/ToDA43zxfiuFIfpBCSkQ8qan3Pj102xaIWw3jxDnIBb6R4
	IUrLr8Sjk0OqC60yI+gC/Ftwwc/J+fQZogIGPOsIMw25hdSvaSheOXY0R2AGzUA=
X-Google-Smtp-Source: AGHT+IHP3QnTzJJQUGix1BZtfPAN61RzG3kG6wmczzL7AUu1v04MsD1wNi6JBs9VM4Ciz1/aEAynVA==
X-Received: by 2002:a05:6a21:3942:b0:1d2:bb49:908b with SMTP id adf61e73a8af0-1d2bb499130mr25408416637.18.1726710198379;
        Wed, 18 Sep 2024 18:43:18 -0700 (PDT)
Received: from dread.disaster.area (pa49-179-78-197.pa.nsw.optusnet.com.au. [49.179.78.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719918df7ccsm150940b3a.40.2024.09.18.18.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 18:43:17 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1sr6CR-0072c8-0x;
	Thu, 19 Sep 2024 11:43:15 +1000
Date: Thu, 19 Sep 2024 11:43:15 +1000
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Chris Mason <clm@meta.com>, Jens Axboe <axboe@kernel.dk>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Dao <dqminh@cloudflare.com>, regressions@lists.linux.dev,
	regressions@leemhuis.info
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
Message-ID: <ZuuBs762OrOk58zQ@dread.disaster.area>
References: <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com>
 <Zud1EhTnoWIRFPa/@dread.disaster.area>
 <CAHk-=wgY-PVaVRBHem2qGnzpAQJheDOWKpqsteQxbRop6ey+fQ@mail.gmail.com>
 <74cceb67-2e71-455f-a4d4-6c5185ef775b@meta.com>
 <ZulMlPFKiiRe3iFd@casper.infradead.org>
 <52d45d22-e108-400e-a63f-f50ef1a0ae1a@meta.com>
 <ZumDPU7RDg5wV0Re@casper.infradead.org>
 <5bee194c-9cd3-47e7-919b-9f352441f855@kernel.dk>
 <459beb1c-defd-4836-952c-589203b7005c@meta.com>
 <ZurXAco1BKqf8I2E@casper.infradead.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZurXAco1BKqf8I2E@casper.infradead.org>

On Wed, Sep 18, 2024 at 02:34:57PM +0100, Matthew Wilcox wrote:
> On Wed, Sep 18, 2024 at 11:28:52AM +0200, Chris Mason wrote:
> > I think the bug was in __filemap_add_folio()'s usage of xarray_split_alloc()
> > and the tree changing before taking the lock.  It's just a guess, but that
> > was always my biggest suspect.
> 
> Oh god, that's it.
> 
> there should have been an xas_reset() after calling xas_split_alloc().
> 
> and 6758c1128ceb calls xas_reset() after calling xas_split_alloc().

Should we be asking for 6758c1128ceb to be backported to all
stable kernels then?

-Dave.
-- 
Dave Chinner
david@fromorbit.com
