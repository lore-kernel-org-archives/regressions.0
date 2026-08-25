Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A40A3F4DFE
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 21:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693301; cv=none; b=M8Zzhtt4dfDK4KiiGcoVP4gMf//hiKo2tmCwd2hvI5fPuU5B1wXofDx1bgJ0g+dEoSire7Qg/UZ/sUEp4KkkFEyTwEqw8GFklpSZedSt8sHJcGMY2CL9Rj20GpMLWPEdx7HyzaMb5YCwHhNS0sBw6GyequLIq6Qm6xz2vgpZu20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693301; c=relaxed/simple;
	bh=mh9a2Z7pFjZriVLIoAOGfQ3SYOOIiAwUd+FR41EgS4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbtYl3YNBnEBQBIndqDD5RlB2n4FB2Pf/+mC37W/cZm0l+aV/pZTmFQunXR3jeu+Tluh3+6WibdWcACs1tlpYyKTkftBAiDrAQx5y+XBOjBsNti1fphWB7UHrXDvS5fGSzSeyoPWKtFoXw8PVwTOS++OZtUC/4wTljDGY2oHjEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pbezh+IZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pbezh+IZ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2022323c37so24918766b.0
        for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 14:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693298; x=1788298098; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7kSIlJJ84PkNx03WFsQm+QKg/9aYj9/q0trDx0cIE8=;
        b=Pbezh+IZUj53/h2Um8TMKBYBilpKefiJugsApW/CvKBwPB29aEjhZNYfmklLywjC57
         QyU6z1LP7+nEZN/3sH86kPR5CG/xQxARe/QV8VGIfP4V89BNCOFo4hPIPYQdpB4HOfdU
         lXRaEdnCutcS0F4qGLtjku/APfIeEDC9om3RdOeV1eXl4IZ6QfbTCF4NdJo95Y1q60/6
         n3uujMPqZAX5szIL5CkJpghLonJmq1Wc9vT3ncIW8bMD3TYa7TxsCGynq/0INHvGHBRZ
         tjgneF4tM9g7pZb9MPCQD0Mz4Ff1Q9SYrDL2BVnvqJUW6kKfj/GpJunAZ4eMJ/evSE3G
         Dw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693298; x=1788298098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7kSIlJJ84PkNx03WFsQm+QKg/9aYj9/q0trDx0cIE8=;
        b=OcVT+fLov+xZZ9Khd4LmpoZVEsPp5CXdke5YufcOQ1UCcp5Pn7C0bmciwKsXNIpjNy
         MVeXz9qu/TOlSmTy0ZkourAeQFR/qCH3dog+TIZ+tIRlnHX+phX4eL/2shRbMfNlpsQY
         rC8Qc1eMA/JCgjrAepe6PrBjl+CT47eQDSD9Ley9SQRC6xPzuQiiy2VQnkb0HlympMEv
         Z3f/FRObBt+ZMJfF5562e+8e1Yy0BZwz096Jyd9hgSyNFng+SpNBLdMqH51V7HvejmCc
         wRuzmgqWOf9g+dEfOc1nsIvQN8OgMxjDqhZI7amgZeGdpQqL/CL7PDv0B2NI7YZr1eSZ
         rOMg==
X-Gm-Message-State: AFuF++kyo8iUT8ajLQClzLC/4T2Whqv4wALOo2ehemn98wrknJdoMStz
	IWCdCx1aPJLP/DBJkQCOoQYqmtPj1jL1Q+IPzEqnrPxKKuq3f74CL5GjV2sQ9WO29MsdF/YO
