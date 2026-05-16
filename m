Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E23335E1C8
	for <regressions@lists.linux.dev>; Sat, 16 May 2026 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778926972; cv=none; b=TwvIuluHumlSoyv1TTerRC7QFe+jgMuCARx6/t7a8UEiilkWSSJI1ofjI6dTdUQntbyTe0VZdDqC9wiqUC8d/BotFf5lA4ObTXZZfux+zZJdXwVxuGZAq3DCZmW/R0FJJA7qHSq6dlRveaQWqEwq0foCZZdr/SL0rRi42QtkDMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778926972; c=relaxed/simple;
	bh=cPG1mz/pxGUQC+Kegbpw3DSWRI/5n0HOe2XJIdpJdhI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=TiZWywtNi3n3f81goAuSbeMtpMkrR+LHjgvGsc3H28mR6bksTwzSW5J2P+gg2KP1o6ao/aDysyUEnUwUx7NHz1bbEDpDMLIRJl780DYyw2FnPViS8DYTJbndO+CuFMeO6Ug+SG+k5nVC2cxCC67JnuMxiihsDYtQ3TYD6/36OGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=EzUmaLdu; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="EzUmaLdu"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gHg03065zz66lC
	for <regressions@lists.linux.dev>; Sat, 16 May 2026 12:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778926451;
	bh=cPG1mz/pxGUQC+Kegbpw3DSWRI/5n0HOe2XJIdpJdhI=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=EzUmaLdurqm17ElvupS41M6ewQD9LsAFTmHXfiaNfCT5M7Gg+wrVf8VBw2RLRJtcv
	 bGJtONclWjx6nW5A0HUAxkopgAe4Hg6FEWPmdPIG53L34CQn6O+9dAx7sb31jvXcXT
	 wrf8e2RwXiG52i2ItQF8hOacLD0eN/Kn9uANB16dd+GGFMcipJt/PCY+S0rEJVScnl
	 udJuokapgu93Sz5ZgEmjzN+E1oaBCK0eGGtIsLTGjYB/Vh7KiCVfRPIaShCmABoZIk
	 GyyZs85UiyzyJJe658Uh7LREDcBcCT2RDCvKBL41HrHmqcOR7PNqAdugm6uyxEzLZy
	 Jy7MMhVsHw5IQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gHfzJ5MKnz4yBf
	for <regressions@lists.linux.dev>; Sat, 16 May 2026 12:13:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gHfzG3hKfz8tYg
	for <regressions@lists.linux.dev>; Sat, 16 May 2026 12:13:30 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0F53861829
	for <regressions@lists.linux.dev>; Sat, 16 May 2026 12:13:30 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <41c5d1f8-0eb0-4115-951f-7ceb6448065c@leemhuis.info>
Date: Sat, 16 May 2026 12:13:28 +0200
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
X-PPP-Message-ID: <177892641022.88068.14537348119743755037@mxe9fb.netcup.net>
X-NC-CID: QWPQD+NEassoLPjPzER9qUbtoVjF3wEhXsqwAv+8KkDWbODMF60=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16015
#regzbot introduced: 40d2f5820951

#regzbot report:
https://lore.kernel.org/all/982b9bc1-0a0a-4fc5-8e3a-3672db2b29a1@nvidia.com/
#regzbot introduced: db359fccf212e7fa3136e6edbed6228475646fd7
#regzbot title: mm: tcp_mmap broken
#regzbot fix: Revert "mm: introduce a new page type for page pool in
page type"
#regzbot monitor:
https://lore.kernel.org/all/20260515034701.17027-1-byungchul@sk.com/

#regzbot report:
https://lore.kernel.org/all/CAMRc=MfADC2ncuUQiSW7TnUwBUWCJn9i=wZ9dqYMZNo2h6qOxw@mail.gmail.com/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=221515

#regzbot report:
https://lore.kernel.org/all/9f6967e5-c37f-4e21-b0d2-8eea4a0b5809@codewiz.org/
#regzbot dup:
https://lore.kernel.org/linux-bluetooth/770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi/

#regzbot report:
https://lore.kernel.org/linux-bluetooth/5i35wmc4z7sz54jo5uj6ywext2enh4ik3oxmfmperqk2v5kc27@ppvm6oodzipn/
#regzbot dup:
https://lore.kernel.org/linux-bluetooth/770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi/

#regzbot report:
https://lore.kernel.org/linux-bluetooth/770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi/
#regzbot dup:
https://lore.kernel.org/all/CAJ8Bt0iC5bVgCRw28YXB1mo%2B-p_sTM_cp6fF%2BqVNapyL-Hsayg@mail.gmail.com/

#regzbot report:
https://lore.kernel.org/linux-bluetooth/770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=221521

#regzbot report:
https://lore.kernel.org/linux-bluetooth/770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=221525

#regzbot report:
https://lore.kernel.org/linux-bluetooth/770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=221529

#regzbot report:
https://lore.kernel.org/linux-bluetooth/770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=221511

#regzbot report:
https://lore.kernel.org/all/d2ffd82d-01cb-470e-bb02-70c163c61216@ofz.sk/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=221512
#regzbot resolve: most likely a temporal coincidence rather than a
kernel regression



