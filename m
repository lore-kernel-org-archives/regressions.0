Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD1433B96B
	for <regressions@lists.linux.dev>; Mon, 20 Apr 2026 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693546; cv=none; b=nDI0pfKwKC6M3MFqop7JEH56imcMOLTd7GuJle6gdBGmh9/Gcpsj2NwdJJtB/D9kB3fyZaUjeXnz3VnK8jsOyEUSXdmzM4I4to5J5/3y+iX8tyMW6ZGYrU2O1DrppS6oobgsGWyQYhldTkgFvf3fhgN5MBlDy8lyRTQXyrt7coo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693546; c=relaxed/simple;
	bh=8D0zMvAZqLgFvXito3AM7jNj1K2+4eGGAy+hJjYgCCU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=RSPf277WAyqE2XHRx6pd+KxBv4AOaOEaB2CYkoTh9utDa6WjUSGbra6AIu5q2xcmJ1HcpoXzL9IO9acHFcNh/+sJxJMOHvBdj0etBDE7t/YGk8pTh+EZoUlo9U8iE+YPhaFTDC3Zataquffy8ZeEsh3R1fSz3uIOU3WRMdImW08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=DMjVmdnO; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="DMjVmdnO"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c8cc7a77eso598413c88.1
        for <regressions@lists.linux.dev>; Mon, 20 Apr 2026 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776693545; x=1777298345; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADrJDYGplV5ltLlQ5RjbmI+FjLqRGfvA6e0BluhS7fg=;
        b=DMjVmdnOgVSLfz8ETVn5S6zq4vXehxLVCJ1nZUOJKkp2zrCZLiwidIoRsSan2ulU88
         08J0ylCOKmYEgneXBD9cK2QE6TJvECDdMRnt+6RRtBdE1yIr31xuXSQSXfIZvfcLeKAh
         tRzC5t5qlhdpAbVB8EFHtZ7Pg9RijWQe0Io7iSunWBfktOkUcSxCRzvFICgrOHTz9CLg
         cPQVErKU48m2E8JbN2EpzoAIG+dF+T97I+mS13gdBNJmLAcpVooZPIn0Y2uZJyPRtvtj
         5Exa21r16gGWhLoY14ceZh7sK11L+3mSUIBhVTIkalLKxx8e4OXf9ZysTAUT2BIMoZoa
         CbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693545; x=1777298345;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADrJDYGplV5ltLlQ5RjbmI+FjLqRGfvA6e0BluhS7fg=;
        b=G0GTcqJDWnhF1FDtqRbQz5CK/2J3mcSA5gW64KPdp+vXPnAQ6/SgGcy9E68VCg7DTU
         r1WPIlkmlyr1yHx8IZDi1C++HPBk8ZE2s3/qfK11nG0+jOnCCzj4L7X+4IEVai3cpokH
         DdzW009454MymtH6Jj5M+R0nX4KSkK1WGCE+mnl4lLaqhOQxtxa8mv9fldpqa3tRWdDd
         4gMlYHy5fGz6WoeOF8VqXpy+Rv087nopxAy3E2tXXW8Yqr11Yk9avdI3NflwFeC3tJ2S
         oyrnMmFH/3cNqoF2nVVLOXSmdaw67QcKJQGUAE4j0Ep7t7j8lXhgGSoLv0IjCLYiqVY0
         H4Bg==
X-Gm-Message-State: AOJu0Yy7bLAkQ5oadPFgV732B2+nTqiheMXJV0XNsoegpDQ+muW+kfRc
	3H1XwhDgGHgO4wQ46jDCIuNx1ZTK635SDBHBAAyCPnK7LWEq7VBzBam9TdE2kd1XAmz5MuPaDI4
	ZusCo
X-Gm-Gg: AeBDievsU6oA2ZIglbHX/kvaic3Di6xJnw08ZnjoM95CcYyv8MURc6xQVKN/Ckdtg/z
	bKij6s28rO53IQBaOaJMGbx8YePuqe+6v/bPWmfhqrfwMYI2W7wl598fIFAtm82R5nSsRbcjEu/
	aLe1ccy+aE8hjjrpI5zsXcAJAiM6XdAMyzUityWcke8XdG61I4E5Yjr3fYAVaKREd4sTPwoDPis
	DI8vkrYcpIcAkx+gz9fA0duTryBUNP56SGstTqdj6ozwlXjpJCv6REHbtil29x1NPLhwxKRU2fO
	c9ssTDzMth79FaYwoTG+BLzNeOGDPbwwPnpXTJUtwhfk8WUvirx27uimzkRru/E+kUY+1mhVtMw
	6zTsoYhEMAAdqleYv6AybbpNkaRLHbMW89HGsKO1lbrHPxXXnKvp1K0bA9Z5QMjetvGFlDwnvCS
	b0mq4kZbEfOskqXOyCk7R34Sv3gN4=
X-Received: by 2002:a05:7022:2524:b0:119:e569:f874 with SMTP id a92af1059eb24-12c73b4abafmr4983968c88.17.1776693544578;
        Mon, 20 Apr 2026 06:59:04 -0700 (PDT)
Received: from 062ea10430ee ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c919266f6sm2093081c88.1.2026.04.20.06.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) in
 /tmp/kci/artifacts/build/kselftest/arm64/signal/fake_sigreturn_...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 20 Apr 2026 13:59:03 -0000
Message-ID: <177669354313.1365.5569470091259719174@062ea10430ee>





Hello,

New build issue found on mainline/master:

---
 in /tmp/kci/artifacts/build/kselftest/arm64/signal/fake_sigreturn_bad_size (Makefile:21) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:09ed4fa8501726a1a9818127c531c15616e20af1
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  c1f49dea2b8f335813d3b348fd39117fb8efb428


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
': File exists

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69e559ce9b5a968309e7d958


#kernelci issue maestro:09ed4fa8501726a1a9818127c531c15616e20af1

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
