Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20782343888
	for <regressions@lists.linux.dev>; Mon, 13 Jul 2026 04:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783917587; cv=none; b=lq9t6nbUeDq+rg1JPf51xGenqztARXLdrL6NorAVNFdOWkDr6qvtHs16LtgswYMYNVaCvANTkyTb2AVDIGHxdBTn4gOBp1D88Ut7aZ9KCuEMoQvfzwVCKlvmOE7jvhujfgVv3IJuuq9K3yZ6NxUC7da1NWzToPGXOp4WbGR3zEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783917587; c=relaxed/simple;
	bh=JHU7NYI7g0n2n+JJ6517Mq/qydLJ0J2KYKMPeDmzfw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzfzidRxvdsxo0gDh2Jav9B+9c6gMKYf+UAmqWW7b1v0+QlhyuSOLYB03D26ll8IevHAEKEqUyzs5vRFv66U5cSIMTs7D7r5cgqoRHDJzrMD6ssOEhm/h+M/aNX7tUBy6rI81t4+LaSZdIxRCREfP6bcQ7ZdSAba3u8FXFjKvJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=TwlA8ifm; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="TwlA8ifm"
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4gz8qB5WJ1z8gM7;
	Mon, 13 Jul 2026 04:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1783917574;
	bh=JHU7NYI7g0n2n+JJ6517Mq/qydLJ0J2KYKMPeDmzfw8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TwlA8ifmJK9Iy21ZeYYS9A0aLQKHYCrm/lkkwIjN/bk4iQt28sT10oNse28a1JeXF
	 BE0YqDCqqnBymU2irG2H7VKhJ1FW9U3Th/RpVqjt6sShaOKewAqyo3k4O5EwcjcBzE
	 7ezUfTHJAaJ6aRhjD2pUMg6p8zN5ELoannjufLGKaGxT+hvbQEFpHpZMwlqBEJlQkA
	 DAAPFMpkFmf+p9WwIjRiF8yLidJYeQrXgVrNvZQLfn5J9kuiHRspyvpAYpw53r+B3S
	 tEwX/kI11EeD+GKsyyYefy6fIIXrupRoz2D4oOy15pb5oYjQ0k6F2mvcwA9ksXSeP0
	 V1v2I6kuIRN9g==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4gz8qB2sfhz8gGq;
	Mon, 13 Jul 2026 04:39:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gz8q95x9Hz8tZn;
	Mon, 13 Jul 2026 06:39:33 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2484C5FC3D;
	Mon, 13 Jul 2026 06:39:33 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <7669b6bf-1c23-4261-9977-c13828e056ce@leemhuis.info>
Date: Mon, 13 Jul 2026 06:39:31 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BREGRESSION=5D_2017_Pixelbook_backlight_control_d?=
 =?UTF-8?Q?oesn=E2=80=99t_work_with_7=2E1_kernel?=
To: Papool Chaudhari <Papool@chaudharilaw.com>
Cc: regressions@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
References: 
 <CALcz8n5nB=H8CZza-Pw==GfQWRViJwWK8N5PgafE-4pdUJL-LA@mail.gmail.com>
 <2026070936-geologist-yapping-31f4@gregkh>
 <CALcz8n6VtL5D20WCJEsiBRDRKOE6GsF+YPCc+XuS2xr-mqnSTg@mail.gmail.com>
 <2026071109-armchair-civil-7b62@gregkh>
 <CALcz8n4XCt8GK0X=JTDOkMn32Z73HpHKRNaRCdSf=mzr3+r27A@mail.gmail.com>
 <2026071153-wrench-operating-e32d@gregkh>
 <CALcz8n7XoEvYK7PM+WWuQ2rBaWujc3YTQh1DWvLxoRHt3bAT9A@mail.gmail.com>
 <2026071254-resort-supervise-7d28@gregkh>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <2026071254-resort-supervise-7d28@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178391757339.3190664.2856584981283440816@mxe9fb.netcup.net>
X-NC-CID: hzgeT4Ohe5hRKZcjN8D2U+uZ5jTa8ARZjWIpImmgLwH2kCx2Ttg=



On 7/12/26 07:50, Greg KH wrote:
> On Sat, Jul 11, 2026 at 12:38:02PM -0600, Papool Chaudhari wrote:
>> I tested both parent commits of the merge
>> b3793af3277f65d256d67f9949e760b434ff66dd on my 2017 i5 Pixelbook (Eve)
>> as requested, and unfortunately, neither side is bootable:
>>
>> Side A (51cc1c427461): Fails to boot. Completely hangs early at
>> "Loading initial ram disk".
>>
>> Side B (88919bedabb8): Fails to boot. Hangs at the exact same early
>> "Loading initial ram disk" stage.
> 
> That sounds like a different issue than the backlight, right?
> 
> Why not disable the ramdisk entirely for doing kernel build testing like
> this?  It's not normally required unless you have some encrypted
> partitions/disks.
I also wonder if something went sideways with your build env and causes
this, like some odd .config thing. Might be worth building a newer
kernel once more that was known to work at least mostly in the past and
check if that still works.

Ciao, Thorsten
