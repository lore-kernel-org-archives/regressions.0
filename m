Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D64288520
	for <regressions@lists.linux.dev>; Mon, 29 Dec 2025 12:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767010696; cv=none; b=OyIkn4ZhCf2V2FHTAWItUhXR1Z31XRDNC0/QB2WqUWI5lsIpyo8o/35D59/nMrtUdV+U+aCs4iaYOBQeQRGA4omla67lszjHsmVH526G2AKhTsAYngvUuWGMzuGx9FU0lkbip9R23ih5dND2J2fAYmVkehXrINycWnvRsQRmxdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767010696; c=relaxed/simple;
	bh=7yq+gvuG/bQ9pO7dYGaKo234VAqAniZpnYCKuY7YDzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAearHOePD75LyOxyDOqOqzlE43sN0uw0J6HVo19AB9H/FCEuxPnEliuIEn8D81V3kTCKeCQ7dxHfNpZBRyKmFu1aM5w34B8NI9epm021qZtX4qqPBfKuvXTZszLU/rOInJKl/1RlHYGWHf5jqCMl9ZQ9Pl8B6rnNSmfLHNkj5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=DgG07hN3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=po9loQzQ; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="DgG07hN3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="po9loQzQ"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D66CD14000BC;
	Mon, 29 Dec 2025 07:18:12 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 29 Dec 2025 07:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1767010692; x=1767097092; bh=Y0Yh64gwja
	JdrPmmb7QhI3yP7/Gx3ZKWSjQKjpPaf3E=; b=DgG07hN3vYxSajb62fUPh/KiPC
	vkSqi99JXEsOC9LjpDqWf2pzMMLOFThaf70ihLJRQxraaN1aI+isKGGb2FtcbdVw
	eYEkcriDCsZj8gPXD1prsixRSIvXVPL69uXwwuDyFYQMt3UYZ2tG3XivxAislaw/
	CDxS+VV8FYtnhp18tF0XqTsJyL3nZFKrGqV6wRjWAdxnM/LxjLa9ggOGLOSR96Yc
	nCvEhvhFFq7d0L9ouGDH0jj0m3IwfkrscWUuEiHyJR654lzxovwyJpaA1ABA6xl+
	X+mQGyHzrwNYHq8P4Hzqpx9L3Ht6oZ5Yyajg8sAUXaA742PGVEIRaI7krN3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767010692; x=1767097092; bh=Y0Yh64gwjaJdrPmmb7QhI3yP7/Gx3ZKWSjQ
	KjpPaf3E=; b=po9loQzQVOqEmKYgGRh32z5L7QOorcen6C2lCo6FJaLDTrc1msX
	9OPE/Xs2SDXpSaa9AxVnwJitGxM4dOb8bGAb/430sDXR0y/ZppcXQeGyABYSYCia
	9cOcKdDky6Ju7G1PiaUvredeP1p60Zn+ir/Qf8U1D1V8B+lqmZH1i2tCEbepQNx6
	dscZkCAXxGzxsbrD3Rh0DEnaCgnT50++SeDO2brDcRjL/zvN4lkOn+NI11OCPeAL
	cvjFcLmJpq9wnaTDj256XcnZn2dOMXmNyFVYxsOV81MqEdoAeGAY78Yb7cLh7P1a
	DT0LJmLr9iZgL0wyxFyI//qVl8JbusJ7wPA==
X-ME-Sender: <xms:hHFSaQDXMeXVsg2aaOWNZDgsK7rxVczsY8eftQoX0dYx_Pz1qFKGhw>
    <xme:hHFSaQWZgmqiaDs7nwkNgTtY-dhAc8gSS1Je_tyN2vMupGASEBqfoqxhGUzrGeBz6
    FCdaATqsmlaDD1RFAI5hHKOjxunnDjBEOfM5wgXmtBwhnP2SIyFLA>
X-ME-Received: <xmr:hHFSaeDa8sIuVCidzdgDsBjAYMyi0IXAbNWdvtFIETG6KztyVtq0L3xiSM4DV48RkmSvhlNa--aq1z-aB3GUd7Uz3MzuuuT70w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejjeduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjfgesthdtredttderjeenucfhrhhomheplfgrnhcurfgr
    lhhushcuoehjphgrlhhushesfhgrshhtmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeekhfegleejffffjeefudetledtgfeltdehjeegtdekveetieeugfefgeeufeejffen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjphgrlhhushesfhgr
    shhtmhgrihhlrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehpsghrohgsihhnshhonhesghhmrghilhdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhrohgtkhgthhhipheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
    dprhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrtghpthhtoheprhgvghhr
    vghsshhiohhnsheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:hHFSaT-_IofjtbwXHhbw4QWZtcOgaMv6ajdlfdpUBgZAgcdmlpYelQ>
    <xmx:hHFSaVEbnTlbeYgcQDUqPvBnpXyNshoTLju4WVnHpUjGdywpfrbnlg>
    <xmx:hHFSaRNOSDb53j6oUlcgB8eUrEeLdHJuaRK_h5KbSQ3vA0gK0npXQg>
    <xmx:hHFSaffihCnrzbfzRUuEBVzOc7MCIOwQfmtZjE1QUrERwHiAdY4GkQ>
    <xmx:hHFSaWx8a15PCY_th6y2TX10VTKI1VZksq2AttXxAHNVCihA0F98bJlq>
