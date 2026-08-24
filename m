Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3881441A547
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581706; cv=none; b=r39ecDh5HcaGqLaHuJkzIuiDIaEXdm5hRvWJUdgK6WEj8HFBkD+Ck+Eh/QHoGrYeqMxPkZpSqdksICNzynWCgbHf5AjsgPpI9dzaRXnNE3y6+kysizPvui8BWkIgOnwL1AkXR2yr3QO7973DrWWcz3kN8GOa6hN55r8iItbPpUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581706; c=relaxed/simple;
	bh=HesIIA5t8gsnUSv4wqfVndklpG//1dx3Rdk/w4jri3c=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=sh+CaW8cfwu+zOUvUMR8iwck6ZYwYjAaNqueorNL6a5rVQWYpCHqP5Wr63/1jHrDGr3uIq8v6Q+sJbhts3432+ghHw4FwxnLjf5sdubs4cWZejlep+QKP76frO9LGC7ub1zIHxwZ4Ok6xTbsTYvSRYRNrIY2itHdXi8jgloXDhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 87E45100D04;
	Mon, 24 Aug 2026 16:28:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id T4tmBHccRicX; Mon, 24 Aug 2026 16:28:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id AEE591A8CE4;
	Mon, 24 Aug 2026 16:28:14 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0JMMrpWcnDJK; Mon, 24 Aug 2026 16:28:14 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 36E2F298569;
	Mon, 24 Aug 2026 16:28:14 +0200 (CEST)
Date: Mon, 24 Aug 2026 16:28:13 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: bp <bp@alien8.de>
Cc: Fabian Franz <fabian@isomorphic-ai.com>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, 
	anton ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	Nikolay Borisov <nik.borisov@suse.com>, 
	"Xin Li (Intel)" <xin@zytor.com>, Ingo Molnar <mingo@kernel.org>, 
	Claude Fable 5 <noreply@anthropic.com>, 
	linux-um <linux-um@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	regressions <regressions@lists.linux.dev>
Message-ID: <2060717447.2694.1787581693960.JavaMail.zimbra@nod.at>
In-Reply-To: <20260824142048.GBaoxTQKUUtmflxuyB@fat_crate.local>
References: <20260823201521.2576344-1-fabian@isomorphic-ai.com> <a02b160a-874f-491c-987b-4d7eb0d35a9f@leemhuis.info> <20260824092300-3e9a9d58-b273-421b-a4bf-5609ccb9ab49@linutronix.de> <CAKbYdNEK0TUy+W5g_yGuP-JCC9CQwmeO0q95rYhcebZYB9vLUw@mail.gmail.com> <20260824142048.GBaoxTQKUUtmflxuyB@fat_crate.local>
Subject: Re: [PATCH REGRESSION] um: Fix cpu_feature_enabled() build breakage
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF153 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fix cpu_feature_enabled() build breakage
Thread-Index: VSL7nbNuM0bzsbTKs+Cto7cnhTuI5A==

----- Urspr=C3=BCngliche Mail -----
> Von: "bp" <bp@alien8.de>
>> However, getting the minimal patch for um in ASAP would also be good,
>> as a broken master is not nice for development.
>=20
> It happens during the merge window.

Agreed. Nobody got hurt. All hamsters still alive.

>=20
> UML folks, you wanna take Thomas' patch or should I route it through tip?

If you don't mind, please carry it through tip.

Thanks,
//richard
