Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07662340282
	for <regressions@lists.linux.dev>; Sun, 30 Aug 2026 17:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788110951; cv=none; b=pROqqjp4XIPWid25AVxHW2pmIxN2PNCe4C5xZ07FMzw93XMmB1vYXe8tSn0Rjm+XZOrNDddCDdXxzqJwONUFkN+TowNw14QZtK+QaQDuJ7mJNfLq2QY60NkTHx5KFhqFsLZmL0Kbv27MuhzpCk0tlUcvaEGVy57NycBicXjHDYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788110951; c=relaxed/simple;
	bh=qJVRzgnlwQtvmBXeWW+HDknRTmPkrXcXiJkax2IBt9k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Cj5QR0v7jIgFF1rMrJZA9sowtvXch5RR1iGzCMDHb5Ey4Qcf+fyRMiQ9LTRRS4/oE15GD+d1gW2sUZEz52lFhn2xY2alZZQK/9vlwwod6kYia6crMT8ckKxtdlaQVyee0WadYQjifSlxif/wteBf8oU1kKqID5a3bwN5WbEkHwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=HvX83I6l; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="HvX83I6l"
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4hXzcp6167z8mxv
	for <regressions@lists.linux.dev>; Sun, 30 Aug 2026 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788110938;
	bh=qJVRzgnlwQtvmBXeWW+HDknRTmPkrXcXiJkax2IBt9k=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=HvX83I6lJYAEML0M0vbsAv/NQkeQvFPsNJcFL3thMX3RcXp6y05I+FRXsqCphCnVU
	 j1t8m1QzjqsTTOrnLvnovGTGYrBtZcM9ZhlvXQqEb5u4Dq5Vq1oJxYhE3/oQUtyBao
	 3aCZBudK5me5I/VpCQ8gS2nWgeCVOQ45/Mu+iFExGlE+74eBx6qQOzJohLFBEILQdN
	 hD/5Z1mz9XBTGhMkPw+F6ze7kVYmX+w3FYA+TG2l2FljCTxlT2kyEhsxxa/uBHYB9Q
	 eFJjtzoEZItnrk+1UPHzZYrykq5SMiZoPAhW7qsZgli1yLX3GT9uzMfrb1I6Y6NBBx
	 7tnGMR8qsFeog==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4hXzcp5J4Nz8f7H
	for <regressions@lists.linux.dev>; Sun, 30 Aug 2026 17:28:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hXzcp04Kcz8tXR
	for <regressions@lists.linux.dev>; Sun, 30 Aug 2026 19:28:57 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 5E3E75F9B6
	for <regressions@lists.linux.dev>; Sun, 30 Aug 2026 19:28:53 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8a365307-dcc2-4391-8f32-aa61d76b2e99@leemhuis.info>
Date: Sun, 30 Aug 2026 19:28:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178811093357.1532049.4376713827868113513@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 5E3E75F9B6
X-NC-CID: NN8uSYUe63brpSJhejEe8M9dwlciKX3HdrUtrPwF0jz7uXjfEcc=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://discuss.cachyos.org/t/keyboard-input-issues-on-asus-rog-strix-16-2025-with-cachyos-during-gaming/30823
#regzbot introduced: 4ac74ea68f64
#regzbot title: HID: asus: Keyboard Input Issues on Asus ROG Strix 16
(2025) during Gaming
#regzbot fix: HID: usbhid: skip interrupt IN polling for devices with no
input reports
#regzbot monitor:
https://lore.kernel.org/all/20260828104159.62399-1-yaseen@ghoul.dev/

#regzbot report:
https://lore.kernel.org/lkml/20260825212815.48959-1-mikhail.v.gavrilov@gmail.com/
#regzbot fix: drm: use drm_warn() in validate_blend_mode_for_alpha_formats()
