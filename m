Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8151F4175
	for <regressions@lists.linux.dev>; Fri, 14 Mar 2025 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741949274; cv=none; b=WJzAEZnDFsYoxzkx1H4l2JuLFqeE1mCdcKPR6FX7gnNNR9KlLSB/bIGmv15ghhH0lWpNuhly1RWsFrXUTpyaqV+U6Ue9REW/CvsJXNXffL74FS3QrkrUYOC60XmUrdorwZT3OqoD8Gxla/h4TrkGarKhClozYGIbmhaJILt4UAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741949274; c=relaxed/simple;
	bh=V5UZcSrB+DBbkt7kNI7CUlvdnpS0ihjryCg/aFs3+EY=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=NIYtdRJE4q+mYqpP09t3nYXQCwMI9wsGHoduA/qMzbiHldxAxVOF31mlEEqqa3fEfz+b8GVKeOnreX0BbxxvLQDCArcrjPxbNs2u5yCEQwd1Bfvrv87uFuR24pku5taGtiZUyHsgL+9hCwiO9sxhermO5bRlEMMgrFp8fOCgdS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=NaqK7ixf; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="NaqK7ixf"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e5dc299dee9so1833014276.3
        for <regressions@lists.linux.dev>; Fri, 14 Mar 2025 03:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1741949271; x=1742554071; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xs2DRVt7s6D92kMzVMBPJGcistIAIFgvHwmfY9dBcVc=;
        b=NaqK7ixf1d7XzrSk2JGodSTHlc+ubmmcOXziQiujV50vY5kZPCFDqVQCIuovh0nN88
         3wOhvM1mQgbx7EDV5aMnFyZa+743E3syGjyjNvYhWjiMduiG6o5Czn70WnuMM2wJa3bG
         f0U0TFBB+/jtA5nGXineUODY0K1+t0U/xxKNSzakJ/+dKbyC/okFg7ZkqGiN5CwAoj5e
         jZe5L57GoaED48UzCjG0qQTGWkd1W8VCrK6F6A3P4XVmFATfX+xvrJe9ZsIkzEk6kgKr
         qtQB0IzwDVi080qyyEEYpkvE5e8liYt75cfqMJQorfLo+xs8GqNBGEhommf9doSV1VW+
         y0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741949271; x=1742554071;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xs2DRVt7s6D92kMzVMBPJGcistIAIFgvHwmfY9dBcVc=;
        b=XCVvkgnuPB057KtCkfbNmD81vhQrvFHQ/ZjDpndKv3qU9+ZL5FVj+M+pdTRa5ba0qm
         IdPvd45XTTzSyQ/Z7WrseNCZ25HRB5sZYKh4Rv0WisAm/APYHh6f6zJ1BKpFEisGaWhK
         mGIyBCuTQRUtmdEzMpccTHIfIDl/OS7ei5Hvd1Gu+BGAdTwoEgu639JBt8C5v58ldAcH
         XDh3Pc1nsVjpTokIrb6UqWM548azMB7XXvUNa0q/wzOlR2IdIaInD353rAbEExwMZhWn
         8Ht72CHchzMFSUClBeI5cEIjTP5BP56gzSX7rMY4lD7dymzv+/XYc3LYV48a/ctLSVBS
         +XbA==
X-Gm-Message-State: AOJu0YyGq2DpUm7sXefLjxTH5wBdItwF3P6AY4gujLm5V3c2P3N2WMKw
	jq1cQd0v8IbDOw4bGNTZzGMOZLV1/FBbHppuAaPCJx94hcz0qphDc7kEDYCMgt+6ku2ec71bLW8
	76OKV1IF/PPE0I4dVO3QS7R620SbKKBYsuN2z2w==
X-Gm-Gg: ASbGncsU1a6iUggxs6kYdQ5bOOeWkYdkxzEX915Nj9WhistXEYo42tb3vr5G7ori0yX
	G+CX28Qdc6Hz1uTRioRniqHW0ggsbe5v9jLhxro8X4PCPpMhF5HpCtcOsd+aW+ApeTJEdKxUefL
	NWCL+DBksiy9aE00zyPogG57uGPt5tGEoOQHB3sjwSDLL84/O8o00t1+a8egM=
X-Google-Smtp-Source: AGHT+IH/8gpAJFhj6QqPfeBoSbSvkB2UQERfb6r9g+mtExICBa6PnItjOug0Oj9jQCLN4ZF6tqWc39jsJFyCyti+6GA=
X-Received: by 2002:a05:690c:6e01:b0:6fb:b524:48bc with SMTP id
 00721157ae682-6ff460fa039mr23097167b3.35.1741949271016; Fri, 14 Mar 2025
 03:47:51 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Mar 2025 03:47:50 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 14 Mar 2025 03:47:50 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Fri, 14 Mar 2025 03:47:50 -0700
X-Gm-Features: AQ5f1JpQnr3Qg5ekx6Jtad8Dc5g9EagAsisB9kd77mXHC77le5f5QYSUN67nqDs
Message-ID: <CACo-S-290Qin9QAYk=Rxtu9TUzWeZ16UnQ-yZy5eycnJ=kCLyQ@mail.gmail.com>
Subject: [REGRESSION] mainline/master: (build) "__aeabi_uldivmod"
 [fs/bcachefs/bcachefs.ko] undefined! in Module....
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com, 
	shreeya.patel@collabora.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on mainline/master:

---
 "__aeabi_uldivmod" [fs/bcachefs/bcachefs.ko] undefined! in
Module.symvers (scripts/Makefile.modpost:147)
[logspec:kbuild,kbuild.modpost]
---

- dashboard: https://d.kernelci.org/i/maestro:f5a0a8e5271e2e77823d140f77a3a7e290b4a2fb
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  e3a854b577cb05ceb77c0eba54bfef98a03278fa


Log excerpt:
=====================================================
ERROR: modpost: "__aeabi_uldivmod" [fs/bcachefs/bcachefs.ko] undefined!

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:67d392abf378f0c5986c9568


#kernelci issue maestro:f5a0a8e5271e2e77823d140f77a3a7e290b4a2fb

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
