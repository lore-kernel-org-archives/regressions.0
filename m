Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA24415A499
	for <regressions@lists.linux.dev>; Thu, 18 Apr 2024 09:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713431772; cv=none; b=edKRgSBVE2iJOWbsvOwcy+hUbR+GtGTR043DUXqsrnCLgoHxv7tVy91pc/Fx+q1IMxm4jLNcY8KM+C997fnTzaIaaeFuuDO+QaWgBAvSremEW/BUqhyUEMCDNN4n6vQxQZgbao5+pI5WTZFTr9z9XpbidM0M1tMYHDYgfC6hZwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713431772; c=relaxed/simple;
	bh=ImpkQR9Hd36bUXw8MvO5DJT4dVqY5BIM4/1EN5Z2W14=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Op1yXgCrflKLnfmnc86BLihr6NvvDZCNpWezg9LUVXUSVo0oj24wC+mkA4uytzNPtA6VPQPijmQk2psd+TgtHoicXPkMO53SrLPQtTaxkp3hKzqMu/ESLivKyku6757tKLh/mtkBhvLFMCxRdPc786gxtsKUsgXNLo0X06aIvns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=nwMQgH8i; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="nwMQgH8i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ImpkQR9Hd36bUXw8MvO5DJT4dVqY5BIM4/1EN5Z2W14=; t=1713431770;
	x=1713863770; b=nwMQgH8ig4DBZGDxr5aY3oo9nTl2Iv+Xs7jsy77UIcbopkuOxb9EPltCuKXIg
	Zrmh7TLJshhUtN8FHW53IzWhZgG7WfSLWbCky8pWXhLvChC9NHlDmIwDm8EAj/FfUmk84tFIZiZnB
	CQZ+gMfhOeVLL4uACBv7Zd1Zl4w/04Y9cnRp2GqXz/0UWhuFVVwXO4oEo+ZBKPfkNoY1aFJqjCDYk
	KVK9YMIEnEgj721/cRCszPtSRaI26Kbtflf6rAl6819VVeni+FjdFVDxiJOeKivC5omOvxfkt/Brc
	nKLrYq0JQu3uxVS1aiNwGhNPwgLbaYJG/dJ+rt4Loagy6ypkOw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rxNsG-00038J-C0; Thu, 18 Apr 2024 11:16:08 +0200
Message-ID: <92377e46-5eca-4c0b-b0b6-58394916abc3@leemhuis.info>
Date: Thu, 18 Apr 2024 11:16:08 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1713431770;70bc258b;
X-HE-SMSGID: 1rxNsG-00038J-C0



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218726
#regzbot introduced: 56d074d26c58
#regzbot duplicate:
https://lore.kernel.org/all/a03dace1-ca0f-41d6-8e2c-636e3b053a3a@penguintechs.org/
#regzbot summary: CA6390 bluetooth doesn't work after warm boot or
disable/reenable
#regzbot fix: Bluetooth: qca: Fix QCA6390 enable failure after reboot or
disable
#regzbot monitor:
https://lore.kernel.org/all/1713354823-17826-1-git-send-email-quic_zijuhu@quicinc.com/
#regzbot monitor:
https://lore.kernel.org/all/1713175927-13093-1-git-send-email-quic_zijuhu@quicinc.com/

#regzbot report:
https://lore.kernel.org/all/3iccc6vjl5gminut3lvpl4va2lbnsgku5ei2d7ylftoofy3n2v@gcfdvtsq6dx2/
#regzbot introduced: 7108cc3f765c
#regzbot summary: mm: Null pointer dereference while shrinking zswap

#regzbot report:
https://lore.kernel.org/all/aeee83d8-dee3-42ed-b705-988b17800721@gmail.com/
#regzbot introduced: f49449fbc21e
#regzbot summary: usb: gadget: u_ether: issues with a mrfld, like a
missing net device

#regzbot report:
https://lore.kernel.org/all/1f22520948180e55125fdc686a0de8a93c317e5f.camel@ew.tq-group.com/
#regzbot introduced: 6ccf50d4d474
#regzbot summary: net: dsa: mv88e6xxx: timeouts

#regzbot report:
https://lore.kernel.org/linux-scsi/565c6b0b-137f-4d72-b8c6-eb3d34592808@acm.org/
#regzbot resolve: inconclusive: apparently nobody cares about this
performance regression anymore

