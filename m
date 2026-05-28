Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C206407598;
	Thu, 28 May 2026 18:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779992224; cv=none; b=SC6/LBqia/qOqb/HbReEK8E7n3d4k2m1oYL4532swnT/eCRgM+Iz9DdUPXt6X7GjcpVfXCZ8lyaCbPofZwKrYzfgA5GbsZMSZuQustE6KMRN0KDE/Gk8Kz5DY9OFsgzh7RrhgjzhYmgQ12V7FszGeYqME7sC3ckPkqPRGjg3LLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779992224; c=relaxed/simple;
	bh=XvHoutqyoCvvmHbt31I71MjafoJIIZtNHSPVtBcA8v8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=avYgfyDWWdDr3r444IVn2Rfl2bDp66IytCiTQngO1io3hDY9LVlNntZu652jcxCF8MEecu+n4TQmVSWSChQEzkY4PH+Muj10l7Pe5Vkh5bSnHen2Fd8i447nrTjbA98rZR3j2awDs6gfF3z6LiTp1fHwmqTOQ6oyJfNSJBrnqF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=fsc93otj; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="fsc93otj"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gRF7c5vs3z92gv;
	Thu, 28 May 2026 20:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1779992220;
	bh=XvHoutqyoCvvmHbt31I71MjafoJIIZtNHSPVtBcA8v8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fsc93otjfd0OcAJXZLmGXWIyrX7eR2rDBGgSEmjkDND35p571vc+ev0q4nCm98djW
	 iFU6u0sJ/wH5gXgQZa8rikVJD8+bMY+P9rdEAA5Ya0w9J+tFmYkJG/fhk8vjyVA/yb
	 FYkgdbs7fDyXqeqn04ZCDEoxhJXoNiZOxJQO2E+wU3fl8oexuwlubnRBgzcA7AQx8+
	 BODFYQdUQndmSOlHblKJwgvQnqPtUtS2jXCqIo9e+eqRk+QmSe+p3mVS+SWIPhQDnB
	 JQJ5xH+er4Wm16E6kAnj4KxvnwOrjdD8602QP2ahiDSqvWLiVDbEpMW49GKEPuN1q+
	 4TnSc7LzyWDZw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gRF7N36Vkz7ylg;
	Thu, 28 May 2026 20:16:48 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gRF7L2Mz3z8sZP;
	Thu, 28 May 2026 20:16:46 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 58E586173B;
	Thu, 28 May 2026 20:16:45 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <021fb6d9-fb2a-42ac-9e50-06471fa76383@leemhuis.info>
Date: Thu, 28 May 2026 20:16:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: imx8m: Fix match data lookup for soc device
To: Frank Li <Frank.li@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260427-soc-imx8m-fix-v1-1-1fe5b43d8090@nxp.com>
 <177816879666.299775.3947960528231798400.b4-ty@nxp.com>
 <3cc57464-a10f-4b8c-9080-8d6f65a0d42f@leemhuis.info>
 <ahhxtz94pX9ujv25@lizhi-Precision-Tower-5810>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <ahhxtz94pX9ujv25@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <177999220591.1352586.10954214462288242738@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 58E586173B
X-NC-CID: Sgv4i8IrLrGndGPNw8vK7slwLPYMtNLjy/L9JFtz4eDsqIYAq1I=

[+Alexander +Francesco]

On 5/28/26 18:47, Frank Li wrote:
> On Thu, May 28, 2026 at 12:55:34PM +0200, Thorsten Leemhuis wrote:
>> On 5/7/26 17:46, Frank Li wrote:
>>>
>>> On Mon, 27 Apr 2026 09:01:48 +0800, Peng Fan (OSS) wrote:
>>>> The i.MX8M soc device is registered via platform_device_register_simple(),
>>>> so it is not associated with a Device Tree node and the imx8m_soc_driver
>>>> has no of_match_table.
>>>>
>>>> As a result, device_get_match_data() always returns NULL when probing
>>>> the soc device.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/1] soc: imx8m: Fix match data lookup for soc device
>>>       commit: 2c6821657ce3b3c85f92719ea81ec9f9ff27df11
>>
>> Just wondering: are you planning to sent this towards mainline this
>> cycle? The regression this fixes was introduced this cycle, so I guess
>> it's something that should be merged before -rc6, as that's when Linus
>> wants all known regression ideally fixed. But from the name of the
>> branch it sounds more like this is scheduled to be merged in the next
>> merge window (but I might easily mistaken there -- if I am: sorry!)
> 
> Thanks reminders. I intent to send for 7.1. But second look, not sure any
> big impact although it is regression.
> 
> commmit message have not show what impact.

Yup, there ideally should have been Link: tags to the problem reports,
as explained by our docs. At least if that patch fixes the problems
linked to below (looks like it, but I'm not totally sure):

> I checked code, look like only
> missed some soc informaiton. Let me know if I am wrong.

Alexander reported problems here:
https://lore.kernel.org/lkml/6593091.DvuYhMxLoT@steina-w/
That mentions a warning and problems with soc_id and serial_number

Francesco jumped in a little later:
https://lore.kernel.org/lkml/20260427064704.GA17710@francesco-nb/
This mentions "CAAM is not working"

Not sure what the impact is, but from the outside it looks a bit like
"better fix this now to ensure those problems never enter a proper release"

Ciao, Thorsten
