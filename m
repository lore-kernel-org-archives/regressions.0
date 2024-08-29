Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07D919408D
	for <regressions@lists.linux.dev>; Thu, 29 Aug 2024 13:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724938794; cv=none; b=mMXz6cJ3kepMCtx03yrScDbqh4lVEAhC5hjbqagz5O2YGeirAwffJi9+WyxWZxkpeF8Yq+4yEmQI6OktBH4UK6taLAd9UiDVRmnNvTBNe7bmYy/V0HZLLjxx4+CZyJk04B7toC5HOakKbs7xChBE4k89wu8+A55azhq7ixrCy8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724938794; c=relaxed/simple;
	bh=7pnFqaigLnUGu0X9Zs7r56zjjMTkLEYA0c1H2NQVN54=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=p0cwT+0boYzjLA8dHm+2BC6pdmrXehPopnhmftWTvC4cuE0XBy4JMu+FriIaeQwTG7g/lLLyMaNLSDyTlrNFwHUQFSeg+1XsE025W+2PyFPyUfxvgsYEDarDyAgYhkLiWNPU+HxPiB2SdZVgm3wQ24lDfFLUd4D4PAw/uiP8rNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=wEIaYpR3; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="wEIaYpR3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=7pnFqaigLnUGu0X9Zs7r56zjjMTkLEYA0c1H2NQVN54=; t=1724938791;
	x=1725370791; b=wEIaYpR3706Krz8FyOpgeLnw8NdSzEv1fZD3bNY2ANjiScHGlIVzxRIjVO43H
	KnYz8uOsVBrQc24PFkvERagTpqZxLfyQOhdpEK1FtLpDOQ+5JCKduC5fH7fwlFoVyKv0JGkaSGIxx
	OjO+I0II9DCXH7JdHfSidZTAJDGY5+JTZHQPe9UQYtbauNMTZACjKBH+gG8bzFg3M78iCo53DuRrd
	MMLRz26PgDeyMOHmVTO7kDxfvxJQ/Rw4do0TZTuQCKQphCUtWoN17nC8v7D3LZcqBhF+H4LijBgcX
	4PYAMjjPkaz0QMAcILbQxq28yWXeKEIbWl2W/kBlBvy7Q/86Sw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sjfNH-00005t-Sb; Thu, 29 Aug 2024 15:39:43 +0200
Message-ID: <8ffcc04f-3e97-4b85-a533-93362ef94699@leemhuis.info>
Date: Thu, 29 Aug 2024 15:39:43 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1724938791;7585f281;
X-HE-SMSGID: 1sjfNH-00005t-Sb



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219196
#regzbot introduced: 166a490f59ac10340ee5
#regzbot summary: wifi: ath11k: suspend and resume broken on various
Lenovo platforms

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219198
#regzbot introduced: f90584f4beb842
#regzbot dup:
https://lore.kernel.org/linux-iommu/20240814162726.5efe1a6e.alex.williamson@redhat.com/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219199
#regzbot introduced: v6.10.4..v6.10.5
#regzbot summary: btrfs: core dump in ordered-data.c:983

#regzbot report:
https://lore.kernel.org/regressions/37fncjpgsq45becdf2pdju0idf3hj3dtmb@sonic.net/
#regzbot fix: netfs, cifs: Fix handling of short DIO read

#regzbot report:
https://lore.kernel.org/all/a8252e0f-dab4-ef5e-2aa1-407a6f4c7204@gmail.com/
#regzbot introduced: 8bccf667f62a235
#regzbot summary: Input: cypress_ps2: touchpad of a Dell XPS 15Z stopped
working

