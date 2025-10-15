Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5477628369D
	for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540278; cv=none; b=fOBBLICew1rxugRdKSs9c1hum4cBJw1hzLQQm+BEbNz6z4LASk88DqdcEoP/GjowRHfYsLhhnmMuZoI6v44k6/e1oDNi6muJrS6J9lB/yWvpWjV73YpsWKKUriqMW8XvNxZRzIxeb7Tw0XpqJpTfemO1XP5H8JTb0iSob7hDDIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540278; c=relaxed/simple;
	bh=hhqFEZrqT+Fn3YGld2AlCsW1gwRxXhq+dTi0XOW0+iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZofryR1ZZRk+Hdwylo3xV3PSxtN3y97PVr6GrtZcYyQREFMzvdP9i4TMDxaJUyT7+1YZ+u/V5+oawWsQnsdqStr0W6jcRZ/ptiOiJWEBjtyAJodOMa3S14MQ2Q/nw7TMS42nOBcHXviXh6wwKBKr2GW5h57xDbUGtxElCt1y0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e31TfbWZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e31TfbWZ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-426f9ba85a2so371386f8f.2
        for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760540275; x=1761145075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7CXQSy1xFyJqHbdJX74Wcje21ijiNP/kNa8s//JKNg=;
        b=e31TfbWZJ17C5xIZ8Isz4FFwT9uWe87XmsSaEJsDJJ4ix7spI4o28h9s4p3Ej8nWik
         P7jk7Vw6ezJbVM7DaG0S+JnvXZ7d/0ZKLe9gTNbyg43tfeeitKLm/F52GQ9l88+YSmVX
         B6wHI2Xd54M59jW7JJRkr5TKLn4S7pbQ+0Wc2mF2fDgnM2Hff5Tgg98gsn/l87PB7OiB
         tdiD3qv/v7PT+7x60UrB64d8zSOwIt1NZskhMbZGtu12TszY8Maf+fGVZVJZLHVihnhZ
         KXhrujHPJ/h/sWvgaSapxdZXImN0dGkK4QxBOSRxuBXrsQghMMoZyghr6EEstltmU4V0
         mCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540275; x=1761145075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7CXQSy1xFyJqHbdJX74Wcje21ijiNP/kNa8s//JKNg=;
        b=Fb9erPQT+CsPs8Rad47KAaZtGQJdzpi3OBJV1eqpm5SkJ5bpmJM+FvHMQqc89yALLM
         ZNSLymj9DanfJzVsxQzGwWY+vkGdYMsVN+YqQsibLVVaGKfB3xhXAbGDvNQzmiEYjYkt
         u7XfaXRyb+r5Ui2r7EIFk2U2nPhnZ5A3rIcc0hK6N9H3KoYGyrj2feN7F8reZ7cdRCXR
         u01rPrkyBglHBvxU6SVfeQzcomBv+xSodEtT8/4Q502LE7oTdXVVwpeiDsdkELkOpbeF
         l/xgwumOo83da8RrrxifKivo/11u2AAFcNAYh/bV8wh4c807ntLbpiDwedLfz9mFVx1V
         N41A==
X-Forwarded-Encrypted: i=1; AJvYcCUiu1+mCpbPvXPb79jMrBjrpPoCKC13jIi4xNaG9AXLVFo5MuXONd4IAtxEOW3NQz+NphY4WIqGVHB1uA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxR4TPLaH0Wq71FgpSbL4xUVANtC9NDe9D/IBP7WgtYdUvjaR6Y
	cPMWiD5E+weXgw1s3dIP/j6DB83ZukOgNusmiRMtf1Y3RImKkpsdguhl
X-Gm-Gg: ASbGnctdWksfj0bwZKvqwYogRBcjpROxZaNuC4i/kIRoG4QpaY3pApR1lYuJCx8Z2ib
	Hdvrt1I2ZV9qQE8RcS4Gx4qBQKts4u4pzmb/3UuLQQwAhtej9faaV6P9VRVkn8HNmjWZxcK8y6E
	yiaXceoDstYfI5VeXokJG4hRhtGs54zgR+wmEQ0MR1FKSIZHGIT1wWzpILwm1/3jyrgkevw+o6V
	okjaDtJbFUnqyy3Gg3IGVLGk3ibUjbvAZd5ifATY3c1nhBNfNk2TZ75QfNeMObvNGwTPLN/Y2Uo
	olrdMSj7mUeahDwt6PgeLfpTCF10mIWyqi0KWOrOOYfy+3J68niLoVVbiDnpmxVHxTp2tE4bUX8
	c4VqX0x3B0IiBfzRKXlcq6oUGmKnxxSbPh5IALXlUsBE=
X-Google-Smtp-Source: AGHT+IEIgjyn2T823EOBHK74/bH5E8XubiheWOevx+dd9/z3Zim2+niS7dN8jYFnYWY5DdBRVqRRAg==
X-Received: by 2002:a5d:588b:0:b0:425:86c2:7b4a with SMTP id ffacd0b85a97d-4266d0da0a8mr18125593f8f.24.1760540274381;
        Wed, 15 Oct 2025 07:57:54 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce5e0e70sm29440947f8f.40.2025.10.15.07.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 07:57:53 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: tiwai@suse.de
Cc: Dell.Client.Kernel@dell.com,
	amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	regressions@lists.linux.dev,
	rf@opensource.cirrus.com,
	safinaskar@gmail.com
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
Date: Wed, 15 Oct 2025 17:57:49 +0300
Message-ID: <20251015145749.2572-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <87o6q8l68r.wl-tiwai@suse.de>
References: <87o6q8l68r.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Takashi Iwai <tiwai@suse.de>:
> If that's the case, try to choose HDA-Intel driver by passing
> snd_intel_dspcfg.dsp_driver=1 boot option.  Or disabling
> CONFIG_SND_SOC_INTEL_AVS could help, too.

Passing snd_intel_dspcfg.dsp_driver=1 indeed helped me.

-- 
Askar Safin
