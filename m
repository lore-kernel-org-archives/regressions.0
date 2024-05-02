Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DAC1F95A
	for <regressions@lists.linux.dev>; Thu,  2 May 2024 05:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714628297; cv=none; b=e+BOYR8lRp5f3nnsbUxVxv2Eow/Vy2jmMGhhsp5xHNYLoKj+D+7wPRGZFd+rd9Gb6UndRREfwtbbPh7nO/KAKr2X9Tdz9lphhcrAN922lRE3grn2f30V/HdgMvw7Wa4wIPFXiLOPhmBPtBaSQ2s32z9jQqAtZVBtgeTPNPo6Yf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714628297; c=relaxed/simple;
	bh=/88pIUlaNhTJoN66czVzRgp4RQcKjuOBwH6sqTddkoE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=AGNC0uDQeurOOixe6nsvhgrTrx6CsGPqORsxa/+f7pQSPhE/+C605ZRdrbE8xr4Hfu9d6j0JVfqVgp5J56bbwOOdJTme3LyhZP/QJUUMS/T5aYyuNhekX3EIyH4Zioveaz/zN9zOAQMklBZHgPG6Zw6ldSia1JcE8H7wupMpHBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=xTzNV3Zt; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="xTzNV3Zt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Reply-To:Subject:From:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=/88pIUlaNhTJoN66czVzRgp4RQcKjuOBwH6sqTddkoE=; t=1714628295;
	x=1715060295; b=xTzNV3ZthUo/+heRGyH8yR3fgmuwaZ/q8DN3G+n2dI0U0sjBOxwcpbJXujjDu
	Itjzj5i6q62P6jeaQI4i1LmNNHDjdoIL8ptbB6+ZdlIq4W4zESI4UipJfqa2S5ZUVc/3lnmQi7rqD
	TrCy+0ko0PmiHXfwg+qTgpK/wengLu91kjjiLiT9kokQ2fH3RWnhafnQB88IFUBvvpERRoLbvxKIQ
	0w68hCBmg9PqcR44+mqc6BS5aw1PNfvBl85OJ67lft/Y3hj+0aMHdyH77/pp82OxGHjE4kU2GqsFu
	pmYaqyVEX4n0eF01BsoPh65dn/qnS9aXkLFgj7pQ1RIJMvHLhg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s2P8y-0007C7-0V; Thu, 02 May 2024 07:38:08 +0200
Message-ID: <3e4bae9e-877b-4ca2-aecf-d89cb6c20a68@leemhuis.info>
Date: Thu, 2 May 2024 07:38:07 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1714628295;a82a4c5b;
X-HE-SMSGID: 1s2P8y-0007C7-0V



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CA+G9fYu7Ug0K8h9QJT0WbtWh_LL9Juc+VC0WMU_Z_vSSPDNymg@mail.gmail.com/
#regzbot introduced: b58a0bc904ff
#regzbot summary: nouveau: r535.c:1266:3: error: label at end of
compound statement default: with gcc-8
#regzbot duplicate:
https://lore.kernel.org/all/2775775499487396fbad5c2327dcaf7fb88a524d.camel@nvidia.com/

#regzbot report:
https://lore.kernel.org/stable/1e5355c9-7444-031d-59bc-52535f773755@rosalinux.ru/
#regzbot fix: bounds: Use the right number of bits for power-of-two
CONFIG_NR_CPUS

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218665
#regzbot fix: 5097cbcb38e6e0
