Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294799;
	b=W9CDp457PmJATFXxop6AxwmF6l41MufCRdOI19Rj6wgw5QnDqlwkmsPf6IPxhF+IZha8
	 nLkC6YBx4h+KelKO/ab2E1yT8L/W151sNN0AykUbHGsqA2Sgsh6KEbpHyKVK9e3pEgUMv
	 R4YlL6v9Nk6qbNunoHtxnNqq3Lt5tgzcfJG9FDe5lZ9RK0KeHHV592HSJ+ulOtAXiygtE
	 HzaLnjIHtR4joQyG5PCFC5zvMNjwJ5e+Xv7Mj0PCwou9mcVg1A9Jjs2y4dNN0tikIN8ZU
	 Lbep5iwSWLGuayPp26+/lRMoiRTFe9sslc7RQbdsdiIECSs1i5LNKerEzYmjwws0Q+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rNw2ecWt+pedjRV7G84Ccjw1Wl3MuYIFanxv93/iz/o=;
	b=r0ZBCbVzUv0vQZTvp95WCmA0xz06JtG3u9KsXyLDVJfRgxrOjlzbu4W4J0o5yHq9t1VK
	 dSXjdnwCfCyKxpq0kbYP2SyvDqzCx6azsUH/Oq71ZBsPa3BdjsJF0GgQ7ebJ+CMONmMf9
	 EbFV7068tesJu6D4jSskMvU2WegfIUk62WSCUWxT8u07kqw7K8QF/7tNzdC2jvsQ+qq38
	 DOQuNJblgR1pKblB5NfgDF7Uxvz5G63M4WDHy+AGskEeo397TfymdHo/pXeDycIZdw2/z
	 SdmZQILJU2hr/S+bbrNOGWVgrJbMbBv82PufaGlrKa5wMaN1DVsMcQvgEbHO9l1xjNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=pksFmcKQ;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFCE606A334
	for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 20:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BFCE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=pksFmcKQ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3282db206d3so5975449eec.0
        for <regressions@lists.linux.dev>; Sat, 21 Nov 2026 12:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795294797; x=1795899597; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNw2ecWt+pedjRV7G84Ccjw1Wl3MuYIFanxv93/iz/o=;
        b=pksFmcKQMnqG0pnsDe1H+Ng9TDCdn5W0fPn1RyyLBky5yFtdeR2O31u91OSaLDu6gP
         SsHA82Zn0/jcY2omJnNW81y4pB8qDAA41b8W8hN1dPfKd3hUR6BFtcwnIVtEtdR1dltE
         b+3DQS8G84B7FWN+6GST1TlBpLaj21FeCObXMvU7pAhWJw04xJ98C9OQQCE/MCllercq
         IhOPGoLLbGtR2sEGxiKiQZ7u+0xt+cxPAUWvOc5DGeov8BIgUepQGsP12v2k5pyGGSaP
         29Af01sxk2kt+ozvcylD0w1l87OyPvmmQZjvOM8QfwMJa2PF/hgLcUOiyy+slXHBQHeG
         FNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795294797; x=1795899597;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNw2ecWt+pedjRV7G84Ccjw1Wl3MuYIFanxv93/iz/o=;
        b=OX/92ISE83Q9WygDIHnCSZeFB4DjoAN37WrZuADzz+4H4kdmmPm6jbyv0IyJLAj1FT
         nT2z7D0zoal9W4zlLZ2BgyBhCCJzFy9S2PkUg6FZMfl7PDBQHw6/XPW4wS9QGwFI2xMi
         E5K8h0sJOg8c8+PAUBVFXJ3XW/Gx/UOeU+R9p+1NpXvOtHEJGnGthMFZFmMxmdIrJwza
         cZjsrZDdmKkefwazOUyZCiLKz8qP0dBeseg3tWpa2qSQXVDpQtz+yFE2kIpeGhHEwy2O
         EoWdeLbaf8yMAYbQNmBiwD8sZPt71D0H/Q8WwDQ4fbEenH0OXOgN/wzauqUnQase5nlV
         vO3Q==
X-Forwarded-Encrypted: i=1; AL+hErGEBkTr5wO8qR5ZaJP9HR5xfDtx7lCiUo5eKgv6tH0/aPGlxnGg0D7ZD0jc3FpM7x0+gtojMTQITudbWg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8r0L7lWSXhd/IM3S1/TXr58PYOB90IfV/pUMzbYXCbL7EZ6sOA
	MD8UcO/HNDRQzhk+FNTeL/HBsxJAk0S1bl3OH7fWBGt0mVe1lLMNrwcA71xdotcZkKk=
