Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC69E22D7A1
	for <regressions@lists.linux.dev>; Mon, 18 May 2026 08:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779093359; cv=none; b=E6Ym4Ix4aeN5LP1TbldVSerzPrkrGdkJL1XWrx6kn4lLXvrY9sDEtdinKsXn9ECis8a2CX2zWhpFfXQ/eTjrppKn1Yc5t8dOr4qz99h2xqTj/zHnhSMveO8/i52Yk27olAv1q9az6OnB8hl4Pu5kEPRH4kk7Yc7vdYVdwYEx6aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779093359; c=relaxed/simple;
	bh=xHfwBmeiTLjpNqhiU48vMjCtAGt9XcKV7Is9mXyIGKM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=c2holMZLmR1SjQZqYbiJKvgXTGQ2E8gMVhfIr/E+5L9YnvgjQdWxlBkfGU9ozZcmXXiluYJ0GpnT3uQ2KRrbV/YEKSI/vX5WQKFWzNF+fc/3zQHi5WWOO7TQiZ+2FBqOzwDTNncXt0HtARf1W1KtrLGn3CPBhKhzP22v9housFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=RK3tLvwX; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="RK3tLvwX"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gJrjb64vQz63m5
	for <regressions@lists.linux.dev>; Mon, 18 May 2026 10:35:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1779093347;
	bh=xHfwBmeiTLjpNqhiU48vMjCtAGt9XcKV7Is9mXyIGKM=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=RK3tLvwXkL16+n5r9RAAobZnR3lpAJxKDMb+Qe3eR46o/rPyfYXYB5djfmzMuslZN
	 mV6gyKg0uSdwnGSY0iOpZBipxek4hPYV1BmnqqwKG8P0P9DkYFGJmFbbpjIMsjulDW
	 GqYqZL85IJifc+rmdrVhB6sjChrgAwkXGkksxD0OwGU0skd0VUAv2i7Me7ittLgwMt
	 xKPiFt8O20Si3LQQ5dyCkF2bBy81BL01JbIbeDMySJGQz5hAA+amrzuQ0fL27AgSxD
	 xjRrRPIsmJDbJaDF116IWEl5FG37EYo6iu/5embKbfM1wV/NdsV+EfVDBR5VUiomjl
	 WGhz29e1oNPpw==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gJrjb5MN6z4xsW
	for <regressions@lists.linux.dev>; Mon, 18 May 2026 10:35:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gJrjZ51p7z8tZp
	for <regressions@lists.linux.dev>; Mon, 18 May 2026 10:35:46 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 3218361851
	for <regressions@lists.linux.dev>; Mon, 18 May 2026 10:35:46 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ee1916a2-cc01-438a-8a4c-165ad6ded284@leemhuis.info>
Date: Mon, 18 May 2026 10:35:45 +0200
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
X-PPP-Message-ID: 
 <177909334636.1902626.18006172376011646162@mxe9fb.netcup.net>
X-NC-CID: iqSFy11Tjcfb/Png9TQmotW7k5OAxtR4FoJtDZvSBVtR+4bQMfs=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.
> 
> Interacting with regzbot from arbitrary places is a recently added
> feature of regzbot usable via the new '#regzbot report <url>' command.
> The indented use of this feature is for updating minor aspect of
> regressions already tracked, e.g. "change the title" or "tell regzbot
> about a related discussion". Such things until now had to be done using
> regzbot commands in a direct or indirect reply to report -- but there
> they would mainly be noise for most others and just add to the huge
> amount of mail people already get. It's also takes a more time to send a
> lot of individual mails instead of preparing just one.
> 
> The new command will be documented on
> https://gitlab.com/knurd42/regzbot/ once it got a bit more testing.
> 
> Ciao, Thorsten

#regzbot report:
https://lore.kernel.org/all/d2de7933-e650-4b19-8d88-90d66693dcfc@message-id.googlemail.com/
#regzbot introduced: 40d2f5820951dee818d
#regzbot title: drm/i915/backlight: backlight control broken on Thinkpad
T480
#regzbot dup:
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16043

#regzbot report:
https://lore.kernel.org/lkml/CADo9pHjr-zZ9C3%2B026y5%2BXOGPSeRzSJMCHof27TVPtAUNgTc8A@mail.gmail.com/
#regzbot introduced: 40d2f5820951dee818d

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5286
#regzbot introduced: 6f71d5dd3206
#regzbot title: drm: amdgpu: handling FreeSync via MCCS broke VRR