Feedback-ID: i01894241:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Dec 2025 07:18:11 -0500 (EST)
Date: Mon, 29 Dec 2025 13:18:10 +0100
From: Jan Palus <jpalus@fastmail.com>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, 
	regressions@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED] wifi broken on pinebook pro
Message-ID: <aVJutYTmhA14rwPY@rock.grzadka>
References: <aUKOlj-RvTYlrpiS@rock.grzadka>
 <CALeDE9OzCzbhKmc61Kgbmzr67oJnjZMjsO6yYbkXujzA-OuO+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALeDE9OzCzbhKmc61Kgbmzr67oJnjZMjsO6yYbkXujzA-OuO+A@mail.gmail.com>
User-Agent: NeoMutt/20251211

On 29.12.2025 06:23, Peter Robinson wrote:
> On Wed, 17 Dec 2025 at 11:26, Jan Palus <jpalus@fastmail.com> wrote:
> >
> > WiFi no longer works on Pinebook Pro after upgrade to kernel 6.18. It
> > appears firmware fails to load:
> >
> > ...
> > mmc_host mmc0: card is non-removable.
> > mmc_host mmc0: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
> > Bluetooth: hci0: BCM: features 0x0f
> > Bluetooth: hci0: BCM4345C5 Ampak_CL1 UART 37.4 MHz BT 5.0 [Version: Version: 0039.0089]
> > Bluetooth: hci0: BCM4345C5 (003.006.006) build 0089
> > mmc_host mmc0: Bus speed (slot 0) = 148500000Hz (slot req 150000000Hz, actual 148500000HZ div = 0)
> > dwmmc_rockchip fe310000.mmc: Successfully tuned phase to 55
> > mmc0: new UHS-I speed SDR104 SDIO card at address 0001
> > brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43456-sdio for chip BCM4345/9
> > usbcore: registered new interface driver brcmfmac
> > brcmfmac mmc0:0001:1: Direct firmware load for brcm/brcmfmac43456-sdio.pine64,pinebook-pro.bin failed with error -2
> > brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
> > ieee80211 phy0: brcmf_bus_started: failed: -110
> > ieee80211 phy0: brcmf_attach: dongle is not responding: err=-110
> > brcmfmac: brcmf_sdio_firmware_callback: brcmf_attach failed
> >
> > compared to 6.17 instead of last 4 lines with errors there's single one
> > with info about loaded firmware:
> >
> > brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/9 wl0: May 14 2020 17:26:08 version 7.84.17.1 (r871554) FWID 01-3d9e1d87
> >
> > Bisected to:
> >
> > 6d54d935062e2d4a7d3f779ceb9eeff108d0535d is the first new commit
> > commit 6d54d935062e2d4a7d3f779ceb9eeff108d0535d (HEAD)
> > Author: Peter Robinson <pbrobinson@gmail.com>
> > Date:   Wed Aug 27 16:30:37 2025
> >
> >     arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro
> >
> >     Update the wake-up pin and associated interupt details for the
> >     Pinebook Pro WiFi module.
> >
> >     Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >     Link: https://lore.kernel.org/r/20250827143040.1644867-1-pbrobinson@gmail.com
> >     Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> >
> >  arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> >
> > With this commit reverted on top of 6.18.1 wireless connection works
> > fine.
> >
> > Not sure what could be relevant but:
> > - it's an early model, I think second batch, delivered end of 2019
> 
> Is it the Synoptics or the Cypress/Infineon module? What firmware are you using?

Judging by the fact acquisition by Synaptics happened sometime late
2020/early 2021 I guess it must be Cypress? I'm not really familiar with
BCM43456 chip history. Firmware files used are
brcm/brcmfmac43456-sdio.{bin,clm_blob,txt} exactly those found at:

https://github.com/RPi-Distro/firmware-nonfree/tree/trixie/debian/config/brcm80211/brcm

> 
> > - mainline uboot 2025.10 is used
> >
> >
> > #regzbot introduced: 6d54d93506
