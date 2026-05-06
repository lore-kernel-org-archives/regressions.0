Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263433DDDB1;
	Wed,  6 May 2026 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060387; cv=none; b=CkWt9ONK2FegATPBVS4TLi3p3F4iNJpYsWR8t1vEIXafh/zEovn9ElckfSEnB91jTRuaDyzY0qpNOsdxhp+orG6iUIe0wgUOYyt4JQcjMJ1S2BWUv40Sgl0xbrTXrpBmcB/ZJClGCkYFCS1m+4SpOBbw2K7Mo57Lc72Dpu4Ydhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060387; c=relaxed/simple;
	bh=h6m+ghxy1h/+irv9PhRDK5japHTZ6CbKeeqCDu05sk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LII3cUOKvAHw/AbJO1K0sx6vV2S5dVZHkN4plRRuyQNxjw8d60Z3DpwoeTeRvHq4r1UWdjPzIbqfDmztb2B7BP5lm2kT/PhDgEVHguXMQNUl+asPURHifkk0lG66G1J6wt9ZkdEB8bKrVkJoWWJWLDmYrK44mqrRDMb8G2ME2rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=C944XhX5; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="C944XhX5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ilqncLxDv9KwHIALy4qNC3lzSPjPqxEqi2WTd/zHXvM=; b=C944XhX5N46zrMKMCe9vRGJC/y
	OpdvtAVav6O/qyUK7My0USCXKXAgqXD9mynBb7NhldKKHyCe0jJG9rELqCKlrofdMuj19qSyl58qW
	rKnxyK8hmi5aCnn4TLzniSkGylIhMnomXBHPfcBAHPsVOP/215d17gtkYRzUSdrumPF/cgnf7cSbr
	wQ/UU8EIDo6EU4sKx1F7ZVfgSiLPYLHKvGUfIrm6xpyuMrHOQpcin7XeCJxDvzvry/ffunkQANf6A
	lF0XtPLOeoiqZE754D6jHtaxY752S6b6BboOyuFjgUW0GalEzE70knaMMbz66cxJKbgNmzVIkz8JZ
	AHeICD6Q==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <carnil@debian.org>)
	id 1wKYj5-003UrJ-0J;
	Wed, 06 May 2026 09:39:31 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id C1354BE2EE7; Wed, 06 May 2026 11:39:29 +0200 (CEST)
Date: Wed, 6 May 2026 11:39:29 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jiayuan Chen <jiayuan.chen@shopee.com>, 1135514@bugs.debian.org
Cc: Paolo Abeni <pabeni@redhat.com>, Sasha Levin <sashal@kernel.org>,
	regressions@lists.linux.dev, stable@vger.kernel.org,
	podorski <podorski@gmail.com>, Brad Barnett <debian-bugs5@l8r.net>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>
Subject: Re: Bug#1135514: [6.1.y regresssion] 9a95ec9144ee ("xfrm: fix
 ip_rt_bug race in icmp_route_lookup reverse path") causes log spam on ping
 to unreachable host
Message-ID: <afsMUZa99G_gsve1@eldamar.lan>
Mail-Followup-To: Jiayuan Chen <jiayuan.chen@shopee.com>,
	1135514@bugs.debian.org, Paolo Abeni <pabeni@redhat.com>,
	Sasha Levin <sashal@kernel.org>, regressions@lists.linux.dev,
	stable@vger.kernel.org, podorski <podorski@gmail.com>,
	Brad Barnett <debian-bugs5@l8r.net>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>
References: <177771348699.1898023.16904466444228860838@eldamar.lan>
 <177768508393.32886.13183514325428485879.reportbug@pjp3.podorski.net>
 <CAL3Ev5070_=K9F9+03GrE2+4tgr=j_CO19=m4ZPTd17YSwmokQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL3Ev5070_=K9F9+03GrE2+4tgr=j_CO19=m4ZPTd17YSwmokQ@mail.gmail.com>
X-Debian-User: carnil

Hi Jiayuan,

On Wed, May 06, 2026 at 09:04:24AM +0800, Jiayuan Chen wrote:
> I think it because we failed to backport  this patch before:
> https://lore.kernel.org/stable/20250207161555-b1a8749027831a1a@stable.kernel.org/T/#m0c880c1f04f7211aea9b7f6b4de0b64aa1726417

Which won't apply cleanly, I assume this was the reason it got not
backported to 6.1.y. Do you have a backport of that, or should the
original commit introducing the issue be reverted from 6.1.y?

Regards,
Salvtore
