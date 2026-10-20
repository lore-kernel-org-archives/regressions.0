Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792493041;
	b=eUb1r2ES0687/+5aRj4Ao9t8k58t8L5J0gFZ0LxkCK4rOOwALvvsEHdPpsBRefauWdsS
	 lta6ou+O8W7SJJUXikqV1TFOkcTZn4e2mDlo3xcFMkRzlvrS6LadhWQgNW6vQcOcYBr7l
	 UJ8NePTvLGKkYZ3qDTmumtnXyOLIouoL+UqrOIvlcmNFTFQaqJD6zDxrkOaF4HmseAw7+
	 RC+0EZg7DMiLsdGJneuvHT6jQa9boYyUXvtLPyMdq+Tnc/gJlrgg58WnBSEBSrij4x1oj
	 9Rvj9h92A/QxPO8V9u+QtptICJBH/dmD/EuVGnMJYsYQcxjIojwSA1079VbDyr7BGBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kqXlGHZK1pUqa9HpkjKcxAViOyKcyPiOJa87b6dOxE8=;
	b=1TZlgkXOdk7lW4rSZiizhgi6y8mNxvKZqCLdetaHEl5QwI3qrs0ioLMQxtJTgBTKgFc7
	 V5E2VhkKzmEBY2eBWuQsVIgHO+GglLpNpxOGpZuMlUHvWpjUS2QiVsxkfJjn6NpMXIczh
	 zKhzprRTeH28sNzhxWKJ0k2tbA7GksIcPlajbpLp4YentO6vHpt4EJFf6vNZwg0v6vxn0
	 GTbtWso+KI5esezsWqpaRMS6oeKC6vLw10F36pE5UyAwpT8IOYyshn0OFjAuqRGBjCci1
	 kXOQ5xJ9U3BcqAJf5PrtxyHo7SE9QKLEa6eGt0X+JrkjiHUHRY7M1BEPLOdesgmN3VQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CcXA8F73;
	arc=fail smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0371606A31B
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 10:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0371606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CcXA8F73
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6b19e291cc6so3047640eaf.2
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 03:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792493040; cv=none;
        d=google.com; s=arc-20260327;
        b=JMPE6+zE35FUE0lFKAL8APryTn8tRR7D+jUC++9hKBnLQtiSuxKhBNLJMKaSF+xiEg
         h50U+Z5ut/mhAI1TSJ4zTLgx0hr45xgtXCla2H9kHZDod/S7hfkN7uJgSvAMViJ82UgW
         C223OsOP2w3Y8p+d1v/VBos2Pxt6lviZ6HslBjAEPBMkHgL/3WyXLblMlpWmSPDsI7DY
         kLZwe1AUDN/iAgN5tKv71lnKm6YvIuQxSt4tsCoCstQ/ByzxOO8hq04qDx0aliInvODQ
         2BEs40lYms5xTaEmPEuEguF5Xu6DKmVDtWO3sodSRvi/PNpBpi6ZHEokgrip1fsRbNpO
         bPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kqXlGHZK1pUqa9HpkjKcxAViOyKcyPiOJa87b6dOxE8=;
        fh=3PGEkq28N6gOaItq1qikYQQg0ltQvS+yd5Te+FXMhG4=;
        b=WX9qcOwM8kQK3aZ7/YXM8XCjNVnf1gWCuahygUu/TAdy6udGgHPgpRR/NPuaSTWaJS
         wxXP37Ufee1ZBd0K9LPSJK5PZTd81eROTrkc9dQUYtFg3fScQpLyD3HqXLBacP/pS21x
         Skyv0c11cgh9rmWDbYO0mXKsx3MaDzyx3HiMP1egLkJemSuXMx3HmoE9EPudXbRBKbcy
         cOmLPl5FVUue2KmzlsRDictXjeFsRvka8Oay6SXBhXNTepncR2fqTYMeSl8jiq9otMw8
         bG+xES8Gn4tVv4aFgfCg5DloJq4a844to6nBIT1Cgo1QNzckwaPYP1OCSOKRxaHP6IJN
         tRcw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792493040; x=1793097840; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqXlGHZK1pUqa9HpkjKcxAViOyKcyPiOJa87b6dOxE8=;
        b=CcXA8F73juT9LP8EqCvnB3oYczVjXEfb3ZjMX755e/1ue/sDgvMuZ5UMEBxhQDGIar
         Tk399oFaz3X4WoWX14GsxXxlaxKGZrKAx/aFxwexX73kMg1a9QD/LQiM+DgnRq9VlGa3
         xIU33m4cbnNAyfFMoDGVShXW7GvOOD9bmEXhNndMeliJ04bYC7t5TN5M3kUs7NGfdU07
         lIdzOlDxUvaVZIj2/8zbzsn/WInZunQCfCGELmrr09APmXX3RIw1PgGWShYvuysjmrQw
         kfUmUD8v5zGIcQhi5nT1FCuYzhB2URmiObQPNdpeXvK9p8mgqBgANGpK4WFHRGOSIOOQ
         lA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493040; x=1793097840;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kqXlGHZK1pUqa9HpkjKcxAViOyKcyPiOJa87b6dOxE8=;
        b=xsTnsAKyZELKEgq45BoQ5GeGRQFBloJ8z96ICzr5KDk4aJgBg3cxwIAzjt2OsN2Wch
         /fFDKXk4FiMzjNQO3hHKfYzVWQ2nDT+nTWaIwsib0KCFm1tKcBKzwHcrH4gDSm6zlpAj
         FE0qYxBBSBGn+edIWUsponF7az9N0dIruICavn/VlXSo4RysSqY/tHpZPMMUDZk3rtXe
         VRf49TvHhiQYx83Bolfb8R60s28q26a6KXHQVlsD0wB8J0YiJUyxKDgNRUe0fskqOXCQ
         jiqImPhCXMTPJahtHTPysSi0QFW85Q8ofuqbjFvB4PtbDx8pS0Uz9pu7Kn18ULSGioNa
         V5qA==
