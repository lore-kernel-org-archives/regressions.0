Received: from mail-dl2-f33.google.com (mail-dl2-f33.google.com [74.125.229.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18F722A4EE
	for <regressions@lists.linux.dev>; Sat, 26 Sep 2026 21:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790459951; cv=none; b=j07siD4a5UyNnEo8uErS2l8Glvd28FQquub/LiMh/Lh2ZI0tlNl8UTV5uJQf8SpNwKyR13y62uN8b8OZjBCb/XvboHG60rcxaikkP54s0vAEE59sw0zU0j9cDqXWA00mvTGJ8DXeP9dpZ4PWG7GhdMNmSa3+i3IgJYDg4Gxdi1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790459951; c=relaxed/simple;
	bh=h+LUVkyFIE2zlAjtE/YVsH5AQ993c76JZHeeBRNcqgQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=pAJ6gZRYImtGmthU5Dr6/KSgfCW1T9JarCBARAm5Us3sSYq9E6X05VmUFGB8NoLY64Dm8KyTpwb/fYfY7YKXl9RplR704uL4dJH4YGzY6noicbjoOquDiV2bINnXt1WivHgLFuurKywNQOzdqoORztmLs5x1SxwllRyjIFwk6GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=iscEJijw; arc=none smtp.client-ip=74.125.229.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="iscEJijw"
Received: by mail-dl2-f33.google.com with SMTP id a92af1059eb24-1438e88300cso1694148c88.0
        for <regressions@lists.linux.dev>; Sat, 26 Sep 2026 14:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1790459949; x=1791064749; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XYBuBP5Xe7rdPxBA07StsgmLL2Qwcxp/fLZua7seV5Y=;
        b=iscEJijwtTNfXo1HowXMGOILbifsSe3zrOfMsmS8f0YJZ8QzkixfTWzGtzJthbBSXO
         H7IC60zdeoJg1kMNxbUd9iO0TMVniGdUTcmLInb4EeVHBEcYUG4xryDRIeSyCdRIdzGP
         cZDUkc2RkNAndvrXH/QmQ9W9o0kPsCYuZ2Xh7ryKZ9fPJ08Z8S4cQBs+D+0rrlYBC3my
         OLp1mtubmdkUKXHWEYqJEERndC+j9O5Zl4G5lFRmfp5eaPzXxudjJwf6ByRfUaF5FeWB
         Wi3AvgF0GB5QKKyYV8PslazNVyg4IPn4OFUB3RyQ3Ct03Vk/oEGC5VlIG+Y8xfH9PZh2
         10cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790459949; x=1791064749;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYBuBP5Xe7rdPxBA07StsgmLL2Qwcxp/fLZua7seV5Y=;
        b=V9RId7F0Wbe2czsHOWUujGJ8DabZJCQyHrYr637K/6ltCdnHoz3b3wU9XYBFFcNqjZ
         Iy3r/YzgOxj6E3RAqtCvv/EoshuxRCluE1DE1Q/vQYegWYMycEuVqrbyUgMYbNIAvFyO
         ogP8ImKka6R4OQdfWR46nPj1uZ0bj+Up6f1VIjXqeRw6y8qqNaTz74Lqaq6uLNGCeuFo
         ivTB0UlwIVku4xvcL+MnZjBKITyVAxyN/DlnQ8RDdxBwvO6/0aq4yBf17hy0GJZ3dHjF
         1o7LvlqKmMAKHPxvS1oCYWTg3MsRKDQDQH9/Tur8s01osGdKm8q6pwTA6J88F3LcdNHQ
         AF6A==
X-Gm-Message-State: AFuF++moAgUotrgO+p513n/2RymrfLB5CIZxKRJCvBEFDlFQC06Y01sO
	OC9r2C8POdZhpiD7pxfgO4kalxnORUU+qvlDxDbISiT0fdoFLk+bwnNUDFrJis8NDDs=
X-Gm-Gg: AYBFou1ldcRVmUOwOVa3ywHUK7eVSOrBWQhLLub8LGBtHs4A8Uikg4R9WMLcKJHN6xO
	D2VvvxIWM/WZ95lBN0Hj3SYi6CY3hDKqhofTS/KjQnImL08csJqus7Q2szSJ4QL83ek0Ab4RMdt
	5JyVHTVSTbX3rZrBdQjqrcza5mXXa5mw5jJnCiBPOlQMm3OmerG73DT+PGgpiAuiQH+qI9u1hvq
	9OLs3Q/svvdnMFe4QSdJuBkNbe2CHAWd5/rynXl4Eb8L9ZtW/GBzznWTPtabaCqdvHX45IJCCNs
	8F0A4X//bZRaRI1g080XPvlNZgZqXnpq0pC0HK3CVV6j7kV45HBAR6LSrTSDLSGEzLqzK0cCxZ7
	6dfJZUZoVnD+vojUx3A6DMuZ6/HgbNfuyIhVW19yLCeLihBzpgZpUhkrki5zYQVqdYGTQS0Ylnm
	mxv3limwV/HtjhYyJsvdMB28SLyI3aMuqj859sTJDQ7rfkUe2GErJvA63qqknmHGk=
X-Received: by 2002:a05:701b:21c5:b0:143:7cca:e14 with SMTP id a92af1059eb24-146ce492caamr4445645c88.12.1790459948731;
        Sat, 26 Sep 2026 14:59:08 -0700 (PDT)
Received: from ec7b70f3a45c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145aa0cb7bcsm13530125c88.2.2026.09.26.14.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:59:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build)stack frame size (3128) exceeds
 limit
 (3072) in 'dml_core_mode_prog...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 26 Sep 2026 21:59:08 -0000
Message-ID: <179045994373.636297.9560581777523775419@kernelci.org>

New build issue found on mainline/master:

---
stack frame size (3128) exceeds limit (3072) in 'dml_core_mode_programming' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:10513:13: error: stack frame size (3128) exceeds limit (3072) in 'dml_core_mode_programming' [-Werror,-Wframe-larger-than]
 10513 | static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex *in_out_params)
       |             ^
1 error generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179045994373.636297.9560581777523775419@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:aa9a8f27ecff599ad18ae0eda5a089c9ea1bf7b6
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  fd179f8a05be3ccae366b9b96e176b51fbe54aab

# Builds where the incident occurred:

## x86_64_defconfig+allmodconfig on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ab8139f5ec73975aae631b8

#regzbot introduced: f14572c203d57492e1d4e5d7851a3b143e083b82..fd179f8a05be3ccae366b9b96e176b51fbe54aab
#regzbot link: https://d.kernelci.org/i/maestro:aa9a8f27ecff599ad18ae0eda5a089c9ea1bf7b6

#kernelci issue maestro:aa9a8f27ecff599ad18ae0eda5a089c9ea1bf7b6

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
