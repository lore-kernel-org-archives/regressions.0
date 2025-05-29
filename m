Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608FF207A08
	for <regressions@lists.linux.dev>; Thu, 29 May 2025 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517444; cv=none; b=V285sTbE8H2N9qD+TKL6ljs1ngy0YfiwWchzrE3k/4Rn3B/LDgMcninP4aKjkIWXM/W+8NODYlNQRyBfUGyr1BsVHXVP0VcE56eqYfA6t9FMhOwdj50Ow1sZjXTkx9/O5ASQomFH9/IV3tMHQU2krtMmmvhbTs58mGA53X7whvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517444; c=relaxed/simple;
	bh=y1WxNsUaaCQ76I6bmdF7st+6K4OmxaslZfaz5YthJcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohGDG3fXOieUaj6HB/fttSRGIVUtu6DL9B/DxkR5WtChpAEqlvgwn8elpaWjwW8+CnIZCEmiKNh6mwYKuzTG+enm5a5wnSsy8fA+i/imMvN5I16vy2jnbkxbVIXVAH/0lNdXl4QVdRK4OfjwBTSPsg7xX15p6Pu4hoy9PCkftGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJrKfnxn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJrKfnxn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso452298f8f.3
        for <regressions@lists.linux.dev>; Thu, 29 May 2025 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748517441; x=1749122241; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nlXDRDgb6NELSEvtZDiZWhvLmZhCjsZFnwl0WjO5hXQ=;
        b=QJrKfnxntVi9sk8h2aZtaCZMAGKU56jOI40Kn2F+chLIzQbtmTXvSXkykAcf7CVgHT
         dak7dzt4UXC/AM5fb/OU7faMM8ZdtXnyGIHzwPsYI6hAZXL/4wW458n1LYLPi3ko28vB
         Yo/dv38hoiq2FOunVXDhj37LrCwdjgM9yr3dN4lRDzYx+mQt6ZZjFcVSMGsA83IRF5YR
         gBOS3ma+yZhGUv//1Xc6r+udtEbHtjoSzcaaK9KX4ISXLv8577XLdHVj4aCQcPgN0wPy
         R8KMRuc2E5JX8+ZpGCXKHGR8SutW+GfAF3A3Ssl2RHWIwgHLkRKrri8BXIP+7pMTr7B1
         HQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517441; x=1749122241;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlXDRDgb6NELSEvtZDiZWhvLmZhCjsZFnwl0WjO5hXQ=;
        b=OHxJWChfMUvY+H+CqVChyIisQFtdEdFZxG2MK/HHoJD0eSQep2xcZzfm42hYUljM6E
         0dvngJFaQWJHFQiEdZ9suh+w7ruVBwWU3oY6cSxY/RXVBSxa6nK/aUQHezpmNi+NuXw6
         oQ8MUmW2Y2DppCVnAX5jKya+osAvV9u6vsMH96fZL/tuF+meID3Or6EKUCmY3ffDxTpl
         TMHkNkftRF1vbkdU3MCmERfIgB5JCtLouHqPZKuhi4Bbhb2gIGqpYwsx9QM4EqM7KDED
         vksJOzSqntlUTPfsZgnepBVRSg4mt90ml0qZEzuKdhLF3N+2a1USIDnSXWh1c/pwjOpe
         IQDg==
X-Forwarded-Encrypted: i=1; AJvYcCXS3WxPV2hmaaiITHnG7YORegKfLwlTmUQcMJCvHqgTcS1m3W3NpLq8WtGALocEOwNGtAqCib2AwJkkBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwV1rWRP8z8o2yPjY8M7bhYdc9u/9RMRrNkKuc+XoVHGuSTF5fG
	0lLmoUPhgZWBzt5aof2coa4CNmjd/xlZz5HlzX2mT/7b3DqPQ//4bdbe
X-Gm-Gg: ASbGnctcVjwfiXM/bVC0KDeQgr1v6jnSLiyVUltJhemp5xfmYi8RuyAExFkLH+NkunV
	8Vq56hIgV45QtovZEajknz6W5R/o/GMCoQRalrgVWVyCQZbskptXZzS8OH/V72QStA12YKfdE9v
	KJ2bVFJ3tyW43S0mb7OzJNqDdYGOs5rZK3WheRjUuilVSoIW2VLk0FgBaWgjsN+vRKA9img3EJk
	uBTosJKIaseFYzVIW7ahMGGLR6JySNqiuPcyLgu6SxqndkRRQc4BVjAYUEIZpj/DCR/1sFgyAGX
	2AggQqRBrlos/B0+yhKPcKqwW3m+mjQ/1heHDrFRV9wbCrAtKlNpGiOkWg4h5VI=
X-Google-Smtp-Source: AGHT+IHtgZ/XW+7fRrlSv/HIrfly33pmvCxjkrQUeDtROrJKxEFcueqCNb0ZrPOIgzS/ZWEMVKb0LQ==
X-Received: by 2002:a05:6000:250f:b0:3a4:eac6:e320 with SMTP id ffacd0b85a97d-3a4eac6e4cfmr5557421f8f.3.1748517440483;
        Thu, 29 May 2025 04:17:20 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-450cfc030fcsm16997705e9.15.2025.05.29.04.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:17:19 -0700 (PDT)
Date: Thu, 29 May 2025 13:17:17 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Klaus Kudielka <klaus.kudielka@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	EBALARD Arnaud <Arnaud.Ebalard@ssi.gouv.fr>,
	Romain Perier <romain.perier@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Christoph Hellwig <hch@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: crypto: marvell/cesa - dma_alloc_coherent broken but kmalloc +
 dma_map_single works
Message-ID: <aDhCPZwmH515TJav@Red>
References: <aCmTQoJw6XG1CkuZ@gondor.apana.org.au>
 <aC1fY6IP-8MzVIbx@gondor.apana.org.au>
 <aC2aAvX07Aaho08d@gondor.apana.org.au>
 <aC2uvvzlR89iVFGW@Red>
 <aC2xTI1ZuXoZjgjX@gondor.apana.org.au>
 <aC3cF0-bWb-Jiz4i@Red>
 <aC6TkPM6mOuFwvkD@gondor.apana.org.au>
 <aC7UbAIDA46olNJL@gondor.apana.org.au>
 <aC-EGr50MIVJqwVn@Red>
 <aDbeNYbwhmG6fzUh@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDbeNYbwhmG6fzUh@gondor.apana.org.au>

Le Wed, May 28, 2025 at 05:58:13PM +0800, Herbert Xu a écrit :
> On Thu, May 22, 2025 at 10:07:54PM +0200, Corentin Labbe wrote:
> >
> > Here is the result:
> > http://kernel.montjoie.ovh/479404.log
> > 
> > I have built by adding also your "crypto: marvell/cesa - Fix engine load inaccuracy"
> 
> Please try this patch on top of the current mainline tree.
> 
> I've force-enabled the software finalisation code and switched it
> over to kmalloc + dma_map_single.
> 
> Thanks,
> -- 

Hello

I have tried on top of torvalds/master 90b83efa6701656e02c86e7df2cb1765ea602d07

https://kernel.montjoie.ovh/479785.log

Regards
