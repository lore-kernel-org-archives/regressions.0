Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0BF33F5BF
	for <regressions@lists.linux.dev>; Wed,  4 Mar 2026 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772638311; cv=none; b=UrpUw/hvk5oQr57VC3KqgbkxV9QpsR+DU8AB4cpS6Gs51kQJwZl89BPE10nk0gH3wZ1V+8ZJ1nz9d5DPddRo5t3WrZOkISVULAlwZP0GFWp/5kBvonXMd/Ca1v+p1YD++olyaS6DYhl72JuIy6F/FxLtodItJi+QBnvgHqQdo84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772638311; c=relaxed/simple;
	bh=OGSMo+NquOAsUe1dVTaQz5uTuv7KI8qRBbpyfw9azD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rbxvTybNhxLStnnPexAYSSPpCTOCUaHFYUpbGHtmQ5EYyVfZPCX+FmWlPIu8J7d/Dewjk3pKmKFIVcHae4mbI4QCHshSYU2QVUMmC8YciqoyPJQGLPdsvRltDXWaCTxYH+D6lLBjrGaEpgtA6OpHvDQ21N31ooI7fBznRmC6EnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=XyHDtfNa; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="XyHDtfNa"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4fQxV51nbPz4180;
	Wed,  4 Mar 2026 16:31:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1772638301;
	bh=OGSMo+NquOAsUe1dVTaQz5uTuv7KI8qRBbpyfw9azD4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XyHDtfNaySHVbEWPAmVe/fuBBFPtvPoW62amykXnsIbSkjtyCcmqGFjN2WFcawJd2
	 HU0e9Q0IAffbBvCBA+ZYukcB2tBSqr1FwfQwqoJP9xs8Q00OeNA5DSNXKBN0XDcNQf
	 WRpmchNj9L4fvOUlt9mFPitkkkO/GbT+Xo7vScaegcIpT8sa1gszqO68ZCUiD491SS
	 uQjs8NiyPLjiokKSOhb1FS+yIoacK1VMc16lWfoJB/sSp1dXR4jNvJ0KDJyaEC5ZA8
	 /S/6Y0dpE+9lMYSS/06e468EYHDQvdQYXS28tMzD60LNZ9qWpK12ba+Fx4zlXCLg+y
	 ZI50fu8tLausw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4fQxV513KQz3wD6;
	Wed,  4 Mar 2026 16:31:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fQxV075dLz8tYG;
	Wed,  4 Mar 2026 16:31:36 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4483F6173C;
	Wed,  4 Mar 2026 16:31:36 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <3e1d90fc-b35f-4785-8263-fd7427c4455a@leemhuis.info>
Date: Wed, 4 Mar 2026 16:31:33 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION BISECTED] Unexpected section title false positive
 warnings on DOC: directive
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>
References: <aZu9muHK02vPPl8E@archie.me>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <aZu9muHK02vPPl8E@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177263829659.1718426.8734949187560132349@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 4483F6173C
X-NC-CID: aiTWVA2+ZzZsHFqiTuajvao5b5i4fQUhwQeKFF96/ZhCzoTIecE=

On 2/23/26 03:38, Bagas Sanjaya wrote:
> [this is actually a repost of [1] since that thread didn't get any attention
> from the regressor.]

"Regressor" feels like a odd word choice here (one that according to
lore nobody has used before). Makes way more sense (and at least to me
feels more polite) to say something like "the culprit's author (Mauro)"
– especially as the person might have forgotten already that they
authored the change in questions.

> Building htmldocs on docs-next currenly produces about 80 new warnings; which
> all of them are unexpected section title on DOC: kernel-doc directive, like:

For now it looks like your the only one to see that problem, so maybe
it's something that is odd on your systems; and given that these are
warnings I'm included to stop tracking this as a regression.

Ciao, Thorsten

> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: CRITICAL: Unexpected section title.
> 
> Userspace I/O
> ------------- [docutils]
> WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -function 'Userspace I/O' ./drivers/target/target_core_user.c' processing failed with: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: (SEVERE/4) Unexpected section title.\n\nUserspace I/O\n-------------')
> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: ./include/uapi/linux/target_core_user.h:14: CRITICAL: Unexpected section title.
> 
> Ring Design
> ----------- [docutils]
> WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -function 'Ring Design' ./include/uapi/linux/target_core_user.h' processing failed with: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: ./include/uapi/linux/target_core_user.h:14: (SEVERE/4) Unexpected section title.\n\nRing Design\n-----------')
> 
> These turns out to be false-positive as touching the source file in question
> (e.g. drivers/target/target_core_user.c) and making htmldocs again makes the
> regression go away for the corresponding docs.
> 
> Bisection (with git-bisect(1)) points to bea467aa5da1f5 ("docs: media:
> v4l2-ioctl.h: document two global variables") as the first bad commit, even
> though that I suspect that bdd1cf87847ff6 ("kernel-doc: add support to handle
> DEFINE_ variables") may be the actual culprit (regressor).
> 
> The full bisection log:
> 
> git bisect start
> # status: waiting for both good and bad commits
> # bad: [7f3c3a0a9103dc92c823f27db3284ac2914e7558] MAINTAINERS: Add doc files on real-time support to Real-time Linux
> git bisect bad 7f3c3a0a9103dc92c823f27db3284ac2914e7558
> # status: waiting for good commit(s), bad commit known
> # good: [9448598b22c50c8a5bb77a9103e2d49f134c9578] Linux 6.19-rc2
> git bisect good 9448598b22c50c8a5bb77a9103e2d49f134c9578
> # bad: [5188f6bd408f937d81c0c37eb59ddc1035cd912c] docs: admin: devices: /dev/sr<N> for SCSI CD-ROM
> git bisect bad 5188f6bd408f937d81c0c37eb59ddc1035cd912c
> # bad: [bea467aa5da1f51834501da3ac3c40204027a221] docs: media: v4l2-ioctl.h: document two global variables
> git bisect bad bea467aa5da1f51834501da3ac3c40204027a221
> # good: [82e87387f6e2af9f69a7528733e953fd22e815aa] Documentation: kernel-hacking: Remove comma
> git bisect good 82e87387f6e2af9f69a7528733e953fd22e815aa
> # good: [bdd1cf87847ff6aaadd53a185209d2bb2db72165] kernel-doc: add support to handle DEFINE_ variables
> git bisect good bdd1cf87847ff6aaadd53a185209d2bb2db72165
> # first bad commit: [bea467aa5da1f51834501da3ac3c40204027a221] docs: media: v4l2-ioctl.h: document two global variables
> 
> Mauro: Since you're the author of regressor, can you please take a look on it?
> 
> Thanks.
> 
> #regzbot introduced: bea467aa5da1f5
> 
> [1]: https://lore.kernel.org/regressions/aUuLHzk5jdyBAxD7@archie.me/
> 

