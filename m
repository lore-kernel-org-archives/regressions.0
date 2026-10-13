Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC60519DE8
	for <regressions@lists.linux.dev>; Tue, 13 Oct 2026 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899049; cv=none; b=hmAHxDmhQdH8X9IPmGHalZy9QxfpEh3NZedqExBYiUJB/TWQ++oa7T+WPinZ1MG3ED8RZhpWybO8rKji8TZNbUKaNRHpR4q6SrwVeRQJfV5s+I/b7ZCoahpjoWASKSO7af28NWufyzlKp9iimW+6LGV8RE4SMhr4TaZHX54MdBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899049; c=relaxed/simple;
	bh=kn1pWwRqpSQrn5KGooof/V03NDOuyyBzzBkT7Vi6SwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/N4Y8ElAfhUZAIDIg1YjP47um0MIrQKTaOvEaebmysY917NAmfsnRGI+mjHtk6V4NKJ1T+uReSyho0KH+2Ety2c67LtxFdnFQcrxSiFEwW7mFFCEzATIBiQmrbF7o26DV4tnbIvl7FLmgKq7ounAOoT9K7hplNOb8iBN6K/qLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=EPog4h01; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="EPog4h01"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4j3wWv1Qg1z8B09;
	Tue, 13 Oct 2026 15:43:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791898987;
	bh=kn1pWwRqpSQrn5KGooof/V03NDOuyyBzzBkT7Vi6SwU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EPog4h01ga+F8U3shEq7EMlLuCDz3HXb7iY9xLYTkixzfoVzjfJD+O/HRjG9ADSLv
	 Mx1VLeEzB6kJntJRTHlUZfyMdAGP1X3me3Mtkh5M7sf8LP6PpK4O13rik3qk8+IKfU
	 c9+EpsiaT8lPB8BhDT+wWTarOn8mKYTem+CiaKGii2duzSwBNlRTwLXiZcJD1GJqKJ
	 2KweN/+YbwoccjK3vJTpedsVqWBp/5yHAAslWokb/h8fzT8QWYZO+lZyX/S7keLpWX
	 oztl5IJwR8XlQa8OWqVNwJ5PMHo0MDh8KyGg5aHxX6qqvD2DfSGRllbhnzZvAifJBE
	 BZkiTMTlcSXsg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4j3wWv0hpxz4y7n;
	Tue, 13 Oct 2026 15:43:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4j3wWs1dMTz8tfq;
	Tue, 13 Oct 2026 15:43:05 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 8117F5FB0E;
	Tue, 13 Oct 2026 15:43:04 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <144d54c1-fc08-4135-82ba-7cab417ebc3a@leemhuis.info>
Date: Tue, 13 Oct 2026 15:43:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] 7.1: apple-gmux backlight dead on MacBookPro13,3 -
 PCI bridge left with VGA enable set and VGA 16-bit decode cleared, aliasing
 legacy VGA I/O over the gmux ports
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Haram Choi <haram@choiharam.com>
Cc: dri-devel@lists.freedesktop.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: 
 <CAAKWd2_MZSC=A2EHuEw3=eECr1QfaqrhYawW=njt5muk=5sA_A@mail.gmail.com>
 <0102019fcb5d411c-e0a555b7-46da-43a1-bd9d-6cb120f58a7f-000000@eu-west-1.amazonses.com>
 <ap_yIeUyNu5WxSnX@intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <ap_yIeUyNu5WxSnX@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <179189898482.895600.241311855441224226@mxe9fb.netcup.net>
X-NC-CID: v4imGa248cozeojC2LcUIjjt27yx0htnngaRM5/r3+Ng7SF8B04=

On 9/8/26 13:31, Ville Syrjälä wrote:
> On Tue, Aug 04, 2026 at 06:01:54AM +0000, Haram Choi wrote:
>> I think I have found the commit. It is not in drivers/pci at all, and
>> my previous suspicion of 94555ea9a048 was wrong. Apologies to Simon
>> for the noise.
>>
>> The regression is:
>>
>>   cc6ed470caa2 ("drm/i915/vga: Avoid VGA arbiter during
>>                  intel_vga_disable() for iGPUs")
>>   Ville Syrjala <ville.syrjala@linux.intel.com>, 2025-12-08
>>
>> I have added Ville, intel-gfx and dri-devel to Cc.
>[...]
> 
> Sounds to me like the best fix would be to explicitly enable
> 16 bit decoding on the bridges on these machines. That would
> guarantee that apple-gmux works regardless of which GPU
> drivers are loaded, and in which order.
Was this regression ever addressed? From the outside it looks like it
feel through the cracks, but well, it easy to miss something from where
I stand.

Ciao, Thorsten
