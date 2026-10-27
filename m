Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105767;
	b=2KBQqrC2b+awwILzi6tnji5F6AzBzyYzXKj5mzhUIRS+6fDpv57+3GNRFtWB+RYxzUFs
	 8bWgRUhGY2whjr7U3rBpIN0rJ3niFAUKwYpupo9dPwsfuQcRC1foe2UeGberjjcgbq91G
	 kQdIXub8/XQAFhwauOnppRf784+9KdLYCeiKEBmg/dvXqQQF3y0BV5MXX5Q+TXeo4Bwkw
	 xsR9ysjPhQpDXctoxD8moOVwCffnMrqm97ux1hL+wr90if4j3Kwmybgb3r6jONM/M4koI
	 lvbgoYesD67yBSKhDTlurmvEYstftKWE55+BgUyjpA3I23ZKyDdbJblWWCU5XHLG2gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lcXO+Vd8p/zIO/CVoOpxlqwT9gefkkK9PohzmT8jAVo=;
	b=fZXY+uqRvl+A9JR+r/kBF7BBcZkb/53zFtoY6HHB6gEeMBbCdbplb4BRvtG/KvK6OvHX
	 SDW7gUsWTrygRGWDGk9V5umw53h6dknQ1ChtEE+CnH1THwH1CycpmgXcnygsYXOVxZ/2r
	 2Wv33fjAv6VJ6WtA7Yk3VOTpb4qCRnDL7FFslgcofeYD72DsTv9XYHslx/y4gR8Ui0Ips
	 uWJ5wNbmQ9lbtUo91n3e4fdoY6t7J8hdDhDUmT4f8Ak3umpNq9goG7Nhx6p743fl0LX+o
	 4B5njRqpQBTl016WAeGjdyiE7Km+Mp5NdavuOZAAIYylS7xORTy40aQJikiDpSXjyuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=y6Q0i3La;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B747606A321
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 12:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B747606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=y6Q0i3La
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2761c69fbso3116986c88.0
        for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 05:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793105764; x=1793710564; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcXO+Vd8p/zIO/CVoOpxlqwT9gefkkK9PohzmT8jAVo=;
        b=y6Q0i3LaL1uUe5j9IUl5XXPvF4zI5nVBHo3UnBwB5cmq2BrNM5H8hBuxpcwvJI6T0T
         MbPLbQETUQKSWzegiH14W4P9EOKAq9rWcvy04oImD6eTy/2lTDY/qdf/nivK60dG14Ri
         yNTwsJ7U2cTpC5AIoRgOBCpy36AqOZZ5N6vNuQikeAo6nlImai2GXAkaNZ8Ktwi4JZUb
         nTnz7/wb35leO0nq1govKQ50g4HI8gSZHsW5fmsyY5fz+Bm2fUupEsZak6Ep2JzC6D7b
         mpNg+g396UjMMy/WoRC3SjlYsepl9x1rzragEvLxd8RN2zAzL4V3mxv56RnH4AYO/ctZ
         cl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105764; x=1793710564;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcXO+Vd8p/zIO/CVoOpxlqwT9gefkkK9PohzmT8jAVo=;
        b=elZb0SzfbY9AY4Lddp+/MArUFcXxV03x4NUZaxsIsi7PZRzBLEvhHlg6MgJLY/Y0WH
         qdTV4JOkIXKBAljftjofq9TquxuIDDhMfZujAslyJUuY/FS2heGA4nGwsJMbCnlJbg2Y
         KPzHm8NVQUYGbfjI4LZpZlafe+uU0xBuwyk9S0DKPq6UmFHq824umaI44QYOgBS0Y0ea
         8vsBsH4RGgEQG8e4HQKrOu3QEeCWf56/n35YyNch/prb3GnPB9Mh64Pt5oE8xjPn94n9
         YoywfgCLC9JHFaCjksV89uiwEcTcLFiGnGduNmXvymkGc/1bsVD5UnLRhMmOsQLMjjBe
         lTLg==
X-Forwarded-Encrypted: i=1; AKwUvBzUd2GTnHWIDvBFO2NRx0g0uMNBZDH03UMKxj2RZCDMDUFyTjgtY9e3FlcYScoLaeGW2QfjprxGv+bBmg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIWEeUYE1YWJCUPYq7XSsVCyoK/WYgPGnkISTeNc3OmclMrrkUy
	+VwmT3pA2gW/bJC2ujTAMquiml7v0fm5PMAyox4u30Vq8MhAzKoymTe+cxiEvtfIRIE=
X-Gm-Gg: AYBFou0BHpGc57Vx1UEPDFU2x3Tm8zfONd4+9gO4c/VBESrhvysmvVFxTaJu/OgHD4T
	Ar8P1tHafeCLXgVqmgsR/GFg2z84lz7y1VNL5+04Xiz92rCTahH/HxNUuPz22bXpWexxE1kfkO+
	irxYW+NMA7+zqVuVxZPI1CfuPMbJbE/y++KEhOq7GqfKdWYZw5+zAITYyaPYAhU2j1dBWg3dlC5
	BjsGYiGYJIb6L9na/wzkYoQixgIygYyvD6He6KJVTUAKUQyycSkeWG/vTNvhgjauOLuxv/T6VO5
	POVpFKm+U+BFhcG2KhHAfEqeX8MrIG0kTfX6SRdps8z5a6ZcfjvzIdtO5ka+1t/vWLXVNibwPHx
	seukshM6aSdG7NO2NEvJJlHZSZRRDrUx6YY6UsDqmwHk1CkxM6yXSzpsvRenmlTgDElvGfGIq8+
	HowJfKGDKPm5tbLAtVjKWLh2pCweLj9HWVUT21+5K4osVKyZhAtUXnXvszk95CdV+KtVZOAZmSK
	QP0yBp5IiRX4QPVpCAXUQZa6J92XxSuOIm0Ivt5YoEn6nbvw7EtU4DVhduP5Bj2ELnT0i9gwfe4
	MyNse9dRu+TbfEWvb+J6YipjkCFD+lQKxRZr1ZE=
X-Received: by 2002:a05:7022:90e:b0:194:3a84:e67d with SMTP id a92af1059eb24-1993f6d2c4dmr19379065c88.44.1793105763829;
        Tue, 27 Oct 2026 05:56:03 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a58093678esm4301247c88.18.2026.10.27.05.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:56:03 -0700 (PDT)
Message-ID: <5f575079-a2a1-4f42-ba1b-204730a5402e@kernel.dk>
Date: Tue, 27 Oct 2026 06:56:03 -0600
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
Subject: Re: [REGRESSION] io_uring: requests can overtake consecutive drains
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: io-uring@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261027043323.98916-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261027043323.98916-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/26/26 10:33 PM, Karl Mehltretter wrote:
> Commit ecb6817b769f ("io_uring: end the drain when the drain request
> completes") lets a request submitted after one drain overtake a second
> drain that is still running. This breaks IOSQE_IO_DRAIN ordering for
> both standalone and linked drains.
> 
> An LLM helped with the review and reproducer.

Please have your LLM also make a patch that you can send out,
then you get credit for fixing it as well. Same goes for the
other one you sent out.

> No privilege, special device, SQPOLL, or unusual setup flag is required.

Puzzled why this is necessary to state.

-- 
Jens Axboe

