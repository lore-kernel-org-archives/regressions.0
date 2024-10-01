Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DE34A21
	for <regressions@lists.linux.dev>; Tue,  1 Oct 2024 13:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789412; cv=none; b=VmpcmhV9aYTQkWi+BvdzHfALqXqiC1G5HtDzzH41WHGvwW0q9dArQrYikhYRv9/RrUi67q9jNGyvcIOVtNvTq3QFtbEJLA9+j1h1WqsoMPRKeUu8wTs9/rP8IaVYvZMq1fMzdPBWgG3dMwuabU5eOeprOqDEAX4Ohgmm+fZK+0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789412; c=relaxed/simple;
	bh=6NNDSMnouOpo9NCmqSIn1xtU1Vq+WeWo/VtwcPlDRBY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=i7X7OwLL3iOEZfNSX/rPliVDf3GH4z8/7uvrhbFRohiNYIwtIF/qOBeIwJxUcaGNniv3exJyFphRZt2jylZLtz/bWH9ZCelDt4RvqIHMqP0qldDDJLyOcs0CuSyr3Co1ylf0167oZKpnf2daT9S0pX1qWN8OagRqoINcDKLYsZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=jfsRXMpE; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="jfsRXMpE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=6NNDSMnouOpo9NCmqSIn1xtU1Vq+WeWo/VtwcPlDRBY=; t=1727789410;
	x=1728221410; b=jfsRXMpEX9PbY7EaPiyHh17mVROzLTJRkVrQVk4wWqy+mewwf/bHuVGwwVfPg
	QKla4nFVQdO/kVryUDVzPHb1g2XKTxzZdg9CDMa3M9pyr6NMJlQ9vGDDS/9HgER1YZYJe6cK0FBRx
	5Z8Z4tuts4FFt741OeYWdx+hnys4GlDJTZGwdsn7f3nt2pMNSlB36jRWS2ZVAbXqnMyiOqz1QoP/A
	pqG5JffvQyQ2LWY/HAOd5tTETBtfEGezF0Umi6K0PB90JUw7jE9COlqv4DGsCu2kafotF6l6lRNQM
	vwDz2x2pat5Uj4cJyNIZizFjKuiqokBrrcgPIr6EKGLepSveBA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1svcx5-0007Kv-Ry; Tue, 01 Oct 2024 15:30:07 +0200
Message-ID: <e450df15-55a2-4855-a1de-b7adc6c3cabe@leemhuis.info>
Date: Tue, 1 Oct 2024 15:30:07 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1727789410;6090d2ab;
X-HE-SMSGID: 1svcx5-0007Kv-Ry



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/91194406-3fdf-4e38-9838-d334af538f74@kernel.dk/
#regzbot introduced: 94838d230a6c8
#regzbot summary: x86/microcode/AMD: AMD zen microcode changes break boot

#regzbot report:
https://lore.kernel.org/all/f163bcec-e5b1-4aef-91dd-431736fd6d11@xenosoft.de/
#regzbot introduced: 176000734ee2978121f..de848da12f752170c2ebe114
#regzbot summary: drm: radeon: FSL P5040 board stopped booting

#regzbot report:
https://lore.kernel.org/all/tbhy6xk4tjuza7rgsv55xss5woysyv4wlg46m6sxfq6y5nk7da@7hyl7cf5ehus/
#regzbot introduced: 740ff03d723821
#regzbot summary: Input: touchpads stopped working

#regzbot report:
https://lore.kernel.org/all/82b9c434-a0fd-4488-95be-a45b8cd4b6e6@linux.vnet.ibm.com/
#regzbot introduced: 152e11f6df29
#regzbot summary: sched/fair: kernel oops
#regzbot fix: sched: Fix sched_delayed vs cfs_bandwidth

#regzbot report:
https://lore.kernel.org/all/20240923183432.1876750-1-chantr4@gmail.com/
#regzbot introduced: ee4cdf7ba857
#regzbot summary: netfs: booting vms using qemu broke
