Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CDA3AD50F
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 14:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789309984; cv=none; b=oOWnqGWe/J/X3mxU4F2RhGu3wgjQW29/M0ewo23qXk9GfgP8d9EelYG86xs6ALPr45l+ZR5LveE0z0apDzqsJ/h02tbJlMIKecqmZX82h+Sg+eiuheK0kgK4St5rH4T5aRKL6RuUQzhYHX8VGuzozJJK+2/oeRDOT/k0vw06Q+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789309984; c=relaxed/simple;
	bh=8nybc2zdT1V02w60Sa6PV1zgJfsB6WiaJXMEa4g65Qs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=ATGNnvhD88+Xg3Fs7QCossHy9kx6Pi6jrAs1EQxTuxOWCikjx956RikP/lLzFq0D3oKFhJelrwhQQQPZ8W85OR13b6ShioV/QGLJYpdbVw/lt/jBuWV1xfHdeCcsuCwdK4GMZHa2uUPiGFBC267OARoik+XF6XpXRPM5u8JmpUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=cpSE6Lrj; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="cpSE6Lrj"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hjW385R3sz6M9l;
	Sun, 13 Sep 2026 16:32:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789309972;
	bh=8nybc2zdT1V02w60Sa6PV1zgJfsB6WiaJXMEa4g65Qs=;
	h=Date:From:Subject:To:Cc:From;
	b=cpSE6Lrju1vI/Cg/MvDmD91uwSX+H6nLaO7M4OhSmBXo/z/BOLVPbL4yvSfegtl89
	 i0TJ7K0kIH1Mit51D15xxzlHGuowoPH4O6/Z4MKkYByo22GLEpsEWn6FAumftu4mAN
	 zRVGKIKAcLAmW1rJtjIcTsRN79i2IoYd3me3ClqF3tmSck9dK+yWxB1xyjO3W2lxzj
	 TqjW2pfVNgL4Pg03a1bYcuHqC3TFJjENzp1HA0Otc/oWZaL2ton68jMLQTNpsZtUDD
	 NEgTU6N3NNkdDuEbtNaPt7gmmS1JbXq5pDutz/uYvuWonQrLWrbR2SMfroewmVF9x6
	 6qrwBjXHOKtOg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hjW384hVKz4xnG;
	Sun, 13 Sep 2026 16:32:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hjW375JZ7z8tcm;
	Sun, 13 Sep 2026 16:32:51 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id C6F385F9F0;
	Sun, 13 Sep 2026 16:32:50 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <46403cf8-9a81-4596-87eb-dde58ae4c5db@leemhuis.info>
Date: Sun, 13 Sep 2026 16:32:50 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Quick regression status pre 7.3-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
Content-Language: de-DE, en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178930997106.3071413.15283476729845245435@mxe9fb.netcup.net>
X-NC-CID: bARJ2AKGoYQNFwnQrriXCNkwDdwMaX0Ddq/iuol+wH+cRh3Vfkg=

Hi Linus! Here is a quick report about a few unresolved regressions from
the current or the previous cycle that I found worth mentioning for one
reason or another; fixes are available for all of them:


* c6b1b34b509032 ("media: pci: intel: Add CVS support for IPU bridge
driver") [v7.2-rc1] broke the internal camera on laptops where the
sensor sits behind an IVSC. There are various reports, among them:
  https://lore.kernel.org/lkml/20260901194526.6369-1-gvozdoder@gmail.com/

https://lore.kernel.org/linux-media/2f8b67fc-ec2a-46f6-9ee0-06279e612bde@badakan.com/

  Sergey Zagursky provided a fix that sits in -next as ce92674d8d8b29
("media: ipu-bridge: do not use the CVS device lookup for IVSC")
[next-20260903] and can also be found here:
  https://lore.kernel.org/all/20260902211524.5572-1-gvozdoder@gmail.com/

  I asked Mauro about the plans to mainline this up (this was before
this weeks media PR was sent), but that didn't lead to any reaction afaics:

https://lore.kernel.org/linux-media/27c82eb4-4f8e-41b5-b983-dff7a0a27951@leemhuis.info/


* f3b1357673ddb3 ("remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ
APIs") [v7.3-rc1] broke GPU and modem on on Qcom devices that have a
TrustZone firmware without PAS. This was already known before the merge
window and is still unfixed -- which is why I'm mentioning it, as it is
a good example how long some fixes take to reach mainline (see my
maintainers summit proposal). The two fixes for that regression at least
finally both made it to -next now:

 - b853857293584d ("remoteproc: qcom_q6v5_mss: Don't require PAS for
memory protection") [next-20260901]
 - b7c0f8436f077e ("drm/msm/adreno: Only check for PAS when a zap shader
is present") [next-20260911 (pending-fixes)]


The two regressions from last week's report (also known since the merge
window) are still around and didn't make any progress afaics:

> * 9417c5818a0146 ("wifi: mt76: mt7921: validate CLC firmware records")
> [v7.3-rc1] causes probe failures for some widely used mediatek wifi chips:
> 
>   - Mikhail Gavrilov reported this on 2026-08-16 (e.g. right before the
> merge window opened):
> https://lore.kernel.org/lkml/20260816132325.23007-1-mikhail.v.gavrilov@gmail.com/
>   - Junjie Cao reported this on 2026-09-01 with another fix (withdrawn
> meanwhile):
> https://lore.kernel.org/stable/20260901011840.416787-1-junjie.cao@intel.com/
> 
> 
>   The culprit's author within hours of the first report provided a fix
> that got "Tested-by" from the two aforementioned reporters:
> https://lore.kernel.org/linux-wireless/20260816174841.1918-1-acharyalaxman8848@
> 7.2 final/-rc8gmail.com/
> 
>   The maintainers afaics never reacted to the fix and it three weeks
> later still marked as "new" in patchwork:
> https://patchwork.kernel.org/project/linux-wireless/patch/20260816174841.1918-1-acharyalaxman8848@gmail.com/

The culprit made it to a few of the current stable-rc releases, but was
dropped today.

> * 9b80bd9cab40c4 ("wifi: mt76: mt7921: add regulatory wiphy self manager
> support") [v7.3-rc1] and e9f3f1cc133fc2 ("wifi: mt76: mt7925: add
> regulatory wiphy self manager support") [v7.3-rc1] also causes probe
> failures for some widely used mediatek wifi chips; the problem is in a
> similar area and affects similar chips, but from my limited
> understanding seems to be different.
> 
>  - Klara Modin reported the regression on 2026-08-24:
> https://lore.kernel.org/linux-wireless/aoyxqHYvSuaBeubf@soda.int.kasm.eu/
>  - Devin Wittmayer within a day reproduced the problem and provided a
> fix that got a Tested-by from Klara:
> https://lore.kernel.org/lkml/20260825181712.28548-1-lucid_duck@justthetip.ca/
>  - David Gow recently ran into the same problem and provided a Tested-by
> for the fix, too:
> https://lore.kernel.org/lkml/bcf1ee9b-97e5-43f9-81eb-67ac6a0a98dc@davidgow.net/
> 
>   The maintainers never reacted to that afaics and that patch is still
> marked as "new" in patchwork:
> https://patchwork.kernel.org/project/linux-wireless/patch/20260825181712.28548-1-lucid_duck@justthetip.ca/

No progress for this one afaics.

HTH, Ciao, Thorsten
