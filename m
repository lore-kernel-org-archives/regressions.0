Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5829ACC5
	for <regressions@lists.linux.dev>; Thu,  2 Apr 2026 09:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775120608; cv=none; b=oeH+mGTjxPNnCe8aINFWOtjoHtjcVEXccBs0pCqJMhOxrRoScyTY2N/MmMyZCwjFvP+E5rAwLvbJDwWc1gkKLGNQbNz3GP6ErWB49hLhY49NQbUz5sJLi/dm3K8/U7Vrt8dlv9VsH09k4p5XgurYGGdgUsR50eh/XEqZbdUUBq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775120608; c=relaxed/simple;
	bh=HYny2x17Gkbklih4RcLp+OyIQaJx/JG4agHGAJxYUls=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=t8MfpEv6sRFXJWqCDdbdgfOUhtkpwYFYpWVVT+3WFoSOiK3b/luCGN3qC64RJjPpS9+qcvZzZv+7b/hYuy5JCjCb7jDiWqGonK2OQrm6sXnPy4wUUvKoAnEpQSbbWzWXDBDIOhYzUXIP0yFWMoi0klxg/8kc1HxQ7XkN9tgwAPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=GRcnVh8D; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="GRcnVh8D"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4fmbTn4CxFz62sJ
	for <regressions@lists.linux.dev>; Thu,  2 Apr 2026 11:02:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1775120557;
	bh=HYny2x17Gkbklih4RcLp+OyIQaJx/JG4agHGAJxYUls=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=GRcnVh8DWsZp4GnfOIo7Rt7LiExA3YDy/cpVR2ivdst4RA4M2k5iEulhf24gZJPrt
	 g2P2w9QKpBEerf8EFpVcDZqaLu0rg7zqJFcq+Qkm7ZH5VPDZFgwpHbCsKHhYvcRIm7
	 M8LWsFCp94Tyt+YhK7EirHH3goFEKzznzhUvI/ogy3uEddicQzur+cj0V4BiJrmP8x
	 1KC+85uQDRqq6i+7y6XTbCtOXhSRehD4I10L/CAYWPoFioJtzy0ItZ36xvEcjM0PEe
	 UjtaMgB5KOHHdGrSb0JzfPN5llUXjg6fL9i3KBLwlUialxgtSatDpvrqRoJDoi3Q26
	 J7c24cclvgZIg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4fmbTn3VJ9z4xQ0
	for <regressions@lists.linux.dev>; Thu,  2 Apr 2026 11:02:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fmbTm4dHMz8t4R
	for <regressions@lists.linux.dev>; Thu,  2 Apr 2026 11:02:36 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id EDAC563619
	for <regressions@lists.linux.dev>; Thu,  2 Apr 2026 11:02:35 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a9aff139-77f9-463f-800c-c470bdba45fc@leemhuis.info>
Date: Thu, 2 Apr 2026 11:02:35 +0200
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
X-PPP-Message-ID: <177512055614.1136692.6473441364923982138@mxe9fb.netcup.net>
X-NC-CID: zdTPccX/7ujF81Vz8fy8BRP2SlP5nfznNEa2D9/ijDd2xm3ZGhY=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5133
#regzbot introduced: d76c66c6ad839941819
#regzbot title: drm/amd/pm: kexec stopped working

#regzbot report:
https://lore.kernel.org/all/CAOKSTBs1VNBdjRZe3M2v-nC%2BpLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com/
#regzbot introduced: b82f0759346617b2

#regzbot report:
https://lore.kernel.org/all/CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com/
#regzbot introduced: v7.0-rc4..v7.0-rc5
#regzbot title: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI
[1022:15b8] dies on resume from suspend

#regzbot report:
https://lore.kernel.org/all/PH0PR11MB55934A1C9A8C35B1E751C247CD50A@PH0PR11MB5593.namprd11.prod.outlook.com/
#regzbot introduced: 0c4f1c02d27a880b10b58c63f574f13bed4f711d
#regzbot title: wifi: cfg80211: deadlock

#regzbot report:
https://lore.kernel.org/all/291f78bf-4b4a-40dd-867d-053b36c564b3@proxmox.com/
#regzbot introduced: 9b8b84879d4adc
#regzbot title: block: unable to handle page fault errors

#regzbot report: http://lore.kernel.org/all/ac4lw9tTNn4baO_h%40altlinux.org
#regzbot introduced: 26a40327c25c00
#regzbot title: drm/xe: NULL pointer dereference
