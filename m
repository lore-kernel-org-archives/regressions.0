Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907E335884
	for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 08:10:13 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bf6ea270b2so40437105ad.0
        for <regressions@lists.linux.dev>; Tue, 19 Sep 2023 01:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jade-fyi.20230601.gappssmtp.com; s=20230601; t=1695111013; x=1695715813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDaVHG8otiJPEb7VvRQaEf7e+HpyXbPyMYQtyJhoTbE=;
        b=VPJ9UfqEi2yz7eBMc5fe5fjeDpR8nrltZxfX/DjJUsnGca1dZmcwXdXauHwUhUIo32
         Psrn/jl3a2IFFT9DmrMsGKxuMak45ION6lJXUpHGRs4m/ZsQpJ6WVboWvh0LAotUNiMT
         sldLTVWlT41Wffv/USX1cpajuWiHeZx4meTEJQNyGR3ESneRc8n1uDvyAzFyPHXLl+/p
         Y30A0n8HCnQhOGJzTMUFfit1fNM9ttN3R1RW1+RbbWYyGp9PDNnT6GMtU4AJxWnJAlIf
         1mheFB6BcXAEjaYJZCUtAJzaYswcecz65LbKK13kdzXzLcBZ0ctTSl48E8QxnKTpOZk2
         yvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695111013; x=1695715813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDaVHG8otiJPEb7VvRQaEf7e+HpyXbPyMYQtyJhoTbE=;
        b=shUJdwJS1m4tWqijjKgQRqw2rKdKHKbjNHAV3P1iwG3NLpVxOf5Q1aBMapPJ5iLeo4
         2KAeqZYU4Y8iy+V8ycpFmBtscaYon+gK1SXM3OoykQ02nsFnpSryN4ZYY3OBKSTfIoII
         IS80rSYEjllt9x9S+JX9xoN0tfwlMRAEoM9oMWAhp+rRy+Pi3e+l3YcpUSbUuxrKcIfX
         PQ9pA1h2OnFEr8Dg5kqAUGKKeq4PS0FeDWLcwA/orwGchfumLi/1gGtTlEvGbUtkTy1j
         ET6vVb+YBAHCkANvgf1H/bF84hvt7MhoEM2XaTMxtBWt712+E4cwua44G41v0qsHjxkh
         9ldw==
X-Gm-Message-State: AOJu0Yy5GgtoKsrUmkuEehmiVd6ctuSiEXAW0ejj3aS/rFlZmfWwcShE
	6Lz8JGY8EPBsHpepMVTLyuzhWQ==
X-Google-Smtp-Source: AGHT+IGVJowM4/9XEQHW4+PaTqlhWRPWK+4eWaInB4DrrZBm59Vtc7nXUAWRCf4YZwM6CZm0oVKf5g==
X-Received: by 2002:a17:902:d485:b0:1c3:9764:764f with SMTP id c5-20020a170902d48500b001c39764764fmr10700562plg.48.1695111012747;
        Tue, 19 Sep 2023 01:10:12 -0700 (PDT)
Received: from localhost ([172.103.222.8])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902b48a00b001bdc8a5e96csm9491983plr.169.2023.09.19.01.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 01:10:12 -0700 (PDT)
From: Jade Lovelace <lists@jade.fyi>
To: ricky_wu@realtek.com
Cc: paul.grandperrin@gmail.com,
	regressions@lists.linux.dev,
	rogerable@realtek.com,
	stable@vger.kernel.org,
	wei_wang@realsil.com.cn
Subject: RE: Regression since 6.1.46 (commit 8ee39ec): rtsx_pci from drivers/misc/cardreader breaks NVME power state, preventing system boot
Date: Tue, 19 Sep 2023 01:04:49 -0700
Message-ID: <20230919080447.2594902-3-lists@jade.fyi>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <c7bdd821686e496eb31e4298050dfb72@realtek.com>
References: <c7bdd821686e496eb31e4298050dfb72@realtek.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,=0D
=0D
> In the past if the BIOS(config space) not set L1-substate our driver will=
 keep drive low CLKREQ# when HOST want to enter power saving state that mak=
e whole system not enter the power saving state.=0D
> But this patch we release the CLKREQ# to HOST, make whole system can ente=
r power saving state success when the HOST want to enter the power saving s=
tate, but I don't  know why this system can not wake out success from power=
 saving state"=0D
> =0D
> This is a PCIE CLKREQ# design problem on those platform, the pcie spec al=
low device release the CLKREQ# to HOST, this patch only do this....=0D
=0D
I spent some time debugging today but I am not a PCIe expert. I think=0D
that the card reader is actually violating the PCIe spec by not forcing=0D
CLKREQ# low on systems that don't support ASPM, as appears to be done=0D
(accidentally?) by the regressing driver change.=0D
=0D
The kernel logs on the affected system states the following:=0D
[    0.142326] ACPI FADT declares the system doesn't support PCIe ASPM, so =
disable it=0D
=0D
The PCIe 3.0 spec states (in the description of the Link Control=0D
Register), regarding enabling clock power management:=0D
> Enable Clock Power Management =E2=80=93 Applicable only for Upstream Port=
s and with form factors that support a =E2=80=9CClock Request=E2=80=9D (CLK=
REQ#) mechanism, this bit operates as follows: =0D
> 0b Clock power management is disabled and device must hold CLKREQ# signal=
 low. =0D
> 1b When this bit is Set, the device is permitted to use CLKREQ# signal to=
 power manage Link clock=0D
> according to protocol defined in appropriate form factor specification.=0D
=0D
My reading of this is that on this system which does not support ASPM=0D
and therefore also does not support clock PM, the driver must have the=0D
device hold the line low, but I may be wrong.=0D
=0D
It's still unclear to me based on studying the schematic of the laptop=0D
and the PCH datasheet why the one PCIe port is able to break the other=0D
one like it does. The CLKREQ# lines are simply connected directly to the=0D
SRCCLKREQ# lines of the PCH, plus a 10k pull-up to 3v3, which seems=0D
entirely reasonable; any breakage surely would be some software/firmware le=
vel=0D
misconfiguration.=0D
=0D
Jade=0D
