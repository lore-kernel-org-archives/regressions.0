Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792425226;
	b=mnwsL/YVoqQEO96FqHq7OF1Z7xIWJBm+qowdBwUDWhdZmj1xijwjFzv0gHeZ9hxeLFyj
	 l1k1GtcCTWiuTV0JmSEaSou2EpBICmPjQzRVztZsY0RKFY8pWgfChHXi3rZqbKJmVJEuS
	 YvM/FgLyNqdiUlWSa39xpKq6RJfpVvNsD/alJJ7sU6ycSki0Klg0czsUVRsBkFOV0z+Qz
	 An/fIRutAfOgCEZWyinnWatAt+xFQU+Wb+xYOYChXkq1b3ZsP10hb+vH3xOdUhEH18q1K
	 AXFKfaLDi+hIIwY9d3cVlPnoWR8FOzkOYaJ2wZJrHkFA0dOySDNI3l4F8Mz7FgOuidA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792425226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=;
	b=cF5e/NoBGZQNveSbGN1JcV6DJq+WWbHGPQpw8SQ+FR2ed6qAAM3PJsl/1RuAEdUe30Zz
	 TL2C69rvzsGA/mOrrveESARmhfOl2BsKgULOuKA0yDk0KrUd8XwFT6+QJpa+Z1VK04QAm
	 mXNrnQ0zWHKVcffhXgrU1YvIkcr6tLNOeRGGcl1INAnJwtvCT1xvQ97oKLZNLSowT/Sa/
	 pa0dkJndJtbw8cE3SvsImqQHgDhm4S5R8JbEHT8Q0iYl+/UsuwlUIQvUgT9AobnFq/tUo
	 85zo4YGqgw4BEGihi22jtYeI5QN5G2nTbNW7BGZa40qwhl05m0NHx2exBiRAKkt17dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rd412vdY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cHBRrRWX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2C9606A323
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 15:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A2C9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rd412vdY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cHBRrRWX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFPGsq2589775
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 15:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=; b=Rd
	412vdYZ6pr+FIF/LqCVeE65wVB2AaKvNCcSUOW3Ygrv2XQ1O8BxNWia0WShOYeFg
	TH5bNmIi5IQe4w/0dWJoYBxI/cnkulrBv3h/HX+thbMY+N1VEEG5tiZ2FeQF1/Rg
	6WJ8nvgBbbetfszsB9KU8lqRAw7RBWjt1ASWAsJGENN3xSqwLjTa5bb6buJA8Tgk
	EmRY2GXxOsaAUjiQp/dFxxBIzcm/IdIxcPh8K7wnAbQCl9kOIXEeT9GA7ckii7i1
	PFuHmlJi7x1qUOiGInfJQzoy0uRP5ovpfqJEpFor3F3LP8AHWXilAeTSowP0M8FW
	FIlrgi2j/xaJ7bNJUT7Q==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n217d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 15:53:35 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4a72bcd6599so2495556fac.0
        for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 08:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792425214; cv=none;
        d=google.com; s=arc-20260327;
        b=BHrKqBvQ2vM455MxvEXauZ19OKuugYPqdCMG46nB+3PNbz0oo96zIu34dOL0hHgph5
         31Eru0qdn0Lct0PCygR33pKnkO9NLpcBbmLp7XTMnfImrLbb3tKg6UEp60DDqXXkyOR/
         n6gZe3ZfCqpnxCe1Nv+kgIWDmSHdwq+SXSyypl7BQ2yHnLvd9aWIfilnvIsjnA53l1CG
         2pFOlRDXQ3WRR0XDIdpXvYWKKphTtf3CiFAfZfd24ZCTIkgRT9QM6dmF2N2NwZ1M2cJ0
         z39GonVTJJ/s8hJBKcUV1c+XJhnvD2ktdZiNm0USORHl82czjsmb7ItMBYhrWXEcvEIb
         oHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=;
        fh=QpwRig2ilav8HLO5ORlDQUQdTV6/fZgayGmFPvU62O0=;
        b=iNM7ED3dQavQyuxBU9cfBaZ4ko5OQt2IBHD09GidcihBok3RLul+h7ZTaLh0cdu7la
         ri8lQyagJT8qwnoh7AYsb2Pv0tasKWvxJoWhVT60wMXg59qm2Kcw76QlsSRO74+OGlux
         DAnZ7Kt5D0Re2LIK/+qqEL9lfiG9tOg9OswIGzmQE3tvMB8/Yc7ShEnR+FF3eODswRsu
         sagGVdG8PMjFEp+UiX3PDNL6bebhlz9d3csrSaFAdgbVWf8m3LxeQY33at2QqP0lq0G0
         XtlFldt5T36Py6NK8BeEXZyDQlRDUb5x6NNTgdHDeUWHNxIsQ+8qjpSGqPJCZ1olRoJa
         LMFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792425214; x=1793030014; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=;
        b=cHBRrRWXG08VHAsalgwykyFbgQcjuEfVIxFrxW80BLMxk//IVzplC6v69Ivow+pxs3
         QDX+mBE4LF7DUoRfBZ6uhmH8pk2XRV5n+Z2R/o0EwGNFBoUrXpbcLiHqGgCl/CxH/HXj
         eS+t0AeJyantZvChdZzRGpjeA104L3DLIsBIYbRmxYr83nnEJ95QqyIK2R9fFdtCH3Lx
         limJxBq0ofRp67skStfyXg5BMF5DPh0/Wq+YFcN2HezxqXeuNG3viZB6SnmpoTVejkDP
         pm72frWCTvc1dKv1uknkrcoI7Rd59S2mgjwXC3DWWewV4ozJyNWsW5Ul3nu3ShvCnS+E
         q/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792425214; x=1793030014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkXGpXOWiBs24ppXgXlnDUbNGC4cGBni/AXZNpiz1hc=;
        b=kNuB7c957RGFfpkw2X8/ADDpzNn65k2zKE03tALAnx11l3O+ONa+nh97ip5XXSb/T/
         Z2N2hea6jyA/GbdBlswK8iytYHz49tjQcaRopmNJlP2KbubtX1vjP7Kl6w66bmDpWiJK
         ZcKqGiP5SASEme5AbqYmv5vHmB6JOn3UnEZF6XCfv7/rQuRmXgD4/FpHA5JSmtNDWl4V
         mFd3Z1N2vz8QBn2Q8wjIkHiYYXEnx43V9WwnYARs/NhG4511UwojXRjzGiz9Derif67o
         DFgvwKiok0lqVDV0EOBHjATl4El7d1jssqm6qruqKR0EIAhIBvq1JAZtjjKiUAbvAIxo
         ZNvA==
