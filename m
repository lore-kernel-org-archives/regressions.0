Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37F22BD12
	for <regressions@lists.linux.dev>; Sat,  9 Mar 2024 10:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709980478; cv=none; b=NuP+TFy+un42E8vqPHEWCWqtZ+GCGNiRpDuyU1JJ+wN0wr3BvUjuysqbG/2xyKcquhcxivRjLyA8+sghibwAxKsFqLPWYV+AOVkRYKZqq0uTf5w90seJdteMc8Wc17AXNiE+3k1wPFsLQ9OhjWKbxweqBpaQLc6oyc4IEANHcSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709980478; c=relaxed/simple;
	bh=UQkwxquGPkZzLAIb6kWooxqYMAO7ZgHRoFtcI8J8/lA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ZZ/xJzeIVlJb6iU9ZeY2mu+rk+dCsdQgs7komUUV0wyRUhyNvuBzt1eWkLbLoYX6nOWfWrs+mF6Z6jvbg1ijHo4rvZWLgeLHx8EQ8dmkC5L4SiA9V4GopQl/3mSQdppr5edZr4GvWD5NWknpFBvplWJwzLoRqus6G3A0MK0fKoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=AfJhlWbG; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="AfJhlWbG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=UQkwxquGPkZzLAIb6kWooxqYMAO7ZgHRoFtcI8J8/lA=; t=1709980476;
	x=1710412476; b=AfJhlWbGFnBL2mP13/5WiCxoAHU24J1BUvMwVRNXvRydDClf8QU/8z1+yruU7
	2reSndB/ffaD6etc2cw+0VGH3VJP29nnxYUm6OJ/jEZLKPXPBu82Sw7lhIbtKM+/zLMRl1TZmrAyE
	YKXuIr8IjgHSFueKSlcWDzO7ERjvPHxb0Mwughi89JJvb+KgPhUSfQvx2gYKZGFJNnBa0xJhW1Pqg
	0o1KDLBy8BqA7ZsDmQ4STc1R7D1+cg0SmIcKzDVhVQLLuJX1lB3rWPjK2Bkl5m86BgaQwaGvomdTM
	oxVNntSMgxIRNlJ7hWAYmTJEQw3L/ns1NUvGIdq/2ajF61lbMQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1riu2E-0002OX-Kq; Sat, 09 Mar 2024 11:34:34 +0100
Message-ID: <7e60e79d-8395-4de2-bc8d-75eda5dd8edc@leemhuis.info>
Date: Sat, 9 Mar 2024 11:34:34 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1709980476;90fa1b22;
X-HE-SMSGID: 1riu2E-0002OX-Kq

#regzbot report
https://lore.kernel.org/stable/3a1b9909-45ac-4f97-ad68-d16ef1ce99db@pavinjoseph.com/
#regzbot relate
https://lore.kernel.org/all/CAJbxNHe3EJ88ABB1aZ8bYZq%3Da36F0TFST1Fqu4fkugvyU_fjhw@mail.gmail.com/

#regzbot report
https://lore.kernel.org/regressions/ZeoAPFIF6NClUl4P@debian.local/
#regzbot unrelate https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/36
#regzbot duplicate
https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/36
#regzbot summary drm/nouveau: divide-by-zero on DisplayPort MST unplug

#regzbot report
https://lore.kernel.org/lkml/ea1567d9-ce66-45e6-8168-ac40a47d1821@roeck-us.net/
#regzbot summary u64_stats and net: inconsistent lock state in stmmac code
