Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4BB32B98A
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 17:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770397819; cv=none; b=FK63QVhyZan8yuuMc00iOM75+PYoUbPQbvN+98xUSAwC2UIs1KNFC697KwBiUQCglLY/2naX5IxsUSTOOSXviz8IuIIm33pvyvRBlBgoA7xPqaxrcCUz85PGx/24ukoFOe6SSx8ti2cTXiACUuOR4aBY0QMc7jRNArvjXcpe25U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770397819; c=relaxed/simple;
	bh=kIrGZjWtnqFHlVmoxVRXY/6V7BjzQldR4I/bTtsYPRE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=RuRTOKfF6y/twrMnW1KSC0qJEq36utHdecKmBQyImY+Be5TG4DfmDaq2jBHdf6KZErMVSrw+FEZRKeoDLMp43rZ4lO4YnfECaErCH1rPsjEfGshnJ+oLdD6xg7cD8V5AlvWsagNAFme7d5ZITqQ35zeiPdSXtg74xngccGuTfb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=hmrD+v27; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="hmrD+v27"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4f70vs73ryz47D8
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 18:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1770397818;
	bh=kIrGZjWtnqFHlVmoxVRXY/6V7BjzQldR4I/bTtsYPRE=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=hmrD+v27rGNXO/VqmuAdfwxuIg2n76/fuOtxphc64SH431OCYCM/ae18QfY4CzuSD
	 Vf/cZyqTVHTJYE/Vv9l/3AQ5Ml+WZhO/bZO8IT18g9PpTQcCuGglnF5oJ6gKeXeXLT
	 YNXYFbiH06LbbaWe8UfyeZs7S9XYl/byAwB+QJU3L85kM1m8ZMd6Gzq3QXN3KbjyKe
	 tzpTqAEEWwyRFhByixxiEUq8k0+8Q5+zJrWmKQcUaubHMr3nAO8g4dkvWtH++TGk3J
	 ZSUUtSlfrf/JjKrcHJcd9j0aQ5iIzx0ivpcxumy1aicXjbtTaN/U2niia+tbjm8A5I
	 IjE7+kW53OMOg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4f70vs6M13z47CH
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 18:10:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4f70vs29ykz8sbc
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 18:10:17 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2D1EE67528
	for <regressions@lists.linux.dev>; Fri,  6 Feb 2026 18:10:16 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <e03d4af5-5cdb-4bf4-a568-06b9213247a0@leemhuis.info>
Date: Fri, 6 Feb 2026 18:10:15 +0100
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
X-PPP-Message-ID: <177039781634.2935313.6022054488237655674@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 2D1EE67528
X-NC-CID: vfGGGsVeqlvu65vtwPwrxWyXFKhW6tx3GNF/YB4+KWxM1B9Fn34=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/regressions/mwBOip3XK77dn-UJtlk-uQ1N6i3nwsKticZyQdPYzQcsk0dsjXl4oOAh-Neoxv-0TlpKnt_FEJwx8ses5VJglGLJUW-bIG8KWchtoDwCnnA=@protonmail.com/
#regzbot fix: f9a49aa302a05e

#regzbot report:
https://lore.kernel.org/linux-pci/20250611101442.387378-1-hui.wang@canonical.com/
#regzbot inconclusive: seem nobody cares anymore

#regzbot report:
https://lore.kernel.org/lkml/20251021125446.4384-1-safinaskar@gmail.com/
#regzbot fix: 2d967310c49ed93

#regzbot report:
https://lore.kernel.org/all/20251209132103.3736761-1-michael.thalmeier@hale.at/
#regzbot introduced: 9c328f54741bd5
#regzbot title: net: nfc: nci: nfc broken
#regzbot dup:
https://lore.kernel.org/all/CAHk-=wi86AosXs66-yi54+mpQjPu0upxB8ZAfG+LsMyJmcuMSA@mail.gmail.com/


