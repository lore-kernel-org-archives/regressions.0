Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7064D13AA2F
	for <regressions@lists.linux.dev>; Mon, 27 May 2024 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799357; cv=none; b=f/efrtA1dPdiLwXDWVtdeuw/cNzzZB2WhK1BkbrWYyQeHtyRKbv7riL9BKWw8pcNwJqLZX7wB+MTLNczTxaujmElsk8KcxmVQBfYpIgmFn/d+7L1O77toPcEbl2zm9SLmrOQcDdg/85jW1w9lCbRrSa1xK3Qj6fEO8aP86oHduc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799357; c=relaxed/simple;
	bh=pfObE/1AKnAm2q2LBoa61z+4miC7XWjuskNc1/coonU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=L4hb4FDAUSTA2MSFJrqz7KhANjVA5+GSCd/II+RNsrabVkRlKh0bRLG6BNZ3+Uw1ZD/7s8L/q+Vs4YPfNDrQO2X4obKAGUZPBVcrhhJZD6ni3TDUWSdl2A8V85ALLyunGQ9SFKrKvmieFLHPDZ0kJs8DnMFnjcdkA0CHBKrgcwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=SnE2FtSh; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="SnE2FtSh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Reply-To:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=pfObE/1AKnAm2q2LBoa61z+4miC7XWjuskNc1/coonU=;
	t=1716799355; x=1717231355; b=SnE2FtShEbaz1zM6nrAXRiddjGaSm6cxYMQe78MEwZruWze
	cT/n+030mkhgwibX8uiJEPsHOkfZkQuNck+6L2Izgpw2gdesc/7+rTAh5aTt8OA2/U1SkP87ymPA7
	OAeOT1D36pmEJcQ5jFaZwQ9j8mnrSBbKouUczC6DGvf0hAT/FRRGv5CwaedvH05Q1Bw91ys20/DPB
	qjAe4oqYFU4bqHlzyv/4pxEDfmHbenzRdqQhaeUDeHD4bI7ZBCs8PBfkndz7ftN5gJbcXffWzc1gS
	wkUTt6z8L+IKXUOhRf3DbBVQUN/f5LEy1pLAryr8B7hYoyMYIL3fbitt8w2V7fYA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sBVw3-000311-JY; Mon, 27 May 2024 10:42:27 +0200
Message-ID: <029b5b36-471a-4fc9-a226-5272a39dc42d@leemhuis.info>
Date: Mon, 27 May 2024 10:42:26 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FUNCTION_GRAPH_TRACER + UNWINDER_FRAME_POINTER broken on arm
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 kernel@pengutronix.de, Steven Rostedt <rostedt@goodmis.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <alp44tukzo6mvcwl4ke4ehhmojrqnv6xfcdeuliybxfjfvgd3e@gpjvwj33cc76>
 <760b454b-e1ae-4266-95bf-fa51ca901ad4@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <760b454b-e1ae-4266-95bf-fa51ca901ad4@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716799355;2be037ff;
X-HE-SMSGID: 1sBVw3-000311-JY

On 27.05.24 10:39, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 25.05.24 09:59, Uwe Kleine-König wrote:
>
> https://lore.kernel.org/all/d870c149-4363-43de-b0ea-7125dec5608e@broadcom.com/
>
> He plans to look into this and report back.

Ohh, I see, another Thorsten just reported back in that thread after
talking with Uwe (sorry, saw that right after sending the previous msg):
https://lore.kernel.org/all/ZlQ8oDh%2FKgkm1+WE@shell.armlinux.org.uk/

Ciao, Thorsten
