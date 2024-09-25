Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821B46FDC
	for <regressions@lists.linux.dev>; Wed, 25 Sep 2024 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727263341; cv=none; b=cYIJddkRomhctBNhz9ZD/yJlKnFh9fu7tWerzCay2wRb8VqhYxxPpEg7PoxffDgPuOzLL4fAXyNO457g5o2NTwcGytdSjswROkwHR9yl9oXfyT4uejdLK0DeSgjQvKSffLDnK+/I27f6/BvGXgVxGMcc9KNI+e7tGygQ36H23hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727263341; c=relaxed/simple;
	bh=Zl0FQZ9ssppMWjpMx7vY9TPAT6vhJDzsLZsSz54v2DM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Feu1+Ummus5BjheiyyeMv997ajiHexGvnYrJ9UxXu0hpC91IJ/4jxCNHaj/l08FUWhEs+cDK7s1QljbOAJQV+wL2p0UdMBMCld8iEUXiebp/huOQkcxLwZF+fadwOBsAUqHt1j77cATMU9Hmz79wxFhrzAeO3+LP8hyvzEI0mlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=KT7tJnO9; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="KT7tJnO9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Zl0FQZ9ssppMWjpMx7vY9TPAT6vhJDzsLZsSz54v2DM=; t=1727263339;
	x=1727695339; b=KT7tJnO9J/eaW41FsYHakXO5xe6wLx6R5tB43ETUy+MPGzS80mbDi3fycf10E
	LmAl/glUMu2l11BymDlKX1mhENcwSBAmEksZYIqDSke2vSOIIUcXpsldLqX7AGKkvZRElI0J5UYz+
	QC+/jH3vCwGEJGtzpLYa1kcu5b+Lqgx53P9lnrH+TOkB2Ger6vGfZR9BuWBa5V3r2822dBvPxO0bm
	MVxoZvuHBnbWNdwk3mi7Uki+vgOCzu8ZORa25UMh3s55+IrvgoXx0ltuigdC4WK7cOPI8QivIpkAN
	DmIe8kHqIVmeEghWR0988r/qKaZuK8PyR/hTGJTAaGEOLMq1kw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1stQ65-0000IV-Oc; Wed, 25 Sep 2024 13:22:17 +0200
Message-ID: <89b6eee6-1b53-4a3c-818a-ed46b118f874@leemhuis.info>
Date: Wed, 25 Sep 2024 13:22:17 +0200
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
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1727263339;dc1d40c5;
X-HE-SMSGID: 1stQ65-0000IV-Oc



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20240908144414.82887-1-hdegoede@redhat.com/
#regzbot dup:
https://lore.kernel.org/all/20240914081523.798940-1-andreas@kemnade.info/
#regzbot fix: 78f281e5bdeb64

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219278#c1
#regzbot introduced: 1d3dd1d56c
#regzbot summary: NFSD: Resource temporarily unavailable when reading
file attributes the first time

#regzbot report:
https://lore.kernel.org/all/a458645a-e1ee-4ad9-91bc-1a97f7b8a01d@telus.net/
#regzbot introduced: v6.10..v6.11-rc6
#regzbot summary: drm: amdgpu: crash on startx

#regzbot report: https://lore.kernel.org/all/20240828184019.GA21181@eaf/
#regzbot introduced: 1b0e3ea9301a42
#regzbot summary: perf/smmuv3: qcom-rng is broken for acpi

#regzbot report:
https://lore.kernel.org/all/20240917055730.Horde.pVyI-XF1MRA_zUQ5BDJZ4lC@ignaz.org/
#regzbot introduced: 1fd4b3fe52ef
#regzbot summary: wifi: rtw89: pci: wifi is no longer working
#regzbot monitor:
https://lore.kernel.org/linux-wireless/20240924021633.19861-1-pkshih@realtek.com/

#regzbot report:
https://lore.kernel.org/all/20240919165641.4632-1-user@am64/
#regzbot introduced: 90985660ba488cd3428706e7d53d6c9cdbbf3101
#regzbot summary: drm/radeon: blank screen and NULL pointer dereference

#regzbot report:
https://lore.kernel.org/all/c9373aab-24b5-4cc1-bc3e-3cdb4b28f067@prnet.org/
#regzbot introduced: c0247d289e73
#regzbot summary: btrfs: btrfs send crash
#regzbot monitor:
https://lore.kernel.org/linux-btrfs/ee24884b0255f717071ca932bda1ab398707d9cf.1726782272.git.fdmanana@suse.com/


