Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A47C3C38
	for <regressions@lists.linux.dev>; Sun, 27 Oct 2024 02:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729995341; cv=none; b=N+wa+ssZP7OBarStPDfXtWAY1lNukmkSU2rSA+Q+XqNpK8P8a5rhFHDUf6hb9ttBnrouA625PWoLpRrnB2KPXyTO05YfPgG8KODQDsoHoMgcr/W4wJ01P+luhmtGn4SBsDe5B7JwgAxdf/dKs+EzfLO5C0pCQ/7b3F2kLe/v5xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729995341; c=relaxed/simple;
	bh=hxyYesuKW8UwIewwsEyAhRB8GZYN0soW/MiwfKG+nlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cDPQPA68Pa8ogAnc+iTqzkpGn62BlUh3jqqxWd0kYIdU1nGO0PCgeURv8qov0Inf5Spg6Wxh7KYj29gj5Gtd8WeKzuod6RBcGIxUuOr0VHrbrwu162A2Rhm9AvJ+53vE5mhYgEqDtWFV9Z1Zp7V/IGpIikfxUltw4aDgLKY9Gno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrcshfPk; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrcshfPk"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e30db524c2so2410681a91.1
        for <regressions@lists.linux.dev>; Sat, 26 Oct 2024 19:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729995339; x=1730600139; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kn7556O2AaB8qeM5FvO18kqRJQd5qATE5xO+xdeHALg=;
        b=VrcshfPkCbMsVlcu5Jox+wDRbQbAs4Z8mpVfRvcBX6G+F73H0vHc9FXlKKnld0GZAV
         TyPQbx99jhaq4NdYj/t/mqnP8KIJIx8SSuq6ZWfz1+YSGTapXrzEzAxR/CE9YMzqEyau
         7hFkTbPzFAU9jxQreMkGAIduCHNsrVsz3/ZsYYoIvU+ga9sVIfmZcr7Q63hoZA3I3tPq
         eI60N0oFgOcWx/gFpa9Mi6hJaHXH2ioK51IOwiVPbSkJQW0/m0lUOusX9SnyuxEwQ9VO
         F5QJsdAAIAi70woeBgon8yVzYi3VSjOShCCjrPcxG0qHHzKvDmMsCKM7au+bIBpUVWY0
         KY5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729995339; x=1730600139;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kn7556O2AaB8qeM5FvO18kqRJQd5qATE5xO+xdeHALg=;
        b=s1WcvjT7sSwWkrOAbRwS20vUCJJZAAoIS79jUfUYhwHJ+a2V2jEo4yiICtTqyaCJQ4
         +Dh20Gqbm3butIeP2kOWSE1d/yASVr/xlLj6fwc6spWn58e7fA5DCNKiHXimh6Ba109i
         +/MrO7uOkREIubfi5DDvq3ef2SH37D9ytFSE33DBMisAqgckHpHd/BVNSoPAtlBUPqUJ
         MVUPa0aio1aJ1worMgk0vdyaEvDI903kXYwg3hYOAa0u2c1pDujUxdK/Jf9rT+0BMqng
         nuDxWEr2CX0zO+HznPOVUiCIHDMbQLH4QmEXwpeAcChGg7a5mIsArHEUB67UdsHRPyAK
         K/yA==
X-Forwarded-Encrypted: i=1; AJvYcCV7ai2z4xybDguu/lMv+kDV7pyOrnfmlCIfL43JESv6HVgt71d+unOBOV9ZbNsfVJ26e4pfkyRmjLpdpw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9IeR4yrmyGABIGhOvhK4m301ATRhFF4LxQudE80vq288zMkT2
	FwcecZfQp1nHrzsEZ7SXjzEwfLZ6fBByx6PqJEh+cc70Qx5Ifv3v
X-Google-Smtp-Source: AGHT+IENEg89SvDTJCqpYtjzefuJS1rHwhjH3fDPuTP5uGu9fpxx8xMfiIHHToJFRdh1bmKSuWC1JQ==
X-Received: by 2002:a17:90a:f301:b0:2e2:b211:a4da with SMTP id 98e67ed59e1d1-2e8f1070126mr4604251a91.14.1729995338616;
        Sat, 26 Oct 2024 19:15:38 -0700 (PDT)
Received: from xavtug (2603-9008-1600-2265-a236-bcff-feba-a919.inf6.spectrum.com. [2603:9008:1600:2265:a236:bcff:feba:a919])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e4e631esm6201983a91.27.2024.10.26.19.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 19:15:38 -0700 (PDT)
Date: Sat, 26 Oct 2024 19:15:30 -0700
From: "Ned T. Crigler" <crigler@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] disabling and re-enabling magic sysrq fails after
 kernel 6.11
Message-ID: <Zx2iQp6csn42PJA7@xavtug>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

It looks like starting with kernel 6.11, disabling and re-enabling magic
sysrq fails with these errors in dmesg:

kernel: input: input_handler_check_methods: only one event processing method can be defined (sysrq)
kernel: sysrq: Failed to register input handler, error -22

after doing:

# echo 0 > /proc/sys/kernel/sysrq
# echo 438 > /proc/sys/kernel/sysrq
# echo 0 > /proc/sys/kernel/sysrq
# echo 438 > /proc/sys/kernel/sysrq
# echo 0 > /proc/sys/kernel/sysrq
# echo 438 > /proc/sys/kernel/sysrq

-- 
Ned T. Crigler
