Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C18229CE0
	for <regressions@lists.linux.dev>; Sun, 26 May 2024 17:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716744196; cv=none; b=cKNWrDofgHOdYOGZltfk7r6t6n4NRkPxwekdbMfRvLRcE5kVut4lwDhTh0A2r6NTHVAEtzzQG0Py5x+Vpoe4aevlu44foDSLPidgGQd9QtrzGfhoO6tqMFEdcADCQ9CExMckeMwxR9pOeOlfhpZ6oGDU0TiYNnV1pVF4trNuzXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716744196; c=relaxed/simple;
	bh=AhbcjEICrDd8Cl91wfMEraluyDuj4Es+Tb/nnEC5GvE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=uvkkCuI3ZNMz0ns+fFPKwTZ/5B2OvUOZlfegKuLK12MjuYyxpauxwwG7U7Sgdf8qkF+jfVAXFsAnkq6XYbReTRkFiqLUI2qBUQ5y2V1AIOae4abm5bxB2SUM3Q1nwUUFjVZpNsjrGjrwW+h98XFYaJYTmUA5j6w1eyiu/pSrGEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=cJ25TWMz; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="cJ25TWMz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=AhbcjEICrDd8Cl91wfMEraluyDuj4Es+Tb/nnEC5GvE=; t=1716744195;
	x=1717176195; b=cJ25TWMzMQgOf9wlqiH3xGceLju44AnPsuOaZ0JDrkivdGmilLWf5cukof1XC
	IQ0lFBNvxHtt+FcmTwiQktQtGQIszYMYNPub+KAEO/twXsZ8cvKDyRRA/ZQqdaCFwbuZhhkpsOhMc
	9Fw2dYGx6S7ODVRt1xFxortSQDk1doKqUqJ9hXni9hoMuiXFCyTLIKd7HWoQU4Y7na/bxffHp4sr9
	LKuEVyFV+IQGIYNSKF181idSV/pLGSmORFbbPGyOJnml7lEVso0eAAc9QJRG84+/l7oV1/t+rSC0m
	IUf+xgDOlavmEizHb0CoXbPY/8KwkB4Z6eJP/sTccOxwD0bYMw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sBHaS-0000Z0-Vd; Sun, 26 May 2024 19:23:13 +0200
Message-ID: <4ca33a41-a4b2-4112-a5b6-8a38e148e014@leemhuis.info>
Date: Sun, 26 May 2024 19:23:12 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716744195;881e3c5b;
X-HE-SMSGID: 1sBHaS-0000Z0-Vd



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/CAHk-=wiWvtFyedDNpoV7a8Fq_FpbB%2BF5KmWK2xPY3QoYseOf_A@mail.gmail.com/
#regzbot fix: 4f1b067359ac8364cdb7f9fda41085fa85789d0f
