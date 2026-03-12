Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1407379EC7
	for <regressions@lists.linux.dev>; Thu, 12 Mar 2026 13:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322757; cv=none; b=CTg8fvOyRIdzDzNcgS5/AjtNKY6K498OHc7NfKydOYR0Zpjq+4HZ9IyP7LNX+pFwnavYm1VCXi/MuEhBDOnJIYbjCNHvkqoHzJrXiwcHwnNtm8sOL3R5gkzKl1jDEXUDySgCjvI1TLkXVNhRa2ASPNrBeibbXd8s6joUiPgJhV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322757; c=relaxed/simple;
	bh=JhWVgGC7tMzfo15by32/mSfnIgwmGOE+PqgLEc9ge9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J1HDtYu3Xu9xL3tMYpnl2LwR4QCJ+3j4wnG0QyV9tCbXukLuQj/kmiNC2shCm9ajNL316kFeBhInNzxuwWY7eHYlTBw0Li0ozh8TOHuE1RTTHckSaIU9rZ/x5EbmEIUeoG8pGSaN1c0OpICVfZCYuU5fshSIgY2wHR+oorynyYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=f0f0/Czs; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="f0f0/Czs"
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4fWpTb2gP0z77R9;
	Thu, 12 Mar 2026 14:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773322387;
	bh=JhWVgGC7tMzfo15by32/mSfnIgwmGOE+PqgLEc9ge9o=;
	h=Date:Subject:To:Cc:References:From:Reply-To:In-Reply-To:From;
	b=f0f0/Czs+7LH+V0GY1vS61NeFgM+iS+bhx/of4eQf6lZJYeOOvQvNR7PUgAZf/nQw
	 53vt9HUfEQkN857CFMXd4Brhaj44TNhxRHAldxNS1FDpywiKzbWOwsV74nsrJcQvFg
	 MNXE7StUPlN7lE237IYoQrYQNSzgHrrt52XuutGl+Z1naTrQ1fL04us1SPEY+k8ovE
	 uaixn9fM/bZAdEVNL1mvgzmCP0yPygDSu87+w8G0wzsam9MLusWZiYGa2w4jacQyDZ
	 MC4/YwYwQzHIA3T00EVrPhgAd+SsjmFCfCRhTefRr70oPigmaApMDfWH9nA4536eJ4
	 QHUbDpXCpCLnw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4fWpTb1xsrz77PR;
	Thu, 12 Mar 2026 14:33:07 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fWpTZ6VgXz8svH;
	Thu, 12 Mar 2026 14:33:06 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 5BCC963592;
	Thu, 12 Mar 2026 14:33:06 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b3d8717f-07f7-4921-8808-55db94dfdc2e@leemhuis.info>
Date: Thu, 12 Mar 2026 14:33:06 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] HDMI monitor shows no signal when the refresh rate is
 higher than the default 60Hz
To: Relja Vojvodic <rvojvodi@amd.com>
Cc: regressions@lists.linux.dev, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, hgfdgjn <shichuanyim@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: 
 <CA+tjKGrmADg=oG9CT74_mgGNN3h17=LLmnv51K=MggAqo7q2Eg@mail.gmail.com>
 <2026030839-applied-prominent-b774@gregkh>
 <CA+tjKGoWW70TRw6C+PMDbhpCh5P_jyJ9ciY3HckJystb+X26Mw@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: 
 <CA+tjKGoWW70TRw6C+PMDbhpCh5P_jyJ9ciY3HckJystb+X26Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177332238663.1158857.5613106655237936358@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 5BCC963592
X-NC-CID: 5c9AqRtQCniQ1nGvIFX2i2R48tIoemA2pqJvzw+kzMiahxpu7BM=

On 3/8/26 10:56, hgfdgjn wrote:
> 7.0-rc2 can also reproduce it; after locating the issue, it was
> reproduced using the stable upstream master branch.

CCing the amdgpu maintainers, as this seems stalled. Dropping Greg and
stable, they most likely don't care.

Relja Vojvodic, in case you missed it: this regression seems to be
caused by a commit of yours: 3471b9a31ce352 ("drm/amd/display: Rework
HDMI data channel reads") [v6.19-rc1]

Ciao, Thorsten

>> On Sun, Mar 08, 2026 at 05:42:39PM +0800, hgfdgjn wrote:
>>> Hi maintainers:
>>>
>>>   After updating to v6.19.6 on Arch Linux, if I set the refresh rate
>>> higher than 60Hz, the monitor displays "No Signal".
>>> I tried bisecting and found:
>>>> # first bad commit: [3471b9a31ce352ffb343cf02a991261880aac3a7] drm/amd/display: Rework HDMI data channel reads
>>>
>>> This issue on my machine was caused by this change:
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
>>> b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
>>> index 267180e7bc48..5d2bcce2f669 100644
>>> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
>>> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
>>> @@ -549,7 +549,8 @@ void write_scdc_data(struct ddc_service *ddc_service,
>>>      /*Lower than 340 Scramble bit from SCDC caps*/
>>>
>>>      if (ddc_service->link->local_sink &&
>>> -        ddc_service->link->local_sink->edid_caps.panel_patch.skip_scdc_overwrite)
>>> +        (ddc_service->link->local_sink->edid_caps.panel_patch.skip_scdc_overwrite
>>> ||
>>> +        !ddc_service->link->local_sink->edid_caps.scdc_present))
>>>          return;
>>>
>>>      link_query_ddc_data(ddc_service, slave_address, &offset,
>>>
>>>
>>> It appears that scdc_present is always false on my device.
>>> I reverted the change to write_scdc_data(), and the monitor works
>>> normally at high refresh rates.
>>
>> Can you cc: the developers and maintainers of this change to let them
>> know?  Otherwise they will not notice it.  Also, does 7.0-rc2 show this
>> issue?
>>
>> thanks,
>>
>> greg k-h
> 

