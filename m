Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5F52C859
	for <regressions@lists.linux.dev>; Thu,  5 Feb 2026 10:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770287668; cv=none; b=bx+na0eHoscZOu6hcUpiLH3b+oBVdzaeg2mQDaFsMSMSje52fRbEDlz5SaQa46elyQMkuMOvWHO2+nFgVzYTVifRMn6g8zUPjFWp7PZ9h9O8ovPYad02k7fk5O7+FoXFnX4t7qE+S66kDFV4IuccFeT2Ftq01sEtZ1oqVO/JXdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770287668; c=relaxed/simple;
	bh=cP/W8pdtOpEtllXigb+GGEpDWiiQxO1ZQFVn8FLImtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hx0W1SqY2mq/TDZDR8ejqJzVgT8sm5r153Id3hHbE8m7EGYgrm+9LGAUf70aM3/DHTpFiQyObC4JESgUeVOx6T6MADYorCilNc/Nd4yYFRqV3Ze82OzHNVEmc9vOVlInBfSA3BJ4AqXimeeTUmSF/45JiWOaHrPLQank0s8MMA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=Z9qoE1t5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KVcLy5/o; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="Z9qoE1t5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KVcLy5/o"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 774141D000F9;
	Thu,  5 Feb 2026 05:34:26 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 05 Feb 2026 05:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1770287666;
	 x=1770374066; bh=u1LeVHfX9KP4xF7EtjCzhzPwakyJKYc6NFTmp7Ri8j8=; b=
	Z9qoE1t584i6dhw5+UE+QOkdE4Ec9hltedXPijIGeJyfa0IYsmk8eYeiQUzaZds2
	8OeIU9onOLuSF2Dsq+waJ5MEeMiTnhwiMWbgPrMRb0p9OhNqaPKeHDQWJWgNlh/R
	PzaaibXHoCyXa5rKzAEYUXe7XyWumHbZc7Wr0+bGx322zV3/ZLnauuxYiW6g6NqS
	Mn8i/aIV7uPiwB2KLBEsSd11TVZV8OKMLmIFy2ria5opbKf8L9tEruf5YBcW0tGw
	FkuqBFkwMd5867UDRarbNAnihtPGJk5pk9oZEXzJx4DSfL3dzFP1xK4cykRF3Stb
	4R8ATAw/c1q4WHeNwn1Rag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770287666; x=
	1770374066; bh=u1LeVHfX9KP4xF7EtjCzhzPwakyJKYc6NFTmp7Ri8j8=; b=K
	VcLy5/o5YUZOrwaPbVA2Fdz41Z4GTvqW2hGTzjLl5sHni5OVKd4YRoadmT10mxLQ
	agxaM3eMcoeAbcc6yxcv+HPX5GI/489M3iV/9WfFxHPODhJMvuO1MejFPAjjxX7X
	eOhwD1On/wjD4CxgN84mOvKdJ0OSchn7sQpsI7Gn9xwrqQ0WYMtZbnENv/hDcl4e
	M/8No1jiUlYTHbS+tINWWTM5tIBvpUKBRmX8NLu8sl38ACp9n9mL4i29FFYXu5y0
	GuhEl4lnAmHn+wwqbiGZsPUQ+wJQ16rdt7IVAqcj2U5B7DOhGgyDK6yneC/vgvko
	UOhlXW1BxpN1twi2w6rvg==
X-ME-Sender: <xms:MXKEaR2JT9JISZdiRJbOlqGDuGRX_N4jbwnGFGz3PBm3pmvVAfrK7Q>
    <xme:MXKEaYzdeBwjNvqX2i-qQU7lOIaAFkdi7ybOonYpFgHcpJX6ZQbE4xHS3sek8iLo1
    C06QV2SIaKJxtB2tDCxdg7vJS_Ccebecpl6tB_wU34OIw8P7XyCtw>
X-ME-Received: <xmr:MXKEaQHxRqMQejSFr2pxKK2-60EvLP0D_zVcbO0e8a9bIm7YGV0KzzmqDDHDVKDDyNQbVWQv_7RQa36V5Y67tDHdV9RQj2XDHnFM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeehtdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjfgesthekredttderjeenucfhrhhomheplfgrnhcu
    rfgrlhhushcuoehjphgrlhhushesfhgrshhtmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeeiveeivdejheeivdffheelveejtdeugefhhfdujefgjedvtdegieelueegvdeh
    veenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhprghluhhssehfrghsthhmrghilhdrtgho
    mhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprh
    gvghhrvghsshhiohhnsheslhgvvghmhhhuihhsrdhinhhfohdprhgtphhtthhopehhvghi
    khhosehsnhhtvggthhdruggvpdhrtghpthhtoheplhhinhhugidqrhhotghktghhihhpse
    hlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhgvghhrvghsshhi
    ohhnsheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehpsghrohgsihhnsh
    honhesghhmrghilhdrtghomhdprhgtphhtthhopehrohgsihhnrdhmuhhrphhhhiesrghr
    mhdrtghomhdprhgtphhtthhopehnrghokhhisehrrggugigrrdgtohhm
X-ME-Proxy: <xmx:MXKEaTbj9J7T_BNtalW-5Jeg3Mw0Y_r_T4IwMftCmtlajwGyQNU94g>
    <xmx:MXKEaaCdCXCe1raaumP66F_-yJe1n7Ru7T2lX79TNXlQzeivzwM4Dg>
    <xmx:MXKEaTnYnvXZMtHe7IIaiophSQNCp3xF2ARNRXuvhKwZLISqDEHVXw>
    <xmx:MXKEaTwE_qAq0EnK3ufTTO9j00GRfBcCHIx-NXuPW3ZQlPJINMzJZw>
    <xmx:MnKEaRx-ubhYY5K5_L3Mota1gfXQ0zzRCI9e_dGYUfyJq6oRrvg3B98U>
