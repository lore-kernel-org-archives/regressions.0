Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDD8153BD7
	for <regressions@lists.linux.dev>; Thu, 15 Aug 2024 22:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723760487; cv=none; b=Fr2+r77e2WTF1g2TJuY+ECguLmJpUFx/9l5uH08RW4IuraeWHOVD32qmilIWCDtkObWQW6XVVDenGxAw7YQgPErnNfJ5KDPL9KHyMJhgVX2bWmUyNQm73pS6ei52s6YPoQWlYbsAZXu9MnUhvthIfRaZ+h6zCZK6ShbVti2275o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723760487; c=relaxed/simple;
	bh=AcXUrrXWVBnmrshWyGJvD3/mwG2J33jsAudWwlxT7N0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p4b7Qe5TkWKZMq14tmPqji5ZurVh8iMfcNvGff7iKSqtwppV2XFfhunkkPis50jndMzzhAmA2D5o4Sq0f82q0t5+DA1dqO/8fYhU3NbPzzzf8xl+UDbGKFiFh2KhnYrEOr7CaIlkVBrSMbQTclsYYGnHTnsxGDiwXZgmFDWMoP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name; spf=pass smtp.mailfrom=intelfx.name; dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b=Dgp/kz1Y; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=intelfx.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intelfx.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=intelfx.name header.i=@intelfx.name header.b="Dgp/kz1Y"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so9270025e9.2
        for <regressions@lists.linux.dev>; Thu, 15 Aug 2024 15:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google; t=1723760484; x=1724365284; darn=lists.linux.dev;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AcXUrrXWVBnmrshWyGJvD3/mwG2J33jsAudWwlxT7N0=;
        b=Dgp/kz1YAAvB9R/HHqQqJhcBDNH07tbL0DFNOWzIXJgPNQDTkJ+2ciBOJbdT2H2qmN
         IiQlr6XyFD9HKmjQ9Dojvsm81n2zFaJ9kErJBVFxo50+AjHNppcKvw22ogX0aSdaAzJr
         NyMYH+PlYXF8ZR1A+xIJTQ++lLM90pFJYQHME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723760484; x=1724365284;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcXUrrXWVBnmrshWyGJvD3/mwG2J33jsAudWwlxT7N0=;
        b=keesznEQl5nkQNJah/WsEZXY+g17kagSdEiNn6EfGveNK16lJdU1V44pa02+i3Wcq9
         mzOfH5rA+HwINgGjtnmkCKkGdN8ABvALtg9OPTLhOO/5Et/2OMz1TnoIV9honiUGYvrF
         lRZgjXHhOpdK2D6fexvGiN9SK+GEZ0iLlMm7lVRTv9zwnztdEatW8QpZ1ahIEII77nH5
         /N8uiv8GV65dxJKof4xr6ns2GqIg5QN3wmZTqlotEH6xG8VUjqCRyrGoSUB++zwiPIFM
         6RsquAtCgyxN6x5+tzE0+bDm1PtuMfXLTRQPaGbpqXfC5ZLbYkZpPv8HFXliz/ARZlPA
         qhnA==
X-Forwarded-Encrypted: i=1; AJvYcCXb6e/hrcY1Xvs5MedgqQCFx9lHv1xZZo8cIFUv18gGrh6BRZ5I/g7r1UG0Arp4XHg+psocvFGmwUrT3Kmeyc+zngz+FXhnuVK8g9E=
X-Gm-Message-State: AOJu0YzIHha7CXo3bJAgugRuNIWKzNPFRphL0DfqR9j6aa5oAkXKSohk
	XFJcFEH3s4/E/d6llKOfEkfWiDpK5eGIWMZAQNYVRCYGyF3Wvmx16eQrImMjg1s=
X-Google-Smtp-Source: AGHT+IFZiXzy5v8BpOcQa6CPapu9yZigbtU1YiTee/Yk77ApgvfAnMubjh+4+GM9o8FBfTOKivIvfQ==
X-Received: by 2002:a05:600c:5103:b0:426:5cdf:2674 with SMTP id 5b1f17b1804b1-429ed7a5f52mr4870645e9.4.1723760483820;
        Thu, 15 Aug 2024 15:21:23 -0700 (PDT)
