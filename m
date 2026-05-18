Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8049633A9F3
	for <regressions@lists.linux.dev>; Mon, 18 May 2026 23:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779148607; cv=none; b=mZ05p5jRxYlteyk+TBrigS1cYEd2WKTkCJKvYJE3PZ7OMmuiNVlI8wAkkdcMqQKZMaMOe2U48vQiANNCqXzTlNP+TfqqB3WMXxrNmRc+aR/RNv/S2KNEMQ5t13sGACzz/ROKgp/egpQVwdDLc/ry1w+zDZ/gZd2iZQXEhzMuq3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779148607; c=relaxed/simple;
	bh=ETAPReuH7XXyRe6R3ZhrkUS4h9qrbkx5IonWV1VnUVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PqRA1PWqbH91mFPI2XpTgH6Ov/gORpcQeleYUTg6U4ShJs6uROdl7n0CBK1U2jLKtB7/9OHfRJmuWLRuGge1ggxHxFIVydEzMuOtjbfjwNAYTKN7HFoM/tQ0cddhEcyWqCwoHfEV22jetFdm5marH/MU/IxiSc/sF9RaK3LlThw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBec8zys; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBec8zys"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1334825de43so2670999c88.0
        for <regressions@lists.linux.dev>; Mon, 18 May 2026 16:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779148603; x=1779753403; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cl1a+XGpLPxspGSZgdM+QSxe+cRFXtFKMQbqP89OpSE=;
        b=mBec8zys6XWLJo5+hUztGRoyWTlMG4ZCJb/sRzw2TaIUmbmtCuRrSy5YB/w6hI3rDi
         MhitzKLwBurhYZXZnaJ262XkMDxJq/fR+IsYm/ytGFkSM2Bdvs00EAh1/+jwJjoHrPet
         eDlq4h78tt5chtf2Egok8htDyHgjCSTWpDac/jt69WQKzEiEG5LZ9RtkgryHRvEg/4uf
         KbO5nF19INcns6JN6MfaSkfMO8FiS8P9U8Mb20gWymVWMz+Gefn5/YkE7Y/SU0MTna/P
         A7aHfR1pS4wfE2o1/nudWVw1c2ogkrjj+d0pTX8S731vWHmHQ7r05fGX5thefoagHTJw
         oSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779148603; x=1779753403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cl1a+XGpLPxspGSZgdM+QSxe+cRFXtFKMQbqP89OpSE=;
        b=pcFVs//M+r6Rlee0nEQp4RXuaPopCLEDwvJGOobgSyPOvuP2Sypvod9pDiCl2BqRUH
         x6yGnoSzdz54ovyFC4T34jz0kaj1dllWtwgxguEjLYn0YFaV9AHaXgdUKyyscJ6ZEGpZ
         hwsLy6JXq8aGfejyTWo3Ss56QZ54OTu5jy9ZA8JYwx0ForZadgq6rtjCib8bfDh+DuML
         xrhonqc6Q44rAeSqEknHkszM3/yhF0rei4pf3n2zf377qw3WG2FAuZVeeC/5nm5as/ob
         JDstg8fwbN7V/I/DOvrHWKKHf3f5hy3QhykTY2glW5rU5CQw2GO5RnTb/Afv6sFk1BOJ
         XC4g==
X-Forwarded-Encrypted: i=1; AFNElJ9sDTxQJ/wwIApsYsyKSRlqCT8rfG98kD0oiB3Zj1sbH5YfC8/JeAfLrii+Fy/pxaRu3o71tl4RwA9OLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfRM8WZKT2lXbFBGIH+RUjBvHae2VrCs2o4iRt51MCD0KGI3XG
	OZn3BDHdCFICnRV1c9kNYvStXTDxLmNO2HpgRgm6z4Op/MqjoIUup+vu
X-Gm-Gg: Acq92OH9M9GiGqMXidX2h3+cFYqBLwwSZan73cKhdoScULAWYb9ySSc8HxpoQgMijS2
	8qMSnktj6JjXQct1cd7Ds1VaPjpBxK/hhIOfxKfL/CNG+XWSggiSJt3xJX4hq8T1qc7E/aAJc2Y
	N2t/YVHA7ukaHtZqIc2Fkt2UQXEpSAarBR8AMZi9ZKKOIgJcTSoXBEpHnqW1JWpjzzKzPyVz/c0
	8FHxLcrnEaIwliT12mNO80O7mxkKjuDG1+3PO9Ek8HFM2pftAVjStGdNEBZotkJ6Xf3YnQQwO2J
	tURcTw+C5SX2MDzSleOHeNfVdbyPHJopqb6ngNtSqf8bzOjidd1mSst6yPeXVnfvbdcqLXOrdL1
	7Y9ni45rqH6VGCg6vvcRLu3Q1Xx8Xhs98W9gjFMO/9pt3R1UX5/XmHFWySiHdSGN2aNYctzdfq8
	ULu8qI1guPFlB8SIWPHVx9iJSlY78Oohv5MDIn
X-Received: by 2002:a05:7301:608a:b0:2be:833c:149d with SMTP id 5a478bee46e88-3039869d771mr7418455eec.28.1779148603497;
        Mon, 18 May 2026 16:56:43 -0700 (PDT)
Received: from s7t7-debian-test.local ([67.170.89.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500726sm14141408eec.10.2026.05.18.16.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 16:56:43 -0700 (PDT)
From: Tony Rodriguez <unixpro1970@gmail.com>
To: davem@davemloft.net,
	sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	andreas@gaisler.com,
	tglx@kernel.org,
	thomas.weissschuh@linutronix.de,
	regressions@lists.linux.dev,
	glaubitz@physik.fu-berlin.de,
	linux@leemhuis.info,
	torvalds@linux-foundation.org,
	Tony Rodriguez <unixpro1970@gmail.com>
Subject: [PATCH 0/1] sparc64: Fix tick/stick comparator equal-compare hazard
Date: Mon, 18 May 2026 16:56:02 -0700
Message-ID: <20260518235632.5122-1-unixpro1970@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sparc64: avoid missed timer interrupts when comparator equals counter

This patch fixes an equal‑compare hazard in the SPARC64 tick/stick comparator
logic that can cause missed timer interrupts and stalled hrtimers.

Full dmesg and crash dumps:
https://github.com/unixpro1970/Sparc64-Kernel-Debugging-Dumps/blob/main/s7-2-05122026-dump.tar.gz

Debugging discussion:
https://lore.kernel.org/all/87tssb6olo.ffs@tglx/
https://lore.kernel.org/all/871pfcznw0.ffs@tglx/

Short dmesg excerpt:
[   48.632215] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
[   48.676018] rcu: rcu_sched kthread timer wakeup didn't happen for 5259 jiffies!
[   48.743621] rcu:     Possible timer handling issue on cpu=100 timer-softirq=15

Test summary:
After applying this patch, S7-2 and T7-1 systems no longer hang on v7 and v7.1 kernels.

Tony Rodriguez (1):
  sparc64: Fix tick/stick comparator equal-compare hazard

 arch/sparc/kernel/time_64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--
2.53.0