X-Forwarded-Encrypted: i=1; AKwUvByxcNZgT/WphxQzDk/vZdwPGgA364OJI5VBHMbdPxE6wSL6z2+5StUjIR5T4+VUhzwzdGhFizgSiv/RkQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKsVVelqQU6qb8wFl9z0rSKO0E/i692+P+I8fcJnsM6xr/Bgk25
	ISw+dQMAC+llmDZQq6d6xiKN95dKjQtEESRJSacK6vSpyBzo+dh3WD82WPk3EmxZeny9ViZBPwX
	opWYNLszRIZJmpj4yV7ALf02tgdmyHzwmq4wzXQcVsO7//Tz5QeyJj2cjZT3XUZLiO50Z8AcHl4
	GjSVUI0R8Jj00EWW7efYtthrlUsMTgE3lFm3Rn+fiY
X-Gm-Gg: AYBFou18itXQPPkL18gTljTyJr2ivssdLpmnZjdmUkaayBE5tepuEV2dxZFyD17D1m9
	orgS1VzoHJypGzSEhPVWmwfoqJdOxU66UanYam1Fhjd9WBZAKcU5kJr7C1ravZfffm6g1GQ/btE
	Lt8WxwkpubBn/qUdWG6M+m05DBG53uJtM+qk7dXuwKGB37kkw6JcqbgGd6GA==
X-Received: by 2002:a05:6871:2ea5:b0:492:d8bd:949d with SMTP id 586e51a60fabf-4a7575b6d76mr5836604fac.2.1792425214145;
        Mon, 19 Oct 2026 08:53:34 -0700 (PDT)
