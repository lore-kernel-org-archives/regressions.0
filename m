Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E07C16CD17
	for <regressions@lists.linux.dev>; Wed, 31 Jul 2024 06:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722408878; cv=none; b=tJhX10YgLdq3adjtSrJ1frX2AO+vBVd8yAHE41E7rat8VLdOwlRUmGh+6cwYLHJr5SsS8+AsEJP8uKmShv2WWVNEyAsZCXoS7Pi6ywhvOzHn9o8shxHmLbPi18goTCEo1mX55jTryWuvRXYHm9glFtfYElVbA2oPlTv6RrEsTno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722408878; c=relaxed/simple;
	bh=VypCIcDovFGiUeQVXENRMsDfdQdavSrLoY51DRMMJB8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=SxaKcHSOISOw2VSSE6akeqpHSH2vLVG9QBoq3O4fs32VmNBaQFJxO1X7tFDURQ0LAJAtZre2s90ZjN99fQ2FfI139UxFeUsLW0MQn7ifXKV0PlaC+lL1QcOt+awkTnIe5Kbonw/XU2HhChnB+wqtgCBVsyGaBmRhC9+32P+XFgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=d+FmEYnD; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="d+FmEYnD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=VypCIcDovFGiUeQVXENRMsDfdQdavSrLoY51DRMMJB8=; t=1722408876;
	x=1722840876; b=d+FmEYnD6UiKIYjIp82E+v8gqRbeHFHsICSeDL29d5ng7E3ubzMkNFSC4TSaG
	tkXAdOodiXkuGz96T0+z2Qx1tu4E9qoqQu+Yp0tVdeDoy1FN0K3YwOaoa89nddkEcU5T/iXZIlxMp
	UWNZGzs+wjGVLnKpD2eERrrXm4mKHcCWs51LfnWANy0aTZSq3Ps4yCgEppscycyZLeNoti5wugQA+
	Dm/cF4ZA/0ZoJYeidzjtKzPZ2b/M8bU0G+Sy0bDXhEbDAilEOclNmJnfL4kD0H62Swb9jWMA7uNL7
	vKRaZTBE/nI/1j5bRsmo8WS97I6/d3jTlzNyukCjEpFQ3bVzng==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sZ3EI-0001aH-4f; Wed, 31 Jul 2024 08:54:34 +0200
Message-ID: <be72c615-155a-4cf2-aff4-5a0d54b1c4e8@leemhuis.info>
Date: Wed, 31 Jul 2024 08:54:33 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1722408876;15ea40e7;
X-HE-SMSGID: 1sZ3EI-0001aH-4f



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/b53e17ec-fec4-4cf6-9c61-41552188c670@roeck-us.net/
#regzbot introduced: 04f08ef291d4b8d76f8d
#regzbot summary: arm: dts: arm: versatile-ab: Fix duplicate clock node
name versatileab/pb qemu emulations fail silently
#regzbot fix: arm: dts: arm: versatile-ab: Fix duplicate clock node name

#regzbot report:
https://lore.kernel.org/all/2c7adbc9-609d-41a9-8a3b-a63d59e21a1f@roeck-us.net/
#regzbot introduced: 6b0e82791bd03b
#regzbot summary: powerpc/e500: boot tests based on the mpc8544ds qemu
emulation crash

#regzbot report:
https://lore.kernel.org/all/CAF8kJuNP5iTj2p07QgHSGOJsiUfYpJ2f4R1Q5-3BN9JiD9W_KA@mail.gmail.com/
#regzbot introduced: 33dfe9204f29b4
#regzbot summary: mm: swap stress test now runs into OOM

#regzbot report:
https://lore.kernel.org/all/b7ecddb7-4486-4b2d-9179-82250cf830e7@roeck-us.net/
#regzbot introduced: v6.10..v6.11-rc1
#regzbot summary: x86-32: doublefault related to gcc-11 and kfence

#regzbot report:
https://lore.kernel.org/all/27e6a6c5-fb63-4219-be0b-eefa2c116e06@penguintechs.org/
#regzbot introduced: 9a15ce685706e73154

#regzbot report:
https://lore.kernel.org/all/096cad5aada514255cd7b0b9dbafc768@matoro.tk/
#regzbot introduced: 91a1d97ef482
#regzbot summary: jump_label,module: crash on boot

#regzbot report:
https://lore.kernel.org/all/20240730033849.GH6352@frogsfrogsfrogs/
#regzbot introduced: 83ab38ef0a0b2407d43af9575bb32333fdd74f
#regzbot summary: jump_label: splat while running fstests

