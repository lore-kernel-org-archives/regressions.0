Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F0219CC24
	for <regressions@lists.linux.dev>; Sat, 18 Jan 2025 16:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737219530; cv=none; b=m13+fRd2AXfdwXd6JhGSvlGFWxMPMN6P4AJHUsOhHSfApvB7w5z0JbtElKYw+ee5/yCa6y1FyC+sS/lHUVNxp+BXU878EcnZbbOtdqvN7Nz3lAqBv+mWWdPa8+hcvANiK5rBBcbtPHA8hTcHcQ1KCyi1rd9OuPSjPOtYDNh6+60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737219530; c=relaxed/simple;
	bh=Wad7o9Nhl0by+kpcehRF4PWr5uVvTb0iaG2V4hT5vL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4b2c/gwpRSby0j/xc3NJvaXwYc/IO/PNUP8xLKG8B+7A4ATqUUF9dP4LxFlg/CxwYZgN3TXDFRg2aqrVGfO6oSR5wXMrjKl2ql3gIymZzOpDw4OBV/M6bsN7KTxEMkohYb5d5ETqzeTP2fuaWJ4o7YXSxS0XklGUa2Ev2mObkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbempzeS; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbempzeS"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-71e2766994bso1750906a34.3
        for <regressions@lists.linux.dev>; Sat, 18 Jan 2025 08:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737219528; x=1737824328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1y0ZCBBg0Ud34GfVfOi+9b944wjZwzsnzcdabcPULM=;
        b=TbempzeStB3G6gaHxMzxYNyDjk+C/KB0OR9eHOjLmqsWvzXbsG/DTkEzh+8uh3bJXm
         W915ehdKXaDWIX1Oy9u7VfV/cZoYv3De3d3wyiNe2n9+0N8BJaQuX0ak1Ys90hvmDV1e
         WqFVpt8/Ck3ASN6j+0G9DYsQhm0NzcUXCbp6DPDs5B4StsVC1yGDXCn+mTRYjq7YwIJr
         gDryo4evdsHcFjfqL0ENGL/BviHKXS4FtOw5m1oI1itaqXsAgF6ANgIGdBVFUr6ZXC0Q
         S9aq+m7BAGbSRDfWERpPQxwXg/1cpGrorHLQFokIZKDeEg9inqX6noueIdNEIIm2Tq1b
         k0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737219528; x=1737824328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1y0ZCBBg0Ud34GfVfOi+9b944wjZwzsnzcdabcPULM=;
        b=Rt8S8XZC7o2i2RVepN8WKD6oJvdTURAVGBVaZ+cDFNSK4AOsAkkL6p5yBNwRtHXwEW
         zeW131Bw/j1kaKsMiWfiaIo3m265WquFZjGCx795Uwe1omD9GMrTprMt8RD2LJaIrcwG
         5MuJxyTIPhdY8yovN7nzixzsTFxQRPjKgTBK1GA0oe1EVy4lunCc6zLig7HiOpSHgviS
         /75hq4xn0+kDVQBl0twdcsz2taZtxxDf+OkI6Rstaq3LVOWrQ6YQe9IfUCr8elhfMb7L
         49prgyBkHd4dMXnEVViGxOXuIrtDEA9e18X0fpKbSIF9avFkmXtb3ybyZtRgB4Aa+HxW
         72hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCo39q92oPal/NCAWNlGAGQkt5aypr29zYfXeizNrGH56/a84fUgMx2HF3VSGWe5zQDpHUUm79I7BqCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqCwN2Z+5I+edGgBXXBuwr9LkEblBmIlag5pHWhsfzWYLRa2iI
	Gu/V2coDbfxItn+A4zjsVnpR11SDJssBHWL+LQD3S5xBIkslKSH4
X-Gm-Gg: ASbGncvzOscHFf54IZJIgV3YgnCLK9K5MONur9VxWtQ1zPtSdXsGW2fMEr5W0GPCopZ
	dGVeTCfqzmTh6//zCPR4UhAmvA9HII1ARggG/XP4w0RWTzHdKnZaI0EbWB6/eQbUlRCX6sVRyZ0
	Xm/ji9LooXi4ER8fHxjRAcyX8DGANkBgXpHJLfQFRHy24v8IYJjqUlOysnCJmANb0HVBO9yMXQS
	NOzJM8uF2Co9LGGLNr5Ru0kjZ6GW1UUChN2t0ZzraWYxgA6mBLn52Kr2539e6bkyv04boyrrsbY
	m09B
