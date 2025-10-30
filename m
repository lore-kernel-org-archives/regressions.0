Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB742BE05B
	for <regressions@lists.linux.dev>; Thu, 30 Oct 2025 15:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761837193; cv=none; b=Z7UCsZRgO38iCmCEUJPPxIkOX8bwMnhInm5Md+zSt8mCkJXJ3A1JWUi5Ecng7esD8U9vw+vdfAB1opbglw0S1tVNXGY5ILBos3rKi/ek2X9oqNqUQfYye5HPql/4Hnhn6R4lmJLmc00/YJ09MVgpnZfDEnOWdl4iXrUtAyhheWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761837193; c=relaxed/simple;
	bh=82jIie6nLSdGOYUxxxlQ4eHV+KfqAhiGHJCJGher8pI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=kRCknoLPejYD2IGKyhbG4V4KFOmb1mZW+6dUW7LW8oMqUkUoOWUPkmnD996s4wnoXrGLP7ubXC4s70L2GpKeEri87s99hJ4YHJghNrudBhT0ZzsrEe0TrwcwEHpS9Dzx9ncKhxF4FwKETftl6TP37FI1z0F/hWXmhaYWGlRY26s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=xBP4//6W; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="xBP4//6W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=82jIie6nLSdGOYUxxxlQ4eHV+KfqAhiGHJCJGher8pI=; t=1761837191;
	x=1762269191; b=xBP4//6WvlSPYKGnhzGJukPdMHI6FjyGzXqt1VfEbYEGdYVJjV1XycQ+XtQ9s
	a07sndoUfz3DJ9lgg1bT26dRkLPgQP/7kauKdicAN2hSAwY1ezozpUzTeJuKc1xOzLFfRo1+DI5A2
	WNTNBTpxQpaPfoqQUgyqLCy7jGh4f/QcgZNHdnNUSEZTHmlToZy6MMXYhwBpBguy3UssYo6fDCgDo
	N61caDNlYEWsaaOx6a3I8PdavdoSCHbjjVljQqyTektka3usjB73k+kUWm6Wn6d9GtIfQp4m33Ss7
	8yDkC7JQK+y3LXZmOCUlPp2o5A4SuoWxpdtNXNjqZuWhZK73AA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vEUKm-001kYf-0i;
	Thu, 30 Oct 2025 16:13:04 +0100
Message-ID: <6bf2a1e7-9f07-4f8d-95c3-ab14a182b8ed@leemhuis.info>
Date: Thu, 30 Oct 2025 16:13:03 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1761837191;d512566b;
X-HE-SMSGID: 1vEUKm-001kYf-0i



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20251013210116.GA864145@bhelgaas/
#rebzbot fix: 469276c06aff

#regzbot report:
https://lore.kernel.org/lkml/20251013212801.GA865570@bhelgaas/
#regzbot fix: a1978b692a39

#regzbot report:
https://lore.kernel.org/lkml/20251025050812.421905-1-safinaskar@gmail.com/
#regzbot fix: 35e4a69b2003
