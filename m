Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAF11A2C32
	for <regressions@lists.linux.dev>; Sun, 26 May 2024 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716718579; cv=none; b=NyShDvj5B3ksZkQjk7FAPlF013cq7DysJUNwmturS8R8HQ6Sbxtp5ftIaWi/xrsEO4JoM4HdlHnI0YIU5b35baSnVcbS4/IRYepmKQp1thBoxuGTaC5SRpAO6Vdy6aIO5Mwdd7FdnNuzCtKc2MQ23QciRienCYDKMAydcYEoYpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716718579; c=relaxed/simple;
	bh=f22fsPLoPokTgiL9IjwzaHFlfJamKupwXAVTE0D7mdo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=omPyiAKiUtktVkgr3bHj6BFiuVu9hOo8mwHBL0MSxF9abRFlSveUFG1VuAZkm6szomny8A/oqBSZydepnSJSCMeFOa8fbq6SXPHzuNqxlvMXR2MXsZnbfV0oq9hHv5AyZqgwalFA4x+/JZ9vhX3t5X9CON3OLf11qxHOib8kVEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=MAXkWsuV; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="MAXkWsuV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=f22fsPLoPokTgiL9IjwzaHFlfJamKupwXAVTE0D7mdo=; t=1716718577;
	x=1717150577; b=MAXkWsuVemeHap92121i38dAqUt/RCxGARxHwnT8oDjUWjy8Lq4t1kV1g2rYj
	9DB71BwLddZYU+O3T91nONhqMk/J2vJVPG/EI/g/vJTUJojtL7gi0meA6G/bMQQf/Q0i2vDNg2EAM
	rCXHOMS/j8lu/NU6hDo7JGDQUv0OVnosKTSO4gy8MeajFHGdB/hOA5+KxRZ7ObFoZHpWRdpgQdonQ
	tHeqDuRMry90lU8RzWr32BJLigGs3YsYCuy7GYTQL8XWWbk6i/HSS/0fAXvIu1xjAtA/snK9UKDCR
	9yT1QmsjxuQOVclF1LgTM0oimjQSTzO8vYMUL4E77syqG3cUHw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sBAvB-0000lE-AQ; Sun, 26 May 2024 12:16:09 +0200
Message-ID: <0d15becc-4721-4cd4-af81-8de08fc70e92@leemhuis.info>
Date: Sun, 26 May 2024 12:16:08 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716718577;567d7ca2;
X-HE-SMSGID: 1sBAvB-0000lE-AQ



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAHk-%3DwiWvtFyedDNpoV7a8Fq_FpbB%2BF5KmWK2xPY3QoYseOf_A@mail.gmail.com/
#regzbot introduced: 617824a7f0f73e4de325cf
#regzbot summary: perf parse-events: perf broken on arm64
