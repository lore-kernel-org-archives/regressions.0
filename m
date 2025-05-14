Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5510204689
	for <regressions@lists.linux.dev>; Wed, 14 May 2025 05:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747199577; cv=none; b=ui+nVzhtsk8Q9PfsGrFj/1fYzioLK3R2bd5UmL8mDBjO/Tf2T08rDmi36MrQj3+RIRf0JgznufmnYi2EHoktNz1aRZkdSIyb26q5LBxc/W7jHQV9cgoJyDLb4iV8w8CbbY8RjdnuxfTia371fjcZ3PHE3HapaHmVxhmBb9HLoYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747199577; c=relaxed/simple;
	bh=yUG8ONjOe4LwcmpGH9v/45YXrb92a0dsHUD1DMtRqgc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BjRlAJWlB2X6kUCpjOqZTMDluv5rPWwjsOOBq0kMzMi3EzxSAZTVZaCIICtvhBV4ee6MjysKWVzFOPLR/FpA8I+pDWHSmSfTjXvytAtGbf27hoLhnWqxv1v4RydhJIQOTnlYq0cfW6OgAm1cVi/hG1YL54n09NnBHlaHpbcQ0z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUVjPjf1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUVjPjf1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so68032855e9.3
        for <regressions@lists.linux.dev>; Tue, 13 May 2025 22:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747199574; x=1747804374; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ccAXzQ7Hj2l1zKP83Bp1shjlWNHgYOcGKTaM8SjJfbs=;
        b=YUVjPjf1h+skm8yrp+ZZUkTtahH0PXQsZ5+YtpzLtApwDxeq3DhTwGDm28gLnvNAJE
         XebnSXhBubmuiv+aveVJ4P7/7BFP6RDBnPG3i0cMZyamGJaXz3baTd669d7H9asnSCZd
         XyCCVgABvL1hKtQTtSFNVHBjIQR2sPFZBcEmdQ1M0VQfVyFjHsfsuGoN/9rlc58vA45j
         6Q7AKKqo66+8IGWYtAsw3OzNPidudRGfHaOehDPYLAlPonNPfTOgJb00d6qrXw0p3h7B
         scuaE9dCsUMZnYKCbjELDMD0t4B6B9Nl8L8qOio+fNVrZQyXLHW+57hwKGC3dwM1YEQe
         VoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747199574; x=1747804374;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ccAXzQ7Hj2l1zKP83Bp1shjlWNHgYOcGKTaM8SjJfbs=;
        b=CVcT9Sd0gbI0kB+7uvVUQ6Ge+aCjjP0255Dtzvipc4Fc5rjfLsbYZW6DQlTix3pr6X
         oxlfHJqDHwyXrQ/WPsMXe1Fk85Vqfz6tBwRxD5r/jgmmFdXkuvzY7m+uJrSEby92YXTW
         w/dLUQilbSodoAkNEQU3Kg4iMV6xYjQbFg6AxZioI2Lz0AXniNIJEmoB337AdkDAjPZH
         peFHyYHKVFAQ68ztEKXoh0Vkfy3ZmXZjUz82xhRh4/IT0kQhnOAYc4maaW7DZ5NIwH0n
         aynqi6K9T0UWkxFDwV9koU9g9tWaI8SqBNS4g6m2aQja5Wa1icMJUYsV4wPJa2RDjaRb
         lvSA==
X-Forwarded-Encrypted: i=1; AJvYcCUp7lKHvZi0vUtcJEZJLAvVtgD5FJsFpdw7t//ANKCf+pY0k4aG3djzVjuMB7W5OwuhWoJmrUbzYQtihw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyU7VRO0r0abpf9hx1Ruszxr06GsffOQHGBykPPuzOzzYvBjGq2
	TntmOHaWnGNYLLii/bvWk2IHdG7tueYN64pJX/cHSPDwVmjWztoM
X-Gm-Gg: ASbGnctYtZOfJR9qn1RYcF6rQD6hrwTSLmu4fLXLcGdWueNOYBtiFDDnk5LbE70JRdY
	qbivhgU9/sqxRU0Q9nK1PA6Ev4fxGHOlguW/mafJ3o4MHB6mulAFtSdvw1Df/m/pmAwaZ9W/J5u
	utEJMMmmCUPHRQvSM5EmwaXBKNUA5T6yMb+6/yciUbFIkVZT3kBym0P6zS9Yw1bznSJKmfV2ol0
	xOjV/w8EC4dnXwXCryw2KxIxODw/Z3xoC5QEpzqTQGY9vhZ01gLQ0eJg5rooKXkS6egbkJbUJdl
	4clbuNNZHAbFcMPfIU3Ob5cXTV5O1Yj3ZLthQ/8ivP0IZm2bRtEqPItFb7CTQLDrjoQKXtAWhBJ
	xzhHPSbYzcuKHawZqc0n61gA8V+N8VEgp
