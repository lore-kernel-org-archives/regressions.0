Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4421F17C6A
	for <regressions@lists.linux.dev>; Sun, 21 Apr 2024 16:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713718188; cv=none; b=hQYCQ534WlCbcIL0chqrrYli6sAAreNxmqpSteZ9Xe6aGhneWQfIK4ERWVxCcRZy/IspAk/hm6TDc88XXjcCwvC+VAeW92nIBUlYjOW7oFTqki7l4OY/yzF+gLVf/ii8gvSbmCBrZGNpIyibChhT8/06zPiIFSdt8n/C0dGpS7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713718188; c=relaxed/simple;
	bh=0SgCW/+e1NhTZqzePP9XJxRU4ke+7SU0RSvqmJjUi+o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=EUzlb+A4G4h9a7UbNSAFju2GBiol3igdE2O52FYlTFTrxiYgwL+sPjsf9yMpscJiExILvoeKSiraWi561s6BcTgJpIiz3szr4VchbOS8QPJLIxsEq0VSq+bd4MWcJNRFY0YNVc9biSBPH6YHu47vMaHkZvxEJkZqZPga+NF8zL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Or91C0Rv; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Or91C0Rv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=0SgCW/+e1NhTZqzePP9XJxRU4ke+7SU0RSvqmJjUi+o=; t=1713718186;
	x=1714150186; b=Or91C0Rva0aqLDo2EihA9fqh/EeKDPoGml+HYQnLg6gxxk4qA2m9mrje+K2bg
	iV1NIEikGRnT27MZJQ69R1XitFrMQUmY0TSWkUQ7SpiVNX7ZhAOLpmAdqoUH8LDhuXSQSZ7rn8Q4A
	yOJq/OHcUkCBVBigmTymWvwYleOyNihxXizq6T426TWtiyzpaKyU2qBb1y88N64ILdxYcXJ5EdjyE
	WGdg1LlysSW2R1wIqdfgrCJYMqAnSVUNNnoXgDmWk92iHL3LXY56pDelp4Ld4/Kri0CN2idRikX0W
	gCcTmC5CBrF83GztM95NJnSMpi39E+fHXQpBI44dO3GtDna6sw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ryaNr-0004gA-UO; Sun, 21 Apr 2024 18:49:44 +0200
Message-ID: <9ed0a0fb-8622-4c0d-b240-7c1ce48d2105@leemhuis.info>
Date: Sun, 21 Apr 2024 18:49:43 +0200
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1713718186;1000c94e;
X-HE-SMSGID: 1ryaNr-0004gA-UO

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20240401144424.1714-1-mike@fireburn.co.uk/
#regzbot fix: Bluetooth: btusb: Fix the patch for MT7920 the affected to
MT7921
#regzbot monitor:
https://lore.kernel.org/lkml/20240415141922.25055-1-peter.tsao@mediatek.com/
