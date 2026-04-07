Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB761EA7F4
	for <regressions@lists.linux.dev>; Tue,  7 Apr 2026 07:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775547268; cv=none; b=tAOwDPnQZBcExBcNG3rS95OdOldXcVU0O1cm8pHff45BZaiRDHdjG25YScvUcJsVkMq+5B8V9tTMVuWLWubUtP+RyOwy5PJwRIKTKPXZZMASQ3SiI75WyWlOEe1XieTN77I2ZM5Pbmeh+q7WnGkyU65AswcSk6C1KYdkVbiHfEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775547268; c=relaxed/simple;
	bh=Cf3AjLkqLPRYPx0QPok1QyrWU3u503Asy8kNdFV94sA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/WQPJl8qep6JXTCTyPSzJgx8pYF7tA4shDO79SPNciH+kzaFbLMpI6V/3hgprEIr2AYLco2yQvaiJUmzGMDOQW0cSPq0EQlGHDgdjXRjGDHtQ57KixdVLtt8CqBb23RFnqAaSCKSJIWTOiNqrGlhAZjdOI9DdRM6t+041pvde4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=YC4G+wba; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="YC4G+wba"
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4fqd5j3YKwz71x3;
	Tue,  7 Apr 2026 09:25:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1775546745;
	bh=Cf3AjLkqLPRYPx0QPok1QyrWU3u503Asy8kNdFV94sA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YC4G+wba0Ra5MFhDF12uJLnh/Seq8/EwFwuYL5bRIJ1kSkPY3I9O11d3JScJRZq84
	 nyjx78Z64HW4K1e2egOywb7A1p3wTc1roeIZ7SxvKURidEnFC47qdb5OWYfj+YlR6V
	 /KgSwBIuVVhGCuul/Stos6magnbrfSuH1jdwe1fa6699q2O7LwscBO13d9pHGpuskV
	 0bpGvfWHA2NDSMOn7DtOJure/dlCmSfXnxM2kV8tvkA2H4iXLAMBhB+oCFXqAqDeTp
	 PgxWRBGtUWyzSeaf5MbCTZdGBHM++RGyYxoTOUaTLX9vVsES3vaSQuCVx8AbiZ6uTI
	 ifutNmwims/HA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4fqd5j2r4Hz71dG;
	Tue,  7 Apr 2026 09:25:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fqd5g4kM0z8tcG;
	Tue,  7 Apr 2026 09:25:43 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 83ACD632A8;
	Tue,  7 Apr 2026 09:25:42 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <db0b57fb-3379-4657-8a03-b0c632f2b491@leemhuis.info>
Date: Tue, 7 Apr 2026 09:25:40 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AW: Lowspeed USB device enumerationg under 5.4.288, but not under
 6.8.1
To: "Fischer, Simon" <simon.fischer@ipp.mpg.de>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <8a29db20f78046578e8dc2c516607240@ipp.mpg.de>
 <2026040255-zone-chamomile-964f@gregkh>
 <dbb6846930a044558a52201d5d53a851@ipp.mpg.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <dbb6846930a044558a52201d5d53a851@ipp.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177554674278.3281734.14359598507182801858@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 83ACD632A8
X-NC-CID: uM7oTh3DMna+L4A7VrFKbgqayUSrssuxspMRkTS6TcWlmED1NLY=

On 4/7/26 08:33, Fischer, Simon wrote:
> 
> the same behaviour is still present with kernel 6.19.11
> Anything else I can try/provide?

Normally a "git bisection"[1] would be asked for to find the change that
broke things. But given that a 5.4.y versions was the last working
version it might not help much. But if nobody comes up with a better
idea it might be worth a shot.

The 5.4.y kernel you used was also not vanilla, as you mentioned
PREEMPT_RT, which was not upstream back them. Might also be worth ruling
out that it was an influence by trying a 5.4.0 vanilla kernel before
starting a bisection.

[1]
https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html

Ciao, Thorsten

> -----Ursprüngliche Nachricht-----
> Von: Greg KH <gregkh@linuxfoundation.org> 
> Gesendet: Donnerstag, 2. April 2026 18:10
> An: Fischer, Simon <simon.fischer@ipp.mpg.de>
> Cc: regressions@lists.linux.dev
> Betreff: Re: Lowspeed USB device enumerationg under 5.4.288, but not under 6.8.1
> 
> On Thu, Apr 02, 2026 at 03:34:35PM +0000, Fischer, Simon wrote:
>> Dear list,
>>
>> I've tried to dig deeper into the issues, tried different quirks and small patches, but was unable to solve this or find the root cause. As this seems to be a regression of 6.8 from 5.4, I hope this is the correct list?
> 
> 6.8.1 is not supported by anyone but canonical, so there's not much we can do here, sorry as that is a very old and obsolete kernel missing tens of thousands of changes.
> 
> Can you try running the latest 6.19 release instead?
> 
> thanks,
> 
> greg k-h
> 

