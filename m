Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC1A14F8C
	for <regressions@lists.linux.dev>; Fri, 23 Feb 2024 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708674799; cv=none; b=dX24DQF6QhPI+8TrehCFYUldSrBM2+W+7evq7gUgtWTYFdu125+Q6FvIIDPMHlVU5+Tk455b9ezFuwEF/lsv4nV6FN/AiG0HaWs3zMMtGqG/ZjaW8twkjDXehAHNLmO8T1pLT5lWkaioNWv/LPhHWCJJbyBDKEUn6qjCHoN3Ln0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708674799; c=relaxed/simple;
	bh=R+gxgEiXtPxYAZGyqgZ4zyVgN3CirU0xH/s3N7Y1noA=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=D5xhptB1lkDdUrGpjFI/uxPdXEczAmyBfUMmb/pGO0TZo2/CDiYGJceCMHK0su/0bW5FL9gaFzf99kUWnqHHL8xvqgyDjd9XaFDH+1L+8+rd0PWbR+sHpDmsyrqqKXnaAslb3wAZBH1/a0DFJbKU10TMnZUOMjRBVDaQb364ayM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=yJ7BUaJs; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="yJ7BUaJs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:Subject
	:Reply-To:To:From:MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=R+gxgEiXtPxYAZGyqgZ4zyVgN3CirU0xH/s3N7Y1noA=; t=1708674797; x=1709106797;
	 b=yJ7BUaJsgbrVSyYwXYuXnhJrp8vcPywSE6sFbsGbfjmOUcQdpq2OsQ5oQQNf4KO8p67JeLAwUO
	aPlR9OjeUMdpUV6RzvbuUCx0r7AU9a922vTbkJ+6BaYL8ZrSoXNJmqnjlQ84agW0vAM3rAp1NbZHr
	OYiiRJep8HigIQ20xySk1SUSWqiQgzn46luedZXmxaS7+mhq7cWLW6e+QLceNboe++2mnYXxlhMw/
	G75gyzdPmk8oO3g/aFBvwHT6eaemhIkmmNt3G/UsCHQb/2MceJaK7MYZyHRXL2oDeiI+jSmu4ARfU
	TQrmJhQQaA6LNJNUJTGdNmxYhwJ5ecTG2V5tA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rdQMt-0004K3-S7; Fri, 23 Feb 2024 08:53:15 +0100
Message-ID: <faad839a-4c28-449f-bd87-845b47a1a6a1@leemhuis.info>
Date: Fri, 23 Feb 2024 08:53:15 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: drm/msm/dp: runtime PM cause internal eDP display on the Lenovo
 ThinkPad X13s to not always show up on boot (2/2 regressions)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1708674797;60a4155f;
X-HE-SMSGID: 1rdQMt-0004K3-S7

Lo! Johan reported a second regressions
(https://lore.kernel.org/all/ZdMwZa98L23mu3u6@hovoldconsulting.com/ ) in
a thread about another related regression. Tell regzbot to track the
first one separately:

#regzbot introduced: 5814b8bf086a
#regzbot title: drm/msm/dp: runtime PM cause internal eDP display on the
Lenovo ThinkPad X13s to not always show up on boot (2/2 regressions)
#regzbot monitor:
https://lore.kernel.org/all/ZdMwZa98L23mu3u6@hovoldconsulting.com/
#regzbot from: Johan Hovold <johan+linaro@kernel.org>

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
