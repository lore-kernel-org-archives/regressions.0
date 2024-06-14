Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0604195F00
	for <regressions@lists.linux.dev>; Fri, 14 Jun 2024 11:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718366285; cv=none; b=Z/C7CLBjN54X7sFpMGGV/e2DGTwKPWegIbjm8pUOBhTsHP7/3KFUWOLmrBOGnC8JDZI2uM0h9IKcfDOjhPNg8C3qa8E7uQufiyZrt95+4lPvsBiQaB7yCF4igoE5bSPuJayep7aAOJ6y8RPHHXTWgBJogUiRxNF3XCheZPR56sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718366285; c=relaxed/simple;
	bh=gmejPbVGtpOc7QsM/XPi5VtNOQ5sTbkOK7nYwbb7TVE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=TY+5jBKr7+0dpOObC/kiXefnaio3wrY5J3/F/J88iuJsoihZ61c3k5gABV6IWPZebtNgXwcaXKTkgRvVpU/xQZ77+pcF2srfLVaCeMSl8psjNg8B82BEzT2Rp5hpywKyzVE96QAF+QLTp3qgHlxsB1AyF2XM2ZWc+xZZlubAjKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=BxxroECE; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="BxxroECE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=gmejPbVGtpOc7QsM/XPi5VtNOQ5sTbkOK7nYwbb7TVE=; t=1718366282;
	x=1718798282; b=BxxroECEYw5RtCAHODgJ7E6YVH6sDXWDe4rkrBfVsTWLaNAB1ecsC4uBkL4Yp
	eZCFM6WntQqP9mnTFAVLums4/DDtCM/TkhL++alfhmzHvDAky0f9o++qrS6mUAEbbspDVjjaLZvvD
	q0UZORXS/uaKGkqWVCtEACmOiGflD++NOu+T5NDyS5Fc+4OdMrLvghZpwxHzQy1PJ6VHUqhgmdf56
	6h1lFyREwxOFGZxTz55vBeeHcOIbOCHkrWAMqxMPpUeXHX8CSJQejWz2btolgU8G/qpsHZ2egap1C
	xEPBTnSoOYq8vUALdq1cxEGlU7XtPVVAloxuvLHrJykq2NYTjA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sI5Z4-00022N-Qw; Fri, 14 Jun 2024 13:57:54 +0200
Message-ID: <fc203419-e550-4b58-83e1-b2340811faeb@leemhuis.info>
Date: Fri, 14 Jun 2024 13:57:54 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1718366282;e79871fe;
X-HE-SMSGID: 1sI5Z4-00022N-Qw



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/ZmVfcEOxmjUHZTSX@hovoldconsulting.com/
#regzbot introduced: 042a3d80f118

#regzbot report:
https://lore.kernel.org/lkml/CAHe5sWavQcUTg2zTYaryRsMywSBgBgETG=R1jRexg4qDqwCfdw@mail.gmail.com/
#regzbot resolve: inconclusive: apparently cable related

#regzbot report:
https://lore.kernel.org/all/c0de8262-dc4b-4c22-9fac-33432e5bddd3@t-8ch.de/
#regzbot title: ata: ahci: GNOME/udisks started automounting internal disks
#regzbot link: https://bbs.archlinux.org/viewtopic.php?id=295958
#regzbot link: https://github.com/storaged-project/udisks/issues/1282
#regzbot link: https://github.com/util-linux/util-linux/issues/3088

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218953
#regzbot introduced: 169f9102f9198b04afffa6164372a4ba4070f
#regzbot fix: ARM: Remove address checking for MMUless devices
#regzbot monitor: 169f9102f9198b04afffa6164372a4ba4070f412

#regzbot report: https://lore.kernel.org/all/ZmrTZozoi0t%2Ftuva@duo.ucw.cz/
#regzbot introduced: v6.9..v6.10-rc3
#regzbot summary: performance problems on Thinkpad X220 (GPU working
harder and causing throttling?)

#regzbot report: ttps://bugzilla.kernel.org/show_bug.cgi?id=218902
#regzbot fix: 02c418774f76a0
