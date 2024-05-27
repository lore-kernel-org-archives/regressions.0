Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBDF56470
	for <regressions@lists.linux.dev>; Mon, 27 May 2024 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799165; cv=none; b=UIQz9z9VbybUOXBL76Asi7eKsGSwli6OZBF+hRkwrqGbtJEtvZy6iYjx9sIZvTTfswd+488APGM2UzcKo19Vz6YK2x6fzsxLcUIbVdoV3M7GLm8XK9o9DEq1QNtGPMJyWMcG6VTjPBAL/Nl3O0bMaJ/f/tLr1fOKn/eZ3O817kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799165; c=relaxed/simple;
	bh=LVUH4QopqGe8uiMjKtRCbq84+KdQ0rE3dTF+2cMTyxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hd6d20LoKWv9WidPOO4LCRi3HOUMrdEqiuHESnTKrVkaA8FI8Po1/eGtxyBMN8ZhZngiiLUGCjz9goUlr7FjriPt+n/Uraz+8gyzuTKcz8NUiO3ZFXQ+fyW9U0sH2vLibslq9XMl2eucY8V4X1JnR7pyMyrZO8ch/bSFJD+E3bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=TVYxY2kU; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="TVYxY2kU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=bE+1vxWD/pbKA18xgnxTKjgxViodLceQHKSxeHZKQ8o=;
	t=1716799163; x=1717231163; b=TVYxY2kULZ0qFXOFr1ecfvfX4SVbBBDPAvQH5riY6RvesC6
	VsqbQoaT/6tdJXSvLzxJ7GAhh89928DynzOFZgjIRkvdBQaTtqAHibLa8X0opZP84hqcCQxuqRpJK
	aOWsCpNAgTG6puZH00DQSCwWHd2ynJ8IRtq8cAVBzMlVVcYREH+uaZ2JpFC7Fam0pLPMLdfZ5XKZn
	O0b6LS/KuQ33Xa9jTRlgibZg/f9M1LEPU4HCvEA/CZcIzURt51cbePN2li61JMu+Q6o3rNmaBqSik
	J/xiujmmnIUQj0TJSkjm/mn4/EDJXtdOrmzW1wLlNgd6Flxe4rtaUTZ+RG272/yQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sBVsx-0002M1-69; Mon, 27 May 2024 10:39:15 +0200
Message-ID: <760b454b-e1ae-4266-95bf-fa51ca901ad4@leemhuis.info>
Date: Mon, 27 May 2024 10:39:14 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FUNCTION_GRAPH_TRACER + UNWINDER_FRAME_POINTER broken on arm
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 kernel@pengutronix.de, Steven Rostedt <rostedt@goodmis.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <alp44tukzo6mvcwl4ke4ehhmojrqnv6xfcdeuliybxfjfvgd3e@gpjvwj33cc76>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <alp44tukzo6mvcwl4ke4ehhmojrqnv6xfcdeuliybxfjfvgd3e@gpjvwj33cc76>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716799163;c8657a58;
X-HE-SMSGID: 1sBVsx-0002M1-69

On 25.05.24 09:59, Uwe Kleine-König wrote:
> 
> With FUNCTION_GRAPH_TRACER=y and CONFIG_UNWINDER_FRAME_POINTER=y I
> experience the following issue:
> 
> 	# echo function_graph > /sys/kernel/tracing/current_tracer
> 	[  303.812295] Kernel panic - not syncing: �e
> 	[  303.816738] ---[ end Kernel panic - not syncing: �e ]---
> 
> This reproduces reliably on v6.9 (on an i.MX25 based machine).
> 
> Bisection points on v5.18-rc1~150^2~7^2~6 ("ARM: ftrace: enable
> HAVE_FUNCTION_GRAPH_FP_TEST"). 
> 
> #regzbot introduced: 953f534a7ed6b725d4f101d2949393acc9262880

Thx for involving regzbot.

> I didn't try to understand the issue yet, but just disabled
> UNWINDER_FRAME_POINTER for now, which makes the problem disappear.
> Disabling CONFIG_DYNAMIC_FTRACE is another option to work around the
> problem.

TWIMC: I had a quick off-list chat with Uwe and pointed him to an
earlier thread about problems caused by that commit that might or might
contain an solution for the problem:
https://lore.kernel.org/all/d870c149-4363-43de-b0ea-7125dec5608e@broadcom.com/

He plans to look into this and report back.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
