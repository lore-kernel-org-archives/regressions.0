Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF2247FAE1;
	Tue, 15 Sep 2026 11:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470630; cv=none; b=reGWHU87f51MNHilMLP0vH/vDHmD860aHF+CCxF0+Ud0CDQVyDuTH35WtAkjcSdkvC/TkCoBjEGQyX1Wwei5XEDwYtBvDBMHeNi+g8ATpPJCblygnZGseVhDCY+sPH9VJpkMS1dRctEshhxLcpO8+iQsdxZV7zTb63SEENYODJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470630; c=relaxed/simple;
	bh=TcA4lY2E2WWd9Xy3iewpSUYhSnYF8XQlUe4Z9oVYSK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5k61ecB+4U+LOYjtgNLdNkPvIGK/9k3VqHbKFIyKWJ3ILEDYvpdUpAhq2WI4gLk6vKAxR6j1WY9KMEIi2HdlvbHeWvlZ/svgu5GtDiXgZxjZ3HLeHYyXqJSnu5C9ictRczSb7G8dCfo3KL9FEeR22JK/KyRUHN/Ajf8t1O5an8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YedH2Rm9; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YedH2Rm9"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4hkfFv2JYpz8pm2;
	Tue, 15 Sep 2026 11:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789470067;
	bh=TcA4lY2E2WWd9Xy3iewpSUYhSnYF8XQlUe4Z9oVYSK4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YedH2Rm920wB01jNvXLWNQE0lEbIEDxaVcBnYpM5XOWPncbqrzfd6I3ZOx+YcKnua
	 20v22VDdsX+CG5i+s86+IRKkdyB6qFzu6EtCPiwLsQbWS012JBsj5RPX9wHGA541BN
	 Pp8imtJo5CrAp2ICv4NYavTIDi9IFxJnTStAhp2kGi80xR5SW2pPqlMv/yqblFjPn8
	 Pu47ciONsZ05B2T4sZfns4hiodLaYghnJTBf/BVmGrN2sgHmMhsoB+vzcmco2uUAiq
	 JUhYy+J/K5rBVxUIEJdymUrRrbRtgu52W1Ihgf0qG6HCyOVtj6VB0lheRd7GQC0utm
	 9LTB//ETk9CQw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4hkfD94TlZz8bXr;
	Tue, 15 Sep 2026 10:59:37 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hkfD90ntsz8tH7;
	Tue, 15 Sep 2026 12:59:36 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id B9BF75FAB4;
	Tue, 15 Sep 2026 12:59:31 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8c295b9b-211e-4343-afe1-6afe61160d16@leemhuis.info>
Date: Tue, 15 Sep 2026 12:59:31 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build)unused function 'parse_edid_cea'
 [-Werror,-Wunused-function] in dri...
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
References: <178914594374.4423.11399857311284391817@kernelci.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <178914594374.4423.11399857311284391817@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178946997214.1364678.8687729069052407823@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: B9BF75FAB4
X-NC-CID: Uz7o31OQ97IQgJcQ+fNIVPtdvcgHuYbYguoaG7Ou2FkDQwbSlCs=

On 9/11/26 18:59, KernelCI bot wrote:
> New build issue found on next/master:
> 
> ---
> unused function 'parse_edid_cea' [-Werror,-Wunused-function] in drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.o (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c) [logspec:kbuild,kbuild.compiler.error]
> ---
FWIW, this and the similar report
https://lore.kernel.org/regressions/178914594374.4423.11399857311284391817@kernelci.org/
were due to a mistake in merge conflict resolution
https://lore.kernel.org/all/aqiBCCgXCnahDcT7@sirena.org.uk/

Ciao, Thorsten

#regzbot report:
https://lore.kernel.org/regressions/178914594745.4423.13336797159691042320@kernelci.org/
#regzbot dup:
https://lore.kernel.org/regressions/178914594374.4423.11399857311284391817@kernelci.org/
#regzbot resolve: mistake in merge conflict resolution
