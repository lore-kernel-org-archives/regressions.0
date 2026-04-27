Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988953B2FF3
	for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 09:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777283082; cv=none; b=PLUvzoMCKnQTKU9nUrBpUkn48Lawyk3P9pEU17vTWIg3r6l5dFz27nvIYuNYp9d/TE5pBU6ezv4m7KEMbjLHAFwq6WxS3dNFZI0YwY1PDI8gXK/R7iCUiMSXm7lynIqlME6U57x4emQkLgKXj8Hk0RsRu5+dQ+5KpUjaN2CW0fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777283082; c=relaxed/simple;
	bh=WAZl2h4jDPwyDStFG5RaQK5OkI2VUxN4Ha5YU0wrxNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=tpaKlPsn4NAUfjDP3RbsNoTiFjVjgvFST8b/XPkh/aCkX7na8hL5KkXzN4BdeDAiM8KZS7RTJq4yPl4Rk/srVuu4thW4zwS7uFm+oTAm4JU8Eg/pwkucyxi0yTIZjBqCoepeR7Ol9ySeTgHhtDsndJuBYQdb/HvcsaHBvl6cpX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=QPoHYnKp; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="QPoHYnKp"
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4g3z2R48WVz71Rl;
	Mon, 27 Apr 2026 11:35:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1777282543;
	bh=WAZl2h4jDPwyDStFG5RaQK5OkI2VUxN4Ha5YU0wrxNU=;
	h=Date:Subject:To:References:From:Cc:Reply-To:In-Reply-To:From;
	b=QPoHYnKpfVBaPOc5UWoNMSH4LNGLk+EnLKw2CqVa0HMdrowXkFHJ+VhxtJZTIIS8z
	 aR1W6YK8AbD0NYjnXeCCvFpL4yfGKH8VTCgGr3GHYIdZpNOkWP/Yt74IboqiBQlNa8
	 Hg2PC6N32L90uy0Oj/Ys2ANvlBG9RnZ5OzsRhfiVAezsW17Wp7E1Yex0NUWB/hSjrM
	 ciESgFugKCo0m5OprzVRI3c9QZesVaxQtkIhGgYSQoexVzcodxwZ98VCkw1C9bBUuS
	 ViVy7qkgK7VcHr8BFu8J1Z8529StnfjUvDBxEKP4b8RBS1c2yiFgp9bzO44KhFJBwy
	 cJP94MJfLw3tw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4g3z2R3SLWz71R1;
	Mon, 27 Apr 2026 11:35:43 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g3z2Q3HFjz8sZh;
	Mon, 27 Apr 2026 11:35:42 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A8262632B7;
	Mon, 27 Apr 2026 11:35:41 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6c48aff5-b6ee-40af-98f0-c26ded3095bc@leemhuis.info>
Date: Mon, 27 Apr 2026 11:35:40 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] amdgpu error -22 first encountered in kernel 6.19,
 not fixed in 7.0
To: Brandon Taylor <br.ta.2818@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: 
 <CAMYTvdA+yCqU4_9mzMUkX_3S=myExKMBCyB88dYWCMwA1edsrw@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Timo Lindfors <timo.lindfors@iki.fi>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: 
 <CAMYTvdA+yCqU4_9mzMUkX_3S=myExKMBCyB88dYWCMwA1edsrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177728254204.278230.6479635209091071276@mxe9fb.netcup.net>
X-NC-CID: oDMoUf7EhfuY0SViidsRx00FAG2iO8Bu/2zx3SOezkW25uKD0uU=

On 4/26/26 01:22, Brandon Taylor wrote:
> I have an AMD Radeon R9 270X GPU (yes, I know it's old) which used to
> default to the `radeon` firmware

FYI, as using the wrong terms can lead to confusion while dealing with
bugs: that's not a firmware, that's the driver (sometimes also called
kernel module)

> on kernel versions up to and
> including 6.18. I could manually change this behavior to use the new
> `amdgpu` firmware by setting `radeon.si_support=0 amdgpu.si_support=1`
> as kernel parameters in the GRUB bootloader. Everything worked fine,
> and I was able to play my Windows games without any problems.
> 
> That was, until kernel version 6.19 came out.>
> 6.19, from what I was able to Google, was supposed to have AMD GPUs to
> default to the new `amdgpu` firmware. Unfortunately, when I updated
> the kernel and rebooted, I got a black screen.
> 
> Further Google searches led me to reboot, set `nomodeset` in the
> kernel parameters, switch to a TTY, login, and investigate the output
> of a `dmesg` command — and what I saw ... Well, let's just say it's
> the kind of thing that would make Linus go Chernobyl:
> 
> `amdgpu: probe with driver amdgpu failed with error -22`

Please provide a full kernel log, this is needed to full understand the
problem

> And this issue has not been fixed in kernel version 7.0, which I guess
> is set to be the next LTS kernel.

No, it's not.

> Now, I hope to God that this email finds whoever is responsible for
> breaking this `amdgpu` firmware before the same thing happens to Linus
> via Fedora 44, and he goes berserk. I realize that's not a heck of a
> lot of time, but God only knows HOW many Linux users with AMD GPUs are
> pissed off by this kind of issue — and I for one can only imagine how
> Linus' reaction will compare when it happens to HIM!

FWIW, you seem to assume that the problem hits everyone with a AMD GPUs.
That's not the case, we'd know this by now. Maybe it's not even
something that hits everyone with a card/gpu like yours, as some falires
only show up in certain environments, for example in combination with a
specific mainboard chipset or firmware.

Anyway: I CCed a few people that might be able to help. But they likely
will need at least the full kernel log mentioned above .

Ciao, Thorsten
