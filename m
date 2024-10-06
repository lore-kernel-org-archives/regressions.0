Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7C816130C
	for <regressions@lists.linux.dev>; Sun,  6 Oct 2024 08:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728204465; cv=none; b=YkwMXRMY4EpGvgXjHhswVn9WdWxPBPZriNL/O64yie3UdoHijoPiBQ3V3BzDRQt5d/PdEEwG5rdCNm8w8cabSWYwO4sjsV6kcgu7Yd/aWzqHRbyU82g5ELQxj2nro7cDmHC6SfSLQn53tD0LE3xxjgwgvBwPcGfEuo1yCHnrPPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728204465; c=relaxed/simple;
	bh=VefKXn4256AekPAE/FKsD4k2x/jTt3+ChOBib9JanGk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ksz3deS0X4CrlhZTB5kXMV7FfDIqqtuIoSKeZulNFwNQ60VgH4hMXRVjAfHQFn9xR0oSPSp3yfPY05uLSti0HEs8uZ0jny7BrJ9ROgxk31hJrSPDkmRcTPedon94kmhRZqDEk3mq/wRkm2yE9Tx0CRAapRyBM4X+Rg7ZTGpbDTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dW+NMf/f; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dW+NMf/f"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso34247425e9.2
        for <regressions@lists.linux.dev>; Sun, 06 Oct 2024 01:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728204462; x=1728809262; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NJHEoXsWN5hyUxajNYzXjn5PZ0HeusIMUN5+ZB1UWo8=;
        b=dW+NMf/fromSkwIMlQ9FBBPqoacrHbvpYP8FZwJWzsWwb8S8G9r2YDHb+mHx2xu6/N
         Kjc/KGj9k0D6KWeDXtJaPxn6qCzUA23BqQUoG/NvHnFSMUWFzOB2PvCK4qSt4CaFCuEV
         acfHyo+sc7g5cslJg/fILsfwD5WJfPDqkdHRQ1VP1m/NVn4yGAWiZoVxmW2keTbb65v7
         cgxrYcNMTCWYHq0uDYYcXv9o6+rGqPXbRVbGKB6YeOI1w22nNfhyWT31HeIW/U2J3eQQ
         MS66PT6H1xBZa8wku0kLrfSOxCbLcp5fPgo8BzkUqwb/QLoK7ietGlt2wSEmNpfA+sI2
         M9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728204462; x=1728809262;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJHEoXsWN5hyUxajNYzXjn5PZ0HeusIMUN5+ZB1UWo8=;
        b=IC+h45JWfhNRpus6t/SaYZ6+bSTJDzz2wFjCbaY2dUwBW6U10eGpUM9335c6qxE5Bf
         mNgBxf0ysPcj0Kw7M80Y71qqWpXC3muqCDjsxceJG/1gR+Nu02JIVnUOIY30BoEanvgR
         Aw5jQbX0huL30cSxItJPb1gYEE9cyGylyiN0R4NIkIvEHA0V3I+Bka20yPsjer/Gf6co
         6u8lTRtzTjRTH0EEFTleXDF1c4vyGQ/1nCWU+R13GvydlxZGxMkfTZgfj7zK3/Ez0oJB
         P1Io7+Br8UaQEQelay1mkgxNAimOzRgMFDsolgvKr7QzTlZkpKyWrzk3HLKE4ixKG14u
         GR2A==
X-Gm-Message-State: AOJu0Yx4BSVJOkyqswDeP5Vzn8ZDb9u+4+i1NqvEDO1yB0s9sto/t0bs
	1K4nGwOGi/G15LIslTR8/gW4b6cWZhbOQ0MD5I6CQ8fhgLMtyXbFTvYGWw==
X-Google-Smtp-Source: AGHT+IG1iyqcTvXYAHKq0HImvyLzS5elsP3aE7861jOtnTLfHBwZjkPtP5/uG1FQ/wAoq9QCzu96Rw==
X-Received: by 2002:a05:600c:4e86:b0:42f:5ca3:d784 with SMTP id 5b1f17b1804b1-42f85aae76dmr69458895e9.14.1728204461792;
        Sun, 06 Oct 2024 01:47:41 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:88c9:84c7:abb8:5637? ([2a02:168:6806:0:88c9:84c7:abb8:5637])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b4acddsm59245735e9.44.2024.10.06.01.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 01:47:41 -0700 (PDT)
