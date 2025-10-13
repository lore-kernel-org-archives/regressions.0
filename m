Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428EC145B3F
	for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 13:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760363555; cv=none; b=Ld5B/TCAMccWYsce45hGLn4sVBBRetVkUutMcwnHVaP5CgnmhFMgfwpbLSOBnydycOJh6a2MGZi6GJIlJF/vYoObn1TdrgQFRVFekZ/HuX6Hp8Kr1Hv9apFJbF++44VZ32TLJHZm5btP5m1ROkQowX/r+a6jJ0v+FX3pnURPY5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760363555; c=relaxed/simple;
	bh=Z9lQqraCfSs8f8OJtdgQ5fBDCz5Q96ENSKPydfYdvks=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GIaP/z6nMEqrOsUXhpoKhLJihAQ+JRkS8wbY0bpgsXK4mBoh7hxFE09zr+sVVtvf82wMLMxR7r2xgn18eaNLOztEcJ/AQCsXy5SpEyzJS1fLk+IClJIVsjSYGJPDLj6aofmdeRMaHIFs9YEfvxUP4N8KgqRT/USFXGUtTrY0jos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2h3Vb+Q; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2h3Vb+Q"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b403bb7843eso915829166b.3
        for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 06:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760363552; x=1760968352; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9lQqraCfSs8f8OJtdgQ5fBDCz5Q96ENSKPydfYdvks=;
        b=d2h3Vb+QN5EcNO4Gdq0WIUz2LQJayPisUu/XLYtwNthQib7igkE0XCb10ozl4mG8pU
         oxYMtZzEbKQvpdztqsWo/VxMZqUIJwvwzQEhc4uJE+7yx662i8BQ2xv7zpUbIPx2alEa
         Ygfqzf2ZkUjBLPTAzGu9GjQQJ0EXataMUXmzBe6jXSmlray6gSb+SznEufBU68wMzJs/
         3ejXLB2h/k2KfJQOOo+2CrCqzmJwsiGnsOMbT0zg8hoLrUvSB1yRNDvo8cXMqz9rAZ7+
         q6HB1lN20jatcfSTDliB3yjPTxMqFGTrdJdeqFhBN1lFqxsRhUzigfwaxa9Q3zDyyANb
         fkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760363552; x=1760968352;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9lQqraCfSs8f8OJtdgQ5fBDCz5Q96ENSKPydfYdvks=;
        b=EL0+4nXK1PPYJw55n0cP72UqwRr1A01k83bLfMtjZXLWYiVBWQab1stq/eH8BZ7N/l
         xWaytFZbZBX8OSs3+QSzjRElR0hAYCH4un04WCr6viQIX9/trcX51qyrZbn9eel82Bey
         SFMGfLZUBJJXXihdkrzii/Ih9sTOvzr4I5vjKHE/ErmhVBhWNDy2hAwN6nrv3um01VAj
         ZunX/TRsnbW1hx0IZPE0Z8XAAwS+IGvBDCR3kOGHW9MeDX1wCvDHqA0yaU0XShmClhhH
         AS5Q5XxRgH6ae3i0869qVLklgog1sgq6AzHvmiOigCEMxxgMXHv0v15hGjRSTk0BaA22
         b51w==
X-Forwarded-Encrypted: i=1; AJvYcCWbkwrvTltokrj51U1yUnFRZ3zoiZbYzlvwooQ2NpWnEM4fDxIFBPSczjxDKquQKJy7hFvaMBSWhXjZ7g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6s6i8RpDe3gykUUMjZkuuSA3r5CbYAMweDqxDOBscSO/UNXK/
	NspmWWO5KldgrcBdwqeDpx7GhDARZ3W3kGWBKxc1I7u5xurXfNWODtVAWSbUZeA/zy0=
X-Gm-Gg: ASbGncvCj7aBqysm5M+q+fkQc1EH3jtdKjbM0peRxw1rEogLQnmupQUTBoLncNzCRRY
	UZt4b3AsVPcYm4SDXwAThfOiUGraIrWx26sDDt6Lg4yhErol/SAQg0nb9J4leB0XabPn1c2yCNi
	9Um7/y3Wz1PdHgSztmKL+yulK91F/9HQvyPQQXHr7ZfoB/QTJKKZYSORzfVzWOA+374HyDXHBmb
	b9K21EZO93Mm4AnrqFTprRcW5g7L7g4ofB69fa5QS8NDOegavVpqsGUlY8Al7hS2JWySbwrDQc/
	bxaflH/msxbpjbSDkC5GKHucO/ff+q9WagyLvVHeW7MYL/0JR3/lAiZMAB4mTpnSxYUmAK5hcgj
	SWQSO0KkZXUVQRH8kwGq4S1JSuR7c5dYMiaNODyGM+Lx9tIhyp34NBpduvAtUN7B2vWStjT76pU
	yYi5Syix1O79af
X-Google-Smtp-Source: AGHT+IEVC8MF7la4ICpCPkAJKhW4v9pLS7PHTEzNZOLI9i2D6vp8ilomZ3/m59BW+gshkxQ8RY9Hpg==
X-Received: by 2002:a17:907:3d91:b0:b3f:cc6d:e0a8 with SMTP id a640c23a62f3a-b50aa99e1d2mr2514892366b.17.1760363552264;
        Mon, 13 Oct 2025 06:52:32 -0700 (PDT)
Received: from localhost (91-139-16-234.customers.tmcz.cz. [91.139.16.234])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12cecsm946177866b.53.2025.10.13.06.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 06:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Oct 2025 15:52:31 +0200
Message-Id: <DDH8SR59EOOP.1MZ5EJ6PQWFU6@gmail.com>
Cc: "Arisa Snowbell" <arisa.snowbell@gmail.com>,
 <linux-usb@vger.kernel.org>, <regressions@lists.linux.dev>, "Niklas
 Neronin" <niklas.neronin@linux.intel.com>, "Michal Kubecek"
 <mkubecek@suse.cz>
Subject: Re: [PATCH v2 RFT] usb: xhci-pci: Fix USB2-only root hub
 registration
From: "Arisa Snowbell" <arisa.snowbell@gmail.com>
To: "Michal Pecio" <michal.pecio@gmail.com>, "Mathias Nyman"
 <mathias.nyman@linux.intel.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com> <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com> <20251008082055.5646dadc.michal.pecio@gmail.com> <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com> <20251008130532.49922d58.michal.pecio@gmail.com> <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com> <20251008223406.13f16f19.michal.pecio@gmail.com> <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com> <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com> <20251009131444.2c221922.michal.pecio@gmail.com> <90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com> <20251009152703.72e780b4.michal.pecio@gmail.com> <b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com> <20251013092250.699bf60f.michal.pecio@gmail.com> <21741b98-4844-4218-8bd9-10b8bf5cd869@linux.intel.com>
 <20251013100424.42d5b9d2.michal.pecio@gmail.com>
In-Reply-To: <20251013100424.42d5b9d2.michal.pecio@gmail.com>

Testing probably wasn't required but I am running this patch right now
and it also works.


- Arisa
