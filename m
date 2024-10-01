Received: from mail.vapourmail.eu (mail.vapourmail.eu [5.75.183.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C961CCB5E
	for <regressions@lists.linux.dev>; Tue,  1 Oct 2024 19:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.183.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727809757; cv=none; b=fg6ruQBjHphggkyRHK5VqtUQsO/KFe4Hi34dHUq5Z26sAGaY6sLhwFIqFYsPkGn9s8b6EZeo19ndUCjJTHHk+siReXWIGLEtJY3lM/xCarxAs5fPF4K2vp+myRB2iehag8RxEIy7AOKAi/1YU1UHxSn4gj0Lrf+kbiwbn2pWo6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727809757; c=relaxed/simple;
	bh=vGUanLpZaIxmLvzAah7Ml4NaQnkEnX+Wp1ndwJbSSZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lq2grljgyks9nlg1xjTDp+CkcIGf3k00jfo5E9xChuFqLJUTAX4eiQzY1fz2cUquiY7FWzfOV4B2ifyD82yAp7ly6oD4s2UdsRe5uwSKK0ZaUqqLLR4peaHmiTFj3fhjVTPi3VqW+WIWS7IStJ2S3bKcwhgwDFRODyZR4pAt66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=johnrowley.me; spf=pass smtp.mailfrom=johnrowley.me; dkim=pass (2048-bit key) header.d=johnrowley.me header.i=@johnrowley.me header.b=snEJbei8; arc=none smtp.client-ip=5.75.183.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=johnrowley.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=johnrowley.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=johnrowley.me header.i=@johnrowley.me header.b="snEJbei8"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1DF1C0076;
	Tue,  1 Oct 2024 20:09:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=johnrowley.me;
	s=dkim; t=1727809745;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=MmSnUdMKHsGI2VRpu+YhU76rUdbF7+VqmnmZpKCYOqs=;
	b=snEJbei8YxYLT4iP1xOWvTTqLjqcCyv3LcoB2lDQbpe4NXyhkFtx6bdL/OVbavD7K0oYuY
	rND32D2bcfXvaUXky8g6xyxkeerT/ylWq1BZTP/ig6P6nSzjMbTdPXLpDCVy+bpt/cDEga
	31xj0hY7myDisI4XQ/Xx7WVmJmsKURCKUZX2HQ1LwJglTYM44Z5cmdSPd3zsi3hBdqFULc
	lr2cp/Fl0cABCVdNAY/MVGzqEBxxQSuEdnXLdOmTLbcH8iAfkiTmETuXP0h6mqM3QYWNdk
	dlxRPZBGiPFzYX88DXT9YL9w7H3Romje/+V+RuNdveSAIa1hFXQUaNNku1gmHQ==
Message-ID: <836c2c82-4dfe-40f4-8d50-5e7bff04c38c@johnrowley.me>
Date: Tue, 1 Oct 2024 20:09:02 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] 58a261bfc967: choppy GPU performance
To: Mario Limonciello <mario.limonciello@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 regressions@lists.linux.dev
References: <9b80e957-f20a-4bd7-a40b-2b5f1decf5a4@johnrowley.me>
 <925cd47c-8f1e-4b74-aeff-6d13ae5f0753@johnrowley.me>
 <95c575a3-100c-4808-b451-b92f14598188@amd.com>
Content-Language: en-US
From: John Rowley <lkml@johnrowley.me>
In-Reply-To: <95c575a3-100c-4808-b451-b92f14598188@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

I was using power-profiles-daemon version 0.23 in balanced mode.

I also tested TLP, and vanilla kernel without any power daemons running. Without any daemons I use the following:

    energy_performance_preference: balance_power

    scaling_driver: amd-pstate-epp

    scaling_governor: powersave

Thanks.

On 01/10/2024 19:48, Mario Limonciello wrote:
> On 9/30/2024 13:42, John Rowley wrote:
>> Oops, forgot to mention that I'm using the AMD variant of the Framework 13 laptop, which uses AMD Ryzen 7 7840U w/ Radeon 780M Graphics.
>>
>> Thanks.
>>
>> #regzbot introduced: 58a261bfc967
>>
>
> Just to make sure we're looking at a pure kernel bug:
>
> 1) What version of power-profiles-daemon are you using?
> 2) What mode are you in, 'balanced' or 'power-saver'?  If 'power-saver' can you reproduce in 'balanced' as well?
