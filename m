Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B7E1922C1
	for <regressions@lists.linux.dev>; Tue, 30 Jul 2024 08:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722329402; cv=none; b=sPwqVZC/cMD8fIlT48pIekuyD0P8HD6nydKvWFzR7JYMR97V5hmUu5wPiP/lWuP9Mk4UNOGgYvtMvliBfLoFPvMX+lVgowzdpGa/OmLVYluHTI8d2k09xyfuAciGP5yTfKzIa42hp+MGnWFORwhf+dgSCZatV2aNlP//bf6U+Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722329402; c=relaxed/simple;
	bh=9f7R6K5BTl5LADmtJGwoP+f/Fql15WULrECDRFWGUv8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=UFfv3bfamWRZW3Qg7q6D4ARzAGIw2G2biU5eL4ZRP4n8dppWYia5hyHEoLxmBWUb1tq6/wGoEUWAHwLqQD11GZEyq877RTd622wNHOGUx+Kd3fifxX2KRc3fAOdMGfwl1jJJrog6XTokyNA5SLY67A4R84z3pyeJZ8GeSeY/NmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=IFyiotVa; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="IFyiotVa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=9f7R6K5BTl5LADmtJGwoP+f/Fql15WULrECDRFWGUv8=; t=1722329400;
	x=1722761400; b=IFyiotVaJVYE6J7PKcMoTBO88z9kgnC5icookwPiRkeWfYjpRBP/Jmgtb9cTX
	AzWxvhw95srSPLtlAC2Zi0a9l+7kkbv06JDCV1yz/IgJBcwjh4wMBSzPhQI90Z+j0SKtX7yl+b9BL
	ISQ8a+OZKrMl465xdrSiilJsDKS+TASY4dkV1yr3Xa/ecpLbjq4yECcLP31GLYg9IpUy3wdWQkkTZ
	/cPW7XXpD+XV8yH4nwrYD28GVLVdVyZVSAhDEaL/DZ2OZ1gDFBcA8d1X2uvFWJsun+RuJCfDwMzOW
	5nbXsG/LOOgswl+asnHokV3CeNkIMmsBHDD4mEocgUdTCrKA7A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sYiYK-00045J-2g; Tue, 30 Jul 2024 10:49:52 +0200
Message-ID: <5fe86a20-ca43-491b-8140-1b1cd2c2ef68@leemhuis.info>
Date: Tue, 30 Jul 2024 10:49:51 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1722329400;45695414;
X-HE-SMSGID: 1sYiYK-00045J-2g



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/9952f532-2554-44bf-b906-4880b2e88e3a@o2.pl/
#regzbot introduced: 13fe8e6825e4..86b1e613eb3b
#regzbot summary: md: filesystem corruption when adding a new RAID
device (delayed-resync, write-mostly)

#regzbot report:
https://lore.kernel.org/all/27e6a6c5-fb63-4219-be0b-eefa2c116e06@penguintechs.org/
#regzbot introduced: 80ab5445da6235..586f14a6a182
#regzbot summary: bluetooth: QCA6390 broken

#regzbot report:
https://lore.kernel.org/all/20240729131351.27886-1-johan%2Blinaro@kernel.org/
#regzbot introduced: 378918d59181
#regzbot summary: ASoC: codecs: lpass-macro: audio broken on Lenovo
ThinkPad X13s

#regzbot report:
https://lore.kernel.org/all/20240729141928.4545a093@imladris.surriel.com/
#regzbot introduced:
#regzbot summary: mm, slub: slab corruption

#regzbot report:
https://lore.kernel.org/all/1f76b7e2-1928-4598-8037-28a1785c2d13@redhat.com/
#regzbot introduced: 2b2b0ac1533
#regzbot summary: ACPI: EC: Brightness up/down problems and as well as
EC related ACPI errors and bad performance
