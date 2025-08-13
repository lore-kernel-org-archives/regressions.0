Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00491B87E9
	for <regressions@lists.linux.dev>; Wed, 13 Aug 2025 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755073867; cv=none; b=VL3IueVG2SknM+CJlzr36yLkN9kMrZdHtbg4t7M1JJrDx4Ndnxp/vQ0yRO224nFc1Ef5n8ZgyhDsjr5rGotWdkwMeV8yySjGrX39ptFoEowxCmXNmZ55YBqmefQup/9chIOCOmllUzffYn+JaPI69vlPC3t3sm7MeQONRz/zFCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755073867; c=relaxed/simple;
	bh=sLC6/uoNSqUP9RfoykDkWY4pMILLcviQIOuEyYUQj6E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Ta9DvEhnn1LziCMA1we/FQypCfquq+QOYJzaPRNDp6LHFNSRj6hZR+NvKQL2ETjbCGkMbhB//hbJs0uaZrh4uMYrWwrAs9PFGIqoX7BQgbubedriTSyxhHKqc1NccaAiLwhzb0kEbyNp5E8GpvtppkHv5qzzCm5Xo6IXHiSDQsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=qr3MAEG6; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="qr3MAEG6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=sLC6/uoNSqUP9RfoykDkWY4pMILLcviQIOuEyYUQj6E=; t=1755073862;
	x=1755505862; b=qr3MAEG6DoSkFYeGLBS0FzcXOud4Lg4hejqhVEl1Gl2WqCff+RALi9Hx85iXH
	LGA+5Mv0YFYWhfmMrLA1hAirQi6dAYl/MnKiE9fpQ2KNm45O7seFMbYGWIfZp7i/ECtIl+nEUcBw9
	MOLPeg2y60icM/qoMh2vUZdIKKPUL6P/RPD2x1zW8ucArrxmXdoDmHby6Pdmwf6d09zehIc+uQGu3
	MZJaqe8kDhPEQmHYmqjvmIm3ZftC1dL/JZxMEud9tL/TqJmIul7tJEUiSdj4nq5AYoTs+9Me4/4nI
	u++cp8jda8gb7ldSiZokwEbiqY8MV4TwwIftj5mXwLLYRH9XGw==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1um6su-007gr2-2d;
	Wed, 13 Aug 2025 10:31:00 +0200
Message-ID: <243fb437-9646-4d60-9a8d-a50ebef2822a@leemhuis.info>
Date: Wed, 13 Aug 2025 10:31:00 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1755073862;e950bf45;
X-HE-SMSGID: 1um6su-007gr2-2d



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/lkml/aF35FqJAw63NSl63@mail-itl/
#regzbot fix: 93598167dcb6

#regzbot report:
https://lore.kernel.org/amd-gfx/f2b70e6e-bff6-42f3-82a2-81eed892cc30@linux.dev/
#regzbot introduced: 1f02f2044bda1d

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3519
#regzbot resolve: reporter cannot reproduce it anymore


