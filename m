Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF91AEAF9
	for <regressions@lists.linux.dev>; Sun, 12 May 2024 06:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715497185; cv=none; b=IJp/Uh+VP5Lo9k12SLgRUEf+tpI70wpjQzImNLNrKw+d5I0PuyGSpYtshlAo2uWxpnt81ELYJHBP4xDDDNiCGDQEc0FfRVEnWKdpK+GDtxBa0kFrKcmPFXa7eU/WIupGc+1wqLWCG9YnXV+RB4Iv2WzjS3VqXlzwTvNeJbuqZD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715497185; c=relaxed/simple;
	bh=2Vf92JMYMjHHAOXxpbLS9muQmof5CYcnxjj+FOYYAg0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=AI+TIN3liXeWxyGrQJ9DJaQnXkl3K2paQATCq4Nzoce7QH9+0tGUK6a/0xLidHRP4jz4UQdtsVIY+Mw/57adfeLpV3OUeRibpHVD5FOV9DVDs1QQRkr/1XVwka85qiX76TLIJzdwIOZcrKOA0D87F1TW6OJ8/ba2GCOOEfAPvOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=bqUMSVC5; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="bqUMSVC5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=2Vf92JMYMjHHAOXxpbLS9muQmof5CYcnxjj+FOYYAg0=; t=1715497183;
	x=1715929183; b=bqUMSVC5r7yjk19KUlHQ4ZoAU6J+mdGQ4YVh7XMu2XgXlwufPZ2qntAe3nrE1
	JgENFOUibaF2kOvP6F6hwyuEeF+WbqHjBg0mjNLCR5zXD4q3WrF8fHjH/kC2CKTam+cXf2vSWtxYV
	4+ip6nSM0ZuvtbJ0WFyc2C3gHgNgJ8vYdyoRe7Np0FBXp3DM2e/8Dj6+4IogSJdX5js3/0CrmGWok
	034qDPMtE/yVCIVYPKg4wBHvanPhb3gA94UIxOqJcZsDIHjgvQ0G6oG1MFNDuEjBk47HVsdK6qkQ4
	/nkejyV76BHZCTDg2FquRHQbmsP1FfG9WQEioxwZsqv3qY2AIw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s63BG-00036o-MY; Sun, 12 May 2024 08:59:34 +0200
Message-ID: <0834b74a-b360-4404-994b-7f20c89d7257@leemhuis.info>
Date: Sun, 12 May 2024 08:59:34 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1715497183;531adbef;
X-HE-SMSGID: 1s63BG-00036o-MY



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-usb/9efbd569-7059-4575-983f-0ea30df41871@suse.com/
#regzbot fix: c78c3644b772e356

#regzbot report: https://lore.kernel.org/all/87o79cjjik.fsf@kernel.org/
#regzbot introduced: v6.9-rc3..v6.9-rc6
#regzbot summary: x86: mitigations: suspend stress test stalls within 30
minutes

#regzbot report: https://lore.kernel.org/netdev/Zh/tyozk1n0cFv+l@euler/
#regzbot resolve: afaics irrelevant [Thorsten]

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218759
#regzbot introduced: f3a052391822
#regzbot fix: cpufreq: amd-pstate: fix the highest frequency issue which
limit performance

#regzbot report:
https://lore.kernel.org/linux-wireless/87wmo0k71i.fsf@kernel.org/
#regzbot fix: wifi: ath11k: move power type check to ASSOC stage when
connecting to 6 GHz AP
