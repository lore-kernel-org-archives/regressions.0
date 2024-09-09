Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A41282E2
	for <regressions@lists.linux.dev>; Mon,  9 Sep 2024 17:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725902278; cv=none; b=WBesGlq7Y95Vs2EsbfEo4kDAWfP7zymgBB0dLGFkWnrmHBUr3l+9QUPPjOmDSQMZS8i0mNSk0llK02z1y5Tj/axG3i4Ft5iD/Tl9Ip8RmuxzSJq3rwF/rIeju3G7X72JVPW3f/BP6BpawWLzZEKd2Tcou/j7rGXWeZKhAUJBKCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725902278; c=relaxed/simple;
	bh=Y17mXArozFY9rWioq4Urlg1G/JSv5MjMDYau0V3jl8A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=BwO2hiri9+YUiDxtBtH8QRmpetH0+e5Gu4qPnhJBLk1IcLOlPiM57baJGPzqCbnbKT4F2ehdjlB0KhQFgHPlcSyYncawYiX7fWK7fO7rClY9nYz3JotZmCtOFQzc9ZBiro3pDo3XFWL1jZ/6IEjs6B5/TAuT0dqyB0IFJXT8PAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=vLa4ObRJ; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="vLa4ObRJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Y17mXArozFY9rWioq4Urlg1G/JSv5MjMDYau0V3jl8A=; t=1725902276;
	x=1726334276; b=vLa4ObRJQiqOBTeSgOmQl8fC5W52VSoavRyKtPlxJmD9pidr8FahyV2wKNQeX
	0CCvy6rnaISuDwUhv2llQU2vmPi9QT0SZC1D33vuvRs9QnMkUJylg0oX9tw50HavsNOfPFSCfrrJo
	8qAIKUqHqd8sWWkL9lJo1cXVa1qCqlMUr/sBYp2aNJCqa6KlNueCEv5njJ1CnoAOjHCCq20keOnpv
	8KRX8b7DUgAPrpjbYgvzd/o6+ftQ+8fEkF3nEWud2h3f+nURRQt2yo3yNBk1mg0JTjbGjkYBOG7Vg
	GRbYCflY6AOdXry7Tp8E6Wc+t0LsjH3JEQZbhmrFlNy4w91tVQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sni1N-0008KQ-5i; Mon, 09 Sep 2024 19:17:49 +0200
Message-ID: <fb38823b-9fe0-4b78-a058-a81d2f5ea1c0@leemhuis.info>
Date: Mon, 9 Sep 2024 19:17:48 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1725902276;a230c30c;
X-HE-SMSGID: 1sni1N-0008KQ-5i



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20240908144414.82887-1-hdegoede@redhat.com/
#regzbot introduced: be6299c6e55e
#regzbot summary: power: supply: sysfs: permissions wrong
#regzbot fix: power: supply: sysfs: Revert use
power_supply_property_is_writeable()

#regzbot report:
https://lore.kernel.org/all/b6c75eee-761d-44c8-8413-2a5b34ee2f98@linux.intel.com/
#regzbot fix: soundwire: stream: Revert "soundwire: stream: fix
programming slave ports for non-continous port maps"
#regzbot monitor:
https://lore.kernel.org/all/20240904145228.289891-1-krzysztof.kozlowski@linaro.org/
