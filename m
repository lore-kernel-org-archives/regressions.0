Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E2028DB3
	for <regressions@lists.linux.dev>; Sat, 27 Jul 2024 19:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722107776; cv=none; b=N5yltz1vN5vy1ExFJJd+zZd9R6PVhcQi8oZoyzB91T34qUdc6YAvTsDcJ/MEXnkYkSwMSMFXDwMNL8HyJpBXA0VvoWLEBI8QVk3qwq2X7st5z7hkhI168qwVmWTwDfzARYjuPgBZOyi61h5VhamzvQcb5tSSDQ8wWmbtZCmaydQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722107776; c=relaxed/simple;
	bh=k32fOmOoY4xEboeP8ZAixCPVCT8lmKxnWRu6+/+2jtw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=rI3QdvlZC9OQghsIvOv1+CkLBpcvcgfPH/A3IbawXiVfnv6yiUmzEnX84LIfvhiZg5wQCsRCXNfJ3upLPFhT9m8vvtM2YcYo0UZ3V13QItgYM6rsr2Z3qXj7VqIg4dZu4RCp93yLpeRI3ig7dCJWU8jwZD2svZQzv0wMiOt9yOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=mX8M8RRw; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="mX8M8RRw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=k32fOmOoY4xEboeP8ZAixCPVCT8lmKxnWRu6+/+2jtw=; t=1722107774;
	x=1722539774; b=mX8M8RRwtUXJNfUpvFcVI+KfEolP+DQg2s0YuCcNVZs/8M8xLR1llB1z63w+f
	99XhvmdKtiZi6TI1VK8VA32wdfUebDBaQzmPdBNYrGxM8xPXC58xxEMfLJ4sRsy8pIRYQRkbeWm+Y
	FQ2SLcb0PKQcBZfSUEQZJR1MPyxdZnPQj3P+q+bOqSW7T2xWam+ejiJX05D0NPL49H9kIF3laTGwq
	ql0aY+vGUZx8hAl2Caa+eyjUvtWLRCMFxPWmYhnlYP156lLWORMaVdRkWIhSF/mSYcDm7XU5QxZLn
	foYsGHhKZeTp7NnCxNW3DPumtJCEVsCzQ/HqY5vgn1sQNMvy6Q==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sXmto-0000wH-By; Sat, 27 Jul 2024 21:16:12 +0200
Message-ID: <fff8cd31-5911-491f-ab7a-344b5c8d74f8@leemhuis.info>
Date: Sat, 27 Jul 2024 21:16:12 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1722107774;a8b6e62e;
X-HE-SMSGID: 1sXmto-0000wH-By



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20240719204701.1605950-1-minipli@grsecurity.net/
#regzbot introduced: 27152bceea1df2
#regzbot summary: tracing: user events UAF crash
#regzbot monitor:
https://lore.kernel.org/all/20240726132811.306a449e@rorschach.local.home/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219054#c6
#regzbot duplicate:
https://lore.kernel.org/lkml/af462e20-d158-4c5c-8dae-ce48f4192087@molgen.mpg.de/
#regzbot fix: media: uvcvideo: Fix custom control mapping probing
#regzbot monitor:
https://lore.kernel.org/linux-media/20240722-fix-filter-mapping-v2-1-7ed5bb6c1185@chromium.org/

#regzbot report: https://lore.kernel.org/all/77KAHS.13UUH2XVHQQF1@gmail.com/
#regzbot introduced: 63d0b87213a0ba241b3fcfba3fe7b0aed0cd1cc5

#regzbot report:
https://lore.kernel.org/all/0ea167a1-75d0-469d-a79f-ff2cb5e81bdc@gmail.com/
#regzbot introduced: 5537f653d9be09
#regzbot summary: iio: imu: inv_mpu6050: log flooded with "failed to ack
interrupt -121"

#regzbot report:
https://lore.kernel.org/all/26c01e3b726812979846710afcaab81e92da6a40.camel@declera.com/
#regzbot introduced: 0ddd2ae586d2
#regzbot summary: drm/ttm: choppy youtube video playback in
google-chrome-stable

#regzbot report:
https://lore.kernel.org/all/b8f4ba97-84fc-4b7e-ba1a-99de2d9f0118@kernel.org/
#regzbot introduced: 25216afc9db5
#regzbot summary: pci: Re-initializing the AHCI adapter fails
