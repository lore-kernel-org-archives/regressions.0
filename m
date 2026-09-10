Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9EF409283
	for <regressions@lists.linux.dev>; Thu, 10 Sep 2026 10:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034837; cv=none; b=RZ3DNvFhREZDSnAYT//jGTiTVk5WGVM+fQItvOrHRbZpAEFVWCOI36+6B/bEKBDQSGiCR0hc82tuhNGmc4mkseoqkweWunGng88ESEN3w7+AqDFx2+fMgy6Rr5ake1YvCOqvjJ3Nj6iThGTJaZPTI78ZBYMhivdLodg6nUmX6+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034837; c=relaxed/simple;
	bh=U2oe3hVTq0qbVZ71h5xzm622BIjXk6fAitQw3V+ttao=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:To:
	 In-Reply-To:Content-Type; b=KpFkiMTfWW26fPfc3NKHu3VX2Yd9On2++bxD8YNHRpu3tdR6zZBMV9AQ+pOi/i3G01T/mGydLo2Y5rdkaBRWoJhg1yD9QpX7uT5degSLgCn/Alxmrl/enCx6EpfyLFmooTZrjPWEqgNHlFWp6EITwN5tInj7CQXBSW6KdByNgGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=LdLW4Xoo; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="LdLW4Xoo"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hgYHm0tlFz6HRc;
	Thu, 10 Sep 2026 12:07:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789034820;
	bh=U2oe3hVTq0qbVZ71h5xzm622BIjXk6fAitQw3V+ttao=;
	h=Date:Subject:Cc:References:From:To:In-Reply-To:From;
	b=LdLW4XooslJFoz/sa2h3IYoP4pGQohYUSDxl/jMt6+2szwvjxT4NeclZCfLTzvscX
	 VMpNxBEy3qDOciph7eCh+vl0tKQlvvk7EG0Rk+1JXDj+bH1UrSD5NamcL/+DZ/Q6uZ
	 mA0XgzLApmOJSCWfyGbrrXfK6CRoLMt5dvA/88n1UfWKLNf3R3d7d5HPtKUPeB2iZ0
	 5V9ScH7Fw0gS7dilfeHNkTTh9eYjj/hHZokIeOzg8TXNCOtd4IOqbcRhdsiPPmEqu/
	 EBYdBqj3BxXz7XLH/LGtp5X/ApLdZQL6gblnJt9gpqVAqbbbMuJojKWQgafat0oG1l
	 ASysU9RInMQfw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hgYHm08xtz4xNG;
	Thu, 10 Sep 2026 12:07:00 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hgYHl04ZYz8sch;
	Thu, 10 Sep 2026 12:06:58 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1B9E3604A5;
	Thu, 10 Sep 2026 12:06:58 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <27c82eb4-4f8e-41b5-b983-dff7a0a27951@leemhuis.info>
Date: Thu, 10 Sep 2026 12:06:56 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] media: ipu-bridge: IVSC camera no longer probes
 since v7.2 (CVS fallback returns the IVSC platform device)
Cc: Martin Jeanne <martin@badakan.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Miguel Vadillo <miguel.vadillo@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>, Lixu Zhang
 <lixu.zhang@intel.com>, Sergey Zagursky <gvozdoder@gmail.com>
References: <2f8b67fc-ec2a-46f6-9ee0-06279e612bde@badakan.com>
 <e8fd955b-fadc-497a-899b-a13502f0d7f0@leemhuis.info>
 <7646b50e-391e-49cb-a82c-3f82be7c2273@badakan.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
In-Reply-To: <7646b50e-391e-49cb-a82c-3f82be7c2273@badakan.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178903481857.1400903.6097560789328086809@mxe9fb.netcup.net>
X-NC-CID: X6oLH8qUumbIGo/YLfz4cnLw5wnH2eFZ/hZujGJ8ruT1YiTgd2k=

On 9/10/26 11:42, Martin Jeanne wrote:
> On 9/10/26 10:56 AM, Thorsten Leemhuis wrote:
>> Thanks for the report. Have you seen or maybe even tried applying
>> "media: ipu-bridge: do not use the CVS device lookup for IVSC", which
>> fixes a problem with the commit you mentioned and sounds somewhat
>> related to my (but I only looked briefly):
>> https://lore.kernel.org/all/20260902211524.5572-1-gvozdoder@gmail.com/
> 
> No, I had missed it, thanks. Sergey's analysis matches mine and his
> machine has the same IVSC (INTC10CF) and sensor (ov02c10), so my report
> is a duplicate of his.

Good to know, thx!

#regzbot dup:
https://lore.kernel.org/lkml/20260901194526.6369-1-gvozdoder@gmail.com/

> If a Tested-by on a second machine helps, I can try v3 on my XPS 14 9440.
Not sure, might help a tiny bit: the commit is in -next already, but not
yet in a -fixes branch from what I see, so it might still be possible to
add this to the change.

Which leads to the bigger question:

Mauro, what's the status of ce92674d8d8b29 ("media: ipu-bridge: do not
use the CVS device lookup for IVSC")? Given that we have two reports
about this, it afaics would be good to get this mainlined this week for
-rc3.

FWIW, there might be two more reports about this, not sure yet:
https://bugzilla.kernel.org/show_bug.cgi?id=221988
https://bugzilla.kernel.org/show_bug.cgi?id=221983

Ciao, Thorsten