X-Gm-Gg: AZFdTZdd/QrOntzyWhHec3b5AbtHsjOxtsRMMSsNXazNY7eFtzD9bDlKBKoWGYlSwJD
	UqY51BTpXLnsYSFmfVA1SHoObcRbOWx2+oMeT2qWmFl4/wl9hsBa+iDejZXwHfaLn265mrFZo7J
	Yw6CXf6JUV2XFDor1ESOSsA7S+WgsPX+qEQIlrqVKdUOon6xC6xNiBe7HoGQCRL3eX8Ubo93Pq2
	IGkQpkhbFgW/W4/Rce2vbJpbO+yBE39UKz9asS+3ofKyswODUnbnJyTJUHDzHHSXRBK8ZDi+u4q
	9faxXofTmIp8iL/gohcsWcldaMUZncogXINYooAu0clCS/PsM9LGzBkAD0KlphNDQE6DNi1Wrai
	4MEIGaZISAwstdoIktoungO/A9Fo36EdEZIAAK4LnL4S6JeEfAd416GCsD95Ftd+GzjgTAdcI1G
	xFOM7/7Pl5895g4zPGz3kmTSs8tKtZ3sPiQewm4+qutctfxuFGD/tYl7CGOw/BVGUzO20TysCWa
	CIlzP4ba8s8I2hBZumfDLNg8oB6zvW74ZSUGsvazavTCKYamrAPTlH507xKcDqv0z6KaA0R0trh
	rES0Sj4oWrlbNsvln4xg2Apsccjad/62R41jfvyzFei+KW9x6Aq12hxG7DRAE5TexHbdP6Mtdxt
	hw2W6EX46m+Tx0soQCTaLzaF2AiJGTR5CSMkUCm17IkBKXRVQ
X-Received: by 2002:a05:7022:b051:20b0:1b4:e533:ff50 with SMTP id a92af1059eb24-1b556912ca9mr7773791c88.40.1795294797090;
        Sat, 21 Nov 2026 12:59:57 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm16445888c88.1.2026.11.21.12.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 12:59:56 -0800 (PST)
Message-ID: <c4da472a-1f3f-4676-95ac-89a4a3ce4a4a@kernel.dk>
Date: Sat, 21 Nov 2026 13:59:55 -0700
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ublk: dispatched IO intermittently never posts its
 fetch completion (v7.0)
To: Luciano Lo Giudice <lmlogiudice@gmail.com>,
 Ming Lei <tom.leiming@gmail.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, linux-block@vger.kernel.org,
 io-uring@vger.kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org
References: <CAFS5DSFUi28HgX8t5bRRGVqPkOZ+VqrP+LtyMiwPQhyRpTxFTg@mail.gmail.com>
 <556c4720-0159-4874-8d5b-6379566f6d4a@bsbernd.com>
 <CAFS5DSEhgk8fJgAwEn+-U-7vnBchCrx6L1uReT3Upm+AA22=Wg@mail.gmail.com>
 <CAFS5DSEsdz8Eu1vmeCkE+6eeXgk+9yS6EwqyHSeD2jkq90DZaA@mail.gmail.com>
 <CACVXFVPEaJ6oPOaoZZo_XMpywHCzFWSYCrKG=srEDpCqPRp=Dw@mail.gmail.com>
 <CAFS5DSEp13YPLwRut2OiQfQqO70s6whbLWmEQ14mt8_JjBfBRw@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAFS5DSEp13YPLwRut2OiQfQqO70s6whbLWmEQ14mt8_JjBfBRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/26 10:52 AM, Luciano Lo Giudice wrote:
> Hello Ming,
> 
> Thank you for confirming the apparent fix in 7.4 as well. Do I
> understand correctly that no fixes to address this problem will be
> backported to 7.0?

As Ming said, 7.0 is not a maintained stable release. That means
no further 7.0.x releases will be done, and nothing will change
that. Also means that if you're running 7.0.x you've been missing
out on a lot of fixes that have gone into all stable releases and
upstream kernels since then.

Just get on 7.3-stable.

-- 
Jens Axboe

