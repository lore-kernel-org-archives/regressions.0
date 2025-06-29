Received: from sonic322-20.consmr.mail.gq1.yahoo.com (sonic322-20.consmr.mail.gq1.yahoo.com [98.137.70.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F7128F3
	for <regressions@lists.linux.dev>; Sun, 29 Jun 2025 02:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.70.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751162578; cv=none; b=k3n5YjIC8AAYFN01aC8H87KDlPLX7UbBKqj1DiVX++rjSfETZtzFTtmJihql3gLIim7F1JqAXbDGdJnrzOPMtm8s0K2aRJP0jpAa13IRkQGweyMMzGPVgCCve1nTALI0mur8Dt7KLQ7Z7RmWimZICxKtol5sC/5jBRu2A8F8Xbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751162578; c=relaxed/simple;
	bh=22+L9kPkerMCA+EZuK6q4bELaVRLJiLUMGHsll4c+7c=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=XXlXcQn19WNqsrtsitZT4PFSvJCdnxxQokeEO51RO9Nxe7bqwkQjFfS2uXqIpWh79Tj5/raZXwtFPG0MXcgxSZlrBqyMeJZnlXYiI2GXfqJFdRxj9QM0lLq/Aqu9LVouDcXUu7zfcg4XitkV9bDiezchIX5Vg+NP8o9iJnWmAZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=LD84vxfJ; arc=none smtp.client-ip=98.137.70.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="LD84vxfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1751162576; bh=22+L9kPkerMCA+EZuK6q4bELaVRLJiLUMGHsll4c+7c=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=LD84vxfJ9VTjCbcil+b8bMTpcm6ZRqR0V6GDMbd8wKnFdajSoSaJ0n+OIazSZpGTRqJ9Ii3brZUacq/9dI4jAYvb31oVafY3P0cw1yKpcagqsFfJbETTkp98nG1RWkdCWnrpNfwjGmaZDS4nmKKS9Dv2rajMsQL4MhUFZE7eL3nNrZpJzwzL+YfzBoff8hGlCBrOvViJiFl8FxMIqWkogT+FSbZRI7TGttQenFrgmBZGlidSqAKV1WCGSLnvch6ZRwhIMoVjv3zE55c+s91JAFxIWeOPrjZGsUU4OKYKMcf3ALvqD7UrqT7PRC7KZGvWKg1BIFCOhI2YJ1cpqUvNiQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1751162576; bh=ELY+XnjFNL6ZzQDAJQ2DJ+dG+2mZ7o4W5bxg21wVZnv=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=P/ZLG2KB/LYNVjwudYp8hK2NU3KDoS16N3SnXlGLWpA+hqwEvcZeCHZJliyyZx+q/WV0G+stQforkLQRSeDMH6VDAwNMsjup9nQWv8m87wW4yP+mZf/VZBFvVTJhe+apnJbL2SvgOiwFZU7Y3JYTXdmAiKAVXkkSiAi/RNNrIzCELgjBwA4ZkOXWkeKbTOgnvTtiiNoZotoUdX5ganYpZSCYVIm/QIz6cdo55p76eWgBgnjZC+7HwYBPxkvzUN7GOYthVCh0pZfd8Im9/+dYpoJlH0D8oNifPpaXg0UECc5ni54d6SoYeJFqQsBI7UBQLE+miJPl0uzOonsDBM5ecg==
X-YMail-OSG: cZIDioAVM1noq5mS7e2z.y5RnzvJa2l1jZ6EOF4GV8Cqot.VlkjUO1Nb4LfqwN1
 1S5JNtZDV2t4uaUy6mwUn0E.Wb5xKpdzdgO2hD58N5zsg1vvNYDAuSGV3s0uvNFbRmvKLiii.kwa
 m9KUEit9COWFMt.qZ4gZkO.PeEnRX7lp0DSvdZitNT09aX2vpjBBwivtzXqbBqJFW_b29CUApBZr
 SbbQ58Fb.XomSBYihI1xF5d034G_E447vetfs8Ltc9A5I2dsU0z8SfJFiTdd0xbcTypuMRpUj9j6
 BF2VO1X.oaExothUQYjN5X62GutQzek48U_0xAoxQK66pdMFmELKK_Ri0INuLgkz0RnVcrg7YhYq
 uiXKvxz68imZ_KHYattFEGcvAYai59ZNDHpY.nMruiVxSWDv2mtvxUA3aKCSPRYLgSxn87gYNdaJ
 WK2idk_IkC3Jg2D_cUv0bR2ItfNpR09FuPj.RsCSEUuxpC8Gu3uQ.QM0KtQjbaPIS9TC3tossuJU
 SwFeSc6ViXrCzHkc9FPMsJGzmyuoWYH3oH9hmQ.oHhXsUq75hLx.dKWQVVBFVEHuy6pt5Kqt8ZZF
 qmczPg8uCCBbZ_Re72zO7pS0UTFB7YS_33.VUI8Kj6axaeE818b4sSKQ5bjYdKP0xhFxhe6ZUBgY
 rTtUmJUcmsB_ZjiJN1oB7mqOtqbX6lGSh_X6Iw_SMNPz.k4Qgz67fHjDVoHy6HXzpySc.59xt16T
 hE.S4T9HxVRh_Hqn41dzPd4biKusSbyZp8e6gJMupubZpc9E37N6Qo5IKpCxDRpZkAEtx543d.l2
 YtpgU_flLA0JD1VTvQWKIhuiCV_72K41eXbD9LoQ0KauYjpPDjbFUR6_zIurgVX3eYSrdHx_Z62X
 j.gdemM3NQaUX3LcMOUi7dnj3SGfZc7JJ1ke.bpPburWqutlbLuNfAhmOzjVNg4DF.gkGxwV4A7G
 Ptu2plsQune8yHtatvhlg1sOU.NmH7APgeC3bQKuPnpnsJKehMN1qF8JtxUF99JFk9blAr7aYfNq
 7X7SVQIpDxjlYi7l15Gw7unG1p_lcrwstKHDPSv7LYuML5hERWi4.9ccsijGBgtcFQlSCpI5RYgF
 q6BTrT5LODVFU67FbVmuZck.L1OuG_RyLNTanM4L2WWaoLTGBi19uRxRUXpT_SyVuJqSMpVfgz.U
 l91ZWf_uUBKhMv.y0DfzabL7nRqcUBsV96Ql.a_sIgr8gffpYfbpoKFCxBS5jkdEAHuwyLuTL.Kf
 4ZlrjqS_i0Zp0llv6.w8towr3agPKUZifihV_57kum6U7rapzHUryVztWrjFVNOGcNgNJ60eZT8D
 YmYA65.RnWeA1kYxPD2a56CVA3jlUzrGuDTKk2Pmxn3pNKzrPlxgCqwTGQpGI4OA.TtWmhXnW6oZ
 75FP2HqCFe3G.1gczlo_QOXK5gkZJU9NHxQijx2rRLB24g6xzfyMavLrhwAQ8t11oIhrJNKiNbOp
 G.TJwFI7TM2mr9abGG3X1tALCKcQ2O7XwFXhCs4DromaMq7dgfcT8bVZiuaHF_xPM4gwy.qZ4vA5
 U7DN2veKsmc8BVQaRRSfMOX5QUPONSz.oUpsYE6HDPmCxCffx.osjZickjyAtDLVqWKUXHyFfFXU
 sodZGSmHen.zbdxPxCUWcGIVcem2T5cfg85IySe1Y8Hq7LgMLjUKnQgjETJmkzgOuxaWCFmes1xA
 DeAU71xaLe1hmDx4lyYR2sGVhOMY9arAaM_gMIdHLxgHH3cQSRsD.PXUjTAm7QReaKDauZAvsZxI
 5BWw0PL6u7suwIU3HnzHmtnJ84B8tgeYlheI0G9jlTUOQRp03yEiyWGX.ePmL0fbpEU4XblttCPT
 xnft6DcvS5t3tkhLnTvrU_50g7t3s96rzEmQA5ZFssGk.5cCC9FffoWHk304r4Z4hgl7HS_OGXGE
 TAwq5hInXNcww2jO4c7RhbbAfU4uvLim3jUC4tvT_kl7bPcmV5sHbjChmzSI5fp_f8Lim4aK3o10
 56kvI2kCecFOgbh53X49w6o7hBpZxzTJ2Ktdrz7TobRF6xaVFnoiDU3Gfw_NNtyI1EDToRvni2dj
 Ed1g5eYJqh8l4OlNU724Z0yOGdAnop3AuAWaS.a4i0nSOSf7ncXgjjzRaK2MtbgKa0n2s4KoTtTu
 PgpzFViWUTBZd.EJbl.Ox2XL7yuH2NDp5GoeegRyZkPtMZUWmkT7tdQfTUKIkjBuD_L46h1iYp8P
 mtPsR2Hrcsw.QUfplIaBKuMDs5LXc3szunmdLmmPJJsF8cQMHUnsijrg-
X-Sonic-MF: <nruslan_devel@yahoo.com>
X-Sonic-ID: 4024487e-69eb-4472-b1f7-48f9134591eb
Received: from sonic.gate.mail.ne1.yahoo.com by sonic322.consmr.mail.gq1.yahoo.com with HTTP; Sun, 29 Jun 2025 02:02:56 +0000
Date: Sun, 29 Jun 2025 01:52:46 +0000 (UTC)
From: Ruslan Nikolaev <nruslan_devel@yahoo.com>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Message-ID: <1736099513.528713.1751161966726@mail.yahoo.com>
Subject: Bug 220109 on HP 15z-fc000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1736099513.528713.1751161966726.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.24076 YMailNovation

Hi

I want to follow up regarding=C2=A0https://bugzilla.kernel.org/show_bug.cgi=
?id=3D220109

Is there any update regarding this? There has not been any update for 1.5 m=
onths. Is any other information needed from my side?

Thanks,
Ruslan
