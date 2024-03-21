Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB6614284
	for <regressions@lists.linux.dev>; Thu, 21 Mar 2024 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711017620; cv=none; b=beHaUY5B/w+xAL4ZHYL9jTZbb1VrtowUqCIVSkhEDcx6tAfES97PHhBkMK5t+LdgxGaCby0ZX9fk0Uhb/xDULVscGc0TwUQHwx1O9s3eOBheShfe1qxbIHdb4/RMqhuWwmQhLNmehjhUlR/SSkEGN8qZv2n35GWWC5DPbcuUthc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711017620; c=relaxed/simple;
	bh=Le2GzXHg2J5YTxmz9Z/+T9Z0ynBK9PJNSG22SHc15Cc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=GH3tK6zV+VLQq9snN4xxdVuYW/P8PfZGk2QmlemYE+B/MwZ4UaztV1kL1L7kW9HyuQPbcm5bh3oyzEtx4CP5xtMIlQSff/uBUpXG5q+YkWaZjVDfVtUHR6OlMrZDPymclUXpdAGHqrZ6v4iIUB//lhJbR6C63KjMgtL6bN794rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=pm+Qzu6i; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="pm+Qzu6i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:To:
	Reply-To:Subject:From:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
	Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Le2GzXHg2J5YTxmz9Z/+T9Z0ynBK9PJNSG22SHc15Cc=; t=1711017618;
	x=1711449618; b=pm+Qzu6iS7DWK8bpyEr318XK1BvOICi3GQpKLVEjR74lbw97WRgn8NngIaq8+
	F12jwFfs0td7bPsTpnecFISvUNK4uMpJQNjkpWYi7EA/N5aDRvMW9cW2ieKAzgAe25faZQH4RMjPN
	8wftA+DSYok09iHhBl1pRJmaiiIACvSRn/msP6/pYrstF5RbXTfAQJF8qNtQ2pTO/c9ziGyZ1B/3c
	w108h2zYcLX21Wol6MLRFCaPf1YGVB36OGkEFrYgrLSvmy4ABkM7mNOvpsg9eoCL4TJ58A3XtQdmH
	eG6pEg9KyPqjXkxyq0Xe+5DIejbbIQhtJC/rGyXehcVxV0/Y0w==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rnFqG-0003jL-Th; Thu, 21 Mar 2024 11:40:12 +0100
Message-ID: <a5f7fb79-ff74-4364-995f-a3e064c80ce3@leemhuis.info>
Date: Thu, 21 Mar 2024 11:40:12 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Content-Language: en-US, de-DE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1711017618;2a106764;
X-HE-SMSGID: 1rnFqG-0003jL-Th

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/regressions/ZeoAPFIF6NClUl4P@debian.local/
#regzbot duplicate
https://lore.kernel.org/dri-devel/ZcfpqwnkSoiJxeT9@debian.local/

#regzbot report:
https://lore.kernel.org/all/20240317214123.34482-1-hdegoede@redhat.com/
#regzbot introduced: e5d6bd25f93d
#regzbot title: serial: 8250_dw: dw UARTs on Intel Bay Trail (BYT) and
Cherry Trail (CHT) SoCs broken
#regzbot fix: serial: 8250_dw: Revert: Do not reclock if already at
correct rate
