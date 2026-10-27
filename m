Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103719;
	b=1NeikgVxKMxhx1hjWBMEwdWVwLjii4gzfffvl51YG+oVpwOpWcjLDP8tcdvjwibPLjDk
	 bxGcbM6NzS1ecRrg4UbU7x7URNdNVBs+U2IbAfVuIazs+H2WT1lNo5HZb2L9+0KyiWH7b
	 jkkytRmprEBTHcLUZBEp5N20UcxU3muzhgQvNQ6PK89aub0ut/QegjKIYxhHi0nANpuRs
	 o6bnO6Fe358BR5zp4n6VY8pgq7Y+/4tbVbVTD8acVFBI1sNgr8OFCmDDO/3oh4c+Qkh+b
	 B+VlFhTrMb0cVqoPO4AO2xTpSSjWJuzPvb8a5vjRkclOvtgcCxWM7etL7q9O9/TpW0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CjWvn6AFi1A52TxbvgaZZpyJgGj9ZtMA7w6Z+oUCikU=;
	b=0+0Zl/M0LvatN94gSoAgs051SeICznCQw0wyEAnD5MlQo9BDTzoC5JQ9K2hpfWpW9JEH
	 gCWtE0f0M7T7MLhrf74wimyZSTjp5TUq0lmdQtywEDoQi5Pyt0PGMYvkEKsexGjs3ltS6
	 6BaWvXTlrT/ENN4ayBZAl68lnsIK9dWFNYxJVl4irmS5j11xKRwzZy0HbKJTaps4H0RFW
	 uDee+VtOtma/46ud/uJbztQwnCMSlTi+cLqqoQW70WLDsD+II/sUKXEVC06qh4CcedE5f
	 WsQ4IOVeCdLtiWwKAF5Kmicm7n9owv2px6t+ZQZNm0QRU5MDxSPO1jSCV9AkmGFW9mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="VxA4D0L/";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77979606A31E
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 12:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77979606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VxA4D0L/
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so22637155e9.0
        for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 05:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793103718; x=1793708518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjWvn6AFi1A52TxbvgaZZpyJgGj9ZtMA7w6Z+oUCikU=;
        b=VxA4D0L/EmNlVRFHZWyFxlGBRHeQ2gxYyEQQixuJAg/jgiFKTm/nUSjquovdxzFKjs
         Pfd93D6nz9k188W810QKed/a/uu/e3x+sSmPOBhkzxnyKDkv/AoGqRhy9oTEOrwEGmCg
         6I2rzagVGN7ePny+RRnkpatOWzYhwmJJHCjM31PwrbUtiRwIjbEDBqdxCrOrJM6u9ebc
         YWyOHZe3glfYK3yCwnK07MywvACYLXaJzzn8q9FN+URxVNUMlt99Usy1lPz8U+jNiF5L
         nf9WzZjD2/QBG9tgOkZOfKlKAwfYA8xNuAy5UltIObbm2Zc9qEwvbG5BOhdpYT8wTcrr
         3u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103718; x=1793708518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjWvn6AFi1A52TxbvgaZZpyJgGj9ZtMA7w6Z+oUCikU=;
        b=vqI/Go+TKD7AMWN32U2U8ytjNY6BWz67FvW483lX+p1cAVH14XEHNBH6Ikw3irTuoe
         4hHuZ0KsDrzYX4duORmaiwYQpGBW0+OpYnz8sI3oNp80iclAqSHTjna0JI2rD8Kstq6+
         dZSZPWcJ1FE3Le9vfxWLdpa8ibdtiwx/8/LBZ+QLgNRZMzJmudwbv9iLrpYP3Ki7B8gN
         baFFdYPVZXGuM4R/3clo/PvgYqto2RAEn3rk1FFas/TciFa75hBXb9FF60WpzXmy+pqm
         GX40NrD+yyyuCmGKwFh1Sh+oU/RzZcsFQtrYIUsgImjJ1ARXGZGQ4l2MBfJEPsMeCSZy
         CgJw==
X-Forwarded-Encrypted: i=1; AKwUvBx637FT5YwB5ZQaohl6gWCc6/KHhSXbxqEw/q+P+H3Zssr8bULGzzMAhoGZ4cvHATBV1lmtEEP+7Uh50A==@lists.linux.dev
X-Gm-Message-State: AFq9FYLMMogFXDR2U5jt5LMTVKkEuYmczbCXmHjG0snxVw7wCLf4HtIw
	KWwT0B99LiFkveOME27U5PQlvCShDNIjld/suHDu7N4VPHPmLntiWiXU
