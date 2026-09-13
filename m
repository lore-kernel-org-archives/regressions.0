Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99DD3839BD
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302737; cv=none; b=D4um2XAXr4ICRw5vJ7aw9B5WQXid0KezYAyi3T9CyfS/P6SpTboZrHQq9MseDhiUjHfMK7Mvrm273hlGcTPL9hLVwP4AR5j2WVkjAb2CSR1SHH1TPXpSWG3rdDVlCkK06PwU3TpndkGZJTUwre9LwH33scC3LNXX93XDb01YURE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302737; c=relaxed/simple;
	bh=877YAeRSL7z5qyOylwXSNW214D0eYdMkoBXqf8geiz4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=LmZt4Ch2rxNjMPBTyOF/qspBcYcve/JHd71K2K86GBYoV7/7hba3O+jvccCVje2aC9yfPrOJXBRtc87M47EWWnkBp0hSEJUnwZZUrmAxhuAjyUsJeEUzN1VQ7GPSmIptlW0YG3HTEeKVpsK+0X4R5tLSoSbLWfjevsXmEZxew2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=PJkdtRqS; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="PJkdtRqS"
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4hjSMp2P7sz8f7w
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 12:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789302726;
	bh=877YAeRSL7z5qyOylwXSNW214D0eYdMkoBXqf8geiz4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=PJkdtRqS9X08dOV7B3NKn1fypdOJaKSsuINn7S/KV6IIIK1dEmHxD74KYAFzB/g5I
	 UlwWVaIhReXfd0oGeB+M17FqcG9pj+rFBUr2d3klmHhjUpGqigygW8zYTbbqbkfqLD
	 ScS9IGhXwpN89SIhjZGnd9DnhEYPTKQAfbu3mL5XYJdHU57IhbOqcw8vDXxtF6U9g/
	 jQqF4qhnoeblTXtK7rgYJwiUeDMJuqBXFoclP92nj31ezBGx2AupExv0g6SU85ySZM
	 nGADkQeMKK6l0rIrmv7fSfTGkJWpSX9+Y64cRdWpbAaWXsVrXaMgLvpLHRHszAhsUz
	 YkV08ltMpLetQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4hjSMp1hpsz8f6R
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 12:32:06 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hjSMn72rxz8tHB
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 14:32:05 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4FA095F995
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 14:32:05 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <79f0496f-c468-4da2-a976-eada439408be@leemhuis.info>
Date: Sun, 13 Sep 2026 14:32:04 +0200
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
X-PPP-Message-ID: 
 <178930272549.2071666.15130392012594674410@mxe9fb.netcup.net>
X-NC-CID: tFtOsyVgviX7WYiD4unkwDR40JFN2xAwzXGLCgi4OHSadS3ywQM=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20260908105717.496232-1-junjie.cao@intel.com/
#regzbot introduced: 8e2b43d2c10b
#regzbot title: edia: i2c: cvs: machine has no sound
#regzbot fix: media: i2c: cvs: Get the wake IRQ without claiming the GPIO
