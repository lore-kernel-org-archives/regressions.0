Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507963;
	b=J0QXY8Z5+/qWhWcrYmrizUf+6YJNPNWsuWFYVpTEXTwMk55r3t8wZWtwQLo03vjPKCzD
	 2uZeTycQKx6O6xwA4MYp54XztMpIHwyAej9zR+0LJofLLVhttanmDE1VT8XkQc9drNYfF
	 AjmksHxYhnOj3p0iyKGjwzPMCUVKqVPEITufjSU2Fnur0snfUzBav4jnlYalZKtJV2bdk
	 bZLNNqMxAENjRbvK/vMAkX96orXVvZ4shzMOXbLsnudR2OIQgYfzla1BZHKB8Njy9ipX4
	 M5CERJNP6W00l+M4zr/zqloccH1WBITtPbZA+rO3thfNPHlcjPT1AtZ59GJ0yxd0nzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gt6Y85M4kAfgeFbvU9seGRhqfBj39ecJG/UgGwQgng8=;
	b=kn7dUAwdtP6Z7VU2leP2lDOpHSVY17MuOQbsldGARXfGMY7i2+WhvEpohZcqJpUZS/xv
	 WNYmjeeokXKgc2lRdmuAWq4SoNTTX5nKkWj16km8C1qG+lUaqJ/ZpKbjewwCoE3LDpRxM
	 j1Mwd0KHks7xgG4q+Kfwcsea7BodeW4g3dat3REZUAciWBYjDFdx3rMmxWzhaPu6FmQuw
	 SjgJjyTUm59o43Bxd5tuQmaW7JVTH7iKQC7ggNbWQ0F7d3xl68vlCx/AxDM/ivzitnn+D
	 N+LJfU5WiEHQKHOqLqdUoVN6JBkHHOMt499nzuMoncPcZNOv2x9JPbhr8aZrMYtR9tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fxGG8Vjp;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B063606A320
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 14:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B063606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fxGG8Vjp
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so42522275e9.0
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 07:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792507961; x=1793112761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gt6Y85M4kAfgeFbvU9seGRhqfBj39ecJG/UgGwQgng8=;
        b=fxGG8VjpZ9vgAm23CRFYwbEqaOS3ROzjbrT2qQAw1Hl7Ov2BIuhs/pYzW1Vb93mEIm
         BgcCBYhAVRNQGIQN1prJn5IdoASj2vx4eU+IvUwpZikjm6BguQEWzDJ90oLz37kJVFXE
         as2ec8U9KXCSWOl/ZCLv8nCcZh+BUoyam8m6tgtl89i24Zzr3LWuptZ7xLIqeGyqL3J1
         qeyH+dH3a1gDc/aGvaCnvmV15ixk0Ki65wf8Be9M7lDqyYFZaQMm46IKXP80SCHCX3I5
         7aFjURkgIWCJxwUfAqpZXTLSDYpKJ5pBrGnNTN0F0eRUVEcSZfS2aUOJM8yRNud0/B55
         TDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507961; x=1793112761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gt6Y85M4kAfgeFbvU9seGRhqfBj39ecJG/UgGwQgng8=;
        b=iBKtluLiz78/ZHFP2y25SiKDuX0dK9AsaCNCKGrgzLTUpzMlShfX0Op5YuwpWpx7bS
         avlS5QxTOHLBujlAh5GKl7+AxTDgRYXFOs7en9ZwPuO0DjBw6ZubSSIfYs+NVERz695n
         i3mCpT9z4YDnLRBUK/2FQfyT9OHZhhnt+16cQzc4o8NsRPIJc/8sizf5uV3nBVl0rzl7
         uz7kyrCYaAQLVOhoSB2jcN4YWAfhn3gsmunnYKlgLJSKIMgYHHFM2m9B5G5jmBbIlOxj
         s8PHDtWJ1F6pIlyj9G9EiaH2g0xSzCoBH6nvz+FgmO96TUmh5QeaX1GzyFm5DSushP58
         te8w==
X-Forwarded-Encrypted: i=1; AKwUvBx2ylrSVkhcb5C7yCaM4jAts8fu8/bs2rlqx4gwTVMTCFPeg27fp7SiLA9nHeGaU0YQ+Fw/f5vNDNdr8A==@lists.linux.dev
X-Gm-Message-State: AFq9FYJn2j8MpwU55OeJ2hWB/YLP3GGtIGrX9JWJgT/UrsKShReYlKYI
	Wp5rdvPiFQoKQ+9kpu95kYDtDmvKv8P2uSzrCMUm/sma7fmGL2CJQpY3
X-Gm-Gg: AYBFou3crB+C9S95LCBPdN0sFVIetJIvGk76sJmgIQA6mpiPH05kUhIezwmjKrwmiAS
	RVaCIRKd9VqDcxDHX4/gooQJJ6DXCVRKVrpj91S7PU2q7fZ/EqQmm4Vn2MR9Zt0ezDnpA/5Raa5
	IT2Xo3+RT0EBYW6jYW0RXjCBizuYZy0uzvUBLpTqeE3s17agg5S1GV8RQskbkp/7T9EP6qA6UfE
	SAgoRgpXFGnpV/K+zxGxmBp33iYWPnCuYnMpWPEVA9sRSwmGWqCM64VdpOvEUHI2vRDPSAVZlZ3
	5Y2377cY108Nba+65uWGf5gxaEzibn7v7OBe19OhOmBpvEevlcgRiv/OFt7BtVMLMli4Et8aPi1
	vakY9NVLEA9fWCGZPMsEM5m0dfrmEPSTuXOrC7B3JnwJxQ+qErDhPMkXg33KNqWRmATqxPUjXmQ
	Ezl5RD/vvej4+4bCxvCuelYD6t2MXNTLOVUSYQ4OUNbHosmtaio8z3TFIcV+uzU4XClnjsfx2yB
	QSfsXCf/YVtVrmrZKnkIQXBoFu7eWYRHlFi8mx+VqqxwZ0fU7GXjbS3vZJ+5adXGQDiVFJpJhOc
	MMqwzWDGYu5q6/oboAqHiB7DGdma3qRhQQjHg8LrbnGG1bOiTXX4g0U0CA==
X-Received: by 2002:a05:600c:83c9:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a1d764145cmr213720455e9.33.1792507961101;
        Tue, 20 Oct 2026 07:52:41 -0700 (PDT)
Received: from p15v.lan ([217.169.3.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cdf2f0d1sm211770555e9.2.2026.10.20.07.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:52:40 -0700 (PDT)
From: Peter Morrow <pdmorrow@gmail.com>
To: tariqt@nvidia.com
Cc: petr.pavlu@suse.com,
	yishaih@nvidia.com,
	leon@kernel.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: net/mlx4: no ib device for Ethernet ports without IBoE since v6.6
Date: Tue, 20 Oct 2026 15:52:39 +0100
Message-ID: <20261020145239.3798017-1-pdmorrow@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014133951.3219055-1-pdmorrow@gmail.com>
References: <20261014133951.3219055-1-pdmorrow@gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apologies for all the resends, email client issues are
now resolved.

#regzbot ^introduced: 7d22b1cb9d84
