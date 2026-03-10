Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B0B288C2D
	for <regressions@lists.linux.dev>; Tue, 10 Mar 2026 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135274; cv=none; b=K2xwnemjBrxiRa58WCA6dsl0V7jDuJdKYW6dde4tm1+jrFiBapU31sJtVtFrQmeTwHO7m2vTx54PYOqCsp4kokdF0LekOFvGdoJvVN7ijIR92UGvGyFs8M1uCxfHvMy49EQMAEjuAj8PhdZnLO3ChdTpbN3DvTgw3dXWuQiOMts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135274; c=relaxed/simple;
	bh=nyiNMhyzJ6a+iIOaO1nHwCV3r6eGBMKcbIuopz0McX0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=jcaZDzBn0wb+Zxanou6FLw9gW9aJq0bQDWHYcD1iMCNcwF7NFr6eETchgoG6y9D8r6NCmpVj4j2aoiz/fqZ/SipqM0zFNV9yHljJqAmoOmMx0KhRev5ix8ws9a69NdxGiiBfY57oPr1clp8/tVVYfYmBwPn9W8sxkOgtwLFQnZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=SazTbYwp; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="SazTbYwp"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fVTH26j2Bz4DpJ
	for <regressions@lists.linux.dev>; Tue, 10 Mar 2026 10:34:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773135262;
	bh=nyiNMhyzJ6a+iIOaO1nHwCV3r6eGBMKcbIuopz0McX0=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=SazTbYwpVkRN7KAM2K3o7F5T1OB0uYWSzL52K3S49LvMvgP9gGtzuCb21JkJHL1wY
	 LCw1UEz3AnK2l6CWs05u/V1Y8bEa+rCG2C1+IfRN3r1uXWmRcBhBua2anhvhdbhcuV
	 KlF5yc9+fGAYdt15+iUOOkAoUi/bPzEOYuEusigDv3NQR+bNrlGSgXYCUODFzPCEQ1
	 gwnxIu5DkUlvJBFzDR5/KOv9Pe0BgyKQ+3b90OPIxl+7xT4er50MblvDsU8lMPORXB
	 SqL3LuxmoG/nZbU6oUSohAOoXvJ9V+ZlyO1pecAi5Ao4Uof1mGhIfT566JlR/6P4mH
	 29GybaO37M5sQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fVTH260fhz7wRM
	for <regressions@lists.linux.dev>; Tue, 10 Mar 2026 10:34:22 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fVTH245QJz8sbC
	for <regressions@lists.linux.dev>; Tue, 10 Mar 2026 10:34:22 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id CBE32632AF
	for <regressions@lists.linux.dev>; Tue, 10 Mar 2026 10:34:21 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <5fa4589e-6e57-4b91-9e86-05416cf1f357@leemhuis.info>
Date: Tue, 10 Mar 2026 10:34:21 +0100
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
X-PPP-Message-ID: <177313526198.1526095.3977312575393193709@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: CBE32632AF
X-NC-CID: kAspkcoicrULo1h5g50FmGwtGG87Rw/DCDo6w9DiYiw9nuqms5o=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/558b602a-1b30-2761-fff4-04d837656ea5@rock-chips.com/
#regzbot fix: 0fb59eaca18f12

#regzbot report:
https://lore.kernel.org/lkml/dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz/
#regzbot title: soc: qcom: pixel 3 broke

#regzbot report:
https://lore.kernel.org/all/CA+tjKGrmADg=oG9CT74_mgGNN3h17=LLmnv51K=MggAqo7q2Eg@mail.gmail.com/
#regzbot introduced: 3471b9a31ce352
#regzbot title: drm/amd/display: no signal when the refresh rate is
higher than the default 60Hz

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/4893
#regzbot introduced: v6.18..v6.19
#regzbot title: drm: amd: Macbook Pro dGPU AMD Radeon R9 M370X crashes
on boot

#regzbot report:
https://lore.kernel.org/all/aa6kLwNxoCIvquBT@FUE-ALEWI-WINX/
#regzbot fix: remoteproc: sysmon: Correct subsys_name_len type in QMI
request

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5052
#regzbot introduced: v6.19..v7.0-rc2
#regzbot title: drm/amd: HDMI audio to an external monitor stopped working
