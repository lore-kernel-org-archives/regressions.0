Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419EF37D13D
	for <regressions@lists.linux.dev>; Tue,  1 Sep 2026 08:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250592; cv=none; b=l+H7h6Kl1qpqyPyIWh9WvFMOjyM1ZacWxoYEQpIYXm2Z3ptDIxQv6r+TeLNipJjvQur9T9YIXN8NsZcbbqfwz2KITMphmKrZS3aB08M0Bm35A2LIT6XnvtIGZwW77O6yl18fGXB4ZTASmosa7OpfzaBqKNftUwzr3PlXMLpE8SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250592; c=relaxed/simple;
	bh=MaDwvm4/WgGMlaCWu2tSBQXxTsATDNxTAUgac3Dpmyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AytfU386UWeTun+v4aMejBE/IiodROnmzrechq4+FGbO9H3oSNqBgloRF5qyhKmtynqKQEJU5kzlXu6hynPmyYvB4yoYi2fqgus2j9Zl1zoDE8V2ALHymf70gyGfRcRl9gf/PRtPgUP22RkNeQjOkkX89e48tp02V9Ql+waYiw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=TywdY45q; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="TywdY45q"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hYzGB5Mn6z42T5;
	Tue,  1 Sep 2026 10:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788250578;
	bh=MaDwvm4/WgGMlaCWu2tSBQXxTsATDNxTAUgac3Dpmyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TywdY45qj/H0Y1QgL1vU5frKtq0eeVypkOZtDOORqQFZ40/tl9i/9tbOU53+GlHgY
	 c0tJBUv9i7KcwPRlfxJ2y3oixYz7SsV5LDlElysri6exyESBBYbJc4vxnBz1dIvlw9
	 /osmjPTgCPv/3c7PVcwwm8oXfFGiXdo3TFwDY9Vh3Q1RxSxwcvcQcRo3OJBUVIpGwX
	 nqb0+sAGpYyzql9NiOTboxQ1noHb7pBR9V+ogpwuCY61WvFWWKUjoQ/3PJSEKmHYX8
	 tdObtg6fUkHaRQu5jIiSUkSMFKK7NRnzfZFNRM1ea+KYE3gPjoV786xhJV1ww/hJJZ
	 RExayNy5NL/4A==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hYzGB4dDMz3qNZ;
	Tue,  1 Sep 2026 10:16:18 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hYzG83PfMz8svZ;
	Tue,  1 Sep 2026 10:16:16 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id E96145FAEC;
	Tue,  1 Sep 2026 10:16:07 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6463ad31-75fa-458b-81b7-45814c797dd1@leemhuis.info>
Date: Tue, 1 Sep 2026 10:16:06 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: fix maximum event ring segments calculation
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Pierre-David Belanger <pierredavidbelanger@gmail.com>,
 Shixiong Ou <oushixiong1025@163.com>
Cc: Shixiong Ou <oushixiong@kylinos.cn>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Niklas Neronin <niklas.neronin@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20260828105926.930033-1-oushixiong1025@163.com>
 <20260830031233.1810986-2-pierredavidbelanger@gmail.com>
 <64a7ce30-b346-4e94-974f-f30893d66829@leemhuis.info>
 <81ddd491-1ec3-4a0c-90b3-6a286ff1a908@linux.intel.com>
 <1c855bb3-2bac-4f25-b97f-3a7436a6291b@leemhuis.info>
 <89d99e3a-0f67-4116-a262-98be59f76f5d@leemhuis.info>
 <f29a475e-a523-461a-8e63-b0698b3174c6@linux.intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <f29a475e-a523-461a-8e63-b0698b3174c6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178825056841.2838052.3252348926793868692@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: E96145FAEC
X-NC-CID: cbEZKz4gyJ3Gi4HUbWwmymUFLSElmVpsA9kzy0HZa2eKVHzYDMY=

On 8/31/26 16:28, Mathias Nyman wrote:
> On 8/31/26 14:36, Thorsten Leemhuis wrote:
>> On 8/31/26 13:28, Thorsten Leemhuis wrote:
>>> On 8/31/26 11:21, Mathias Nyman wrote:
>>>> On 8/31/26 09:55, Thorsten Leemhuis wrote:
>>>>> On 8/30/26 05:12, Pierre-David Belanger wrote:
>
>>>> Note that this is a v7.3-rc1 regression which was found during merge
>>>> window for v7.3-rc1.
>>>> v7.3-rc1 came out a few hours ago.
>>>> I can't resolve it much earlier than this.
>>> Out of curiosity: why?
> [...]
> No real life or personal issues got in the way.
> Assumed severity after first case didn't call for action mid merge window. 

Many thx, that helps me understand thing better.

Quite a few other subsystems from what I see would have approached
things just like you did here; but I wonder if Linus in a case like this
would have preferred some mid/late merge window intervention to prevent
testers from running into a known regression. Will try to bring this up
on the maintainers summit. So again, thx again for describing things
from your point of view, helps a lot.

Ciao, Thorsten
