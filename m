Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B0B3290BA
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191142; cv=none; b=CGc5gyN6GHMw/AVWx0rOTBBqQLHxza+ZgImgyhf64TNK9N1k+qsOS4G20bOUmfgrgd+CoEIzzSfhxWoa4iSuoZ6eHGP9JpNbDW87DGCLOWwslDKn+3wScv508o5GnDlnQkVY5WF+i/OjScXY5z8Vamarb8WPvlYOiUREzKp9tPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191142; c=relaxed/simple;
	bh=4uaLVXlVXlJErR/7owHRnhSuDMiJ8jq8BNAYZMutv1k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=PyF21syNI6CvgrjWMlKBbK732QRccvDypT9lwdggG6xotRxXM5cAFnbDi37heEB04lbfzupj3mOUYi427qCZPFM+PvyK7GQrqURgBaiWjKTmUps7LgQglHcETQlD38pKIl4TCk4Pb/N0w0rWFn02bmLjIIZeKFb0q2FE6RDnizU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=UTEtQksV; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="UTEtQksV"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4gKXt45jylz8dj1
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 11:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1779191132;
	bh=4uaLVXlVXlJErR/7owHRnhSuDMiJ8jq8BNAYZMutv1k=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=UTEtQksVoI15jopnLwliRM8rw8+ZIBbQI1zfosakdu7WgODvnWEB85CfY9fNdQUQX
	 iCbMD1O3ZEzomlT2+JsQbUjS0uT7segSuAKg1277FMlKRn771jasabQRyrKnCAhUGK
	 GllEKMXMVN8RbI1eilHCEIrC7oL4DJh/Jps0olI2hAKPBy2w7qtYr/+aMWjrRLjrm0
	 wbxbPm1+UT7+E8Z5Tfn+8F994CttzZd3aHiK/k4ol9OABT+NcSZ7Kj6VKNYR63pv8C
	 9bubnecxk8HoQltML7hIPStApWlP9cVck0A7cydoyr9NISMwGkBeGpQqUt6Q33gpp6
	 nD73ZCVFYJQSA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4gKXt450nxz8dgY
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 11:45:32 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gKXt4384jz8sbH
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 13:45:32 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id AD90361847
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 13:45:31 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b1a0261d-a778-4c17-8a80-84986ece3ca7@leemhuis.info>
Date: Tue, 19 May 2026 13:45:30 +0200
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
X-PPP-Message-ID: <177919113186.1429294.9223901602782646526@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: AD90361847
X-NC-CID: J7WOwXNR53BVCdvB5Z8+oieIfoLYJH6FpCFySwoezKIuGlRzvmA=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-bluetooth/770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=221539
#regzbot dup:
https://lore.kernel.org/linux-bluetooth/46f7ee10-3fa8-490c-bb17-5929229206fa@vii.li/

#regzbot report:
https://lore.kernel.org/all/6ba903ad-9897-42bb-8c2d-337385cc3746@molgen.mpg.de/
#regzbot introduced: 6fa45a226897
#regzbot title: parport: race leading to a NULL pointer dereference and
a panic
#regzbot dup https://bugzilla.kernel.org/show_bug.cgi?id=221526
#regzbot fix: parport: Fix race between port and client registration
#regzbot monitor:
https://lore.kernel.org/stable/afo6uBv68GDevbMD@decadent.org.uk/

#regzbot report:
https://lore.kernel.org/all/r16mBH1ydY4oK0PInLKwpYR2I5qZBsV5J0JsNLrXAh8OR_QC6z6lABKlcvpzgUiBuarTKtVTP977RLI4mqt64Ydtd2O3yfhRuRJkQ1JL8u8=@protonmail.com/
#regzbot introduced: 14a857056466be9d
#regzbot title: sched/deadline: Hard lockup during CPU offline
