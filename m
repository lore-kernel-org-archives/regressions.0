Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3302D63CB
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 10:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147904; cv=none; b=RsebMnmdPpewJGUrZ2IoiFy55coyh5G07oOhqG9B1+eJxd8Ws/AuHMpKCt5Sais94FCmcdFTMZO0ad/ap6/JUGEE1kPzNjHIXADP5bZjiY6xWPlyRJ9SMKJM4M6XGaWHbgZK1TRoWRu0P0y3IroMm6RwctD2Of5t89gc/HMa8uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147904; c=relaxed/simple;
	bh=LVoYEVrz89Qz1/wV1kOuijoh+5QRCSESwWPskexaepk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=E33PZzv+CnWzmr0kQqIRmPne1ZU91qNqvAQmMK8msk21+7RlbTeU0mduQQzVAHdvZXrtPHKeWSYs7Sg8oKjrYKJUk75agZ7blmNs04TKdkplgqo5oyHQFQgMOTGpf0F/S1IvGx2qbgMC8rmOd6T8byznIscz6BLYbN3Ny3Ri3pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=jqqHq4Im; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="jqqHq4Im"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4j5hZ859TCz4LHq
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 12:51:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792147872;
	bh=LVoYEVrz89Qz1/wV1kOuijoh+5QRCSESwWPskexaepk=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=jqqHq4ImCr2Rg3L9//pmNQnJ6B/WLwX0naU5kJ8dUz9lsgCjg3ZaXXtcodbp4eGKu
	 pwbqZ+DkuXtgSIZmJhw5v1QmMxmbcS8UBFMii0dG3K5Lz2jdpa6wBljxc2d4P6RuC/
	 Xcxk4+VHg77jn1Na93K8hHF72p6TdniEIeuAq9QietaNLN9Pw8IgQ8ICXyOO4Y+B9e
	 qTXsJaKWL9IxTGri33egfZHxby8UzZjbt8dcVtvcR080ozPYK7Pc9D0zfuRw95hTGF
	 aHg56qBgrEdNQ4QMDrTygRHRX16zg1VwVXLhdxa9IC291K84Ca/vyZUmXNDGqHjjJD
	 jTM48UKVbeQHg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4j5hZ84N1yz4LCq
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 12:51:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4j5hZ75TLbz8tYV
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 12:51:11 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id EC95E5FB34
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 12:51:10 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <e0def0b2-6eb5-436f-b975-35b5dc68624d@leemhuis.info>
Date: Fri, 16 Oct 2026 12:51:09 +0200
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
 <179214787116.4007618.10132138990138730446@mxe9fb.netcup.net>
X-NC-CID: ink+E+YW6v1dSylHUtgGQN/VgMAiobG3hwCCy05Cihm7HvYPl+k=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5986
#regzbot introduced: 3c108046e1d6
#regzbot title: drm: amdgpu: eDP luminance flicker on VRR-capable panel

#regzbot report:
https://lore.kernel.org/all/4F0FAEB6-A13B-47F3-BFF1-C706686C6F64@gmail.com/
#regzbot introduced: 2640e64195948


