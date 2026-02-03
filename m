Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775B31A840A
	for <regressions@lists.linux.dev>; Tue,  3 Feb 2026 10:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770115340; cv=none; b=H8PkSogwNYCYDW0nfjKrOlLE+zzi+NWL78E7Y73LnxzeROVbRj2meYoUDCKQSdTXBBrQaCrZNVSo919NxYH8bukOJFeOL+WB1yYXapm768F5vfjFYF7e1+eLzxG6LDKhqU3iNpzab0HYEMjuyFEHcSynBbZYeet0pe2wf8a1vsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770115340; c=relaxed/simple;
	bh=ltQo6UtbL4cxnY12tEyk+BUbsgiar1y0L8VwNUl6s7o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OytxQ6Q2fDGwdbADKiSuj11Nus/khlLBAW4xIY8J+DuOQHSgnFhmnWXw3QXPt6qWRHXUXIgzoeBlUMoU55bfp52kwYCs5uTYeSiwcrJKuJdfCGrX6UcAZba/j2Wr64VJe/UZmCov3gV6ttExQVQAo3T97b2ij2jl3p9KmL2tLwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=3V3/ewB7; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="3V3/ewB7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=hXHBxdO+y6TAB7miY3sJ/vJlz5vGfecCgP/B8PbW8N0=; t=1770115338;
	x=1770547338; b=3V3/ewB7I8JWY49XGNrIshg2LZE6mnMVMy4xoi7qQOFPNxUKjQY32F5ZzpFjm
	RhE1VYqxrgpxIUrie6ZocpKVI03B5/IgVSTnCR9LyNGM+htZEz3uP8XdwVGRIRUEJLLmWolXF5U+6
	rH3VzT7aPp9FKtjuqdKQXk8ADq1147wOnzKYtCNBs1LNf5R8bYipFYvRc5osLDZA+iIq08BjsSuWD
	yS6LAVAhSQpc24ztIY0b6gGAs9g49htO1PzM3MGD4++8Lazdpn+CRr768QreR3qIIwQlKcBz5rEdI
	YGJmnnoCOxVgGZ69bUDT8jvaP2/YIjO0FjAtjKi13bmXy8ei2w==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vnDrE-002zze-1B;
	Tue, 03 Feb 2026 11:42:08 +0100
Message-ID: <45c528cf-901c-47d5-a8d2-a4010105e30f@leemhuis.info>
Date: Tue, 3 Feb 2026 11:42:07 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] wifi broken on pinebook pro
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, regressions@lists.linux.dev,
 Jan Palus <jpalus@fastmail.com>, Peter Robinson <pbrobinson@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, FUKAUMI Naoki <naoki@radxa.com>
References: <aUKOlj-RvTYlrpiS@rock.grzadka>
 <CALeDE9OzCzbhKmc61Kgbmzr67oJnjZMjsO6yYbkXujzA-OuO+A@mail.gmail.com>
 <5f8805a8-b2d6-4bc3-9c6c-c8fc696daacd@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <5f8805a8-b2d6-4bc3-9c6c-c8fc696daacd@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1770115338;5a1de5a8;
X-HE-SMSGID: 1vnDrE-002zze-1B

On 1/14/26 14:03, Thorsten Leemhuis wrote:
> [top-posting to facilitate processing]
> 
> Peter, Heiko, what's the deal here? This looks stalled. Is temporarily
> reverting an option, or would that cause regressions for other users
> that already benefit from the change that is causing the problem?

I assume this wasn't fixed yet (Jan, please correct me if I'm wrong!):

Heiko, could you maybe submit a revert? Fixing this is long overdue
afaics, as Linus just recently wrote ""rule of thumb [to get
user-reported regressions fixed] should generally be "within a week",
preferably before the next rc.""[1] – we are way past that.

Note, I assume this will break things for people where the change in
question improved things. But I suspect he in a situation like this
Linus prefers to go back to what was "normal" before the culprit was
merged. If we are unsure about this I guess we should get him involved
to clean this up.

Ciao, Thorsten

[1]
https://lore.kernel.org/all/CAHk-%3Dwi86AosXs66-yi54%2BmpQjPu0upxB8ZAfG%2BLsMyJmcuMSA@mail.gmail.com/


> On 12/29/25 07:23, Peter Robinson wrote:
>> On Wed, 17 Dec 2025 at 11:26, Jan Palus <jpalus@fastmail.com> wrote:
>>>
>>> WiFi no longer works on Pinebook Pro after upgrade to kernel 6.18. It
>>> appears firmware fails to load:
>>>
>>> ...
>>> mmc_host mmc0: card is non-removable.
>>> mmc_host mmc0: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
>>> Bluetooth: hci0: BCM: features 0x0f
>>> Bluetooth: hci0: BCM4345C5 Ampak_CL1 UART 37.4 MHz BT 5.0 [Version: Version: 0039.0089]
>>> Bluetooth: hci0: BCM4345C5 (003.006.006) build 0089
>>> mmc_host mmc0: Bus speed (slot 0) = 148500000Hz (slot req 150000000Hz, actual 148500000HZ div = 0)
>>> dwmmc_rockchip fe310000.mmc: Successfully tuned phase to 55
>>> mmc0: new UHS-I speed SDR104 SDIO card at address 0001
>>> brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43456-sdio for chip BCM4345/9
>>> usbcore: registered new interface driver brcmfmac
>>> brcmfmac mmc0:0001:1: Direct firmware load for brcm/brcmfmac43456-sdio.pine64,pinebook-pro.bin failed with error -2
>>> brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
>>> ieee80211 phy0: brcmf_bus_started: failed: -110
>>> ieee80211 phy0: brcmf_attach: dongle is not responding: err=-110
>>> brcmfmac: brcmf_sdio_firmware_callback: brcmf_attach failed
>>>
>>> compared to 6.17 instead of last 4 lines with errors there's single one
>>> with info about loaded firmware:
>>>
>>> brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/9 wl0: May 14 2020 17:26:08 version 7.84.17.1 (r871554) FWID 01-3d9e1d87
>>>
>>> Bisected to:
>>>
>>> 6d54d935062e2d4a7d3f779ceb9eeff108d0535d is the first new commit
>>> commit 6d54d935062e2d4a7d3f779ceb9eeff108d0535d (HEAD)
>>> Author: Peter Robinson <pbrobinson@gmail.com>
>>> Date:   Wed Aug 27 16:30:37 2025
>>>
>>>     arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro
>>>
>>>     Update the wake-up pin and associated interupt details for the
>>>     Pinebook Pro WiFi module.
>>>
>>>     Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>>>     Link: https://lore.kernel.org/r/20250827143040.1644867-1-pbrobinson@gmail.com
>>>     Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>>>
>>>  arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 18 ++++++++++++++++++
>>>  1 file changed, 18 insertions(+)
>>>
>>>
>>> With this commit reverted on top of 6.18.1 wireless connection works
>>> fine.
>>>
>>> Not sure what could be relevant but:
>>> - it's an early model, I think second batch, delivered end of 2019
>>
>> Is it the Synoptics or the Cypress/Infineon module? What firmware are you using?
>>
>>> - mainline uboot 2025.10 is used
>>>
>>>
>>> #regzbot introduced: 6d54d93506

