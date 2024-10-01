Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443002B9B0
	for <regressions@lists.linux.dev>; Tue,  1 Oct 2024 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727775623; cv=none; b=n786MONEaczRqk4W6pK+Wag1mWu7bcDqp9ZMg++e5p4sss/rSWdpfdXJK32H5kADnv/GZcOIJu2FqyUWMLaeFZgZuzr1YWHw4RjDMqh19PbyifCwKvExsL4Yqd4fsWOmw7Fo19c58QENqaz5MijD/xRyZZC6eSy96Sf6BLVNxdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727775623; c=relaxed/simple;
	bh=BeesCYn27wgVR0Gl1qZH9lZglyGCtMiHFOuRKT9ExZA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=ps8y85Mya/jEzKRbBOMfp03jHfsEouTGFZVbCYYuK3wFnOmHnPNdAyN29oGu0R0mRVk9d9dUTv5QDocYsXZTSzUBlflB4lnJQwNj7Shuh2wiknwYtA5CHJChXPIvzzCzlLCmY3PoHgXVwzOcJbyBnsEIHaR0Gbz+x67N5xo08B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=C291uUnU; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="C291uUnU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=BeesCYn27wgVR0Gl1qZH9lZglyGCtMiHFOuRKT9ExZA=; t=1727775621;
	x=1728207621; b=C291uUnUoGSGChbLQuj4FiuRZIYCc0mz/DZcN5qyS/unOkOZZeMvNn11bO8aA
	zrfLhOX2K/5kEKtvFzh91t4xuFh2f/9Pva6N28Wl7+AU1XtJEaX/FKwXQ/wTrEaDsX4wMBH2ARTLv
	c+GSV1qzEHuG6WaVOorEPANdevEI01lheR2Y9hUXnOzhh9ufNeG+SlkiSDfGGkf4wIPTZz03FkWYD
	OWYrzwyTrTwBZuEDx8wgoo7vnqo2IaOwDC9ZgqAqrSnYUOU9j42O37xOsqSJGaLU3JC0K5bZBr9wt
	XuKVs/c3xPcUDVxWNInl58kePFFFcN0kcRZ/aQNuqD5qlMzsug==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1svZMh-0001vL-AE; Tue, 01 Oct 2024 11:40:19 +0200
Message-ID: <3c23355c-9c87-400b-8988-a3c8bc72a607@leemhuis.info>
Date: Tue, 1 Oct 2024 11:40:19 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1727775621;952456a1;
X-HE-SMSGID: 1svZMh-0001vL-AE



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.


#regzbot report: https://lore.kernel.org/all/202409281331.1F04259@keescook/
#regzbot introduced: 86e92eeeb23741
#regzbot summary: bcachefs: mounting rootfs broke

#regzbot report: https://lore.kernel.org/all/87le1sjd2e.fsf@linux.ibm.com/
#regzbot introduced:
#regzbot summary: workqueue: warning due to missing lock
#rebzbot fix: workqueue: Remove incorrect
"WARN_ON_ONCE(!list_empty(&worker->entry));" from dying worker
#regzbot monitor:
https://lore.kernel.org/lkml/20240725010437.694727-1-jiangshanlai@gmail.com/

#regzbot report:
https://lore.kernel.org/linux-pm/20240908144414.82887-1-hdegoede@redhat.com/
#regzbot fix: power: supply: Drop use_cnt check from
power_supply_property_is_writeable()
