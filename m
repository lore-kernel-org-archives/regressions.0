Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E2A14265
	for <regressions@lists.linux.dev>; Sun,  9 Jun 2024 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717949478; cv=none; b=iqHV0UuHzQ6YJBbAGDFkIjuDqSU1C+NOLc2NmMH8ENCRwfT/0ulzCS/yecC/tHDNpqD9Pbieu4cbeRTlVBKbQFiRASw44bpwhiNGLoMQZLMoiaDW5cPxTvCNMBQiwQBAM4PKpyIva9rNK1dhbZ8Mnf21hwd0MIOwPK0mK7inT2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717949478; c=relaxed/simple;
	bh=xZ9Pa7KI3FiAtapuTG4RsiFJ9x9so4CbPkTkGD8BAaY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=mhQ1wzmqNHIgdc9BDLWx3gCgQbr78mlvgF/A4A/CCGvOydRsukIvESb2s9p0VxNfeiPdv2UfA705FNa4Ih3bROpwHfU7PuHYWEm5ogdnqNf2UMN3vC7vxx7vlVLeS1G4yIb96mstVA+rxCkNtiqdbeLy3I5mk6S8OoheNWqeKyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=gnz7FsSf; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="gnz7FsSf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=xZ9Pa7KI3FiAtapuTG4RsiFJ9x9so4CbPkTkGD8BAaY=; t=1717949476;
	x=1718381476; b=gnz7FsSfsC8biwerdhL7Xrto/82ZamN4vw0zaxyUzbqagvR0BPNrb8OuOWxEF
	IoEjJ1o//B7eEU2tCbNdJ12ZLdrY/g98eX61/+NJHewxlwvGpid0SC9vX3M8aNTglfHC9bY7nYxl7
	oI8qwUDkoXUqDplvd6TvNFiYRKbMKzK9dU2VBCfFs96B+fACkhcwTLhKKC/LKrdHsAnXlx2eDaZ2x
	7lf0WxHzbAWh3wqYiMcmoJxVBhH3C9/aeOJQaKKH8vAA4bsIvYF9m6DpoOC7fOgO+h+bV8qX7zB8H
	pxZxT+3oHDaixDPTeIz+hOxEc7aiUDy74YHvtSp1GflSTmkVww==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sGL8U-0003ze-0r; Sun, 09 Jun 2024 18:11:14 +0200
Message-ID: <85344562-e7bb-4ac8-a06f-5225095fe1b7@leemhuis.info>
Date: Sun, 9 Jun 2024 18:11:13 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717949476;753325fe;
X-HE-SMSGID: 1sGL8U-0003ze-0r



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAGew7BttU+g40uRnSCN5XmbXs1KX1ZBbz+xyXC_nw5p4dR2dGA@mail.gmail.com/
#regzbot introduced: 84a4bb6548a293

#regzbot report:
https://lore.kernel.org/all/20240608114529.23060-1-johan%2Blinaro@kernel.org/
#regzbot fix: soc: qcom: pmic_glink: disable UCSI on sc8280xp

#regzbot report:
https://lore.kernel.org/amd-gfx/ebb3b35e631169041e70eb0a7efd6cecef609833.camel@sjtu.edu.cn/
#regzbot dup:
https://lore.kernel.org/amd-gfx/CAMOvFfkQscju1spNKHmEC_Rut+2=qfhKGZSvGhCk_nd5VhuDkg@mail.gmail.com/
