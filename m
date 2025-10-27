Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898BB7262E
	for <regressions@lists.linux.dev>; Mon, 27 Oct 2025 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761580188; cv=none; b=fPyxrhF/8Z7J3vDnWhKM1AR+KOeyo33XpToASfw2oLPMVnI07Yp5KqE9pbWdaZSOKm3DRVi2pcErClPCk4Dblb2F7WMhrctE1PZcC2A8iYOX2Lwv82WaFPD1csTczhihz+96O9wgzS8/jjuqd6tSf714M8hetmy11Ka7BQ+XK1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761580188; c=relaxed/simple;
	bh=UWXNOia5i2LXFNCxniBhPNy+B3i2b+VOEpseDnBchwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQxGDg3wK2kS0xiABai1Mp8osTFxZMuMNtb/WFj8oyAO9vNFiJ60p0JgViaG3otLTaJZ/d2UQzK7uPbeD6AdifnDxdQ25THwPaiCNKT9zIXgwBaqon2IBnF5yWKfUMA5rTIOmlIY9OcliNat78ndbOc+hF32zVmN+GQiy2BIssQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=avm99963.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=avm99963.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-427087fce27so713255f8f.2
        for <regressions@lists.linux.dev>; Mon, 27 Oct 2025 08:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761580185; x=1762184985;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tuFuQd8b6LEtd7q52rQ+yXQJ5DgFrv5WBeJOLMhL0Q=;
        b=u5mF+3TIS762sYQgFFW+qfN5rYagRCK4feV0599sQcNVU80y2bgqsecoeqqDESkW6n
         7eZBmBFaZmNVynsIODr9/sVQEiBXOFJYaZueGWWpmOwv5rhEO0O0tF1OZfT/iDicfDGl
         ridqu66GpDm6hYcepLswlZrTY3lIvoWwGu6CYMAWGY6Dpa2JyQ39V5DhVtbjGCpcwP2l
         pF5jA2xEWpZYdBLNYhlvv6hck7JjQBe9pLeb4Dl5+j1kaBBi93LgtuxOkSu2JehYrhx7
         S6AWx/Hs4egxdNyyGtsM1OAboeLhlskaRjadNndwhWKm8Z2P9HFKgS7o8dboEO/QESQR
         dVYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5qIsdsCIeip18bWXuTwKUuPPvWDHLGhLZiWP2ENwdzxv63acBMPJzTAw0jytS1yeq0/NjEr9SgM/RaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrDZlZaA10CeTfE4ZlNP8lNzTyqHyIPzcKCvE2stc7P/lAI1JJ
	1YNOw4Sp6qhvEF/NbT12ClNOE2q/XK+pRgqQL54XpEUU5AUapxr9Z+jT
X-Gm-Gg: ASbGncvB/r1u3UJNcpyxQob67xvUpNOATIvHTT/aT/+CyYdYqWqK/xyxBk46yRN6zy1
	vKGU9QVJg4NLChDYQNIIqYeM2Pa3ZAFZTFgm02Xwk+7srKLA1eRvsC5rb3AIPxXpRbdAv79PcCx
	LaD2ADqyVeqE1kzdPEnSIYOMjOzrG9k8b7LvLYDUjRmoLhcHSvAC+PRmfnLMK1jfbRZOKjh1yUX
	YGV1h4rcr44tiwThkMj65MqRSAbAtgjP+EIwDQdciXJhEslE5xF39M1uO7Aujzm7mjJlbnb1Ww6
	7TtLs0dIaPCmP1932h4coDOp91//zfS0/HVJhTCjtvKjEFGBMrvSlvYONmvXWleuGkB2ro3hXLO
	q+TJRCSL0t3aRmUfDCuAifA0/MFNRJj54sZMMndCECWCFeFYjWcEn46t4nnpRJ+y+UFHFmGJBir
	LpMFSVY3ekG6UrF/4Uq5ulYHbAWtxcoKxfnnlkt2bgrwzI
X-Google-Smtp-Source: AGHT+IHbADARTiZwpNXdnPHTBLxEA2kvllMjfgUB3Ibxe0agSvm3wvLxkVZSwu9ItigqgGKwBTJx6A==
X-Received: by 2002:a05:6000:1846:b0:3f7:f02b:d7a with SMTP id ffacd0b85a97d-429a7e7c17bmr98740f8f.5.1761580184600;
        Mon, 27 Oct 2025 08:49:44 -0700 (PDT)
Received: from pixelbook (181.red-83-42-91.dynamicip.rima-tde.net. [83.42.91.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9d1sm14798750f8f.35.2025.10.27.08.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:49:43 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:49:40 +0100
From: =?utf-8?Q?Adri=C3=A0_Vilanova_Mart=C3=ADnez?= <me@avm99963.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	"Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, regressions@lists.linux.dev, 
	linux-pci@vger.kernel.org
Subject: Re: [REGRESSION] Intel Wireless adapter is not detected until
 suspending to RAM and resuming
Message-ID: <qfbtr6dxa37d2rj7e3kiswyuu2jeeys2iceas7v7xhak4h6wi2@s5tloxec4mnm>
References: <149b04c5-23d3-4fd8-9724-5b955b645fbb@kernel.org>
 <20251020232510.GA1167305@bhelgaas>
 <aPc4JpVyhCY1Oqd-@wunner.de>
 <zmkurgnjb4zw7zcg6uucbtvuratxlaau5lvhkgknidpjz7vnb7@dnsyjbrqtvqw>
 <aPj4kUglHgBm4uAt@wunner.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPj4kUglHgBm4uAt@wunner.de>
User-Agent: NeoMutt/20250905-dirty

On Wed, Oct 22, 2025 at 05:30:25PM +0200, Lukas Wunner wrote:
> On Tue, Oct 21, 2025 at 03:35:42PM +0200, Adrià Vilanova Martínez wrote:
> pcie_aspm_init_link_state() later does call pcie_config_aspm_path(),
> which should rectify incongruent settings.  But it's only called
> if the aspm_policy is something else than POLICY_POWERSAVE and
> POLICY_POWER_SUPERSAVE.
> 
> Which policy is set in your kernel configuration?
> (Search for CONFIG_PCIEASPM_...)

I have it set to "BIOS default":

CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set

> Does setting it to CONFIG_PCIEASPM_PERFORMANCE change the behavior?

Yes, I no longer see the "pciehp confusion" lines in dmesg and WiFi
works after bootup. I've attached the dmesg in the bug I just opened.

> With 4d4c10f763d7, the Wifi card falls off the bus and the link never
> comes back.  I don't know why the commit is causing that.  As Mario
> suggested, it may be caused by the platform.  Could you provide an
> acpidump for further analysis?  The usual way to share large blobs
> like this (as well as dmesg and lspci output) is by opening a bug
> on bugzilla.kernel.org and attaching it there.

Sure, I've created https://bugzilla.kernel.org/show_bug.cgi?id=220705
with the acpidump attached.

> Thanks,

Thank you!
