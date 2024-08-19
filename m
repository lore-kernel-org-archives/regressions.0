Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD0F171AA
	for <regressions@lists.linux.dev>; Mon, 19 Aug 2024 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724071555; cv=none; b=GD0iVg1KasOErIFzj0b+oet/kF+sk/woRvv/gBIFPyEeblQVgSMErAmGFtiIG2hRj6nhMw7SuITsLTbJwMpuZ+tq86Rwtoj5hEIKqT/1mtY7iBlj4iwcCZBu+Ti7xY2RCcEjnZ9K5IO3MpxaVIa+git5Oh7GOFY5loJe6x8dhVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724071555; c=relaxed/simple;
	bh=OuZtygisgVyBmiYGOoz+MnKaOhSuOl6dhFJPJqhcwPM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=EKhW3FGtndO/qABkWhLYCX2q9JAnaxcsRGv6pki3cEQ3YXr6RoLlc4NFCe40NMhiAGlbVc1A+SlmDrZgAWvo8cfu8E3ceanebvj20XhqR5uo/0uunow5vAvQfVappfLtoXEW7KhRq5xjTAz3P2p27O3hPLmbKMyIbaGEOOBKOR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YRB9z9AQ; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YRB9z9AQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=OuZtygisgVyBmiYGOoz+MnKaOhSuOl6dhFJPJqhcwPM=; t=1724071553;
	x=1724503553; b=YRB9z9AQfSaaXve+Bm8Ujy1FOreSlrBVauw13KyC9dJeegI/xw4/pxRkihm0I
	GyrEf/bNmI5vbUyQusA5rLJAOFxFmo8WAWH9ovT3kxoLcJy/19XR7YKxslZCPgqQhi/fiMJBuFhmo
	bSg1FE44KHof/e8XNcgdK9rlU6t0aKucCjPdCIOL2tcztes8qFW1ajhgu7Bq9Xo44MgPnP2v2xa7r
	U4TL5ImAg6xyC1OrlIfAvrV0f78socAyoLe1FQX6grpYcIxS5s2u7UyGeX1CJMPxGZJKQvySmCPqo
	20sCEHRzKpOsrbzrmXbO+8o8ZrESwavKU/+6AF2oinxbXA3KmA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sg1lf-0007LB-CW; Mon, 19 Aug 2024 14:45:51 +0200
Message-ID: <69ecd86f-214f-4a28-bc8c-df69c26eb2ab@leemhuis.info>
Date: Mon, 19 Aug 2024 14:45:48 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1724071553;8c3b1d73;
X-HE-SMSGID: 1sg1lf-0007LB-CW



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/cca852e55291d5bb86ea646589b197d5@matoro.tk/
#regzbot introduced: v6.9..v6.10
#regzbot summary: cifs: lockups

#regzbot report: https://lore.kernel.org/all/77KAHS.13UUH2XVHQQF1@gmail.com/
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/issues/3474
