Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355FE131E24
	for <regressions@lists.linux.dev>; Wed, 17 Apr 2024 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713344177; cv=none; b=pAo1FtGljYfTgmB8sd/UlvMuz5p9nZDbqV3GpYTtSs11hfiLmj6C/E3GAuVbrEowRY/+b75rDIALUi/8GMh687vokb4bC4FYuO36vUA3lB1KSuyG7ocT+jpLp6crHwhJKteuoMcjlZzFxrdjoebTUeGVDOCq4a+rsXcpXfdHudg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713344177; c=relaxed/simple;
	bh=3E7Tq8dH47c6MflVclG2AC3iDWee1/UW/7BGfuakEp0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=tYQ0mlfQLsbLcHapplB1mqDWdcVMMKVgY8LCZmiBxK4Dg/xvQ/k0kjF2kYCDIYWjF1sCJvSG6EPHqF8kMMLEF1IZ0IskoeyK+qN+qn7YPtumAIDaz/Ig99DeKLLawr/FVa6pcpQ2ct+78I7PNo15qAzRULP/7/rlWh8gj1ARTqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=id12i3MJ; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="id12i3MJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=3E7Tq8dH47c6MflVclG2AC3iDWee1/UW/7BGfuakEp0=; t=1713344175;
	x=1713776175; b=id12i3MJ8kNpqdbK7mgVNyrWu4Ujfg+gkgw0tMwkpXgmhyoI8s9GEA9Air2oH
	PbVBl6NocyEf/ckTUvfrHtuKedqTWQDywJgNbK253NRaXMwOzVRO7RmbZtTddsBw7Y1pdOXcWmZhG
	RGGVjWY7TboBXBS9PoSfrMptXQzGlbpQVnJcbX7/mK64A/evcbf3N414nzFRUbCXISah1CtiqYRwR
	t01qf9IUwCQb+gPMmcPh8wKjbBZcz5zyK5MIN1jzgGi9rIlYXl7S+n38yHx1L9jK1XUelP/HHQRCf
	mkPr2vJ6ssZd7J+RNRHqFxERhCK15QfGSEmMiCf57au1FmP53A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rx15Q-0007ZV-5R; Wed, 17 Apr 2024 10:56:12 +0200
Message-ID: <e061d6ad-1047-4ea9-b45d-360a07273f56@leemhuis.info>
Date: Wed, 17 Apr 2024 10:56:11 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1713344175;0487bd36;
X-HE-SMSGID: 1rx15Q-0007ZV-5R



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218698
#regzbot resolve: reporter: does not happen anymore

#regzbot report:
https://lore.kernel.org/all/CAHudX3zLH6CsRmLE-yb%2BgRjhh-v4bU5_1jW_xCcxOo_oUUZKYg@mail.gmail.com/
#regzbot introduced: e8cca466a84a75
#regzbot summary: iommu: boot crash when using AMD eGPU
#regzbot fix: iommu: Fix def_domain_type interaction with untrusted devices
#regzbot monitor:
https://lore.kernel.org/all/fa14583e94cbf540b60a6be94b41bb24d0037e75.1713272443.git.robin.murphy@arm.com/

#regzbot report:
https://lore.kernel.org/all/b702c59f-7a5b-48f5-a726-a4840ce05c3f@panix.com/
#regzbot introduced: v6.7..v6.8
#regzbot summary: hibernate: no longer resumes fully after when by
default (e.g. when async is used)

#regzbot report: https://lore.kernel.org/lkml/ZhuYyrh3mweP_Kd8@nz.home/
#regzbot introduced: v6.8..v6.9-rc3
#regzbot duplicate:
https://lore.kernel.org/all/CA+9S74jmWiSWaGoMU9AZnJJd1Ck2qNBdkBZG1=J3PC8gsqqWxg@mail.gmail.com/
#regzbot summary: sched: kernel NULL pointer dereference in
pick_next_task_fair

