Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570670;
	b=23V9dX8cz6sS3m/S7Pi0BM805Lv4Vyi3h+AdATFD3j7WmVaiYY6gm76aED59NxtIHOzw
	 k4dXN/0Jkv9wh+FhIPXmYXPLAapwg9lE9FOd7ZYVr+/8WXsUXTssqD4x0fMRxXr2VVApT
	 FD593YFlBg+/8s6Sh1nNm+OTy852SeL0YCq6EPIvnVpPilxPsjmLFC1OuvPnoarb6KNbb
	 8XQBu4LaNKB2KD8Bxo/KoKWHihdBlNh0HDs61wgtjQ8g4eqrdqGay5Tgc4QvDer1jjKMG
	 nH+jX01tFDQjDX/6kfblDEKG6SPTCYWzLIa6h9JH4z8yG4vffVNM5V6u4q7aqof14og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dJyr2tsSRejcmBK3MBzVGDDB5htK2NHRSw/F+Hou+2A=;
	b=3w+rPBR65heOqOXzEOr8ew0CWv3MBtHQRzaLKXjMV4VcSUNYmfTjkQpbTbnEPsWoA9Dw
	 kv9ppYZuzt5p0aNqheDFK9VHYiGd4bKoE3Sgclc+OkIyPwKtEd0/AKMqtuBrkfllr3cdz
	 /+VzCcMfdQtIWCVbSVhFn8Dn88YOiTqqlIRsw7D6i+rkpJXxKjKry+leFjR0aZCx9y5Va
	 9Ght3kGvtXuD47bRU6f2jrXweLNgi0ibSEMhKGMtyyoczEJ7swr6EInwA/vHyeNoDUG4s
	 8By9Sw0V+rLtAiVP6G0rf3yoP2rlGTE2nl6yVwFT00z3VWNZebgWgXa1TnCCxbMezZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J0GBiU46;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F20606A31A
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 08:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F20606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J0GBiU46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so2705895e9.3
        for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 01:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792570668; x=1793175468; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dJyr2tsSRejcmBK3MBzVGDDB5htK2NHRSw/F+Hou+2A=;
        b=J0GBiU4665W4dMLV+7VOPHspUgc47GaBog2FM84hEkq2t1RXWsGT/OtW+EQaw7DwvF
         p2MFcrfJTKUEkPB2lsdMmvM/Z0/k23K7m6s955uikGuAjDbxQTAIqzVAZ+Rq8nwUsIJE
         m/2cBj+oBgA+wTCwwvFvbbj3P4NZEa8cwqVkKIcgz6jHJDq1iJzeRjbExKtr0+x3vyKU
         bd3dBgoenKs27VBIMlgHzkbVDFJFo4RFhaDzEMY6qF+gfCgeyoHXwaHzlKRoGUGxgnIL
         ST5y8nNKxR0AwEDQ+KH42PKx9iaJdBU/Phq842YJ87u/mZhLc99oPfkiAc1/oAbHCnF3
         Qaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792570668; x=1793175468;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJyr2tsSRejcmBK3MBzVGDDB5htK2NHRSw/F+Hou+2A=;
        b=YuN1owsi0b09Bm4zJ2zOiAhTs0+uwkGNxM6vZAj8uqVi33cx1zKOaZdJH9soNIMvB0
         yG+PyY1Jkwhq7/HBVR+NfRZlpxz1kRlQ6dfkvz24TrNZeUShoFgq/kHKgzdHPZ4P/1FT
         9BFO9Q1c0Y/lbVQUmI6mXOC6aLD2UaFApTdpImhr+pQCXlBdXcV9ISPDqGS2qHTBRrvp
         NzBKB7f4CezRg9cm9GnXK0EtTFitD2hAJmjXpq4Zc4WVpvbTYyqphrwz5WKKZ9sXB5gz
         DbGOO8O3lSW8ZjeZVksFRJMGqCjIeJ9rl3qT9wj2m0wjy2j6PrUBTfhX5n4qILoQOgWc
         APOw==
X-Forwarded-Encrypted: i=1; AKwUvBxajUX4Q3JrHpPgKBO+5r5k71BF1owMV+iDw4k7zkfhmSuNDTMNFWCJjmZWvCqUrjNUWsv/zZwHP/g86w==@lists.linux.dev
X-Gm-Message-State: AFq9FYJfWh6W0erubc/aj5sxv6GwC1GExxN5oEeThVsxvUdUzzFNJz5U
	+4b1E4x5jTD1JV8Mr5Zc1iWEcCkSrYLzxAUvziMNYOhId64gCNxQtk8y
X-Gm-Gg: AYBFou0SAV03STbdsvtf4hc1694i8BSjQg5/K5IiJi0uHhfw4g8/TsOhrg/wqTs0faA
	xaI9PJx/r8B2Ejy3vxTmKF4TWzXuD0KGowFOqCreFcRegwwN/u6Bz5bUZVmnrtIvH2h6uIRlJvZ
	cqXlETLER3udEIlw42QLDO0X7+cGsAujHS3FXtRwXagI+yu0yiN8aE5frza/DvHWOQUlU2O5dj1
	8euoajxnbzFgycltTsniF8aCh3OhoJrCJFt/YkfhyIY8IxQXGToIFZFi/aWyHh7qeHjYZ5sC1/1
	oCpZ/TC8zPBaFOBMcF2i+1KgzHTAPbiosGgnhkNtk/ChHp8BwDWXDtRg8S8HToDdIXnTKvLBPEj
	efvzEQ+3WAlq7xU4w4ODEZG71eY0atSm/7IHA1gyclShARgS5KSJ+XNl5tVAAGjJnK6wZLaQ1UJ
	flPrdVZHWYUKgBYWV/3TdfxWGgrQdV0OdWXQGwU8iXyFZr8zYik8/Wl3j1ph4b6T41JPgUPtc1E
	N7sazQiHL/g+jW8WgLrWuW5L0KkEpiwnc/suMdrVN9uMK0vF3O38IttX8wh0XF5fg==
X-Received: by 2002:a05:600c:c8c:b0:4a1:e489:f8a1 with SMTP id 5b1f17b1804b1-4a1fd89d90cmr22391725e9.2.1792570667667;
        Wed, 21 Oct 2026 01:17:47 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.12])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828c98sm3848877f8f.28.2026.10.21.01.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:17:47 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
Date: Wed, 21 Oct 2026 10:17:37 +0200
Message-ID: <179257065767.2798.872990041874023890@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e4e2b8d6-46e7-4f59-994e-39f3d09d334d@oss.qualcomm.com>
References: <e4e2b8d6-46e7-4f59-994e-39f3d09d334d@oss.qualcomm.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sent: https://lore.kernel.org/r/20261021080517.2161-1-okerixx@gmail.com

Narrowed it down meanwhile, with the clamp corner selectable on the
command line: gmxc pinned at max is harmless. gfx pinned at level 11
(0x1c4, the top of the perf table), 12 or 13 fails every time, level 10
and below boots fine. So it isn't "the rail can't follow", it's the gfx
rail sitting at or above the highest level in the table while the
firmware calibrates. CLX being a current limiter, a limit entry would be
my guess, but that's firmware territory.

If the CRD still fails after sync_state, gfx.lvl being held at the top
level by something else would be the first thing I'd check there.

Oleg
