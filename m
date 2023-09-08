Received: from sonic309-26.consmr.mail.ir2.yahoo.com (sonic309-26.consmr.mail.ir2.yahoo.com [77.238.179.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB941867
	for <regressions@lists.linux.dev>; Fri,  8 Sep 2023 07:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.it; s=s2048; t=1694156643; bh=ao+HO0aDJmdMm2403+HAbJS5xC4S8ZTxz/tRjzTI1fY=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=bH0//1dPXox6NDvs0bL6/Cj1+i5k4YDnFPq4a36waGfXONxXZbyTBBfc+uj7E/INEDjpzKxpwukPjkUGnn8R5lYQq7DB2P4N1/uBGcgBehcdzZvkc7wv4Fa2mrhXKxG7PQbxupMT2wwne1KFltaxhrhARWJAf/m0oDg3aq/LqXp+OkS4b3sbBEuRTxDlI91vzrmQMwyH5fBDTsefmn6w5e6tuZFM/PBHhTl9O6yrmWEuzDkzjvvBkZhJbhyDrzxpG1NNU/uEX7L8d9+n7echY6fpdzmGLXQ47ER9F1QVi4UJB7udgVtctcDUGbMFmBeaHJSn3NIjPd9mRkvyYaHnfg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1694156643; bh=1HwthscXmEXM9KMZawuTrCK4njobjkk/OsNGXB+0zFf=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=pBU0Mm4fxImIn39SdrasuqTfl7qgsBpYev63GXg/OuyvQPqn8J7S6ugEso6d3aXN4F/AhCDBQfBSbiP0ToDIgV0DsKodS3OxIsfywPln3k5mn5EilOUcFvG+cadzBiU0dHx5M9dOTyYCl3yZMsnrYMXhw5wAD4gxFQGaaXIXelJC1+zfqL1KXs7Nh7mcecSG8SHwgEVQjXxNL5ibJDeHobjnIOX5bUxL24nkNHYJfV0E9WCe8M7Vz59Qtac0k5b4Whi8wDl139X9Guww8DiGO7sH4GbnjJam3O4+2Lmsd3AqhiucfeccBSAQJbj47IggKtwkNFnB81W0AWwsgOx42Q==
X-YMail-OSG: WMrUmFsVM1moNNElV83JcDrPsPUv2hvZSJJchynlX1YRj9psZOnFa_RXDRwFhCj
 lPBziTC6GlM8Yw36nNGDB.vWbDvhm03wmSwZ_2wFNbAI32JQvPkcYAZlA0tktcBv2zhBN3RlwlCb
 YGEIsMU6NahXoeCZoBBAaHEOJqQtYpKTOB9dax3ggiAbQfxTJxyNYF0nq_d53QUu6zALi6nOL9G7
 jGLT8topLjVtOkAq8C2VjGb5Gfs1zOLjY.UsoxqaZ6Z6e5gh2xZSUZDT36fhDHq8u4.lyBn47jR6
 S3WpS2oSRt9SJu9SsrAfbLYKWv9M8s6jdr63YC79HraOaNVDxkTMsm1XHukXe0TyTkGdfOo8fCE4
 F0C1m3rk_f7QLukr2x0QQ3TvDQo9YK.AOjPsXjn0epEsouxeozwtbify3K3JV38Eqz9lhuF9TSWA
 ejOIOJNNGFBnIfBZRiAEPiw1H_w6CP.RKqQW5xvQqIe_YhPVR1JjLY2AOGok8Y3qOZ1Dkl0YMbsG
 3utYZPNGLFXhxJA1G.jserN_M9pjNJDLyEhnZY6Y33p8B5R5VsD5GF5TcmP5c28y4kAPySaKRJCM
 i3gnCxRe9yEy3UrYFN1Q0cg5YX7k0MT.KJkSYJYjXL5KlAbkDL1zBzj3N.k.tL_22bYQUmncNAq0
 lfGFM_2FoynzQnq4iqYvo8fSYBCRKeeOBQ.uEbE9kiXBpGM39z678KK5q8VMNeCNnzUkfLfdZvoK
 _ST_1kOSZ6Mdn8F7OQ0mvsMTkL0T7UtV6vEd3Y5GhdCbkAdTaucTfleM_sDvZYXp9fCPzCwhfYzn
 KRrgi_87szl_M3k2kVhLkhedgjcZPLnHAE3eiaIwgLPL9a4xgL7Qu6qx_gIlblfSEQsbamdlcW_a
 FIS8LWNUtUWnst.8iv5P7a7ZeVEZwOytRlam25g_v6aWJWdvAyWHKZjIfA7hkE3CCoBJxGbyAAYB
 p0NJEBi5IYqBJhw8cWpsWNM91y4f0_ra1rNn1b0ead1OPywlFQz4_xeqH8thIbG4R3Jzl_NqX2zz
 9nmTnSjtJbtlB9Cv_8kf_W44OJGLUF0hTzaDPNmZEjSFfr7BLcDIGizIURnmF8Ow3hvP_oEfOHnD
 B_HrcMh.X3n4_6WOA5AW.IasETqKCJFO6l7THPlpYgYX8pcU4PKt49Bbwy4XgWC..ifzrrYDlDt2
 OWixro0K8BDG47esQV1QIey.1BTKukohMhB_njXGQ3hiD3uwLTceqDOX3tyuTkkYYYPegT2Ahyhq
 azWAiKbAeBYRC8MU_sjRYlgVxTsdmlK_IKf.z9Ovb2vu9KW6lWNZwuAydvS.FOMcvzo4qTw8fPAj
 vez2ujtw9akyyhCjnMHMHl53oQ4l4obdqDoRw5fOItyny1cHyJIhwmyekMRN7Zlc0xU00tAl9YRM
 kBoOSn.pfitIELnPks5bJCsvCSIm9ZnGVZjNjwGcb6qlGyklXMEj19LcL9iFR.STaJZDWf4D8yTw
 WtWnE6iuKfV_9uEeN0tzLUX6lfytNYdxH570TfHG1KU42ZrjNOaCPq.M0Nf4N6FsRkS7KSW5UJyn
 KVXt5Wr9oHTxLKkcc_ikc_DC27sY7e3nKuQ7DVGhyGpG8JGimlEVD0TyakkZ9kp.UXDqrgZ3GeIE
 W_u5r0CtJeVL197Nmn4RpZXPtL0g9jA6rtwf8EZuT3GAgBBwA1acgDlHON73F16kllygRIzYvN5o
 YeHCG07ugyJtgZV_DVchBKiC1DkxvByh0Lx2jD9N5pkPucbEtulRl6Ta7Aivk0OMmYHWvRTcNL.B
 TjEJ_PbcS6WOvPY5IjklyPGOgxsdEKogSREZjV3nkvZ7EzXomTxhpCmDUui_Q3UaLzeiNIM232i7
 bfapH4METwFyK5Brm2Z5FaxV7agf.zeRDaR9ea6PqHGm.PaFyR7XU5MVIYqM0yQenmYFYrUh5205
 8PzIoWeBCc01s9.iXXumdFSHqd9iJQ68caKrI9psDdHeuiwEo9QpdHlxEbpmtcOn69F0gSC7SB1K
 lvLj9YYTc3CBmutlWxOXifAk37hyUQtK2FbFVrCFuTnjrAdNCU39qqX4RsJnVqXdazLclSG3uMS5
 Rx9N4mo90SB_G.FbW5BL9RZtS2nNOTKuxMNt358hFSEtn9q0wL6TIn1K1dohCauQOmtfYRD0BwhX
 gDBk5D8dcjtfEzZiPPMMhBu_Cudh.7sHZcx9E2iFig81KK84quP19YUdmAt9fumeblEHWqFI37Tz
 veGw6WX0-
X-Sonic-MF: <micheledellaguardia@yahoo.it>
X-Sonic-ID: 4273f5a8-94ff-4f53-8166-28a63e1f702e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ir2.yahoo.com with HTTP; Fri, 8 Sep 2023 07:04:03 +0000
Date: Fri, 8 Sep 2023 07:04:00 +0000 (UTC)
From: Michele Della Guardia <micheledellaguardia@yahoo.it>
To: Meng Li <li.meng@amd.com>, Perry Yuan <perry.yuan@amd.com>, 
	Huang Rui <ray.huang@amd.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
	Linux Power Management <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>
Message-ID: <1881372085.9115426.1694156640596@mail.yahoo.com>
In-Reply-To: <ZPql6tqBCnXJh64J@amd.com>
References: <bede02c1-ef90-8e30-aa8b-e6fae49a8ccf@gmail.com> <ZPql6tqBCnXJh64J@amd.com>
Subject: Re: Abnormal battery drain with kernel 6.5 (Ryzen 5500u)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.21763 YMailNorrin

Hi, my CPU is AMD Ryzen 5500u.
Thanks a lot

Michele

---
Architecture:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0x86_64
CPU op-mode(s):=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A032-bit, 64-bit
Byte Order:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Little Endian
Address sizes:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 48 bits physical, 48 bits virtual
CPU(s):=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012
On-line CPU(s) list:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0-11
Thread(s) per core:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02
Core(s) per socket:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A06
Socket(s):=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1
NUMA node(s):=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A01
Vendor ID:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AuthenticAMD
CPU family:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A023
Model:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 104
Model name:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0AMD Ryzen 5 5500U with Radeon Graphics
Stepping:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01
Frequency boost:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 enabled
CPU MHz:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 975.888
CPU max MHz:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 4056,0000
CPU min MHz:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 400,0000
BogoMIPS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04191.99
Virtualization:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0AMD-V
L1d cache:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 192 KiB
L1i cache:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 192 KiB
L2 cache:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03 MiB
L3 cache:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08 MiB
NUMA node0 CPU(s):=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0-11
Vulnerability Gather data sampling: Not affected
Vulnerability Itlb multihit:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Not affected
Vulnerability L1tf:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Not affected
Vulnerability Mds:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Not affected
Vulnerability Meltdown:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Not =
affected
Vulnerability Mmio stale data:=C2=A0 =C2=A0 =C2=A0 Not affected
Vulnerability Retbleed:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Miti=
gation; untrained return thunk; SMT enab
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led with STIBP protect=
ion
Vulnerability Spec rstack overflow: Mitigation; safe RET
Vulnerability Spec store bypass:=C2=A0 =C2=A0 Mitigation; Speculative Store=
 Bypass disable
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d via prctl
Vulnerability Spectre v1:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mitigatio=
n; usercopy/swapgs barriers and __u
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ser pointer sanitizati=
on
Vulnerability Spectre v2:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mitigatio=
n; Retpolines, IBPB conditional, ST
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IBP always-on, RSB fil=
ling, PBRSB-eIBRS Not=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 affected
Vulnerability Srbds:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Not affected
Vulnerability Tsx async abort:=C2=A0 =C2=A0 =C2=A0 Not affected
Flags:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fpu vme de pse tsc msr pae mce cx8 apic=
 sep=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mtrr pge mca cmov pat =
pse36 clflush mmx fxsr
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sse sse2 ht sysc=
all nx mmxext fxsr_opt pdpe
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1gb rdtscp lm constant=
_tsc rep_good nopl non
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stop_tsc cpuid extd_ap=
icid aperfmperf rapl p
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ni pclmulqdq monitor s=
sse3 fma cx16 sse4_1 s
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 se4_2 movbe popcnt aes=
 xsave avx f16c rdrand
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lahf_lm cmp_lega=
cy svm extapic cr8_legacy a
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bm sse4a misalignsse 3=
dnowprefetch osvw ibs=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skinit wdt tce topoext=
 perfctr_core perfctr_
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nb bpext perfctr_llc m=
waitx cpb cat_l3 cdp_l
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 hw_pstate ssbd mba i=
brs ibpb stibp vmmcall
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fsgsbase bmi1 av=
x2 smep bmi2 cqm rdt_a rdse
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ed adx smap clflushopt=
 clwb sha_ni xsaveopt=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xsavec xgetbv1 cqm_llc=
 cqm_occup_llc cqm_mbm
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _total cqm_mbm_local c=
lzero irperf xsaveerpt
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r rdpru wbnoinvd cppc =
arat npt lbrv svm_lock
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nrip_save tsc_sc=
ale vmcb_clean flushbyasid=C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 decodeassists pausefil=
ter pfthreshold avic v
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _vmsave_vmload vgif v_=
spec_ctrl umip rdpid o
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 verflow_recov succor s=
mca





Il venerd=C3=AC 8 settembre 2023 alle ore 06:41:42 CEST, Huang Rui <ray.hua=
ng@amd.com> ha scritto:=20





On Fri, Sep 01, 2023 at 05:42:22PM +0800, Bagas Sanjaya wrote:
> Hi,
>=20
> I notice a regression report on Bugzilla [1] that have been already handl=
ed
> there. Quoting from it:
>=20
> > After switching from 6.4.x kernel to 6.5 I experienced an abnormal batt=
ery drain since my laptop is actually never idle.
> > I accepted default CPUfreq to schedutil and AMD Processor P-State mode =
is 3 (active).=20
> >=20
> > I expected a different behaviour, but am I missing something?
> > In my boot configuration I had "amd_pstate.shared_mem=3D1" and tried to=
 remove this switch, but did not affect my power consuption.
> >=20
> > Is there something changed from 6.4.x to 6.5 that requires a different =
configuration to get an optimal power consumption?
> >=20
> > Thanks a lot for your attention
>=20
> See Bugzilla for the full thread.
>=20
> Anyway, I'm adding it to regzbot:
>=20
> #regzbot introduced: v6.4..v6.5 https://bugzilla.kernel.org/show_bug.cgi?=
id=3D217853
>=20

+ Meng Li/Perry,

May we know which CPU type are you using? Try "lscpu"?


Thanks,

Ray

