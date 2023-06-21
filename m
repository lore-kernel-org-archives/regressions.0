Received: from mailout.blnma.de (mailout.blnma.de [116.203.12.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7611E1DDD5
	for <regressions@lists.linux.dev>; Thu, 22 Jun 2023 00:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=starostik.de; s=dkim210803; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uu+2SHhBiQ1uimHyfpXUI941L2mRtfYPG3HcNeup1dM=; t=1687392073; x=1688256073; 
	b=GOcY6wgDzpTX/Xp+RJXniNU9yTUoirICq5Y12YNo4sU6rETpTYDonw/Evha7KFmRgoOxLWWYZgO
	oZUpEhhT9TtCd29uQqES7kAVX5YhFLg6S8S/9ODQiyQO95wVcPR+GLS6eL6rzoHURnXUmCVJzkkh5
	WAF1vTayGOszwETjf8DTzM0w5LVu/zExnzmVGQOLDg014RYDzbVgjtzZ5C+4GA6rTV+pwtMxJf8HO
	zFbIHQIlYyRZ3mnOzBPKzU5LSUuI/JVRAJQvzHrSE48IGUADGcSubXBRDdxS5SdvCpok1rG6tN/cj
	NGnJl6bbOBW55PB0ytGyqK/LbV6H0k6ix6aw==;
Received: from dovecot-0.dovecot.mail.svc.cluster.local ([10.244.6.208] helo=mail.blnma.de)
	by mail.blnma.de with esmtp (Exim 4.96)
	(envelope-from <malte@starostik.de>)
	id 1qC7SJ-00075k-1l;
	Wed, 21 Jun 2023 23:41:43 +0000
Received: from zen.localnet ([85.183.148.49])
	by mail.blnma.de with ESMTPSA
	id tNNfCLaKk2SEGgEA399c4A
	(envelope-from <malte@starostik.de>); Wed, 21 Jun 2023 23:41:42 +0000
From: Malte Starostik <malte@starostik.de>
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, basavaraj.natikar@amd.com,
 linux-input@vger.kernel.org, linux@hexchain.org, stable@vger.kernel.org
Subject: Re: amd_sfh driver causes kernel oops during boot
Date: Thu, 22 Jun 2023 01:41:41 +0200
Message-ID: <2426092.W91McpcXCD@zen>
In-Reply-To: <602504a5-334d-92e8-2fd3-f7e8662b714e@amd.com>
References:
 <ZG3ipauL9FTnQJiC@debian.me> <f677a16e-1fa2-3f45-2b44-5acbf67aad3c@amd.com>
 <602504a5-334d-92e8-2fd3-f7e8662b714e@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 20. Juni 2023, 22:03:00 CEST schrieb Limonciello, Mario:
> On 6/20/2023 1:50 PM, Limonciello, Mario wrote:
> > Anyways; I just double checked the Z13 I have on my hand.  I don't
> > have the PCI device for SFH (1022:164a) present on the system.
> > 
> > Can you please double check you are on the latest BIOS?
> > 
> > I'm on the latest release from LVFS, 0.1.57 according to fwupdmgr.

I was on 0.1.27 while running the tests.
At least when I saw the errors first, there was no update offered. Haven't re-
checked until now.

> Hopefully the newer BIOS fixes it for you, but if it doesn't I did come
> up with another patch I've sent out that I guess could be another
> solution.

After updating to 0.1.57, it looks like I cannot reproduce the error anymore 
either.
 
> https://lore.kernel.org/linux-input/20230620200117.22261-1-mario.limonciello
> @amd.com/T/#u

I tested your patch before performing the firmware update. Still got the Oops 
just like before.

BR Malte


