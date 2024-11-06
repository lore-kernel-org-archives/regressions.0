Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A252B18FDC2
	for <regressions@lists.linux.dev>; Wed,  6 Nov 2024 06:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730874874; cv=none; b=Vt0zXPIHzaNUmXNe5x4LXWjnrBokAqioXjDz8PwP3d/qH/27D5Owio7AU1ZukiMEdT2wK0gF5JVnO040vwV9c5HQpygDpRp6G7Hw8oWzWoBqf7PNg6mKT2IDQDhSTkIqDUKC1BAtx+SeShW8fN5XARqKcQgy5B13UQQ8WUUqlBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730874874; c=relaxed/simple;
	bh=G+tB5UCF3Gx2GxGMLodwm1XtFZBHm/rEqhw1Bye9TUA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=YrHJUq9RLLg7Lt5ejq5Q94n6ne+0kMpr+cGz1S8OUC4U011Yz14T3V+Eek03/q1DENscAKVwCmg0NMlno8gzUPF+2E78X07ttp74OdxwAOq+aC/aiAuFwdwV9OKkTYBHBlOIsT//pDSDmyhLpd740YX9oKn7Fui08gR5EL3C18I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Ci0DzjB1; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Ci0DzjB1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=G+tB5UCF3Gx2GxGMLodwm1XtFZBHm/rEqhw1Bye9TUA=; t=1730874872;
	x=1731306872; b=Ci0DzjB1OPFiPqSKk0lgSjhQYMdlWWTRuDuq/hSzmtQdBAeSoMkUcteUcIj+q
	4Rq0rbv/wpY+UjfS6yKophqAFjizfS1Lk8bPeMQBe37Y3RiLM1rkQ11c/c8UPcQDejcbm8pp1BbMc
	+3rwmB56d3WsRfnetS+p4Qps1MaNwFVyLoSckpHCnrMPcraEyOB9o1Nxov0AsTyZgr4CUZmPxwcTk
	I6SKvhfHmATUBIVW8wzSE/LGx+jz462WQlGuePwDFTdOZGgpeZV669nzZq0cxtNs1v7sO9Hdh0OST
	BQFb1brSfcilJT6wc3NKlBFMPMQfi/MXSjCOS2dG806nZpzoSw==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t8Zcc-0004jh-La; Wed, 06 Nov 2024 07:34:30 +0100
Message-ID: <326577d0-5aa3-4d95-8415-668fd25acffb@leemhuis.info>
Date: Wed, 6 Nov 2024 07:34:30 +0100
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
Content-Language: en-MW
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1730874872;d2a17295;
X-HE-SMSGID: 1t8Zcc-0004jh-La



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/AS8P194MB204221F4E3BD3979A86D89BA868F2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM/
#regzbot introduced: adbf5a42341f6e

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219458
#regzbot introduced: 333b4fd11e89b2
#regzbot summary: net: bluetooth: connection fails after L2CAP

#regzbot report:
https://lore.kernel.org/all/20241103213731.85803-2-cel@kernel.org/
#regzbot introduced: c689bdd3bffa
#regzbot summary: nfsd: make started on NFSv3 mounts of ext4 exports
#regzbot fix: NFSD: Fix READDIR on NFSv3 mounts of ext4 exports


