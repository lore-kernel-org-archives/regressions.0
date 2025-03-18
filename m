Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF46921146D
	for <regressions@lists.linux.dev>; Tue, 18 Mar 2025 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742316314; cv=none; b=K2x4vAHoO3kUodLBKrhXEelT5Jx+bbzaaIw69EGdB8C8wnMF/D191nDd+Hp9FIQqUwtfWgkv6ObhhZG0n5KCDz8Hl8kcQBBPQFtu10ofptPhAuL7Lcjv+E8/+PuJ7Ce/UU/lqfUcuL4+0VArSWsXSj15sRITtQFCV9YFXI9LWps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742316314; c=relaxed/simple;
	bh=X4/++OfwuzaoBgU96v05XitCnSlqCLCuKbiiwgjvWHY=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=avrsxss0gqoRJHLf4wkO22aSMcuT7Cx+gw0PR6vgejx5P4Vo9CYKLXMHUMY0N9jO8N5HStmEhAo/wOzfvLaXm6AQ88pDs58SfvrrkHeM2uaDfWwSfrqQp3PiSBLcywGNAhVlg5Htt/i4bO6v/oH5oGcOfACUo4Rz9bVD4jFoEsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=T9TfOaxd; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="T9TfOaxd"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6feb229b716so54298007b3.3
        for <regressions@lists.linux.dev>; Tue, 18 Mar 2025 09:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1742316312; x=1742921112; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qVE6Aew+BS0YsZnP5eKJHlKtXCsYM2O1qc9EqRraLU=;
        b=T9TfOaxdmKIepyfvwsvIq17BRYcrEkSXF4d+8P2ciLnckp78DAbyxfw7LJC67sqflN
         EkgXMJlinQb/129kFejECDHdpWQfhbJk8b7qUdD1X/P3UR6+6fwYr6Bx/13POiEnl9kh
         0V6BI5n+23/KSiiAV9u4S9X99unrjt3N0gVEILgFPtweS+rcj/O5CaqSi9MwJoA036UG
         ddFpraYDeFDcN++wVpXH8B8POMOC9N4Ts4Z59Lqa/SzxxR3tjybf94wXPnHL8Pkk0vYP
         f7/0RFstTrPJG0szsRBuiwo95bS+Bs03+06uxNDR45gm0sCK25lX6us8vwlYAFGintvO
         EEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742316312; x=1742921112;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9qVE6Aew+BS0YsZnP5eKJHlKtXCsYM2O1qc9EqRraLU=;
        b=YZiECX9Bm15JGguLGl/ljFqLqxsGV4vI3JZAVr8+XB5yBt/nCcCWm+hU7PKAKk0EBS
         9b2GmhCN2hhJKFJuRD8fZlF8sbW1bFACVIldkDt42X2y21jqB4Hkc1+cR6FItdaAwwoT
         ERJE0Oa6CeUcCWoTzHTjFs1P3Dlb9ac7sqmprx2sEKK311Lg3Kwj4GbYuhyoypkQ1hnY
         XeVPe0KODxxapG5LhpxArU+MH9vbBWYCZ+BKNoMdHZWpsLlXXlm2vgTkZek2jjsqBRUs
         x5ZKdilIzc+DAsEjrKmPLywAUlCZT1MR54MQW5I3fWiD0t+k3TSr57E9+nKa/Aw/OTyE
         l1QQ==
X-Gm-Message-State: AOJu0Yys5HiNvkRA+0VqSqsk7v5FEmuBA9V8AAY7GAxTSOeGzp39BN9g
	LH+DT3NI0PKp6Jwm+hF1oPry3Cw9ezOi+CFLennq/TGV3TW1ij5Xke/ga1W/gcMgs9FUbCWqklY
	OTw56p9NME2M+jQmBIZdBPmV3/e5Zns21R7y27ZHvh11eCgxkqDc=
X-Gm-Gg: ASbGncudk2qvjYrPEW43ATE1SWApp7aceZ7bAxpG/bKM6eUASeum/QHkahPEoByD1XJ
	3PFEMfW7QgZ0WlyipYvY1E9Ax+Qz2HyBsRsMNGd1wxl95ZhKZ8poPNZSpp8uP3lC1LtoQLcQUC3
	eFDtgVTV4hIp+21lw4FrQdRWgCPQZMzw6ju3TBLxpUVQ9iLGKzyRXJeyPcymrHT4Uw9gEA1A==
X-Google-Smtp-Source: AGHT+IFVEnMHAvHiDRgfiqJv8ntloRayxHp9ZoGPM0tremhdhdyG0b4UM0onWPz476LYlh3f2+EE5+KPzrbFRF016+g=
X-Received: by 2002:a05:690c:3612:b0:6ff:1fac:c4f2 with SMTP id
 00721157ae682-6ff460fa02dmr228763397b3.33.1742316311706; Tue, 18 Mar 2025
 09:45:11 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Mar 2025 09:45:10 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Mar 2025 09:45:10 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Tue, 18 Mar 2025 09:45:10 -0700
X-Gm-Features: AQ5f1JojJuQVxecLAbKVunkGULFg4wpdYf9B_F90uYMdlwvAk1Y8egBL_bCv4hs
Message-ID: <CACo-S-3N2b0enKcqz7riooWRrFJ3Q8x2F-xXaF61VMW-vS=K_Q@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) in vmlinux.unstripped
 (scripts/Makefile.vmlinux:91) [logspec:kbuil...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 in vmlinux.unstripped (scripts/Makefile.vmlinux:91)
[logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:a70a9acce8cabb23d7380e5f9fef28845b163deb
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  c4d4884b67802c41fd67399747165d65c770621a


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.6/x86_64/chromeos-amd-stoneyridge.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:67d9851528b1441c081c47bb

## cros://chromeos-6.6/x86_64/chromeos-intel-pineview.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:67d9851828b1441c081c47be


#kernelci issue maestro:a70a9acce8cabb23d7380e5f9fef28845b163deb

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
