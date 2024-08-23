Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31D914A098
	for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724415307; cv=none; b=TJ8na8N43yqnJ0XqKcYXhCBgc1YdbI3r7aVEfc7JeRTIRTN/0kY85XTKuyNt2nX74QJ/cMd3Ujq7gVe+H/kzbQ/o1mwI8u1G39d7Qtpgo0HTMN/oiSfY6ioUihWZkiqQtqe9Hqh7M4yyBg39rY2XAwYDJpJsGl1WAuq6JLWGZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724415307; c=relaxed/simple;
	bh=g/1Oq/yHT4tjam+4FYlzrz2icgTGmfy0guEfrhFFlNs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=aYrFvEaipHAwdFijNorVTVKaRc0vVuhFZJ7SrCrj60qtI6SxVZ3LhGpupm1iS75DubtD73/fF/oSfItA5OvOIsLahHyx2YkKDQYYS7J2NVhQAJqpGT8ZRk8GsaF4lhPRWZ82BKZlWHP7ldUFswEK+b8zgrGarjimEAkUJm8L/tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHbV4rsE; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHbV4rsE"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7aa086b077so221125466b.0
        for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 05:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724415304; x=1725020104; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwsCcLX0nWUuLEDkenDmm++3B8eZkIMKdByDwW9AmVU=;
        b=SHbV4rsEBvZKiHn43rvBiGBKFitkvc0dXOOxd9CeELsUL8Fz8xCNEQwO8OOjlOLbk0
         DBtQvfc7kl0/rC1KpT+f2tpDyT+i/YX9ouq0HZY9LudD8fART7kOrL4AvDbdm0wwNFlN
         MXQhvbKL5mh1fsM8PcEDIQrCiph6PkKas/HNYfXINH4xJxJrnuX0J0ya5Xq2Sd+MbqVc
         aqbEgyL7yEvDhcATuzSTZ/DXuRFMuVyzM9blF5B2W+KA7X4qe1ddWzdDyKIznxTIWTUZ
         pWe1ReVZlF7f9+TukTFAxe2fK0kFkEaO1CtEDKY+MjOvpmxXS/+ULBiUXw1cMcecBR+s
         QLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724415304; x=1725020104;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwsCcLX0nWUuLEDkenDmm++3B8eZkIMKdByDwW9AmVU=;
        b=CMJo6LcyrFp7C96gucyKXyvs/hVWBVykl6xtxDNBoVoPXeyMulm2g9rAdjDyJ+fpPZ
         qhTRTHelrh5NfaPzQq5QddGj1WDkNE6wqj5gdh+Dg+nSPAdfLnOiIIVg0zB0L6xuVILO
         BmrYTpQcn0w1zrhWaySH0p8srKV6vphrxAD58fgwVPKEID+u8x9LMs20CPGBwmLMwjis
         hQzTqq8hfoiSylI52VLn/DPv9meUQsJ2okLXzWAsk1JtuHxZJaYkgMbnPjYFw0Gr4Ia7
         k9D3pE+CAsLlJOgnhuKOk6LNh12G2qhz1N/nmovDy3n3JV1JnmhTqn32B3dgjhlqJeDz
         J7NA==
X-Gm-Message-State: AOJu0Yy1+/USpm/HOPq+vFgXgOO7Ua6BzymqaT2OE0gJk9ZJdsmyPcfm
	F9Jj6D9+H62LfHrZHbXHCkB2bZUAfx9PPdLspRBTVGVw2UAmZm6umQ9zmw==
X-Google-Smtp-Source: AGHT+IGPKc9wvhxY8vdbiv2GzHUYcza+qlwoZLh4gEg11mnxyQwmBlXoDWFoeNz4r/sjl7l/H8IJoA==
X-Received: by 2002:a17:907:3d92:b0:a86:812a:d2b6 with SMTP id a640c23a62f3a-a86a52b917emr151810866b.23.1724415303701;
        Fri, 23 Aug 2024 05:15:03 -0700 (PDT)
Received: from smtpclient.apple (89-73-96-21.dynamic.chello.pl. [89.73.96.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f487800sm253720366b.178.2024.08.23.05.15.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Aug 2024 05:15:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [regression] oops on heavy compilations ("kernel BUG at
 mm/zswap.c:1005!" and "Oops: invalid opcode: 0000")
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <6f65e3a6-5f1a-4fda-b406-17598f4a72d5@leemhuis.info>
Date: Fri, 23 Aug 2024 14:14:52 +0200
Cc: stable@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Yosry Ahmed <yosryahmed@google.com>,
 Nhat Pham <nphamcs@gmail.com>,
 Linux-MM <linux-mm@kvack.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <21AB948C-2A05-4AE1-9E8F-8441C89D36AD@gmail.com>
References: <BD22A15A-9216-4FA0-82DF-C7BBF8EE642E@gmail.com>
 <6f65e3a6-5f1a-4fda-b406-17598f4a72d5@leemhuis.info>
To: Linux regressions mailing list <regressions@lists.linux.dev>
X-Mailer: Apple Mail (2.3776.700.51)



> Wiadomo=C5=9B=C4=87 napisana przez Linux regression tracking (Thorsten =
Leemhuis) <regressions@leemhuis.info> w dniu 23.08.2024, o godz. 13:51:
>=20
>  If that is the case nobody might
> look into this unless you are able to provide more details, like the
> result of a bisction
> =
(https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.ht=
ml
> ) -- that's just how it is=E2=80=A6
>=20

oh well - bisecting might be painful as to provoke oops - usually i need =
 - literally  - multiple days of constant 12c/24t compilation=E2=80=A6


