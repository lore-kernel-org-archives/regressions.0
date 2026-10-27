Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140383;
	b=Rge3M3g08hXU/CrLFRq1LUwkhkEcdpgIt1Ju+YNxmP3PzsvRjbTgEwM27VIiNvmZFJn9
	 LGBnVp1fGKJvHEkUePvAd/RWts1yiUR/7pUi8epwArQye8HBfu36ouHRVWPwUByiFrgI/
	 Ohbx8vrtj0f6J4dyYllib2L7XQ+ZVD7WKhUlsTPKFLHqr9QLBiDTRbOo+/eGK//hhL9/v
	 YdYSCt0ll5D735ESivDzo8mf3I3SutqqgQASR3WkvrC5X3tCe6peShmSWCjNzpx70/H1T
	 vd39zoDWBSB7G2zibbylgSW2ffI4h5Zq5oC/3j4LWzk/UEVtZqJuDzjDiAPYFB1rmiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wPmToGC5y+VhdITU4V4ZbBMK8thCOWUoBfhcPC5IseQ=;
	b=r41GAxDkT7MbQr2dF9x5bOFeTl/QGV6UGQb+Z+FBq2UpacnugR1CuFlturPJbpGYy15r
	 O6Gcc/IX93oOP4ymbgUrXvoMQSuKg/AqdhQ7r2QlR0ATyQthu0++WEUafahAIJ3Zpqh99
	 5+A902pC/cDggI3Wt8ZXTXqX9EFMc6eiFY+t7MGqiok3i95nfm0ue1JZgHcxa40uzsnox
	 ybxuSshJXrZqGjoQexZ+ajrrW2z+SSb0ePqSL+LHUfFpxrd2NzHatvJfV3NqH3sMRdwpH
	 csnMCIO0jgRx0b+0Fv2o+hMDiw8jZXtYbtWzds/2YY9KYRDMp/Y/5TIPW6Zkj9BHfbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eaOVK81H;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7E0606A323
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 22:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED7E0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eaOVK81H
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a772ec8389so2330931fa.3
        for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 15:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140381; x=1793745181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPmToGC5y+VhdITU4V4ZbBMK8thCOWUoBfhcPC5IseQ=;
        b=eaOVK81HNYX0OH8INoDzGwYPts2+v5cJDGGcFZrLkJgmLZMeBXf95gLmQffGxkFp61
         +Phwb3HFxkLm4I1GvRpHp8w20QPs0Bt+lZl4dwvRgOmDH3Lx6JljczJU/AqvEzpKwUTE
         DqeiPS2KyRiP9SFXzgjoFqps7PEKByXeL0ZjsVujQKBuzOdZJsmDq7XEWokj3oV2suJa
         wFYY/S5eRmf9rFFlKtuglBtjTQYsCjFJbl6YQ3Ksjk0ShA/3YbzFmmhInh//DzGGKf8y
         /lfCmlmtv4DARNblnboiOFn1r+vG/9yRzOaxNCHJviQjEsebgUdCWy1JaABa3FGjqrJu
         f0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140381; x=1793745181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wPmToGC5y+VhdITU4V4ZbBMK8thCOWUoBfhcPC5IseQ=;
        b=JOZ/0BUgqflEU2eArVxDLAieabsz0Un7VpfU3eMZq1oUfnQfElYrAYXvP4xe6AMGRu
         BLNQj5AuxdbjhDSlQRqMQFbHhP+KuHpZQ3Xx+IvqnXQlwponwZUPKRyUAls8TIpra9i4
         e0H8sNFDr2q+OE7gRdQj5qdMYt17pMC3itHjpPxKV9Jmw/eiNiWTIFO894QNUr28/FeL
         wxBWxXxfj/oHMSQxwiQJtk+Q2Bu5+S0gz/HwxRzjfGAI4A/1NC82H5JvFJ+rw/09x8+F
         9vNeiCz5c7LgozFCuB/6E+OKoEi748193cKasPKC26l2KT5Wgaj76Mto/MWTCkHmJ+ui
         0Qbw==
