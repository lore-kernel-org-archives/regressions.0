Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCCA21106;
	Wed,  7 Feb 2024 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707297135; cv=none; b=Ik2iYYKfLS0FSR2feLdDyBub2ZcfsCtYcdqZrhvEKJTlO2IqJ5ayEoiyjaR/DVOk828Inmwtsa8tnB29IAg731WdYU30fGbGp0+fv8vAFTt4h9GYcBqzo0mlBI41oh7eas6UhN4OinZaaq5gfyy2ZiskpTYlPF8DjHQFn/nwSdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707297135; c=relaxed/simple;
	bh=U4yqjF9Qkz7xKWRLQercCjsXrQsl0I3MKjhXB65d8ao=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=aSkWTPVjSWdFw1qNo+JGQ2t0hMlv0xp54xgm+99bkoByKK6Hl8ZYifVFCNkHZ8Ps1z3m5YpD65VN1PBevVOVZX1wBQ/D51U5NLa/h62kON1839sUsnYIDd0kIsa8BVKBVyvJ7tUu0apuIqojc7CJWCa2hIk3/ZBOb0eJEgWnzqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rXdyS-0001x7-Ih; Wed, 07 Feb 2024 10:12:08 +0100
Message-ID: <b0388b9e-5ec2-422d-94ce-192b33fef16d@leemhuis.info>
Date: Wed, 7 Feb 2024 10:12:07 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel NULL pointer dereference on hotplug
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Olliver Schinagl <oliver@schinagl.nl>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 linux-usb <linux-usb@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <c24c7882-6254-4e68-8f22-f3e8f65dc84f@schinagl.nl>
 <20240204064049.GD8454@black.fi.intel.com>
 <705fd33a-18af-44b2-b6ee-57e3169b7032@leemhuis.info>
In-Reply-To: <705fd33a-18af-44b2-b6ee-57e3169b7032@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1707297133;5c7c1cde;
X-HE-SMSGID: 1rXdyS-0001x7-Ih

On 07.02.24 07:13, Linux regression tracking (Thorsten Leemhuis) wrote:
> 
> On 04.02.24 07:40, Mika Westerberg wrote:
>> On Fri, Feb 02, 2024 at 05:47:01PM +0100, Olliver Schinagl wrote:
>>>
>>> I noticed this nasty kernel NULL pointer dereference yesterday on
>>> 6.7.2-arch1-1 (haven't done this in a while) but also today, after updating
>>> to 6.7.3-arch1-1 it's still there, so dumping the panic here. Hopefully
>>> it'll be resolved by 6.7.4-arch1-1.
>>
>> Thanks for the report.
>>
>>> The thunderbolt gbit adapter always worked in the past, so this seems like a
>>> regression. Anyway, here's the log.

FWIW, Leon Weiß (BCCed) just posted another NULL pointer deference issue
in 6.7 and found the culprit; for details see:
https://lore.kernel.org/all/38c253ea42072cc825dc969ac4e6b9b600371cc8.camel@ruhr-uni-bochum.de/

Sadly Leon's report lacks a backtrace we had in this thread (
https://lore.kernel.org/all/c24c7882-6254-4e68-8f22-f3e8f65dc84f@schinagl.nl/
), so it might be something totally different. Leon's problem afaics
also happens on unplug while this one on hotplug. But well, I thought I
better quickly mention it here anyway so everyone is aware of it.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
