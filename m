Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FB72C181
	for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 03:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760413531; cv=none; b=lxoNYL78vzwBiaF2VcjpcFfL3WO4WW6hLMLShgUX0z/d3Vg8lCNxMjDNJnx5PE6GQo8fCAY6tqF88li6gr1rP/E2pWdTHvkf8EVOv8L0Rag/Va/BkzVpMNct3rhfLnQ6EAr1uYBygBcvX31JBMRxzNjv5hbotwOyX3NmhB+Pj7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760413531; c=relaxed/simple;
	bh=AgkShE7uH96yWUzpH3gSmZSEzMS6r4JBwD5xtKLDn5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsKkqvafoeFhcdABJy15nRLQFJoSOglKuyelo+Eb9r5PUMxOyZhHv73bB6JiIaeLjdOYYcsbX3L09DNBuCjIslvQOk+n8+GPKPY0hQdblrkiRDWr0KO1o7vc7+7SozSM3UCM+Lmk4fgg+zF1OZOly7K4NfTgYEIQySSLUhNFs4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAXc1Rb6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAXc1Rb6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e42deffa8so45546585e9.0
        for <regressions@lists.linux.dev>; Mon, 13 Oct 2025 20:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760413528; x=1761018328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/Zf3gVNNazii8FmNwFvhySg3us0RixLL079KZ3A4LE=;
        b=RAXc1Rb6v6ympOePfTvH+Bb7Yf34iPJQP16rJUeU0S150Eol9sk9swSAp5EalKwtDA
         WrdfGnGkQpSsBiRI4bUZ4/e31yaRF5ZxvFM4q8+bMRmZ7Zk2ZO2AAPIPiF7kTKIG7EPF
         bAoBI7fHKvQWFkWMFvS7Lm8O6a+PhnjHPEOoBMT4wOFfX/8x5pZeVUph2uIUMcj6bJHS
         88FF9+TaBwnJvAyz9mGPEoEdYmgsIcFs0gzKrecA9beQqWOXrxpcQpC72PjwCs8eK5q/
         g+x06l+NUt7PL08sBMjN2QbbOm6t+X8AWj+nD+f8fimr4OlIxjyuhWoj49hgS6EjzSkG
         iYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760413528; x=1761018328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/Zf3gVNNazii8FmNwFvhySg3us0RixLL079KZ3A4LE=;
        b=eYU4r7fjfj160zQhnOFGilGCxOVxkduGhggmOOpcLQsjVoqNoP4RGgq4SqIeQnhq0y
         9Yv/XJCo2z1bz3h2b0J2MyileIqy1TPVy5aVWktyLnwiEINCTFzY9p1xZVHvtd9zMVFI
         kUNJ+ashA2mTPzJwCLK4JmOT891V3mYRx7H4V9KgkofaVfvTn41+7iz5d9WXDljKrZ8+
         d6IhmVJ/Li11MJ7ccs8YoO15rR8sk2u7aR4Y7fsz/C6TSuSc5/AnlVAO+fmKP/nHIF+3
         +VaOXiDqSKUvJD69rvdtbZhcCQmI6YWywjTOAhV+OuM38QvTwQtk856c3kNDcbNLTd30
         9vjw==
X-Forwarded-Encrypted: i=1; AJvYcCVGKuizqFE2OEOHpuNTV2AJWi8f+bNkZVVgmOKhNXVCspMAL40VlUkUjuk2Op/gSoOTHlRG4llUD1i9EQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmi6++NADcRja97u7xzSPGMlNRHeva9CeZyj4vEIwtiRnzcRw0
	tyTSevCDLwniVpzqMTlXcwwmvlbh+Tix0u9PXjCu/ZYytZI7j1fTmiIz
X-Gm-Gg: ASbGncuRolBc4K1vC7uH36+NDKCP8RS86/mUoxhs9EJRaXcZwqnZydqrX63gXT0rzPx
	+ZMh2GKlEl4JcB9DjXGNmg7tApkRC7WspcJoOMHzcsTO+xAljIgt4UtPqHAn8VpWMJzDT/PL1pR
	7AGUypW3j9qXWy53Kr7ncxgeO9J6xduWnKaPG5Qieu2LDLbEuzOu7zhcmiY3zrfg/tlue7cNRgR
	l1k0dLLXNeIANsl5ifXXwHk+VkNDmmwqZoh7Cj494kz49CBf+hM30ag+C6JPqWn/qu0uCVfG9xK
	GnaOpylcnlPfo8MmwBo+NfTrcAh7KurT2i63aNW9CYcVTPUFUT2hpkOL2j8RQe5+rQSNz0Lk32f
	4EMjcXQHoMrmTfr9jpjw9VeCE7i12khLi/CKVYSOUwf2YqK4o
X-Google-Smtp-Source: AGHT+IEggN8xsJVVtmb8jYvbBjF9MhRjz4w96TxR6H4KvnRjXEw65+ufHxe8tiu185JOCLgglHSu5Q==
X-Received: by 2002:a05:600c:3d87:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-46fa9a9ede8mr159772445e9.12.1760413528030;
        Mon, 13 Oct 2025 20:45:28 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fab3e3520sm150377525e9.2.2025.10.13.20.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 20:45:27 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: tiwai@suse.de
Cc: amadeuszx.slawinski@linux.intel.com,
	baojun.xu@ti.com,
	bo.liu@senarytech.com,
	cezary.rojewski@intel.com,
	kai.vehmanen@linux.intel.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	rf@opensource.cirrus.com,
	regressions@lists.linux.dev,
	Dell.Client.Kernel@dell.com
Subject: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA: hda: Move controller drivers into sound/hda/controllers directory)
Date: Tue, 14 Oct 2025 06:41:56 +0300
Message-ID: <20251014034156.4480-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250709160434.1859-6-tiwai@suse.de>
References: <20250709160434.1859-6-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Takashi Iwai <tiwai@suse.de>:
> Now HD-audio controller drivers are moved into sound/hda/controllers
> directory as a part of HD-audio code reorganization.  Most of drivers
> are independent from PCI bus, hence it makes more sense to put under
> sound/hda.
> 
> The hda_ prefix is dropped from most of files at moving, as it's
> more or less superfluous.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

This patch broke my laptop's speakers.

My laptop is Dell Precision 7780.

Here is output of "sudo lspci -vvvvv":
https://zerobin.net/?bb0d52d5c33a1ca8#Z4cktfC0ofZhkzBU4/AFGpYAVJFXrus46nDeLQOV22s=
(This output was collected on Linux 6.12.43+deb13-amd64, audio works there.)

My OS is Debian Trixie.

If you need my config, then here is my config I tested with linux-next:
https://zerobin.net/?989789b5698e0afe#DKjA80yFwRFnLkYwo3ZnNZEVGowGyn5N78aSy8omoGY=
It was tested with current linux-next:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tag/?h=next-20251013
(and audio didn't work).

#regzbot introduced: 2d9223d2d64cb5216859ced6cc33fb3b04e5f98f

-- 
Askar Safin
