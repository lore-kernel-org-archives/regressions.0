Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F87F35502B
	for <regressions@lists.linux.dev>; Tue, 21 Oct 2025 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761050279; cv=none; b=p3k1Xf+7fpHESAXqJVpjaAEWnKqTecI/RdaHB1T8/tQCwaOL4anSOINtaIdEyobFUMW32vN8QCd+5Vpyo3DqYZyBxyPm+QP8ObwywqMTN/FUwpMO9CEK9fI0+NoYsqaXNXyh5TEKKxhcFv0hL9s2trYTx9ImVd1O8Kk3mlY6JMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761050279; c=relaxed/simple;
	bh=MJECAj2o6M3zfx2IrzNBSFKCVM2d/fQZ2FxDT9nbcPM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=MVxA/g5tbYg7eWbr8iFHStL+tEzmWNNVqvyT6J/w8KEztvmldRru08BMTTef3kShfRWcPxaiyj/itQSBulslddib0WkeyzYOiKqd7DfMAIFcOq01zDMnvz4cHP3T65zrqHjyO5Rq9aVEC9gBv9gEMsvztPdQC91HrNAQ+YQqMSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=r1LW5aLL; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="r1LW5aLL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=MJECAj2o6M3zfx2IrzNBSFKCVM2d/fQZ2FxDT9nbcPM=; t=1761050277;
	x=1761482277; b=r1LW5aLL1XXJhtskjPnzav8ZPJhtpFoWU8PPDT1GU2w/G53SF19jwAhq5v3WO
	WvWkZMWJaeMlRuBq9NHHuTa64qwMOcfGyKRInoS+tv1Yoq+hW6vET6A28ZydF5ju1YiQVYdt0ngb/
	sp6hV5Ayie2OjVdJhh6Y0+zlhj4EFotqyJ/xhADZnORYZYsdKJdKKsJRWw0YWZj6xcPtpVQA2o88B
	lruRHgsniKNoQnvdzk4+T+gNBtt2wFxSDFCJ3NBAt6S1Tk0/PNxf36DhD7XeEIQu7n+n3fHSYv6XY
	tj3Z1WdBllwsl4hPjxIQ+FFyC03FIYm+zzlCxkTNYrTCbCkTiw==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vBBch-004f1W-1Q;
	Tue, 21 Oct 2025 14:37:55 +0200
Message-ID: <2893a374-a15b-44bd-96b5-8113d0b5dbc6@leemhuis.info>
Date: Tue, 21 Oct 2025 14:37:55 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1761050277;2bafee74;
X-HE-SMSGID: 1vBBch-004f1W-1Q



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CA+G9fYuF44WkxhDj9ZQ1+PwdsU_rHGcYoVqMDr3AL=AvweiCxg@mail.gmail.com/
#regzbot introduced: 3c17001b21b9
#regzbot summary: vfs: LTP syscalls ioctl_pidfd05 fails

#regzbot report:
https://lore.kernel.org/all/03727147-0115-4ce9-b68d-756c6e41db94@onway.ch/
#regzbot introduced: 51a73f1b2e56b0324b4a3bb8cebc4221b5be4c7
#regzbot summary: wifi: ath10k: WLE600 Compex wifi cards (qca988x based)
became unusable

#regzbot report:
https://lore.kernel.org/all/CAHPNGSQpXEopYreir+uDDEbtXTBvBvi8c6fYXJvceqtgTPao3Q@mail.gmail.com/
#regzbot introduced: 18dbcbfabfff
#regzbot summary: perf: hang when using async-profiler
#regzbot fix: perf: Fix system hang caused by cpu-clock
#regzbot monitor:
https://lore.kernel.org/all/20251015051828.12809-1-dapeng1.mi@linux.intel.com/



