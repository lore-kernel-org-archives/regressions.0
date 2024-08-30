Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C36170A30
	for <regressions@lists.linux.dev>; Fri, 30 Aug 2024 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725011955; cv=none; b=Sbi3GxEA+GBESqQU4PWYiH2vSOu/4yhDzXyXw74JXU/lm6EmPW9u0AQ5dlH/iKtwuMC/ARh7yO/Bt/U+0XPeCVtPN6QR//3TC0U5O/rewCV6MGfDS7biRfQt1In68Zh/qWraxdU7Dt5JgObElNx9rP6y8gyYfq99iWTdt4kBkTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725011955; c=relaxed/simple;
	bh=GhUkPtGh4hCWF95Vf3OZ6WpLBQi9q6Zbp7kFoMZxVM0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=MHZMAV8oSdwTuRYcoB8sxK8y7sLfLp2Z41iBjkhQk7kWqfq4JFQWT1LqHvd0rWwvqSRQJ1Btwg5CXJVYcAJINCILj8rkXws2OTCafTb9a3DyFss9rqQAsGxyOezXFoHrNrW74puHUZ37/9WUVvbpQP81CZtcBsRAlrkswpcZN7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Fz+a5W+4; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Fz+a5W+4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=GhUkPtGh4hCWF95Vf3OZ6WpLBQi9q6Zbp7kFoMZxVM0=; t=1725011953;
	x=1725443953; b=Fz+a5W+4D9j2PzYDOeBvs5sJSTr+jLrzn8YTt5LyApkX67m3Ki3xkYYZ1w64b
	SnxeV2wQdCsFPB4i13JJCd79j0vm6R0yw8tNrC6l/JOLiZnZsYcEvuQ+16tSR+bqCnp+4V6gaTxzu
	R2XHkKrZrENMWEsa9gGTFu/do9knLZOCHs8k4vKxj4kpW+/gZOKOwaV71Ljg5WA6dvqwsLR8hM3U/
	VSbGaYO/ilB02c0Hf05agifqKU7yWW+e4Ao8JbXI6u1pRPXnFZ9LZMSOyn2MIgcUwwJGtVvRjgwk0
	RXjkfT3Rvs9PH/rbhkmZO8LJvi5M3yIBoIJiwEWOktkQMa1DuQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sjyPP-00046d-4i; Fri, 30 Aug 2024 11:59:11 +0200
Message-ID: <7b8cb62f-78fd-43c8-b6c5-683927b62757@leemhuis.info>
Date: Fri, 30 Aug 2024 11:59:10 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1725011953;3af56bb0;
X-HE-SMSGID: 1sjyPP-00046d-4i



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219193
#regzbot introduced: 1965dbd535eec6
#regzbot summary: drm/i915/bios: HDMI pass through broke

#regzbot report:
https://lore.kernel.org/all/20240621010713.cyai3pkucbp7v7r5@master/
#regzbot introduced: 721f4a6526da
#regzbot summary: microblaze: qemu images fail to boot
#regzbot fix: microblaze: don't treat zero reserved memory regions as error
#regzbot monitor:
https://lore.kernel.org/all/20240729053327.4091459-1-rppt@kernel.org/

#regzbot report:
https://lore.kernel.org/all/314ee964-fe3f-4b4a-b83f-76ed6e6e16dd@roeck-us.net/
#regzbot link:
https://lore.kernel.org/all/b2214bff-aeae-44f9-9b14-4ddaec1456bc@roeck-us.net/
#regzbot fix: Revert "MIPS: csrc-r4k: Apply verification clocksource flags"

#regzbot report:
https://lore.kernel.org/all/20240808155931.1290349-1-linux@roeck-us.net/
#regzbot introduced: 4d944bcd4e73
#regzbot link:
https://lore.kernel.org/all/b2214bff-aeae-44f9-9b14-4ddaec1456bc@roeck-us.net/
#regzbot summary: apparmor: policy_unpack_test fails on big endian systems
#regzbot fix: apparmor: fix policy_unpack_test on big endian systems