X-Gm-Gg: AYBFou29ecQmdVl6/Rfe5kFFT1y5NZ8G+MW1MbSX0MqruFjF1CuazTylS0L7GJGH2Bk
	ZhSK6pFQ5WxfulTggyysIaQWXA6UvYFhnMXGF+4EZSMdrc0fXDConYKlSMtMkTnKLIKnPYE/Ufp
	3HG3Dctma1sj0Clns8b1hH0FspfvpHV+1pV4ToRZtEelE6RoUn/Rco9OpPeS7Wbmoo2a4e0nEB7
	j7hs+Ijdl5oRlp9503trug/M3Ht2DdmKGPaP3srvs/+qKJWCERsru9ye0zxMtS6ynmpl0H4b/cQ
	TBoSaBwrLyb5my62hF8TUzyJHShe92HhEQD9Qv3nPJ8f4y3PUZVqu/8ga0MbYJRx2LaeWw4o9fI
	tZ/Yuqgttsl8SULabbKcIlRxqMbA8kwCy/VtH5ThJMDtHPGH1SCwEKNO7S2jbs9zs3nqhbpg2QS
	bbDPNp//5XlZuHN9k8AX7dVMlbooCWHIiKl+/oiXkh0eVpDbizJoJIg555wLSuc7qVSIVf3ZwB/
	FnjCX3KR9aWYvzEEhUn+mkefGaMyg3pcajh0G4651dXWO9BHEd/exSoG3rcSqTaSPRtUtqCIKGG
	FJg4Wug=
X-Received: by 2002:a05:600c:4583:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4a35ac963edmr205653775e9.19.1793103717674;
        Tue, 27 Oct 2026 05:21:57 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm325465755e9.7.2026.10.27.05.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:21:57 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: don't clamp gfx and gmxc before sync_state
Date: Tue, 27 Oct 2026 14:21:46 +0200
Message-ID: <20261027122146.24778-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261021080517.2161-1-okerixx@gmail.com>
References: <20261021080517.2161-1-okerixx@gmail.com>
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

On Wed, Oct 21, 2026 at 10:05:17AM +0200, Oleg Keri wrote:
> Until rpmhpd's sync_state every vote is clamped to the highest corner,
> so that hardware the bootloader left running keeps the rail level it
> needs until its driver takes over.  Nothing the bootloader leaves behind
> runs on the GPU rails, but the clamp hits them anyway: the GPU clock
> controller's probe runtime-resumes and suspends its GFX and GMXC
> domains, and from then on both rails are pinned at their highest corner
> until sync_state.

SM8750 (Adreno 830) is hit by the same clamp, with a different symptom
and without CLX, which is only enabled on X2-85 and A840 so far. The
first GPU init succeeds, but when the GMU first boots under the clamped
gfx vote, every ACD level runs at half the requested clock until the
next reboot. msm.disable_acd=1 avoids it.

OnePlus Pad 3, v7.3-rc5 plus board patches, msm as a module loaded by
udev about 4 s after boot, GMU firmware 5.1.25. The clock was measured
as drm-cycles-gpu over drm-engine-gpu in the fdinfo of a vkmark process
keeping the GPU busy, at fixed devfreq levels. The four kernels below
differ only in rpmhpd.c, and I alternated between them from boot to
boot. In every boot in the table the first GMU boot came 62-81 ms
before rpmhpd's sync_state:

  devfreq (MHz)            342   660   1050   1100
  without the patch        342   330    525    550   (10 boots)
  with the patch           342   660   1050   1100   (11 boots)
  local test, only gfx
  left out of the clamp    342   660   1050   1100   (5 boots)
  local test, only gmxc
  left out of the clamp    342   330    525    550   (5 boots)

Every value was the same within 1 MHz across the boots. On one boot of
each kernel I also went through all 14 OPPs. With gfx clamped, 525 MHz
and below ran at the requested clock, 607 MHz at 539-558 MHz, and
734 MHz and up at half. With gfx left out of the clamp, all 14 were
within 1 MHz of the requested clock.

In one more boot of the gmxc-only kernel, sync_state came 83 ms before
the first GMU boot, and that boot ran at the full clock. So, as on
Glymur, only gfx matters here, and only if the GMU first boots while
the clamp is still in place.

With vkmark's blur scene at a pinned 1100 MHz on the same boots, this
is 414-421 fps without the patch and 831-866 fps with it.

Tested-by: Vladyslav Tymoshchuk <tvlad744@gmail.com> # SM8750
