Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569929;
	b=ifejIKrS+BLd/fcOsr7VE+nm5EbteJp7axgdlDu2dJF3DRm4aCXqDq8eL5TJTpGkTF62
	 p4AZAvi40fZPagZClu16h932iKuQWu4l41EUugn5moIgLoxkCMu2fN6IJlNG3TZFmyRe+
	 e09WzStO1oZO6zrntSN1Qcn6eHNa2ZD1fj043HKBbfMRjSJqNruGia+TMI7Oga1IZUzNo
	 ahp4PmFTjs31Q2Xb2qAdVd7algBf2qmKxiQHKUDACWNaF52uMpS9SZA8Hl18+IXWM8kgE
	 W8fzsvSISVevdC5m8b0THGTJhblIVJTHquE/rFpXg7JjY24g2mYNncw2BLyuy7xVLfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ucrcGnxXyuYhogAmjNJch54rUpgpdnz/8hQqaKskjsk=;
	b=Pn/My+fqb1rMN6CgtNTWwQXarCvh54f8VlLeZi2AS9O5alHFMRn4qJ6UDCFSkqy/758F
	 ConZoZR8wWwYtdsXInA7OOBhCUTULgaql0UJLpPb2oG47DdfUyl8fhSJVnANNKrVqOh8V
	 aHA/d5QoTZYeQVTw+WRFZ9MtXe5UtU0AXk258EVkfQ4KHW9tp2XjLJhB1xYgp0f3iaCPf
	 TNYVt4uZR3qagLlhgvzSA1qyNWf2W0f72y4u+QvyEO+jtIycjpm/AyDCRlTYh1NxtXMcJ
	 jj320etSnCcQ6pS3NUmpE2sRMzd/FFSFLcVVibS/Wy+9KbHOlilvgjFVMDn1nBgJnSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L9lo3m0t;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FED8606A31F
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 08:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FED8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L9lo3m0t
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso4988235e9.2
        for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 01:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569927; x=1793174727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ucrcGnxXyuYhogAmjNJch54rUpgpdnz/8hQqaKskjsk=;
        b=L9lo3m0th5DWwSV7YSonoe5GqmZLfunNe9wvd7oiXvFfCAM2v2dtZBhwRhiAZFSS7N
         gcRCRH9cfEMeNu3O7lLf/G1m6L3kOTSTSStroedqTcAABjwxOTW2D27SBy1WnYrfr1Wv
         pVCZw6o4Bp8VMcweX5k3wuvgLM/9qHXpKHDqWAh9IzBe2zBUniEiukNWhVnO9b9zPhv1
         rnFvGPzuJi0eRQy1FRb0blqBhQsxlkgg7GQKWoV+GbGrrNWReG83wYCIb1V4zvxzNG/d
         Qg96dYdiSgjwuUlFjn08uj79wlN83tVsBweYkatNaNrzFwmhYoNUZ3nUYfA7ucxkBmd2
         45cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569927; x=1793174727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucrcGnxXyuYhogAmjNJch54rUpgpdnz/8hQqaKskjsk=;
        b=ntv9CEHZmSSDZAtRC6lKRM5vcRGrNYKfKQOEWE/ks+eJyjAmGr80Gf4GJyAitqlSDT
         HQmRYX4Uc/v/+uKLesygtdEvuhwMGsKU36jBQx+Fi77WUL4X347Pa02dwSL/m4RyPON+
         ThIZAJWY3TvQ0VHr9w6ET0WeXw5+XhHfseA8YWqm52/ZJo+3jFi4KLsAe7gR0Y7AGEQy
         WOapkJFQJoTxv8QpOXPEdLFPhB6LvsR8fpUsojyAOFo+MGIUA2f6AdwDZ7mrDdBo+aQO
         1oiSZSa74uVDnFhNGWMDBdUsgru2dpkNmUuM+hOI31SBx8x4RHZELjvXax0ltMGwSmhR
         x97w==
X-Forwarded-Encrypted: i=1; AKwUvByXJwkuWONQeVb9iSEUI3iPDZ1Ek/bV47qnEkSGHFUeXFOpWMTy4S1la0p3DcLEDYjz0xkfW3SqlmrMZA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLR+g71iLYQNbHgx9FuJcu+OI9kq1H8/mQ9psZjYyVWLmDKijEz
	caupzzP3z55OKRkrUm3z+cEJk41BxRj3CRBbSqPREF8q9EDWgfk51hUu