X-Received: by 2002:a05:6871:2ea5:b0:492:d8bd:949d with SMTP id
 586e51a60fabf-4a7575b6d76mr5836575fac.2.1792425213472; Mon, 19 Oct 2026
 08:53:33 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <ar_AuRr1eaZzOfw9@baldur> <179096320161.1973.2852858792260211089@gmail.com>
 <c3c4d140-07ec-4402-a18b-389520df188e@leemhuis.info>
In-Reply-To: <c3c4d140-07ec-4402-a18b-389520df188e@leemhuis.info>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 08:53:21 -0700
X-Gm-Features: AclHuK8lwhBc9o-AjMwe7IooeXr_cgpIgGqUVsN4bF6VjxH_2L_fx0Hz7Wqdu8M
Message-ID: <CACSVV00x091i7BKW+bj0RUnkd4rOrHXbhZ4zF6SuTU1NAqsFTA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Oleg Keri <okerixx@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2MyBTYWx0ZWRfXy279wcgWJ4Q9
 iO0OIxLORh5CWGeI0vSIBvUfhdxVIqt3ZkOKmSXxdp6/X7wchMrL0AsOzUgM6BshGKpAnBdH5A/
 LWzAzDVGfTWwVaNn9W+wZjS4QgfgPPw=
X-Proofpoint-ORIG-GUID: IdAODqs_gnLQWM37v7-fBw0GQTstFwzh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2MyBTYWx0ZWRfX1qQkraedFf/G
 BBB9a2wZoMOjL/QK4sKiIXtuv+D666W42H3PE7Z3Yo7VRYaWRHRyBhnnsQQ141VFOlYW99H4+K0
 kZOsJmEdinf1seV+DZMFIIHPjLlizWJTZgeIeZPt4dfRXtbZVZPl4LPhwY+V71EHKVhrAOrTHj2
 ryN94vzANHtmw3qLZNy1AZ7f4Ywi+wf7KdJQrJeRiRN8J2rMuxrRPbNVCrlp+LFEETKPPn0rIpy
 oqLfh+SNaUx2JyIQKn4aYuhOIPPfmnlTzMDXoqMKaEt9KPhgiTIaqKWI4laOaY/YMEaHV/Bp+Xh
 CHCzd/ML5yoNCYqScsoeETYUOCWaZ5ktO+pCVbXd4hQjWaA1BBzkPXOqmWhydZ54QrYhhZTDR0x
 2pbeWQCHTR/utO9nZBSR1v4zpi+UuLfQ07iTqPSf4QGTLeUd/EAV/zzEAetd3YK5Tk+XKw5wQrQ
 CV/+KScA7qwMw+es8BQ==
X-Proofpoint-GUID: IdAODqs_gnLQWM37v7-fBw0GQTstFwzh
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad63cff cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=lAgNKBcoAAAA:8 a=7w3WoVYdraEV06504AMA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22 a=drE6d5tx1tjNRBs8zHOc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190063

On Mon, Oct 19, 2026 at 6:47=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 10/2/26 19:47, Oleg Keri wrote:
> >> This patch landed in next-20261001 and while it works on my Glymur CRD
> >> (COB), on the Asus Zenbook A14 I see the following failure during boot=
:
> >
> > Same on a Lenovo Yoga Slim 7x Gen 11 (Glymur) with next-20261001, GMU
> > firmware v5.2.38:
> >
> > [    1.632277] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interru=
pt] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for=
 response
> > [    1.642345] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Tim=
eout waiting for GMU OOB set GPU_SET: 0x4
> > [    1.642360] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu=
] *ERROR* gpu hw init failed: -110
> > [    8.053367] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU =
firmware initialization timed out
> > [    8.053584] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu=
] *ERROR* Couldn't power up the GPU: -110
> >
> > Compositor fails on the first start and works on the second.
> >
> > Reverting this patch fixes it here as well.
> What's the status here? Was this fixed meanwhile? Or is this regression
> how heading towards mainline now that the merge window is open?

AFAIU this is still open.. but seems to be contained to a non-typical
config (modules + fw built-in).  It seems to be caused by trying to
initialize the GPU (and send the CLX tables to the GMU) before
_something_ else is ready.  Tracking down what that _something_ is is
still ongoing.

OTOH not having CLX could lead to problems exceeding hw current
limits, which itself is a problem.  And why I did not revert CLX.

BR,
-R