X-Gm-Gg: AR+sD13RCu+wzwQvcOSZWZ1dBRFJh2+p9GGJGy7/PGhaa9+ffPMKBohv0kZsCMLTq7K
	YR9CwhiZVvZDJZMmIF932uV4axX4ipNM+2bGTYbYovf7/EIO7g54/+ht7kl3gnvU48objOdU2p7
	q0MRIbaPwzalEGGB3rQuHv/ntASPXqcftFeRN3c9n8YE2U8t0b0/mswCEXd13MGQhVw5s38WaF0
	n7QVovig83nSHiCUeXT49Md1K8toHLODUiZKaBf2JT3HaqaufXCFy4U0hGhPLWgVRAaH3PzrT4Z
	0fZ8VigH62yA1lKBlCuNJIzMU4NdOH8Q/s5K2/C74Ob9gb+q5P513I/ZBEtbvLH/ARn9zFPWzcb
	0yXRFAXKbl5ID1/nhltJULqbM06A4GMsL//OAFfgroMn4FelSATvAvJxHASlbDJbX2MlY4n3RqT
	ysowOzjBmB5zpMzDZ1RXuZ8GrRFR258+IxofV2OEicVMQjLWKg+R06AA0uDoadEH23IX7dWLlf4
	sohEwpewfSeIFy1RpLNA+CYl4p69KIc9pG5dfW5imCjLpUVBAOL0zlJgtJ3
X-Received: by 2002:a17:907:e1d3:20b0:c25:d03:6794 with SMTP id a640c23a62f3a-c250d036dcdmr100923466b.16.1787693298421;
        Tue, 25 Aug 2026 14:28:18 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ef4d2sm101774366b.59.2026.08.25.14.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:28:17 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: spasswolf@web.de,
	alexander.deucher@amd.com
Cc: regressions@lists.linux.dev,
	leandro.ribeiro@collabora.com,
	mwen@igalia.com,
	alex.hung@amd.com,
	mario.limonciello@amd.com,
	jesse.zhang@amd.com,
	Amber.Lin@amd.com,
	amd-gfx@lists.freedesktop.org,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: warnings from validate_blend_mode_for_alpha_formats() in next-20260715
Date: Wed, 26 Aug 2026 02:28:15 +0500
Message-ID: <20260825212815.48959-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716152933.6744-1-spasswolf@web.de>
References: <20260716152933.6744-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this is not a linux-next-only issue any more: 860e748bddcc came in with the
drm-next pull of the 7.3 merge window, so it now warns on plain mainline. Here
it fires 16 times on every boot - 8 per GPU, on the 4 primary and 4 cursor
planes of each of the two cards in this machine:

  [PLANE:44:plane-0] pixel format with alpha exposed but blend mode not setup
  WARNING: drivers/gpu/drm/drm_mode_config.c:872 at drm_mode_config_validate+0xa16/0x13b0

I ran into it on 7.2.0-2709dd5ae32f, bisected it to 860e748bddcc and confirmed
by reverting that commit, before I found this thread. Hardware:
0000:03:00.0 Navi 31 (DCN 3.2) and 0000:0f:00.0 Raphael iGPU (DCN 3.1.5).

Nobody has put this on regzbot yet, so:

#regzbot introduced: 860e748bddcc
#regzbot title: drm: WARNING at drm_mode_config_validate() for planes exposing alpha without a blend mode property
#regzbot monitor: https://lore.kernel.org/all/20260813143605.106104-1-mwen@igalia.com/

Status as far as I can see it: Melissa Wen's v3 series (monitored above) fixes
amdgpu for both DCN and DCE, has Reviewed-by from Alex Hung and Tested-by from
Daniel Wheeler, and I tested it here too - the warnings are gone on both GPUs.
It is in neither linux-next nor amd-staging-drm-next so far. 271e90eb5f9f
("drm: use drm_warn() in validate_blend_mode_for_alpha_formats()") turns the
splat into a plain warning and went to drm-next on 2026-08-20 as part of
drm-misc-next-fixes-2026-08-20, but has not reached mainline either. Other
drivers are being fixed in separate threads (imx dcss, rockchip, vkms).

Since this was introduced during the 7.3 merge window, the fixes should land
in 7.3 rather than wait for the next one.

-- 
Thanks,
Mikhail
