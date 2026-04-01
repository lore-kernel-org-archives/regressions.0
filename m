Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC00402449
	for <regressions@lists.linux.dev>; Wed,  1 Apr 2026 16:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060724; cv=none; b=kDKB774y6dCBfvjT/54tpLkfhN0Oc311bjLKAZVpTo605D1SEXXQQbU8Vkl6fyVIGLbbgUXU8J1qnM0toTqlw4KpvTylye5VqGmJejrt7+CDAxX/gI+2LBoM3FvaEoNIqON/CfFT+36gwRh4ZPWjezUV2YdqUa+I8O/5nWjmjiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060724; c=relaxed/simple;
	bh=9RYTlVYyYZQfA5WAGSDUZB1NRTwNzLM5TYVlflZ8juI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=TekxiE8ketncvaLIjEvwG1o3QbAn++ZKPH0rse9R3nAvR2HmIT6VZNQRGQKlT6uAXspUytuvwRPMXSXn3p312BLcNNR+7i28qXU1R6iJpYQ8bWSrrwTiqEkgVaafYuJKm1sfJfEP/NXgSpIvIWxTyuoupnPOaB52zG8MP+TFgB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=j6AmjDhN; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="j6AmjDhN"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fm9M14nFDz8Brh;
	Wed,  1 Apr 2026 18:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1775060717;
	bh=9RYTlVYyYZQfA5WAGSDUZB1NRTwNzLM5TYVlflZ8juI=;
	h=Date:From:Subject:To:Cc:From;
	b=j6AmjDhNP9RyGZ7x7FPOBkQjlXWkXzdI85sRcjQ54YrfqHKHr8R3PSeIDqKOpVn9K
	 oESOaNUZ+xdowWipRsi5/D0Y8jjYujmFz1hkYCQNuA175QkDbIc9nDFIZDVCV7u5Fi
	 3/VpLTch5h+Z40Pyr5MUlBUSbtS4iA1AbnmGQNt8Ukt5c1p1Hc47Nmdp4+m2aAcE3A
	 YbA++r5gLwAcGH9wLMQqvehaUpKnMw49jwBrHTcjZQcwcoqQJWM4P/0vprwTmvMmQt
	 gTcm5YOEB5IAqg2VxS3BFpp3BY63InHZscWh63ODDHwbSbZAU/JnxjUIOBodlsMv7A
	 yqdSCnDDdkHug==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fm9M144gZz8BlT;
	Wed,  1 Apr 2026 18:25:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fm9M01BYSz8tZM;
	Wed,  1 Apr 2026 18:25:16 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 5E0C5633A5;
	Wed,  1 Apr 2026 18:25:15 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <e6ba0f38-1abd-48f2-ab31-b700b59ac61c@leemhuis.info>
Date: Wed, 1 Apr 2026 18:25:14 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Subject: Report for regressions introduced during this devel cycle as of
 2026-04-01
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177506071558.2633535.8256788448300977480@mxe9fb.netcup.net>
X-NC-CID: QgL4D5KGUwQ9hmz+DQvKU4IaemeREzehOFQj85DaAlihJCdMxJQ=

Hi Linus! I'm more active in tracking regressions again. And sorry, I
wanted to write this mail last week before -rc6, as I know you want all
known regressions fixed by then -- but real life got in between, Sorry.

#####################################################################
regressions introduced known for some time now which could have been
fixed before -rc6 came out (through a proper fix or a revert)
#####################################################################

------------------------------------------------------------------
  drm/amdgpu: no audio anymore
known for 4 weeks, caused by b82f0759346617 (v7.0-rc1)
https://lore.kernel.org/all/CAOKSTBs1VNBdjRZe3M2v-nC%2BpLZZ0-
KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com/
https://gitlab.freedesktop.org/drm/amd/-/issues/5052

  Fix is "drm/amd/display: Wire up dcn10_dio_construct() for all pre-
DCN401 generations" at https://lore.kernel.org/all/20260323211343.263909-1-
sunlightlinux@gmail.com/

  According to replies the fix is now "in the next week's display driver
promotion cycle before merging", so it doesn't sounds like this will
make -rc7 (and maybe not ever -rc8/final). Not really ideal how long
this all takes after at least three people ran into this; but to be
fair, it was only bisected about 10 days ago.