Received: from able.exile.i.intelfx.name ([109.172.181.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed4a857bsm5891885e9.0.2024.08.15.15.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 15:21:23 -0700 (PDT)
Message-ID: <3df4acd616a07ef4d2dc6bad668701504b412ffc.camel@intelfx.name>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted
 increased execution time of the kswapd0 process and symptoms as if there is
 not enough memory
From: intelfx@intelfx.name
To: Filipe Manana <fdmanana@kernel.org>, Jannik =?ISO-8859-1?Q?Gl=FCckert?=
	 <jannik.glueckert@gmail.com>
Cc: andrea.gelmini@gmail.com, dsterba@suse.com, josef@toxicpanda.com, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mikhail.v.gavrilov@gmail.com, regressions@lists.linux.dev
Date: Fri, 16 Aug 2024 00:21:20 +0200
In-Reply-To: <CAL3q7H4iYRsjG9BvRYh_aB6UN-QFuTCqJdiq6hV_Xh7+U7qJ5A@mail.gmail.com>
References: 
	<CAL3q7H5zfQNS1qy=jAAZa-7w088Q1K-R7+asj-f++6=N8skWzg@mail.gmail.com>
	 <277314c9-c4aa-4966-9fbe-c5c42feed7ef@gmail.com>
	 <CAL3q7H4iYRsjG9BvRYh_aB6UN-QFuTCqJdiq6hV_Xh7+U7qJ5A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-N9kYIbgMAIJwZYJIoizC"
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-N9kYIbgMAIJwZYJIoizC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2024-08-11 at 16:33 +0100, Filipe Manana wrote:
> <...>
> This came to my attention a couple days ago in a bugzilla report here:
>=20
> https://bugzilla.kernel.org/show_bug.cgi?id=3D219121
>=20
> There's also 2 other recent threads in the mailing about it.
>=20
> There's a fix there in the bugzilla, and I've just sent it to the mailing=
 list.
> In case you want to try it:
>=20
> https://lore.kernel.org/linux-btrfs/d85d72b968a1f7b8538c581eeb8f5baa973df=
c95.1723377230.git.fdmanana@suse.com/
>=20
> Thanks.

Hello,

I confirm that excessive "system" CPU usage by kswapd and btrfs-cleaner
kernel threads is still happening on the latest 6.10 stable with all
quoted patches applied, making the system close to unusable (not to
mention excessive power usage which crosses the line well *into*
"unusable" for low-power systems such as laptops).

With just 5 minutes of uptime on a freshly booted 6.10.5 system, the
cumulative CPU time of kswapd is already at 2 minutes.

Regards,
--
Ivan Shapovalov / intelfx /

--=-N9kYIbgMAIJwZYJIoizC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJJBAABCgAzFiEE5N8nvImcx2nJlFGce94XyOTjDp0FAma+f2AVHGludGVsZnhA
aW50ZWxmeC5uYW1lAAoJEHveF8jk4w6dliYP/3SLMKaoIMi8wNJiZRY/ENITiwSe
toZK1Q70t6onLZcxpjJ+5HqlAuTWyufHx5+o18oqlSgLSWDM8U0fzWJlcooeoQtq
okW1aiU49gLaHjpP8W0dJO/3ECMZkZ3LMv79qK5xiirAUMuQcs/Q9FBHZlKyF5rB
jW+Abg4ShIm453X6mVYJUYgouigTNQwMTSIriagtd3pOGQ8pTyXAoJT4JLhGrvhk
1oABDcKa/y28ryjP0KznEjOPi5EEi/7c4UQZ/dxuIc88lAQdTu8bBFTtNvoEU4sO
LOMFOOjVt/4tIskK56VSHKC/V+u2mDuab6WE+uN6QCHKj4KJoJb4JMgIA7xM/MPX
81fMnc+2EYHaYP9Kx1RIU71uTxRkE/W9tAU+s9WOG3jiGXMsS3d2Z8pkGUkyoW6H
2Nv8q1T249rVduFAL4jV7M7zfWQ4mt8uNz+KI1hV8eblZXFBLHZ/MfJiCKhXeVcn
Jnc/+4bU052iEyzGsoERZnrs6qptexrWWHPap1BOB8gpAQq8/YS/y1A5xQheoDS4
AvRIWr04xMNhpMLQAeKwzwr03Pn3jFL7U2kXYVNJjU44A2DBhZsHA+HLgJhkQTvE
Ez5pOrkx3GQf50T3L38bheQdRDGZVojNyoNdSYdcS++jxauHGtoI2MqmGLryMc7V
NReL9QhNRCUKP/sf
=yxbx
-----END PGP SIGNATURE-----

--=-N9kYIbgMAIJwZYJIoizC--
