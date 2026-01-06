Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAFE1FECCD
	for <regressions@lists.linux.dev>; Tue,  6 Jan 2026 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692016; cv=none; b=r/eUZjCLflktpr7tor3LaMH8FfjguWADMXbdhKb+fb5LCPni9dK2rn1wKZE1L2OJ+qURKjfMTQn1kJcdWdzvum1gc83ceJd2LN9pMzcXD1k6o89QTHFq8sGGboWGYlt9hF4uvrBGl3oHKCV11fsFgBGbS8p/VHpT4SWMxRGVH5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692016; c=relaxed/simple;
	bh=Bcue80DEtx5uSgUd8QvcInbnufbExa6XX50D349RqeA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ABTE5mUaABP0UancZJGR4yXPmrhsnHHC1ADusO5dEb1JByjVZe7lpnvf358kpzNvyWXH8gcE5Ykdv1doQM4sL8KohU8htlvRrBnp+iv3M5qq7q2/7/ldMh5e8oUeoJpjcs2+zt/HgBrnlWYPsgxIq0wqhLzOkgPzUa6+a54A7Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=BC9AODM0; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="BC9AODM0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Bcue80DEtx5uSgUd8QvcInbnufbExa6XX50D349RqeA=; t=1767692014;
	x=1768124014; b=BC9AODM0jEiUfsIe7iYc7He59RDiYpwSLYij1BJ/PUm6G6s81pwhgFnQ64QF9
	f4uQBYLpZ1BA80duBGpuF3jVkRnUHuj9xwgoQft/HAkyh8htW4Hm01VUlTsiusdTrY4EX+KUc03oM
	7N45uqYptU6CJEe4fHV9ikynMeDJhCuWE0vl84tsrGUbqCSZCWjf1o8jN7xtscUTrDSkP1i2VLEK6
	Z8tVuzEDRWh7GypRAw4woh8Nj1s/o9Z8fTlP9N+79BxUSbR5PSpxGfij5hgxF25OqFObIjXqjvIdg
	k9V1V5MssjkMHhInwrbCAQtMyLDzENZ8jVIwEHMiK9oc/mKZ3Q==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vd3RU-004ECj-2T;
	Tue, 06 Jan 2026 10:33:32 +0100
Message-ID: <356a6f4f-c1c9-4631-9e0f-11cf61c82ff2@leemhuis.info>
Date: Tue, 6 Jan 2026 10:33:32 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1767692014;9020a755;
X-HE-SMSGID: 1vd3RU-004ECj-2T

On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr/
#regzbot introduced: 52fbe173baa4df9d14bd733f42ee6b9ceab8299b

#regzbot report: https://lore.kernel.org/all/aU23brU4lZqIkw4Z@altlinux.org/
#regzbot duplicate:
https://lore.kernel.org/all/c5a27a57597c78553bf121d09a1b45ed86dc02a8.camel@decadent.org.uk/

#regzbot report:
https://lore.kernel.org/lkml/CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com/
#regzbot fix: af7809f037e6e5

#regzbot report:
https://lore.kernel.org/linux-riscv/CAJD_bPKbZaEHmKzVcLPGJuR3Y3MO1AJDA0TmLZrLkCJ0PzCM1A@mail.gmail.com/
#regzbot fix: 22cc16c04b7893

#regzbot report:
https://lore.kernel.org/lkml/CABXGCsOcjjD1f5vCxbv-CCCMZPearMnY6GE-WPc_N=_k1TtfXQ@mail.gmail.com/
#regzbot fix: 2e1da460916626fedbbc8518b9c4e1b064f201ed



