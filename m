Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B62A30F545
	for <regressions@lists.linux.dev>; Fri,  2 Jan 2026 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767356341; cv=none; b=VQpySI1QVMM5EKb1xAUzU+QvGF8jKCrMS+sbBsCH4EHxYlYEdjYdLQta8s9Zbuws6iDomb1VjC9NEjqtbTO7HgYeqghV4gjio0j3blydGskGHBYxJdYWA/41wnF3+/YQ1H2Re8HRLihvrANG6fdvfAxhNfW8zWxtHdly9v/796A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767356341; c=relaxed/simple;
	bh=eRWe2SHSutFLGWTgcPHuSWidsONEj26vUllLjANnkv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8siT7VLtyfqgWixS6L7QpetBFbRffc787u/Dkh5Gr/hhsf5SStxVL3SnXMpC9BRVVjxwlMV26g4TZ+FF5gQIOXzSLtbQQKJISoEOCO3uhRxnufjTVw1fQibNVRwNNiqi+l5LFtD4172ZWzq6ev5GtXwOBZZ0b2z0QpbJZMh+AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpsz2t1767356272t8ce57337
X-QQ-Originating-IP: 5updBiJ6j1JD1MnXiSXA33aFX2J4IACcm/jbI5OFIJA=
Received: from [192.168.254.128] ( [106.150.157.243])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 02 Jan 2026 20:17:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13118132810811575579
Message-ID: <ADED015D50C33884+c789fd7c-c5fd-4947-8497-033d2938ac34@radxa.com>
Date: Fri, 2 Jan 2026 21:17:50 +0900
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] wifi broken on pinebook pro
To: Jan Palus <jpalus@fastmail.com>, Peter Robinson <pbrobinson@gmail.com>
Cc: linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>,
 regressions@lists.linux.dev
References: <aUKOlj-RvTYlrpiS@rock.grzadka>
 <CALeDE9OzCzbhKmc61Kgbmzr67oJnjZMjsO6yYbkXujzA-OuO+A@mail.gmail.com>
 <aVJutYTmhA14rwPY@rock.grzadka>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <aVJutYTmhA14rwPY@rock.grzadka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M75I2DDAzREFOT+jt4RYYkNGiDtapIzh8tg/oLJaOL5w3vlVnhrczGMO
	ufxdNrYMdlEFzQgQfs9I2ryhhnqKE05Hs887T7Awtd6b5Dk/K8t2dovrSq4WgcUksyKeWO+
	i/4kG8OVaCG6bVO2KQDVsPe7T3FYYWimYXm2bzambJoiPUTuqbbcUm9UeiIsGfP9LHtRCbG
	45sOKo4lkwa3rFU5gO/pMA2BP86JBpZBY3LZZfFfk+YGu0dziuEAmNuh/Tjrur4yM5iSUAQ
	27RSHwAsGyFQDVdxSRGsL+At8htrvOLttn+jTxNoaiV/8BawJH02EEDde5Dnf7EgE+3iJ7o
	LMjdXVhomx7wBDT+eyZ8F4SU8tGQFPRKdrFpvh796x99An1Ch4jJ7agQjbxn75LwiPI1FaF
	GPP1vgosB3nZVXBUedNVtwQ2oezkRmLviY9bLnWHo7hFmYEihOy2TtpiLPgw3AHOd8hAWzX
	PmxSPDXOjfXTZexs89vSdgm03V132wbLXwEK8Dq4zq/8JAeC8eErqwJ3F7TJGf69Rde9pbl
	GhAqtfWcvFTv2sPSQoS+71p7Dz6TH7XFlQThcNCk3NdgFDI7tJslJwgia7Q7aavdvpS4eJy
	G2tBYlUnT+F5KRbc4qqhwQ2/5BoiD98qSaOpNVX1CYipTQwEZ4JzA7roxY59hlmj4lb/QRv
	eVBpLzsU02L+3f4qliIgqn/CD6RpqRbHNhDX4ocmKI0pTLEYfjv7glzhdQuDKPpSJCnKsWP
	58e/2QtKMiffAKHr2wQk5d7/Lq6SbUsuRBBpO7rQWtdxWJ7TKCUHsA1X993e1RW4oqzsvPl
	1AXqF8CGDDFtk6e2ZXNT6hSHMp2HTvkuqkBcsKKBkD9940n7i+nV2AuMS2y48IAq86XdAs+
	N/j3E0cyPB/eVbaI2L5+TbvnmPpsmch9L7RKzxGLtzPE/LiB2+BVOtr+rKFIyWVGCuEpm0V
	wUmbj9cSsQ/aUDjLkX2LQXIqSrBGlMDMHQ7Xo2f/jl81J5w==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

Hi Jan,

Just FYI,

On 12/29/25 21:18, Jan Palus wrote:
> On 29.12.2025 06:23, Peter Robinson wrote:
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
>>>      arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro
>>>
>>>      Update the wake-up pin and associated interupt details for the
>>>      Pinebook Pro WiFi module.
>>>
>>>      Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>>>      Link: https://lore.kernel.org/r/20250827143040.1644867-1-pbrobinson@gmail.com
>>>      Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>>>
>>>   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 18 ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>
>>>
>>> With this commit reverted on top of 6.18.1 wireless connection works
>>> fine.
>>>
>>> Not sure what could be relevant but:
>>> - it's an early model, I think second batch, delivered end of 2019
>>
>> Is it the Synoptics or the Cypress/Infineon module? What firmware are you using?
> 
> Judging by the fact acquisition by Synaptics happened sometime late
> 2020/early 2021 I guess it must be Cypress? I'm not really familiar with
> BCM43456 chip history. Firmware files used are
> brcm/brcmfmac43456-sdio.{bin,clm_blob,txt} exactly those found at:
> 
> https://github.com/RPi-Distro/firmware-nonfree/tree/trixie/debian/config/brcm80211/brcm

I'm using the same firmware for the Radxa CM3J equipped with the 
AP6745(BCM43456) and experiencing the same error(brcmf_sdio_bus_rxctl: 
resumed on timeout) when the interrupt is enabled.

  https://lore.kernel.org/linux-rockchip/A7ADEB12E25ED346+00048ee9-c4d6-442d-a02c-cefbdc6be353@radxa.com/

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

>>
>>> - mainline uboot 2025.10 is used
>>>
>>>
>>> #regzbot introduced: 6d54d93506
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 

