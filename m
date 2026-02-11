Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA35734F46F
	for <regressions@lists.linux.dev>; Wed, 11 Feb 2026 08:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800167; cv=none; b=naqASRlUNu3jnSqUYWl0xxmnw54EAobwaDeoTVSltvBgcQ59QzLndhWy2ju11JqV+m6gWsSoDi8k7jtBGov+mzAs7UaXvinYf8D8BtX9Isq3xJDwjlfBOL64jo8Oe+khO/amIrEXDHSOxmYw9BQq7G9xVmbrThZaxT6MbNyuU7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800167; c=relaxed/simple;
	bh=mhZoGBuJJUBspqYbVe/hCOZuhStX1RXzH+bBNOK3NpU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=BGAgW7iwd2a6khy9BJzXDtO/EoxtVNxT4LvBGr95PYLCyhI+bQe32CF30diJHfzmJo3OicWQ5+JilUsW5r8z6IBqO2jzDuJeHgwQpZpxezTQlmq82IdG/02N98TpqqKzJomlQx91OAatWqz0h9D3C5+6l/7LTPZsGN7nGz/67Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Vyl0/Leb; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Vyl0/Leb"
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4f9sZV1Vtsz8hHQ
	for <regressions@lists.linux.dev>; Wed, 11 Feb 2026 08:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1770799810;
	bh=mhZoGBuJJUBspqYbVe/hCOZuhStX1RXzH+bBNOK3NpU=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=Vyl0/LebxoQ0Z+fGdGeIHpAACDQdvkrX/BnkD9hwyhLNhJFrLbqYAAqaSWo4pwmA2
	 /J1zSZz2y6T54SVJ/FaNWG5zgIokW5tMzKlLkSXtipHVgYgnoozxqirvO2rhG6pNim
	 p/UdyvRL1Tp5s2Eqoe5bOarI+b2D8oNFrNO32871Ml3BmcpSJikUDBonVJ/I1MN++a
	 bPHP8IpkuvW0BjoVQUhrvzVyUNnU22XMwps70/XmNnQPj6LWGvBFSQ2Iq53uHgaLqk
	 MmQlYoQVA7gARe1JgginKkZWhjQtJfXT3yUE8ZUjQPQA5Mt6t/J1/Q9kt1mYhHGrdD
	 9V3SSqHitfk7A==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4f9sZV0nsGz8hHK
	for <regressions@lists.linux.dev>; Wed, 11 Feb 2026 08:50:10 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4f9sZT62Nwz8svF
	for <regressions@lists.linux.dev>; Wed, 11 Feb 2026 09:50:09 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2FFB2675C4
	for <regressions@lists.linux.dev>; Wed, 11 Feb 2026 09:50:09 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <155da16b-afff-480d-b37a-38550666c26d@leemhuis.info>
Date: Wed, 11 Feb 2026 09:50:07 +0100
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
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <177079980935.2592768.12145239980468156801@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 2FFB2675C4
X-NC-CID: /n9BNARxNdMl2XrIhHBldEWfrOT6qXVwvflOcOIYaXpCP6YYmJo=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-sound/5056506.GXAFRqVoOG@steina-w/
#regzbot introduced: f514248727606b9
#regzbot title: ASoC: fsl_xcvr: blocked task on TQMa8MPxL based board
#regzbot fix: ASoC: fsl_xcvr: Revert fix missing lock in fsl_xcvr_mode_put()
#regzbot monitor:
https://lore.kernel.org/all/20260210185714.556385-1-n7l8m4@u.northwestern.edu/

#regzbot report:
https://lore.kernel.org/all/20250117163102.65807-1-detlev.casanova@collabora.com/
#regzbot introduced: 5323186e2e8d33
#regzbot title: ASoC: rockchip: i2s_tdm: audio capture broken on RK3308

#regzbot report:
https://lore.kernel.org/all/CAOoqPcSqOZWN7LKmZQzPhu8MWxNsxYoDs2woHotE_te__+MF=w@mail.gmail.com/
#regzbot introduced: 1ef15fbe6771
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=216878
#regzbot title: smb: client: invalid mount options suddently ignored
#regzbot fix: smb: client: fix regression with mount options parsing
#regzbot monitor:
https://lore.kernel.org/all/20260211041007.324919-1-pc@manguebit.org/
