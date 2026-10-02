Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C414F68D1
	for <regressions@lists.linux.dev>; Fri,  2 Oct 2026 18:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965773; cv=none; b=VHLI7WN1y/hdF1es1gBfLlb3rr6MQm1cEEkZ0S6eBAqS7KMIjAfF6NXSr8I/BTUMQRnJd2ySPY+xqIY19JuXLzaKBueuI7DsLlGHgomPWXjIkHRLwcmTdt1UDoBeopgt6Z2csSSS8Nh+2/fkTl3/yYE4t6r8uYASsat2yIyp0Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965773; c=relaxed/simple;
	bh=Bz7Rk/lH17pY7d2mlfdx6a9jInPz+be05f+OXOKbwMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aoXGe2EXx39IGoGgjAGp4UslavqMqXCr5/NjZMUwhkfeLjZbty1wQW7ivkd7chon/ZMpLqoReRh047g+uX9x5E1Gpw0rjKjFflDnB4976D+nLTWqZSyUj3v+mK0pTE0hoGYEyHdSN2UETPVpHSgfhBdjZxDX42FZTI9zGMtKes0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sISdTjYV; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sISdTjYV"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aff58e6abso99419f8f.3
        for <regressions@lists.linux.dev>; Fri, 02 Oct 2026 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790965768; x=1791570568; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+rrH8jPIjco9vZfHT3xe2ptHn3BuOpvxKbC3e4I9zuk=;
        b=sISdTjYVgIvoOemUfSAScAAHvItyYjq8/lFOXGfZj/+4/6MwkM5aR6v6utWxopck4E
         UHpB7AbQIolsBul4tgLTaDGFPCAKSJzZNTlcUJyoSd3rMm0ilQzbC0M+7wkyQpLHV79B
         CYGYf4d2hVfnrZoEo58SFmAHQAiAIKHHVPfLmeqrGWShIleqEqDLD5LTEotBeQK46lhO
         Q1+F4yP9hCl4aBPX5FCIlZumV7dvQXrWqFAwvBkYt2ftfqMSaEgnfIpUNEbM/Ks6n6z+
         eorsH1BEc9Ay5uKSbhUIvd1CAm5jxOYFdwc2N5D4wQUmlnqBwoc9GTcDXw64a3GujSpU
         iw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965768; x=1791570568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+rrH8jPIjco9vZfHT3xe2ptHn3BuOpvxKbC3e4I9zuk=;
        b=LLq6zkpB2T8qHa/Cm67GnuxJgIJEQp+e1NM8GoUyR23Y7fEMPhkp7L0cq3GxK3J86+
         VNnIvJGD7DMCLYG2SDssaw18SgP0GRr68QusZ3egX9NRgJj4giXBmphnuf7EJvmEafdF
         U9naWpJn9FmuO1nTfXd1ILDR3TWIn0smoLFyGkLm5Gq+WsubpX4G1sozHTK7wVBwgtXl
         tZ2tEmC4LUFj+zL/nYIyFRBoeH08r64O8v81axPVK149MX76rdUUR+WYPtQas3fsFL/+
         m+mITzfRwtKB4wx14X6AyQXN+Q6jXkCf3RrMFYAXyQ1V9u5r3tgVNjq0mGQ5ysTPDuHS
         GxKw==
X-Forwarded-Encrypted: i=1; AKwUvBzg0MrWVMlvFb/sZ2ECgBAsP++uvci145h0jZv++kcJzXLPB5kHlbpA9ryHs8I4dw0YTBfLC3DHnUU2pg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLohPiTE+g8QmiBK9do1Op4r1ABw/nKQJhuko1rXPbalbJn9qGl
	naOaFE5s8KToQ18ixqhTgoTQ7A4l9aymSErWdNAdBa/g3kfnuVON5ln9
X-Gm-Gg: AYBFou1yooYrlLcG0xCRPgXM33O4gatkY9gw+x1eKw2l8txASMQSZrNShdAqOZ+8neB
	r3RmpRyDohG4CuJDp1afOb+E+XlmxU1bfMsJ2cpEPbXZjnazzGuinswiqdStNFqJ8tAFZ0/2Lg9
	v8FI0P2iSHDWQtLNIW/lsqsUzBCbEbdNpt2/C7ZEdowTNKrQKkdWqwAzqOqr9XUfPIUJutNbyLn
	YsC1p91IJWr7fvZog1Ya74mdCm+A026I+QGECF0aS1Xz4097MPfLI+wKD+m5DgtyKPMscxxcKtE
	xPm/ThQIDldL2CihxriNB84/HIXQheXZxDOhO8zAEL+0QhaIUbo1Iw2zjgABqmrSyBL5YQYZdPN
	NNAL8BTkpurmieiCBK4/TcUN+63OQMcqCw0Z28dYNnBjgUFflWxS6xwvfLUY5/eXFqEry/SGrrg
	gdTUdXcFijhCQP92wxO6ZkYKpfozPEHv1whfwVsFXzG1j5xRizaH/9BJRQ03c8onVQbrzGgZiLN
	9c/cQ==
X-Received: by 2002:a5d:64e2:0:b0:48b:508:1cb9 with SMTP id ffacd0b85a97d-48b126f1568mr6613899f8f.4.1790965768312;
        Fri, 02 Oct 2026 11:29:28 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b380faaf9sm7429656f8f.22.2026.10.02.11.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:29:27 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Date: Fri,  2 Oct 2026 20:29:18 +0200
Message-ID: <179096555582.4050.16689195326008531646@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CACSVV00GwWvMFDR5QC7h8gonC-9qYbaG958nZHSxtUdWXGG_sg@mail.gmail.com>
References: <CACSVV00GwWvMFDR5QC7h8gonC-9qYbaG958nZHSxtUdWXGG_sg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Oct 02, 2026, Rob Clark wrote:
> Can you share `dmesg | grep drm`?  In my case the initrd is missing fw
> so gpu is initialized later, I guess when the compositor starts.

Here it is. The kernel is built without modules and with the firmware
built in, so the GPU is brought up right at boot. The GMU firmware is
gen80100_gmu.bin from linux-firmware (v5.2.38).

[    0.620358] msm_dpu ae01000.display-controller: [drm] Using Transparent Hugepage
[    0.621120] [drm:dpu_kms_hw_init:1168] dpu hardware revision:0xc0020000
[    0.625910] [drm] Initialized msm 1.13.0 for ae01000.display-controller on minor 0
[    0.626015] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/gen80100_sqe.fw from new location
[    0.626115] msm_dpu ae01000.display-controller: [drm:adreno_request_fw] loaded qcom/gen80100_gmu.bin from new location
[    0.626994] [drm] Loaded GMU firmware v5.2.38
[    1.632277] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for response
[    1.642345] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x4
[    1.642360] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* gpu hw init failed: -110
[    1.652389] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x4
[    1.652401] platform 3d6c000.gmu: [drm:a6xx_hfi_stop] *ERROR* HFI queue 2 is not empty
[    1.858322] msm_dpu ae01000.display-controller: [drm] fb0: msmdrmfb frame buffer device
[    8.053367] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU firmware initialization timed out
[    8.053584] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* Couldn't power up the GPU: -110
[    8.187443] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU firmware initialization timed out
[    8.187650] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* Couldn't power up the GPU: -110

Oleg
