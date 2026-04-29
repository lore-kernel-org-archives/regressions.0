Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08D8386566
	for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777467209; cv=pass; b=j0rAf2O2QUYOfFYNV55NJ1T0Y1InQ5hWDSm6YlRT0e/e4rJ75yHj2EidTqLqY+RaTo2uInTJjHT8127+J819aJi+eaWn0vEOoERIIIiVmywKyKg5RGiMlxJlMWqRt7mdmCFDnAQ3nmT9EzNWd/QLKKEJXz81idZisUFaWNCQurg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777467209; c=relaxed/simple;
	bh=06RKrpgsQ3tyvS0Nz8ZDPd2l1j0XicmNOtk7LKv+OpI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kfny58lU+yCsY2V8eA8D+YJLH9WmjxkLETRf5/zoMhHmTTINzYtVYTbes8awp4qVCGsMNjFfcbJOKlwmPRpPJyfcHqoSF1xtlv4ntHBQ6vb3UUBOVF1rlh6OXjicMS1dGo6PVpkyiBw5N/ircFr+pSBRErLYQD0rOVgRvS7IE/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=friendlyarm.com; spf=none smtp.mailfrom=friendlyarm.com; dkim=pass (2048-bit key) header.d=friendlyarm-com.20251104.gappssmtp.com header.i=@friendlyarm-com.20251104.gappssmtp.com header.b=d+5jgUa4; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=friendlyarm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=friendlyarm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=friendlyarm-com.20251104.gappssmtp.com header.i=@friendlyarm-com.20251104.gappssmtp.com header.b="d+5jgUa4"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-672c12e95e9so17533405a12.2
        for <regressions@lists.linux.dev>; Wed, 29 Apr 2026 05:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777467205; cv=none;
        d=google.com; s=arc-20240605;
        b=V1mtKe0YqNV/FFK1kqW63NmQxc+FRoOwOGd+mEl5Ck10EwlWOyx2iYkECKkrrfoTvI
         u2msg8LWlrhfLvzUaSkOXpvpZnIEbX4xYnswt1mIU+ht9a7u/k2yF/g22/ElQ+6CBNpt
         fehycjMBAGuhi8xQjArHcxAI/vzyv99I43g8kMBGpBUvQZUnnVuwHv30JSGAUHh/R3BB
         3KR74fCcf6RhWScbghgVoxXRy8i04qDwvWf5nHYlVQqg5GYOnG2bgqDVPGyYu99MrbFz
         v2AfKYkNJTko0oEo2LfvimSCVA1JkT202WUO2xzhMydn1IMMC2rzrKjri2Fne/YLZIa2
         opsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=oT/Pyour7xLSBQAuqnvOXlLVXzS57qaNd61owTC44EE=;
        fh=BOQeFFIGoOkw2qoXhN0/Z3nd1Cq/eVZkK8lUksVM/Ek=;
        b=iPkO2ExTqLZNq4Q513L060rU9Dhs3DGXtwDJMmylA9pV/EO267kwW0xF+6uTJ3tcqv
         VjafmvJNqI0eCWDUD1sy1t1H+mnp1BdsunMCIh9dIuxzdyd8SVBtoNu18uq0Rg/cdp6f
         6dzAbgTUahuKZEJTReEZo27oQEP2dFVdO4CgImk4aFKW2kJCHleC1dP7tIUg5cB7N9WG
         HQ3xpXb+QjTl2IopfDjE6ZT6x5RignHGO1dizYOhD52V8OMBBIXcu9DjZwgJbLkg6NEL
         yXRdKNwOEqKMXT5rDUtv1Vf/xtxB+bDyT8fLxgOECpZA/7gfNnsBe9MuGu+A+mnIgD7V
         mpNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=friendlyarm-com.20251104.gappssmtp.com; s=20251104; t=1777467205; x=1778072005; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oT/Pyour7xLSBQAuqnvOXlLVXzS57qaNd61owTC44EE=;
        b=d+5jgUa4/svhd1qBkjQE84to7kIfhwlzHKJ4N950TP9EuNgpR1wXObSyQ1GQrvmSAl
         aksmpHbNg0v2a68ufCvAi0MrONnVIOWsLroA+Sn+TRSGOG/ObZJse6MZpGukDeiWknJ2
         l9qNJAIVn6jOT992CXt4tIrTPnSOxG7tludTDBlwTW1qggvjZnbTbzXRD+RLPOrnaZwq
         6nyu2PDIGHFJKJ/yMyNf2heQd+NUY6opLuzTNfEzoTCDbN+weFTXUHAh14sg1p9zkmua
         z5wyxgLXVKxGeJ6qWV2ljKF9tXviuW6WC+9CW/7kzZcAK+r3x+yj8Q0mVpooRemJS5ty
         iHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777467205; x=1778072005;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oT/Pyour7xLSBQAuqnvOXlLVXzS57qaNd61owTC44EE=;
        b=MZOrP/aj0Q0pta0+bYQs4/ReU5ZOGFhWmD18znc1yfxjkaFn66Ut3Zri/qraiP95Cb
         VXlh5/5Llj00vutya88cPhf4Dxds9w+4CNz8ClYX0nB6Ff4Sl4swfaF57nICH4mvStrE
         8btKPo/7MHvY+kixrRoq4rciO2C+dYjL7sgjp7yq58I/zNCMCcw8lKraSy2fVQYsUKDY
         D6fKiPxqXSewN3KGHshvxT7TWz3QFNNNHXpLrhrUc41CEMRwhzzs/KR3JT9RJMjHLgD0
         fcbza99YozN2ToICgVQchuUdoXA/e61ruv8LEjkqA5bmPO1g0c2orKWhpCj6TYXcxeNw
         hXCQ==
