Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2238C279DAD
	for <regressions@lists.linux.dev>; Wed,  3 Dec 2025 09:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764755207; cv=none; b=lrjTtAeqYC9bEyK4aHPBKkHDyAcKIyTRo9uWrAsRFzNyt89lIh58+/YOVmMzwhv68VjEociUWM4yNb8nlq7ggDPKHWnJufmAKwkTfafHeXRoqbrCQTuKBrH536jD8f5zzWuYI5gkjYvtECXkCfh9Dn/8GAF17KmxooQubsnwh58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764755207; c=relaxed/simple;
	bh=B7Bmcx9+cV7WL1CgP0dTzmyUWWerFQkGTPV4UozMr4s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=aNU+xnsI1bg4YseooqvCtaB8STIrT/DQAQmXpI+PGnKs0C6p9sNY57/Yz2lX9urHA07AKmdc+ZS5wP7o0q/akYgiBVYC/fq365Vy1DVY2HqkzzbV0JVEr+MHYVerTGT2WlOdHRrS6pe73jMnvf0BFr9IUzQS5wgOZBHVtCGBh/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=S8WDqjC1; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="S8WDqjC1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=B7Bmcx9+cV7WL1CgP0dTzmyUWWerFQkGTPV4UozMr4s=; t=1764755204;
	x=1765187204; b=S8WDqjC1EpVdFSk4NPYqJdWu48Oju6NUw4oBZ1irrDMvMsD3ZcNdpOCIlvGs7
	L4QyfNzul69vHzY2Tna34++6m0Fr4EfLyl2gH4Mm2bu8Cnh8JSDw3QViLSp7FKjZ4A49gF3lukqoA
	oWdJoPix0/9u5hb2qSYTM+xDVZX13T6LL7vfPEcW78zpyF7nx8ymqDjk6tSsrw5dDzBRvmG3ykYcK
	kiMnk3xo6Mspfy4l7ZqUq3hZwVzeN0MAlKlossS6L9MqxO6J0bITM6yGk5T58vZzC/ygOli03V5Ih
	Z2DrQda38SgpkIJFj6Q6rSMqOJvgtAYxy58ijzB+GSJCpEP+ag==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vQj7N-004v9t-0B;
	Wed, 03 Dec 2025 10:25:49 +0100
Message-ID: <dfa83ff8-5243-42c9-bfa7-34c66e13f142@leemhuis.info>
Date: Wed, 3 Dec 2025 10:25:48 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1764755204;b645f92b;
X-HE-SMSGID: 1vQj7N-004v9t-0B



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/CAAq5pW_saBZ+52zz2FYTt9SuWXj2KwX2Ld7AggVKAzca2m0Oow@mail.gmail.com/
#regzbot introduced: e72d63fa0563f8a6e98c10fed3a
#regzbot title: drm/mediatek: dts: display fails to initialize
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=220803



