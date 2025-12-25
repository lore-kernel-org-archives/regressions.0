Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C91B4224
	for <regressions@lists.linux.dev>; Thu, 25 Dec 2025 23:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766703711; cv=none; b=N9Y+A9QMhaRPZOxzJz7IrFnC1oNY3gXjfZALaPkK434HEhQQkWivUIkCDU8A/lh/5TGOjKAIi8W71rePADc1pRfeRsfJz0SLL1zn79VoUvOZGLxpTbJvxFG+q3L/et5QasDTCyXHrSNUQq5iZzxNi2tu+80pvYboCwaw6ciG0FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766703711; c=relaxed/simple;
	bh=1nXVJoQSdXGgbMKh9pApq6y10cVhUvD4OxYtOcA9q/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFvMimrANo9Nrml+b4+67iu9Rp2q81BqZlSfS593jtN9AVY7gC1eDM1JkpTGE8osuRmmKn5HxgwgGXzIvZu4LCKYhYMq3jRiyhZIykpjrO/Qe3gMWxJhDOjndQ+K8hv4jcBk4cFldlm0VvQhIFF4EC5P9/ePOGEsx0vGPzaHzfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GniYVd1R; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GniYVd1R"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-595910c9178so5585274e87.1
        for <regressions@lists.linux.dev>; Thu, 25 Dec 2025 15:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766703707; x=1767308507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncHdqjENSZCuc/WVDnKcW2WQO5yfWiwK76OS/LmTBGY=;
        b=GniYVd1Rk5tXtCvfCqj0TQc+YavtMsGCAdpC5jPAuEdXGG1dL5gOV4rVTIpL0VnV/m
         vI5YYqoh2bOLjvjYVi9hYM+iBfSP9O+BVgrWoqC6yGwTUzxECNcFkuBIcLPDuaNE1Oc2
         2ZV9di+9woErInhMRJZV+4+zQqXSwDRMXMtr+KRVYV7e/Hi5x5H0eEXsktSPffQ2JbYE
         vpFjp0kiqUIJqZoeoGdfvIM4EPtsO7/J0XtMfVQ99Ogefzil2jEdM/TlyMyMrivqt/jY
         Mulxg68RN4QJ0SvLVQjZXKJkOOFiasGsmCl+bc8Z8iXgZDnLQe+awBlkxrXfDCizIQE8
         OWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766703707; x=1767308507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ncHdqjENSZCuc/WVDnKcW2WQO5yfWiwK76OS/LmTBGY=;
        b=dK5Cf+T5C6ULlOINrE049RVufYk7yGhVucLZov5F0Y7g0c9NixrMZHdbZsJkxWejiN
         BAIsGS/NamFIey36sQsgGuAMJRpp1Ngz9CmfemXrgkUuMyxu+a8dF+bPAHDsWkM5rzA7
         nioS/WgHe0/3G7rOuSwtUAuEes0+ttTuo5jgFk8ExwwXKBDSxcP4IrFSE4vsgEezhMVJ
         lVyVv4X7Yd1kiSG4FOVNTveF5Fj5tWkUr3NjweMXdpF6dG8vR3uBgDr2zojMS/e6G7mm
         17VUcv7wqdgNOXnGLbIgbhEo7P0XkfGdCHhLh3kQ4ZGFPVrV+RXBeeWy+RAcY0AzCSw7
         c3Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWfPmVxj184/fEP3Bh/GTcq6DHk3bcgcXhN9vJ4qT0RUS9o9UrLRNh9B7sPZdTSiFT9u+ZAIc2c6CEe3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1EczA67jIrZlQlGO4CCthGl7YO5TyqrMlIx9DeCMu8raMxsbe
	SDSXAsU1UvHtcOJ/k/UUSBUNjqqk7E9NQpbQasf4Vnw5QMV8IPRJVDlj
X-Gm-Gg: AY/fxX5HJXWVO0HJurDlMuWbtYev1QgmGJQ+QaY1L29yNom2bFcZ75ZC9cZSYVnvAwl
	mIgFAm6Am3wLGm5AIucZ0N38gqfFgthaM9mdGnYry0t1MAVe5yjd6xps/iTHib9ZQdF4bu3fz/n
	xCzfMA4sgZKRMTr5+cXXYVEjnH9q5UNLlqG1v9jn5As6krjNWxBEuvrtZtCeTCT5d0Kc7vYe3fX
	J/rfQ2jintRHlII0dOQMr59TSYbcE2y4UNEMqvAhR5byB13MwPYReIcnzqTnNb4xptY5UWnEWLs
	202XAuK1cn/Wbqk8V2ONUhK1ahvHbhNRRo55fES87A4l9vKwBExrBzEgLx3cCclBWmsN1KkAwCX
	ECCh6o6A1Oa3wIQhYuwrc7HsqxFAXFFtxQKYdb7NSurSP+kjfuEvtLu7vggODFSZ+5cmW52Kzt/
	8rD4x1Xq0j
X-Google-Smtp-Source: AGHT+IFNGb1M3X9NAk8pG0TWDgEZk3PtPJ6uu+jwzwArZcBrnR9KLLHpjsWJe6q+HecZnTMtk8Thqw==
X-Received: by 2002:a05:6512:4017:b0:595:7b90:4098 with SMTP id 2adb3069b0e04-59a17d1e552mr8076867e87.19.1766703707267;
        Thu, 25 Dec 2025 15:01:47 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-59a1862836esm6223067e87.98.2025.12.25.15.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Dec 2025 15:01:45 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: mario.limonciello@amd.com
Cc: Dell.Client.Kernel@dell.com,
	andriy.shevchenko@linux.intel.com,
	chetan.kumar@mediatek.com,
	chris.feng@mediatek.com,
	hua.yang@mediatek.com,
	len.brown@intel.com,
	liang.lu@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	pavel@ucw.cz,
	rafael@kernel.org,
	regressions@lists.linux.dev,
	stable@kernel.org,
	ting.wang@mediatek.com
Subject: Re: [REGRESSION][BISECTED] "Wakeup event detected during hibernation" on Dell Precision 7780 (was "[PATCH v4] PM: hibernate: Avoid missing wakeup events during hibernation")
Date: Fri, 26 Dec 2025 02:01:42 +0300
Message-ID: <20251225230142.2403756-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <d06be6c6-f5b7-4259-b76a-20dc52a5ffd3@amd.com>
References: <d06be6c6-f5b7-4259-b76a-20dc52a5ffd3@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mario Limonciello <mario.limonciello@amd.com>:
> Can you try using command line instead in case it's actually the 
> touchpad click still being registered?

Hi. I found another hibernation bug and I want to fix it first,
because I know how to fix it:

https://lore.kernel.org/all/20251221063214.3276685-1-safinaskar@gmail.com/

But I need help to proceed writing patch.

-- 
Askar Safin