Message-ID: <900b7ee9e96e38b0d3cc088f3c6040be0915464b.camel@gmail.com>
Subject: Re: [REGRESSION] alg: ahash: Several tests fail during boot on
 Turris Omnia
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: regressions@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>
Date: Sun, 06 Oct 2024 10:47:40 +0200
In-Reply-To: <ef7c7a96a73161e0f5061503242a8d3eddef121f.camel@gmail.com>
References: <ef7c7a96a73161e0f5061503242a8d3eddef121f.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1+b1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Some more experimental evidence on this.
I just evaluated the "selftest" status in /proc/crypto after boot.

I looked at three versions, each with 5 boots.
- v6.12-rc1
- 37da5d0ffa7b (the culprit)
- 96ad59552059 (the parent of the culprit)


v6.12-rc1
=3D=3D=3D=3D=3D=3D=3D=3D=3D

Boot #		1	2	3	4	5
--------------------------------------------------------
mv-hmac-sha256	unknown	unknown	unknown	passed	unknown
mv-hmac-sha1	passed	unknown	unknown	passed	unknown
mv-hmac-md5	passed	passed	passed	passed	unknown
mv-sha256	unknown	unknown	passed	passed	passed
mv-sha1		passed	unknown	passed	passed	unknown
mv-md5		passed	passed	passed	passed	unknown
mv-cbc-aes	passed	passed	passed	passed	passed
mv-ecb-aes	passed	passed	passed	passed	passed
mv-cbc-des3-ede	passed	passed	passed	passed	passed
mv-ecb-des3-ede	passed	passed	passed	passed	passed
mv-cbc-des	passed	passed	passed	passed	passed
mv-ecb-des	passed	passed	passed	passed	passed
crc32c-generic	passed	passed	passed	passed	passed
sha224-generic	passed	passed	passed	passed	passed
sha256-generic	passed	passed	passed	passed	passed


37da5d0ffa7b (=E2=80=9Ccrypto: api - Do not wait for tests during registrat=
ion=E2=80=9D)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Boot #		1	2	3	4	5
--------------------------------------------------------
mv-hmac-sha256	unknown	unknown	unknown	unknown	unknown
mv-hmac-sha1	unknown	unknown	unknown	passed	unknown
mv-hmac-md5	unknown	unknown	unknown	passed	unknown
mv-sha256	passed	passed	unknown	unknown	unknown
mv-sha1		unknown	passed	unknown	passed	passed
mv-md5		unknown	passed	passed	passed	unknown
mv-cbc-aes	passed	passed	passed	passed	passed
mv-ecb-aes	passed	passed	passed	passed	passed
mv-cbc-des3-ede	passed	passed	passed	passed	passed
mv-ecb-des3-ede	passed	passed	passed	passed	passed
mv-cbc-des	passed	passed	passed	passed	passed
mv-ecb-des	passed	passed	passed	passed	passed
crc32c-generic	passed	passed	passed	passed	passed
sha224-generic	passed	passed	passed	passed	passed
sha256-generic	passed	passed	passed	passed	passed


96ad59552059 (=E2=80=9Ccrypto: api - Remove instance larval fulfilment=E2=
=80=9D)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Boot #		1	2	3	4	5
--------------------------------------------------------
mv-hmac-sha256	passed	passed	passed	passed	passed
mv-hmac-sha1	passed	passed	passed	passed	passed
mv-hmac-md5	passed	passed	passed	passed	passed
mv-sha256	passed	passed	passed	passed	passed
mv-sha1		passed	passed	passed	passed	passed
mv-md5		passed	passed	passed	passed	passed
mv-cbc-aes	passed	passed	passed	passed	passed
mv-ecb-aes	passed	passed	passed	passed	passed
mv-cbc-des3-ede	passed	passed	passed	passed	passed
mv-ecb-des3-ede	passed	passed	passed	passed	passed
mv-cbc-des	passed	passed	passed	passed	passed
mv-ecb-des	passed	passed	passed	passed	passed
crc32c-generic	passed	passed	passed	passed	passed
sha224-generic	passed	passed	passed	passed	passed
sha256-generic	passed	passed	passed	passed	passed


If I interprett regzbot history correctly, there was already one fix applie=
d on top of the culprit.
But e7a4142b35ce is already part of v6.12-rc1, and obviously did not solve =
my problem.



Best regards, Klaus
