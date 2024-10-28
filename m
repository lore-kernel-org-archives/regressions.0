Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CB01DAC9F
	for <regressions@lists.linux.dev>; Mon, 28 Oct 2024 12:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730117362; cv=none; b=Ka6U3jcRknMPP9q9kvrYIgrVteMm7pUwdpQGrOtH9kV0ZJ1Xd5mQMSsNLFOxU8lI8ySas/I+k7feX32RuOI8bdKH1ZdMntA/CiKCY0B0qHSbfHuErhwY0GMFeRNIwdXjwAYCH5mkXDHNs9Wx69R4bgnBs677wdyyOP/syJZf+ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730117362; c=relaxed/simple;
	bh=FrBuF1J1GzsMWoM33Lhm4KpGE6R8zmMwmDZJPez6VoQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=KUainYKyTNQ7WTyu3hKEnSPR4ZBHWyOla8kfu2l0Kk4HmHf5vmpjjesQLXLd4nZezvSuHp8ySyRAZNvbRF0XXxQ1nbRQJrLRZ6o6Kx8NDMlLT5DknI1rRTjazPlgbOZIIFsPwLzk8kas6SzH7aClHG0gUONrbM+Y1oZyrCq2IgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=CyZJcPN0; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="CyZJcPN0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=FrBuF1J1GzsMWoM33Lhm4KpGE6R8zmMwmDZJPez6VoQ=; t=1730117360;
	x=1730549360; b=CyZJcPN0jiwpzxd8zxeJrBy5gkCuhRrPnDJTJa8cmhapxA1hrM/stzS1EwL6V
	MQomMCbY/8KctPLi3UH/zl7yKxSHTRz1YOnffeazGqkfhAMn5yb2UdS/ettQkN4wjNl8v2Z6PRd5U
	px8dzDzwYbq18/qas/e1QX0QqGtlcQbkVCEXvt49WTy0dEi/jb+ki9rWRplERyOtchcWQ68255Y/7
	R4rDIVXUJecBeJw3FVo3kbyfyVerUCBW9HPDubvKlj6kIuVysC2XdCdVlwo2ogPp6lIEkNjfINuJ9
	EeKQps8hN23DAyXAwhfYIgAuF7t+OQqCiI5XVjIWUjKInUZOXQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t5OYf-000671-8H; Mon, 28 Oct 2024 13:09:17 +0100
Message-ID: <45cabebb-6c39-4f9f-8ef4-8561ebaaf783@leemhuis.info>
Date: Mon, 28 Oct 2024 13:09:16 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1730117360;183ebd4c;
X-HE-SMSGID: 1t5OYf-000671-8H



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/Zx2iQp6csn42PJA7@xavtug/
#regzbot introduced: d469647bafd9
#regzbot summary: Input: disabling and re-enabling magic sysrq fails

#regzbot report:
https://lore.kernel.org/all/CANPzkXkRKf1a6ZvOJU=m3NwW4B0gQnQSRggw=ZnK6kBYmqLtBw@mail.gmail.com/
#regzbot fix: 306ed1728e84

#regzbot report:
https://lore.kernel.org/lkml/20241007132555.GA53279@francesco-nb/
#regzbot resolve: inconclusive: report MIA, but likely fixed

#regzbot report:
https://lore.kernel.org/dri-devel/f163bcec-e5b1-4aef-91dd-431736fd6d11@xenosoft.de/
#regzbot introduced: 90985660ba48
#regzbot fix: 8e82d1199564ea


