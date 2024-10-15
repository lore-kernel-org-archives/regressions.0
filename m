Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317A91FC7D7
	for <regressions@lists.linux.dev>; Tue, 15 Oct 2024 18:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729016497; cv=none; b=eUjIp9IiApD9oTNjBK79tnIf5KBqYc6Crz25dPDdLv/WFPwDNmLeVCrtPNagS+aqNLpMFvYr7Hwc4Q+Jyzr6QG+LM/zbwyK8QAVcg3oXy5cUR4tghBHxq19z5LVswe0ieRNg9xiZUa4wVkie2u/1/lvHeXCCDcCF/OsDwZLY9Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729016497; c=relaxed/simple;
	bh=jlQbG9c6lVctQ3Wt+eMNOh3qwQnwKxnXI8rqG9YGmgI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=SXztRbVlD1abiI2DWQoB53jCmxNqByFZJfVeGC1wmtJ+fdeC3vNVy9DgfDFtIMfyceonBr9AQX5Lbw1EQsCs58rov3SZDAoHpUKucKiIHDvChXpPoFAXM80+Ei6X2IR0cTu0XD7i788rDl6WfLxlEZJQ1/79XJx42bQ7s+/Xy9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=nsj9D52u; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="nsj9D52u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=jlQbG9c6lVctQ3Wt+eMNOh3qwQnwKxnXI8rqG9YGmgI=; t=1729016496;
	x=1729448496; b=nsj9D52uWyHBqOk7Tp6awZLImm2xrEdgrgybFiO+nIrjUiOJAzLLJVKoXVFSo
	izS0d6RFL73EtzOjKFyAafJvAZu3AdPQHZUar172Zo05j55mYvw9qYX2mj3JwBmIMYBAPyJGilU+y
	V0Rs0r49lMsyD06/iZwOVHeF40HC9IoT9ow2wyxBZlSN1NGf+2DWpLiBe3+f8Y7r1otFgaLr0f8ro
	cGSMHNwp+DVDgrh5ZbdyCiM5WUTShONB3if6WnUzkx3Plvn/QIdTA71UjAPrtDseMAAWDXCHx0aia
	4vkAhlQ5pd6G8UimG7TmddX05d+u6veniJnzvREDhbHFixaPLA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t0mAo-0006Lu-Dk; Tue, 15 Oct 2024 20:21:34 +0200
Message-ID: <57a8a156-3ec9-4388-9c58-719302c350a6@leemhuis.info>
Date: Tue, 15 Oct 2024 20:21:21 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1729016496;53682705;
X-HE-SMSGID: 1t0mAo-0006Lu-Dk



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-bluetooth/595efd8b-e0fe-4a87-90b1-4b579f3cc876@gmail.com/
#regzbot dup:
https://lore.kernel.org/all/CAMb39_%3DebMmeCuZQAQS--CnM4PDaBEfJ4pbiG9gtJZkmikohWQ@mail.gmail.com/
#regzbot dup:
https://lore.kernel.org/all/CAJZ5v0iUaszpE%3DJ3_wLhdmBrrDdTSL1Rs-mgjL8koC1kk4apOA@mail.gmail.com/
#regzbot fix: Bluetooth: btusb: Fix not being able to reconnect after
suspend
#regbzot monitor:
https://lore.kernel.org/all/20241014202326.381559-1-luiz.dentz@gmail.com/