X-Forwarded-Encrypted: i=1; AKwUvByo42Cc7ROPM4vhI2f0hHWlhAuHJG5kTwVNz25vZKg2dXy94QyTMwSOkWaFNCbJZBeQMc7nDAK2KigTsQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKHqg4rdSl9KVrgxotAwbvtsfHrC1tnfJM7fAhkG8rO9E7GbtTK
	51q2ZAksI6PucHlPMiiWQHzpX7xRgc2vRolvmQBmbXxV6ba7L3ImbhWGMGMcu7w9jJkvy/BMJDB
	6XFaQ6tof3ylBpHX0GuklsWbVhAE2MD8=
X-Gm-Gg: AYBFou1cnynyHMdJWXgiajuYrKeWcI8mL16j3fTwjiP4BkNbSA9Ohto5A3TA47AHzbG
	1MQSnYxmeabeg3MCcernA1Cyrq47nm7yoMfj7/eEHy+VCo64ndGuFoBMRfIfxUTFZNOrk0MaHeK
	86rJtYdMJoafwrhztuDp5ap1kjGSHWcKS1TFaqwtf4/iW4ui6CNno4i/ojt69xUw+KC23uBiIgy
	MREsz5RGf/FQhTM0axIolUcccqZluE+5PsmqA+Xa5QS8/AIMEMS2QBGpienjutN00bfxe4yHfcb
	JFenkP4H1QqU2G4OF0xRMTLkYchjpI39A1sCLwhwfIu+QbW+UqzQWPdcnK4/tj2tmknftkGJ7tW
	La8jRUp3KLFLTHwj4+Kxzla1YgH4yrkEtSfR7M3mDKinw0+Zuaz/Y5L812o7j7DEol6QvaUw5te
	Wuj2anaGtaOhT90/NvSHBSWKreeYcFboB0F60nKa34LNsM0ivkmGgU
X-Received: by 2002:a05:6820:60b:b0:6c4:50e0:4e0 with SMTP id
 006d021491bc7-70356492b06mr7440160eaf.32.1792493039924; Tue, 20 Oct 2026
 03:43:59 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAFcZKTyCu7K=1OOETBvVrKf-9YKHRk7wXNRyZW7m5P0PEPg1zQ@mail.gmail.com>
In-Reply-To: <CAFcZKTyCu7K=1OOETBvVrKf-9YKHRk7wXNRyZW7m5P0PEPg1zQ@mail.gmail.com>
From: Peter Morrow <pdmorrow@gmail.com>
Date: Tue, 20 Oct 2026 11:43:49 +0100
X-Gm-Features: AclHuK_ZTJZ-MG-SKAI7eH3l_zmO7EZx-WhALvbMgrcFjsGx7J0OsMIcUbiXYiM
Message-ID: <CAFcZKTzkDzPXpjFqU8c3rpY3R_FpD_tWRu=PPtkar_LCn1AsxQ@mail.gmail.com>
Subject: Re: mlx4: no ib device for Ethernet ports without IBoE since v6.6
To: tariqt@nvidia.com
Cc: petr.pavlu@suse.com, yishaih@nvidia.com, leon@kernel.org, 
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

#regzbot ^introduced: 7d22b1cb9d84
