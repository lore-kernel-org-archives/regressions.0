Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388C21F03DE
	for <regressions@lists.linux.dev>; Sun, 16 Aug 2026 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786898520; cv=none; b=YIyZtFojmbFyVSd+rTnOA+/LNF8HfFq/Wwhs7FQYGfxjoEbyNY9vBvfuXV8Fc6aW8x2M32xywEhM5/aZxIq5m8A22tnzYQ6b1Nnkdwqb7ZKxfFmgbzNYLVosg7j6rXVShWlw2QzZ5k6SBhP8kyWeGJ1s4SjRISRCZPpOWk8d7yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786898520; c=relaxed/simple;
	bh=kjCRrHFUj5yEpljeCBojKgaM4Iq18sN+gCl38dv0HKQ=;
	h=Message-ID:Date:MIME-Version:From:Cc:Subject:To:Content-Type; b=BUovTqG0lYNyF73PZ/YlS1mxHPVjfFSoj9xAk9YpwboXutcMuCDzbZo6OMDxqvLfPgOzM/9MUVODyU9xpZRfxwhDGlPr15qyF7W3Dsapp2gFOsqTPSX0huFI1uG+3WKAr39qB6w9bNsKGEoI31k2koojvcDGPmLKhhiegg2uuCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=fMRPwR3m; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="fMRPwR3m"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hNMDs5fr8z9F34;
	Sun, 16 Aug 2026 18:41:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1786898509;
	bh=kjCRrHFUj5yEpljeCBojKgaM4Iq18sN+gCl38dv0HKQ=;
	h=Date:From:Cc:Subject:To:From;
	b=fMRPwR3mC0EM+SMjkGCZ+COH2aTlj7cME2tKkfVCEz8wkLM4CkNbJcXqKD1PwdevA
	 TNBXVs97WYXjV9Rny6RIK/vC6jalmw6N1jal54ojZ+hCnoDGAUOmEFZSFz+6R3QvEC
	 Lzz9iGg1/Sx7pICB+6rYh7TfkimAXsqXpEwKs7IWg1YpGA9tOiVqpx1aWOagC6727s
	 BnKny43iymp3kGv/RKddZx4sxqxSuS7JWo5Sm/QPGynSu5cPyf3ovVw3DgdDdJNsMn
	 Eaz2kgW1oFYBvJJOC96NhoVuzjXJk9vi9eVO5ZB50q0HEEuLqdLvXiNp1oPNF0p2Y9
	 kdpaunWe25L8w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hNMDs4yFxz7yF0;
	Sun, 16 Aug 2026 18:41:49 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hNMDs1NgLz8sch;
	Sun, 16 Aug 2026 18:41:49 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1A7035F9BE;
	Sun, 16 Aug 2026 18:41:48 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <628bbf10-29f1-4e9e-b23b-4c47657433b9@leemhuis.info>
Date: Sun, 16 Aug 2026 18:41:47 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Quick regression status pre 7.2 final/-rc8
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178689850836.2258970.2017106316702869585@mxe9fb.netcup.net>
X-NC-CID: Jl5vHJv+Sq4zKthjZatbilbcgr4RagXseFxLwb3hVrTdIyScwis=

Hi Linus! Just FYI, here is a quick regression status from my side about
regressions introduced this cycle:

Regressions with available fixes that might hit more than a user or two
-----------------------------------------------------------------------

* As it happens the Touchpad in my Thinkpad recently stopped working.
The patch author and Mario concluded that a revert is the best idea for
7.2-final:
https://lore.kernel.org/all/444caa3c-01ae-4516-b63a-576e095fef94@amd.com/

  The revert was recently submitted as "Revert "i2c: designware: defer
probe if child GpioInt controllers are not bound" here:
https://lore.kernel.org/all/20260814100719.9548-1-hardikprakash.official@gmail.com/

  Andi, the i2c maintainers, picked it up Friday Night, but afaics
hasn't sent it to you or asked you to pull it directly, so I assume he
thinks it's not worth the risk.

* There is also a mt76 know since a few weeks that causes self-deadlocks
with 6 GHz wifi APs. A fix was posted a while ago in
https://lore.kernel.org/all/20260629083543.153564-1-jb.tsai@mediatek.com/
and is in next as 1f83a8378eb26c ("wifi: mt76: mt7921: refactor regd
update to fix recursive mutex deadlock") since next-20260806. But it's
on track to be merged for 7.3-rc1, despite one user and myself asking
the wifi driver and net maintainers to considered it for 7.2 final:
https://lore.kernel.org/all/20260804185118.19705-1-lucid_duck@justthetip.ca/
https://lore.kernel.org/all/7e66ca09-fa70-4a3c-948a-0c46b268655c@leemhuis.info/

  On Saturday another user ran into this and asked for the fix to make
7.2, too [after submitting a second fix for it]:
https://lore.kernel.org/all/20260816135909.52136-1-mikhail.v.gavrilov@gmail.com/

  And on Friday there was a report that sounded like it might be the
same problem:
https://lore.kernel.org/all/066b30cc-a9e6-4aeb-964d-71551e8ea3ef@posteo.de/


Regressions that cause big problems for some that have available fixes
----------------------------------------------------------------------

* PCI: imx6: PCI link creation fails on Apalis iMX6, which breaks booting:
  Report:
https://lore.kernel.org/all/20260810211209.GB4821@francesco-nb/
  Bjorn had considered a huge revert on Wednesday, but that wasn't
submitted afaics:
https://lore.kernel.org/lkml/20260811214900.GA763236@bhelgaas/
  Proposed fix from Thursday:
https://lore.kernel.org/lkml/20260813095003.356062-1-hongxing.zhu@oss.nxp.com/


* powerpc/entry: indefinitely warnings and system never completes boot
  Report:
https://lore.kernel.org/lkml/6f9bfb0f-b14c-468e-bb9f-c157d120d0dc@linux.ibm.com/
  Proposed fix:
https://lore.kernel.org/lkml/20260812152035.1661781-1-mkchauras@gmail.com/


Regressions that cause smaller problems
---------------------------------------

* PCI: booting takes a few seconds longer

  Reports:
https://lore.kernel.org/lkml/20260801092152.5643-1-andiwild@gmail.com/
https://bugzilla.kernel.org/show_bug.cgi?id=221801
  At least a partial fix:
https://lore.kernel.org/lkml/20260801201244.4421-1-andiwild@gmail.com/


HTH, Ciao, Thorsten
