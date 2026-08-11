Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9970839CCEC
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440844; cv=none; b=rQZYPGdRLnpuAQnxqaQnw3lhuNIRtfbQuHUUMskry5MLTA7rxw/Ks7r4M4PqiKdfroDfyHxqZDHfUDx53Bi7mI15fAJzVJEyvQQNiOr/yxGdSYnRFDATJi93nI9iU28A4wzl5WUz9b/yhKvMzCSQhVQxAutKJpgcYQuMJvHWGaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440844; c=relaxed/simple;
	bh=nDYZar3caSc1NdI9WToFmjkpplTb7VWMaYkMoJrDNnc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=DAV9OZK7Mc/aMW4UIf5a1OumCLCJQA7f/xyRnpyx8pIswELNpkrNmKGrJWB1Rqr1vtUNt+Gh0Z+QqLQZZKaeEGlYd6j9IoQAsSU9lqAsF9SQO1lqAHh8rrFqBol1gPy8F8uJ1A0g+LNV14Qt4upz97pidN5su/hGe4OoNOM0ML8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YQDLvXxJ; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YQDLvXxJ"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4hK5zQ6dHzz86HN
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 11:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1786440834;
	bh=nDYZar3caSc1NdI9WToFmjkpplTb7VWMaYkMoJrDNnc=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=YQDLvXxJQrCdtkuNSFvKEYxE5yNn5NcrKE+LDB1HuDDCg4ff8Kef0Asnkab1FK1gj
	 SxgJW1fJw8GKOP4TYjxSXrwwYLemPClkoYKUZwMvUldE2xH3qHQHrR30ewNd4Bojlv
	 qzXITCWxXU21mRXlJdwgaQwW3xyyANUq/swwLe8soETNcKnYdxvU+LTDMkKvbg5jwT
	 lMSrt7V3GGt9k8HK4hEFUtPJhLtcyA22jBgaUxganjkUTgK8PPf2e0QD17ZY1y8zkY
	 0IPwoykH1dWDFJk+4oVrQPix/Ce9pYapbdfKbEe4RVjYCzaRcdoHICIU7O8TkTbGqC
	 2mD/yHsdc72SQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4hK5zQ5wCzz4xJ5
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 11:33:54 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hK5zQ4TCHz8sbs
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 11:33:54 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 11A155FA60
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 11:33:54 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <83b430b4-ba70-41ac-80f1-31fab93cbcd5@leemhuis.info>
Date: Tue, 11 Aug 2026 11:33:52 +0200
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
X-PPP-Message-ID: <178644083425.1807683.6301337611289252998@mxe9fb.netcup.net>
X-NC-CID: IkjZ15/2YuM6MPSZyW1nANQQ74TUa9G0Br/pNmlCtzmOV4RWEpU=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221827
#regzbot dup:
https://lore.kernel.org/all/9c6acb62-4080-48e6-9ba2-d1c457c4ec88@gmail.com/

#regzbot report:
https://lore.kernel.org/lkml/OS3PR01MB8827AC846F82A406D22E3FB7DECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com/
#regzbot resolve: was likely a false-positive

#regzbot report:
https://lore.kernel.org/all/20260807091047.9264-1-qby140326@gmail.com/
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/5529

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5447
#regzbot fix: drm/amdgpu: Prefer default discovery offset