X-Gm-Gg: AYBFou34+KrfpdhQcLssf1PE2BsQgBMPMH+ykUj9ck0cVty/3nLZYbJf0ZXOZniBOmM
	b1aKjFqRLCCA4nIgLjHACbkW8JqR+yy8+p9qsGnzeB85Rwugt4H0SsygOh551zPEOLW5L0hbUCz
	iSgIw43lXkdA3WR1g1TLEN9B7pBJl1pBiXHWM4Fe2itsunlZJ3irEXzTm0hFnkTfKWPdct/F7iO
	DBf5cI3TnQvvzdZzQmIivG27q88neet40T1cVl9zRJpxtdHUBGT0Wzr1gYmcUrwQqtK22jK3LDO
	s7Bcfi+ToV/nADStG4L5/q1VlNzYljkLB3jbiiYIDyxECFep78/gFT1n6K/as2nYiy6AiiYjwzP
	2QEP820zUiEj8hnpWjIk8AWbHIhVSYXGLIjDFrdvAyQMQV5wJYQuEjSVLnnzrKucWrmNXnomO6E
	073dygcGVz0qzRS/8644U3ggBMUwxvWry22OdXf4/eGobkeWizc8Dj2der/Q4ynpiWMQCpBvpXe
	4x4ESvBoZTJB6edqrQfTOKBGuvjQmDKLedL6zDtBKruo1NiJX5Euhdz88Nea9mhtw==
X-Received: by 2002:a05:600c:c4a7:b0:4a1:d41a:afc2 with SMTP id 5b1f17b1804b1-4a1fd8cb7aemr24443845e9.3.1792569926424;
        Wed, 21 Oct 2026 01:05:26 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.12])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1fc1066cfsm38928165e9.1.2026.10.21.01.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:05:26 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH] pmdomain: qcom: rpmhpd: don't clamp gfx and gmxc before sync_state
Date: Wed, 21 Oct 2026 10:05:17 +0200
Message-ID: <20261021080517.2161-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Until rpmhpd's sync_state every vote is clamped to the highest corner,
so that hardware the bootloader left running keeps the rail level it
needs until its driver takes over.  Nothing the bootloader leaves behind
runs on the GPU rails, but the clamp hits them anyway: the GPU clock
controller's probe runtime-resumes and suspends its GFX and GMXC
domains, and from then on both rails are pinned at their highest corner
until sync_state.

On Glymur gfx.lvl has 14 levels and the clamp holds the rail at the top
one, 0x1d0, while the GMU's own performance table ends at level 11,
0x1c4.  With the GPU driver and firmware built in, the GMU boots long
before sync_state, and its CLX DCVS calibration does not survive a gfx
rail held that high: the firmware gives up with HFI_F2H_MSG_ERROR
0x007306c7 (ResMgrCalibrateDcvsLvl), the first HFI_H2F_MSG_GX_BW_PERF_VOTE
times out and the first GPU init fails.  On the Lenovo Yoga Slim 7x
Gen 11 this means the compositor cannot start at first login.  Pinning
gfx at level 11 or 12 instead fails the same way, level 10 and below
boot fine, and pinning gmxc alone has no effect.

Leave gfx and gmxc out of the clamp: they have no bootloader-configured
consumer to protect, and the GMU votes them through its own RSC.

Fixes: 93b6c8d10fad ("drm/msm/a8xx: Enable CLX feature on Adreno X2-85")
Link: https://lore.kernel.org/r/179248663855.32151.9955864156939592299@gmail.com
Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index fa8fed5bd3e5..2c9d4beeffbe 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -1006,7 +1006,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
 	unsigned int peer_active_corner = 0, peer_sleep_corner = 0;
 	unsigned int peer_enabled_corner;
 
-	if (pd->state_synced) {
+	if (pd->state_synced || pd == &gfx || pd == &gmxc) {
 		to_active_sleep(pd, corner, &this_active_corner, &this_sleep_corner);
 	} else {
 		/* Clamp to highest corner if sync_state hasn't happened */

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.55.0