------------------------------------------------------------------
  ARM: dts: imx: Colibri iMX6ULL and Colibri iMX7 no longer boot
https://lore.kernel.org/lkml/20260219151157.2549198-1-max.oss.09@gmail.com/
known for 6 weeks, caused by 8124b4a4a96b (v7.0-rc1)

  Fix is bccaf98c1077f2 ("Revert "ARM: dts: imx: move nand related
property under nand@0"") [next-20260318 (pending-fixes)] aka https://
lore.kernel.org/lkml/20260219151157.2549198-1-max.oss.09@gmail.com/

  Krzysztof already urged to apply the revert on Mar 5th and it was
merged soon after – but since then is only in -next afaics (at least in
a branch that is supposed to got to mainline in this cycle).

------------------------------------------------------------------
  PCI: pci=realloc fails, needed to get a Nvidia P40 24GB running
https://bugzilla.kernel.org/show_bug.cgi?id=221205
known for 22 days, caused by 3958bf16e2fe (v7.0-rc1 as well as v6.19.4,
v6.18.14)

  Fix is 9036bd0efcb616 ("PCI: Align head space better") [next-20260331,
afaics targeted for 7.1], which is 09/10 of a series:
https://lore.kernel.org/all/20260324165633.4583-10-ilpo.jarvinen@linux.intel.com/

  Another regression ("amdgpu with Thunderbolt eGPU bracket fails")
caused by the commit was reported a few days ago, investigation is ongoing:
https://lore.kernel.org/all/a5f23340-2b84-4734-be11-
f5a97c188195@app.fastmail.com/

------------------------------------------------------------------
  drm/msm/dpu: pink noise on the screen
https://lore.kernel.org/lkml/DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com/
known for 19 days, caused by 2892de3f4f98 (v7.0-rc1)

  Fix is b9699dd862760e ("drm/msm/dpu: don't try using 2 LMs if only one
DSC is available") [next-20260325] aka
https://lore.kernel.org/lkml/20260317-fix-3d-dsc-
v1-1-88b54f62f659@oss.qualcomm.com/

------------------------------------------------------------------
  ceph: writeback can lead to a panic
https://lore.kernel.org/lkml/20260315232500.251088-1-CFSworks@gmail.com/
known for 16 days, caused by cac190c7674f (v7.0-rc1)

  Fix is 681a6d350eff10 ("ceph: fix num_ops off-by-one when crypto
allocation fails") [next-20260320] aka
https://lore.kernel.org/all/20260318023733.116789-1-CFSworks@gmail.com/

------------------------------------------------------------------
  powerpc/iommu: amdgpu driver fails to initialize
https://lore.kernel.org/linuxppc-dev/20260313142351.609bc4c3efe1184f64ca5f44@danny.cz/
known for 15 days, caused by 1471c517cf7d (v7.0-rc1)

Can be fixed through a revert which was finally posted yesterday:
https://lore.kernel.org/all/20260331223022.47488-1-gbatra@linux.ibm.com/

##################################################################
other issues worth mentioning briefly

* I assume your will get the following recent regression fix by the end
of the week through via the weekly alsa pull:
ALSA: usb-audio: Exclude Scarlett Solo 1st Gen from SKIP_IFACE_SETUP
https://lore.kernel.org/all/20260329170420.4122-1-dag@dsmedberg.se/
 Which would be great, as the culprit made it to v6.19.7 and v6.18.17,
too: https://lore.kernel.org/all/abcGli7C40kr72mB@m.b4.vu/

* I assume your will get the following recent regression fix by the end
of the week:
HID: gpd: fix report descriptor on GPD Win handheld (2f24:0137)
https://lore.kernel.org/all/20260324013847.68024-1-honjow311@gmail.com/
  To me it looks like users have to enable a new config option to avoid
a regression now, as I mentioned in the thread. No reply yet -- and
maybe I'm missing something here...

* Note sure, but I hope you will get this fix by the end of the week::
vt: discard stale unicode buffer on alt screen exit after resize
https://lore.kernel.org/all/20260327170204.29706-1-liavmordouch@gmail.com/
  Would be good, as the problem affects 6.19.10, too:
https://lore.kernel.org/all/20260327160050.31631-1-liavmordouch@gmail.com/
