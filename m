Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80422263C8F
	for <regressions@lists.linux.dev>; Wed,  4 Feb 2026 12:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770209544; cv=none; b=mvJh9mF1GYeWnY47f7LNrHwZ1dZ2OFcIVOYp33WHhm1OCitPcgYtSPxL5KH8HcVbRxxdRt/yoIF1Kcb3JuyLzRI8df+1hKTwEc8+nckh8OtqHmR3bmkHWV6AxI91IZA9KXNMjr7X1gStLLWj72KDtcxagEUF0DfkNigiPWqs/M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770209544; c=relaxed/simple;
	bh=MPscG735K/T2i3RbKI7vF3SUhpzqS61U4wiFvsIN/Wo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=JJYxI+ENwPNwq2OQPmXpUxI6TUb/kspILOZNTdGcqcC5UftMaYeuPlMVgU45hTCbLcQGBAVkROF557BbacvgEIzGYqzdDYZ+293j/2wn6SP31TeKV9fhv+n6CqnWxay3neNhcTQqX9MEfiJJ6XtIZitxcyuOWpAjqXLfoaZj+mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=fail smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vnc4e-006Dwj-38;
	Wed, 04 Feb 2026 13:33:37 +0100
Message-ID: <daac0e5b-0117-4efc-8143-18e255682329@leemhuis.info>
Date: Wed, 4 Feb 2026 13:33:36 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1770209543;60329c39;
X-HE-SMSGID: 1vnc4e-006Dwj-38



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/674efe8d-c299-4ce9-bf6b-c1920a5393eb@samsung.com/
#regzbot introduced: c70b9d5fdcd7
#regzbot title remoteproc: qcom: booting broken on DragonBoard410c
#regzbot fix: remoteproc: qcom_wcnss: Fix reserved region mapping failure
#regzbot monitor:
https://lore.kernel.org/all/20260128220243.3018526-1-robh@kernel.org/

#regzbot report:
https://lore.kernel.org/linux-media/uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr/
#regzbot fix: 17526c7e69d073

#regzbot report:
https://lore.kernel.org/all/CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT%3Dk%3DAAm4yWo3bAuCFg@mail.gmail.com/
#regzbot introduced: bc3a9d217755f6
#regzbot title: ipmi:si: uninterruptible sleep



