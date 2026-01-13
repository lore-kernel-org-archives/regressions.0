Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB24C289E06
	for <regressions@lists.linux.dev>; Tue, 13 Jan 2026 14:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313841; cv=none; b=eOeJZkonr+zZIDFYy6IYcb5K3XtVR/dh5IM5GTlMWiYLPZcr27FPHdi6p5EiWLVJ/EjLXa62Ox0/bTJ5plma8JTzyo49ZVBTPQ8dfPSKtZcR9HamKPKhVc4iEqMpWOd5lZr+WfdVS73qhhAFNSYA6qRSmPKUSlxTOWh3JU8i4ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313841; c=relaxed/simple;
	bh=QDBgbFVD99g0JxDHWe7g9223MD0+xYYfC1JZD9qxE1s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=pDB808UuJX3RqOt19ySDOsUDDaZdTnrwiyMnabi8n+B0eStL70lzJCzB1vWKiit2Qo11e3+qlQGOkFjK6CCy5ODxbDe0FtJ0tr3OMrb77jDrMk+KQcIKGSrebg9kh931k7c1hi3fagfBvJF3N2AUEzIqxO/nCEaBSgkjwB4/jZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=gBtN60cf; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="gBtN60cf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=QDBgbFVD99g0JxDHWe7g9223MD0+xYYfC1JZD9qxE1s=; t=1768313832;
	x=1768745832; b=gBtN60cfBjnRCPq/WkFsG5td0xxQ5e/0ip5oInleYSKZIaeeQelHiwxcBFIKF
	dymZ0zdW3iPmvma3I3sby8jTRj51PhaGjHJXpFTEx9kPAe2XRR3seuUJI9FepIqr1+jf9dQppp2DZ
	YvRaO1Ovuw/SoplLVanfHHrYDrnlIlA5/fZ6EeJamBA3cdMqcEwgiW7tV3bTLOw9dmsJqPqNB1VZK
	MrsbQjdx0d2ZAXVbixfRVGXI/KTPdeCBH6m5cdaaGdB8drped1vFM4SvfK5zouiAL7C+j1dFQ1294
	bsfk6wCc1JCH6OnL4eP4ab85RbCruJl+44zli0Fgw9c/aBTuow==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vffCi-008ssL-2E;
	Tue, 13 Jan 2026 15:17:04 +0100
Message-ID: <427de533-ed8c-4d94-bb71-a2f116b9872f@leemhuis.info>
Date: Tue, 13 Jan 2026 15:17:04 +0100
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
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1768313832;7aeff830;
X-HE-SMSGID: 1vffCi-008ssL-2E



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

Culprit identified earlier appears to be a false positive, so update range:

#regzbot report:
https://lore.kernel.org/all/51388859-bf5f-484c-9937-8f6883393b4d@app.fastmail.com/
#regzbot introduced: v6.8..v6.9

#regzbot report:
https://lore.kernel.org/all/7d4ac21f-491f-4f0a-bc50-7601cd1140ca@leemhuis.info/
#regzbot introduced: c9ba789dad15
#rebzbot fix: cab01237512230