X-Google-Smtp-Source: AGHT+IGbP27AbbOClCTCIkR1cnDE8YRBZyPTtMGJMtWHw/+weozHCb/XJ/XWVucTdPdjgwFMUv7eMQ==
X-Received: by 2002:a05:6830:90f:b0:71d:6221:d4b7 with SMTP id 46e09a7af769-7249db0d787mr4159608a34.28.1737219528177;
        Sat, 18 Jan 2025 08:58:48 -0800 (PST)
Received: from localhost.localdomain ([23.151.240.73])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7249b3ac6f7sm1589013a34.27.2025.01.18.08.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 08:58:47 -0800 (PST)
From: John Glotzer <jglotzer@gmail.com>
To: sergio.callegari@unibo.it
Cc: Aaron.Hou@mediatek.com,
	Chris.Lu@mediatek.com,
	Deren.Wu@mediatek.com,
	Hao.Qin@mediatek.com,
	Sean.Wang@mediatek.com,
	johan.hedberg@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	luiz.dentz@gmail.com,
	marc.payne@mdpsys.co.uk,
	marcel@holtmann.org,
	regressions@lists.linux.dev,
	steve.lee@mediatek.com,
	tiwai@suse.de
Subject: Re: [PATCH] Bluetooth: btmtk: Remove resetting mt7921 before downloading the fw
Date: Sat, 18 Jan 2025 10:58:40 -0600
Message-ID: <20250118165840.73110-1-jglotzer@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <9ae25475-e8f4-4ee1-8022-7621fbe8ebc6@unibo.it>
References: <9ae25475-e8f4-4ee1-8022-7621fbe8ebc6@unibo.it>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Note: additional discussion has taken place under
Re: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And Hibernate)

Hi,

I have dug further into this issue and I think I have a root cause analysis that
makes sense (at least it does for me :) ).
The TLDR is that the root cause is the following commit that was introduced with the 6.11 kernel.

https://github.com/torvalds/linux/commit/d53ab629cff57

Furthermore, the problem must be the call to usleep_range() in
drivers/net/wireless/mediatek/mt76/mt792x_core.c as this is the only behavioral change.

Notice that this commit first shows up in v6.11-rc1 and is present for all subsequent releases,
which matches perfectly the breakage pattern seen by the user community.

What, then, is the evidence for this?

First of all the entire community has been unanimous in the observation that the issue
started with the 6.11 kernel. The universal experience has been that any kernel prior
to that had no issues, and all kernels starting with 6.11 were affected. Also no attempts
to mitigate the issue in code by attacking the problem via the firmware download code paths have
been fruitful.

The next piece of solid data is outlined here:

https://github.com/alimert-t/suspend-freeze-fix-for-mt7921e

Here the lead paragraph states:
"A suspend/resume issue occurs on systems with the MediaTek MT7921 Wi-Fi adapter when
running on Kernel 6.11.-. After suspending, the system fails to resume / freezes and requires a hard
reset."

The mitigation for this issue has consisted of one of two approches:

- rfkill bluetooth and wifi on sleep and reverse the process on wake
- add the parameter mt7921e.disable_aspm=y to the kernel command line
(anecdotally I have seen reports of people doing things like turning off bluetooth
 and/or wifi before suspending or for that matter rmmod mt7921e before suspending).

I personally have used both of these methods with a sucess rate of 100%.

The way to unlock the puzzle is to examine the 6.11 code with an eye towards
- what changed between v6.10 and v6.11?
- what is the intersection between this changeset and the disable_aspm paramter?

To cut to the chase the answer to both these questions is just the contents of
https://github.com/torvalds/linux/commit/d53ab629cff57. I confirmed this by
diffing v6.10 and v6.11 and then going through the diff looking for disable_aspm.

The following lines were added to drivers/net/wireless/mediatek/mt76/mt7921/pci.c

	if (!mt7921_disable_aspm && mt76_pci_aspm_supported(pdev))
		dev->aspm_supported = true;

The bitfield aspm_supported was added to the struct mt792x_dev in drivers/net/wireless/mediatek/mt76/mt792x.h

and if this bitfield is true then the call to usleep_range is made in  __mt792xe_mcu_drv_pmctrl()
in drivers/net/wireless/mediatek/mt76/mt792x_core.c.

		if (dev->aspm_supported)
			usleep_range(2000, 3000);

By setting mt7921e.disable_aspm=y on the kernel command line, this code pathway is avoided
and no crash or lockup happens when the device is woken back up.

Disclaimers:

- I don't claim to know the root cause for why the call to usleep_range() leads to a crash or a
  freeze.

- I don't know the details of the specific issue the code for commit d53ab629cff57 was designed
  to fix, hence I don't know the consequences of removing the call to usleep_range(). However,
  I do know that the user experience has been significantly impacted negatively by the introduction
  of d53ab629cff57 into the 6.11 kernel.

Thanks for your attention,

John Glotzer

