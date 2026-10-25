Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.38.247.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792909724;
	b=Ep+N2OeIEEe9JR9U9etbMNjRa3/2u4k8kUfpHKCf4xs5VrpstqF36t2VREhrOlwjK372
	 tonZWhs8X5cwHWLILR5gexlhu3aZzZX4wgIVQ16E7M2QrL5IDfYU47MtvVGAImABoy68W
	 9LkcyfyaBAKdnvI1EzATtB2xsGkeEvV37njsH77/lsPDgUmFzCQFrg8UrFCpLzvs7I378
	 8t5zSlbw8xQahk4d/25Dc4cOhXfxW3v5mPrkj/Q5afSvnwLylPnK46jtfHQtHq8sqcaFT
	 yhlgSCIu/oiYwoV3QDl8S5mHzQiuz1GjpozT5CLvDBldIla7+FcTVgQ5wrJsKevpM1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792909724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=td0xhLqxPtCtucyFvg5GGJAM6SWXYBLzBIie2ytR+m4=;
	b=IfqKlxhAHwwdzKws9OjwoXVlcnqrl1/N/MFUhZ/ly55Scda2LS5JL83BFDcac5PZ/3MM
	 Pkuj5uiqSi0dWoDCmlj3fRjE/5V/1db/rV+YUEHBbQ59I3kOmhXK6zzuv2zoReTd+39h4
	 OikWRs8c0wd1N9kg6ZnXaxXrQXPLN79ghA3nwBazapcPqdv8k6M4LqlGY/NUcatNDYhvm
	 8TRuiHI+Lvq+HNFA9Wz7HB5a3l2h7g3T/bfb7BowA6TzkGMzj6N4l9kNsUAAMEeS8MdYZ
	 +hlZ/+Evief235FTceNgv08BCZgb66I+vuLpABzM4L+GFhWhqcxezKcY/GawXDUR1zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=frFK5+ms;
	arc=none smtp.remote-ip=46.38.247.119
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A75606A31A
	for <regressions@lists.linux.dev>; Sun, 25 Oct 2026 06:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71A75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=frFK5+ms
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4jC6Hh51R2z8Syy;
	Sun, 25 Oct 2026 07:27:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792909648;
	bh=K/ZiyT5YUeBIaU+YqvmFgcl0w/wbqgWGfHRcA8lzAbs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=frFK5+mszTLtKYe4LiOvJB98V72CxJS44G8+/UD/Z7dqUuNmBugzNcUQpGKlIanrE
	 BHqhsIV1E65NT95n6ZuHB/N269naiKlcNwa114IxMQnPJlxG7LusIOO+dB0nfkiA/T
	 ESXxaknvyoG8U5TMbJpneCeyjFndu9gDOEVCFiJKfQxAXvRgfCxEzvzMtE9S1eKM8q
	 AD7LVqEwVLzJzXZQ6iUQJtqcMZRXNrD+Iwcfq/LZONWICAsKsWXgB3yY+MTXGtV5gd
	 Pwfd1HTbjTLLxEhTYtv/wBic5zFmI1FXUwEBoS2zRaXviHUTRzoUR2esjBUJ1qNBYT
	 moFIvxJ4KWkmA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4jC6Hh4JMLz4y38;
	Sun, 25 Oct 2026 07:27:28 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jC6Hg4896z8svZ;
	Sun, 25 Oct 2026 07:27:27 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 697425F9EA;
	Sun, 25 Oct 2026 07:27:19 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6299a7bd-a934-41b2-95f9-d68056551714@leemhuis.info>
Date: Sun, 25 Oct 2026 07:27:17 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression 6.12.y] After backport of 980084de4d9b ("Bluetooth:
 btusb: Add ASUS USB-BT540 for Realtek 8761CU") bluethooth not anymore working
 on 0b05:1bef ASUSTek Computer, Inc. Bluetooth Controller (requests firmware)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
 Salvatore Bonaccorso <carnil@debian.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Erik Brangs <erik.brangs@gmx.de>, benh@debian.org, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-bluetooth@vger.kernel.org,
 1149377@bugs.debian.org, Christoph Zwerschke <cito@online.de>
References: <8aa88f3e-2dd7-4bfe-a0f3-e5ecbbade84f@leemhuis.info>
 <2026-10-24-1-daily-reply-0001-bluetooth-asus-rtl8761cu-firmware@kernel.org>
 <2026102508-thicket-duration-c971@gregkh>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <2026102508-thicket-duration-c971@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179290963998.1045469.17593029835196345954@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 697425F9EA
X-NC-CID: kYRygMnJtKhrCP37Qd34WBfYQr0f7InRGES5DgEHB1c/1Cl4eXg=

On 10/25/26 07:16, Greg Kroah-Hartman wrote:
> On Sat, Oct 24, 2026 at 04:10:59PM -0400, Sasha Levin wrote:
>>> I did meanwhile and agree, the backports of these should be reverted
>>> from 6.18.y and 6.12.y:
>>>
>>> * 980084de4d9b25 ("Bluetooth: btusb: Add ASUS USB-BT540 for Realtek
>>> 8761CU") [v7.3-rc1]
>>> * 6f0624b4427e38 ("Bluetooth: btusb: Add ASUS USB-BT600 for Realtek
>>> 8761CU") [v7.3-rc1]
>>> * 4a23ce935f74d1 ("Bluetooth: btrtl: Add the support for RTL8761CUV")
>>> [v6.19-rc1]
>>
>> The stable trees match mainline here, so nothing is going into stable for
>> this. The fix has to come from the Bluetooth maintainers or Christoph: an
>> upstream revert of the ID commits, or a fallback to the ROM firmware when
>> rtl8761cu_fw.bin is missing. Stable will take either one for 7.2, 6.18 and
>> 6.12 through the normal Cc: stable route once it is in mainline.
>>
>> The other way out is on the distro side. rtl_bt/rtl8761cu_fw.bin has been in
>> linux-firmware since 20251111, so a newer firmware-realtek package fixes this
>> without any kernel change.
> 
> That's the simplest solution, any users hitting this should also upgrade
> that package as it's been out for almost a year now.
Feels wrong to me, as
Documentation/driver-api/firmware/firmware-usage-guidelines.rst says
"Users switching to a newer kernel should *not* have to install newer
firmware files to keep their hardware working.". So what those three
commits did in mainline even there could be considered a
mistake/regression. No worries, mistakes happen. And reverting it now in
mainline would do more damage than good. But overall it feels wrong to
bring that mistake over to older stable series.

Ciao, Thorsten
