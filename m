Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4241B808
	for <regressions@lists.linux.dev>; Fri, 23 Jan 2026 13:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175598; cv=none; b=lPxbVVoYJLXtLp0/d+GECpW56Kjy4H2n3/QXwIjGqPeGlm8q628mzEEzJie11l8U1jJ9ajnjZI/sgGKWFcHM1KQWYLBjFkaW0YoZeAJ2hzCl0r6JamgEh2ITxEb9hufGDLhtQRoC3lG/Mmr/ViLgv1kB+j9QAVaIIqCes2G+jB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175598; c=relaxed/simple;
	bh=HTcShPrN/w27OjZXctp6RsH0+DXwuFOVG6qwl98Hkmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWZll7PGLwb7GVIPs5SKHyoes2qt9xNvk8JzZ5yjLH1oOaLWu4kygY4/oUZqR6irSfo7hlpbg7WTrKDbKk7tq9XsJ7zPMqXz/VrSWonkLMAhQOyh3q1JudY495mL4X0pHATMD3mGDwYBym8Ru12+q2HXoWNm1YMGRhQRGmhbh9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A80E31476;
	Fri, 23 Jan 2026 05:39:49 -0800 (PST)
Received: from [10.57.51.35] (unknown [10.57.51.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 256A33F632;
	Fri, 23 Jan 2026 05:39:55 -0800 (PST)
Message-ID: <54c76dbe-c0b7-4aca-9d23-1881334b9fff@arm.com>
Date: Fri, 23 Jan 2026 13:39:52 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] wifi broken on pinebook pro
To: FUKAUMI Naoki <naoki@radxa.com>, Jan Palus <jpalus@fastmail.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>,
 regressions@lists.linux.dev
References: <aUKOlj-RvTYlrpiS@rock.grzadka>
 <CALeDE9OzCzbhKmc61Kgbmzr67oJnjZMjsO6yYbkXujzA-OuO+A@mail.gmail.com>
 <aVJutYTmhA14rwPY@rock.grzadka>
 <ADED015D50C33884+c789fd7c-c5fd-4947-8497-033d2938ac34@radxa.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <ADED015D50C33884+c789fd7c-c5fd-4947-8497-033d2938ac34@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-02 12:17 pm, FUKAUMI Naoki wrote:
> Hi Jan,
> 
> Just FYI,
> 
> On 12/29/25 21:18, Jan Palus wrote:
>> On 29.12.2025 06:23, Peter Robinson wrote:
>>> On Wed, 17 Dec 2025 at 11:26, Jan Palus <jpalus@fastmail.com> wrote:
>>>>
>>>> WiFi no longer works on Pinebook Pro after upgrade to kernel 6.18. It
>>>> appears firmware fails to load:
>>>>
>>>> ...
>>>> mmc_host mmc0: card is non-removable.
>>>> mmc_host mmc0: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, 
>>>> actual 400000HZ div = 0)
>>>> Bluetooth: hci0: BCM: features 0x0f
>>>> Bluetooth: hci0: BCM4345C5 Ampak_CL1 UART 37.4 MHz BT 5.0 [Version: 
>>>> Version: 0039.0089]
>>>> Bluetooth: hci0: BCM4345C5 (003.006.006) build 0089
>>>> mmc_host mmc0: Bus speed (slot 0) = 148500000Hz (slot req 
>>>> 150000000Hz, actual 148500000HZ div = 0)
>>>> dwmmc_rockchip fe310000.mmc: Successfully tuned phase to 55
>>>> mmc0: new UHS-I speed SDR104 SDIO card at address 0001
>>>> brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43456-sdio for 
>>>> chip BCM4345/9
>>>> usbcore: registered new interface driver brcmfmac
>>>> brcmfmac mmc0:0001:1: Direct firmware load for brcm/brcmfmac43456- 
>>>> sdio.pine64,pinebook-pro.bin failed with error -2
>>>> brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
>>>> ieee80211 phy0: brcmf_bus_started: failed: -110
>>>> ieee80211 phy0: brcmf_attach: dongle is not responding: err=-110
>>>> brcmfmac: brcmf_sdio_firmware_callback: brcmf_attach failed
>>>>
>>>> compared to 6.17 instead of last 4 lines with errors there's single one
>>>> with info about loaded firmware:
>>>>
>>>> brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/9 wl0: May 14 
>>>> 2020 17:26:08 version 7.84.17.1 (r871554) FWID 01-3d9e1d87
>>>>
>>>> Bisected to:
>>>>
>>>> 6d54d935062e2d4a7d3f779ceb9eeff108d0535d is the first new commit
>>>> commit 6d54d935062e2d4a7d3f779ceb9eeff108d0535d (HEAD)
>>>> Author: Peter Robinson <pbrobinson@gmail.com>
>>>> Date:   Wed Aug 27 16:30:37 2025
>>>>
>>>>      arm64: dts: rockchip: Further describe the WiFi for the 
>>>> Pinebook Pro
>>>>
>>>>      Update the wake-up pin and associated interupt details for the
>>>>      Pinebook Pro WiFi module.
>>>>
>>>>      Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>>>>      Link: https://lore.kernel.org/r/20250827143040.1644867-1- 
>>>> pbrobinson@gmail.com
>>>>      Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>>>>
>>>>   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 18 ++++++++ 
>>>> ++++++++++
>>>>   1 file changed, 18 insertions(+)
>>>>
>>>>
>>>> With this commit reverted on top of 6.18.1 wireless connection works
>>>> fine.
>>>>
>>>> Not sure what could be relevant but:
>>>> - it's an early model, I think second batch, delivered end of 2019
>>>
>>> Is it the Synoptics or the Cypress/Infineon module? What firmware are 
>>> you using?
>>
>> Judging by the fact acquisition by Synaptics happened sometime late
>> 2020/early 2021 I guess it must be Cypress? I'm not really familiar with
>> BCM43456 chip history. Firmware files used are
>> brcm/brcmfmac43456-sdio.{bin,clm_blob,txt} exactly those found at:
>>
>> https://github.com/RPi-Distro/firmware-nonfree/tree/trixie/debian/ 
>> config/brcm80211/brcm
> 
> I'm using the same firmware for the Radxa CM3J equipped with the 
> AP6745(BCM43456) and experiencing the same error(brcmf_sdio_bus_rxctl: 
> resumed on timeout) when the interrupt is enabled.

Yup, IIRC the host_wake pin behaviour - at least the polarity, and 
possibly whether it's used as an out-of-band interrupt at all - is 
really a property of the firmware rather than the hardware, and can be 
different for different blobs.

Robin.

> 
>   https://lore.kernel.org/linux-rockchip/A7ADEB12E25ED346+00048ee9- 
> c4d6-442d-a02c-cefbdc6be353@radxa.com/
> 
> Best regards,
> 
> -- 
> FUKAUMI Naoki
> Radxa Computer (Shenzhen) Co., Ltd.
> 
>>>
>>>> - mainline uboot 2025.10 is used
>>>>
>>>>
>>>> #regzbot introduced: 6d54d93506
>>
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>>
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

