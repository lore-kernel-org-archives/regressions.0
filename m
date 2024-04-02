Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6228613B
	for <regressions@lists.linux.dev>; Tue,  2 Apr 2024 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712068074; cv=none; b=HRcgNG21t+m2vrInikchmuOpc+X53LwrtvS8Q/Xu2FclUTvQKlwLCyvFldKav/Ppn4wSHz1bbKvS8Lf6L6fsUIkT6st5edQSW2o8irJhkFQKCSjgaDm4GLgIoggLof7XcNLY7+SW4BH6Y7kMNZasCNKta2nSJ259lnzAt05mXkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712068074; c=relaxed/simple;
	bh=+LNj2wIrX5jIYj39pkuddXgxyxXWBjCdB6mY+6X2yhM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=jIycvRnAfDIP9z6TnUU8SGt179329pWAkxhTee5IGBsv/5ve2VWkYwKadeOu6QTyXE54RB2pcLcZCneF8DQ+aeMbNakyaDY46VgXDKVDmhpylq5NFtyvih8J2LdPgY10HcfIqJfG50PomhWg57EhW3pmtXPDqAaXkFJnFp6OuLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=haqKyz5h; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="haqKyz5h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=IgxiAZJREUEPBT/4iHFGDvMKVJ8s0R3H0CuF+kWvncE=; t=1712068072;
	x=1712500072; b=haqKyz5hhPqVxnZwnEugoKc8Azfox4td5KBSjcZ72NX0Tix4BOVea6e7lrDLL
	MvLozpqN0TOGqIBgOpVjDKHujVZJmdTgBIpHwS04E9YFB0LgSBDWN7S3hfp5Y0sWNm5CLF0OMk3zs
	Nkc8DDdTb180eyxraYlsVjkaMSwJJ0aspOpqsAhdae2W8spjkbDvskOgPtwfbS+aBVPlAshoU7WxG
	90SemR8PxpFlUEqEBaO9FFUwSV0wHo5bQ3fLmQxGqx9q81q/ENpcNnzdrxsEsEz72YDbFd84hyGLL
	ETHspDCppxcmL6pIMGgLOpYaSLquhPwe3DYqXVamKBOvFHJ2Gg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rrf79-0005CS-4v; Tue, 02 Apr 2024 16:27:51 +0200
Message-ID: <8a8ffa16-625e-4eb2-9bf9-aefd24f561d6@leemhuis.info>
Date: Tue, 2 Apr 2024 16:27:50 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1712068072;2af0d493;
X-HE-SMSGID: 1rrf79-0005CS-4v



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/stable/a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com/
#regzbot fix: 53dea95c23f76c

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218484
#regzbot fix: 7a62d444a252ea

#regzbot report: https://lore.kernel.org/lkml/ZcNdzZVPD76uSbps@eldamar.lan/
#regzbot fix: b478e414cf85cf

#regzbot report:
https://lore.kernel.org/lkml/Zf25Sv2x9WaCFuIH@hovoldconsulting.com/
#regzbot title: clk: qcom: gdsc: lockdep splat

#regzbot report:
https://lore.kernel.org/linux-fsdevel/Zf2zPf5TO5oYt3I3@hovoldconsulting.com/
#regzbot title: fs: ntfs: obsolete legacy driver and a bunch of  warnings

#regzbot report:
https://lore.kernel.org/lkml/08275279-7462-4f4a-a0ee-8aa015f829bc@leemhuis.info/
#regzbot introduced: 63298d6e752f

#regzbot report:
https://lore.kernel.org/all/bdea97a5-93e5-471f-88fc-a3c6ae74970a@hansg.org/
#regzbot introduced: v6.8..v6.9
#regzbot title: gpiolib: triggers: kobject: 'gpiochipX' is not,
initialized, yet kobject_get() errors
#regzbot fix: gpiolib: Fix triggering "kobject: 'gpiochipX' is not
initialized, yet" kobject_get() errors
#regzbot monitor:
https://lore.kernel.org/all/20240402134334.173409-1-hdegoede@redhat.com/
