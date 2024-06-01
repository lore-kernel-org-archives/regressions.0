Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8688617BD9
	for <regressions@lists.linux.dev>; Sat,  1 Jun 2024 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717227775; cv=none; b=AxnluBdJjZk7dfjLf8Fczq3lqqcaUqVC0o5sFYY/x9cyhNC/UazVEjJ6ouxSOgea3OXjy32I1ujnalxmQI0Rd9r1mn+mXqxbsagiOpVdYS+UeBt0473tL4vwTZKgqgndvshhWoiqDL1PWis+xbj/zIyoURfD4tbadMByya3tm8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717227775; c=relaxed/simple;
	bh=Vud/X53szsZZkO0rp3QCuMhLKcZp57lz0e57qV5TgI0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=t03wjRbpFmL0TuR10hRflbMbTTfU5eUBWuhIitEKCYWabzr/dgjWa0E31aDj3Ruoufcuc+6a0tq86xhY6XIb+nc1nOIFQz84tcGP4QMYn4oWCiUTt1PXV4cJXYmpjkexyx961B2kmjjluXjsJnAtC2AQvUDzi81FNzK+uipnJWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=M0tiebke; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="M0tiebke"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Vud/X53szsZZkO0rp3QCuMhLKcZp57lz0e57qV5TgI0=; t=1717227773;
	x=1717659773; b=M0tiebkeHwhu9VNr8Km1MVQOClDiFWOV+RHQbzLAU8anTS06aylZKS2VyCIVo
	dV5EDnikCSbFgyZlOePqHTzG3Of7/r1gR1v312P0pnFs33yGQrYXjKnSCMlxL4mXJvjJjuV9ptB40
	tsW2aqpZWVO186pBoGBXWIIu/jR/eI9mDq5+vhRyi43H7id3dZIsCJ376J6p7n8aLV3O0keDnBt7q
	T/pBf5HddSnsN1XwCMns7SWTC8BtdasIiA1uDj+F7utolxX23a6hGbIIHkN01gU7/HSWF4Ymx5l7V
	wJI8Rsxmi7beCTeiJSPaXrQyqDhEts0nBjDoAmP7DoJOosEWtQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sDJO7-0007pH-K2; Sat, 01 Jun 2024 09:42:51 +0200
Message-ID: <9631daef-8cb9-4632-ba8d-3ff9a6669e2b@leemhuis.info>
Date: Sat, 1 Jun 2024 09:42:51 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717227773;f67746f6;
X-HE-SMSGID: 1sDJO7-0007pH-K2



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20240530074416.13697-1-johan%2Blinaro@kernel.org/
#regzbot introduced: 3092bde731ca
#regzbot summary: iio: IIO channel read outs and thereby thermal
mitigation on the Lenovo ThinkPad X13s broken
#regzbot fix: iio: inkern: fix channel read regression

#regzbot report:
https://lore.kernel.org/linux-block/CAHj4cs9KZJc6Wsp9t0fDc4fDBJB1TmwGT7-8peCGLiqW3J_Fqw@mail.gmail.com/
#regzbot dup:
https://lore.kernel.org/all/20240530120110.22141-1-00107082@163.com/
#regzbot fix: iommu/amd: Fix panic accessing amd_iommu_enable_faulting
#regzbot relate: https://lore.kernel.org/all/ZljHE%2FR4KLzGU6vx@hpe.com/

#regzbot report:
https://lore.kernel.org/all/3f71747b-f852-4ee0-b384-cf46b2aefa3f@gmx.com/
#regzbot introduced: 950210887670cbb7d2eb9af6fb743b70f1a1eb
#regzbot summary: thermal: core: maximum frequency lower after sleep
