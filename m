Received: from sonic314-19.consmr.mail.ir2.yahoo.com (sonic314-19.consmr.mail.ir2.yahoo.com [77.238.177.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EC36FB7
	for <regressions@lists.linux.dev>; Mon, 13 Feb 2023 12:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048; t=1676291040; bh=Lidb/t/85uYD0R0nEPRspux5N4k/e6TtAm3PGpyV4zg=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=rkO4Ix4qfxuf2TKeSEnH2kUoVz46TkU0m3o4u4VmoeW2YG4szhD8cL7K6BmWbIyIWeWe8tNGI+bZTrbRBnNVU8/CtiuMYO8Z7Z0RqjW3laRNwU6cWUxSehbPcvYoJrh1GM12TEVPal9pjzcR+bF3chydTeLBSqQfAWNGwbUn3nGslvrkKdCZG8f5Lua57826LQgq2BOn9457e3dGI3+BC1SzabU6ctzEK+ol0B5PlDsCbqaGoCd0MGvS4Fo+0azp4/9oXWisnLOzaTL//LXk7xqDDJSK8tA4noAlNggePgKBl+Xw7OO/9gS/Q5RIRBSdjPzYzmP5XhEoKopEGt3aQg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1676291040; bh=gIO6tb3DdZpb8uEa0TeWTUjSYWv4XnIY3gV8wSGVr71=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=LnFkDUpf7Q4F9NM+6azQfM/F4ulRaKtvzDvAeuyn54BiPwbxo6XdeDsYyqV/TGJZ/qYNuPQ+T26DIuG+rEyi2NykXSOxDJUvoM4QMTFYiVZaeLLeQ0XyaGx6T76z0wayRVHj49crvVNPHAV94LfBRqB5Th83+cyl4ZCB56Iqu1h/lv+695B7P9+M2pec+EoksblZomqU2rZTemSiqWpj7gLePfAbsmSWY4axKoyXP6m4c6dK+TkU5jPx0yQHhd8fCkFOln2kXMyCo/CuyMJtrv4q8VTqFZmZy0QKdy1HLmtedItcpxD37Gzd5/Fv/UWBL1X63p2icbJ+UnO+WDxSvQ==
X-YMail-OSG: YXsxRkoVM1n66eok1DaECSw7XTkvxbcGsoPn.Wtsm37ZkduZyeiwnmkrfVLBoMJ
 lYUB7MqO1oTXzzSrNqMgp.cOMmIBxD8cc_vM1vr0sHK0qxTEs1WnbuI0rLWbm7ThFO7ysFBQTYrs
 DIpaSYZSLZK01IkCpv5B8.K_8ltCseBlfMylWx8OCiE4LcdjqjdngHB.eGC6idnCXOPZZ5wWtff_
 Vo0b3Z.jANc6LDH._bF3ejPzZVm7KF6nFovFijOgqLz9eQLVMOHr7mXRC2oDxIaFDrrDmRme7ERm
 qWpSkoW0tZVEwSvPdTtd0MjrZ2t4Xf96pNih3_K5FSak..Jp1HrN8N7FR9iayVzA8.TwoFd9m2fM
 B2GD_OSrqC1b0gxx_NeNzDrZXUvu04OAZpgbijlsqFNzH8iW1F5Wq554gZ2osklGmq4fVrdTw29K
 j_Pe050.VQw_48hkdnqcVETkpfG5Vo_yAm0GBQMCE_vQxpkXUr4iGD1oC3dmZnCTIJl8i4JlgFC.
 uIK3DZZ7ZhIwU40PGf5PkXSC0M7DNDLIjfNGplGJlon071ZUN_V7xYds5A6pzDLDo0qwXNso6UKp
 ej0xOHd_9M3N9KijO.r2yLrtZ8eDSsc92_xm0MGV4eZaEWbMcpzVVSDAmnr8LkKCkkxPbuAaOMYM
 uDdmvlf0qLzWJn_qjb1WmzBz7IsH4CIGSxlWrnAIYM.Z4sdpBhvZ0XEghkWZz2UrEbgJNebLXRqX
 J13laDG.8_LSI9G_Iz1SSTqmm2lhyJe3fftCWNV6I5pWaHSz0Ff2zFj5y8y4wWI9Sx0neSTXG0.p
 XTvCLdgyI79hLkUwMnH_BQb578_4DsBmIP8xuuTqJNo3td_bHxq7eAAwgoz0ZXWz7rIGC.z39yin
 21.lSnaMgzNv2wlyHjEMJTYyoi4m85KGOedvjGAydLZ3GXlvMjAB9qNkTAsm_yeClsUXsMwz1NaZ
 fevqfq8PqNC5fHG2Ths1.rc8k4hcBhWsfDSHCNt1F6jwH3lXDL418L8r7kLc_00lnY2LiNpWAJGO
 PjcXyJWVA3Tk_9DZZYgmQSJ6oAVLseKsyoW66OTOOcWWc8xQJe2Xj37pykEILmXra8.tArqJIl7Q
 tM65pK6c0Fqyclr2N438V9tgvnJzzOLsvCfGw9VUzWqWHBhZiRr6ooT86xLp1WfFLI9wgWi72dRP
 Ygn5jyOQdtNcDa93NKFTaq0k.8wBNLcCd.PcTzv8bJh8rLYwmzMmHho4uaNzLzB63fsU9L5j5VYu
 LutLMPR_PnOre5FR.Tpxlsxs0N4NoQeQUCqOczqFFz0Aklxg52ppc91aX34.NiN7tS1akmeqE..e
 orfRwQI0Wumpwtd9yc2vkfVI9ryVdc4F6KPVPKLTaDB6MtcPO.Gn4bhG5jYDx9ki7kzSXv2DtBAW
 Qa1ZaHpnJARFnngHdv46X9RvvNXJ3ug183K.nE9dj1T0GZC.SVgVJCX6NNKB0b_PgCkb6S3xXyl8
 CyP.QKdZttGAPIBBMMjcs0YKGT67VAue7QCQHOT.imUDXPC6sXj0wu7HKTfs34keold9XOig2xaT
 k401WijIFxqkf5SWNuZ2lNyXmK3jqIke6nZ2AIfW1QINcxomKJjOntCvI1.lQVBb6ubQiItZqz_z
 EJeaxscyTvSW70sw21oYts44trbZAeC2p_L5fdSGdApar1Fw94qE1raHCJ7KdIzNzxVUrxIlabwm
 _DiDQGFUT5LNvO1keYLRe5RMy94AJQO7kPha2BbYmicJqksKEXmC0L11Oe9W_LOb4NtT9BihrALP
 ALl48t3KxHofR2pnkYZPAf.bkIaokUhPQuf.23ds0bWLA7UrH5mhIO8dfDUCwD5ubFoRToFZ11AK
 jL59ZDiE5tJyhl_GG46RCfio82o3_KLdxhMU12bLYi.qjriB9iUmcfRsTyZ8E0XdU71B627E5upx
 aRi8Z5_aM9yOOUAn0dzajZNS6_q3XwlQZ8dhjpZ5bzybv2gExv0og6h7Xam3fE9kDXqnzrUnWJCH
 eLDf356uvpFEBlt3AlLVwcxaCRTJh8WXP5TBU83TeGziP2MtkFpZXjM0UzYdAxqHB3EsZYBQU6rP
 JvDu9b372LEaANEJCv5WK0X1c2vRsneIN303tKedsp9dGAo4Hgbsl7rnpUR8uJPhYshnc.nVcPzP
 vS98.YQOnQ4ZfVHloYPWJZSpFCjviKZ6it.UCSNNTsIur9H9nIo4JANw1PxrK_ahV2muza7yxhY4
 zx1hvwORAmSTQs6n4F0PVok1rHIDQGNStU6rz3JjLdUa..pIxXbW1Z_kwBjrzIvjMZGzbG4wwwLG
 ETnhfr3bIoVPkmGz4vfIxtFcSCgwi4XxlpVOdKg--
X-Sonic-MF: <pmw.gover@yahoo.co.uk>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ir2.yahoo.com with HTTP; Mon, 13 Feb 2023 12:24:00 +0000
Received: by hermes--production-ir2-65c64dfd66-q2fgd (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c15dffe479a6d6171d8d5cb27b1f0f0a;
          Mon, 13 Feb 2023 12:23:57 +0000 (UTC)
From: Paul Gover <pmw.gover@yahoo.co.uk>
To: Linux regressions mailing list <regressions@lists.linux.dev>, Gary Chang <gary.chang@realtek.com>, Yan-Hsuan Chuang <tony0620emma@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>
Subject: Re: Resume after suspend broken, reboots instead on kernel 6.1 onwards x86_64 RTW88
Date: Mon, 13 Feb 2023 12:23:56 +0000
Message-ID: <5648174.DvuYhMxLoT@ryzen>
In-Reply-To: <0024ebe795eb48969380d442b24fc4be@realtek.com>
References: <3739412.kQq0lBPeGt.ref@ryzen> <10a47408-3019-403d-97b1-c9f36e52e130@leemhuis.info> <0024ebe795eb48969380d442b24fc4be@realtek.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailer: WebService/1.1.21183 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Ping-Ke,

Thanks for responding. My answers embedded below.

On Monday, 13 February 2023 03:42:14 GMT you wrote:
> > -----Original Message-----
> > From: Linux kernel regression tracking (Thorsten Leemhuis)
> > <regressions@leemhuis.info>
 Sent: Friday, February 10, 2023 8:25 PM
> > To: Gary Chang <gary.chang@realtek.com>; Yan-Hsuan Chuang
> > <tony0620emma@gmail.com>
 Cc: regressions@lists.linux.dev;
> > linux-wireless@vger.kernel.org; Linux kernel regressions list
> > <regressions@lists.linux.dev>; Kalle Valo <kvalo@kernel.org>; Paul Gover
> > <pmw.gover@yahoo.co.uk>; stable@vger.kernel.org
> > Subject: Re: Resume after suspend broken, reboots instead on kernel 6.1
> > onwards x86_64 RTW88
 
> > [adding Chih-Kang Chang (author), Kalle (committer) and LKML to the list
> > of recipients]
> > 
> > [anyone who replies to this: feel free to remove stable@vger.kernel.org
> > from the recipients, this is a mainline regression]
> > 
> > [TLDR: I'm adding this report to the list of tracked Linux kernel
> > regressions; the text you find below is based on a few templates
> > paragraphs you might have encountered already in similar form.
> > See link in footer if these mails annoy you.]
> > 
> > On 09.02.23 20:59, Paul Gover wrote:
> > 
> > > Suspend/Resume was working OK on kernel 6.0.13, broken since 6.1.1
> > > (I've not tried kernels between those, except in the bisect below.)
> > > All subsequent 6,1 kernels exhibit the same behaviour.
> > >
> > >
> > >
> > > Suspend works OK, but on Resume, there's a flicker, and then it
> > > reboots.
> > > Sometimes the screen gets restored to its contents at the time of
> > > suspend. but
 less than a second later, it starts rebooting.
> > > To reproduce, simply boot, suspend, and resume.
> > >
> > >
> > >
> > > Git bisect blames RTW88
> > > commit 6bf3a083407b5d404d70efc3a5ac75b472e5efa9
> > 
> > 
> > TWIMC, that's "wifi: rtw88: add flag check before enter or leave IPS"
> > 
> > 
> > > I'll attach bisect log, dmesg and configs to the bug I've opened
> > > 
> > > 	https://bugzilla.kernel.org/show_bug.cgi?id=217016
> > >
> > >
> > >
> > > dmesg from the following boot show a hardware error.
> > > It's not there when the system resumes or reboots with 6.0.13,
> > > and if I don't suspend & resume, there are no reported errors.
> > >
> > >
> > >
> > > The problem occurs under both Wayland and X11, and from the command line
> > > via
 echo mem>/sys/power.state
> > >
> > >
> > >
> > >
> > > Vanilla kernels, untainted, compiled with GCC; my system is Gentoo FWIW,
> > > but I
 do my own kernels direct from a git clone of stable.
> > >
> > >
> > >
> > > Couldn't find anything similar with Google or the mailing lists.
> > >
> > >
> > >
> > > **Hardware:**
> > >
> > >
> > >
> > > HP Laptop 15-bw0xx
> > > AMD A9-9420 RADEON R5, 5 COMPUTE CORES
> > > Stoney [Radeon R2/R3/R4/R5 Graphics]
> > > 4 GB memory
> > > RTL8723DE PCIe adapter
> > >
> > >
> > >
> > > **Kernel**
> > >
> > >
> > >
> > > Kernel command line:
> > > psmouse.synaptics_intertouch=1 pcie_aspm=force rdrand=force
> > > rootfstype=f2fs
 root=LABEL=gentoo
> > >
> > >
> > >
> > > CONFIG_RTW88=m
> > > CONFIG_RTW88_CORE=m
> > > CONFIG_RTW88_PCI=m
> > > CONFIG_RTW88_8723D=m
> > > # CONFIG_RTW88_8822BE is not set
> > > # CONFIG_RTW88_8822CE is not set
> > > CONFIG_RTW88_8723DE=m
> > > # CONFIG_RTW88_8821CE is not set
> > > # CONFIG_RTW88_DEBUG is not set
> > > # CONFIG_RTW88_DEBUGFS is not set
> > > # CONFIG_RTW89 is not set
> > 
> > 
> > Thanks for the report. To be sure the issue doesn't fall through the
> > cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> > tracking bot:
> > 
> > #regzbot ^introduced 6bf3a083407b
> > #regzbot title wifi: rtw88: resume broken (reboot)
> > #regzbot ignore-activity
> > 
> > This isn't a regression? This issue or a fix for it are already
> > discussed somewhere else? It was fixed already? You want to clarify when
> > the regression started to happen? Or point out I got the title or
> > something else totally wrong? Then just reply and tell me -- ideally
> > while also telling regzbot about it, as explained by the page listed in
> > the footer of this mail.
> > 
> > Developers: When fixing the issue, remember to add 'Link:' tags pointing
> > to the report (the parent of this mail). See page linked in footer for
> > details.
> > 
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> 
> Since rtw88 can support 8723DE, 8821CE, 8822BE and 8822CE, do you have chip
> other
> than 8723DE to give a try? Or, install 8723DE to another platform? 
Sorry, I'm afraid I only have the one laptop with that device built-in; my 
other PC is a big desktop with a different chipset.

> I have added myself to kernel Bugzilla, so we can discuss further there.
> We will try to reproduce this problem, and will update to Bugzilla if any
> finding.

Thanks.  I'll respond there.
 
> Ping-Ke
> 




