Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A09716D4FB
	for <regressions@lists.linux.dev>; Thu, 11 Jul 2024 16:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720717046; cv=none; b=BtavM0sG+/xZjio0XBwu+vMcswJXz4BsHHMvM0XvTgm/sjqkCb3EQKtoBLILNaPqoUxjm0x4VrdKbLElLOEDOSohmMszjf8jvIrVl1qO6oQIpqK1kSE0HpIwxpp02dmcryWKq4lzgIMJ3UK9iEdeYWcqtdMebebjXDrEzCf9Ajg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720717046; c=relaxed/simple;
	bh=9XoM2UoDtCrzKQNIStrTRl5RglmP/JkLg5A+aKQ0os4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=ToTPwK4stEaB2qcX76RR3azLAEVIWHc7rIhmhM23w8XAlIlekmnyVRrAKPtpsVz/hew4TEBvU8UrlXfa3bQQWs2AiPfCv9p0hJZYlZOTCDGHOZMJy6vzkNgFqRN9CzzmReuRJJliPUDwWEFHVNPf+6IauTX/mE9Q0hsbbIcP0DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=uI/5HxWq; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="uI/5HxWq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=9XoM2UoDtCrzKQNIStrTRl5RglmP/JkLg5A+aKQ0os4=; t=1720717044;
	x=1721149044; b=uI/5HxWqKgCfCzpLFeejHByPuVb+yI3+cOMuSY84eWl39ED4miK+v5L7lVUPe
	KrZS+oHxhtRUnsr/LDcWKigFnKG0eklaNBCHxOsO/EfUhkW+9wZMOGs1ojZ9qmrWAK9tFf3GEhXN1
	VHwHDBEJe3vV7HOdkE5kvW2QLvA0CVe2sB6U8IXojGWiK0xcp181iQTQuksf+An3w0DEJaC7p8sSu
	grZlcDMPhQo22JQpNKmEUptICfCJWA7vkzWSKHPclf6f2WRynmxh0ABy7rX3ZTOGra3wqieJjBZKh
	QYi3IPPHXCH/2gGFVix8qwwlK8yg2daU/wJn0QtkCzIhotnrog==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sRx6Z-0000ON-Kc; Thu, 11 Jul 2024 18:57:15 +0200
Message-ID: <8871360a-b4bc-42b3-9a3e-e779e82b41d5@leemhuis.info>
Date: Thu, 11 Jul 2024 18:57:15 +0200
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
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1720717044;530db52d;
X-HE-SMSGID: 1sRx6Z-0000ON-Kc



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/3ab66fab-c3f2-4bed-a04d-a10c57dcdd9b@xenosoft.de/
#regzbot fix: 2cf6b7d15a2864011

#regzbot report:
https://lore.kernel.org/linux-wireless/87tthpwkqf.fsf@gmail.com/
#regzbot relate: https://lore.kernel.org/all/87h6czdexm.fsf@gmail.com/

#regzbot report: https://lore.kernel.org/lkml/ZoM6CUhbWuAFuHjP@krava/
#regzbot introduced: 2c321f3f70bc
#regzbot relate:
https://lore.kernel.org/all/20240612-master-v1-1-a95f24339dab@gmail.com/
