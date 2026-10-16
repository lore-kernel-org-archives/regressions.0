Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6809F54707F
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154754; cv=none; b=JEJN8gvy51+2FLbWuIoSqd4mvSMzJqoWf4nILytz0MHd/ezptjyOtxEppecqFg3vTf7MpW1KVcJA1Hiybdi8xiaV3QZ5FsIl9Yezo+tnL63NZy3wHxQV2ZZjo0YdMxW/TqOPmuLFAIMGr6AI9pnIQYv3FZ0INQJc4zePWWDO9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154754; c=relaxed/simple;
	bh=Wyu/+USHhutsG+E3nnSoXITijpYPX+7CBJ5vxy+3f30=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=UubsWOuzBxZPecnOOarO0A+J7z9oIyv7mJiZlXij6r68pNDE7rwfYEK3yEPRAD41T1XNJi2w/GU7H2UmTp2FLgyB65tVXxvMty5B8Zk+fXAeKjSkrsc4kv4pc5wIArcy8nFrDA7P0mGKTNi7pKCHOWJaWApxm14b4dHSgrEH5tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=RySjKHw4; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="RySjKHw4"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4j5l5X2kK7z9J2v;
	Fri, 16 Oct 2026 14:45:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792154704;
	bh=Wyu/+USHhutsG+E3nnSoXITijpYPX+7CBJ5vxy+3f30=;
	h=Date:From:Subject:To:Cc:From;
	b=RySjKHw4hWPn6tlZeaFhakTrhHYk0UV+mUt5JOVzvpoJl9YwSqGWE24uUBsb3N+jv
	 4YHPE6LrclJ+jsHqP/pUwUCzGHlhE8QnmTEirr43L6QWcBNsR1nE9lv6SfHDmnmReX
	 M/91zhRKfG7h2+/j7CNukw6cK9wg7LPY/RzpliRRyUwvdZ4TvwDIThihKqSW8ORSnd
	 TnImpXMkrqz84aI+qJ1XAkJXtXGSo2ePiuwWrId3YnegrZrlzqHQ+GoZGlw4YkBsUH
	 Kud4yV6GivABzTue1KEIJ7HxSkrZSq5nGmwasAXqzdXsz9xeULCU+k8OvHHYYb8uuj
	 xN5WoDEN3PYkw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4j5l5X22shz7xsS;
	Fri, 16 Oct 2026 14:45:04 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j5l5W6kGbz8sZg;
	Fri, 16 Oct 2026 14:45:03 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 373AA5F9E1;
	Fri, 16 Oct 2026 14:44:55 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3ea4df88-3305-4c0a-964c-ce56246ff308@leemhuis.info>
Date: Fri, 16 Oct 2026 14:44:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Subject: Quick regression status as of now (post 7.3-rc7)
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179215469544.332198.2344478799087832379@mxe9fb.netcup.net>
X-NC-CID: /X1eZSKdQqOLptEpBgO8PXoni2ho/QlHKl7AvFrd1JuUMluqq18=

Hi Linus! Here is a quick report about a regression from the current
cycle that I found worth mentioning:

==============================================================
Regressions without available fixes that could easily be fixed
==============================================================

#####
# 7.3: mt7925e hangs on hibernation restore

Latest report:
https://lore.kernel.org/linux-wireless/CAGjg407dj0uZ0rCrL4G=PDkQv4-QC_og9Eeg7ewWzxqBvU4b2w@mail.gmail.com/

The problem is known for a lot longer, as the fix for it is in -next as
c182bfe944eb27 ("wifi: mt76: mt7925: fix reset panic caused by the WM2
rx irq mask") [next-20261009] was posted 10 days before v7.2 was released:
https://lore.kernel.org/all/20260805092409.1489401-1-eason.lai@mediatek.com/

The report above from a few days ago contains a plea to mainline this
relative easy fix for 7.3, but it wasn't answered.


============================================
Regressions with proposed fixes under review
============================================

#####
# vlan: network broken for various people

Report (ten days old, problem affects various stable series, too)
https://lore.kernel.org/netdev/CAPa5EdCj3v17tB-SF2JNecq5Q8s1Pranr-XzAFWNpNTBPgPG7w@mail.gmail.com/

v4 of a proposed fix:
https://lore.kernel.org/netdev/20261013115022.1043024-1-edumazet@kernel.org/

#####
# usb: xhci: devices drop off the bus and might be dead until reboot

Report:
https://lore.kernel.org/lkml/20261010064407.11030-1-yiyu@yiyuzhou.io/

v2 of a proposed fix:
https://lore.kernel.org/lkml/20261013073825.17962-1-yiyu@yiyuzhou.io/

#####
# phy: qcom: qmp-pcie: link never retrains and the root port comes up
with no endpoint

Report in form of a proposed revert:
https://lore.kernel.org/lkml/20261013-qmp-pcie-skip-reset-revert-v1@michaelburch.net/



===================================
Regressions without available fixes
===================================

#####
# drm: amdgpu: Black screen after boo with multi-GPU systems

Reports:
https://gitlab.freedesktop.org/drm/amd/-/issues/5762
https://gitlab.freedesktop.org/drm/amd/-/issues/5979

#####
# drm: amdgpu: DP monitor with conflicting 420-only EDID declarations
reports no signal at 4K120

Report:
https://gitlab.freedesktop.org/drm/amd/-/issues/5946


========================================================================
Regressions with fixes that I expect make it to mainline in the next two
or three days
========================================================================

#####
# secretmem: SIGBUS on memfd_secret() pages while perf record runs
Report:

https://lore.kernel.org/lkml/20261002175651.811343-1-ameer.hamza@truenas.com/

Fix (in perf/urgent now):
https://lore.kernel.org/all/20261003-perf-locked-vm-fix-v1-1-d214dcaf0d76@kernel.org/

#####
# dma-buf: Hardware video decode in clapper and chromium broken

Report:
https://lore.kernel.org/lkml/20260923074256.9357-1-liujianfeng1994@gmail.com/

Fix in -next as 5e0ed1108504da ("Revert "dma-buf: Make DMABUF_DEBUG
default to y on DEBUG_KERNEL kernels"") [next-20261014 (pending-fixes)]
and also here:
https://lore.kernel.org/linux-arm-msm/20260923074256.9357-2-liujianfeng1994@gmail.com/

#####
# i2c: qcom-geni: built-in keyboard and touchpad stopped working

Report:
https://lore.kernel.org/stable/179173732257.29426.7905170638383807320@pm.me/

Fix in -next as: 8cb5c17be3a2fa ("i2c: qcom-geni: Restore the
source-clock selection policy") [next-20261013 (pending-fixes)] and also
here:
https://lore.kernel.org/all/20260928-b4-i2c-qcom-geni-preserve-source-clock-v1-1-9aded7552a76@oss.qualcomm.com/
