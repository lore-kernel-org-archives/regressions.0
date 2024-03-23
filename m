Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F73DDD9
	for <regressions@lists.linux.dev>; Sat, 23 Mar 2024 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711197279; cv=none; b=UxeBRBHz4bI0ToCuJpKGCqp0ENVsa/bMZAPCyi+TF3wfLh6fYdw+mYC8KeEz+sDg1hy+hKEMCY96wo0OvDoysEeiIFaOuGbXGAqySw9rYqwibjwk+PJcZ00IhXf/dmfxAP/aA7dRNihOtEZqEJUP0NopPPG9drPxLj31OEzVqEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711197279; c=relaxed/simple;
	bh=RDhuHvEYGZSQzoL8mc9I97JQjcjL6ZW69jBy0wd3KUo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=H6CI8Pe2L/JMXQBHLzihNvCjyRg7qFM6iCvdkCQ9MpqM/JbMnnGRoZcrANHDzLbihcDP9bBIYVhyDsSlMdcDdkuJdIQrqjddNf29qoAKXJzMD6fif7zEbXcXQrkzpGSBSQBArN0Ou4Zd6UHDsZe5Zh9U7NahphaGQl3S6W9iAwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=IZAKMmeu; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="IZAKMmeu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=RDhuHvEYGZSQzoL8mc9I97JQjcjL6ZW69jBy0wd3KUo=; t=1711197276;
	x=1711629276; b=IZAKMmeuBQLGZTV3naEO4xvMhkNbRkZLCStUlT/wWzeXlo5NDfUZzejrKclcx
	Gs2hRIXxPps/eoprzolTvPP88KFbEXL52oz4Wk8Zn5rB9LN1BLgoq8eLR2p714ht1CXjCa9jNjxgC
	gIoRaZ0atJ7y8HIS0xIQ+K3Qjjeff2Ylwn85+XhgZU4q0dNpCQZJJ8AscIeg3V/7XxlOFqGDw0d9O
	kgmvkEcBinvrIayyOjinsiGdd5OsB4WLCbzdvVU5GIYQ2ePS7jw7iOJS36OIWcExup/KGAms3zgpG
	4TsJCzGuyaE2rMlp7sK6RerNCLoKSFuFquNinMqmDpYevQlN4A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ro0Zw-0004MU-IS; Sat, 23 Mar 2024 13:34:28 +0100
Message-ID: <07ba20d1-3c95-42b6-b566-f5c1980ffe16@leemhuis.info>
Date: Sat, 23 Mar 2024 13:34:28 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1711197276;78fdac10;
X-HE-SMSGID: 1ro0Zw-0004MU-IS

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/Ze8OXcCA_BCN2MVE@nuoska/
#regzbot introduced: 4d0c8d0aef6355
#regzbot title: mmc: core: RPMB breakage
#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=218587
#regzbot fix: mmc core block.c: initialize mmc_blk_ioc_data
#regzbot monitor:
https://lore.kernel.org/all/20240313133744.2405325-1-mikko.rapeli@linaro.org/

#regzbot report:
https://lore.kernel.org/all/20240313072625.76804-1-vaibhav@linux.ibm.com/
#regzbot introduced: 180c6b072bf3
#regzbot KVM: PPC: Book3S HV nestedv2: pending HDEC exception for
nestedv2 KVM guests broke
#regzbot fix: KVM: PPC: Book3S HV nestedv2: Cancel pending HDEC exception

#regzbot report: https://lore.kernel.org/all/ZfvN5jDrftG-YRG4@titan/
#regzbot introduced: 7cb50f6c9fbaa1
#regzbot title: of: property: fw_devlink: audio-graph-card2 setup broken

#regzbot report:
https://lore.kernel.org/all/e20d88d0-5fb9-4307-be67-88b04ae9a188@roeck-us.net/
#regzbot introduced: 71eb4893cfaf37
#regzbot title: x86/percpu: crashes in qemu with nosmp builds and Intel CPUs
#regzbot fix: x86/cpu: Ensure that CPU info updates are propagated on UP
#regzbot monitor:
https://lore.kernel.org/all/20240322184944.141421692@linutronix.de/

#regzbot report: https://lore.kernel.org/all/ZfxJZFwXqqurfet0@aion/
#regzbot introduced: 561141dd494382
#regzbot title: SUNRPC: RFC 8009 encryption test fails

#regzbot report:
https://lore.kernel.org/all/bbc242d5-3ab0-410f-a3b1-54a68e3e375f@roeck-us.net/
#regzbot introduced: 72210662c5a2b6
#regzbot title: mm: vmalloc: persistent "spinlock bad magic" message
when booting s390 images with spinlock debugging enabled

