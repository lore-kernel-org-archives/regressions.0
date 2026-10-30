Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380761;
	b=TnbqmymzNXBJJUHEpBr1kNl1zcRdUGwldn5v+Wd9Xz3mwkLzILckH2aEMGk/mv608vRS
	 Z/FqvDdsMstQQd6KKqNoiQH1AIUoh7z8AXamnUsD5mlltoINqh6j9IoY6921PQnm7g4MQ
	 ClvBk5OW1zKaePcJQw5xoogV63kFS7knvoe9Rg7zfxZ7unPtv7OddtJXnu4kGUJ9bRXrw
	 rmJXmNlHQzNWqf+IUOFZmoBfFWztqbRhWoU5BHtttjxiVVTxSd0ibmmP4hPBhO7Y9psqC
	 D6LmyApb0wCJA/vcCbahpBBIfrItjeb2nSl+yyRHHewQAaUvzKrLoNCyHE/EDJEvdfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xNCuizie4/rA3iBJi7WKXbiS7VvUpnFkAzErMyUnySM=;
	b=o58VQWX9WbDJYHX1jbD7x2U3tWQhyU15yvDhCjLkhiG6dg1hUQWJrviv2yXeHWC7Ftuz
	 F2MqKWWE6bMS3BVU3oPZlfrNb5mDbMhKWlfM2Ntkvjn2ZWmLudCmwH4AKGF3oWdYoI3+W
	 LGflpmkJY6hUAr4s8GdxNyuAMA0cngN1uq/iwbP7m86V2HXTf3lTKZiad+RkogN+wx6ry
	 vxsBhLBZ3VilkTOOlwoo3HeQXuaOKCPKlNZCJ8AgHY+2Z/qxnSRkxesUptjr74C5rZUFz
	 Z3dJS4GMOHSAc+Zy6mYgdAGQmHr+hcF5BtQtmmMCRu6gvPQWUeIsks2ef9vzzx7sHgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=VHTQX2XS;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C4C606A321
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 17:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C4C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=VHTQX2XS
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso5076055e9.1
        for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793380759; x=1793985559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xNCuizie4/rA3iBJi7WKXbiS7VvUpnFkAzErMyUnySM=;
        b=VHTQX2XSdpxofbIhXvrFO+YKWbmstA2jBFOSAts6oFLeXfZDEFPElG/SQnYX6TISoE
         QtW9/Uu0KKHJPdx2gXqEl/YwePWdjDXKw0DTi3g3q7g3/JTOF60vvYozqzHZYCjl+9Ey
         WiYh+QVHImWH/VLetLk7ygB1ripZhFCxlZqXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380759; x=1793985559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNCuizie4/rA3iBJi7WKXbiS7VvUpnFkAzErMyUnySM=;
        b=MXIHF3YQ8gJp/4G9YlXwuMXv6qBzoW9TQQGGNO+9+V3nryz3CHw0hRTCF71CiuoF1H
         Ei8yz81KFUtNEmqH+Zt+DrtaXF8N/P+YT5zK6+9DTarnR6mvTh0Ab+Uw9t/HLyzaB95I
         TDAscjvP0ktDPViz4xLbyCdpoEVnbrFWyElWiXQsbIZZLdQ8o9YoiCs43VhIVaopFAq6
         3OKd/Ek1BNMpOvEo79ybU89I/gwalB5TQzF+Kg31psPeUH9bf6ssHwYOCoS2nnNip1w8
         0bGmx4mOUhmi2mnrsI0q+iuAIcL/U0yjtl4RtH71v2beMYqefmqPgDwsa075zDZYsbTK
         oddw==
X-Forwarded-Encrypted: i=1; AKwUvBxBUULtf12uXlSgvmb6aaD5xUqcAICjSB5ooLxBK8PrxltjE3gObExevuFEQdpdaGJiDUmxDZEB5K2/Wg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIUV1M/QUIITOauAEh2SZJQsDtirydDM32nLju5rijpHFX7lG0Q
	i0fBdoUASFB2G23nzNYY8xC78OocpjIqXoY5wmxH9w79ePme68SzVgyVDQsZrR5xOpI=
X-Gm-Gg: AYBFou3buMZ/+HeZ9xFeMykxdO+GJBwRDtPpv1roZ5igX1eF/eFwrddBJY+5lALRyY7
	J51g7fjNrrkadtH+l6Y1veCVwgz+S95i8lrRWFcwUCPRazuSXyjL5ag3mJ0QwSgS+alb5JvUpjL
	P9byDLQhYOmFg1dlD4fwFiykKsH9NpW9N3CwDO0i81dEHk+viS41rJCEc616OVBB+044C9mI6Xp
	B5lIYUI+kTl1Qs9qEU5SeLzPTlmTAigs3uT8fQYmK1MqxLuOU5eT9utKToE/ssw36fslEYctFzP
	1baFAL/QrxmPFazbe5Ot7acvf/bsXMGD7ATeclXvUgUoSf6aAXDt32mjMcg402cnBDPpoqy/Ifs
	gw+9p159cj0yKOcngqw9jFc5/2YzaT5YPjOKGTpkFfHVSKoaQw4qoTLF1ZAL892Jsq9Rckpg5ef
	GRHC6IEy5/7k+ltBJ82JC4GOsQitZbLvqCXwxAxMoFSBQii3abfQcorIbK3Lywrlv5oMyy0PgP3
	xBWFmVDuHOGAP+3R07P2Wqa+YnA2p1+u2+6hmBgangRpryfF2MEoPFf7dt7JPE3qSIoD6E1j3iu
	NNY71XlbapyvZRVzUEyhD4kwaJO9ab6ddG0Rot9DXpzYU3NSVp7cjAvmtvdg0rpiKq/AAKBD+/7
	9ZrJP4Q+IY9HUvYFtnH2Nyi4GAYfwmIKAuOAOIHd4sC+0eL67mZ6hQL+Wp2J2u3BX1sYti2gvvd
	QrHNAZTLIL/oyuLp8b/euchdzexg==
X-Received: by 2002:a05:600c:c4b8:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4ac150b38dbmr70600135e9.1.1793380759329;
        Fri, 30 Oct 2026 10:19:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf368bff7sm74252355e9.2.2026.10.30.10.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:19:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: dario.binacchi@amarulasolutions.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pm@vger.kernel.org,
	coresight@lists.linaro.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] cpuidle: psci: boot stall/hang on i.MX8MP
Date: Fri, 30 Oct 2026 18:19:09 +0100
Message-ID: <20261030171910.2822677-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ulf,

on an i.MX8M Plus Dual board (Engicam i.Core MX8M Plus), mainline
c339f4010dea sometimes stalls for ~0.9 s at boot, or hangs until the
watchdog resets the board, right after:

  [    0.806123] ledtrig-cpu: registered to indicate activity on CPUs

On a good boot the next message comes ~11 ms later.

About 1 boot out of 3 stalls or hangs. With cpuidle.off=1, or
with commit 65705b18162b ("cpuidle: psci: Move initialization a bit
earlier in the boot sequence") reverted, 10 out of 10 boots are fine.

I haven't dug into it much. The stall seems to be in
pl330_driver_init(), so my guess is that it is related to the AMBA bus
reading the ID registers of the CoreSight ETMs while a CPU is already
in cpu_pd_wait, but I may well be wrong.

Any idea?

#regzbot introduced: 65705b18162b

Thanks,
Dario
