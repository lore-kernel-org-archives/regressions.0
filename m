Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC27B38C2D1
	for <regressions@lists.linux.dev>; Sun,  6 Sep 2026 12:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788696848; cv=none; b=Rf9qsFyV0yUx7Duu9ifdj+ZvimS509d9FxXjTpUU/a41D00A3oTcAardHeFns+M3xggHDbfEI8lowcOpyfOTX+9A38P4Rt/BYeTHQypRWFyvxD2L00wD970KOsKj1Azhk604suQuo5JF78MY/4vKsvaLc5ZI5YYvwA990dNPEj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788696848; c=relaxed/simple;
	bh=ApJ7FiTZ+55nHKLNw62JGDF3PcDvJlXu5LlkmE/BWW0=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=o8cPpEkXxCmrJG1ss6dyM49gakVauMKbeaweZYz5u+50opOS+qcvZtPGB7IqEGX4a5jk8AZ5c/rQ2KMEnKEpWwq7OopwEpkl66NjMLcCSYFmHpMx80gYh6fZpoVxC7IUn698tYrLhaTNTEVbQQelZPbgmR1I5Kiq6pPYwZo/ROM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=fWIIl5PJ; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="fWIIl5PJ"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hd8J46VWsz4L36;
	Sun,  6 Sep 2026 14:13:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788696836;
	bh=ApJ7FiTZ+55nHKLNw62JGDF3PcDvJlXu5LlkmE/BWW0=;
	h=Date:From:To:Cc:Subject:From;
	b=fWIIl5PJfNYbO7lnFOnE+YOxOGUFWjyezWB0BeZ9mxgQ7NOgoGGRAGcLYydrrmJsj
	 NfGpt2gQBt7pS0tSjye8vCxpOmsyL79+Rls/VzZq/YrVj8ZGervsVEyqnvhq0Vnyoz
	 zweDFBETD8adSBLmQ+M5XHvtKomZ9ctbIuG/XN/5RZKqJwpe2vmZ/ux5qjgluDc0Yw
	 3Vq0PvxiVKAwLafQzD3P1OkbWe7VeoDAV4eq1SfoPAp9PY1rvJJWCm1a6+8oRIu+Je
	 BpRIS/VUdVwBN/6iI98swAXnrLyADWrGw3Kl0kLPk1aECnz/6Oo9luZ6KX+rz+YJx4
	 K/LxRopOXzj3Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hd8Hp4HD6z7y6p;
	Sun,  6 Sep 2026 14:13:42 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hd8Hp1HNjz8svJ;
	Sun,  6 Sep 2026 14:13:42 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 758E55FA8D;
	Sun,  6 Sep 2026 14:13:37 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a66fe07c-3977-4734-9991-d0d9d78484c6@leemhuis.info>
Date: Sun, 6 Sep 2026 14:13:35 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Quick regression status pre 7.3-rc2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178869681771.2508981.6611539481111890384@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 758E55FA8D
X-NC-CID: NS4apBZSEWfJw6RvJR742LoZuvvJUvnk8tDOLloXSl+TTI0LsQc=

Hi Linus! Here is a quick report about two unresolved regressions from
this cycle that seem to bother multiple people and thus might be good to
get fixed sooner rather than later; fixes are available for both of
them, but are just sitting on the list afaics:

* 9417c5818a0146 ("wifi: mt76: mt7921: validate CLC firmware records")
[v7.3-rc1] causes probe failures for some widely used mediatek wifi chips:

  - Mikhail Gavrilov reported this on 2026-08-16 (e.g. right before the
merge window opened):
https://lore.kernel.org/lkml/20260816132325.23007-1-mikhail.v.gavrilov@gmail.com/
  - Junjie Cao reported this on 2026-09-01 with another fix (withdrawn
meanwhile):
https://lore.kernel.org/stable/20260901011840.416787-1-junjie.cao@intel.com/


  The culprit's author within hours of the first report provided a fix
that got "Tested-by" from the two aforementioned reporters:
https://lore.kernel.org/linux-wireless/20260816174841.1918-1-acharyalaxman8848@
7.2 final/-rc8gmail.com/

  The maintainers afaics never reacted to the fix and it three weeks
later still marked as "new" in patchwork:
https://patchwork.kernel.org/project/linux-wireless/patch/20260816174841.1918-1-acharyalaxman8848@gmail.com/


* 9b80bd9cab40c4 ("wifi: mt76: mt7921: add regulatory wiphy self manager
support") [v7.3-rc1] and e9f3f1cc133fc2 ("wifi: mt76: mt7925: add
regulatory wiphy self manager support") [v7.3-rc1] also causes probe
failures for some widely used mediatek wifi chips; the problem is in a
similar area and affects similar chips, but from my limited
understanding seems to be different.

 - Klara Modin reported the regression on 2026-08-24:
https://lore.kernel.org/linux-wireless/aoyxqHYvSuaBeubf@soda.int.kasm.eu/
 - Devin Wittmayer within a day reproduced the problem and provided a
fix that got a Tested-by from Klara:
https://lore.kernel.org/lkml/20260825181712.28548-1-lucid_duck@justthetip.ca/
 - David Gow recently ran into the same problem and provided a Tested-by
for the fix, too:
https://lore.kernel.org/lkml/bcf1ee9b-97e5-43f9-81eb-67ac6a0a98dc@davidgow.net/

  The maintainers never reacted to that afaics and that patch is still
marked as "new" in patchwork:
https://patchwork.kernel.org/project/linux-wireless/patch/20260825181712.28548-1-lucid_duck@justthetip.ca/


FWIW, there were two other regressions that bothered multiple people and
would nearly have been mentioned in this report, but Greg send PRs with
those an ~two hours ago to you.

HTH, Ciao, Thorsten
