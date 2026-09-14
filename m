Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09D041D239
	for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380559; cv=none; b=Qj0xL/txmF9A0iK8tiQ++WvUCMoYgh3gwYj6FSOb8HXjhOgsriIq3csukOoqdLxnXE//yQz08WckWC8IQJMZq02xdnHlyIMAq0q6z2Fi5b8moVEW82p223EcreDDnK5mu5vG9v6xJrA112fg1jABxbQqvJ8I6CYKg2LFcP6neXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380559; c=relaxed/simple;
	bh=orZaZWZGvI1tCeE19P5a3V+UTWdeZC4NNvIK0PHV8PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rxHxLRP4rk9qEbbJ0teES45MllYv45BHrfY7bFbsj4jjd5TAjpYNhEdf8Ew2ikFEuxlSXsBECZ4Sppj4FDRb6NXJ7a7fATqDy9vgbogsVx7HG0vRrOqqZDfE/9F9SjY/zky2vVxgTFB3/gEE0taNbo+4QSLAePNQyiF6pUEKrNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=H8YsyLsz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="H8YsyLsz"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49e6e69d528so18254455e9.2
        for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 03:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789380556; x=1789985356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KiDtW76OrPQle4sNBKcnEO0egtcxluIwtMmImWhO1Fg=;
        b=H8YsyLszjOz5OjBQq0QUqrVw0EV8F6hJ5XR16gdfSlLr63GTRAXjhuEwXhs/hkxF2R
         5mFhghqmvNwkFjF1ngM/cI8t1H5DHLGXvASt6sUSHGEGcEWDJqKkSosnNwp+aVNaCAnB
         NIGYuvRWzFX4vigqCbnTkVD7md5KQUMGIjp3/7SLo+Iyaf3dNnQswk5SpaefmZ632Ofb
         Hc9l2TqnGwprLgqu2QOr07IxQn8ArCYlTogPPiqFs26tWeKaLv/hMgSg/gjClyBkKd6O
         c+8Aw+/6PMZ5Ji9JrTDocJV+HQx2sJmmllrFKMO6pOvL9HByuBpc/+8Js0Qm0IYVYEML
         QOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380556; x=1789985356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KiDtW76OrPQle4sNBKcnEO0egtcxluIwtMmImWhO1Fg=;
        b=jW4V4xopTqqtEpcupu7qzR3qG1+VnoDdc0Dgwi+GU7t/B33HQ8aO/kGvaw9S20LWCr
         6NnQlAGh5k1MGO/uzxlEJqlYB5YYIAE5IctuzBxbVp8Je+/AF+4L/G9AIpo/gHQ23VsX
         WSVy/B172DNjBk2/SOIc8VMwW3AW6HbVLHEnYBaI+HoPyX+n6bE5qvfbuiJ+wSlICPdc
         EmdJ6WeHIZZl5eVOOIdTz61D94vjr5N7wdDkgKC5G+1SgF6XbkZLHK56Mc8TkYoWjdEr
         Vnzzl8KiE74GhjlcyudpaIY/WvXSNJcLeQlNPq6TKhk2cZFuKC9SLr9rGpUdtvXgVCX8
         xCVg==
X-Forwarded-Encrypted: i=1; AKwUvBxGeXHQCSUziZZdE9YUVLSGaD0zzTOZq6xR6MYNvnM+sUOG1Yz+nezYy0jVfSyCt4nH/AfyrqpzJtzhhw==@lists.linux.dev
X-Gm-Message-State: AFuF++msgb2LaMamkn9RXq/R7KFVUKamBrGjP0IrFJ3q67E2ZZ3xUUe3
	rklXbbN6HHwLEM8kS9DpfodGjKEK+KXkVDRIcJ+7iS/jYi3dLwHU0Uqh
