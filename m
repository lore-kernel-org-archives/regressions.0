Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C511234AAED
	for <regressions@lists.linux.dev>; Tue,  9 Sep 2025 14:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757428138; cv=none; b=ImXkgrv0nqMp7tbPigwtMqYsjLS+Fqr1Q6cZPvtpuBknO93XnYye5+vwWg3oDnfog1tVCxLEJ0tZTUJcNQdkBF0zVbzcQl6qbd0Kr4RnzoXgrxfLGEOWmdl36swiq+rdySYx3XefNszb2CnjnmDjnVWU1OgKal+nkg/PtQghlJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757428138; c=relaxed/simple;
	bh=IkStaxylFyZFmQ3NATJ0lQQXCxhAWE0ZCA9u9dp/qJk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=mN9RXnYoyJSh7oWOyyHSOPGA10XTeQ1iLDdSyUCmXwkhh9pwf4Hu4qNo7cb75tbCKz08fNebjQ/rmI5o+rCQbxFl/aKYXAJhrK7KHPf3jdQyfO3A5ysZ/Gsq4KyTcAkdUxauKHoCajO8zR+Wn94SOkRYIpEiZa6i87ANOP71Kzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YWU7wn0L; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YWU7wn0L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=IkStaxylFyZFmQ3NATJ0lQQXCxhAWE0ZCA9u9dp/qJk=; t=1757428136;
	x=1757860136; b=YWU7wn0LJGnMb72lkv7a3Xgv+nkZ9B1jG8ppejMCsnUID5dbUnSRJE2DcWpOG
	m77g0mtQMXxs5/+OTUSBhfTYLrXsgJSAcacvGrAaF8smDy7a/ZkYFkN2xTlAPWCBBr8UKy/OyRiPO
	40eC8W/JxEEiuWdh2/lH+bNZ5NCy1OsTkPTuNuZqeXowTbpJFCMeViFefTthUQWMgWL7893raP2Oi
	aLUiRaChIptoYtatzL/ZUASN6nu+O9qIne9dDdCrCBX7gQKPc648YPMo/nUY4D/pqELahVekognBj
	j6MXSpYo7TLtTB1o+qbnnNdPUKYH4AliWojMF2MlqZIb9cwHGg==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1uvzL4-0088Dz-2w;
	Tue, 09 Sep 2025 16:28:54 +0200
Message-ID: <cdd99b46-5f87-40eb-9c36-6917f8e8ebf9@leemhuis.info>
Date: Tue, 9 Sep 2025 16:28:54 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1757428136;48ab15bb;
X-HE-SMSGID: 1uvzL4-0088Dz-2w



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20250830032839.11005-1-dan@danm.net/
#regzbot title: crypto: acomp: panic/hang in zswap
#regzbot fix: crypto: acomp/scomp: Use same definition of context alloc
and free ops

#regzbot report:
https://lore.kernel.org/all/20250901-hid-lenovo-drop-platform_profile-v1-1-e2e9c68483ab@jannau.net/
#regzbot introduced: 84c9d2a968c82
#regzbot summary: generic USB devices unusuable on on non ACPI devices
like Apple silicon Macs
#regzbot fix: HID: lenovo: Use KEY_PERFORMANCE instead of ACPI's
platform_profile


