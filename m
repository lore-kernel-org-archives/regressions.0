Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F52382F30
	for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 07:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776756488; cv=none; b=Bym4z4nm2JcdBwh503D8DwB8dbzq7ioD7ddozTTeOIEWz+FGTPy45b/l7HdJXmB08RWYnBtlTeL1cfOsxVzDH0czGQOYnDdWqQ73+krcMaOKwGL97D60QL2ioD5K4fchrgRpI5Y9fVHRTmDWLqeG/M7yLdY67yi6zpVluIrTt+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776756488; c=relaxed/simple;
	bh=+gNRCpIPOi8GiZp9VUMCuK310vHfb+kEPSdhDZ6msDs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=HQXlqLqkDodGcpXkpbFKKvEXvFFP8p2bs1As1qHQo26dWvZkxFq/0X80XcwL1zNrELVJm/t72WVeBwh0hZmG4+JXMdIyh8eIwnH8QQzyYtemXkJd3tJg+IsVIGxARO7L0MQSoJsJVOmxB81+ajPZIey2oxoeR/ljLrK/0TjX2Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=eVb3RfLy; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="eVb3RfLy"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4g0DTn2rvwz66FX
	for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 09:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776756477;
	bh=+gNRCpIPOi8GiZp9VUMCuK310vHfb+kEPSdhDZ6msDs=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=eVb3RfLyNzoVf6TqGwGyaIkutlLPfkMGoB+M23exj7mRb0+0in0WS0DHVZapDBXa5
	 Hb49Mpl4Ql5F/VVa9B/qw1HrBL0oSXcurac8+9Qb8ggh3kkcC7Jt3nPxipG8yUQWU1
	 vLtAJt1MX2oe5um+sp1zHKJaZJG1tnWcdnIS9sS8wNUwCv9cq6cQoTSww+D5u8m4al
	 YpMRc1KhGDuedHUynOvHtyQfk3vId0tTZB0xhlU8aIRsqctNqmoA7rmJryGe9TE3yY
	 szCExu/2ctE/LEcr0Jj+ORFa+Ov7iQiCJtuRQcLLwQhNRHhZE6jfWiOzzdhup4ccLe
	 HTh9KiclORepw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4g0DTn2752z4xQ7
	for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 09:27:57 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g0DTm72TGz8svX
	for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 09:27:56 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4B6A2635A6
	for <regressions@lists.linux.dev>; Tue, 21 Apr 2026 09:27:56 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <dbe37a92-8695-48bb-98d9-dfd8f6a53a42@leemhuis.info>
Date: Tue, 21 Apr 2026 09:27:50 +0200
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
X-PPP-Message-ID: <177675647647.367680.9127436102871869935@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 4B6A2635A6
X-NC-CID: 1L8iRw4vPdEoh7Z7OyW0eemJUAZi8tJFWm5vu5gUtdpLDH6AWXU=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-wireless/CAMX+G=Yd2fF+56+xFSzffO5Fq_PhkD41sBNkmFMpU5anN+QkmQ@mail.gmail.com/
#regzbot resolve: inconclusive: fizzled out, nothing from the reporter
for a while

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/4893
#regzbot introduced: 3a4132e6cb4879764d886f11b9fd225197fb48dd

#regzbot report:
https://lore.kernel.org/lkml/a2eae87efe46ebf397bcec3580eb9bc152b80846.camel@collabora.com/
#regzbot fix: c1bac49fe91f

#regzbot report:
https://lore.kernel.org/lkml/20250117163102.65807-1-detlev.casanova@collabora.com/
#regzbot fix: 0783052534f547f8f2

#regzbot report:
https://lore.kernel.org/all/f8566380-6a40-435a-bf8c-6c0e0999d434@mailbox.org/
#regzbot introduced: 157266edcc56715323de1bd60e49194b3b66a174
#regzbot title: x86/boot/e820: OLPC-XO-1.5 stopped booting
