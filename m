Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001011C5F1B
	for <regressions@lists.linux.dev>; Sun,  9 Aug 2026 15:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786291154; cv=none; b=OetNKHIIkudKUIUBjVCUgNKCVRcPApP8RHBW3ZirjIUzm/uv4ESWdeF+rfeVQMAGy3cYKTlcVQWcK5gVIiggqGMw5Oodnj0cCwqym9s+EKkb0DgBoFkJjIaunK/wx0aHqS1vzcEuq2JCYuMhT17lgB4Fugc21h4jrGp9+q+qjVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786291154; c=relaxed/simple;
	bh=OoQ/a5FrSBOyqBfVDanjhAi7rNtpwHXwQ9leYY71MVw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=jzHiJG01RaPgkWaF4+/mi4mfLNJ5xITQi0YvqJ9RMS5hbQ6cxWrlqcuhqrJ2fycr7rF2z33pSqLWGQWRgEuJH3+QLpxA2TjgtkR2j8x/soMSvpzT8LTjyG3yS5Lod6Da+KpY+prkSRgJ1S9qtBAaW/MAb7XJkxF9uuSCbXpYL2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Nw1bPxKH; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Nw1bPxKH"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hJ2cj6S27z9BSj
	for <regressions@lists.linux.dev>; Sun,  9 Aug 2026 17:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1786291141;
	bh=OoQ/a5FrSBOyqBfVDanjhAi7rNtpwHXwQ9leYY71MVw=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=Nw1bPxKHk1m9GanSp0alOc9p/81hXIamhg5S+oX7keYsTZ2EKUhluQZwC4R4AVKqo
	 B4E1+Zf68avuvugHwh/zYHMp0A45XHfUW4+HhdroeveyXHRZwLb1MdKAbQB1E5tWL6
	 9Du5+13dDP6yWAdOy7IZHopwKMd+TuG83yOHd2LO478DnLotDQNRoPQpQaAodibCB5
	 tzKsB8ZS17Yg9vxgxULy69qsHQmMsV6FS/qtjYBv7+UryU5Tf4rYnMbU5yWcyRn1kg
	 dyl+k2LpAsUm+j7CofwJ2ZDBt8fRGsUqMY+spNWp/m4pLupkuQBVcE4aojBQS9D4zj
	 PUGzoSwHFVlIQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hJ2cj5lz2z7wh0
	for <regressions@lists.linux.dev>; Sun,  9 Aug 2026 17:59:01 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hJ2cj4FSDz8tH7
	for <regressions@lists.linux.dev>; Sun,  9 Aug 2026 17:59:01 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0A1FD5F9B3
	for <regressions@lists.linux.dev>; Sun,  9 Aug 2026 17:58:57 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ab0ead4d-af5b-48a8-aaa5-6b3c125719aa@leemhuis.info>
Date: Sun, 9 Aug 2026 17:58:55 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178629113720.486639.4710658081834067711@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 0A1FD5F9B3
X-NC-CID: b3gylTnkKPbBQVmKjKly9WzsZLQpR5SkoLgfKsjjpbQLI052apw=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:https://lore.kernel.org/all/75fb5359-b268-492d-8d4a-504d1af60f2a@app.fastmail.com/
#regzbot introduced: 3e7d63037a2b
#regzbot title: cifs: openat with O_TMPFILE returns -1 ENOENT
#regzbot fix: smb/client: return EOPNOTSUPP for unsupported O_TMPFILE
#regzbot monitor: https://lore.kernel.org/linux-cifs/20260807085806.725742-1-chenxiaosong@chenxiaosong.com/


#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5570
#regzbot introduced: 9a5a582ad96a
#regzbot title: drm: amdgpu: Transient corrupt rectangles/bands on all displays during plane updates 

#regzbot report: https://lore.kernel.org/CAEQ1D3kdA3mkQx7ei9Kq0gwky0qroJqCLKrkvgfkqgTbeu086A@mail.gmail.com
#regzbot introduced: 86aa1ea1f15c
#regzbot title: ALSA: usb-audio: too low / soft volume
#regzbot fix: ALSA: usb-audio: Fix mixer regression on SteelSeries Arctis Nova 5
#regzbot monitor: https://lore.kernel.org/all/20260808152258.1948767-1-tiwai@suse.de/


#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5529
#regzbot dup: https://lore.kernel.org/all/20260807091047.9264-1-qby140326@gmail.com/
