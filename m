Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6419D4E4C4D
	for <regressions@lists.linux.dev>; Fri,  2 Oct 2026 17:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790963248; cv=none; b=VVipmbziWbv+g+lQ0aVgqCls2peWGSP3jFx2qgWEInmm4Oxw+dDWQsLBerdD1wXVIzpLnku29tP0xxQ+SvBMsGIwkH67hNVAF2bsqQouY+DMRdk9VxQDZfrKIholuq+G9bFbfuHB+IgUkOE5drS4MxgSfwXeA+V7LVu/3VVyOag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790963248; c=relaxed/simple;
	bh=Cd2QE3iYz63jTSegzxUdKqxdpgigqksvpDvPJ3x44Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/bDrMCN964ponhNVOFolQBCW4uVbJhDpfnFY6Yd9d+BtCwd2a8M/a4Ngm1TBqMfpWXbL9sM3nHcVqNiSRbeOeeSvGomi4l6RhBf3GaZ3h0+lQXK2vGR5H8d+JWUajobntdiKwRfx3dbCb9m2oHUvUSEyG5Jv/CzoHU6Db73Els=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TzSs27TR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TzSs27TR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso633565e9.3
        for <regressions@lists.linux.dev>; Fri, 02 Oct 2026 10:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790963240; x=1791568040; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ekbcB0Q6K0Df7evy98c+D1I4IxidAbimqgNUlWNjtzw=;
        b=TzSs27TRL2f4RIbcl+u+F3SF6pU4QIxiX1GvOJ94xO8ihkbM5ULOcn+eVDdm4qUdQw
         xwwJNtgVe1By6H/09NIY4+GKR5MWNgfUSqhwBBJ0kd9h4K6UL9ZOMRVR8oln7dJYE/lx
         XzhMydcYrd71718+P/BfanxWDUjsN0zO1TDrO8496UnIQjNEeyWRwfeX0Dk9VbI62Z5o
         Wm2BwDrgoBT5MLrr4bEYN+OJTNwL5WXcxrazrJKqMXlIpTKvMVyW/m1XPZgdCJCCiGV8
         UfsY3qIlIZpEYvTzM7apLXNOZsKPzjRqM+ryvqkbEnz6mUBkOJ8vZwo0gyItkVoRPKXu
         7rXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790963240; x=1791568040;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekbcB0Q6K0Df7evy98c+D1I4IxidAbimqgNUlWNjtzw=;
        b=b+AqnvAgEEi8SRVZmK+XQUAFofZPF6X4MGf0vZ357TjDJC+IMVnX2NF6HC0gUur7re
         Wtbs9XA78NJggyiWIO8GMErwO488k3dqpgtp8O1I481leiv0+Xg/u649OBqy7GZ3uDYi
         19R0TOgi1b90Iga6TrAmjia9l1cN4R6zj0hMeD4r2B++lvx0MspNjF4ftS3e+rs7oyzz
         M4lXQh6yxCZLGy+KbCzY4WHOqWaTgkZfSEOFjFNFQWsMn+odsJck3mlTxNBkG+R/d+bK
         LEgJXI1nrAvUBP9EB8zb8yit7ExnArYAqr+5ZECf6H+myb+wBwMLP2gfL63UL4fKyPmF
         wQ8A==
X-Forwarded-Encrypted: i=1; AKwUvByD67qlwhSso3jsz0MA0fpn6kcPBsIle2QDGEDAe4Wr7A+6OKYnHPLvlHZarcbCoJ34b4wdRTazjR69MA==@lists.linux.dev
X-Gm-Message-State: AFuF++lR1Yz3Eqy1hcey47KUwnEmeJKzB8bUfOEF5ajAdkwDwV2ycAq2
	ECY4sozROuWeuDrV2/AqJnKcFcikFQahdlaaqzZomDHMhNYNPi/pHkM3
X-Gm-Gg: AYBFou3MPykEcvXOQhzebNE3CIrvMCYrBtAHlsEZQkB/N/gZSmjvlThIa2Z6eZUM1B6
	tfzQLuBW5hReYzlJJhV0Qusdp2fP9+7ci+QVwt8W9x/GrgYyjqwfBBj+AvnvSIIQSc+G8KPZTUs
	C6baDRFMJrMXw2hzWMM7Jp2mRK3H/rCojhmj1a9HIi8gKlNrugAorQt2nQQ+ZgG2hkj3JG+1zrK
	CPrtNnJg9RVWx2DaKrrmZFgyW3q6VM2KBspkA8U5zJc2ANI08OOCAQJfaS9xUetiFb7qr6Djt4Q
	L7pGzC5oTUBTC4te8xWJJtRGEPlsf+928Fy9gzoPnPSNCfrSI7SNfwoazL/vjRTBMz6VFoAqEYB
	88xfyXZzzEKfQL290f6OkuAvQ0nzNNVLHUrpMA5H9EOY/9DxpTopqXi5ulNexYZ+YzcqIjLESv/
	LD2JpFFLRt+mWoAfnAu1R1UkBVXlnlMHwlr3bIvAAt5RP+VoFqfpbuRrDqP5LvOVHZMYDhCmh9W
	xw1uwMlndsYu6lF
X-Received: by 2002:a05:600c:a012:b0:49e:81db:4926 with SMTP id 5b1f17b1804b1-4a1680e76dcmr2993815e9.5.1790963240043;
        Fri, 02 Oct 2026 10:47:20 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b382f9ae1sm7515541f8f.39.2026.10.02.10.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:47:19 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
Date: Fri,  2 Oct 2026 19:47:10 +0200
Message-ID: <179096320161.1973.2852858792260211089@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ar_AuRr1eaZzOfw9@baldur>
References: <ar_AuRr1eaZzOfw9@baldur>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Same on a Lenovo Yoga Slim 7x Gen 11 (Glymur) with next-20261001, GMU
firmware v5.2.38:

[    1.632277] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for response
[    1.642345] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x4
[    1.642360] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* gpu hw init failed: -110
[    8.053367] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU firmware initialization timed out
[    8.053584] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* Couldn't power up the GPU: -110

Compositor fails on the first start and works on the second.

Reverting this patch fixes it here as well.

Oleg
