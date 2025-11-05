Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B723D261B83
	for <regressions@lists.linux.dev>; Wed,  5 Nov 2025 11:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762342508; cv=none; b=ui0w6l133gl+KZ+Y+xEHaImiB0VbV5NZ9da7RhCYf2hGWJcIJlBbzYbumfTECwNnLqRzjz25692NMc6F1ewCxfes2FGZLLzcxcAIKIKhOLIijyyINjQICGSTWsvjQiLXY0LI5FPXKb4pbIKdwwxqpyegamoI4jS+0gPdWgmgIuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762342508; c=relaxed/simple;
	bh=Q5Ww37iPT5U6mHonVzZPKIp9Y4EHeh2Be6jw7n/+REg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=GYIb4goEUeUkEGId4I4ODmK1kmWt0HTBCkRGDRgXnYfjKHi6e80rJh7cptVJgpbDHAGP8torztIGaezlaj7+eX558Wjck84zXJpslzjqx7zKb3pl6of2RiDS6wygpEKQTpFmPNEoaXdkVFDhWDZ5wZJC8eJl6KYE0AMhAdHUbUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=xzmZ69uc; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="xzmZ69uc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Q5Ww37iPT5U6mHonVzZPKIp9Y4EHeh2Be6jw7n/+REg=; t=1762342506;
	x=1762774506; b=xzmZ69ucFzUDVoGzA2SkLDzbINuIynaDwToFDWMnRQoqyPABtStBktgxs4IQm
	XLACYnEWfNwoWFB/odvl5PsFmny8qyHLgxJ6CXYwT7Z0KArJNsohFSwl4GBiXkNCE/tN6UXgd8Han
	0bSZxuKknMO5l2kRQf4nllUz2Gi18J56S4laTroGrx8jEGOMocVKQWWMIXcUmsff2F6PXuAipalHu
	637mJDAfVljtB6Vqli2hDQ+oAXBdbYZ8q/LbJKjBHwvoiI9a+nDbTTbc+7fkiRQUCQumrHJM4GMw5
	WzKU6eglfikX6s8VcH0x+qyfat3A/aYGQBocfdDPhmeEunjs1A==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vGbn1-002FPO-0K;
	Wed, 05 Nov 2025 12:34:59 +0100
Message-ID: <a4d3d290-80cf-412c-9f0d-bbfc8d5c5bc5@leemhuis.info>
Date: Wed, 5 Nov 2025 12:34:58 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1762342506;effa9cae;
X-HE-SMSGID: 1vGbn1-002FPO-0K



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CANBHLUjPbXYghPx5zDwLDcGKXb7v7+1u-bpZ=L9r=qW7vDZ=cg@mail.gmail.com/
#regzbot introduced: v6.17..v6.18-rc1
#regzbot summary: kbuild: secureboot violation for linux enrolled
by-hash into db

#regzbot report:
https://lore.kernel.org/all/DmLaDrfp-izPBqLjB9SAGPy3WVKOPNgg9FInsykhNO3WPEWgltKF5GoDknld3l5xoJxovduV8xn8ygSupvyIFOCCZl0Q0aTXwKT2XhPM1n8=@geanix.com/
#regzbot introduced: 795cda8338eab03
#regzbot summary: rtc: interface: hwclock busted w/ M48T59 RTC (regression)

#regzbot report:
https://lore.kernel.org/all/mwBOip3XK77dn-UJtlk-uQ1N6i3nwsKticZyQdPYzQcsk0dsjXl4oOAh-Neoxv-0TlpKnt_FEJwx8ses5VJglGLJUW-bIG8KWchtoDwCnnA%3D@protonmail.com/
#regzbot introduced: 0c58a97f919
#regzbot summary: fuse: system hangs on suspend after using distrobox
container


