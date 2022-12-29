Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0475A1C2B
	for <regressions@lists.linux.dev>; Thu, 29 Dec 2022 09:36:01 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id m3so3874643wmq.0
        for <regressions@lists.linux.dev>; Thu, 29 Dec 2022 01:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yuuMTq3tQdnyH5Yce/s1HBbdjT8ovktxTEvGAjjKTME=;
        b=VD//s1ELIvPninxa/wK2X3Ze6X+6Q80GIKW9S7dXuEgqAvvrDGnT1VhRSSTTydH2ft
         1qLHhYY6NCv6bIsszDuj6eVEt2CWj2M98e8+kPKxqgVSNPLsRIOoYurNWJGZi728QhNu
         d24Ehcy+GHxBvIV1fcFajrGNuaPbHnw/ZI0Mbaedoz+7ogAHMQlTEul38ksHLtpSQ4pm
         AASX+Jl1nuqwsrewA1cCNUueo5DQo3iPX4C+vYs98q6x0AboWI6Njbx6y3D0ezZFDegy
         ophlxTpIfjHJ4JvslWpphr4EyhWnxy8gmF5wb+FaGAukKkT7cymQWKi7kn1+YWY4ZniW
         lfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuuMTq3tQdnyH5Yce/s1HBbdjT8ovktxTEvGAjjKTME=;
        b=xeTpmGkmAhgpeirlS0rKDRt9Y5ATyP5acr9OggJMEVrF/iY9/wOyGyiNcoV03lZtGH
         YvGDEL/RJktt2vkw+KonQzFCl1PxklwDACPk5FJl2hZzkK6gJkx/ldClfigl6HGl/XSk
         g4SFZXmwKXTseTCJgImRbVcLVexaIEUnzFWac/E2dtbjqL7lTU/gjtCvNaMokbQRZG/P
         ufI9jBm4vfmDDrypjdb5xzB/4+N21JYbU1GZKKDyB8RkTp9EXseb9mih6dpAQ2/N2oit
         Rx3SN9km8ianFNsoIGCV3ugkTd0Jkn1dw3CwHiz4hreeHdrYuq+FDBrn9/ahxK3MdcLB
         C0vA==
X-Gm-Message-State: AFqh2kqDOD1dUweObXyg40uJhSFBI+jgLgsY8Y+1+pn3crORvyV/wsVF
	AmUKcSMMcplbRlK/ke+erF4=
X-Google-Smtp-Source: AMrXdXszF0kIvMzxUvu++pEEAa1pzsmyIaVyRdLcgtTp9RNeZVeA6WkweNn/pBse/1W+1SbM/Z72HA==
X-Received: by 2002:a05:600c:3495:b0:3c6:e62e:2e74 with SMTP id a21-20020a05600c349500b003c6e62e2e74mr19989430wmq.15.1672306560173;
        Thu, 29 Dec 2022 01:36:00 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:8eb7:c418:9c1:3b85? ([2a02:168:6806:0:8eb7:c418:9c1:3b85])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c444900b003d997e5e679sm4045588wmn.14.2022.12.29.01.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 01:35:59 -0800 (PST)
Message-ID: <f24474e70c1a4e9692bd596ef6d97ceda9511245.camel@gmail.com>
Subject: [REGRESSION] v6.2-rc1 on Turris Omnia: DSA switch ports stuck in
 NO-CARRIER state
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Gregory
 CLEMENT <gregory.clement@bootlin.com>
Cc: regressions@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Andrew Lunn <andrew@lunn.ch>, Marek =?ISO-8859-1?Q?Beh=FAn?=
 <kabel@kernel.org>
Date: Thu, 29 Dec 2022 10:35:58 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hello,



I'm facing a regression with v6.2-rc1 on Turris Omnia (Armada 385).
All ports of the Marvell 88E6176 switch remain in NO-CARRIER state,
even if devices are connected.

Links are negotiated properly by the hardware, but the kernel doesn't
get it. End result: No network connectivity via the switch.

The usual (working) behaviour at the end of the boot process is (dmesg):
[    4.328259] mv88e6085 f1072004.mdio-mii:10 lan1: Link is Up - 1Gbps/Full=
 - flow control rx/tx
[    4.328284] IPv6: ADDRCONF(NETDEV_CHANGE): lan1: link becomes ready
[    4.328344] br0: port 4(lan1) entered blocking state
[    4.328353] br0: port 4(lan1) entered forwarding state
[    4.329331] IPv6: ADDRCONF(NETDEV_CHANGE): br0: link becomes ready
But this just DOESN'T happen with v6.2-rc1.



I bisected this issue (v6.1..v6.2-rc1), and the offending commit is:

c4de4667f15d ARM: dts: armada-38x: Fix compatible string for gpios

Reverting this single commit (on top of v6.2-rc1) "fixes" the issue
for me, and I have network connectivity again.



As further diagnosis, here the relevant content of /proc/interrupts:

*** GOOD (v6.2-rc1 with c4de4667f15d reverted) ***
 43:          3          0  f1018140.gpio  13 Level     mv88e6xxx-f1072004.=
mdio-mii:10
 64:          0          0  mv88e6xxx-g1   3 Edge      mv88e6xxx-f1072004.m=
dio-mii:10-g1-atu-prob
 66:          0          0  mv88e6xxx-g1   5 Edge      mv88e6xxx-f1072004.m=
dio-mii:10-g1-vtu-prob
 68:          0          3  mv88e6xxx-g1   7 Edge      mv88e6xxx-f1072004.m=
dio-mii:10-g2
 70:          0          0  mv88e6xxx-g2   0 Edge      mv88e6xxx-1:00
 71:          0          1  mv88e6xxx-g2   1 Edge      mv88e6xxx-1:01
 72:          0          0  mv88e6xxx-g2   2 Edge      mv88e6xxx-1:02
 73:          0          0  mv88e6xxx-g2   3 Edge      mv88e6xxx-1:03
 74:          0          2  mv88e6xxx-g2   4 Edge      mv88e6xxx-1:04
 85:          0          0  mv88e6xxx-g2  15 Edge      mv88e6xxx-f1072004.m=
dio-mii:10-watchdog

*** BAD (v6.2-rc1) ***
 43:          0          0  f1018140.gpio  13 Level     mv88e6xxx-f1072004.=
mdio-mii:10
 64:          0          0  mv88e6xxx-g1   3 Edge      mv88e6xxx-f1072004.m=
dio-mii:10-g1-atu-prob
 66:          0          0  mv88e6xxx-g1   5 Edge      mv88e6xxx-f1072004.m=
dio-mii:10-g1-vtu-prob
 68:          0          0  mv88e6xxx-g1   7 Edge      mv88e6xxx-f1072004.m=
dio-mii:10-g2
 70:          0          0  mv88e6xxx-g2   0 Edge      mv88e6xxx-1:00
 71:          0          0  mv88e6xxx-g2   1 Edge      mv88e6xxx-1:01
 72:          0          0  mv88e6xxx-g2   2 Edge      mv88e6xxx-1:02
 73:          0          0  mv88e6xxx-g2   3 Edge      mv88e6xxx-1:03
 74:          0          0  mv88e6xxx-g2   4 Edge      mv88e6xxx-1:04
 85:          0          0  mv88e6xxx-g2  15 Edge      mv88e6xxx-f1072004.m=
dio-mii:10-watchdog

(The mv88e6xxx driver doesn't seem to receive interrupts anymore).



Best regards, Klaus

#regzbot introduced: c4de4667f15d

