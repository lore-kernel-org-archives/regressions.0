Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838E72CCC5
	for <regressions@lists.linux.dev>; Fri, 18 Sep 2026 07:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716030; cv=none; b=h/UbX23+d9WSqxDDj4/6pZH3lzKS2hYWg4NsHp8hK68OfmG7GIscKKi1ICJrc59Q6IucKZlp5xmmOLRVWyOC0WhwQcupssj8ROcXTrV6Q0ZPTI2pWAdcLLhxVvUJj+aHTiPRjHpXv8vY5CcLdTMiFwNUJaZJX8OoYgtiA9fLsWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716030; c=relaxed/simple;
	bh=W2eB+4wVGXd6TPJ/v5kW5ZRMC8T7s7aJqHj/G4PX0uc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=EeB4TJC1ndPrdBl1yFX+5fj8y7xWjlxLPvPYf3roOp08kzkLfAGXH+uZDvQEkQJkcXUx87twpLZNkeo6I0l9q1ZwfT8+sSoYQNvhP+UnoXCE4dhMF47k8jL8Md/YBMifPslOke4Udeu2ZIEvwZJXfF0PSjWDt4t6kEc7qfKz8tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=kWmgx9Jy; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="kWmgx9Jy"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hmPCn029Dz6HvP
	for <regressions@lists.linux.dev>; Fri, 18 Sep 2026 09:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789716021;
	bh=W2eB+4wVGXd6TPJ/v5kW5ZRMC8T7s7aJqHj/G4PX0uc=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=kWmgx9JyWgyUJlQZxDmuM2+E0AHcQBhO413gK6R9RtDQv/heYMAjiLFvHo1bGnrEZ
	 hLJ/sbqdxwIjKjHjgt12/Z+qJoBqRi18pyNAT5BP9jSBXGgpw79SCSDojvlCv6BhxX
	 WIkvjNgZEg5Xsn6WqDNNGnItRLzLQr29vblPbtIKrkXVKGZ9RwqzZvtdAWBwns74KX
	 4hRGX1iL0izZLKoTJe/Q+qlKXeV+ZLWhuWXGpusIIpfI2Ox61DirZl637W0REg+C+W
	 oaPccjzk3JAhjHsrw5xXQcweGceABL1mWJyYt4kGJfoyj9F1HFgMWla7fyjFb4Rz0I
	 fctKaYw0hpt7g==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hmPCT33mpz4yTF
	for <regressions@lists.linux.dev>; Fri, 18 Sep 2026 09:20:05 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hmPCT1GSsz8tGh
	for <regressions@lists.linux.dev>; Fri, 18 Sep 2026 09:20:05 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A09445FA48
	for <regressions@lists.linux.dev>; Fri, 18 Sep 2026 09:20:04 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ec496b03-643c-4fee-b81d-8595193a6eee@leemhuis.info>
Date: Fri, 18 Sep 2026 09:20:04 +0200
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
X-PPP-Message-ID: <178971600485.343037.12108291595644806955@mxe9fb.netcup.net>
X-NC-CID: N2+xHyypMsbDolPzWYchSwXELDohD+eoRcRYo2PluS8mDrPwe0g=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-usb/a3437a3c-cf2a-4034-ae1f-0fb4bad0197b@web.de/
#regzbot dup
https://lore.kernel.org/lkml/20260825214237.4179813-1-juan.martinez@amd.com/

#regzbot report:
https://lore.kernel.org/lkml/20260825214237.4179813-1-juan.martinez@amd.com/
#regzbot fix: Revert "thunderbolt: Add quirk to reset host interface on
DMA path teardown for AMD USB4 routers"

