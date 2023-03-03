Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758031FB3
	for <regressions@lists.linux.dev>; Fri,  3 Mar 2023 09:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677837005; x=1709373005;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uIoGKTM+botEjFPFMsCu6mxNY93QEUww5QbbHkHHhtI=;
  b=ocBGWZQU5ql1XXCD88mKKIlHCtC/jljloPxY1dZsStevJXoei+IaDUpl
   UrbivOMKMHMTIAiMPPPinsVXGAwjVte4VNONQQ8UXr2j7JFbEV9hmKhcU
   J7wCzI4IdElIz4bXPnk3pfnWh4VAQbKEx9wHLxqhvp/pGVBC1xkN4KmQM
   /GihkcEHVx04v68TFbdAWJ3Dzz+9TGgiW8nTZC2Le7pz+88CqGZ2j2NEr
   M9ZTTvp9U3zwF9CzHXSka3t51bPKikb4ollIIWwaCbhCnsJ5f83+S7dA6
   WdYlmwTOPGcOrWSOM9CwfyYi+QfW0bQD4RiMBMmA3IyCizdR6cLiWSn8m
   A==;
X-IronPort-AV: E=Sophos;i="5.98,230,1673884800"; 
   d="scan'208";a="229683741"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2023 17:48:56 +0800
IronPort-SDR: g1stAwf+qQjw/n/lfr+jPvdigEUfijoNKGFy+HAjCVc+9iSSkU06facrYO0CRqVhvM10Xm3WXM
 c8kZW/MuvQQhj5wTzKcYyAqGg5fLuBuKWRu0VujMoezth5Sh86JGc2IUgE14wzXVNJRk5/VmOL
 +DuwzEBUtbJjU02oT2vzYW1SsOA9vOmfhucR5WKUbSDjY9CuBouCNLlym0xhcGx1r6UMZwhKQe
 u2y/XbVVZUcdJp2YV8XZ7LO+sA+SEl9jp1H6AH2zf2cNs6eo90rc6bJ0D7dlSiGEsz0CzptZKR
 dKw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Mar 2023 00:59:59 -0800
IronPort-SDR: F20zIupkt1sbWrznvo3+i+T/ynr6Bf8tUs9JPsIKy/dIZI1lVIqVrevBdAWwYuL5gUWFVaWXK6
 nIPPvIQbKOI6g0twcOMiwSsV0mUjusTC3pLUeIPLlAozfY5ja6Ph/phrsuwBHSG82EBCWmW1tM
 DgbNqWYRv81Z/0W2vy6gdPy6Y9vgVLKKcfJDCk748sUPxKmvsrSDMIipCLF3q0Ka5saXCNMFW1
 BAoaqESOI8XKgIe1UTH4mQ+iizVoMmzSkW5lnKdWDLf67vkSRmgVjdWN4Snz+A4IlN9K7Xc54Z
 Q3s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Mar 2023 01:48:57 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PSjpv6b0wz1RvTr
	for <regressions@lists.linux.dev>; Fri,  3 Mar 2023 01:48:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1677836935; x=1680428936; bh=uIoGKTM+botEjFPFMsCu6mxNY93QEUww5Qb
	bHkHHhtI=; b=qupa7oQRg9BOLX4qEG+sh+IsrkELz8Lg8XNpWttJmF+iGgYJbIz
	9ARw8CzOip9WdFO2Xx52cEIQBRUdXF39Om+RmOKO+az5wK0f+zmLKf9HK6Q+w4tG
	qu2aBAOwmVY/W4D3+qIAlzhN88z22PtfRsFdUTvvKX6KgXbfCn8WWUC6rlj+nA5R
	Dbi971vktYK6dO56VzfwcUKutLq2wgsYLRqTk8Je9BSzK98nkvlCcX/xMjC95Zit
	bVCzXVAmAwXlfRPDS8zabb4hwBJU51FpVAH7FsOb6wAV1/YWpbEJJYeyoMcZijem
	dN6TKgI2aGMJ0DaynHZzqgYLNIWKmIbZzHQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dFDgkYpTE_W6 for <regressions@lists.linux.dev>;
	Fri,  3 Mar 2023 01:48:55 -0800 (PST)
Received: from [10.225.163.47] (unknown [10.225.163.47])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PSjpt1k4Yz1RvLy;
	Fri,  3 Mar 2023 01:48:54 -0800 (PST)
Message-ID: <af6a355b-3ac2-a610-379a-167e87145368@opensource.wdc.com>
Date: Fri, 3 Mar 2023 18:48:52 +0900
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [regression] Bug 217114 - Tiger Lake SATA Controller not
 operating correctly [bisected]
Content-Language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Simon Gaiser <simon@invisiblethingslab.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, emmi@emmixis.net,
 schwagsucks@gmail.com,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <ad02467d-d623-5933-67e0-09925c185568@leemhuis.info>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <ad02467d-d623-5933-67e0-09925c185568@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/3/23 16:10, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, this is your Linux kernel regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org that apparently
> affects 6.2 and later as well as 6.1.13 and later, as it was already
> backported there.
> 
> As many (most?) kernel developer don't keep an eye on bugzilla, I
> decided to forward the report by mail. Quoting from
> https://bugzilla.kernel.org/show_bug.cgi?id=217114 :
> 
>>  emmi@emmixis.net 2023-03-02 11:25:00 UTC
>>
>> As per kernel problem found in https://bbs.archlinux.org/viewtopic.php?id=283906 ,
>>
>> Commit 104ff59af73aba524e57ae0fef70121643ff270e
> 
> [FWIW: That's "ata: ahci: Add Tiger Lake UP{3,4} AHCI controller" from
> Simon Gaiser]

I sent a revert with cc: stable.

Simon,

Let's work on finding a better solution for enabling LPM for that adapter
without causing regressions. I will need your help for testing as I do not have
this hardware.

-- 
Damien Le Moal
Western Digital Research

