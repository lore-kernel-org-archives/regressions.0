Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E66B1361
	for <regressions@lists.linux.dev>; Thu,  9 May 2024 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715250870; cv=none; b=oKd6CrW4gdh4puKkqi4diJ6LwUuzD338zBLQabMa1+3LYz02PegNdzwJc5CKgW7mpLvtm4+p+A/PZ4IveoNo6M0xDkLpwnv8/rnL3XiCFYhqUmMq9EPwTk7CbFYGe6d5Gm05OK1+/m4xuWuqRGQQcw/kQshEnEHZwvANKz59sno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715250870; c=relaxed/simple;
	bh=kxcuCYHEmblCbSXOWyBBniw6flgEgQdyphgO+CGmbpk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=FBFqxW4tFk26YH3Js+itvGd729etZC72ofKJ9Busd1Folhcwj2pkQtmo1/z7aAsoueftKalGTKGgPAqImw25bd6jJPMqxktSqvpXPXsGK6GJb2+ciMB+nX43/kpMTQ3t17oA5/mbGmcsU78OclKvoaEL7L7e4KGf0tI/NV36X28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=LKEnxWP2; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="LKEnxWP2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Reply-To:Subject:From:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=kxcuCYHEmblCbSXOWyBBniw6flgEgQdyphgO+CGmbpk=; t=1715250868;
	x=1715682868; b=LKEnxWP2MEH44xrFBPj2hO21AT616R4eBNkDCbDifaVYVllD+65YoNh311DY3
	gZCk109sqN4uRPqy6AHFOc3Z/dbx/cCAVCDdnHF98K8HdT5358lPmTzwLOBPB4pH7VKK2o6sosFg1
	tI4KLNGqc/xYcWKZOOY2qLfuiCxA7575nagL77H8bITHJa/eMHrsE41+5mgV88ytXFxA9rAHDXtMF
	hh5Xq1kWVY6HvmWjtUk4lJw4Bc7x6MzinQHHosf4+8up+cMp/WwlNTDnpzLf6wpmDHFuvbCYWCKsW
	n/SBZIjQEfLnyZnfcN3lzHiQlTXe4P110VsMOpQPrIVUID3pug==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s516Y-000780-B9; Thu, 09 May 2024 12:34:26 +0200
Message-ID: <cb7f7054-9540-4540-9850-786737de156b@leemhuis.info>
Date: Thu, 9 May 2024 12:34:26 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1715250868;0b05e883;
X-HE-SMSGID: 1s516Y-000780-B9



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/13a313c7-c214-4d49-9029-c79b503c17dd@canonical.com/
#regzbot introduced: fd27ef6b44be
#regzbot summary: virtio-pci: suspend/resume
problems in public cloud

#regzbot report:
https://lore.kernel.org/all/20240506182331.8076-1-dan@danm.net/
#regzbot introduced: 52a6947bf576
#regzbot summary: nouveau: init failed, no display output
#regzbot duplicate:
https://lore.kernel.org/all/20240506185910.17917-1-dan@danm.net/

#regzbot report:
https://lore.kernel.org/all/hzhomd7d7uc4dcnpvd6ki6v2f6camzm5ufqp2syqudrvzzfxi4@ykcirhonbqql/
#regzbot introduced: d2689b6a86b9
#regzbot summary: net: usb: ax88179_178a: unable to send or receive
packets unless set to promiscuous mode

#regzbot report:
https://lore.kernel.org/nouveau/2775775499487396fbad5c2327dcaf7fb88a524d.camel@nvidia.com/
#regzbot resolve: fix applied -- but culprit gone from -next, too

#regzbot report:
https://lore.kernel.org/all/eec6ebbf-061b-4a7b-96dc-ea748aa4d035@googlemail.com/
#regzbot introduced: b5fc07a5fb56216a49
#regzbot summary: scsi: core: system stopped booting

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218090
#regzbot duplicate:
https://lore.kernel.org/all/20240508154950.GA1768252@bhelgaas/

#regzbot report:
https://lore.kernel.org/all/20240508154950.GA1768252@bhelgaas/
#regzbot from: gloriouseggroll@gmail.com

#regzbot report:
https://lore.kernel.org/stable/gifkxwcrswqevdig33inrsieahso2lcxbhcawu6d2qprnujoij@eqg53vwjamts/
#regzbot fix: drm/amdgpu: Fix comparison in amdgpu_res_cpu_visible
