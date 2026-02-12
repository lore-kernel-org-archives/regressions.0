Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B68299950
	for <regressions@lists.linux.dev>; Thu, 12 Feb 2026 22:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770933873; cv=none; b=KeZN+oWnJlO4ApVvsjuTXqyPkq/LeWWyTPYSLnVeQPpMWcZEun2BARIm5JGJH+9O4Om5ShtbM1NxQujoWbEcoNlspVPgEBNI/gNpuWjJSeJssTObiaLyF+aVQdnFotQOciReGRUu3kn5v4Oc1A+A8QEoIDLAXHqDW7HmzBeeIVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770933873; c=relaxed/simple;
	bh=pgou1iAOo03EeIFUgC5tazbjBU6EIspSIgadED/BlSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MBEhyRwrhkKZT1cPd+x18ReP3EvUEAAG1yhg6oqLh9vqJCauubPm61Y3QqAGAG4kNiWNt9JzqNvB9Cc74sS+lyXBfSwtv9fCbRWCdzr/wz97BhFr1hlnASXgDIUqhDDrU6738gp0suFtKDrWg8wF8LG+sCm79DuaPStdC2LKbSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AsmeFdtk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AsmeFdtk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770933870;
	bh=pgou1iAOo03EeIFUgC5tazbjBU6EIspSIgadED/BlSQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=AsmeFdtk4nzmEGGCH0TaWKY4Mc+L909ckX7EIlyLRduCbSzoTfKa+GLp/YGC1DEP5
	 kYrOsZiGNdH2e0qGu8qh2tQjADPh3PxWHw4y37b9VWwjjOjUvRVxmkA2dAIstkaINZ
	 w6E+Ya336ifoxNxZlVVJYBeoUjRWE4BTHxICRGViXmIGSt2HG2J7+OaPa8ALKKCB/Z
	 Ahv0te1cv0fEDfPRRq2zG/JIXEtPQLXFsR4Onu1F9nUh620EzKUbab9GXw4ociPylp
	 9CEAV3Hw6KLKhzsbsDOABmbaQ0siY+mhBpEcxAF8SCoD8d2MKDCOu0ir5fI9bVPsYl
	 iwMyKXN2kNcXw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 098E617E127F;
	Thu, 12 Feb 2026 23:04:29 +0100 (CET)
Message-ID: <8e410a11-bd7b-4a12-a711-0514a59409c0@collabora.com>
Date: Fri, 13 Feb 2026 00:04:29 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] HDMI monitor not working on Radxa Rock 5B after phy
 rockchip samsung hdptx HDMI 2.1 FRL patchset
To: dubito@online.de, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <b32164001947ba922aefb6ca86a8dc59e9323d2b.camel@online.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <b32164001947ba922aefb6ca86a8dc59e9323d2b.camel@online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 2/11/26 11:20 PM, Thomas Niederprüm wrote:
> Hi,
> 
> I'm running a Radxa Rock 5B (rk3588) on a 10+ year old Samsung TV screen
> connected via HDMI. This worked flawlessly in 6.18.7 but does not work on linux-
> next. I bisected the problem and identified commit 3481fc04 to be the first bad
> commit. This points to the phy PLL clock rate calculation to be the problem in
> connection with my monitor. As it seems relevant, I attached the EDID of my
> monitor.
> 
> I'm booting the kernel out of EDK2 after which efifb is correctly taking over
> the initialized display and I can see the initial kernel boot messages on the
> HDMI output. After the drm/kms in the kernel takes over the screen shortly turns
> black, changes resolution, and then correctly displays on 6.18.7. However, in
> linux-next the screen remains black after kms took over. I cannot see any
> obvious differences in the boot logs but I attached two boot logs, one for the
> working 6.18.7 kernel and one for the non-working linux-next kernel.
> 
> When reverting 3481fc04..de5dba83 (i.e. the faulty commit and the ones that
> followed in the HDMI 2.1 FRL series) I can build a working kernel from linux-
> next.
> 
> I don't know where to dig from here but I'm happy to run any test necessary to
> track down the problem.

It'd be helpful if you could resend the logs after booting both kernels with the
following params (requires CONFIG_DYNAMIC_DEBUG=y):

  rockchipdrm.dyndbg=+p dw_hdmi_qp.dyndbg=+p phy_rockchip_samsung_hdptx.dyndbg=+p

As well as running the command below before connecting your display/TV:

  $ echo 0x4 > /sys/module/drm/parameters/debug

I've noticed you're forcing "video=HDMI-A-1:1920x1080M@60", which should be
anyway the preferred mode (according to the EDID).

Did you try choosing a different one, e.g. 1920x1080@50 or 1920x1080@30 (they
are supported according to the listing in CTA-861 Extension Block). That's more
a test to confirm the issue affects a particular modeline, or is more general.

FWIW I've tested over 40 modes with different displays/TVs and didn't notice any
regression, hence I'm probably missing something here.

Thanks for the report!

Cristian
