Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A692D73BA
	for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540571; cv=none; b=BCW9ohXFZdDl/MwER/5kbdoP23TzURKKntSAEbmr7P9M0T8rGBcWazFIj/WYBqFPGxFZSUSJ1rySCsBy+qes6k7Jks5genyj/rjD4bAL6znehKRJCaSxGprGeOQminsO4zqKxGZv3tL1piC2QtIImmRM1071YQEako4Z4xrkczQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540571; c=relaxed/simple;
	bh=q+FSpGhO46Wdm4E1xu8JKsgaETCDKFJOa1krZ4FdTC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8FHfItJlOLKSYD6D4NLcNxC9Q5pUaOzgnRG9CJ1OfFiJk+ll5NON0R7Ncwyq7mgOr+mxiUbbzaJgH2eIpVDhQJyVewOsBPNOraCGTG1VPhqAT39vkisjyDfWL6dq9Jes+jrWfabTMnc6Yp3VkwOpygIvU3V+yvtUbRCfiGd/DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbHN0CvO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbHN0CvO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47109187c32so1361985e9.2
        for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760540568; x=1761145368; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggq7M6Lrzp3o1qgmvHWFIuwQRJcN1Z0KczFO1vDxzUc=;
        b=ZbHN0CvOGiaqkQ9iAkQXiMrEupix8xMSTEOmUtvRpj6/SOhx/oVdXOnLtbFJBaGFZh
         owQCekutzcIsnVT+JQl6185kfsbPFALcN1XieEhMHyW2y7axSevgE+dYXq97GhlQAspK
         Pi3h22Efk4khIJzDkl2hO+dVK628/vj1EPfXlm5G5mevJ3uadRvyI1QISJRbFK1oOnGc
         nnQo5QlQtaWtEErzADssf6mLJgt2O22BRDcsvX92FAG0F0yzAKJVENhZqtroDIapeWLJ
         32tVG0mwQ/pspqlmLDaHV1LJSTpjjpol+bsRjhyBNY/WA3PYqDylYuCqK9CPvsWrpLXP
         INPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540568; x=1761145368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggq7M6Lrzp3o1qgmvHWFIuwQRJcN1Z0KczFO1vDxzUc=;
        b=i7X94QMXGN3k7oHM/CdMoohPTErCMrUtDzfmmPvYX3VFyO+cGVBr56GaptGQzHSnG1
         05PiR96iTBAXKn01FPsLCo1QYoJ677pbPFqnUoTaSRlO+ada2gsMhEguK7yfvBbT0hyI
         BrwGHWVOuIroB//ZpiVHe3lgHh7AzkjdS0mpF6Eb3CRrms1uV40fNG3mpHHvHMg/2Nbv
         IrJn4NLnqB/LLVGI0CbK7uQ+25sTGYldf7onu9saBetudAWz7AhPMXiLA6SxIdfa9IEO
         5R698GbieydWabeh4jW/MrFdXm4lzSUcjOPeu7DsoMkkgQmCZHO5/trVEZESz3xLkaB5
         eeeA==
X-Forwarded-Encrypted: i=1; AJvYcCUfR2cDv48lHHQUbOi+iQtfGUojMMsx5I0u5VMQZ9WJBwOCaOFTzqg63u6JbIrdiPsHjYf/KXokTRYEYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpGx9hQlCYcZBf2d6FOamcbjrJl0rAd29voNn3qyLbKRW+GaHv
	rCj7yGoYTl1IiNQlgu8IlDZ/J0u7nSZ4t8BQ0hhYOPvy9qUHUgzti8nA
X-Gm-Gg: ASbGncs7WZMfRn2iAlEcPPKex3NUH3mNiWhdXCAH+ut6uyVxdkqnm5Lca6qJ4VBLpFm
	w9Gv7ua2aV1xGIk5s3N2tK5GUhCjXeO+T74m0aLBIs4jbJcxnxejCv7WuryTbMgbZzYa4JzkQAe
	+HQzSz20XqN8dMjVZKnoiEzIElnbPNYoSi72/0evcgK/qh/yzwHl5laFNGJjZT6092JrndQ4KkR
	WLzQK6Fnk24rpnTAxDtbWxoGCqkiqCiADxitbQ6VYBcxJ87yLQTymfWUJOup6kA8rFypEtvVL/9
	5pmLatKz8rAyDlgp9MZwdwXf0/kIFD4f0B2BMjtcTTm+iZAmzA4tLhs5qcOeBr8BbEDIYaQvjH+
	aJUKV1HwXyg08SJgCfNVe8zJO7zy5Dqfa8qnvAlB1h8YBOIOVgIzdqg==
X-Google-Smtp-Source: AGHT+IGS/QVW0HLNq8PhnL/BhZ4rPHH074sLFq6l9QJq3QBiekvGfWw+WGrsFIdkvUG57uPITbSjMQ==
X-Received: by 2002:a05:600c:1f84:b0:46e:4cd3:7d54 with SMTP id 5b1f17b1804b1-46fa9aef45fmr203722495e9.18.1760540567884;
        Wed, 15 Oct 2025 08:02:47 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb55ac08dsm296159645e9.13.2025.10.15.08.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 08:02:47 -0700 (PDT)
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
Date: Wed, 15 Oct 2025 18:02:43 +0300
Message-ID: <20251015150243.2682-1-safinaskar@gmail.com>
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

Disabling CONFIG_SND_SOC_INTEL_AVS didn't help.

-- 
Askar Safin
