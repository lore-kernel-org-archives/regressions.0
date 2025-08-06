Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8441628ECE1
	for <regressions@lists.linux.dev>; Wed,  6 Aug 2025 15:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754492962; cv=none; b=HJtkwAP5Dws2bkD8gL+u8JRsrBCV+5eOR9zdSh76VGN+MAw+UVpSRgsw+DsTy8Ba5yRLDJHAkpOBaLI3m6kAm2nKPF+PRIhP/6dU2nT5YemaPflgVS38jIApM3Skg58D6v3pOEJvSpwiDT03TlAIAVhUtwSRhgz/dhIsC0Lo72k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754492962; c=relaxed/simple;
	bh=5+hj45dZOO1nQnfkSsdQ7FxVjU1SSc4TRm0CRNj4Tvc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=jEuto+79yoqDklOxX2pkv2T4GrqgS7s0+QAvabaP8RrIpu3zCKH+FEoKuOl1pJ0tx6+gCkaiXPBHbrZSVrr3rS79D/tRlEZbZPJqwWcJBCzGtBN2uTQkejCqXxuQOkYDPcmg7qOU32aOF0sygTAiQ8tQxP4UTU2xhMvULJBOzN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=sqzwjGQC; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="sqzwjGQC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=5+hj45dZOO1nQnfkSsdQ7FxVjU1SSc4TRm0CRNj4Tvc=; t=1754492960;
	x=1754924960; b=sqzwjGQCeDO7bQaEFo8apsFuPoBt+G5SWlyiJdZ4rNtnFUTSJxk2BIECuba5L
	qcmdC/rLFNAfRnWlSytFyksw8lbPSpeVRkuh40RBvADDYt3XbUprCcYYVNw0NCQssl7lAmKEBx6jY
	cRIOvJ85jiobzZhYIUT57E2FoAtoCTnqRN6L5OZbaBwSuwaYgCKZL5D/PpGsqwswXWjM8z+Z+85Ff
	97MIAQBVV1GGDjR0TaQ7r4XJkc06QKjPyaWTvWG5FPPnm8ZuR1bjUmqf/YEOpk1IT0IyBs4wiBHQ1
	8lZzzmSuOqnW/ZH6n5NVR8+zsdgUlft/qjxQ4mvAWTADKzdYHw==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1ujf4V-00CMri-2m;
	Wed, 06 Aug 2025 16:24:51 +0200
Message-ID: <c2c6ab7d-523d-4945-a9d5-8a65b137f491@leemhuis.info>
Date: Wed, 6 Aug 2025 16:24:51 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1754492960;93a601cb;
X-HE-SMSGID: 1ujf4V-00CMri-2m



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report https://lore.kernel.org/stable/aFW0ia8Jj4PQtFkS@eldamar.lan/
#regzbot fix ec9be081c5779b

#regzbot report https://lore.kernel.org/lkml/aCwZy6leWNvr7EMd@eldamar.lan/
#regzbot fix 355341e4359b2d

#regzbot report
https://lore.kernel.org/stable/086ba44f-c4a9-45ec-a571-7fa217daf006@gmail.com/
#regzbot resolve: 6.14.y is EOL

#regzbot report
https://lore.kernel.org/stable/aHn33vgj8bM4s073@hacktheplanet.fi/
#regzbot fix: drm/amd/display: fix initial backlight brightness calculation

#regzbot report https://lore.kernel.org/netdev/Z_z9EjcKtwHCQcZR@mail-itl/
#regtbot resolve: 6.14.y is EOL (but a fix is in the works)
