Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561753;
	b=iTKrXG/ZxeLUL42bAU2Zdr3o2HAwe5KFOnT7RAk3qlhvRtyi+masLoh9lt+G+HxKOwGS
	 Tu6921SNU6zRoQXlXoZzD+7kL3qt71PI3coqRgvvEl7jWFy//R3c3h0iEa1Jgdlpvv0k4
	 bLsJQSpq0mmtce6kJQvMuw7nZ4qWWfYpxUIUu/C22cSKruzZW94VtlFAr7zOZNxCighUq
	 2Aw5lzq2852zeSakEalnHWgRbLZml6XwTklqFMgffN7sVt/ePc5GYHVbaC17oJQctQy1K
	 b8b/CwPoE+AIMxJD9uZUA/WE6MLRhQl1dTKLmV0LJ+KCnE+Q0OEy5VbUk7dwRrZJk7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561753;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eZlxAyBevgnOZgMWqXb33BV1biF+L6ci4PbJk2Ledrw=;
	b=ctS/zzrJKjw4SGidCco4QyZSePGAByPfIzXnFs1tJze6e7LbbChXGhf7njkpAYc8F7CO
	 BtwT2OGT7Wp6SCd51CFPcp2/TJF70vwcvpXtUtEC76WgDr/L3PYhJOTXglJrOcA7KRXMk
	 bDqA58CVyrfRoM9YhYOskfys+skYPQYCXCg2/DZo9c+87M5tYdbZ6iglUBpLDfPri8IVg
	 pNozAVV7D6UfvX0G+U8Pvc8vcChpjGZnK3gggmu4B1OBmOmUPOCW3oo231f1YSlLpaV02
	 jDrl1NYA44s2h00IzkM5HxTBTXZroj1w5QbWYSytJTEpN/hZSHNjwZ+ddYsJVIOLZPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WFKeXP7h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXdrxCrg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1FA606A319
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 05:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF1FA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WFKeXP7h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXdrxCrg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0uC756348
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 05:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eZlxAyBevgnOZgMWqXb33BV1biF+L6ci4PbJk2Ledrw=; b=WFKeXP7hTU7Qcmnx
	vSn8aoIPInIUlpFHSb6EP5or3x5IU8slSvFDU76IPfKvtA9t+VYSMTaPmc0kg123
	ruD23M9fCx01FhJ7RErYE+ij5FRr/z3GmoXZONnmGO1KfR5F+wop00b2PsyAHvSV
	4zkVK+DawGwjCJECk5+k5RjvQsdGrVO85IfhA2y0cgV0wr3GFEeGLDhBuy1eK5wY
	nx6na3l0gjNrEUgcF4JGihLMBFQSF2F5G4FO1bPcavA7JJqO8hok+p9M4fUuWb9J
	ERn9LSxq3EdKBbbXLaAg50sV4BZB3bFcVgcVMiUUFaO3xeSGHsZlmKRpupCjyXNs
	ksEiTg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4t5ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 05:49:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0589ff620so268861b3a.1
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 22:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792561751; x=1793166551; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZlxAyBevgnOZgMWqXb33BV1biF+L6ci4PbJk2Ledrw=;
        b=EXdrxCrgSJMuoRMTyU/J9nYcKM/Szg3vu3lNRzVdyVDnzYux23qm3Hw3n+tl+96Mda
         jEqeSsroeshk74z52Mw9nw5DvuAmi6qvB0pJR/iHrxCPKuQeJSFDDGucdQ1bP9LtGWDg
         UxtCpEWtmhyWDdgC/Iytk68Hgb0U1QV7u/C2e+buab6bUHsDfBQC7+ftnRSSk+HaCOgF
         VX2ZOa9S1SDRxZG8ZUaE2lI9aFuSudA0tQ7SNPM4UHxJgHbiBZhphL+/DA0g9DMAARBl
         zQYClyQ5W5Ld9nX8ftzdi2Jc0EdW9tCoXUeKXn3NP43z+Xv9kmuE9ptuk+rWiaBx6B4q
         sdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792561751; x=1793166551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZlxAyBevgnOZgMWqXb33BV1biF+L6ci4PbJk2Ledrw=;
        b=O7Eugu8CB0RfkfgKKCIVmPgsXLnU25+euwwUVnyO8dJuEAMO/K/gNM4fD43JSXWRtQ
         ozsIiuX/X6w+SJCSc3trxb4BT2UaFqK2nHZFJMDOESFLSjXKTw7WS9wvI/MVj1rer8bc
         v9m4d8wFf142vW0JjmfUevoBfH6ddbdJGnaHvV1cXekf/kAYBUhxJO9gT2a5Gu2ayMT2
         msmAhHPreyYZ/f/mpQ6KEXlIS6WKthw0ouXXJ2tMF1SJjuIgtqLwwLanLd4KJQCx19nZ
         aOUA1ZMNagMMurFuMhdR6QSUKT4sky7MJb87eT3ZAfqaSh9+REQ5L4HEaHW9hcGCBHuV
         hySw==
