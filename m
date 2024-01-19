Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B224D3D54E
	for <regressions@lists.linux.dev>; Fri, 19 Jan 2024 10:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705659799; cv=none; b=IjlzsDmCQYpqF2inA5Qo45P/wDZLgSICOFtRXQ6qC4vr0VY+PlaPFAz2IT5Hny+ZaNP8Z4XAQKXX58x1q20brwtzptI1Mf6XSlpzrIfe9XmFzBsCGtB6PZSEscQj2xhkFdQaz0N5SBQy3++n3p1N/o/aASjO3PQuZ1ubi/u60jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705659799; c=relaxed/simple;
	bh=aAloG1Ku/kcT6Vh0K0T9Wt637wbeyvVJhautLbfbTLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ETEzXILvDHkaG+/uxL7P5G+Dvum1fZWU1ZhwtEVZCmOaFvU9dM8Y8N4pk50kBpPVuKi67wEGERfu56PXjfxRpn7C1Iqiv44LzghMnI2RpT81dZgfrww463cWfoLPqRq0gFk6HDKPUT+oY/4WyXRxEeMQ+mKN6WpYLrkml+uGw/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rQm1q-0005M4-8D; Fri, 19 Jan 2024 11:23:14 +0100
Message-ID: <0489bb44-c21d-4a90-b7e3-300b2313dc3a@leemhuis.info>
Date: Fri, 19 Jan 2024 11:23:13 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [REGRESSION] Intel ICE Ethernet driver in linux
 >= 6.6.9 triggers extra memory consumption and cause continous kswapd* usage
 and continuous swapping
Content-Language: en-US, de-DE
To: intel-wired-lan@lists.osuosl.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <CAK8fFZ7Xi3=1HFY400firmpRWzHDPsi90cUU5bjOkF00KNZWeA@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAK8fFZ7Xi3=1HFY400firmpRWzHDPsi90cUU5bjOkF00KNZWeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1705659797;dbbd1e8b;
X-HE-SMSGID: 1rQm1q-0005M4-8D

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 08.01.24 11:49, Jaroslav Pulchart wrote:
> 
> I would like to report a regression triggered by recent change in
> Intel ICE Ethernet driver in the 6.6.9 linux kernel. The problem was
> bisected and the regression is triggered by
> fc4d6d136d42fab207b3ce20a8ebfd61a13f931f "ice: alter feature support
> check for SRIOV and LAG" commit and originally reported as part of
> https://lore.kernel.org/linux-mm/CAK8fFZ4DY+GtBA40Pm7Nn5xCHy+51w3sfxPqkqpqakSXYyX+Wg@mail.gmail.com/T/#m5217c62beb03b3bc75d7dd4b1d9bab64a3e68826
> thread.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 4d50fcdc2476ee
#regzbot title net: ice: extra memory consumption and cause continous
kswapd* usage and continuous swapping
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
