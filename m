Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06BA2BFC64
	for <regressions@lists.linux.dev>; Thu, 22 May 2025 20:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944516; cv=none; b=Q2E//jSfeOy2lkj964F1swRTtLX6oeS7zYrRBjMK6Do0Sl5p5W/G7x4y/dF6vITUA3jNYnNjUOPk1KRhJB4+SEP1OeeUzMIYa8y9eAkss4k1Hxk/tv7yY3bZz0Tb85wBipX9eTdfAW9Fcqys84hT2eeTxxMbJGrd2PhUsv0SJc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944516; c=relaxed/simple;
	bh=mPy3mr5xya9Xi/dBCEM+pZNQ1mF/W0TXhY8/tZkQ64E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDBCrrXy3sUSDgeAVYlud0yzqcGOvG6Y7HFtGg5844ZCE8v7plp3uGfw4to6VMZd8kmphp9lBpgfbFXwEw7+V9jTGGdiV7sxegBeBsRups08HRFZqBbiswTxqXeSaP5zlgF4gVcPMli0TIkJ8vhYUzBqrTHGNjN9vZS7Rg5PkT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTvgHgQV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTvgHgQV"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso66128145e9.2
        for <regressions@lists.linux.dev>; Thu, 22 May 2025 13:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747944513; x=1748549313; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Q7aOB7ZFwI1gM59UHfpkuTc2nYqhOAspif1GidZ49Q=;
        b=RTvgHgQVdJbDO4H1RLe4dhQ+skFtlJMmDjGGIPsGNqto2Yx8CIpYY7fxgX2bQV6HpK
         fSXnGlb5V1oS550UPv7Dr3GXY5rz+FS2UDcLeBien0lcDtmG4i2lC4jJsC8wXkyNkNrq
         pl3OvplAI6Qjg7n5Q5OoLaFIVnRSPPtIbvjS2dr9UUZ666a0No3q4xhTrkHERqHIwS0/
         baF7P79Ep9j3HHBBxnnNEb2qxu8onPLh5lTyG4cf3ARhgreOFR2EoFDLo+xXJygv6TLx
         zAMbdPoXIe0WL3gO402nY3gmuee31lOAKAAyMqwxf531RKBGsX2VQhoKfPKeujck+q+7
         NSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944513; x=1748549313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Q7aOB7ZFwI1gM59UHfpkuTc2nYqhOAspif1GidZ49Q=;
        b=kAsByw5VBu+lUmch/Iv8dNP7RKQbVnLXxCpOWbi8AOusP0deuyVFRJh7pXjPnrAMOk
         zfe8VqBd7AwN73NuyxMXVkjTjAFTc+dBIjjVY/pGXlsU2UmtOiIcMi9rt4wTtDaIeA9v
         C3j4D+51dytxXkWixYdP1RR3zIGlCw0C8szB81s8ufFV9Ec2e1ZhNsuPsPWw32vphgBN
         FbzxZaVhMJyKn4+KAqL3Vr1395PnDkQhzDMHiGoEg9TNyv4xf8s5W3WcYaVapn0Ym20+
         No+Jp9eOrE8ttHVzn3eDXQznOeLltpeC/mxMossS0m6emKYXCmbuCeGvcZnHWkL4VkgI
         iWbg==
X-Forwarded-Encrypted: i=1; AJvYcCV4iYq7yuxLZUVVpEQPnr/1zeXEBRqaADheh0ARh0wUQB+ef/AoZKfDz8Kuwc+kuCUrMIPZjzp//TzhMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuT3TbwYrbxfjR6pwofSe1Pjzw+w+8WTdllWw1Nw7z4BLOIOKf
	b5HwHzrb/LWgzy1elLB7UVDIm3iRmXA/xzTPjpYgmikrsDMKcKAApKW1
X-Gm-Gg: ASbGncst89yjH0n+hwB+6FMMDjr0gHT8z2LxxLtmLhIiALDqRF/4d9cn+x24AqHFVho
	pVgjNtUZkUbEnOxV6VyZCEi1IcVZ/BC6VPfq8BMCmYSdO5ziGwA+s2mbz9qQ+HXt+prnPy82Ely
	7T0g55C3yz+URhgOWqqDDjYFy4SHigHwJdQi5WJTsLctVdsIRQC69x2dgE4KTqXiZVmwWKRSOsI
	JTXxIfAUjFzxuG4rdrJj3tjdjiaImcL6jIRC0uHQV/fa23WiXbow/NIAmrrK51VWiY5QcmSoUlu
	nOpq+28tXnAXKzEPF294H+aTcrjA+XlWLWzgpFDLQzTRKjFPhZSo
X-Google-Smtp-Source: AGHT+IGFt/N9FVg1AtimaYyUbC30MJQyk1oygFeM95h2FVPn9Aj6j/wU4BgvD3UFticCry9NDEBr8g==
X-Received: by 2002:a05:600c:3c85:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-442fd6790f4mr233602095e9.32.1747944512781;
        Thu, 22 May 2025 13:08:32 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a03fsm23846036f8f.22.2025.05.22.13.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:08:32 -0700 (PDT)
Date: Thu, 22 May 2025 22:08:30 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Klaus Kudielka <klaus.kudielka@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	"'bbrezillon@kernel.org'" <bbrezillon@kernel.org>,
	EBALARD Arnaud <Arnaud.Ebalard@ssi.gouv.fr>,
	Romain Perier <romain.perier@gmail.com>
Subject: Re: [PATCH] crypto: marvell/cesa - Avoid empty transfer descriptor
Message-ID: <aC-EPvRG8oBND0wA@Red>
References: <aCZ3_ZMAFu6gzlyt@gondor.apana.org.au>
 <aCcyXkeBvHQYvf2d@Red>
 <aCczV6MF6xk5rRA3@gondor.apana.org.au>
 <aChx_ODF_hYKL8XO@Red>
 <aCmTQoJw6XG1CkuZ@gondor.apana.org.au>
 <aC1fY6IP-8MzVIbx@gondor.apana.org.au>
 <aC2aAvX07Aaho08d@gondor.apana.org.au>
 <23fe1dec-032a-41fb-8e60-3a1b6c098c4e@app.fastmail.com>
 <aC2p6xkMz4BtzPYH@gondor.apana.org.au>
 <1024b1b7-9d58-4db4-a71a-108f6df7b623@app.fastmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1024b1b7-9d58-4db4-a71a-108f6df7b623@app.fastmail.com>

Le Wed, May 21, 2025 at 01:36:06PM +0200, Arnd Bergmann a écrit :
> On Wed, May 21, 2025, at 12:24, Herbert Xu wrote:
> > On Wed, May 21, 2025 at 11:58:49AM +0200, Arnd Bergmann wrote:
> >>
> >> I did not see the entire background of the discussion, but would
> >> point out that this is not supposed to work at all:
> >
> > We're trying to find out why this driver fails under concurrent
> > load.  It works perfectly if you do one request at a time, but
> > when you hit it with load coming from both CPUs, it ends up
> > corrupting the data.
> 
> Ok. Which SoC exactly is this on? Armada XP or Armada 385?
> 

It is armada-388-clearfog-pro
