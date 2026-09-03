Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C1133260B
	for <regressions@lists.linux.dev>; Thu,  3 Sep 2026 07:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420452; cv=none; b=QJvjB5v8QqQfx1GcblrsyXrWmrGjzn4SE6y0Aqe38ihaPkUoszDo+qQh77ECLDBOfCueWiCnwdPjY+RRjg8cysDustx+SjyoMZzsSlIkiDJEjlvcn6d7G8Iv3r053E76eIT88gjuhvVsRq9MxJdP1z0uFLV9UZei+5Dt/dAZcBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420452; c=relaxed/simple;
	bh=K1xrkipTKKSx4IJiPFDMHppHsboIepHX4eZ1JQvEp6g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Z8SUJtBUqt6BzbVFdXcauSimRDnGoeYTF3mI3wFdoRYXCsMWI2tG8Ma150XVmewuBAHt/UsoxUEC16fp0MU0tmE17xIYCIuuB90TifR3WDI8qxUT5reJJYQSmCZFZ+9Ue7CDiyyEbtgtzBCrxdl3lS5O8IhWU5nrgS26bI2xTDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=bP4D09So; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="bP4D09So"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hb9s737V5z63MW
	for <regressions@lists.linux.dev>; Thu,  3 Sep 2026 09:17:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788419835;
	bh=K1xrkipTKKSx4IJiPFDMHppHsboIepHX4eZ1JQvEp6g=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=bP4D09SosuCX31VRbkIistLQrRdxRBWJQBfsTcXkVe/iiT3y9vFsyY8GqJAbPG9HN
	 fFubYE52GoKVt/rkNQUwcISAB6GQD92ww5yPmxviOHfr7tOu3CgxIPxN6fymr960ae
	 4smzNYESVL8sU9RMY7p0QMs0X1lqAJ20yueJ3wu7r9IlGk1Jnrf1SRC6cV/C8Khquv
	 yV3hwXSmOGWmqdp9bnrilxCoyQLy/GP5Z5JJaoMzKzLSqVYMnIi59zoz4pZ0qxrtvP
	 3L3qwIjRSxb6VsU6C4LPXLZq8rXgFov3n9mnOtVULBXmZX2XRxm34xBbBu4kdgO9J/
	 q7JjgBlRF647w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hb9s72RCFz51Y5
	for <regressions@lists.linux.dev>; Thu,  3 Sep 2026 09:17:15 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hb9s70fj0z8svF
	for <regressions@lists.linux.dev>; Thu,  3 Sep 2026 09:17:15 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 86BEE5FA7B
	for <regressions@lists.linux.dev>; Thu,  3 Sep 2026 09:17:14 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <d1b68f9f-8a66-41f0-ac08-8fbcb2fda16a@leemhuis.info>
Date: Thu, 3 Sep 2026 09:17:12 +0200
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
X-PPP-Message-ID: <178841983473.2439735.451280483941549897@mxe9fb.netcup.net>
X-NC-CID: tJMeeFwON8/krSv+WgOPUj/G8pCbcVeC6Aij9xp6Vana3YdgtTs=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5723
#regzbot introduced: 3c108046e1d6
#regzbot title: drm: amd: internal display brightness reduced on Linux
7.2 with Ryzen 7 5700U on Lenovo IdeaPad 5 14ALC05
#regzbot monitor:
https://lore.kernel.org/all/20260901140155.19129-1-aarav.240604@gmail.com/

#regzbot report:
https://lore.kernel.org/all/20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com/
#regzbot introduced: 1448c2d2ca5c
#regzbot title: platform/x86: x86-android-tablets: lookups with Arizona
and Crystal Cove GPIO
#regzbot fix: platform/x86: x86-android-tablets: fix
gpio_secondary_fwnode_init() not working

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5735
#regzbot introduced: 8277a12d0d60
#regzbot title: dma-pool: display (amdgpu) stays dark
#regzbot dup:
https://lore.kernel.org/all/CANB4YXS=Nf-co3t8eMHtqrW4sn=1BDcP6o=EoTrgZm0WYMYTyw@mail.gmail.com/

#regzbot report:
https://lore.kernel.org/all/20260902161347.4163577-1-vlad.wing@gmail.com/
#regzbot introduced: 2d69b891e646
#regzbot title: kbuild: old-headers are picked
#regzbot fix: kbuild: don't delete in-flight filechk temporaries in
asm-headers
