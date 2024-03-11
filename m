Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A0838394
	for <regressions@lists.linux.dev>; Mon, 11 Mar 2024 13:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710162746; cv=none; b=tS11daUkHNqoB2RYM1nTlXXDggO9bU+Fyy3qrKeN9jR9pLln5sYCAm7YsCfMw1OTVURSWiv9NFQoQrHUpvnf+wnCfcumFpCg0hXyt5jZ1fa3fvtNNTwX9OsUls9V1JDuiq5qMDm+XSG0Mgw6hCXT27HEkGUAhaoL6UWlegwTbYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710162746; c=relaxed/simple;
	bh=lxSjV5zdo7Z6Kantrt7sbi6rbzm7HqMJ/SMgv5BoIwQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=CFyDpKD/Umg0l5H199MF6rsguAdQrz/HQKxnP8WdFB6vy8kcjZEaQaWm3GLZRd4hHixvSdX2+5LxAV81sCiLvJFo7FxxL3k3w1AHB0NwAPTOxd0MCIeZYrK57Ny98GvI/jpH7NJgQUiReNwjAGXM6ERzgNTzErBusMlZJzIEraU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=mlraWx/1; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="mlraWx/1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=lxSjV5zdo7Z6Kantrt7sbi6rbzm7HqMJ/SMgv5BoIwQ=; t=1710162744;
	x=1710594744; b=mlraWx/1uP0Cqv7Tscwm2XiRI39491Q7DlUgF4hO2z1TTb2B/TLWOaMZN/Drv
	ZBvoy3XJEbfzlcTyCyKgQMJbu0YWhn1wnYz/D1+px6QVvJNGFt7bNvLaDdZX9R6BsFmagnDGNyvZA
	VbIT7dmYEQfJN3ygO0Zgt+ZwCWbiadGBihwThyiCl7ZrEx4ChJzuCHGGcEuGlGyreQuZPeTWWj2mg
	NWyLPb8GFCM+jg3r2cT7RfAaqJS3HerbgzC72tKMPfrDzclJF+0OZK5r4Jfh0DinOtIIZPNIBwkhQ
	ECUXZUKJvuuY6OIM8rBA17AUWZlb5SIccQtT9MA7fPgkZWlsZA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rjfRx-0000Sc-2k; Mon, 11 Mar 2024 14:12:17 +0100
Message-ID: <9425085d-1bd4-4e56-b0ee-6796dc9973e8@leemhuis.info>
Date: Mon, 11 Mar 2024 14:12:16 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1710162744;d1b8861f;
X-HE-SMSGID: 1rjfRx-0000Sc-2k

#regzbot report:
https://lore.kernel.org/lkml/1553a526-6f28-4a68-88a8-f35bd22d9894@linumiz.com/
#regzbot duplicate: https://lore.kernel.org/lkml/ZYhQ2-OnjDgoqjvt@wens.tw/

#regzbot report:
https://lore.kernel.org/regressions/ZeoAPFIF6NClUl4P@debian.local/
#regzbot duplicate:
https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/36
