Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C23199939
	for <regressions@lists.linux.dev>; Mon, 11 Nov 2024 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731334733; cv=none; b=p91Pfp6nP72et6W3DApTF6/slwl1okVShSuL8MlzHK03NtXlpVlrXdcEMytzdpXwTdMZ28eRCgZvm2s+xjy5Jc/0n4cbFoGwhmmSADU4vPrBxaa8vp3iCgPfg/JMgZkBcYhRjN4nuM3PXLsXF2CBADTDoqZrk9qjLH9AytQ1xbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731334733; c=relaxed/simple;
	bh=Tbv7JWTiBvuVSjQ0N1wOXDB/Tdc2MAIBwoe4A+8oyr0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Z+5ButxCWJe6Y7DKqMznlMoLxAs8OvrYN9qyrj9bX5F7pnVAgjj78Pg4j5Sf6d0ZID8Qa11w4JXXVrrkSNp23Cw96Ien/z2GAMKlAcdvvpNC7WIAoFeI+hA3WmoNVekwTowUnAhfd+7NHby45kVO5S06jqZSlwHvILFs2JzWxQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=wk8kPjbJ; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="wk8kPjbJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Tbv7JWTiBvuVSjQ0N1wOXDB/Tdc2MAIBwoe4A+8oyr0=; t=1731334731;
	x=1731766731; b=wk8kPjbJonDbZR/wgdpzZvFn7prXu/hYkcfKeNi3MNAB3x5rb8ysoINNnuv6w
	cmhbusUdzD+XK2Kj2/dYhutRHE3WXm88Q9sxY800Osupcm0MQhwJsDFeP/jDQ03WRB9z6AUzWSk6m
	5KHGOSTCMN5sOpyfHZRGgpXLACbF90bNv3kS8TACI9a3aPNDMO5tR2ieSgTavX3ApOqRjpF79P0rk
	gDtQwyCrSV00llJ8soL+0Tv+jl8DXdURGs4UuFU/bc5KjctrF0L8yXcSqKPpvXFlZUII7XUC/kXxV
	H2Q0czEe3ROZ/8sWMZ4OatzmNGBC1huZzX0Cc2KYkBABV2GyuA==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1tAVFc-0001zc-EH; Mon, 11 Nov 2024 15:18:44 +0100
Message-ID: <51bcbc70-3770-4c89-ac49-c0fb31505284@leemhuis.info>
Date: Mon, 11 Nov 2024 15:18:43 +0100
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
Content-Language: en-MW
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1731334731;1196175e;
X-HE-SMSGID: 1tAVFc-0001zc-EH



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl/
#regzbot fix: 8d3cefaf659265a

#regzbot report:
https://lore.kernel.org/lkml/1474761635.17820466.1721651484902.JavaMail.root@zimbra60-e10.priv.proxad.net/
#regzbot fix: 6b99068d5ea0aa29

#regzbot report:
https://lore.kernel.org/linux-nfs/d4b235df-4ee5-4824-9d48-e3b3c1f1f4d1@oracle.com/
#regzbot resolve: fixed by fixes
ttps://lore.kernel.org/stable/20240810200009.9882-1-cel@kernel.org/

#regzbot report:
https://lore.kernel.org/lkml/MEYP282MB2312106710775098261AB348C68C2@MEYP282MB2312.AUSP282.PROD.OUTLOOK.COM/
#regzbot fix: 2116988d5372aec51f8c

#regzbot report:
https://lore.kernel.org/lkml/CAJM55Z9hGKo4784N3s3DhWw=nMRKZKcmvZ58x7uVBghExhoc9A@mail.gmail.com/
#regzbot fix: 4d936f10ff802

#regzbot report:
https://lore.kernel.org/lkml/20240926002533.10153-2-bendhoefs@gmail.com/
#regzbot fix: 2f54e71359eb2

#regzbot report:
https://lore.kernel.org/linux-serial/7hzfplplfs.fsf@baylibre.com/
#regzbot fix: 0863bffda1131fd2

#regzbot report:
https://lore.kernel.org/linux-ide/7882faa8-d5ec-4868-b158-0b942b669cc0@gmail.com/
#regzbot fix: a38719e3157118428e34fbd45b0d0707a5877784

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219331
#regzbot fix: c56f9ecb7fb6a3

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219083
#regzbot fix: 36bb22a08a69d998


