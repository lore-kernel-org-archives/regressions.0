Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155E91E89C
	for <regressions@lists.linux.dev>; Sat, 17 May 2025 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747481091; cv=none; b=DZlh7p0Np+5IAYdbl1HBpFy1jmdk+AQJ8h7GCAG2A2Cczga2M00Lfdn9HS+gq0PHXVZCYkcjMW7u+/DGVE/KYzvra2KjfOCyrBAXwnSmOe2uKSli5BewcgS1jo/cs9Q4UYi4KLojSa+kZCkPLfUzXp8ypWfnou+yDlOmvfCJb0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747481091; c=relaxed/simple;
	bh=ITQ8WoBgcuYy2CoCnaWW8b2dqVeJ6CVqmMWg/wOdEMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8SaA5voMs2epiWPyXBTrIkb0yCMU/meR+D3w+8iKe0p1LSEB4jYqnso/M3yQRUU/hnDSADjZWSve5GoB+yLDYTYIA3f/AJWmx36WyyRzd/IRmY1hewfhGB9xbSivlYy5q1ugIgOAq8kwy418XO6YVP5Q+ZDZjUCPxYM7/N1XrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PRwh844F; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRwh844F"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a363ccac20so886234f8f.2
        for <regressions@lists.linux.dev>; Sat, 17 May 2025 04:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747481088; x=1748085888; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MSwDpQT84zdgO6wXxHFEBW2XxJars8UnwfBLwxECHy4=;
        b=PRwh844FHHiwG9ykBi0OtzUpHqaoKmpSaqUNNBhwyAEFBBKKZOfCmJPPdS54YExaUM
         NavTv8G1PpYsbnWt9wQ40Q8vyx8/Llofzd9tHSzedgYyOhbbj2TsPtMXhhic6p8PHkTM
         mXNPe7yPebpeoOOwReiLSfiW5dGmMO6UcH6iOhZhCuqCIfk1o4WrfIxH7J2SHU5UgLre
         BFYcaAqk2DeqphJtffV8t4H4gw72Ga03z80wAapRX3/95zaRBLy26+xouPjHqW19j9VV
         D88z805C+2PRcdE8kjo2UZa3Cex9tlYGQH+P1ZdxdSSOUIGyvrTM4g5bm/G4geWbcsri
         CtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747481088; x=1748085888;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSwDpQT84zdgO6wXxHFEBW2XxJars8UnwfBLwxECHy4=;
        b=LYdkY9Wgzq80mufufe3QqS2JFpH/tQiKxMu5movg2faHyBHpnaQIKc5yNAUrLOVcYM
         R6WpZ+1OusN/HOF4jEFyRaCVwkhqTFROHFFTgQBl55Rz+f6sHwuwo0k58BRD3S+TF6h4
         16tbgX4Hml/qPeV556QO1jHvF6+gSUL+m0z5xDID8Anm9cH7m0F5D1BjrdJyU4V9gahv
         xsUEMPyu+4tLFzfr15W4X9CEAQY2TP6JLw3TcPf1+IzypESTxMmlENIsM++zKY62fzbo
         mrGtmtiTHgv+rWKuPjpyPb1XYnRrspn8glgY5dcz6C5jhl8I6kCICZId0wRhR6eGCat8
         omxA==
X-Forwarded-Encrypted: i=1; AJvYcCXls65xzyf2E6WZr7ifBeTNBrbjF/ZSTAQ+N6Ob9El8fjcjNKWqK9EMV0j9Ys2lMiK0GUKfbPJefOxNTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXlgXKEbyFdxAzgEwS2osFZZmTw5fKALYWJqZL0zFCy5vEun/G
	EE1WqnpOhGZU9VgRxb3PLRSI/KQr61iEL9orFSGZbcRcf7qHGP9xOQFp
X-Gm-Gg: ASbGncsblHA6u5jTJQEtBgO7Pobdv71fwq15be5whwPfrfs+Gwz/zZGgvpyWPUyaHI2
	Bq85dEhoqlsCybAv6gjCKiXjkKi3TduKvuMJ0u/PU/x41OQxVUMENEE93BXFGApdftmthUrFmie
	arGgBs2GxZM3kuU7w8yC7md/5Rk+4P1Nwg1R+eKQ3wYIczpUo1xo/qbwbRfO2Ruy01J9c3Mefmq
	emOYZn3Q6Mnw9VG9qo/xAcidYYkKyRz6cFnrmha2QqMjvTfTAEXDHiMBT9fxRE4YeWCuDLTRBFP
	O89yX5OVlhQ4I9WS3pJrjBakNn3CDG1VbNXHNuD2SpNOT6nui5Hr9CGyZGcECIOvOSu3X+Vnboc
	L9F5gtAIJE3tYHhrl0RLzDxZsZB8=
X-Google-Smtp-Source: AGHT+IELLGTB3mvKaXwEU3iKQvyyKkC/EtqZga1x5Ws2/utzAKD+OKcH1q2bdpPcVf7VWr+9eHW4uA==
X-Received: by 2002:a5d:6e4d:0:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3a35f3634demr3881503f8f.32.1747481088193;
        Sat, 17 May 2025 04:24:48 -0700 (PDT)
Received: from Red (lfbn-nic-1-341-50.w90-116.abo.wanadoo.fr. [90.116.174.50])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39ef8f7sm136118285e9.39.2025.05.17.04.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 04:24:47 -0700 (PDT)
Date: Sat, 17 May 2025 13:24:44 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Klaus Kudielka <klaus.kudielka@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	EBALARD Arnaud <Arnaud.Ebalard@ssi.gouv.fr>,
	Romain Perier <romain.perier@gmail.com>
Subject: Re: [PATCH] crypto: marvell/cesa - Avoid empty transfer descriptor
Message-ID: <aChx_ODF_hYKL8XO@Red>
References: <28184fb96e2de8a0af32816f5ff1b3d776b57217.camel@gmail.com>
 <aCMOyWVte4tw85_F@gondor.apana.org.au>
 <8e9b45bdafe6ac3f12bcbb5fce5bc9949566344f.camel@gmail.com>
 <aCQm0aHYnI6ciyPz@gondor.apana.org.au>
 <20dde00750d803a9a364ded99dab1e3e22daec77.camel@gmail.com>
 <20250515182131.GC1411@quark>
 <f0dc235e3d7bfa1f60cc01fd527da52024af54e0.camel@gmail.com>
 <aCZ3_ZMAFu6gzlyt@gondor.apana.org.au>
 <aCcyXkeBvHQYvf2d@Red>
 <aCczV6MF6xk5rRA3@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCczV6MF6xk5rRA3@gondor.apana.org.au>

Le Fri, May 16, 2025 at 08:45:11PM +0800, Herbert Xu a écrit :
> On Fri, May 16, 2025 at 02:41:02PM +0200, Corentin Labbe wrote:
> >
> > Yes I have still errors:
> 
> Great! Please apply my debugging patch and see if it shines any
> light on the problem.
> 

Hello

Your patch didnt apply cleanly on cryptodev/master in tdma.c
I have fixed at hand and the result is:
http://kernel.montjoie.ovh/478852.log

Regards
