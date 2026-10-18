Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517EA45D1BA
	for <regressions@lists.linux.dev>; Sun, 18 Oct 2026 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363155; cv=none; b=jcCOPHDoyg+m1UGvOaeSxEDQYPw6RurR5sCgXBDGJ/UGOMN9EAmIqPUfC1jpa5zl9TxvEKLarNn1v3UzHaA841R3hwcBUDMErcohMA1n1lbbFGHJIJ1g/Lia8yJhm/x+3wuUVvnuUgMKaWCnjPLhM4NH+5QVB2Ky+wM8Ha3N948=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363155; c=relaxed/simple;
	bh=FiL4xTcXDIPoGTMZXRKEFaT7WuQUy5kID7ebw8CmJ8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uy9wLPuSpqTNAQPmQnEEsZFCMQF/1b5x6Kubq/WA/Bhyed0dRx92FH/v84+vbOHnNzgF7cWHDro5Gdbq0ihM2xkB+E4AaSOmM+WYefRtYOzNms0uiJSkECAoWMTpNhf9JyfFry4EccyjQIQMw+3047KzROrHwFa8pIgEilgJrP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2A+vMXr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2A+vMXr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so10684425e9.0
        for <regressions@lists.linux.dev>; Sun, 18 Oct 2026 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792363152; x=1792967952; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvsLpFGelrgwN9Cl66Kd9LpNf+fNDOOYoQY8p06psOA=;
        b=A2A+vMXrnJN2BfvNvzXUibpsYMUIiT5N8+j51MGlB5mY1mwVjTD6BozvwsqV2zdA2k
         2AMfsku23jtpi09Qy01gloQxKm5/iUVnC1ucX+ceCxiumXVO8/EnizhkNvsvv3qmRv9B
         VqTNrUgSmMMtFttZgfJPV9gAqHICguOdWyPz2ihMNmgA3IYiNQh0YRcodwXn+s4tBASw
         xxngc6USM8Pj16KqXd55C4woa5cmafXuBkJKA68ZNOuOs+kv4Eu4t4gJruCNJtmG1rOq
         +ZyxfYXuuTqUuaM3onHuQL/FgZmTh5lgK202ybALA3f6vaPHa3cbwbuKwRvjw9DFwYM+
         uP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792363152; x=1792967952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CvsLpFGelrgwN9Cl66Kd9LpNf+fNDOOYoQY8p06psOA=;
        b=RLQNi9w1TGUCd0ldQoEHYD+QsGFU1glRoMrev0hYnJaFcsYvWxiAub0ltOgbaa1ke3
         VMFPX5n1GrQOyQcRtmxSBYehbkf/rjC9Nsx9UPlt8gwgMSb/mth9GkGihm6LU6M+LQ+r
         xBWHXtREkfzK3otOUFHWVHSPPdPI1QYMhxPTDgbFi+gwPFw4nVu8er3Y8lbNuco6Ycrc
         cX69tidw2U4Sxh0kgLNpqtLWR0qicLCtnxO0fGNXLBRMN4suzRxNBV8Ta4OVKjLw96uT
         fp378OjeeR0gRHfPVshlbN7mM347/5HJQoWHlGFok9Bvqa60uVunW+EQ9Jp/y32RYVuq
         3LbA==
X-Forwarded-Encrypted: i=1; AKwUvByBo55KDiIP2n1ACJ9UGsgrld4TRi/Xn5/JRpEvt/4wMj2N2sN5G53tHOSrSMDli09rtkR8zhegrD9eqg==@lists.linux.dev
X-Gm-Message-State: AFq9FYK+gPW18yjBN5wyGefcOzNt70b89+O+ns708bdzBRpVzhZBcE75
	CcunZH/tcPZv6oTdSRctI+o0aahL71DLsbh/TkseQvxWViI5L6hfIKPI
X-Gm-Gg: AYBFou0wWauDRz96buPJRH2WIfU++sYcbasMRkTtTDasmzOkEsBoG/Y5pGZLQVrmOgR
	I6thVKtj/TWCBVAYh0C5LDVFTfiPqCH2DgQQ0d2RFicYoOYeIFzWSyzQztyuR83pXG6Sj4UwqRK
	rSloK5trDcsqC9LG6SvAfJAMNzp2N58mkIg3WgQ0DpiQo7yCrXWtMy5IWlaYhqV5yMYiAKhHNsD
	eQQtVMXgJW/iXQjBsQIvRvcQTt67HNJXV9vxQrFPFXyBFgyhvmIBgqyy2mwPonPy4MY+4WtC4SE
	vsiobkOUkMmHcY0kL+Nt82wljvkxvoJkTbMcYQyaebX668K0JDyXwDFM/AHJ+ORRAB/CcnW1s2k
	ZOAstjHYwaqfD/u6BhsZIfHm6oL57wqMO4GqyNsewD6CTqLV3j4DzaZY9yigfn63sy2oN22atn0
	+HA8lCA3kcOTLrxZAIUFVWoWb9qCb+71Rl1UpBm15hu6NY4yM7rXOX9XOldvjrk8gCnf/+y3abO
	fTGElT/EXi6I65pI4JEgEDkM8k1EYwWuSmDlb127DsZb+WJc7hiIdCi6PnL/NF3LHoiVhc=
X-Received: by 2002:a05:600c:8b22:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a1d760d9fcmr130723785e9.31.1792363152485;
        Sun, 18 Oct 2026 15:39:12 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a1fsm16359363f8f.3.2026.10.18.15.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:39:11 -0700 (PDT)
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
	regressions@lists.linux.dev
Subject: Re: [REGRESSION 7.3] drm/amd/display: single-frame scanout corruption on DCN32 at 120 Hz since a637a140ab86
Date: Mon, 19 Oct 2026 03:39:05 +0500
Message-ID: <20261018223905.32324-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261011201833.853907-1-mikhail.v.gavrilov@gmail.com>
References: <20261011201833.853907-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The workaround from my previous mail does not survive a suspend.  After
resume from S3 the band was back (seen, not measured) with the TV still
in FreeSync mode, because DC had turned SubVP back on.

Snapshots of amdgpu_dm_capabilities, pp_dpm_mclk and the DTN log, all
at 3840x2160@120 with FreeSync enabled (vrr_range 40-120, the EDID
byte-identical in every snapshot):

  after boot                    sub-viewport disabled, UCLK at 1249 MHz
  20 s after rtcwake -m mem     sub-viewport enabled, UCLK switching,
                                watermark set A at the register maximum
  after toggling Night Light    sub-viewport disabled again

dcn32_allow_subvp_high_refresh_rate() keeps SubVP off a single FreeSync
display by reading stream->allow_freesync, but amdgpu_dm sets that
field only on the first flip after a commit, so the modeset forced on
resume is validated without it.  A gamma change makes DC validate the
state again, this time with the field set.  The patch:

  https://lore.kernel.org/all/20261018221726.27259-1-mikhail.v.gavrilov@gmail.com/

With it, SubVP stays disabled across rtcwake -m mem.  Until it is
merged, toggling Night Light after resume restores the workaround.

None of this changes the band itself: in HDMI VRR mode, and at 100 Hz
in either mode, DC uses SubVP anyway.

-- 
Thanks,
Mikhail
