Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B296D8BEA
	for <regressions@lists.linux.dev>; Sat, 18 May 2024 09:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716025158; cv=none; b=pRt/z9HASaVzU2pByg4uT+foOZMFCV8VhZI+nOMWGUgOLzr9BRMPE5MCkjYx5vgcuqGDzN+7SlCs27kUkg3kUSS041iMKRLdc67pMWvrXKpJJRbXsKIGQW/ei5Rpw+gwOvgfWT7FO+1D87AGg2jly7+HAMRT366H5w7pBzBHf98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716025158; c=relaxed/simple;
	bh=txP8iiyjY0UQLYEJz7u5/o5oPCvX/CGsMxWmOf8mBww=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=psn+/teHZ7LEBH9546C/Ot2HkfFSShX6tje6WpTwv92NVRZ5rUaHWOEOTi3uZ55kiC3cyxYStozK/5YtO5rmYNxQh0+WeQzOfJjWGI0x1GKeMAzCyodKjQ8bsozVtWVFFe4w8ltx8NJ+58H34HjwOatGqyqz04GJmhN4a41wxso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=fIPb2byq; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="fIPb2byq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=NdrDlCQVfogWRg8lqbVA72VGRMV69EpCT4VpIOBvpoo=; t=1716025156;
	x=1716457156; b=fIPb2byqhn3FFfWp1LHXTTtxm1ZuaG3SZpDLfLJ4o/rur3q6haEQY2kXfNEYf
	JYr0TjM+Q7o/18ptBWReij7N44kWn/GN4KX4/+QQTpkHQ5HOG6zqn8OaBDGo5rNTKYyacOhj1Iu6g
	v/B/LB37XLkxKk/i19p9WRvTcuXhTNnrsThZcKlLUQsxoUVuXLaaJC0a3i0zIqYkgTcQGgXbBXEfH
	+aLQwpcuf8Qa2hJ3cl98Z9g/BlLtr1297/ontlQyHPqyf9Kppwgca4e9jP2orTBpXmGQlXRjceC1/
	23dsQbokW+vxpdgWCaPRsb6zB3PrIZ9UGU+HkV7TglNl+kj7oA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s8GWy-0008NJ-U1; Sat, 18 May 2024 11:39:09 +0200
Message-ID: <b91b99b2-cdc9-489b-91ad-5213eafcec73@leemhuis.info>
Date: Sat, 18 May 2024 11:39:08 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716025156;32e4bc66;
X-HE-SMSGID: 1s8GWy-0008NJ-U1



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/ZkLv3wn62jqMVpSF@archie.me/
#regzbot introduced: 6bb6fa6908ebd3cb4e14cd4f0ce272ec885d2e
#regzbot summary: tty: n_tty: corrupted data sent via pseudoterminal device
#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=218834
#regzbot monitor:
https://lore.kernel.org/all/20240514140429.12087-1-ilpo.jarvinen@linux.intel.com/
#regzbot fix:
https://lore.kernel.org/all/20240514140429.12087-1-ilpo.jarvinen@linux.intel.com/

#regzbot report:
https://lore.kernel.org/all/20240513135302.1869084-1-dev@kayoway.com/
#regzbot introduced: b8b8b4e0c052b2c06
#regzbot summary: ata: ahci: SATA ports to become unusable due to LPM
#regzbot fix: ata: ahci: Revert "ata: ahci: Add Intel Alder Lake-P AHCI
controller to  low power chipsets list"

#regzbot report:
https://lore.kernel.org/all/0111018f7508efb1-1206661a-d4b5-4bd1-b54f-ccb8504b8b4a-000000@us-west-1.amazonses.com/
#regzbot introduced: v6.8..v6.9
#regzbot summary: i2c-hid: Touchpad Sometimes Fails To Initialize
Properly On Early Boot
#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=218836

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218832
#regzbot introduced: v6.8..v6.9
#regzbot summary: ide: ACPI cmd f5/00:00:00:00:00:a0(SECURITY FREEZE
LOCK) filtered out

#regzbot report:
https://lore.kernel.org/stable/20240506182331.8076-1-dan@danm.net/
#regzbot fix: a222a6470d7eea

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218845
#regzbot introduced: 4379f91172f39d999919c8e8b2b5e1d665d89
#regzbot summary: power/vfs: kernel panic in kernel/power/swap.c
#regzbot duplicate: https://lore.kernel.org/all/ZkVvuKHV-jdOMnB1@archie.me/

