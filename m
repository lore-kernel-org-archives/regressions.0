Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E91B390229
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 12:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969265; cv=none; b=fVZcvTjCaqxGaVKrNw1VA90ypNWPTh089s976IQ//9ARfXiSyU4qYGQtTBTb+KdRjpY45TXZkCiNR8s5yhM379lJo/Ek5IFFHYtqiTy/rcOQ0g+RQiumfULM8npXYg0LrqILeCoY7hQ8chk03rbrKI+qbeTvJyKaxwioSabETso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969265; c=relaxed/simple;
	bh=RlbYwct1peXKtRO5Uilc22o19CBp1SHSWISO+QJu94Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=UkbCg1hXQHOKMm51aegxlG71UsDpkmRoTo7K6ZxDBXqcEBRxbTz9HVm/1rf1zqS+VU+VkQ4UJKw0wmVWWIMn2IuoVHFDRu5Js3t4EoznZlRF/J6pT4hZzh/YNwj9YH5FobstcCvtKxFTjeh6Lbr1XRY+yi0aT4Y4ggGqWTjM4Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=JzrbbezB; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="JzrbbezB"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hNsPS25Pnz4DXH
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 14:21:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1786969260;
	bh=RlbYwct1peXKtRO5Uilc22o19CBp1SHSWISO+QJu94Q=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=JzrbbezBFEVnw4XFrsLgTe/Yaq8EROunt5svuCACKDs549TT+HTP3XlBeAPHdNs9a
	 V+1/4n8k8FusxNc5EtsQsiV3e2vunCZTWz2PlPAY3o2ZkgvI6NpWQ0q16jzBpF3JLT
	 yuoEM8idcHBHUMUOllOnw+duM4jnkX9N60QrbKHlOw4SS3kFud00wA3RO5+8t5tvgC
	 RKZ+ExcTvGQA5S4lSxOdmpak/62y89HkymBLIdAIBiL4De4QIrThWasrpx6eUsm8QY
	 FKjEO/5FpQpb7gUhNyUDV6H06WlI1Nj68dZf/R6nTuMMt49YHBAHcjmIRVkD173Gjc
	 7xcMMxAyP6iPQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hNsPS1P4tz7whk
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 14:21:00 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hNsPR6yr9z8sZg
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 14:20:59 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4B2975F9BE
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 14:20:55 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ccbf94b9-b7b1-40a5-a6df-82b0e46ee0b6@leemhuis.info>
Date: Mon, 17 Aug 2026 14:20:53 +0200
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
X-PPP-Message-ID: <178696925547.306078.7553002133904561007@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 4B2975F9BE
X-NC-CID: /Tz0/TBpHCDwpDN/3trPc5yq3HXDOJ4AhZ2jcP+YrrDp5cb+wWk=

On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.


#regzbot report:
https://lore.kernel.org/lkml/20260815102806.32722-1-mikhail.v.gavrilov@gmail.com/
#regzbot dup:
https://lore.kernel.org/linux-wireless/20260804185118.19705-1-lucid_duck@justthetip.ca/

#regzbot report:
https://lore.kernel.org/all/20260813145741.8047-1-spasswolf@web.de/
#regzbot introduced: c4edf9e3e0e5
#regzbot title: wifi: mt76: mt7925: NULL pointer dereference when
resuming from hibernate
#regzbot fix: wifi: mt76: mt7925: Fix reset panic by removing MT7925 irq
mask config on tx done
#regzbot resolve:
https://lore.kernel.org/all/20260813145741.8047-1-spasswolf@web.de/

#regzbot report:
https://lore.kernel.org/linux-scsi/c324172a-a754-4194-a841-ec1d813dfde5@oracle.com/
#regzbot fix: scsi: qla2xxx: Fix size_t format specifier in
qla29xx_process_rd_image()

#regzbot report: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/8901
#regzbot dup:
https://lore.kernel.org/stable/CAF38RzLJihCvga6UgkPPR%2BA1jY33bf1T083CfDy%2BpfBuzYcdjg@mail.gmail.com/