X-Forwarded-Encrypted: i=1; AKwUvBzU8KPyUc6sGqz9f+SZIgYidQcc73ev7Ud3Rxc7HlsAVrjcuuZLB+r3bNsVyy5cwrHDghcqWfljPRXn5g==@lists.linux.dev
X-Gm-Message-State: AFq9FYIAi2Yifvb+0d7SM4UxmIaHUaQ/0PMf3HlRBX7/tK3PHuu5voUd
	EuOCBe4we81gARrSM7BUxO0rI/qnsl4EeYlmaHeXHMdvVmvifEcl4fvjPXP3klYnl3vxmEOLDXX
	6JU+6GfSuF3L/eeWfT+SoR+yxzzC/QF9lBY5IaO38zILpD882w4xU9qJlnTVMe5C+Qw==
X-Gm-Gg: AYBFou1GjelegYeG7C7pyncw9IpwTngMwq6eoA9p+SDKmuo2SGDphbhrb+9Cb16atW4
	TVwd1qI89FtXsuB8lsSmogkbNtr+iSojvYJUDRCi9v/ci9JXfxrs4eTl97ZIkVIC0QD1PfiCPtZ
	W76+D6t8jn5hdwOWbO/iv3GvQp5SxFqZ+r7ArfiD0W3K34F61BDttkbH1Z8f50vpj9uywC2aYsz
	MaCbUuskQxglKhAJFezjsMm6zkEwnJguPcYSEO0N/nVK388DGjaKUK4LNB8JuxK7wG20UTGBF5P
	vmYDpqhqlAfCMb+ojJ8fNNdLFQIhpbYkMLzYvkrZQpuH8sHLYSiIvTgxY53B4dmjKfIc+e1Pmy5
	yp/qcAS0h2DTg+ENjj5UqzpzK
X-Received: by 2002:a05:6a00:4287:b0:89d:a947:9d58 with SMTP id d2e1a72fcca58-8a089e3fa8dmr773638b3a.25.1792561751059;
        Tue, 20 Oct 2026 22:49:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4287:b0:89d:a947:9d58 with SMTP id d2e1a72fcca58-8a089e3fa8dmr773611b3a.25.1792561750583;
        Tue, 20 Oct 2026 22:49:10 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.228.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49c6sm415288b3a.17.2026.10.20.22.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 22:49:09 -0700 (PDT)
Message-ID: <e4e2b8d6-46e7-4f59-994e-39f3d09d334d@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:19:01 +0530
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
To: Oleg Keri <okerixx@gmail.com>, Rob Clark <rob.clark@oss.qualcomm.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
References: <CACSVV00x091i7BKW+bj0RUnkd4rOrHXbhZ4zF6SuTU1NAqsFTA@mail.gmail.com>
 <179248663855.32151.9955864156939592299@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <179248663855.32151.9955864156939592299@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jYsBwGL0VNTs0eo-K12q6Ti_fgpWE1ie
