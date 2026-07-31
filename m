Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1A244C50F
	for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 17:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785517500; cv=none; b=tMXQddaHMqZ8qPw+ovUPpE9wzRRNUToybXa2yaujepNjeJeFQ0j7kPyIx+HVY9s00RNTNi1vtrmBWOs6b2dLr9UYB0ZeuP8TtCOeKTSPJiWzD76gXTpMDgAU6IhDYbNhk/t6g4gs3TZuVR4xjr3ImwBolrWlYRFrYIGFeO2Qyqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785517500; c=relaxed/simple;
	bh=8G22stH9+mabi49WnBtjC7Xjo+sg3VNSjxd7j6C5NtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvlhXa/TSqVsIqVHenlqxFL02UwOEcXAoZtBXZ0ZUFVM0PQNhSUfa58PZIrY7tq5dFT45GxXEkM8i1scJXxtsxCa9eYSxK3fFJal6lVFiutEm9dSPgHkW8TgnoHH4h+w9TGknZ56NW8FLXzF95gHc/vvCXtAvb6HX+upGujPmgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjgL8yDU; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjgL8yDU"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so2036994a12.2
        for <regressions@lists.linux.dev>; Fri, 31 Jul 2026 10:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785517497; x=1786122297; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/G26UF84bxEx5MK97aH+lyUa5pLQNuqoVNWR4lJkkc=;
        b=KjgL8yDUo2P8kACknBiplXxrPwd2b2EGDBETpwtynlu+i52lG3XiFN/T4Vgg5Q5Ncv
         OktO8wAsoIOVsFgdO+sPJps4BLMLfwPU5isk42edV9yshgy5UPRfNH5DWFZVP/sFaY+J
         PbQeQrW1+eVTXov1zE3nCVHkhMWOfuEiJd7GFe4spOqwdd12nUrfUzfw/Hxn+3PLJg6d
         fJwZ6exPCr7oaRnUj9FU89JEOqnTiDnsK+AfwGlSf97rEGyBCEiBQojv+qK4elrAzXa2
         /34EYDBVq7DKnG3Jdo6svgwQeyhSJvbeUzLfRI7kYDLIZHg1oMpyBVvB8gEGHppCN7Pn
         G/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517497; x=1786122297;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/G26UF84bxEx5MK97aH+lyUa5pLQNuqoVNWR4lJkkc=;
        b=kBrNUpBwrzv4MSFvPkBIGF6FfQrCn3Jjbsj/q3QYhq/3t6sxE7PcqmDrL/PMWAZ5sF
         duCpBiycM2hzAdttuM7v+VliCY+NCi91hOw5DrfHCU2GL7frCK369eE2NBnVA0S9h2Pz
         IE4Qo1yMsa/xgKTnD0gApntmzqXxLR/7kO3YzOMwcNia+84lvvnf7yEox+xYAXJoGoUU
         bMKi/yEPSh7zjlyJRWPxl1+K0X3FNrgerXerGDnFhz+V+lbnvPJC9bHO8aaJf80hy5EL
         nuxOF0Z8DG/iGGr2yvH57LoXNJqNNVAjyOXKIduATo8lwmGHNxSrelCnadFyIG5aTwSG
         3Hdw==
X-Forwarded-Encrypted: i=1; AHgh+RpnWvAZc0Q6hcXYIwk+jQx2y0rGg3579cy8ytJTG5lYlGR9xlAUvQzR9SAGVVjW4SCdOMYkVvT5nP2k4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlNFKN4zhGAwDRVRb+x8/BmGQW32xsJwugHJB0IfvxbR0y9Ly3
	tLP9oLSgJujSc5mVGZNL9gsZMcoGRULvrO+k3unrAZFhHKFBjgDdVS0A
X-Gm-Gg: AR+sD12z5TObYq5LKDBETmR089/diGEwOwDNWO19ZaSeLlrbNVBRtyQj9JyBH0lsgVW
	rMQ17p4i65jeJ5dciAdPZzldr5AMzvxPiLMzpNderemxF5kLsaevJJRkEgBk4ANMnr2cP9IimY4
	2ndqV4boQFvBDf6eK1Gt9fLL1IJDvVAstjj4OYJg+HRchB3a2fh7gu7KrhWuqtc9tjB8Pc1Yxja
	aRKPqXElQJ4rImyrgN+4Itk1BnY+DEaPJvEUwCVOx2lHGkwUk4BgSydcMNX/jasTEP5J6KF3T00
	Zh6lBfP9zePipAHt61aHCIhwc8Yp91g825RvA2EhRZULZ/zJOjDaVdrYqp6CUvXOyrRS4PLsvUB
	d4MEOLykvdJ+zWRoMocmMVYj9YO87eoE1Z10m8cPazDvAUlxalZfjjcrvayLJW8xMbSS2ljBlDS
	6fASlAZTbKtOmyO0lwCTZsGlzQwt9IEj1Q4YtImAbjKpWaMCJVG7b4Qvw1iXL2wxUbp6R7AoYM3
	ROvk/9u
X-Received: by 2002:a05:6402:44da:b0:69a:b38d:403c with SMTP id 4fb4d7f45d1cf-6a0a7c6b782mr264208a12.7.1785517496865;
        Fri, 31 Jul 2026 10:04:56 -0700 (PDT)
Received: from debian.local ([2a0a:ef40:e13:1601:a8d:2d:6c37:dbbd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6besm6602316f8f.22.2026.07.31.10.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 10:04:56 -0700 (PDT)
Date: Fri, 31 Jul 2026 18:04:54 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: emmanuel.grumbach@intel.com
Cc: johannes.berg@intel.com, miriam.rachel.korenblit@intel.com,
	linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Subject: [REGRESSION] iwlwifi IO_PAGE_FAULT and Master Disable Timed Out
Message-ID: <amzVtgQb2p-_nShU@debian.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

0eaa1f245ac0 ("wifi: iwlwifi: mvm: don't support the reset handshake for
old firmwares") introduced an intermittent boot regression on my laptop:

[   15.974991] iwlwifi 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000a address=0xbe9f5000 flags=0x0000]
[   15.976184] iwlwifi 0000:01:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000a address=0xbe9f5400 flags=0x0000]
[   15.978501] iwlwifi 0000:01:00.0: Master Disable Timed Out, 100 usec

The commit only contains:

+       /* Those firmware versions claim to support the fw_reset_handshake
+        * but they are buggy.
+        */
+       if (IWL_UCODE_MAJOR(mvm->fw->ucode_ver) <= 77)
+               trans->conf.fw_reset_handshake = false;

The if condition is evaluating true on my laptop despite using firmware
ty-a0-gf-a0-89.ucode. So I suspect this is not the correct way to check
the firmware version?

Also comment #21 on bugzilla.kernel.org bug #220600 (which this commit
was supposed to fix) reports the same "Master Disable Timed Out" error
(although no IO_PAGE_FAULTS, probably the bad memory access is not
caught without iommu=strict).

#regzbot introduced: 0eaa1f245ac03ed0c6394159360532726f666811
