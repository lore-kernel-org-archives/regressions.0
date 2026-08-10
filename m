Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93BE42F70C
	for <regressions@lists.linux.dev>; Mon, 10 Aug 2026 17:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786384495; cv=none; b=CMndaI6eMnbyUtR71AiFImXmGqJhOauPXP80spmi0PAdd1EKUH1V6XoxEzH5eqMN7EYArKZhwIq5gOynqdlmXUfFCZoLjHlZqBVawgpWU9REx98XoHvSlGNzqreG+wreLu5A/eLLbKs/Kn9uyq5AkyuklZkOuWZ8/0gDawdnBps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786384495; c=relaxed/simple;
	bh=wTS3z57ImEeKewCgziOwsh/HcNK3of+DjiHKrAWz6/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eoDKt6kkAvS63Zf9XXkxURO8DHU53S0X29uLmgdzz7Sp2GgaxOYPvNRyls57eZOAgX4cqmKN9NobK+UoV1j087WscDb3F3o+Oqn5Uu0doxtIftQ3GeFA/Lwfp9vDyxKfJ6Z9bsM4Xc0eCxXp+WVE7jG9/Eaw0a7MQFFbZ79S0vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skMCww/x; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skMCww/x"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1638890a91.1
        for <regressions@lists.linux.dev>; Mon, 10 Aug 2026 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786384493; x=1786989293; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4Fe/KOMaxyN3MKU9219/iuMnmc5Z0NpUYJStevNPkg=;
        b=skMCww/xBfLrw9aTxX+QUVt6lAQregxjo7uqejuw9CzKrDXi9O9W03gOb0F7zIBTJy
         WhTXT2Ujz+8dYbgRlWiuBGRcLnBrmLA0UCUBks8ZmZpbRA5CJ2yRvbR6ksvI2B1137KC
         UTnd4cUiIkca1YnPBFhZowVqQGvbqAs1BnMb8/AR9hL1c97MnElIDOvee4GU7ar8FjxC
         OfK4AX+6KOjvNOGhhFAnA2JpH8CkAp6v2bHHQpsWmZPgHV+9mnGl0BGmdw5HkiY8F+DH
         sxs25kSp5rSamhsB+y6kxRv6Kkze6bs8+ar8cv5gILtwIxtW5vGK51sma8UV5flKHR1+
         MsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786384493; x=1786989293;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4Fe/KOMaxyN3MKU9219/iuMnmc5Z0NpUYJStevNPkg=;
        b=lXPQ/bBkFOAs2myTRH7slszuZikuj4nFRQAK6Wr9c2FmJQX7FuSzHemI3o3YI/bqUS
         r1h4QdqgtTRwTA+YmA+9YjFVl2X9ejG4Zd7/FgkWQN00j2If4KG8hsIhafRRFyiGsmhH
         Ryfd7AUjnKU3Y7ELiMlapfXusgtQ6cHs2TKw/EfOJtsVBzDzER2fDbVdLTcfo5FriFew
         geIVAcn3GasFQf0360KC3oobyasY2UgtxYQTamHOljeKB/uP8T+COkAYKPvRqQzlGNkX
         8gTPGndjmf5CrFhR8NXRs4bdhWsvTkp7Ab3YwZBONPnPgMN++UpVjfEF0xZIvgx4T5xx
         o0fQ==
X-Gm-Message-State: AOJu0YwxLlUVofVJTJ+HLxjG9Hu/9cyM42YJqLZpnsk45CyD5OpPjWiq
	FCoYL7ZmoLldyBWnBtbmI0XrNTU4pqe/2rUzlESXw2zSQVsjVrAS4Eq6
X-Gm-Gg: AR+sD13S231ePaM/xzrlhmhJB7vR3jAJVe5fSnDfdZX4pZit4JFQn/8JgTLNt0fWPhU
	YZNoUJ58LMxajWDUsBQQ/M54dDItd4ahzhK0E9h5F7xaQqFEUs//RfGhmvVW10Ty815RKsw833E
	NExXv+4/68n0db8OdI2q/W44V75qRwaVJ8PpVEmAfdAjB7VSAS8WJ+2/JBSUij/TEX54/Q4wmkC
	QMgbC5QUU/R27at42QzCHHfTRnldu1f3kRr4AjZK7v8wZqO1qU1O3a39fgkgHnOVbXVWmuTwqH+
	er+f8kJ3b5nOzhh2+fXKO57kj5cJyvOQqNlBHWSAMzW/urswuRcXBoinEyfJsCXfPgZMLzhGTAZ
	Y09uOhoHanX3/I10pBHTxnE8l/sgJoyibe8QIKsVexOVw12EmMKZgkbcstIhMsxJIXyS5OkuiAQ
	eYPJEgZ51W3QLfLIA+kM/aBY+96zAtrGaWkCJR+6H3XlZ0TdhHNd82RJGb8eabPq4o7ew=
X-Received: by 2002:a17:90b:5444:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-392821fc107mr21840689a91.2.1786384492786;
        Mon, 10 Aug 2026 10:54:52 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm421004a91.17.2026.08.10.10.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:54:52 -0700 (PDT)
Date: Mon, 10 Aug 2026 14:54:45 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com
Cc: regressions@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	leonardo.costa@toradex.com, francesco@dolcini.it
Subject: [REGRESSION] mainline/master: PCI link creation fails on Apalis iMX6
Message-ID: <bl7i3obu2clzsgeoct2a4mtfhv6typcjdqmgneropf3hpgwve6@n2m5uhlduw57>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

We are seeing a regression on Apalis iMX6 where connected PCI device
links fail to come up at initialization, as shown below. The issue is
not on the devices' physical connection, as they worked properly on v7.1
and are working on other stable kernel versions.

    [    0.154243] imx6q-pcie 1ffc000.pcie: host bridge /soc/pcie@1ffc000 ranges:
    [    0.154400] imx6q-pcie 1ffc000.pcie:       IO 0x0001f80000..0x0001f8ffff -> 0x0000000000
    [    0.154439] imx6q-pcie 1ffc000.pcie:      MEM 0x0001000000..0x0001efffff -> 0x0001000000
    [    0.154553] imx6q-pcie 1ffc000.pcie: config reg[1] 0x01f00000 == cpu 0x01f00000
    [    0.356072] imx6q-pcie 1ffc000.pcie: iATU: unroll F, 4 ob, 4 ib, align 64K, limit 4G
    [    0.356181] imx6q-pcie 1ffc000.pcie: Link: Only Gen1 is enabled
    [    1.364757] imx6q-pcie 1ffc000.pcie: Link failed to come up. LTSSM: POLL_CONFIG
    [    1.365056] imx6q-pcie 1ffc000.pcie: probe with driver imx6q-pcie failed with error -110

Complete logs: https://paste.debian.net/hidden/f08cdf68

This may have been caused by commit [1], which was introduced to solve
an issue where the Apalis iMX6 module wasn't booting, and this second
regression went unnoticed since then.

Is it possible for all PCI changes to be reverted back to how they were
in v7.1 before the next release?

[1] 7678e81498e2 ("PCI: imx6: Fix i.MX6Q/DL boot hang caused by improper PHY power sequencing")
Link: https://lore.kernel.org/all/20260629143439.361560-1-leoreis.costa@gmail.com/
