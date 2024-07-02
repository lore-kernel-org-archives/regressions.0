Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED8815D5B3
	for <regressions@lists.linux.dev>; Tue,  2 Jul 2024 16:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719937303; cv=none; b=LHCoSl2v4xP3qEWRXPGjyTsqV4AOtx58eCJrxC7j8WbjRDGMb2EZ9EnDJlqyn2o485mrFELZq8IkIyx8y7E11WhGqLxGmu8UFEKSO+ZD7UVqwNrFYfPlskHSPig+Yd5T8AvJQlvL54m4DXVhDY74pRK/MsGkXKsugBM29cu2sgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719937303; c=relaxed/simple;
	bh=U9ZRylNVeH6cmeOZ1rssp60oIg2ThSiHdYibeAbWCHY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=dWQ1erpNpbwDCsNdSw2BaKV3MxUOhwrFEql3NDzEJkQAUb87Dwx0Zfr6tNYjwM0V2sd0dpJ5GYpPGxuTWGKTjTKWapqvC1s+mDBEYAtT85Dqi7AfF+bPHpBNCll4afiuiapYZHqexw2huaf4Q4XQVLP5j/pA20OADz2AVgTg4So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Op7kffwd; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Op7kffwd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=U9ZRylNVeH6cmeOZ1rssp60oIg2ThSiHdYibeAbWCHY=; t=1719937301;
	x=1720369301; b=Op7kffwdOgF3G8JBqUV5kE0q+ESSQTT52yMTIl+jqe4UQh8aSjnXttJ7k3hT8
	LaX0L2UPKeCbTvSh4rrPPzc76UsP7Vegtm51b7wB3aepsvFUUnZVtx0kxEUsNCgGVLRWjNRlC7a1G
	UXkVtqCcItoQv/qRLjIcYm8hONauoH0RF3SIOlWSomNn7jbO/Fcbs3aKamo2c1dhBarjX0PKM1bKL
	6/OlHAAWwdNGHVWuNCkIEh8pWIBHnUbcVNyFXdJQ3XDplxE+BdA10vMzR31qESAUuP3zrMG7ykRBg
	aYgewJFB8q5fXG4vCZ+s+f8FTfno56bEhZ+1rJyFJwSWg0cLZw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sOgG9-0007Mx-9p; Tue, 02 Jul 2024 18:21:37 +0200
Message-ID: <b2973590-2169-4acc-a133-5ca58c8de797@leemhuis.info>
Date: Tue, 2 Jul 2024 18:21:36 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1719937301;6bec1a16;
X-HE-SMSGID: 1sOgG9-0007Mx-9p

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.


#regzbot report:
https://lore.kernel.org/all/20240531194414.1849270-1-l.stach@pengutronix.de/
#regzbot introduced: f20c15d13f01
#regzbot summary: perf jevents: DDR controller metrics are completely
unavailable
#regzbot fix: perf jevents: return potentially empty metrics table

#regzbot report:
https://lore.kernel.org/all/29c83d1a-11ca-b6c9-f92e-6ccb322af510@google.com/
#regzbot introduced: 9bcef5973e31
#regzbot summary: mm: BUGs and WARNs due to deferred split racing folio
migration

#regzbot report:
https://lore.kernel.org/platform-driver-x86/R4CYFS.TWB8QUU2SHWI1@cock.li/
#regzbot introduced: 23f1d8b47d12
#regzbot summary: platform/x86: toshiba_acpi: fn key started working the
inverse of how it should
#regzbot monitor:
https://lore.kernel.org/all/20240701194539.348937-1-W_Armin@gmx.de/
#regzbot fix: platform/x86: toshiba_acpi: Fix quickstart quirk handling