X-Google-Smtp-Source: AGHT+IEz8NL5ChkEQch25k/avcSb+ro7yC4An0ceFXjPtSS6PO6SClvUvx1aOjHJkqF+FfK7lsjm4w==
X-Received: by 2002:a05:600c:1986:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-442f4735b63mr6963485e9.12.1747199573832;
        Tue, 13 May 2025 22:12:53 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:a31b:44a3:4e3a:b121? ([2a02:168:6806:0:a31b:44a3:4e3a:b121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e84d3sm12939905e9.32.2025.05.13.22.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 22:12:53 -0700 (PDT)
Message-ID: <8e9b45bdafe6ac3f12bcbb5fce5bc9949566344f.camel@gmail.com>
Subject: Re: [PATCH] crypto: marvell/cesa - Avoid empty transfer descriptor
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, regressions@lists.linux.dev,
 	linux-kernel@vger.kernel.org, Linux Crypto Mailing List	
 <linux-crypto@vger.kernel.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 EBALARD Arnaud <Arnaud.Ebalard@ssi.gouv.fr>, Romain Perier
 <romain.perier@gmail.com>
Date: Wed, 14 May 2025 07:12:52 +0200
In-Reply-To: <aCMOyWVte4tw85_F@gondor.apana.org.au>
References: <aBt5Mxq1MeefwXGJ@Red> <aBw-C_krkNsIoPlT@gondor.apana.org.au>
	 <aBw_iC_4okpiKglQ@gondor.apana.org.au>
	 <dd55ba91a5aebce0e643cab5d57e4c87a006600f.camel@gmail.com>
	 <aB8W4iuvjvAZSJoc@gondor.apana.org.au>
	 <41680c5d41ed568e8c65451843e3ff212fd340c4.camel@gmail.com>
	 <aB8t1ZTVBexqGlcm@gondor.apana.org.au>
	 <dcb0b04e479d6f3cfed87795d100ea09e4fbcf53.camel@gmail.com>
	 <aCAX8rj2ie4QMnTo@gondor.apana.org.au>
	 <28184fb96e2de8a0af32816f5ff1b3d776b57217.camel@gmail.com>
	 <aCMOyWVte4tw85_F@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2025-05-13 at 17:20 +0800, Herbert Xu wrote:
> On Sun, May 11, 2025 at 06:39:43PM +0200, Klaus Kudielka wrote:
> >=20
> > Here the log after modprobe, with the new printk patch:
>=20
> Thanks.=C2=A0 I'm starting to get the feeling that the partial hash
> is corrupted.
>=20
> Please apply this patch on top of the printk patch to confirm this.
>=20
> Cheers,

drivers/crypto/marvell/cesa/hash.c: In function =E2=80=98mv_cesa_ahash_comp=
lete=E2=80=99:
drivers/crypto/marvell/cesa/hash.c:403:25: error: implicit declaration of f=
unction =E2=80=98HASH_FBREQ_ON_STACK=E2=80=99; did you mean =E2=80=98SHASH_=
DESC_ON_STACK=E2=80=99? [-Wimplicit-function-declaration]
  403 |                         HASH_FBREQ_ON_STACK(fbreq, ahashreq);
      |                         ^~~~~~~~~~~~~~~~~~~
      |                         SHASH_DESC_ON_STACK
drivers/crypto/marvell/cesa/hash.c:403:45: error: =E2=80=98fbreq=E2=80=99 u=
ndeclared (first use in this function)
  403 |                         HASH_FBREQ_ON_STACK(fbreq, ahashreq);
      |                                             ^~~~~
drivers/crypto/marvell/cesa/hash.c:403:45: note: each undeclared identifier=
 is reported only once for each function it appears in
drivers/crypto/marvell/cesa/hash.c:405:25: error: implicit declaration of f=
unction =E2=80=98crypto_ahash_import_core=E2=80=99; did you mean =E2=80=98c=
rypto_ahash_import=E2=80=99? [-Wimplicit-function-declaration]
  405 |                         crypto_ahash_import_core(fbreq, &state);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~
      |                         crypto_ahash_import
  CC [M]  drivers/crypto/marvell/cesa/tdma.o
drivers/crypto/marvell/cesa/hash.c:407:25: error: implicit declaration of f=
unction =E2=80=98crypto_ahash_export_core=E2=80=99; did you mean =E2=80=98c=
rypto_ahash_export=E2=80=99? [-Wimplicit-function-declaration]
  407 |                         crypto_ahash_export_core(fbreq, &state);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~
      |                         crypto_ahash_export
make[9]: *** [scripts/Makefile.build:203: drivers/crypto/marvell/cesa/hash.=
o] Error 1
