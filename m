Received: from sonic307-54.consmr.mail.ir2.yahoo.com (sonic307-54.consmr.mail.ir2.yahoo.com [87.248.110.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B4DA92C
	for <regressions@lists.linux.dev>; Thu,  9 Feb 2023 19:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048; t=1675972746; bh=KwNPJ/AToV7s7BJtq1j079DLsTiCXw7K/+G1rMD5iew=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=kuybpKi2Damr9O/DaLXovfJ2cLpYxTfgdS0DO5swsLqzjghFkdZSl7k/FrN7LFc3hGOSHA/a95B4rt6Dx9ez3WfkxfVVov+tJTjJvBz/D/ibP95NHOUlDgxtHtRZWy7klALG0qwgr7XnVxIFPDycGpwbbrlZMU8lAtGws/KZFCIJ/N3675aDp76rmMMPCN4sG81ZrN8tK6P1NmGcPJJSN1L/vPIicvK6Dll5U0Gs9I4TbLeJcw8njAL7Cd9VTLMyCIbgDMqFvqcgvkmBHMIVCY5lFAt38Yr/wGXgt4LSNN+9UiJZYRAQo1DgEJmWMwLGAGBkDBIWtvz7c+yLF7tLig==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1675972746; bh=5mduS/CKzmyhjn1R2y2W9QOJK0Y3ZnUExd9uuQK8UoJ=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=hQ8aI1nc8WIU5M2EH+ZJvpzBoPNERcAR2wuKzo7LBXQUI+VMv3X4vkDSOKToYXfskNb+oF2HkXaN844QBdbCOgxdsattYBHc08gdxtC+uzCDpRJHDuawg594HzXMZuj4XbpU22TwFHJpXUdclVxdXF3xdDHYFt+EoL2e1U3nxChYZUNRHVNRDFIxJBAjd4QuVUf/yvQ76c3QggXc5HBKgZWB32e0xhjfvxy6gbADQopyvMBh+gY+/SYyRWapKYRftC3VZRQBAUObmf7L4IFQTQr72ssHcAQg64gTZ5HiI4xY+4QpiJ7QU2/3vDdIR2a+74HroLZFb1vHel8kKc+MHg==
X-YMail-OSG: _gr4aDIVM1kTlDEclyEw7OPF5wvZae5T7Ggqe73PVJ.rCnDqMEJkrnlPDPk657U
 2V5pq_zK.ipFzpW4q2aDYh70.MlRgDX4Rsgrkg5dy7nifaXwiYzmagGmVYNM2tkajwFXzSt35_JK
 VQCIo1jj0zgp.w9wDrEeF4_DC0s.lXAnQuKJpaI8zd8MbfYJeYO0rXOSfxD2Yz0SFcTCkDZo6P4G
 0guuDD4qRnlgrXMxyINcReU8uGHndg72IcMb3G8AJTPR5z8I3k8ZUjMiDwmE0SYV7QS8er8YZ74u
 DM1t76Xm32s6PNuwgDAj6NqNmgdLqLVnWReZI9JnVTeHbd2uDPv9XVqu9R5oIP984cSt5zUXDEiP
 s7kiRZalQrh4q4uJiuIMtFdxG6rtMS1FvvMAZToWyyQJoER_SXYvuHWejCXuwAOj8Onksfbd_bTw
 40lvKCtYiUqc49xcIdKksroDtbz5l.shxwUtxfscCw5rjlAl.Bp3GFAMb8ySGmXro99WWaCb8VNt
 Kr6TIZhJLw9B.SgihhQxxygnzMKakBTyFjqj0qQubEON.M8GLaEYYLE3iwBGnb4gXnlXKAwqkNrG
 FIUZnp0wysd6pWT3adEn3v82HBOZQv2gcmXCBordsJRUTxD28H8lULBqW8gS09KG7STVUIu3p1xp
 XyrJT2fsvqAFOO0TpgtRa0bHByaLACKdogJsrgTFJsWUfLskkRLwecZDdnp2PqrPKn8IwNMTsazL
 7yp1DyGXZKGkpL2cqj6TX5hswWIIIfqD4_yjK0KKtydkdhJ_Mn8G0nGt_nDZbr3qHiSOWseqgF08
 O5xbP1FdOuzrUmN5ouL65vvtScdBD5KICldcjDwFJGB6cHr2MTuf0LuZWdtsf9nr.rxKcKl._k0r
 jqu68jT02GTg8aLBQ2AFZ0JHG_w9gYDufKG1FsZN5nNgcSzmAmB9ZYcze.q5RHTLecp7EwJdup2.
 yrT9BlviA_iA3L5QLljPl1nomJEAajBSujdRAVa0CENwY7FcfdmypnZdjn14eaB01DxbKycWBcbC
 Miw__fF5wjW.Y8OLxbkUfQD.VnCiKlg6lZ8HzIPU4WxrwD9oB7BWZRYud56U9Rj0Ow8fYGp8xiqE
 A8MXi51OW1cumE5z47xlHzKtW8var7hYyEkSo5csdG9QWzV8NRmq.8vPAO9lu1zsc8N3G9ylmB9x
 nKxxX4G7W8pFaKMOAOqAoIuvhHPJ5kllBoML0QRLEP.J8PaCXslMz9TLJBYcGnlPcyiz72BsHMPF
 XgIbmADPPM.lmzE88Byv0IU9tH3O3QEzJvtH9gIzzziCWlmCNjWEaIhDXwECBgFxRFI.3jcqPwOq
 mbg1MsvO.BTMoOFKXaX1tEHI8YYjTzAtn1qpryeb6V7lNAoFovi_TMwv6hUDPjI0OR2mdephTGPl
 NQ23JdcePjZOTkiQJ0rIS6uPe2ztIgQDENI63IobuYW5hExHJdURmstm.F_YUsF_21x9ocuxTBtK
 XdP0jzWRXj_hziT1yGMUet8XGBeL8SbXrM9qBU_ZVpxgBqn_biM2bfQtFfxKXTzUPhKWGF1sWaSb
 _nvd7gvuQXSujgsEh2zlYdgCsc1sVDHjpf.Lv4KEy_O6qEmrl0MfDW4J3qLB61oOFIgrQMFtq0Yo
 Z79F9o8qrie0KaZprUlkuHuPSoO55amb4XkiON0znV72Uf8D.gIXDJ5VJMEmC0Jkr.vkJYOLTULC
 oe1JnM1ut1o3Rl8gY552aZTqxYcsIue02y363.WG0Ovw6zwuZNZKh2C7PSS3gTsETC0qcswiNT8A
 DdeEFMIdI_DsPGJpKM.omJOU80fXjkTscRsXRTbyCqXtbnThxI9ZVXZMjXpt2iuM260MaydMFB33
 sB94DRm5d1.wBQL9qZy9YQfeh9XBtMbGE7l0FMxRRks2CK1arhxiBCSl2MBCNuQh_UoYiQ0cWFk6
 0uUBZ5Lt0M779PN24D7mxogn4kcmAAa429z5syhjk3x4IHLyUxgDqSruvEsho5nrWC8SIgdQ0asw
 dGC3aNe2mK0fic68XJkEuQkZX9saGCr7aFfPYb6fCKXnI6x2wK07BmDLB4wiyLe7UtDa7Liuj6_5
 G_x39ujfMDR.emND4Bub8vRAfg6UGATuss47CdLleIYm6DOcsxkiakZjvv10TTvdhLF46J6_myB1
 COD6QrAW3__znguX0hiD1NxGnqusf5OdGWlB.mzOTOmAcI9U08d0eCFE5RnHb13tPPf3MMuN75RV
 Do8kgTOsjeyoMW6P_QNGM4z5G68d2egpC1QSDAuh4_x1V_OGsGf_fsQBBF27OzWoX2vZCY41hqUH
 rC3dZ4PPdNUGhKXdW5vsiC7HEU7XrlEPF
X-Sonic-MF: <pmw.gover@yahoo.co.uk>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Thu, 9 Feb 2023 19:59:06 +0000
Received: by hermes--production-ir2-65c64dfd66-pqdpl (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID fb9ffc7f82294a96aa2e98fa50d3b442;
          Thu, 09 Feb 2023 19:59:04 +0000 (UTC)
From: Paul Gover <pmw.gover@yahoo.co.uk>
To: stable@vger.kernel.org, Yan-Hsuan Chuang <tony0620emma@gmail.com>
Cc: regressions@lists.linux.dev, linux-wireless@vger.kernel.org
Subject: Resume after suspend broken, reboots instead on kernel 6.1 onwards x86_64 RTW88
Date: Thu, 09 Feb 2023 19:59:03 +0000
Message-ID: <3739412.kQq0lBPeGt@ryzen>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
References: <3739412.kQq0lBPeGt.ref@ryzen>
X-Mailer: WebService/1.1.21161 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Suspend/Resume was working OK on kernel 6.0.13, broken since 6.1.1
(I've not tried kernels between those, except in the bisect below.)
All subsequent 6,1 kernels exhibit the same behaviour.

Suspend works OK, but on Resume, there's a flicker, and then it reboots.
Sometimes the screen gets restored to its contents at the time of suspend. but 
less than a second later, it starts rebooting.
To reproduce, simply boot, suspend, and resume.

Git bisect blames RTW88
commit 6bf3a083407b5d404d70efc3a5ac75b472e5efa9

I'll attach bisect log, dmesg and configs to the bug I've opened 
	https://bugzilla.kernel.org/show_bug.cgi?id=217016

dmesg from the following boot show a hardware error.
It's not there when the system resumes or reboots with 6.0.13,
and if I don't suspend & resume, there are no reported errors.

The problem occurs under both Wayland and X11, and from the command line via 
echo mem>/sys/power.state


Vanilla kernels, untainted, compiled with GCC; my system is Gentoo FWIW, but I 
do my own kernels direct from a git clone of stable.

Couldn't find anything similar with Google or the mailing lists.

**Hardware:**

HP Laptop 15-bw0xx
AMD A9-9420 RADEON R5, 5 COMPUTE CORES
Stoney [Radeon R2/R3/R4/R5 Graphics]
4 GB memory
RTL8723DE PCIe adapter

**Kernel**

Kernel command line:
psmouse.synaptics_intertouch=1 pcie_aspm=force rdrand=force rootfstype=f2fs 
root=LABEL=gentoo

CONFIG_RTW88=m
CONFIG_RTW88_CORE=m
CONFIG_RTW88_PCI=m
CONFIG_RTW88_8723D=m
# CONFIG_RTW88_8822BE is not set
# CONFIG_RTW88_8822CE is not set
CONFIG_RTW88_8723DE=m
# CONFIG_RTW88_8821CE is not set
# CONFIG_RTW88_DEBUG is not set
# CONFIG_RTW88_DEBUGFS is not set
# CONFIG_RTW89 is not set