X-Gm-Message-State: AOJu0Yx4pLXcYQzlbt9SZ4e08BgWs7ZXCvn3hytBfrx8LzeXnpF9hyDq
	CWJ9YieTnTBCLEYzczfSoAoblFwa59H6KbfpLIn7/d6sQ/3y/JZK0iUoofaUhzoVJ9CESx9/Fyi
	RNkfBVfJQCVKTVC1cPYyFqqtZDSuOAmwcnmwxDK5j+g==
X-Gm-Gg: AeBDievFhqM83CucZCs57fG9naILwrtzV8gYM6g5/LzQkLpWd/Pq1Oti/r5LtByEW5K
	9XCyuPg3JDeAuthUXtlPA9xcZaD6nqaonmM2qijrO1Z5350If5e75B+SaZu7hMzn6fl3fSnb1Pu
	LFzj1Mw6y85Cqz7JPQWpMQFi2Fo3pKfcVJ/sXYMR2pEQ7S0Hahg44XLtFNccNtq169ZGp4HWnlt
	HhaJMAYL3aptS6WSr5LJ4aW0rFpYskkuQXRW2UVng8KDK5+wIna+H9qMb7O/cO7YOfEFePNzeh3
	2ype04SCN0086WHl2SxNtUZqt8sOYHCH4fFqs6CeCjwktISOtFw=
X-Received: by 2002:a05:6402:13cb:b0:670:b72b:4044 with SMTP id
 4fb4d7f45d1cf-679bb08bb19mr4513652a12.15.1777467205191; Wed, 29 Apr 2026
 05:53:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jensen Huang <jensenhuang@friendlyarm.com>
Date: Wed, 29 Apr 2026 20:53:13 +0800
X-Gm-Features: AVHnY4IlVroWBWccVPHiX-RgaaOUhLs_YEcqSmZCBe4GoTeuJY95EL9MbMBryWI
Message-ID: <CAMpZ1qEwNOqR-KQD4kEqd93aB-TpHnG6WdQc2tXUF0aXMmw_SA@mail.gmail.com>
Subject: [REGRESSION] stmmac: Random DMA reset failure on RK3399 since v6.18
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: regressions@lists.linux.dev, netdev@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm reporting a regression on RK3399 (stmmac) observed in v6.18.24.
When a network cable is connected during boot, the DMA reset
occasionally fails with the error message: "Failed to reset the dma".

This appears to be a timing issue related to the EEE RX clock-stop
logic. Based on my investigation with the RTL8211E PHY, I monitored
the PHY register PS1R (MMD device 3, address 0x01) and observed a
value of 0x0f40. This indicates that the PHY is in LPI mode and the RX
clock may have already stopped.

While commit dd557266cf5f ("net: stmmac: block PHY RXC clock-stop")
ensures the clock is running before the DMA reset, my tests suggest
that the phylink_rx_clk_stop_block() call might not provide a
sufficiently stable RX clock in time for the immediate DMA reset that
follows.

Since stmmac already sets mac_requires_rxc = true, I modified
phylink_bringup_phy() to honor this flag. This avoids toggling the
PHY's clk_stop_enable during the initialization sequence, ensuring the
RX clock remains active and stable throughout.
With the change below, I achieved 200/200 successful reboots with the
cable connected (previously ~50% failure rate).

--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2171,7 +2171,7 @@ static int phylink_bringup_phy(struct phylink
*pl, struct phy_device *phy,
     /* Allow the MAC to stop its clock if the PHY has the capability */
     pl->mac_tx_clk_stop = phy_eee_tx_clock_stop_capable(phy) > 0;

-    if (pl->mac_supports_eee_ops) {
+    if (pl->mac_supports_eee_ops && !pl->config->mac_requires_rxc) {
         /* Explicitly configure whether the PHY is allowed to stop it's
          * receive clock.
          */

Any feedback/testing on this would be appreciated.

Best regards,
Jensen Huang