X-Forwarded-Encrypted: i=1; AKwUvBz2Ld/lWL7XhTEnWgz/5GtUOJ7c9A2ifUvaUE6dsklS3Z9hGbRTMy6px9SM0g7oJL8vdACu3aP8fh9JzA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJf4jJiC6xJckTZD1XEHdZJL5KM4iRUoGBSUkxxPL1YvkRqL0Ra
	X7eyNwjxOZQbQ7F+bBZmZPkDb8C7PqeTG6RfP0ywDZY0wxoG06JWmr8Z
X-Gm-Gg: AYBFou2I+O5dIEu0AYdni2GiPRQ+TotMh8eKeJcN9l3NBNpnNOVUV+q4Yn+2R68lqLU
	jsJ71i9qWpo4KKgKtS1bLZJdo3repQrHkjut1Ei6IjnlqZ7V2tsw1+H/oTfXfk2ZPvYi4eu6EKY
	3OWIwe7JWcVlvJngCYb6FoO6OgbmRlSMJ9zPEo8v6TA088dEjlYY9Hu8Bd2ebMNM2hxYM7GrIwJ
	QDZqZ/JKKL5lbvTYLIWHCb5G4et4ZVDXfZVb2J+Dt8wP9VbwwnFeGtzHJF1f8SxYQSVhsBCeBs4
	TOwsBk+09UCBo4KMom98Wpogw6dFvmZ4OAt5+0qCvKUeOHs0VVULavrWDVUc1AW33fTFAY/aOSy
	VtWGdvxhGbrCAZGbB4q3AVP9XIrRgM3CCKc/TMFDuCHGTYrQJ2fC2xw7E1xPCB7AQPvpXp7XIl1
	Mjf+LMQzc96ekw9SFdOBfVwv42TVh88lYqUlQzEPSNOfrktX4spbAreRZx+uY+TKV3x/vFxuWiD
	I9ZkTzcT8d5B8LF4Lai8O7PxzJcgLG0ooctmcHND8oCLaVdKid0Zgsz8JcZqcsJYCvUczxvv/or
	UCi0Z9In0ztgtgLt+20s+eKF7mCuB1klCAUZkHFmT3jSjzlvbOap
X-Received: by 2002:a05:651c:4216:b0:3ab:690f:829f with SMTP id 38308e7fff4ca-3ac9cf5b6d2mr759271fa.15.1793140380999;
        Tue, 27 Oct 2026 15:33:00 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1c1asm27657721fa.16.2026.10.27.15.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:32:59 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	George Zhang <george.zhang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Calvin Owens <calvin@wbinvd.org>
Subject: Re: [REGRESSION 7.3] drm/amd/display: single-frame scanout corruption on DCN32 at 120 Hz since a637a140ab86
Date: Wed, 28 Oct 2026 03:32:47 +0500
Message-ID: <20261027223247.300463-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018223905.32324-1-mikhail.v.gavrilov@gmail.com>
References: <20261018223905.32324-1-mikhail.v.gavrilov@gmail.com>
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

Calvin Owens bisected the same artefact to a637a140ab86 on his RX 7900,
with the same parent good, and posted a revert.  On his machine the
band appears within 30 minutes, and the revert removes it:

  https://lore.kernel.org/all/25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org/

#regzbot monitor: https://lore.kernel.org/all/25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org/

A correction to my earlier mails, which listed the instruction
constants and the stack among the DMUB windows that a637a140ab86 moves
to GTT.  When the firmware is loaded through the PSP, the default on
these cards, the driver neither copies the instruction constants into
its window nor programs the instruction and stack windows
(dm_dmub_hw_init(), dmub_srv_hw_init()), so the firmware does not run
from the driver's copies of those two.  The windows the driver does set
up -- BSS data, VBIOS, mailbox, trace buffer, firmware state, shared
state and the rest -- did move.

-- 
Thanks,
Mikhail
