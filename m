Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E7640A940
	for <regressions@lists.linux.dev>; Thu,  6 Aug 2026 11:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017002; cv=none; b=r9zh7/h1M2r3Ur9IvhS5Abic679ymzQHiCdn/tmhzHDAjUZADFDJMj2zAVfAMTtImXMT9SNG2Co3IuZGpopc3Hm/Wph7GU7clH0oAF1t2us5gt+ELDUyLG6M9VzO68TVvcoWqwjBcbH52/qgZIS1CHo4Rk7YSqWs3VBoc+qGeM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017002; c=relaxed/simple;
	bh=+XKhQR3M9qsibJTLd0kX4ZZ6li5mJSW4nZ8qS5nNJVI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=o8WKZqjoUShrWcPfdrnyNXRI7qmcUgUyFQ5sVxR3WKvqYgmOjocAacebgPxuwdkUaTLi8439GWbBIaxenGCQLfk1b22/z0aQsWck83psyKymURw8Cz0ZnTseuFqO4orWYqwQitazCvvkYVIFLazW4hHdYMxwFo9i/tHM1HSGWnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=d145q2lA; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="d145q2lA"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hG5DX5h9rz9D3X
	for <regressions@lists.linux.dev>; Thu,  6 Aug 2026 13:49:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1786016988;
	bh=+XKhQR3M9qsibJTLd0kX4ZZ6li5mJSW4nZ8qS5nNJVI=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=d145q2lAvvVnb8m2lL5XF8QDunF3PDnsBW/c1x91jLZ03y8lz6KY0PmMOFlaXOmDo
	 BH9FWBR7EmhGkOg5YorWs0scAcZ8VOD0v7MfNtBV9CIcpaEwg6ZXa1Q3hVCqG/qCBJ
	 gfXS+SmG7vVrNiDKso/uqRVzSeysxZQzdcpyf9KUAJOHP8Pqv23TwG6h7hyR5Vzq6G
	 syt1sCWLlKNrQ5LwIIi4VIDCIslCRA+ITq2TEiXNTumgcr5vvnjPhLYWd5vz/M1Ly6
	 AH/JUesfzW8f/S38/cDVwFXbi00o9FdjCI8Je9mvOLwzWZYtmCT4iDlh0N0sfC4uoA
	 0yk3WUGVXGS4Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hG5DX50Qjz7xbM
	for <regressions@lists.linux.dev>; Thu,  6 Aug 2026 13:49:48 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hG5DX3q3Yz8sch
	for <regressions@lists.linux.dev>; Thu,  6 Aug 2026 13:49:48 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0C6E65FA39
	for <regressions@lists.linux.dev>; Thu,  6 Aug 2026 13:49:48 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c5431994-77f7-44ed-9c67-7a29622f0c3a@leemhuis.info>
Date: Thu, 6 Aug 2026 13:49:47 +0200
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
X-PPP-Message-ID: <178601698821.76894.2036327165688706246@mxe9fb.netcup.net>
X-NC-CID: PzhVRS/+uQxnr+rFGodplH4+gpajaLPfIEoztYQm4gROK16rh54=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16743
#regzbot introduced: 8c9006283e4b767003b2d11182d6e90f8b184c3d
#regzbot title: drm/i915/dp: random screen flicker on eDP

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221827
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/5562
