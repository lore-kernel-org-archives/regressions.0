Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795225569;
	b=FCwINAs3zVF/bVISIJ2Yde08fRwy4RF7JVTf4gXaVadFLHS3KaJFR9c8qf7a9zGDnJ7i
	 bX/mjL6vN/iYNW2aKRX+lPDP96LENzt2OPTNGqx2gOoHo4YUsG1gFCy0DWUfKslZvrSdp
	 DrJdDoOuotzT9/0hZhvRhPJNINejwll1EXI2cP5Dr2zDsyH6uTW8hYrPtoQyjrv+N7KUb
	 nvjw69KYwHCk6nMFCCz27IyN0LLITNGXwNlHnDHcfUBuw8x9u7SLw3gvljGq+1PvlRD4L
	 R7tuZrM5BNx6iomcqVeFAYINKuKNQrdbU3pqwOGCKgVWalx3uLJe6kxqOfCJkfwEsAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795225569;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=pXIcTl4aGxKY1y3Sv/7qakiKJPc0ii9R0dmFyBolSnA=;
	b=pmOIW52hXzQ6xqEhrCLoKEPtXAcwiEKJZwrIx2ZUeS6q1X8w3yZ7ywCESX+L4RedrtJP
	 xnSqfRKJYMTJxeN6enuIuilTBK+OVPveAb+KUdGhZS1ruF4ADCsHX3q3U8lFPklH1Cypj
	 nVM7vfrYt04cD5UZJcx6dNYABU5m+DmE1GeS21NSYVnmzgv83k6IIva9jKet1WTh2KreP
	 r3kzWNobSu7pyo9cSLXS2mAoLBHhtvEjHfis0C6jUCG5w/1Hq8c2Gwbg1XAneLihFSeTJ
	 QP2sTVZyHSzRugY+zW/hkJu/nHpMhjagNtm+Q4bl6U5cPuMYK9JcbE76yxEfStzFzqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aSincsPm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22705606A336
	for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 01:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aSincsPm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496D91F000D0
	for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 01:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795225568;
	bh=pXIcTl4aGxKY1y3Sv/7qakiKJPc0ii9R0dmFyBolSnA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aSincsPms+qTVHlLXexSWGgDMf5MnjPq1famBGJqUuqRCvMCWeJq47JdrRPyTNzUE
	 ZoZ+kg+pRL3MGIJz4CI78PxnON7Yq2NfsXEv4w/6IVANtmLsrJ604v0wncaYudeFYo
	 6hhpo3Vd9Gfi+RcEORjoEzAnuIAUKjojh+lqNLV78Dh9qg7u/vGC6qC+XwJpuR+zGf
	 Nt0fdUV0vXTzgtx08MylCfiqSnfdki/71USUDLSm9sdWcsZlpxGpIaQ7CGfrQ6sltS
	 YysKxbLyuKqwOu1tIQ0bw4rTIfWlDIjJxBxRGeLwzEIGDtZZiVAWMgLAHAbB62ts96
	 xU0/VkuvcMaHA==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so205812066b.1
        for <regressions@lists.linux.dev>; Fri, 20 Nov 2026 17:46:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGS+g3dxrwAnQrU6zeU7zr5M6/Hc8MWY/m+kytlMN6BZAJpg0zr+9yJszIUkhbMsUlivxlANJoKqo1gZw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Q0i/OpcqiPlB+BXPbqepTRXKxRnmzQye7RKsVbpwwzWYa6hO/
	Oc1dMx8nvlMcIE8o96Fwd6DjyrQca1Q8HztYvKLxzWgVJjLDs2ewf18sZ5YqDHBozKCAe0RG/xb
	SfwYEdY4YpvCmMyRL2TIOzj8zzxBYNGM=
X-Received: by 2002:a17:907:6ea9:b0:c46:645f:cee2 with SMTP id
 a640c23a62f3a-c513a3ab024mr492513266b.4.1795225566975; Fri, 20 Nov 2026
 17:46:06 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <VE1P190MB0877D026E2C3905F0324B46F85782@VE1P190MB0877.EURP190.PROD.OUTLOOK.COM>
 <ee94181c-784f-4f9b-8697-cca5abec6b07@163.com> <CAKYAXd8VV8hjeEqRLJ-HBDA3Dzw9bX45e6dWpie4soeZ8TBvDQ@mail.gmail.com>
 <2a3b2050-76c0-44d2-a5a4-236003247f74@163.com>
In-Reply-To: <2a3b2050-76c0-44d2-a5a4-236003247f74@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 21 Nov 2026 10:45:54 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9XO4X-A+rNsvuehhi-1gaBwvz0C+=omqFnVT_Zsm9-kg@mail.gmail.com>
X-Gm-Features: Aa3M54o5N-SYmHy7MpzLD1unR02bORgYmyLXpo_wA_f7P54pXZcJIo0YYREgCws
Message-ID: <CAKYAXd9XO4X-A+rNsvuehhi-1gaBwvz0C+=omqFnVT_Zsm9-kg@mail.gmail.com>
Subject: Re: [REGRESSION][NTFS] Linux 7.3.4 mounts 64K-cluster NTFS read-only
 after $MFTMirr record 24 mismatch
To: liubaolin <liubaolin12138@163.com>
Cc: "d3nchk@outlook.com" <d3nchk@outlook.com>, "ntfs@lists.linux.dev" <ntfs@lists.linux.dev>, 
	"hyc.lee@gmail.com" <hyc.lee@gmail.com>, "zenghongling@kylinos.cn" <zenghongling@kylinos.cn>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Hi Namjae and Hyunchul,
>     Thanks for taking a look. I sent the fix last night:
>     [PATCH v1] ntfs: limit MFT mirror comparisons to system records
>
> https://lore.kernel.org/all/20261120155021.1618964-1-liubaolin12138@163.com/
>
>     I'd appreciate your review when you have a chance.
Checked it. Thanks!
