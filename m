Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FFC2DB7BE
	for <regressions@lists.linux.dev>; Sat, 11 Jul 2026 05:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783748951; cv=none; b=EmGYMGig/2waNM/dE24Je+sNF/TMc+S4lowNS1yQlE8RNEeqSFQxcVDdGDs4X0oCwFYPB6s7X8MEz26nJY4vmhNkw7TkQW6bUo5lA+dRWNel0JLXJjNWDqWFVaDQwflBo4TsL1UpyJPLNBdQrH7XrnFzvDRkQaluq0l7tQx1dFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783748951; c=relaxed/simple;
	bh=SnFwFXYoSVcucBcoeZbL5mBq9HF+Y6BEibfsLBIsoH0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=i5BjTdO1Nnv9xLqzhHe3RveFVGfaknmBwsOA95vzpxSpH7o6EvPamhcD2cjxM/TO6LiBXnkNQc9XGvyleh6uThQnU4lclgKjxHBrsTEAKzIilsve0sH1MgCxpktT5xSsK805bI7Cv37vtNajBvYDZC2aCQpV0P2KQ1noZUoxzXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=cNdY5+se; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="cNdY5+se"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4gxySJ00fPz42jy
	for <regressions@lists.linux.dev>; Sat, 11 Jul 2026 07:49:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1783748944;
	bh=SnFwFXYoSVcucBcoeZbL5mBq9HF+Y6BEibfsLBIsoH0=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=cNdY5+semcsbc/Wa2OeF1VRt5OtPmBY4Ah+HxJcMnPw5oULwsAAvvRrIFvfbIJJYQ
	 pYYXlILJhs/8jpHNOwvsD4Cwo54QVm/FYFOFJ3S+cf5H7SNNeAKKZXlv6fDqA7EmrE
	 81or0g/dYu6SFs4jIAzbw18QSkXwmsnruceQEPegza3U5Ge82tUd77iRhow7v9/3+R
	 IttTGGXNOxoHmWpi5GSVwrSYrYQDsGvgZuNRk5pp9l0aATaJXJLZTicR2ioNlLFbKn
	 VBKWDSwVk1NlXTyC4chZ7teC9LfIo5fIL9qaeRYFRA+dPW/h1crnj1hLpBpgSBr2Ht
	 tPYQvKHmQ/kdw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4gxySH6Prpz42WN
	for <regressions@lists.linux.dev>; Sat, 11 Jul 2026 07:49:03 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gxySH4Zd4z8sgT
	for <regressions@lists.linux.dev>; Sat, 11 Jul 2026 07:49:03 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0FCCC60305
	for <regressions@lists.linux.dev>; Sat, 11 Jul 2026 07:49:03 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <e3e39afe-e1c7-4c7f-ab2b-9523370eadc2@leemhuis.info>
Date: Sat, 11 Jul 2026 07:48:57 +0200
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
X-PPP-Message-ID: <178374894324.698591.6675381276611597759@mxe9fb.netcup.net>
X-NC-CID: Ho3xAwPel00IJ5YuHrPAOcIn50uIfYjYczzVBzJ+iLcFEp6S/Kg=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/8a2b1abf-3c8a-4242-82c5-fba9943cf8f4@archlinux.org/
#regzbot fix: block: try slab allocation in bio_alloc_bioset() before
mempool

#regzbot report:
https://lore.kernel.org/all/CABsFS_g+V_Owum6knLhenhM15EXJRrsF0FcLiw30WZxarsTpUA@mail.gmail.com/
#regzbot introduced: 186bf9031666
#regzbot title: platform/x86: asus-wmi: charge_control_end_threshold
returns -ENODATA at boot, breaking UPower/GNOME detection
#regzbot fix: platform/x86: asus-wmi: temporarily revert to setting a
charge limit

