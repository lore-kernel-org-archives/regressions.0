Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00282C11C7
	for <regressions@lists.linux.dev>; Wed, 20 Aug 2025 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755685356; cv=none; b=Utx4zn7qFnOrePulkDyZO4xOnn/0s8oSOvSHFjIqrbdNAcrPt5f/4BzEytSzkG76i8Ce+alQtYXZJGdfuoN33FlaxtTnYW7fWI+zJx1x0wU5BobH7HR5rUFo/BIjUWeiqXXcimfEjVJhupGWbYNrD7lX7xfrwV49bWCYu3VbXzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755685356; c=relaxed/simple;
	bh=ekhlH+QB646C4gZDJ1lIVyG5Q3h6WGkTJkLYrfK8lzo=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=uCvJZr9+Yh++BGx3OLEhIpO4MQ1UBy8mfKLsG8tZ5CvqjzWorkeYE+w668bScg/7JI4E702B02bnrqYKIM/xfvLzmbs3/PPbXbfGv3tmiMth51E2B4yob68C1FwfJQi6AM9jiPxcAeM2aEiGDnl+r9xSUj/pu4YCcRmsNWf6sx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=3Y4ckH6h; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="3Y4ckH6h"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-245f19aab74so3416085ad.0
        for <regressions@lists.linux.dev>; Wed, 20 Aug 2025 03:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1755685354; x=1756290154; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d58e0zoNQ+pqPwRM+F6LRXghkgFaQAEaY0C5C0eBjD4=;
        b=3Y4ckH6hjtIv8FbA5IdOSuF4pOp3YDGJW6onNz3q22wXh+hG1BERx223mYpt2ePCHY
         7Quw5wD5U8CFB5DoeTrV31oc9q8I9YykaHbLuKxexOSuImXQGFHvJIo+LosuUeUm7hIP
         IKsROwST050yTCJLMckK3V7Jn9ujbcDvo7XqAp7lYxHMUJRnE/EP0st5al/mxV1VbBzX
         SUApWtzXCEDrZKsmvYYcpxMkdfoOhs4O56m/meHIDqc2z/lK1KlJlvpOOxxmsw51k1LJ
         9wfmS0gW+jeJTHAW24uQhRse6ReZ3zJoMS2dAM4FtVi+UE5Rj8HIMCTrDlP8i9tto2r/
         q6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755685354; x=1756290154;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d58e0zoNQ+pqPwRM+F6LRXghkgFaQAEaY0C5C0eBjD4=;
        b=HcuXLgsc6iyAeZyytC4HPGFRaTPM3TbPn4pRD9/C3WRY0FaUtE3Q6dXFVGtGhtZiTt
         NVvbkJR/xJYNDivboaN/QxFoBiD0tt9vdRZDioN5/8SvPtETNRq29aw/hK4n1UxQuNOa
         5Qfp5uEIhGUDkWTY2CDVSX1ZwBq55HW65aHxKgSkr7Ol/WoBKo9LRL+fFfFjcnNtlo9L
         ptrlkkubsCaFr/jK1GRGpgRFtEsxrn0cT3aElXs5xF6OViJhr5YnuQaFztQUo6b8UD8T
         XKw+LbUVwAOPKtIXb9UgT1NKH4vBJMQa0kpdM3xkTxH3eupKlHyE9YMlvVV1K7xbbNkh
         eBRw==
X-Gm-Message-State: AOJu0YwasRJqkXGTe2ShWfKGGejC6akPNCVY0UwGLzzjljtKHMBzTdQJ
	yUuzg102WPMcqP8sktxLhx1B2QSFcU78kqprlmYZstb6dz5nsNlKLiqxMA7XC7pHa4k=
X-Gm-Gg: ASbGncvdlTmceAqXDiJtyxBBlDKxHcMh84gbEzxbxaYBOG7aLJMhaxthKXecCKj1HaA
	T3Lhr5WObPhS62SHXd7Vn/UQAKaeh7JZ1ayGsQkVuFg1DHBAbQQRpFic6n7J9o42np9W384hQ5p
	EirkQXg24HrMFJxgTdgEQMBk6Pb0h/YUa+axQk+nBwXQajjOAs8Kn5tiKWcga8r1xjFsRnvsPn3
	by9x5RdlW0HkUaCYXmmoS2sX82Zsw9PuF5Zl8+3P3D4ru2GrgvAMMOGKh7yo91Xy1hcbBoVgcY+
	M/TTch10qiBvtcb8a+SmtSnYEGG7Het3K3XvFvUKKsWLK7HF6TfH0hx62BaVQw8AFOSPTjrZ4yg
	uv2ImrD+h/Rp54We4rjdA9t2X
X-Google-Smtp-Source: AGHT+IHC1vhZMOE2tywrBCJNFfsWMse4MPwivKurQqxzCX6JevJiyFpMEeYsHEkpnp2GH2btUtaT+A==
X-Received: by 2002:a17:903:287:b0:240:3d9c:6340 with SMTP id d9443c01a7336-245ef11b097mr25715015ad.20.1755685354013;
        Wed, 20 Aug 2025 03:22:34 -0700 (PDT)
Received: from poutine ([2804:1b3:a702:7d26:1577:2536:a82d:763b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed53e5c1sm22062005ad.161.2025.08.20.03.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 03:22:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (boot) sleeping function called from
 invalid context
 at kernel/locking/rw...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 20 Aug 2025 10:22:31 -0000
Message-ID: <175568535010.3222387.7351336690916179632@poutine>






Hello,

New boot regression found on next/master:

---
 sleeping function called from invalid context at kernel/locking/rwsem.c:1589 [logspec:generic_linux_boot,linux.kernel.bug]
---

- dashboard: https://d.kernelci.org/i/maestro:4a7604ad2b208f9142109c871e17a6453ee9ff9c
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  5303936d609e09665deda94eaedf26a0e5c3a087
- tags: next-20250820


Log excerpt:
=====================================================

=====================================================


# Hardware platforms affected:

## mt8186-corsola-steelix-sku131072
- dashboard: https://d.kernelci.org/test/maestro:68a572e9233e484a3fa2c0db
- compatibles: google,steelix-sku131072 | google,steelix
- 1 fails since 2025-08-20 07:25 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:68a429e6233e484a3fa0aba6
    - on 2025-08-19 07:38 UTC
    - commit hash:  886e5e7b0432360842303d587bb4a65d10741ae8
    - test id:  maestro:68a429e6233e484a3fa0aba6

## mt8195-cherry-tomato-r2
- dashboard: https://d.kernelci.org/test/maestro:68a572ea233e484a3fa2c0e1
- compatibles: google,tomato-rev2 | google,tomato | mediatek,mt8195
- 1 fails since 2025-08-20 07:25 UTC
- test path: boot
- last pass: https://d.kernelci.org/test/maestro:68a2ce76233e484a3f9e5dcc
    - on 2025-08-18 06:55 UTC
    - commit hash:  3ac864c2d9bb8608ee236e89bf561811613abfce
    - test id:  maestro:68a2ce76233e484a3f9e5dcc


#kernelci issue maestro:4a7604ad2b208f9142109c871e17a6453ee9ff9c

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
