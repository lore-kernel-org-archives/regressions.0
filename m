Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1924423EB1
	for <regressions@lists.linux.dev>; Mon, 17 Aug 2026 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786971958; cv=none; b=QMZ+XyiICFDYRNgYM+I1kByTE06Qy/358iBJbI8d7cbx0U7ITKurzuXn/yMWIPrR2Xc9L8cSTn0M/IuQ/5iShrJ3BxZuTyf9ycVqHhOtlzzZyoGzkCQltV4MMr6OUqxOfNGrpi0H3UQyQFzQXhLAhJOTCZrz/sbdNmc6Rj1mn7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786971958; c=relaxed/simple;
	bh=9Ot99h3gjPJm00MYV6Mi8UoIzhZo274ii7+Oailx8mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VZ8ARMft0E7cF1L4vWHuLjdeey94IF6Av+3fQBVoNmqJA662SZTZWcbwHkBZuc6DaDOLCsu6wdVoUstdcaRM3UQ05ZJSn+/yu54WkCRSIiVQyixVlDZatH9aOWGAcvaRMjpflS5f1EwGlxmvYOzLcP9pmMAdvdLYHY4IcqlL5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=VUIGLWkB; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="VUIGLWkB"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hNtPD1cTkz48Tc;
	Mon, 17 Aug 2026 15:05:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1786971952;
	bh=9Ot99h3gjPJm00MYV6Mi8UoIzhZo274ii7+Oailx8mU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VUIGLWkBG8gJVupE865rz4e6XWfvuZcklI7mGFhbLRUJYU63vXraS4ccqLdxYmJIO
	 ZzULEXJl0UxvBh/bnoiXTgDTnv5PJPY+dukiyB24jQrS7df7iRF5gqiu3IjLk2xqZ1
	 jKw1dfKfgBZeyVgq1RA3oF6bbYA5e2tZIc4LAFtN3aJG3jLRB0CXhGjx9bXYOo/mxT
	 mw+Mn1W6u5hYPbIkmu5gEDAjD4nLx2UEDULACbbzCvuR4/kNEjCQktuP8YKrDWkbRS
	 SPLT63tRr3zHFvLBzRyXELK4VfKIls5SnE2X7JSYDjtgrIF5afvrIRYOL2uMmsyUp8
	 ykI58OeUT8MYg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hNtPD0thgz7wjY;
	Mon, 17 Aug 2026 15:05:52 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hNtPB4rvfz8sb0;
	Mon, 17 Aug 2026 15:05:50 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id CECDA5FAC7;
	Mon, 17 Aug 2026 15:05:45 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <61d9c006-aeca-47a6-8863-eed92f15ebea@leemhuis.info>
Date: Mon, 17 Aug 2026 15:05:45 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Dell Latitude 7390 Intel UHD Graphics 620 display
 becomes extremely dim after kernel 7.x upgrade
To: nomorsukses@gmail.com
Cc: regressions@lists.linux.dev, Jani Nikula <jani.nikula@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Suraj Kandpal <suraj.kandpal@intel.com>
References: 
 <CABHf4aQC__rWLKUJ5XgkCEdzC0dr1TGH1WP=UxOu3JmmU9VjLw@mail.gmail.com>
 <c37c2d2f7f77f488867e278e412a92cc0e7ad851@intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <c37c2d2f7f77f488867e278e412a92cc0e7ad851@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178697194616.796474.7993964972841137865@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: CECDA5FAC7
X-NC-CID: AQZGOzuBJ+HwzmqEmWuxFn5ZCHAVXjubCJ30FJxjETpv2zPQ7mE=

On 8/17/26 14:55, Jani Nikula wrote:
> On Thu, 06 Aug 2026, "nomorsukses@gmail.com" <nomorsukses@gmail.com> wrote:
>> I would like to report a possible kernel regression affecting the
>> internal display brightness on my Dell Latitude 7390.
> 
> Please file a bug as described at [1].
> 
> [1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
Before doing so you might want to try 7.2 vanilla, as there was a
backlight bug affecting that machine that was fixed long ago:
https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16015

Maybe Ubuntu just never picked up the fix. So if 7.2 works, you need to
report it to them.

Ciao, Thorsten
