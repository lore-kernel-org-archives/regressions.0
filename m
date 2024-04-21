Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BA6B64E
	for <regressions@lists.linux.dev>; Sun, 21 Apr 2024 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713707638; cv=none; b=e7H8PsGK0kOtIODN0JQ5QOnzSPMfuJk4cMolpCJcjmoswCe9TODVDpgJQdbT/EZ5ufE+IrgG6ewe1Gbcz3t0AoLEhXiE1thqhtsrkGu60MULLulrVeiQQZ9awNc2dpDR/De453N6ATb1nUzGBiiiFvLiFItz99v+v8NWAhl1aK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713707638; c=relaxed/simple;
	bh=Fb+BivxlfK2aaj/fqo7wExB3mrmEMwTZgrjUKLgi8h8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=KfEuYPeqyf/Ks85wVRwM6+f8eLwy0xVwcVcHJvtfXbipEVYaNh5QfGMt+Wp6ToZJ5X3vPH88EvEjmr3DRDJMpCM+VbDAGwVmeb52EK7wAYlFyxbozGw2+sDb+IdRhXRtsIaTDo+Cerj91F4AQtTASfYOh265MYE13ivBt6WG/3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=3oVXkQO7; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="3oVXkQO7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Fb+BivxlfK2aaj/fqo7wExB3mrmEMwTZgrjUKLgi8h8=; t=1713707636;
	x=1714139636; b=3oVXkQO79g6JHHTt9thbYkatjr7Rd+J5l1EWT26QLB5ABMgVWlFCc0IDBYDll
	1IU+zG18sCNHB7uzJf5xe8ncb8HY896+QCsuwN12wvsnoKduRMsypYfAYeTwrz51ult5G5l8GV+Oh
	21+ig8+jzu91qczCkwCAUT444Pgg1f9mfmLYmtAY4jwE7zWiQ2pxvbeNsul/o70B/7cf12r+YZGVX
	704Ws2N+spJEPBnhbRfHi/lex9HY1qUe6dzn+GwdEWYJWJ/aucsUSas0q26d3b8vZGYrENruhknq9
	sZ7lTtdeA4q7ZrQMJJ6rBxAoWZ5+qGieLL7bPFjAWiYrV2d6vQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ryXdi-0002Vs-9I; Sun, 21 Apr 2024 15:53:54 +0200
Message-ID: <cd12cf1d-f956-4c66-8622-0009d30210b7@leemhuis.info>
Date: Sun, 21 Apr 2024 15:53:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1713707636;d74ecaea;
X-HE-SMSGID: 1ryXdi-0002Vs-9I



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20240403173059.GJZg2SUwS8MXw7CdwF@fat_crate.local/
#regzbot fix: 6376306adde5b252ee7c73572e35d13fb13f6f18

#regzbot report:
https://lore.kernel.org/v9fs/E7D462A2-EE93-4A57-9F15-8565EE1567F3@linux.dev/
#regzbot resolved: likely fixed by
https://git.kernel.org/torvalds/c/46b28503cd

#regzbot report:
https://lore.kernel.org/v9fs/f6upxoxa6d2c6cbh4ka775msggvuduigiu7xgvfx7qsufg2lo6@2ellaad6b2on/
#regzbot resolved: likely fixed by
https://git.kernel.org/torvalds/c/46b28503cd
