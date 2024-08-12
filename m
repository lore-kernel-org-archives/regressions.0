Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DD7175D2A
	for <regressions@lists.linux.dev>; Mon, 12 Aug 2024 11:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723461418; cv=none; b=fM/gOeTF7mduns1rXGzHXl+J0pneehWdlWVq593FuQCl+SRM5hlx/KNeClgszBnFqlMQjr8XIsR9VIVOSS6u1SwmtwXYim+4EZ4MBI2PcfIkUQ9MKn/bNh3AtPzUEmKOkIBxMCplzFO2M8gMB96gRCtaO5qOJbqIzHYg4se/lkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723461418; c=relaxed/simple;
	bh=3Q9HpBLZUATK8uhYpQ/jWm7IJfKXpraFjmqLSJJYwuc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=QWdmpAZaT7yu6bEvcSF7E3YNWYoBbJ5QwCn7spLX23zTnViuQDe8rh2eLHTiWJUWfs48ZMTj7S6zCjOik/ZPTD6JJWy0nrIFQ9NUA40DBCQx0/RRfDOzq8NnwfnHNP7FEedfEnITsQjOW/wRX1jnQDaVZqxDvzkijAb1X7eXh9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=jUOLDOoM; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="jUOLDOoM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=3Q9HpBLZUATK8uhYpQ/jWm7IJfKXpraFjmqLSJJYwuc=; t=1723461416;
	x=1723893416; b=jUOLDOoMFnCZCUX3nq9HFpU/PRlEy8+BKtI6wo9JNc93Btfp1V001uyj/FVQl
	4x3FJKCcy7kBC5qysFCXA+z9n6RUFdzZOgXnSkp2Tq6b/E4jJQQCK7e/x3SLQs6PcIq+7EgxFBOSb
	xm8cosLcBqhrYhn7NH4axg+kcNEuIAwIzbpNewPC6scucS9trr/v3MThgY3zgF5duSvjMKIwXPj8R
	LAFngzP38wbU4A77Nyf5O5zJFzLEiM89OwcseJp/6uNfm5TXfBsm8hlLwOenjB4QxL6L09oelsgdV
	b5ZsYu/SkxEcmxx7E8/smlSfJ5BQpUZNMBaNOs6nq41NCiScnw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sdT2k-0003Sw-GM; Mon, 12 Aug 2024 13:16:55 +0200
Message-ID: <21632179-d818-48a4-b576-210784802c51@leemhuis.info>
Date: Mon, 12 Aug 2024 13:16:53 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1723461416;b13550aa;
X-HE-SMSGID: 1sdT2k-0003Sw-GM



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/7hzfplplfs.fsf@baylibre.com/
#regzbot introduced: 68e6939ea9ec
#regzbot summary: serial: 8250_omap: crash during suspend on platforms
that don't use PM domains (like AM335x Beaglebone Black.)

#regzbot report:
https://lore.kernel.org/intel-wired-lan/CAN0jFd1kO0MMtOh8N2Ztxn6f7vvDKp2h507sMryobkBKe=xk=w@mail.gmail.com/
#regzbot introduced: ee14cc9ea19b
#regzbot summary: net: igb: PTP on the 82580 controller broken
#regzbot monitor:
https://lore.kernel.org/all/20240810002302.2054816-1-vinicius.gomes@intel.com/
