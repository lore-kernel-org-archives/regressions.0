Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A432114B953
	for <regressions@lists.linux.dev>; Wed, 23 Oct 2024 08:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729671425; cv=none; b=kYE9ULVuuHzsThrcjMQtvKGBJuDaqF/jT7afOJglSYmUEI6AQYLG98ISSClToV6+x4m4rd1LthU1eYF8K8QAH6WzL5tJlx32QB9IDGNMQBaotqTM+EOyHgMNFB2HuAMc0z/Jhxi2z0ynGEboD5Bg6EJZF31tU6R6iwykrypIbCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729671425; c=relaxed/simple;
	bh=h6YZYpVvyf+YP9wIq2hXemR3jo9/l8RuA2fcwKrQNzg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=brjrq75JlSYAR/w+3MXONKWPzcQPoSlsksBd1d6lT2gdGuWcuoPj6IBJhLdLB5XyoDZ872DEnM5VvOm2KeFLdHJx5Y3Vzf9tnhu7r4za87edyDl7G3hYFBL8Frp1ApgBw25YcG73kT0wTlFw8PNNDBvDioFRbo2+AtN6t2+LJKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=aEs/DifG; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="aEs/DifG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=h6YZYpVvyf+YP9wIq2hXemR3jo9/l8RuA2fcwKrQNzg=; t=1729671423;
	x=1730103423; b=aEs/DifGDR4scGPSf0xqJsxOg6vnDfVEcR3qhxhmRegb2CdQFca9ljcM9v91Z
	h4XPE93tYOAmp3Hu4WEJ8/AsSs5LTHI1+aADOv4MHmtcU08kHisOJNjckaOg0x0I3i45Yh3PTstue
	p1t4xF8r1iWb9Ek/AbztYLdsk6BqjIIZFewSzeddzfZmxXZhAiX/ftQpFqJTqnC/b76edD1eXfJzJ
	l5VRdUomZu2mgO5s41KORDQiHtgBVvhvsExLyzEFtuuArHSvK/CdQtFyxgTDZTx3uItD2wTEUGueW
	7HssQdh6hiGe3h2QMNq3rCeA9XvaZeBiHStUrpO2I/a4RF6qqQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t3WY9-0007Cp-Sa; Wed, 23 Oct 2024 10:17:01 +0200
Message-ID: <45f6f873-3e8e-45a0-ae28-f68530dd1e15@leemhuis.info>
Date: Wed, 23 Oct 2024 10:17:00 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1729671423;8d6f8861;
X-HE-SMSGID: 1t3WY9-0007Cp-Sa



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAEXMXLR55DziAMbv_%2B2hmLeH-jP96pmit6nhs6siB22cpQFr9w@mail.gmail.com/
#regzbot introduced: 5ab91447aa13b8b98bc11f5326f33500b0ee2c48
#regzbot summary: drm/tiny/ili9225: NULL pointer dereference and paging
request problems

#regzbot report:
https://lore.kernel.org/all/000f01db247b%24d10e1520%24732a3f60%24@581238.xyz/
#regzbot introduced: v6.6.28..v6.6.29
#regzbot summary: thunderbolt: USB ports on Dock broken

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219370
#regzbot fix: 009b15b57485