X-Proofpoint-GUID: jYsBwGL0VNTs0eo-K12q6Ti_fgpWE1ie
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfX9htqpM4dc5+z
 b6Nk24GPl/0CNlFh+I1h5zMk9pZZUJ+kt7jnbxx6v5EG+j1WTPt5cOKb93vE+OMHDwIaY9YMPVt
 R+hygzj4wATO+xCqrF5g1Vy19TbGtRA=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad85257 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ipsIN8yD8anPosRfiFfp5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=cjh-xzagbiWEAgRDvXgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyMiBTYWx0ZWRfXxXLOYdkH3O67
 3dFYspdCSmVx/ClVuSiwPTGNCHVE+tbKYs6YIwOrSY74iDUhZk0CyPLnv3CD2IjqAgZwrc6szCZ
 bxfvhzPWm7ie1JNDCRCfCA3CQRtfVDBAOaHM1gmv3JhMTyj9lsBL7X154puQH1xiwVcCNosFTGI
 yADDmwF530cQxnR6eZSohvOPQjAInCctc+bHkANDac//FeCscmHzLPRzaXlOLjFuExCBDiLYYAW
 iiwQwzTd5Q7dRVcF47Mr+aOUy9r+jC5bEbAKNdyd0xHm6imu5CIm/mfNp6hME+91dxAuu87BR48
 tPLgUApNSni+jpTQcK+PqVNsuld1smfdNFs06gYcY0hYvmCMs6l+epvP+B18CYyBMXN/DAqGmy2
 zNvOWq+xdONLeRBkEqhxV7aMeccKd8OtErB/ODmmveiXpbCL8b2csN5tn/eMCKQUKTB4EhPa6ZJ
 8LFVlQ7cO4Gbcs77OgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210022



On 10/20/2026 2:27 PM, Oleg Keri wrote:
> I guess this should be investigated further. Yoga Slim 7x Gen 11, no modules,
> firmware built in, so the GMU comes up at 0.6 s.
> 
> It's rpmhpd. Before its sync_state, rpmhpd_aggregate_corner() pushes every
> vote to the highest corner. The gxclkctl probe does a runtime resume/suspend
> of its GFX and GMXC domains at 0.18 s (qcom_cc_probe -> pm_runtime -> genpd
> -> rpmhpd_power_on), and from that point both rails are stuck at max until
> rpmhpd syncs, which is at 2.8 s here. The GMU then does its CLX DCVS
> calibration on a rail that won't move.
> 
> The GMU log buffer (fw v5.2.38) agrees: the calibration trace of the bad
> boot matches the first good one step for step up to the ninth level. There
> it stops, and the firmware puts HFI_F2H_MSG_ERROR 0x007306c7
> "ResMgrCalibrateDcvsLvl" on the debug queue. The GX_BW_PERF_VOTE timeout is
> simply the next message we send.
> 
> With gfx and gmxc taken out of the clamp (hack below) the first GPU init at
> 0.6 s just works, CLX tables included. Three boots so far.
> 
> The wedged GMU after a failed attempt is a different story. Retries after
> rpmhpd's sync_state still die with "GMU firmware initialization timed out"
> until gpucc's sync_state (fw_devlink timeout, 13 s) collapses CX. That's
> what the gpu_cc_cx_gdsc/NO_STAY_ON thing in my earlier mail was about: the
> recovery, not the cause.
> 
> The RSC side is not it. On A8xx the GMU firmware loads the RSC sequencer
> code and TCS slots on its own; preloading them before the first boot made
> no difference.
> 
> Abel's CRD failing even with msm loaded at 90 s doesn't match this, unless
> something keeps gfx.lvl high on the CRD after sync_state. Could be a second
> problem.
> 
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -1009,7 +1009,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
> -	if (pd->state_synced) {
> +	if (pd->state_synced || pd == &gfx || pd == &gmxc) {
>  		to_active_sleep(pd, corner, &this_active_corner, &this_sleep_corner);
>  	} else {
>  		/* Clamp to highest corner if sync_state hasn't happened */
> 

Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Could you please send this out as a fix for v7.4? I will respin the gmu driver series and revert this
bit there. But that would be v7.5 stuff.

-Akhil.

> Oleg

