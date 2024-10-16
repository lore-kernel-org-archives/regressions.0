Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0060118A937
	for <regressions@lists.linux.dev>; Wed, 16 Oct 2024 05:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729057903; cv=none; b=Cu7KIBTOrAFwhR/vYXG+q72E7QGbqiI76WV6XdqEnQ/P+wPSqaXjQpK5+aO6NBHxrha3UmDqV5/tZyKG3okLpR0q1bbNTUQAVeo3QODD3nIakdvsjUow9dQMMn6wYYRWhg1Ag0yWkj4JdVYmJgjiOve/q8+TVkFg6rOa8GxhiB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729057903; c=relaxed/simple;
	bh=Ewgkb9Wn/3FQ0Pr73GfDMt7CgKYxSWWI5TOHTj8Ki8g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G9DSzmLcrOx/bfJ6y527Tc0mnBhflvOmqvPdJQkhtE1HzGjcxk07t5IMYnxAp+Zd2CZnCyQ4MZqEjtPivXyICI8XDy5mJcgp735A1Nkt9sGOiLGqlJCKeMS866wnjXhM2rLZ+wyFjrwzyc3Xve+GeNSz9cxXm86LgRskvPJn4fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHUNF8xa; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHUNF8xa"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d533b5412so3094241f8f.2
        for <regressions@lists.linux.dev>; Tue, 15 Oct 2024 22:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729057900; x=1729662700; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ewgkb9Wn/3FQ0Pr73GfDMt7CgKYxSWWI5TOHTj8Ki8g=;
        b=JHUNF8xaF6RzTru+9RhuYQJa5H0+cPzapYQ+8TfG7xHSebKCQUwOpcBeSsRiThC1/X
         GobaoAtPn0XJnoSDcnp3GADB+uLZk28+N0LUsQjsOfcxyLFWON3JFyNn3+ESDnySlW/b
         cAPQFpXUzJH6m+JFOqtQ3BgWJY9fHXCMw2IYjDAzQOszS5PaL22l79CJXa9fJcK5ENVd
         +M7Me1lq+jygsrxbreKEEosmKwm9o7RrA8ahDdsqrjIQp4l0BYCx+EFlF1UfPxwQMj4/
         xdOBBlISi2+nUdJqJoK9yRvvnhoSXvuYgiM51+l8tZWm2XU+qPoUibhFXx/SwQmSzKvI
         vHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729057900; x=1729662700;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ewgkb9Wn/3FQ0Pr73GfDMt7CgKYxSWWI5TOHTj8Ki8g=;
        b=fBXXF7fGmvwhIF/SJvCLFavIEF92vWssxy2G0DPACo6tyJS90n+dt+aF8Neu7Fes8/
         Mh2oyFJSLn9hFPXm3pERgdW57KGSNmi0h2N/4aD5mOrjhv+c1sTZc5hCu6GVFk4UA2A0
         fdwMj2Hrer3S5JA+4aXnJB3+nUSDdwEjB+MX6c0ayhKxfiDEAEmW2hFjwxtPq8hEj8h8
         2CWoSqTTAiuVIUqyHzgBgWSnxF23mEpJ3XXqMipgFXwG7MeH/w2Bh6oJjhy37psi9rgT
         lEZaWEVVysznLZpujx11eUyOJSyhW4GymndlRxk9r3KhIfkRfAk9iuMfzktv1ej2Eb5o
         vsDQ==
X-Gm-Message-State: AOJu0YyE/4WDmjEn9b+ZoAU5RTQBwCMTNZOrIPLd9nsRhaSSgASrKiM9
	8jPy/ggjrKQi/Pz3Gk2Oz2VzpvmLLwMCXrrbL5fAkX/emlEazTZy
X-Google-Smtp-Source: AGHT+IGG+VSZkImyOL6QNrq28Q8mz8xCnrVJoJEtOZgMGGpNZc0RJ09HoI6sfiW/UD12giBs8jdB0g==
X-Received: by 2002:adf:ea41:0:b0:37d:4cd6:6f2f with SMTP id ffacd0b85a97d-37d86ba83b6mr1775930f8f.3.1729057899920;
        Tue, 15 Oct 2024 22:51:39 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:98d9:e1d9:9a9e:88ea? ([2a02:168:6806:0:98d9:e1d9:9a9e:88ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf8313sm3336774f8f.66.2024.10.15.22.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 22:51:39 -0700 (PDT)
Message-ID: <2ae8006f3cfc40ae66b34659365596ac8507d1da.camel@gmail.com>
Subject: Re: [REGRESSION] alg: ahash: Several tests fail during boot on
 Turris Omnia
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, Linux Crypto
 Mailing List <linux-crypto@vger.kernel.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnaud Ebalard	 <arno@natisbad.org>, Romain Perier
 <romain.perier@free-electrons.com>
Date: Wed, 16 Oct 2024 07:51:38 +0200
In-Reply-To: <Zw9AsgqKHJfySScx@gondor.apana.org.au>
References: <1fc4db6269245de4c626f029a46efef246ee7232.camel@gmail.com>
	 <ZwObXYVHJlBaKuj2@gondor.apana.org.au>
	 <38a275a4e0224266ceb9ce822e3860fe9209d50c.camel@gmail.com>
	 <ZwZAExmK52txvHE8@gondor.apana.org.au>
	 <7e38e34adddb14d0a23a13cf738b6b7cccbfce6f.camel@gmail.com>
	 <ZwduxHxQtHdzz-kl@gondor.apana.org.au>
	 <ZwePSPG8aWm6mwKK@gondor.apana.org.au>
	 <15fadc356b73a1e8e24183f284b5c0a44a53e679.camel@gmail.com>
	 <Zw31JIEyh28vK9q7@gondor.apana.org.au>
	 <5db212655dc98945fa3f529925821879a03ff554.camel@gmail.com>
	 <Zw9AsgqKHJfySScx@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1+b1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2024-10-16 at 12:27 +0800, Herbert Xu wrote:
> On Tue, Oct 15, 2024 at 07:38:27PM +0200, Klaus Kudielka wrote:
> >=20
> > So, I applied the TDMA-disable patch, and I saw the same errors.
> > Then, I applied the printk patch on top of that, and here is the result=
.
> >=20
> > Not sure, whether this makes any sense...
>=20
> Interesting, I think this shows that the non-TDMA path doesn't
> work at all :)
>=20
> Can you apply the TDMA-disable patch, and revert the asynchronous
> self-test patch? If it still fails, then we'll know for sure that
> the non-TDMA path is simply broken.
>=20

Just to be sure, I checked again:
- Plain 6.11.0 -> all self-tests PASSED
- Non-TDMA patch on top of 6.11.0 -> ahash self-tests FAIL

I tend to agree - it was a nice try, but non-TDMA doesn't work at all.

Cheers, Klaus
