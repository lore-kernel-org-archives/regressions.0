Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC9E16C6A5
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 17:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713978745; cv=none; b=bqEoYGWlX6M2FgIdH/GKT9G0VbZGOvqEVD3U1ocAe7cqBTRSfIBGJIIYzTIV1ZufUXhHGpMTWHdh9ryHbP+FBBTMo/TXNKrlRQD+VrDUXF1JIy1ccO8KyXAvZSlOPxRFLDxWWCxAtX3m3pHfFWS6C1zD8mkkQLxDBxWGiVp68EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713978745; c=relaxed/simple;
	bh=20TaaNPVLTSafx+ZzxEYHx02nAaH1QRr0UznNAnwrco=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=rOh+pMdMeZYxdUvTqx6qXr83zRCffF+kU5DaHh81/RUhdhxVHIDn7vpOT4pyU1QxhchFKKCsMr0PDrJ02Uh4Po/HgQAs/5VJ3plTFTVaagG9IDqOZogKHSqV+hN+rFwO/ty3kUkxCZruo/9Jgl0PgICd6GjGnbDScWbKgoNySuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=1Qrp7RcQ; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="1Qrp7RcQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=20TaaNPVLTSafx+ZzxEYHx02nAaH1QRr0UznNAnwrco=; t=1713978743;
	x=1714410743; b=1Qrp7RcQy269oxXNqiDWh5Rb4dPx/VjGYEhtUQr+PP+3AsDe0HGFrT85R2A4Y
	RdRdJqpC0S+Iw1yN+AsHckJ6BVGtdDxIZmzbU5q1saGSYUSq/oFiPHlIYDJrcweSywdzVQjtMd/6x
	ajd4e/anVhsfTc0s5GsGD3DEnPSFcwGDpIfBiogWnhYRTf86ntmfOZ4u+a2C12qJwcXlBDDebRqJO
	Jcg3Ch2uMLCABYKkaPWxknbdcGXaw+pNXlszHqJq7iki1wGG2DfydJrjncpi7QhG3v8p6AWcY4MIe
	XNbKOR6t2tPF0u1zcXXiJltWM4mVD8QUgta4jGbGcUI1aSouAw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rzgAP-00043l-VO; Wed, 24 Apr 2024 19:12:22 +0200
Message-ID: <17b8a532-c536-4449-9a77-082573623e03@leemhuis.info>
Date: Wed, 24 Apr 2024 19:12:21 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1713978743;103f89e2;
X-HE-SMSGID: 1rzgAP-00043l-VO



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/Zh%2Ftyozk1n0cFv+l@euler/
#regzbot introduced: v6.8..v6.9-rc5
#regzbot summary: net: Beaglebone Ethernet Probe Failure In 6.8+

#regzbot report:
https://lore.kernel.org/stable/9a880b2b-2a28-4647-9f0f-223f9976fdee@manjaro.org/
#regzbot introduced: af93a167eda9
