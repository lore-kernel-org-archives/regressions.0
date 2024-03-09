Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61F14C90
	for <regressions@lists.linux.dev>; Sat,  9 Mar 2024 10:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709979511; cv=none; b=tMeTOrfBJt3YzTsWF94gfOGsd4oEaHJu5Dhav0JBK2SoNfeUGZT+DlZqX+mxoanrQD9ORso2TVbPX2Ts1N3tgF4LzLvIpEEw2SOpzUdN/1iVJnuLZQbftUcjroCFEjpM+wNvGzmZBEPdVPJE7IIyrq2SsNFRZcUN+8AyOVOYvCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709979511; c=relaxed/simple;
	bh=3y377lhh6SXAkJgZ3nS2wCj02tvfmHyR8XqLo0mfGto=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=YNBdeaP5yhqcxUZn/txockC4293z0P7b0AhwclbkzYrSvpsQ/zmcilz8frZrPnrQ4Q/DTq62xPVzBcQfCmHQC3ZB4dX0x3u+7YSKc3kYB/O2cKAzOxReHCZss94nBaGZGB24b7RL+xr7ZNZPqUVHVpI4lWxW2aVE0buEPw4cmVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=VIVIYbWJ; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="VIVIYbWJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:To:
	Subject:From:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=3y377lhh6SXAkJgZ3nS2wCj02tvfmHyR8XqLo0mfGto=; t=1709979508; x=1710411508;
	 b=VIVIYbWJhuhHG8WsfN5pxajB3J4cH6lyPXEgifJo/rgWsxxdTZ5fo6m8N4Ial+7+XnaZm1kkjA
	5NdedBiIZsVEk1gVb7Nxckmqq3u36wqAYICIVL20ykQ5YzE6lrevF/ENlJysEfVXdzbpx82KMV9U/
	ub8DNKCUdr4apcm+aGrG9FUOCyz91Z0eYjkISuI/RSfFmyDiX8Cbf7tH6ktzUbBxht9RspUhkFpWK
	r2iu9hyiSl2EYGLuU+gM/iaDg9ruo/I1Gr0NtruILyj378fnwU2n4hsnxnigqlZgZuRi90tUw/0I3
	myce9qKw3Ad7jFARBLi7RYScFNg+4duy1JSfw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ritmW-0008DB-KL; Sat, 09 Mar 2024 11:18:20 +0100
Message-ID: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Date: Sat, 9 Mar 2024 11:18:18 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Thread for updating minor properties of tracked regressions [consider
 ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1709979508;26678c7c;
X-HE-SMSGID: 1ritmW-0008DB-KL

Hi! This is the start of a thread I'll use for updating minor properties
of regressions tracked by regzbot. Consider telling your mailer to
ignore this thread, the replies are unlikely to be of relevance for you,
but done here to ensure a public paper trail.

Interacting with regzbot from arbitrary places is a recently added
feature of regzbot usable via the new '#regzbot report <url>' command.
The indented use of this feature is for updating minor aspect of
regressions already tracked, e.g. "change the title" or "tell regzbot
about a related discussion". Such things until now had to be done using
regzbot commands in a direct or indirect reply to report -- but there
they would mainly be noise for most others and just add to the huge
amount of mail people already get. It's also takes a more time to send a
lot of individual mails instead of preparing just one.

The new command will be documented on
https://gitlab.com/knurd42/regzbot/ once it got a bit more testing.

Ciao, Thorsten
