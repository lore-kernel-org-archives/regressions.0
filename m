Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAE71BDE7;
	Wed,  7 Feb 2024 06:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707286446; cv=none; b=ci2H5V95n9ab2dvA2h575rmDOBWjNN9TM3SaBjadzl2H1aaFVSTW/tWuH60sX4cCOid0/mkG20mRtzTgvsKnVrkA2fWCCjbP1z9aicAABOgNGnINad9KPm+g/N58zJo0JalLH7amUUsqmjST+8LoUCMX/tu2WvUSwBYX+kwTBQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707286446; c=relaxed/simple;
	bh=GYDfQsfL1MNM892yj8XH8lDpUFsNeRA0UwuaV6bh1us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+89D+VIYXMTefszVb4lLQxfXGXE0tW40vtqiZJDD7yKPkXB2hGijCkKzI+GC/tZa1y8CfR/8LSSH+Szicd34hd3jje4CRHMOnQv8/9Kj6+5FJ6uyzfhndH4XmnBaSDeoMY2cGg9DgmmmP3EDi5ackENahgfqq7Ki5YdFRlUpc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rXbBy-0005JF-8A; Wed, 07 Feb 2024 07:13:54 +0100
Message-ID: <705fd33a-18af-44b2-b6ee-57e3169b7032@leemhuis.info>
Date: Wed, 7 Feb 2024 07:13:53 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: kernel NULL pointer dereference on hotplug
Content-Language: en-US, de-DE
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Olliver Schinagl <oliver@schinagl.nl>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Michael Jamet <michael.jamet@intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 linux-usb <linux-usb@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <c24c7882-6254-4e68-8f22-f3e8f65dc84f@schinagl.nl>
 <20240204064049.GD8454@black.fi.intel.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20240204064049.GD8454@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1707286444;67e4569d;
X-HE-SMSGID: 1rXbBy-0005JF-8A

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

On 04.02.24 07:40, Mika Westerberg wrote:
> On Fri, Feb 02, 2024 at 05:47:01PM +0100, Olliver Schinagl wrote:
>>
>> I noticed this nasty kernel NULL pointer dereference yesterday on
>> 6.7.2-arch1-1 (haven't done this in a while) but also today, after updating
>> to 6.7.3-arch1-1 it's still there, so dumping the panic here. Hopefully
>> it'll be resolved by 6.7.4-arch1-1.
> 
> Thanks for the report.
> 
>> The thunderbolt gbit adapter always worked in the past, so this seems like a
>> regression. Anyway, here's the log.
> 
> Can you try to bisect this, preferably using the mainline kernel? Let me
> know if you need instructions how to do this.

Olliver, did you try a bisection?

BTW, I'm working on a document for the Linux kernel sources that
explains a Linux kernel bisection. Might be helpful:

https://www.leemhuis.info/files/misc/How%20to%20bisect%20a%20Linux%20kernel%20regression%20%e2%80%94%20The%20Linux%20Kernel%20documentation.html

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
