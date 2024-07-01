Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA83315990C
	for <regressions@lists.linux.dev>; Mon,  1 Jul 2024 12:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719838566; cv=none; b=mms/3MS8y0ror54wzrhFParxT7uzqhgLquFL929fJatSarX7Dg+KrK3/XSkIWv9UFNW7j4bKOx1+hGoYkshJLI59btHYTsD1Ki6MGUTy7/p36E0k9hRcEX1bZnXSYIK1dDpwAqiElNKUem9dyXMlxgN8LwxkE3upvw871RQn4tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719838566; c=relaxed/simple;
	bh=ymeRYDkDFyj2blcTHiN/CKTx37liY8ukVFboMDmLo90=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=cK8RNcLJ5yvClpq2LbNs44EMGaJJf9sUaeRRpn0bN1KuwXQwTPM7mrPKn0fVimk7WmUB1dIGN/Hr1k5nFkgvn7VlivHQ91u76nm89iX/Eqh6DtoYjQyNdT7hABvhM2K9rWV0nj+P7Dj2uxhc4NXlKzNzSbPnqZDrZNnwcDEXWuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=qeOVj8Tx; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="qeOVj8Tx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ymeRYDkDFyj2blcTHiN/CKTx37liY8ukVFboMDmLo90=; t=1719838565;
	x=1720270565; b=qeOVj8TxYB0zmHpY2JB7XIXnmkHMnBw45zR+Thx1NHLLA9BqEtz8lCi/HhfQG
	XVpWtKnAK4Jwx03m8gF0rhoz5nMs3W6k8Sd87juyD+AyOjwozhjuorddoO00vTcjfS+34tXL6gcjc
	TAbMDLyciOx2zzkenVm7YnBXP6A4HtcrpR54urclVkoUVLPNVyHtO8mfFjd8XwEmt230V0GjR9T0M
	rW94IMSY0J82v1web2XDl2+KFOqzPMP9Pxn+wCXl9sdorhz5azo5mcia1CwBjYMp+rEhj5ZHMlCHg
	zlPeZIVs0nEmtIQG9RVS1CvK7BqHDiIcJ0/dl11nJXnEW8K6qQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sOGZe-0000LO-Tu; Mon, 01 Jul 2024 14:56:02 +0200
Message-ID: <aa18b913-63e3-4019-afc2-61d522130fbe@leemhuis.info>
Date: Mon, 1 Jul 2024 14:56:02 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1719838565;ad776fd8;
X-HE-SMSGID: 1sOGZe-0000LO-Tu



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/87tthpwkqf.fsf@gmail.com/
#regzbot relate: https://lore.kernel.org/all/87ikxqs0tj.fsf@gmail.com/

#regzbot report:
https://lore.kernel.org/lkml/wL3vtEh_zTQSCqS6d5YCJReErDDy_dw-dW5L9TSpp9VFDVHfkSN8lNo8i1ZVUD9NU-eIvF2M84nhfdt2O7spGu2Nv5-oz9FLohYO7SuJzWQ=@micha.zone/
#regzbot resolve: inconclusive: reporter MIA, maybe device was not
authorized

#regzbot report:
https://lore.kernel.org/lkml/20240601132459.81123-1-aford173@gmail.com/
#regzbot fix: drm/bridge: adv7511: Fix Intermittent EDID failures
#regzbot relate:
https://lore.kernel.org/all/20240630221931.1650565-1-aford173@gmail.com/

#regzbot report:
https://lore.kernel.org/all/5792762.DvuYhMxLoT@devpool47.emlix.com/
#regzbot fix: kbuild: Use $(obj)/%.cc to fix host C++ module builds
#regzbot monitor:
https://lore.kernel.org/all/20240624-kbuild-fix-xconfig-v1-1-7c06eae6d3aa@avm.de/

#regzbot report:
https://lore.kernel.org/linux-scsi/Zmi6QDymvLY5wMgD@surfacebook.localdomain/
#regzbot fix: 57619f3cdeb5ae

#regzbot report:
https://lore.kernel.org/dri-devel/845642ff-ba16-4066-aad0-f0d68a47d865@suse.de/
#regzbot fix: firmware: sysfb: Fix reference count of sysfb parent device

#regzbot report:
https://lore.kernel.org/lkml/13a313c7-c214-4d49-9029-c79b503c17dd@canonical.com/
#regzbot resolve: inconclusive: reporter MIA, but likely resolved

#regzbot report:
https://lore.kernel.org/linux-nfs/aaeae060-2be0-4b9f-818c-1b7d87e41a5f@molgen.mpg.de/
#regzbot fix: 559427332ab9f4

#regzbot report:
https://lore.kernel.org/lkml/ZaQS5x-XK08Jre6I@smile.fi.intel.com/
#regzbot fix: c50814a288dcee
