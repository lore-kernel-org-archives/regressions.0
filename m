Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FC27381E
	for <regressions@lists.linux.dev>; Sun, 23 Nov 2025 22:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763938748; cv=none; b=b8ZKT91c1A1xRnOI0Rc3Q8+m0ithBeRL2bq1JdMqvCF2vJ54DQZ5amhACHYdL0pQuiV1QdEYDU57WIxrt0gw3QXbM9Q0dLUyBU4rmUashsuhwZ4JegVnRI2vpDq6jrQ6iKPSLNt8wooiykCzCXmXQW3PNpOiJALYnIxcpWl/7/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763938748; c=relaxed/simple;
	bh=fCAO+C2760ikbqOUbTnl1Xir6cF8StlYXflP7h6n0iw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=uHposLSHyWZXTqdNBIXfNAy3gsm0fmCdcqppVwbCFz5yDWR78WA0RhNSBiK+00lXl++TYV05t1TYUUYdl2c3bHGPKoZR92V4zkyNpl6khAFRNP/+7or28KTeMftiR1pa61wfAqJnlPe7rHyviG4GnCUjKwkJ/JKoxWFv+v9Rl5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=eJvUwu7Z; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="eJvUwu7Z"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297f35be2ffso56391165ad.2
        for <regressions@lists.linux.dev>; Sun, 23 Nov 2025 14:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1763938744; x=1764543544; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LPXA4xIlDASvaku7g7q0Uf2NzCzl5WPWEZfRWYt2hk=;
        b=eJvUwu7ZgKBsdA407PRqURT77ThbSW1dqo224W5a7TnbKvPDJrOxEq+5JZnNb+4BHs
         JXARJYzxdKKGG4pis+U60tQ4j11GsxDqzFsH1M2NtLk0LrV2Z9QfSvuesnhlo4jJqc3P
         CNWjvkkQ5Nf9YKNaLbW4MNrNqMcXPMGPUDyrcA+ezQtKsppp4tjPHRxuRAzu+sTS3zaR
         HTPOCQIwE5EQOg7J7OqckLYHfQG8L6Sh7TiYXtXuybFIszKceUcuuCpbRzUdmDTWVz/c
         OOrgckcHVzQHVsDVMGgjOYvBnMCPVMGTgaqNbE8BC3ARqQdPF+2L572nqevt3Ze+putq
         vo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763938744; x=1764543544;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+LPXA4xIlDASvaku7g7q0Uf2NzCzl5WPWEZfRWYt2hk=;
        b=iEtZrBiGeKwS8lGme1innnl26nt2s92n7DgcWU9zm7fcNdmkRwMwv/r0EcOftvLwZL
         ovqpVopdlzeSk5dEtcPukxj6bNDlrPCZS2CwfVwAq/D6xt4Ci7Vuq4WHYRliBhGHxEpW
         9LQ/yqbLFu5pba1tFhba8dn6cdvncAiCyY1DXqIjgCv4yiOTac3D4W1Ac9YmTjlLG/5H
         CIyq5c0eHeB+motVMp0rakBArzzpm/BHVATV7nvi2qcNuRsKXAMP8LG+AembXeMkc96Q
         gf7wg1w2DBXpzOAXeSx3UCzxkq+XYZlSTC42q+PaJsOVLcEWg6Dl/OwiH7zlzAfEuUI6
         WFqg==
X-Gm-Message-State: AOJu0YwXn7lJpd13BTL+Yyh85XqUDqYEV+edeQm/n0ouDkicjTkK4htd
	1S7nwtgmA9VeWWm/dBvAUuXqSxVctVd21hIFxdE2xPiOGe/IVPfj09noQkA6Om9uqxg=
X-Gm-Gg: ASbGncth8ZmiVjuWHMvPlFMKJ7ru4K7ETAdKFv1AR14n1q+ecVZK5at4klDJESx0w0N
	5rxqYBpEhyLts8gub0hYDI9kRqa3X6OBHscfZ0C0Ywf3+Cij/KwWQcAu6TW4Zojb5dITYQMOivZ
	Qtdtv+geb6xUzfHqBbqMcXLqu83t1mb6IVw9KtBY99wwef5OTfsyYBp5f4IZSYxRG0jX8kq/fIL
	GnwtTqEmspj/0ueGvDO9chrhv/6isVt/JtNd+Q94KQfMOBned3Q8KjwZlH2Qqq1lpjhY9wsX8J9
	kcYx1m6H7DRmo85OWjeX27oQZ4ab2IskgWQNXCfGMi7diaC3scbpNOWF/mcund3MyvFmhrYgTbF
	6nPA+JhELREmg2BCEpFc5gUTa52sXOi/exGZQPtePvOce78P1qV78kJjVeDMHs31MQG/mj+y4AO
	3h0THA
X-Google-Smtp-Source: AGHT+IGgxiKPOic0x1XwZIHH1izBBV72j2vxNSvrHnVQrCW1QtEryPOLapibkieUCb78kuGxho0u6w==
X-Received: by 2002:a05:7022:eaca:b0:11b:adb3:ff9f with SMTP id a92af1059eb24-11c9d86113cmr6939409c88.36.1763938744482;
        Sun, 23 Nov 2025 14:59:04 -0800 (PST)
Received: from f771fd7c9232 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e55af3sm65398776c88.7.2025.11.23.14.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 14:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) in
 /tmp/kci/linux/tools/testing/selftests/acct/acct_syscall (../li...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sun, 23 Nov 2025 22:59:03 -0000
Message-ID: <176393874323.4851.15726042279126599032@f771fd7c9232>





Hello,

New build issue found on mainline/master:

---
 in /tmp/kci/linux/tools/testing/selftests/acct/acct_syscall (../lib.mk:222) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:a69b3bfa60e2f5b5d85751d4a212dc387970ae28
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  d0e88704d96ca0df77717320fec4ebabe42c8a94



Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## i386_defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (i386):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-i386-allmodconfig-69237011f5b8743b1f5cc6e0/.config
- dashboard: https://d.kernelci.org/build/maestro:69237011f5b8743b1f5cc6e0


#kernelci issue maestro:a69b3bfa60e2f5b5d85751d4a212dc387970ae28

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
