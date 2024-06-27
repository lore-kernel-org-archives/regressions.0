Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BEC15EFA4
	for <regressions@lists.linux.dev>; Thu, 27 Jun 2024 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501508; cv=none; b=NNXMiE3LFXhegkXmW3Sdv6mAltLLCrgsbP/cQ5pOlJqaWpiSF+JMxzFXj55keEfgSBDYz4tHJOdDX7M4zVp5Q0stvWmFyZ1MFIEYZDrYv0Dz7E9uFBK3OrlDXXkMXMc1aZ4N9WFUSORgtZecnf7ACGqwpMSnT0MNIW2QIiRM0fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501508; c=relaxed/simple;
	bh=rd9B8xY0B5MwTnZwh8v0cz6l7vCZV1fvQFyayKh+SHg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=UJ9s8QX4EU7fIJmyUouEMbTWjTquuubg42foC+3o1y2PRAiWrJuxW+SVq20zKCV9hBpk2VxC6J/XdEbVOIZ31ktQyYkEv6zAA3CRaYsSkgicFbvkyDlLCRDfbwihs1+6VilC/Q7HZ7koWRWdIYex21wC+HpjWa+hx8SAgFkKyBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=tenjQByl; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="tenjQByl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=rd9B8xY0B5MwTnZwh8v0cz6l7vCZV1fvQFyayKh+SHg=; t=1719501505;
	x=1719933505; b=tenjQByl+vmS/bFpwfUEKJFSFY2wkbMX7agIA4DJazKakt/dqar607oTrY70W
	TRwlvjz64eF135/bRVg3IpRFglqzkX5AR4z9TG2JKe00u3tm2zR/p79aJSopQ2Kjo5hZsfGzfRoEo
	j6Xg/+jktx58h9zCCYGr7IwkflDHqVZilEt82NO8cNAE6RmygqdRwWhkb0I+4Sjyck5umUa2AwHWT
	Y5AEjc5t5BqOYz9fWtpOn+GKUcbLNrVCa0I+CK7ZTxKs2v83aK6sQuIzQa4Qy+Yi4BkiMSGLaPCgn
	K81uyrZHb5RZ+2CX5y1Hh91cTtZFMcuv8nNUbGo9W4vMUW+UcQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sMqt8-00051T-7o; Thu, 27 Jun 2024 17:18:18 +0200
Message-ID: <747fd0e2-acbe-426a-8fbf-0a04217b7469@leemhuis.info>
Date: Thu, 27 Jun 2024 17:18:17 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1719501505;31edb821;
X-HE-SMSGID: 1sMqt8-00051T-7o

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.


#regzbot report:
https://lore.kernel.org/all/210b1da5-6b22-4dd9-a25f-8b24ba4723d4@heusel.eu/
#regzbot introduced: 60e3318e3e900
#regzbot fix: cifs: use origin fullpath for automounts

#regzbot report:
https://lore.kernel.org/all/CABXGCsMmmb36ym8hVNGTiU8yfUS_cGvoUmGCcBrGWq9OxTrs%2BA@mail.gmail.com/
#regzbot introduced: 956a17d9d050761e
#regzbot summary: btrfs: increased execution time of the kswapd0 process
and symptoms as if there is not enough memory
