Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF503FAE15
	for <regressions@lists.linux.dev>; Mon,  4 May 2026 23:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777939148; cv=none; b=Y6dWUkVwNI0hVoRTa5blpWMRNvqonljlBhYgTRRU5MXdEZCk7TqszAe0EOe49FZeghJNeULA4rT93uFHLDQ+kWKe8YZA/PHxikz/IM/1xjDU3iCkuqx2YYkO4hX20KKHWVl2mklXJJo2EwVhBY6Le//fig/jYeENCc090wH1gY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777939148; c=relaxed/simple;
	bh=DbvdLckbFzcsiT1D2JTJ2ybEF2rDyQCoOBQFHWIKGCE=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=GBVl/DHoWGdXPn5lo5/ZrTDBlQ7uctfovoWeP4/qaoAR6147toUToG1SBpVZstpAVzcqC7TOAH70+7Acfk5jF78icy+JVva8TQ5NLT57/6Nuu9MfkuP4fC3SHj2Yg6PmVpEzcnIsx0/3Bb70Gq2piwoIQQZoI/S2NX+EItxn7fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=TsoSaEhG; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="TsoSaEhG"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c8ccc7755so6662859c88.0
        for <regressions@lists.linux.dev>; Mon, 04 May 2026 16:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1777939146; x=1778543946; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmAPxWSHCPF3ZnyTDeZaZ3lyy+dDfvSwYuSiCdmys+Q=;
        b=TsoSaEhGNMHezJvi8cuvGXsxp8JxY2iWEDEoSHBN7wdjEUvN9yzapb82owKNURUPUK
         wEDfroatnaIEPw8Z8vTpkmxS3mfJeGYyfg1Gj/ZccpqJ7ewjwAkb4LOBSmV85Z1XEkTR
         liyapNY7cCWzKlaoozrlJYciNMwAtuZ5Oo9po0vchoqlOOQoqAJN5xOdqd5LOdjKK0Ek
         8ztufV1GsjVaT4On0UM9oUsA3bVQtjciSFlhi0tIzT1sppfhoPYoya+lHLTQBmt77iGF
         sDA6ROrlYHJK5kLQ5epTlf/WsC5xGQbpjgW7rnf4lW34LClowGs2qCp2LPZyGsKhMX7M
         spkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777939146; x=1778543946;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmAPxWSHCPF3ZnyTDeZaZ3lyy+dDfvSwYuSiCdmys+Q=;
        b=bHOqkGcxUCys6Gdd/VdNaxuWsizlogaGa7jvEDW3wEPRwrjr64fHUofm9f/pXjifFd
         Kta3Um8TIfx7DVXn5ezfcF7vQxj9CFNkEW3lNsk+18zJkmxqWLRcg/XwQLZ2c/XAlr9V
         O2WMyNwgkf44HybIBLyT4e45Xxqv6OkiLXdMM/4XRSFlYdpX9EpdQeZMj8bSza2IRdMZ
         Cs9ogQ58d5E7y85jpqiUi5vYPpj+1py7eTbrxMC1TVZ22spmekapV5TImS3aC+Bemn9D
         j/fBE7vJEiUlFCAGZnhp83siDeepDJ2Xn4voK4b9FhrNlqwkHnbS6Bc9vdltn/lJbwnS
         fDJw==
X-Gm-Message-State: AOJu0Yyz+NlMvOir6tE2e5poYW3YWQD/FXONpq7coOvSuZCrpWAYlhvI
	w1Z0Hf5TtgaavJ9Fa6sJXl9fY7iv1LI9+BC0FacqodnVG4Me4Vyl5oudusyOchfqCis=
X-Gm-Gg: AeBDieuGNxKI8/7fWhAIR0aEVwq4Iw5HPNt3flc6zHGvssN/uDz2w9J4xZDTrjCRX7u
	dA+lIocJ3HLyN41R1xLNJMDSg0+kjD5VKNBnJsAKM5iAbXnDl8V8qbcwQ6zBEkb0qCV8zrVOQCH
	mtv3RWMyeGCZp+v95RlmTHKgagrCzh7Yf57Gj5p20bUA7+g72u/7ZMl/6Pg/CReDlwHMCsrJwdd
	JCOBjwKXbTUCn/0UWiclQLgrLzuCtRcFY+rIDmAwmivNVFcOzfxxnYvlJ5GSCOFOdKZxHTsbMoO
	Z5kvLItC5vtrZWSQpVNBsxc2vCCokaqv7ddrXOMtjfOf3/HOrlYYaHH4nMXvtzovtGbgK2fEkPb
	XqowWv3MoFs1C3y2wM88SvADGCZ0ZEXvHBYqg2eS8OJ6KtGm9b902dCwwz7nTL8ByAz8FC4yMd6
	I357a8Q+CsqRhKeRJ2qGAkN8WuIdg=
X-Received: by 2002:a05:701b:2412:b0:12f:1f67:e744 with SMTP id a92af1059eb24-12f1f67e7f4mr1967760c88.44.1777939145815;
        Mon, 04 May 2026 16:59:05 -0700 (PDT)
Received: from 997d03828cfd ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8431037sm18354239c88.12.2026.05.04.16.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 16:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) variable 'num_ports' is
 uninitialized when
 used here [-Werror,-Wun...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 04 May 2026 23:59:04 -0000
Message-ID: <177793914437.2560.9287713196857718000@997d03828cfd>





Hello,

New build issue found on next/master:

---
 variable 'num_ports' is uninitialized when used here [-Werror,-Wuninitialized] in drivers/usb/typec/mux/intel_pmc_mux.o (drivers/usb/typec/mux/intel_pmc_mux.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:4c562376c15477320ad9a138b83a5256431b57cb
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
- tags: next-20260504

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/drivers/usb/typec/mux/intel_pmc_mux.c:740:3: error: variable 'num_ports' is uninitialized when used here [-Werror,-Wuninitialized]
  740 |                 num_ports++;
      |                 ^~~~~~~~~
/tmp/kci/linux/drivers/usb/typec/mux/intel_pmc_mux.c:735:14: note: initialize the variable 'num_ports' to silence this warning
  735 |         u8 num_ports;
      |                     ^
      |                      = '\0'
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69f922810e4ee292cbd1a001


#kernelci issue maestro:4c562376c15477320ad9a138b83a5256431b57cb

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
