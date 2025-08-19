Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC3F304989
	for <regressions@lists.linux.dev>; Tue, 19 Aug 2025 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755624981; cv=none; b=J6bEZ56nIJKIEfLvqmfHl60dqh64XwFUiLAcjMG84VDM+4oSpdI2gNd/8vNcs9LCAlB7xlgcRLFdt6BZ/TW7CXX+pvzqqxPbg3MmQLAWafYIOLrTDumDZLr6Mxfiyc5XlWZksm9gTv0zsWBJJ/ZtRyj81m1LMykxFCgQuGVCS38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755624981; c=relaxed/simple;
	bh=v1iFWk+WhBvlGv4FF4pqip2HhMgUj5gOst7ERK3X6b8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=BpcPHBfJhPghEDS3RL4R+rtIki3PQlRMRgKF6G1MhB4T0uqC+41cUse3Hi+0jgt9mmZqcQK6OMSWCWE3ErdMRbvfAh1329KUsTqvE3rgILEOcucEwRiKwBmB22riWzIaZXS67XBCsxMXWWKgAwwuWBER/6DSBBwteSAol/TpKos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=NLZ69iJc; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="NLZ69iJc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=v1iFWk+WhBvlGv4FF4pqip2HhMgUj5gOst7ERK3X6b8=; t=1755624979;
	x=1756056979; b=NLZ69iJcL6UFvLVD55o5gTPeUJaaAzvtG4Z0zMtTFCbRsi6V2+OX8u74HE73Y
	AmYyjpdNlC/5OwWeSqgRaMcaXl+5iCibos4Vn2Ouy+AV5G1XNhfWbTAU5yEYr+ZiBDSaVZAapFrlO
	wjzVqNDsRvh/hvsu0u2oyY+dx/X2EZfqWvpMat1YwPC84RO6/MfwQid5OvC8SX4PTL2no7uDG7y1j
	B2EiAvMKy65czb1BRmYzvkXTCEREQdNbRUl3+GNuOGV1wrrBrNjCkCizihZ3kO637wRVRkr7xA7HT
	j5u2lcxspDHwXiiCSTN68T8EdRolB2C31prwFtzNPwImoLXg+w==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1uoQFn-000spQ-0W;
	Tue, 19 Aug 2025 19:36:11 +0200
Message-ID: <ad88ed3c-9224-4ee7-b97d-87ead559258b@leemhuis.info>
Date: Tue, 19 Aug 2025 19:36:10 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1755624979;4b83ecc6;
X-HE-SMSGID: 1uoQFn-000spQ-0W

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/stable/CAJmAMMyOk7AVqQRrtK4Oum2uVKreGeLJ943-kkRCTspoGApZ8w@mail.gmail.com/
#regzbot introduced: cb1353ef3473
#regzbot fix: wifi: mt76: mt7925: skip EHT MLD TLV on non-MLD and pass
conn_state for sta_cmd
#regzbot monitor:
https://lore.kernel.org/all/20250818030201.997940-1-mingyen.hsieh@mediatek.com/

#regzbot report:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.14.y&id=85f6414167da39e0da30bf370f1ecda5a58c6f7b
#regzbot introduced: efaaf344bc291
#regzbot dup:
https://lore.kernel.org/intel-wired-lan/CAMqyJG3LVqfgqMcTxeaPur_Jq0oQH7GgdxRuVtRX_6TTH2mX5Q@mail.gmail.com/
#regzbot dup:
https://lore.kernel.org/intel-wired-lan/20250626153544.1853d106@onyx.my.domain/
