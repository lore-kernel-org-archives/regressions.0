Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EA3161920
	for <regressions@lists.linux.dev>; Fri, 10 May 2024 08:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715329796; cv=none; b=uoS2WKPL1ZKOwmsZTCiRux5HfV0omMOABJ51zHoLTTkMQX7FRB5PR8hniZdMXwc1Wgn7Q/ZPjwiiTz/NUyxkzeKytG3NW06BCQ1cHhePSkit/KM1r7vFiykPd8S04qnDXQ10uSP6ewI3db9bF0WZg8rkeZLgZtIliWzCdpfC7PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715329796; c=relaxed/simple;
	bh=5Ni18aY8wXBw3Knvfv3j5BVgFKkfpH9JjZA9Z/WxsKo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=R51BVGC+ZCe9BxWfoYJ+mkoFseqpRM1cRNshJzwxUDwGA/6kD5Ktsy6Fa2+YCaokZnzXbBR5A4JNulS/b2P44HWCgALNIy57vFlXS/hXrrP5ay4W37y0UDG9AWAvwzlN9f0qikt/d3v5asAB+wPD2FdWawfffFhAzzZMvDJ9WeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=vBwN9+Bs; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="vBwN9+Bs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=5Ni18aY8wXBw3Knvfv3j5BVgFKkfpH9JjZA9Z/WxsKo=; t=1715329794;
	x=1715761794; b=vBwN9+BsfOq5d5A6I1OrVv3P0HfsN/ml/Hl6slaHUk0CVhEELIi8Uba6cgd5Z
	K3k2bFhbL1XDwiOzeOKahyYoykHm9ZW8aCu1W/a8eZDXJ97CpUK6hjLU1Ue8GjxX+gLPL7kpABbHF
	S139nGlpYh1aFe5qTjy3lNEEn3FiW61lLdF80eBHL/rlqSQy3sCrmcthNgNshJCf/T/8Ms394Z3E6
	v00PYsKbyoXDt02Eg7vSv42jsQ2Qc3it1ihJrTI0yToRtGy5K0aj3RXOFX2y35n28905NmyQZwUUc
	XTy8s36uA2zBU7N3eusMMVAVU35qQcV+vmGN5PXDy95fHY2m9A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s5LdX-0001fL-DO; Fri, 10 May 2024 10:29:51 +0200
Message-ID: <22f35943-0a3b-4d04-b310-814bc2cfeaf2@leemhuis.info>
Date: Fri, 10 May 2024 10:29:50 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1715329794;6838f0b1;
X-HE-SMSGID: 1s5LdX-0001fL-DO



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/netdev/VI1PR01MB42407D7947B2EA448F1E04EFD10D2@VI1PR01MB4240.eurprd01.prod.exchangelabs.com/
#regzbot fix: 3584718cf2ec7e7

#regzbot report:
https://lore.kernel.org/netdev/1f22520948180e55125fdc686a0de8a93c317e5f.camel@ew.tq-group.com/
#regzbot fix: net: dsa: mv88e6xxx: Avoid EEPROM timeout without EEPROM
on 88E6250-family switches

#regzbot report:
https://lore.kernel.org/lkml/hzhomd7d7uc4dcnpvd6ki6v2f6camzm5ufqp2syqudrvzzfxi4@ykcirhonbqql/
#regzbot duplicate:
https://lore.kernel.org/all/CAAzPG9M+KNowPwkoYo+QftrN3u6zdN1cWq0XMvgS8UBEmWt+0g@mail.gmail.com/