Feedback-ID: i01894241:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Feb 2026 05:34:25 -0500 (EST)
Date: Thu, 5 Feb 2026 11:34:24 +0100
From: Jan Palus <jpalus@fastmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	regressions@lists.linux.dev, Peter Robinson <pbrobinson@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: [REGRESSION][BISECTED] wifi broken on pinebook pro
Message-ID: <aYRxaJjKdIj-uXGe@kalarepa.grzadka>
References: <aUKOlj-RvTYlrpiS@rock.grzadka>
 <CALeDE9OzCzbhKmc61Kgbmzr67oJnjZMjsO6yYbkXujzA-OuO+A@mail.gmail.com>
 <5f8805a8-b2d6-4bc3-9c6c-c8fc696daacd@leemhuis.info>
 <45c528cf-901c-47d5-a8d2-a4010105e30f@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45c528cf-901c-47d5-a8d2-a4010105e30f@leemhuis.info>
User-Agent: NeoMutt/20251211

On 03.02.2026 11:42, Thorsten Leemhuis wrote:
> On 1/14/26 14:03, Thorsten Leemhuis wrote:
> > [top-posting to facilitate processing]
> > 
> > Peter, Heiko, what's the deal here? This looks stalled. Is temporarily
> > reverting an option, or would that cause regressions for other users
> > that already benefit from the change that is causing the problem?
> 
> I assume this wasn't fixed yet (Jan, please correct me if I'm wrong!):

Just to make it clear in case anyone is waiting for confirmation: the
issue is still present.
 
> Heiko, could you maybe submit a revert? Fixing this is long overdue
> afaics, as Linus just recently wrote ""rule of thumb [to get
> user-reported regressions fixed] should generally be "within a week",
> preferably before the next rc.""[1] – we are way past that.
> 
> Note, I assume this will break things for people where the change in
> question improved things. But I suspect he in a situation like this
> Linus prefers to go back to what was "normal" before the culprit was
> merged. If we are unsure about this I guess we should get him involved
> to clean this up.
> 
> Ciao, Thorsten
> 
> [1]
> https://lore.kernel.org/all/CAHk-%3Dwi86AosXs66-yi54%2BmpQjPu0upxB8ZAfG%2BLsMyJmcuMSA@mail.gmail.com/
> 
> 
> > On 12/29/25 07:23, Peter Robinson wrote:
> >> On Wed, 17 Dec 2025 at 11:26, Jan Palus <jpalus@fastmail.com> wrote:
> >>>
> >>> WiFi no longer works on Pinebook Pro after upgrade to kernel 6.18. It
> >>> appears firmware fails to load:
> >>>
> >>> ...
> >>> mmc_host mmc0: card is non-removable.
> >>> mmc_host mmc0: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
> >>> Bluetooth: hci0: BCM: features 0x0f
> >>> Bluetooth: hci0: BCM4345C5 Ampak_CL1 UART 37.4 MHz BT 5.0 [Version: Version: 0039.0089]
> >>> Bluetooth: hci0: BCM4345C5 (003.006.006) build 0089
> >>> mmc_host mmc0: Bus speed (slot 0) = 148500000Hz (slot req 150000000Hz, actual 148500000HZ div = 0)
> >>> dwmmc_rockchip fe310000.mmc: Successfully tuned phase to 55
> >>> mmc0: new UHS-I speed SDR104 SDIO card at address 0001
> >>> brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac43456-sdio for chip BCM4345/9
> >>> usbcore: registered new interface driver brcmfmac
> >>> brcmfmac mmc0:0001:1: Direct firmware load for brcm/brcmfmac43456-sdio.pine64,pinebook-pro.bin failed with error -2
> >>> brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
> >>> ieee80211 phy0: brcmf_bus_started: failed: -110
> >>> ieee80211 phy0: brcmf_attach: dongle is not responding: err=-110
> >>> brcmfmac: brcmf_sdio_firmware_callback: brcmf_attach failed
> >>>
> >>> compared to 6.17 instead of last 4 lines with errors there's single one
> >>> with info about loaded firmware:
> >>>
> >>> brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/9 wl0: May 14 2020 17:26:08 version 7.84.17.1 (r871554) FWID 01-3d9e1d87
> >>>
> >>> Bisected to:
> >>>
> >>> 6d54d935062e2d4a7d3f779ceb9eeff108d0535d is the first new commit
> >>> commit 6d54d935062e2d4a7d3f779ceb9eeff108d0535d (HEAD)
> >>> Author: Peter Robinson <pbrobinson@gmail.com>
> >>> Date:   Wed Aug 27 16:30:37 2025
> >>>
> >>>     arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro
> >>>
> >>>     Update the wake-up pin and associated interupt details for the
> >>>     Pinebook Pro WiFi module.
> >>>
> >>>     Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> >>>     Link: https://lore.kernel.org/r/20250827143040.1644867-1-pbrobinson@gmail.com
> >>>     Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> >>>
> >>>  arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 18 ++++++++++++++++++
> >>>  1 file changed, 18 insertions(+)
> >>>
> >>>
> >>> With this commit reverted on top of 6.18.1 wireless connection works
> >>> fine.
> >>>
> >>> Not sure what could be relevant but:
> >>> - it's an early model, I think second batch, delivered end of 2019
> >>
> >> Is it the Synoptics or the Cypress/Infineon module? What firmware are you using?
> >>
> >>> - mainline uboot 2025.10 is used
> >>>
> >>>
> >>> #regzbot introduced: 6d54d93506
> 
