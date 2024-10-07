Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEC71DED6B
	for <regressions@lists.linux.dev>; Mon,  7 Oct 2024 20:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728334629; cv=none; b=kOe8jx6RqIjAyblHMvp2jVllGWcH6m4a+vu4VS/PEQz2u96KyTvnuX/F9yFS+/ejrdZ+VfNFRbwQNUa7OahzsskZXe4fCzFSTaTFJYM7PYb8L+GQ0qxhq2/eqB6Tmycr62YugdY+RGvuU/J1WlyNp5lyQ5nibLh+7+7Nh+M7D9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728334629; c=relaxed/simple;
	bh=wBttk45YYdLCTY9Y4llZCM/p/0fj5uFII6lbG3KCAlU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X8rE+fyVlgDrInPfvHkndfhEM0IEQT40ORBQRFq8orhMaJUekHqFGxZa+3RPQVwHCzXeadtUwZWl7PYhask3N/b4SesjUNxQUXzo6n7dL2/ZgLo4BWcXaBlDMFv0bMzkWE8EeJNQwITise+5o2WNCVl0HEaeYWu4hMypcpDthRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0wcuUQW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0wcuUQW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso49593445e9.2
        for <regressions@lists.linux.dev>; Mon, 07 Oct 2024 13:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728334626; x=1728939426; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wBttk45YYdLCTY9Y4llZCM/p/0fj5uFII6lbG3KCAlU=;
        b=h0wcuUQWethRzzt/ABMtQRRDRtHKrevT5tgR6Asiylsd9KyTF3V93hbNohO1nqJG70
         wU6yQI2ipj5XDFTYxTLQ70hNFAawhswybIUq3pGoC9NZ6gULKahEftHX34hp7xaP6Dpi
         9yXjgz2iJB63s2S1e5SUMc4+wcNn0hSZR4YQBf6RGyYIfqYmCYQRJXg/VcNhXRPG+boY
         fX0XDl82f5ASViM80aWxSW1hwJlMAfTEnHf1KJd14wyDD/BUrFFzUAj18lVU2YekmAJo
         x8qoSjlb9DenWjuDGcoDfHIsYC0a+1FZaMSBOb5LlNXa3pNmGfFDWvGzqynXHsTPt5A1
         IhHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728334626; x=1728939426;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wBttk45YYdLCTY9Y4llZCM/p/0fj5uFII6lbG3KCAlU=;
        b=QbLKaU7zIyWwwPmmyD9N3GH9tCkbhom/tyECePKQktRRtGJygAGC8CI1g69Zz+xwly
         4TCTjBSxKyEk/LOGaCpbWPTFUPKaNyAhOX0kvAfZC6C9Wm754CmWa8TQ2kc9BL5SC3F3
         xsBu/z5sNgLQt5QHk43BeCpQuQkboUZYdv+/amoFcro1ChtCh/BLedYl43BE3oUf8m06
         bedY4I6AOweKvvYxdfPFVQz8cEuAWXZ8J9EQdRv/BXDHzlBl7FXIMJ621rHO14/EP6vy
         cI6Fff69Vuis4fA1+bntjgvB7eQ66OsWKW4CpfDLNYMUoBRDfUB6lr7ovh12UBX9jJF0
         LtSw==
X-Gm-Message-State: AOJu0YzyMW8bBFLaNKGxGrSzyTNsS9gZzEey/8PFWAttVeN0/pmlJCTC
	H3LezwK/V9UMvjl/LCg9lgMofIfQFHmUWgKfIkSBnJDvUayRP3Q9
X-Google-Smtp-Source: AGHT+IE7rA8so9eZhPhtCaaBVGih6XRy6e/WoLDVSBbTQmKsjmosJ1tzAUfVgshUqQwXRl8skik0LQ==
X-Received: by 2002:a05:600c:44d6:b0:42c:c401:6d86 with SMTP id 5b1f17b1804b1-42f85aea06fmr93438605e9.27.1728334621763;
        Mon, 07 Oct 2024 13:57:01 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:55c3:7d48:ce29:8f59? ([2a02:168:6806:0:55c3:7d48:ce29:8f59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1697024fsm6460391f8f.95.2024.10.07.13.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 13:57:01 -0700 (PDT)
Message-ID: <38a275a4e0224266ceb9ce822e3860fe9209d50c.camel@gmail.com>
Subject: Re: [REGRESSION] alg: ahash: Several tests fail during boot on
 Turris Omnia
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, Linux Crypto
 Mailing List <linux-crypto@vger.kernel.org>
Date: Mon, 07 Oct 2024 22:57:00 +0200
In-Reply-To: <ZwObXYVHJlBaKuj2@gondor.apana.org.au>
References: <ZwJUO5Nz3S7EeqO6@gondor.apana.org.au>
	 <1fc4db6269245de4c626f029a46efef246ee7232.camel@gmail.com>
	 <ZwObXYVHJlBaKuj2@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1+b1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2024-10-07 at 16:27 +0800, Herbert Xu wrote:
>=20
> I see where the problem is.=C2=A0 Unfortunately this is not a regression,
> but instead we've managed to identify an existing bug.
>=20
> The cesa driver is buggy when you invoke it in parallel.=C2=A0 This
> would've previously resulted in incorrect hashes being produced,
> which would not be easily discoverable (networking users would
> simply retry if they hit this, while storage probably doesn't
> use these algorithms at all).
>=20
> What happened here is that the new async testing launches all
> built-in algorithm self-tests at the same time and in parallel.
> Previously self-tests of built-in algorithms were launched one-by-one
> so there is only ever one test in flight at any moment.
>=20
> This causes the cesa driver to be invoked in parallel, thus
> triggering the buggy code where two hash requests would be submitted
> to the hardware at the same time.
>=20

Thanks a lot for these insights.

In other words: The driver API explicitly allows parallel invocation,
but the driver lacks serialized access to its own hardware resources?

> So I think it's a good thing that the self-test has managed to
> discover this by itself and the result is also harmless, the buggy
> algorithms are disabled.
>=20
> I'll try to fix this but it's going to take some effort and I'll need
> your help as I don't have the hardware myself.

I would be happy to support development of a fix, by testing on my
spare Omnia.

If the above is true, the only other option I see is to declare the
driver BROKEN, since existing CESA users are likely sitting on a time
bomb. Some file systems do use hash algorithms, as far as I know?

Thanks again, Klaus
