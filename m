Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE7213DDAA
	for <regressions@lists.linux.dev>; Mon, 14 Oct 2024 09:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898497; cv=none; b=skPf+16RFDoAQ3TSCYGSI8A4WBVUm9KPWFxtSnTMS0XEKV2ZTHfPDk5KkphqirtRqhtgjIh3ty6+MqL7m/tNmVGVIEJOXD5pc9tOg24rr3/311tifpau0OpPBn3afXIy26BgW4qtWj1vpIWfTrfodmngvV0RUYKiohi4vFnKXU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898497; c=relaxed/simple;
	bh=L3DBgQ5phEFYuateI1fBdQJApYJ6razJjWWR+mQrn4A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=TmMk5Kl/hFWzmZQELQDcKNc4x2CxgK5xRI/tffoZyKybE81DpF6iECz7cJ9u2Ge9Zi+Pf5q6YBOxetD3l4UaKINm7PgSRO2+MEzx1s+g/uWoHEXTUT77SmmqFYkeK2T5ZGavf/rN75tGMOV3CP5e48JepPk34lzE2QphoXKcrmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=A05ZOxYv; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="A05ZOxYv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=L3DBgQ5phEFYuateI1fBdQJApYJ6razJjWWR+mQrn4A=; t=1728898495;
	x=1729330495; b=A05ZOxYvuNNhDd1VNfx5eOZ5VDLkLxYmxpSRPkJPd4sOCWJg0YQr0RuJGXDm7
	TolqtyKkfBaq80PKQku6JJIp7fOdOSJqoSn9PWokgJuNEwi+npY3WmLKtx7ZLCfks84O3Q5I8mdOH
	vVukYkuiRdTTeanWB4jHUhfDKDwOb4ZgPtrUsuQsl0L9wOUNMvXe5xAklcrB9xw4nPebVB1L2WwBC
	ZLFef6vlkvcaYokEfeLV+2WsRQuKftb7zMSzmHnS1F5Fi2wwFAca0kGzEWClbaU3M7MtTWxDo6ya5
	ftxJjS5BajoPrlxjgSnWew6O1lrOjSm7ibT7/2pOhtz7tScu+g==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t0HTZ-0002iB-Rq; Mon, 14 Oct 2024 11:34:53 +0200
Message-ID: <aa41410d-d6e4-426d-bc3b-bf09a1337ec7@leemhuis.info>
Date: Mon, 14 Oct 2024 11:34:51 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1728898495;94ce871d;
X-HE-SMSGID: 1t0HTZ-0002iB-Rq



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/stable/AS8P190MB1285D7871E746D824330F1C4EC7F2@AS8P190MB1285.EURP190.PROD.OUTLOOK.COM/
#regzbot fix: 57c14b983f3b0293f

#regzbot report: https://lore.kernel.org/netdev/ZtsTGp9FounnxZaN@arm.com/
#regzbot fix: 6513eb3d3191574b58859ef2d6dc26c0277c6

#regzbot report:
https://lore.kernel.org/linux-bluetooth/a34d2761-dad4-4ae7-8787-6bbf05538318@panix.com/T/#t
#regzbot introduced: 610712298b11b2914be00b35abe9326b5dbb62c8
#regzbot summary: btusb: resume broken or mouse not found
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=219385
#regzbot dup:
https://lore.kernel.org/linux-bluetooth/595efd8b-e0fe-4a87-90b1-4b579f3cc876@gmail.com/

#regzbot report:
https://lore.kernel.org/linux-wireless/CAP-bSRbMbZe9LCE15SCbYNTGZjE_xiAm29qzO_WNVjHsJ6oyyg@mail.gmail.com/
#regzbot fix: 094513f8a2fbddee51b055d8035f995551f98fce

#regzbot report:
https://lore.kernel.org/lkml/CABXGCsNgx6gQCqBq-L2P15ydaN_66sM9CgGa9GQYNzQsaa6Dkg@mail.gmail.com/
#regzbot fix: 0c8c5bdd7eaf291b6

#regzbot report:
https://lore.kernel.org/linux-btrfs/c9373aab-24b5-4cc1-bc3e-3cdb4b28f067@prnet.org/
#regzbot fix: 96c6ca71572a

#regzbot report:
https://lore.kernel.org/lkml/c930b6a6-64e5-498f-b65a-1cd5e0a1d733@heusel.eu/
#regzbot fix: b3ebb007060f

#regzbot report:
https://lore.kernel.org/lkml/20240914081523.798940-1-andreas@kemnade.info/
#regzbot fix: 78f281e5bdeb
