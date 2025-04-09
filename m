Received: from sonic322-10.consmr.mail.ne1.yahoo.com (sonic322-10.consmr.mail.ne1.yahoo.com [66.163.189.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15C72620CD
	for <regressions@lists.linux.dev>; Wed,  9 Apr 2025 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.189.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203410; cv=none; b=mcwPgIlF5/imTSVQ3/L9zxhPP5hWnYvLMfQj1wrzNEF+XKtjMwJVb4PHwTjxuj9wgyKh3QRV1tUsjn+zqP8i3qS11ppva79v5NolbtDXg4hHpcGi7I1DdIlKeQLv9C//1YP+Pfd9KnUqrKO5MtPGDmr4x0MkLf2BgPvldZcpINA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203410; c=relaxed/simple;
	bh=+tyY2xpct01frSB2whYuA0CVwm+TggIHXKtZYdtQ2WA=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=GMIcTY5b7LPuUIRvq7JhlXMNjh+RfeKAMHaX9XrLlz29vpDL61Djd2GWPmNQGhhxJyM4Yv+IiZoZa+8eaHsQvfFcqUlx23jFLLPntqoB0FIV+16rv9DCHAb8IsabPzixSuF/R2q2R1lT9JBXtR4VL50P94SRvS5iIV925N5qF30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=mwLXPWzj; arc=none smtp.client-ip=66.163.189.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="mwLXPWzj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1744203408; bh=+tyY2xpct01frSB2whYuA0CVwm+TggIHXKtZYdtQ2WA=; h=Date:From:Reply-To:To:Cc:Subject:References:From:Subject:Reply-To; b=mwLXPWzjJal+Ax6j0PshLr9biA4gBIm9bmqIOLmnNSe3rDXE9IF3jSBLrUVxvGCJIvJnOhzHqwu0QV22I+aXM9sNi+jSXEe/N7RyqiKyN8QCNxIGb7NTykufLo+EJscFaMdRZdktA2gmEcVDpsY67ZYKdgsxW7MbJvIaSzNtfjw6j9NUALUD+ipqeXb6h9nG9m6fKcYSDDslUG3zJXr64hEl5hezYSIxmuCkyPWVFB1gWBx6kTk2fneYQHtCJ9m9hIcgW/BNxinSwTw5jyw6bV8F7YPPtCJvbU9VZfXFCidXaCWp4yn8XiypS7TIsaRrM6ibdlGixI/rwokXT0XzFg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1744203408; bh=5jGujohiDACzC8131OV55sAM5InyoKMy9EBws21CaB9=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=fhSGH9NAtOcfkdY1yLjjw2jjtJxtyL8ulNa60d0P45tZgMuNRqcrIINnIM4VJ6z/wkF+OvF92ho4b93FueOSIAFgGcxOK9M8dud7Bw8QBDM8+nor+SRk1O6dOCuaLtzljdpR4KrU4oOn7vCKnMvA/gOVn4+I4HtpLiAZb3o3lgP8GDhQWp82W7wcJLEz1/UnTHHCnIb37epgIh3zb7h97pGWCHMEKrPwKk39r8La2bGbnm3qKrobLZOD36sayAqNySyqfRgGOhxn21g/lZk30CX32b24SLP0sEcglvuFO1cG6xvDHazO4TVr7OwsH0nXaV+hElBoZbgegNagF2Q6pw==
X-YMail-OSG: 2CO2BVEVM1kHdr60QYXFyg5JcsRdDuD04yxldKWApyMEZxBykdPJBSLaVst07Qh
 DIsFNaL9Sup8HiNrhKvZBf8hnXqERj6TFQnLVay0rEq.V_3_ziqPxSPmE_swk.tq2TYjwOk7gALt
 gJ_BoJqy7airnckjY5tp5m.gnqFJopF3hQ6OzIBwCtcetD5BIAqv07itdJUo_cvBHQpin_IMPBSp
 3Ku9RQn9uYv_GTdDC8Xl9IM5rJxWIrn9_8kBFcx_1XH6_C9gQQq9ZVdaR5aNGkJ9O__Y70fDL.Sj
 6MA5sPSB6jhJwxqLXbm1Bfw_emat3CsBwJnNrwYAbOdY6jlBNv.qfcHAOyAsAyL5DrsKfvfXitch
 Bfanace3dnVc0n6j69R1eyPVxsX2Zhmt5tkTMCHgcwi8ZT45JEfh8CS5iznV0PO72iJP62ZW.kkg
 50vPvfi8w_Ye7EGCE635UF9D6IGoInG7YtHvH3JTxYWmrXom9JpQXfQYQ0J.Rdi9AtVIa9I4gdfS
 Ad3sp_ty_8qbPfWqp0S2a2LW_1Zz9_X_C9.7vLtdkn0hP7LG4PjApv6BLcl5T5xQn2TGzFiRKl_v
 rPcsqMwjLP.5VBPtkvAnITtH4yRxo6hHGzOhdS7xsgueA8EVVITSzMb2clATvwY7Tz95..VkeDZg
 T8hcdFTGILuA6oUFzJr4np1lkynnb3b1iH2A7YSu6BpS856PFdNW4pcbuIylRerlYF681hqV9VkU
 YTGahyJTH83Y0X1FGet.auE16qu.MJtUCk0rNIeQ..O8GZikghj1DY6030thC_dzC.hbSqc8YiWz
 axDNXaej6hUawB5YdCMvgK.6Xq4d8mk4wI2DrbMeUY5E.zD9sK8g5MIH5nYX5u_PRveUaueOrnxV
 toaghDMt_pjageWiDqniazyEBwGZ3PrWTsxuJ3hxIqh_9sEoZFaVDAC42lQaBZuCglu3C1dPT.Vj
 YFS02.dRMOhcllzlIxH3.g.bws8Rza0hGkQy00X63uWf3wwxVdcJcjzv47EPCo8eYfoSDZr5iPfP
 YN5_eilkEjh2ef42_l1YR0y6kPFF9W52ISlCub4bL9DVMyGW.THBiI8KzeICsNZkqfu7A5V3aksu
 FMzhpOLWR3Sms5KBaBfvXPykyDbN2ikKQW6mJbvUPcYDRJFA5co1NWd2W1K08JtpsdU.zwm3PNYk
 oGrg5V7j7Cia0KNYLIqNGaoe6YXNxBXlmGxSuwCsCj_nCrcuCV09kfB89YoBJarVIPTjXSGunDJY
 PH1HwK0LtNosFZ.j.dukOPIkfNddZgDRbFnwZ4mMqObxm3YeRazNpoEk4ao0UX1EJheRNpgrQhDy
 zMJ8btrMLEcTJN_.FJz9pe6qvIEztECYNYhj3oa1odHrWlTxcVG.RyHfubmyXS4_KOgmU4Eboe1e
 WAd9Ri_HEvwQWLJTleUKDmibNC1XIXm1iPklE18HLoTm5r_qpwsGBItJaw1ofkJzGf_CgXM9bP1D
 zh6qD.paaKOpNKdZ41cDIodiZJWJF7Gxzcz9f6MdjpRWIRTivn71TORsKIKVy04zEbDML5N3WdKW
 OwUQadHb.Ef7sx.GQc6WxNOoR.XFe.fSGW0MfubzRoa7uaFWIRNr5aMjVSnSNuVwtrTK_2khIE.b
 fmvDuFU10UejHZRS8XfYeKuAdgG84VAocAyL6Om0UaVL5RoLOkP1dy7sJdIN.xg.ZRCS20ao0p10
 4J3BZ152LQTGm49DYjRGKid2o7fpxTFgStUfXmctUfbcyEr.MzbBLQ7Rcr8boELYWv8EqHWF3PD7
 qgn9eOM08dbOTU4Unus5IMFPVq8cI34glLqOcs0IU_cA0g3jhtHmwA8H84ShMd3mrRGLx30zy6BN
 tBjwYTN2i8bXObNkzZKberg3._hosKwRAJM997mfh98_KgEX3Ugft3AXyPrqFjfZjk91zs6wkj8N
 XFmKjnrLXQ7G3VBtVKBpNXCDU_64LG6Y2FesdxPArXhnl1NDTIqT_.6lIGPVuIhpDnnrwUzxN9Nt
 MEJB3N8xOsCtfDHROQnDzUAH6zQU9phYO3K0JrUTysqC.F6T_xTJUw212EZOuQrU63KovVJg4Ylp
 JZhmKJ4vODvSrdhV1L_e2fYroKaMCXydYeRWhex2jZDUMIezRBReUPYQE4sxKd9RFwr5eX03ZHFW
 05owpIgZKoKjqnv2B0BEenIoN5zQ3YI3Shrebd3vCYo3zhTD9GZRpDkgsa5zy_vfrZs6xCK9_8zw
 LiWWET6okeW7uFA--
X-Sonic-MF: <emoriel17@yahoo.com>
X-Sonic-ID: 2c26ceee-0ed4-4d8d-af48-99e0e69b17ed
Received: from sonic.gate.mail.ne1.yahoo.com by sonic322.consmr.mail.ne1.yahoo.com with HTTP; Wed, 9 Apr 2025 12:56:48 +0000
Date: Wed, 9 Apr 2025 12:36:33 +0000 (UTC)
From: moriel5 <emoriel17@yahoo.com>
Reply-To: moriel5 <emoriel17@yahoo.com>
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Message-ID: <1381955918.3482992.1744202193648@mail.yahoo.com>
Subject:  Broken S3 on Asus Z97 Pro Gamer
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1381955918.3482992.1744202193648.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.23590 YMailNorrin

Good day/night to everyone.
I am sorry about the duplicate post, I had missed that I was also supposed =
to CC the regressions list.

I have had S3 sleep broken for well over half a year at this point where th=
e kernel simply crashes upon entering sleep, and the PC turns off (literall=
y stops pulling power from the power supply), and turning it on, at first, =
causes to to run through 1 on/off cycle, with I believe is a diagnostic ste=
p on this board, as it happens whenever something causes the PC to unexpect=
edly turn off (unless the source is external, like a blackout, in which cas=
e once power is restored and I turn on the PC, it turns on normally).



At first I thought that it might be an AMDGPU issue, however removing my dG=
PU, and also, the rest of my hardware, changed nothing.

However I have had at one point had asus-wmi try to put the system into S0i=
x, despite the firmware lacking support for S0ix, and now FastFetch no long=
er prints out my motherboards model number on the Host line, instead just s=
howing ASUS MB, so I have reason to suspect that asus-wmi may be the culpri=
t for this regression.



Unfortunately, I am unable to procure logs, since the kernel crashes before=
 anything meaningful is logged.



I know that this is not a hardware issue, since on Windows and older live-i=
mages (Solus is my distribution of choice) these issues do not exist.



I am unsure as to which kernel update broke S3 for me, however I believe it=
 was either late in the 6.10.x cycle or the 6.11.x cycle, since the Solus 4=
.6 live-image has no such issues on 6.10.13, which was also our last 6.10.x=
 kernel update, and I only started experienced it when we updated to 6.11.5=
, our first update to 6.11.x, and updating to 6.12.x did not fix anything. =
The current Solus 4.7 live-image has 6.12.9, and my installed system is cur=
rently on 6.12.21.



Hardware:

Motherboard: Asus Z97 Pro Gamer

CPU: i5-4570

dGPU: Sapphire Radeon 540 4GB

RAM: 2x Crucial 8GB DDR3L@1600MT/s, 1x Crucial 4GB DDR3L@1600MT/s

Storage: 500GB Western Digital WD5000AAKX SATA3 7200RPM HDD

DVD Drive: Lite-On DH16ABSH

Add-in cards: Intel 3168 PCIe+USB (by means of a simple adapter) VIA VT6315=
 Firewire 400 PCIe, MosChip MCS9865 Parallel PCI (over integrated ASMedia A=
SM1083/1085 PCIe to PCI bridge)

PSU: Seasonix SS-860XP=C2=B2 860W