X-Gm-Gg: AYBFou3ZrjtBEdZ9sVFh8noMFMIGhVQI/vk8Ra0cUpn5uPvKRSLUsOqfbobbzS5fzsF
	m1m8FYKEckuoxl/wIzlnrbpIxrb4AE48P8o2a6/f3h3NQSGTuNtN3JtxJcO1smdNXCIS4qhSXKc
	8hARs71O0+6C4Gt4VldzImpQAf0lgYObALQRmtDAuRbSCa2M5PpEYEU9gLMsMdkQfTxjLT8ReGW
	dzrv1UytaF9cd1bI0CcK9ISdjExo+9D7PtM89fvZXWUJ/vZRZsFw/LrwVP8cV6mKgg+pm4fBK1C
	qrR3nE259T8BtwlzClvoxZfaZHxVuOx7594/yjiVoH3di3zcoKJSZ5I68mXmUByifNOb4tVmF2B
	Tdnm16dxBVjTP9mpzefl/hOH0tFGVH6c3nXng2gVmiVJmdkzX+ycitfw685qGCa9MKzjfg1HQAx
	CLy/wSFak54aRVitjLJF4cEMgOupRX+OIHZK7yZSyBUB+vfWfxaO3Nx48wWWKAhx6qPFOXDdvwg
	TDoEjd/BG4a35PNo5ps19C5GUz+yYe/Rm5N+GSdKyvd06Rh9JG7cGNXp2pI+nz7m/nkLXCghg==
X-Received: by 2002:a05:600c:19cf:b0:49e:73d3:78ad with SMTP id 5b1f17b1804b1-49e7a6859femr20731045e9.18.1789380555982;
        Mon, 14 Sep 2026 03:09:15 -0700 (PDT)
Received: from omarchy.lan (p200300dec74de0474f67e4b61f2de2c6.dip0.t-ipconnect.de. [2003:de:c74d:e047:4f67:e4b6:1f2d:e2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm458381205e9.14.2026.09.14.03.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:09:15 -0700 (PDT)
From: Manuel Knitza <manuel.knitza@googlemail.com>
To: junjie.cao@intel.com,
	miguel.vadillo@intel.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: hpa@redhat.com,
	regressions@leemhuis.info,
	spencer@omarchy.org,
	regnirpsj@gmail.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Manuel Knitza <manuel.knitza@googlemail.com>
Subject: Re: [PATCH v2] media: i2c: cvs: Get the wake IRQ without claiming the GPIO
Date: Mon, 14 Sep 2026 12:09:14 +0200
Message-ID: <20260914100914.230246-1-manuel.knitza@googlemail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913133017.624919-1-junjie.cao@intel.com>
References: <20260913133017.624919-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resending here at your request, so the tag is picked up with v2. Same
test, unchanged - v2 carries the same code.

Tested-by: Manuel Knitza <manuel.knitza@googlemail.com>

Answering the DA16260 question you asked in the ipu-bridge thread, and
giving the tag here where it belongs.

Dell XPS 16 DA16260, INTC10E1, ov08x40, linux-ptl 7.2.3. No spk-id
conflict: all four CS35L56 amplifiers bind, no -EBUSY, audio works.

Note what that does and does not show. I am running your change, but as
a DKMS copy of drivers/media/i2c/cvs rather than a kernel build - Arch
derived configs cannot enable CONFIG_VIDEO_INTEL_CVS, exactly as you
described, so the Omarchy packaging carries the in-tree driver as a DKMS
module and applies this patch verbatim on top (omacom/omarchy-pkgs#418).
So it is a test of the patched code, not of the unpatched driver on this
model - I never ran that, and cannot say whether the DA16260 would have
hit the conflict without it.

The rest of your analysis matches what I see. With vision-drivers gated
out and the in-tree driver bound, the graph is as intended:

  intel_cvs i2c-INTC10E1:00: Quirks: 0x7a (VID:0x06cb PID:0x0701)
  intel_ipu7_isys: bind Intel CVS nlanes is 2 port is 0
  intel_ipu7_isys: All sensor registration completed.

"Intel CVS" sits between ov08x40 and Intel IPU7 CSI2 0 on
/dev/v4l-subdev4, the sensor enumerates and frames flow. The
manage.c:1502 WARNING from the out-of-tree module is gone too, since that
driver never had the IRQF_ONESHOT issue.

Thanks for the correction in the other thread - I had claimed there was
no in-tree CVS driver, which was wrong.

Assisted-by: Claude Code:claude-opus-5
