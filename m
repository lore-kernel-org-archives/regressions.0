Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2C2471416
	for <regressions@lists.linux.dev>; Fri,  2 Oct 2026 18:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966651; cv=pass; b=DG50IF7RzL2465PLczmfbHbq5ebYEgq4it6Y8vCGas0I4eiSZHY/YIgBxlZQYPTMLHyzY8uTL/A/BOTumkAM95Zkmfe5VJqLvDk5bWrF/TTgw2IQDZviHHOD/SNVF02gTbplco5PcebTWvZoN7nvwl/GI8Z3CZbf34gn/X+hlz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966651; c=relaxed/simple;
	bh=uZkHDYTWWzJ9X5F+4Um7wb6CzaA/5jQIh7w7jPBSWI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZEAhRiE5xMFf55KuRWh700ApDyxSqHiL4N/30aVcE0XW0GggljQvb2vt+J7aCgs8Bw68uv0JeAAx4j9gCcomZej8fzfEv2NhjXbWf4wNFcW+W53rPB4gYpvn+AI+uHWjEnWO1ydy8pa29nW8/iAoBery916YwVtVwLOVOe6DqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtSL754p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dpen9h/E; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtSL754p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpen9h/E"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H69WU671113
	for <regressions@lists.linux.dev>; Fri, 2 Oct 2026 18:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=FQ08Xw8wztndrxT1uOejbuk9Ev7qAfsJYKeKbB6oswc=; b=Lt
	SL754pESNV29m2MosTwDEM4lQEE7sfWr0ssqW+SEAz3hgIRe9p1nG88sPKmvXw2K
	SQkyWumfGRpafbwwxqCDMst3fSlZG1kpHelJujTJIidpHpOt5149w12mUYO9hRz/
	FWJzrxsPSqyJQg+dvzhCI4IY3tz6nd0YmOYNUsEb1fP2Si80692TsxBREVPIznH7
	lWTyV+Kyc7q0kcV6wztMhspOFwEJsIG64asbozq+Wb5ye0+s+4d9lwTpqBbUt4oX
	wBjc77tIsTvMp5ny49II/EZwUKh6NH6xVc7j8Ot/1RGmNaivNrhossfeHGHaLCQw
	1RT6ynU7DMGBhgZSRTXA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxecmkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Fri, 02 Oct 2026 18:44:08 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-80621978fddso181160a34.2
        for <regressions@lists.linux.dev>; Fri, 02 Oct 2026 11:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790966648; cv=none;
        d=google.com; s=arc-20260327;
        b=ZZacMqke88wopVYdIbjvRkZnpnnLYECaDW6hsOyPbmLTcqMmtPmIvrR1yLV0ko/0pE
         Ie5UT+liVhrQgn/8O8lREAeZ7wBI9K91QhiLZTggg79QryamklkRAtorNtRVQpho1JJK
         7CMNXnSBVQpEUMrs1v4gM4xImUpT1A2OCq3wfzBWTu7S2u+TG+lH/UoswkQDSW4Qqm9k
         nNJ6sIm+OrVmXv08UXbGHCmU1ZqMWXCJWzxL8XwO3d0zv40NsNdHwCsK26RK5erdVL81
         6RHFMeW06ZjLeD/QLJMd/DCTy9xcPVpKy7sHRH07EwrzWMKO+y03HESBN8VtWDn8YccV
         9Exw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=FQ08Xw8wztndrxT1uOejbuk9Ev7qAfsJYKeKbB6oswc=;
        fh=9zh/YLXLnAhKyr9Cvhxdg/bW0Qp1MDJRc9kEDGLlbLg=;
        b=VtEqi8k3VvqpO7hxb43igj+Un7vdtcGcHMsCDHJJmEkerVZgDhT4bm7t2KJ0TxIPp+
         UxuLC5DVDRCbWQi6TCiMX0D9vPHNTEcodXoNz6lbnofvA8jloigL+oAN5k9QTCK1pcTW
         kZ3LK4Ea/DvC2gMAjcxEDIWKhW24Tne02d9j2Q4Qadg8H15zirCN8KP34oD3QLXAbD7t
         8N/ZmurQsGoL6LeRLA8KXrEeWScxPa+1cG8pZLOyCt96KrQVxDhILjg3iuKPi8C7VBb7
         4ZpIvbs2ay6rMz9/pXihRDlXUy1F5H04gzIXbYnvL0XtSXPHeR6iRUIQKVEZes+v/AW3
         HvnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790966648; x=1791571448; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FQ08Xw8wztndrxT1uOejbuk9Ev7qAfsJYKeKbB6oswc=;
        b=dpen9h/EhCMcXIXYWDySFF7EbiBS6RLcCpm0qfEvTfXw8JIyU/Q9lD7HE9XDi14c07
         UuAKFlWvwlRmS/TgE+ukuxXygpdEJ7Br0R4ehf6g4I4+DnyZKpiZlJw3NkhZGftkneOT
         /yvu8KaxVnSssuXF6lJtZjROXwLI1SkMwVHUJUbltwSMPChq3jN+6axX8zFvIuf+1yvp
         sa34Bq19FtiqTRn0NpmC3ubZz+9JBcQOQ8sb7YftkwyJsK7mNAyk3voGjP+cC+KGVLaa
         tSQ0iIDWaoAXnRZop76Jx1WQ6o4i1WTSSNHeuscF6WxtSjwmVwpXHx88ZVDDZsOi+J3/
         S1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790966648; x=1791571448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQ08Xw8wztndrxT1uOejbuk9Ev7qAfsJYKeKbB6oswc=;
        b=0itdqsHxDAZ88E0Lbfv3Nd7F9Z80YPX1fZxBF26TR9xUnIa5Nr9O+4Vmc2S72z7CqP
         o9IBAayvwyxd0ut2vYOEsEeZYJRQx3Kjz85NgNxigFzObcycAhO8tSZQt+WPYHTLobHt
         yasViMSMZNSZfrgsLDHz7mB3uLrKPfZXrFLKstXjeq1eFiQgk04feDJ0g0OMmwMkwwAe
         mLLClyXrz4ygC6VQ3pzOHYJcQhtPL0OiLtqZDDCQw3i0JJok8KKmx7Fs2sDCkpQyjMoa
         WPoKRByrgQm59LUjaEsax354WRqC9pwM7glaPAkc3ZdNJaiTLlGrvgYF94oGzg9G8xJu
         pp8w==
X-Forwarded-Encrypted: i=1; AKwUvBwXZcKzWw8OFz8iaZ54V1T+I3Zl6BNlH3KNUDQg8Njm6p4HZAta8Y9gzkW5QogCTjHTqH3coPRpuCUZ9A==@lists.linux.dev
X-Gm-Message-State: AFuF++lUvc3jM9njXkdx81U98AOMUF/k6aQ7NZ5o6cuu2sc+4TFLygjv
	fpZVLbKI7RXu9orA05+9m+QKs6pK/lksvuULlqOpaa6Y100/gW/J1RrKn7EBlgjnVAxhjZSWEVq
	Ox5JyMF1k1Hi8IpfwFUHAzgWY+7EIFfFgSNnQ5sPjkMMdwOR6i/Lk7nm21UEaXw3jLL6fnd/NLb
	ML6KI/c/EKfQ8VcRLv16Jat7mNxM0sBFVPszSCU1D0QOaYXMmA
X-Gm-Gg: AYBFou1LoItZZk1Tv/dLZuhLfTYCTuO149XK5ksIK8e2tZapMlcZyFQq1W+eabzCHPd
	lhDG3Wby6JpH3tdfts28leZWkc1QJ6Bbc3cKU0lTqinLHw9EBIjxxqsh27bVjd83RuSASqI9xq3
	f859+WLyfCNeJ9/dZ+tv6/wsBl4OuIG8htPNP00Dh/+anQA1NjWZmv3KfS
X-Received: by 2002:a05:6820:207:b0:6d8:d3d:de6a with SMTP id 006d021491bc7-6df35c3999dmr2503463eaf.73.1790966647923;
        Fri, 02 Oct 2026 11:44:07 -0700 (PDT)
X-Received: by 2002:a05:6820:207:b0:6d8:d3d:de6a with SMTP id
 006d021491bc7-6df35c3999dmr2503443eaf.73.1790966647508; Fri, 02 Oct 2026
 11:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACSVV00GwWvMFDR5QC7h8gonC-9qYbaG958nZHSxtUdWXGG_sg@mail.gmail.com>
 <179096555582.4050.16689195326008531646@gmail.com>
In-Reply-To: <179096555582.4050.16689195326008531646@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:43:56 -0700
X-Gm-Features: AclHuK_1A84ea1UaaxIckCd9ugOaiHEjc7V1vuwTcIvjWzRFw0FRu-Vm12FS3cA
Message-ID: <CACSVV01iV3g4uZ9WnVFuOMEiqdQcOudXXr39+5m8yE0XqC7X1A@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
To: Oleg Keri <okerixx@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abffb78 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=j9aERBNnXM6nCbgg6pwA:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: 3mZqY77oK_9-TQeDogDz7vdUMeXNsiPP
X-Proofpoint-ORIG-GUID: 3mZqY77oK_9-TQeDogDz7vdUMeXNsiPP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3NCBTYWx0ZWRfX01rpW7MeUEqe
 IGPwSNwNAOU7tPmNR/y7mPCbjU4sqapo26jPquza5y1D05SxhoKhLCHgIK2iMUlui4ZS1v5+jbS
 6Ra+/LovAFgt8HAtXDDrcVl3SLFtsYoeEROuw1Sysew4BwuC1jMxoEjt2Hll6IyNA0xcUVYo5nl
 zEKLb4X5iFYLHslQhl23YzSiV6Y91sBXlYtTRmQuIQ0qGVj8tqcK5zXIdB+RFK2tEYwvX1ZpRZa
 bXLmAU/3YA/Dlb5ut5boDcM9/leAzsvDURlMiOO9Of0yyu8rTEJCm1shsQAZSga4eGGOu8lhvHa
 eDLWG2n+fZuumRyUufy4K+tNi04iPNhP0KSTlOKRuWGKz+w2xCEYRNMYO9XuTS7Tz1JqA6b+0u5
 3vW4L9T8vUxWYvl+QdC5Zd1Bqyb3acXQg6v4PejNpqcjD6ctamdgzWMnQ1dHaeGlqXHNZ7AuX28
 q1PRLGOMVitqmYFIQdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3NCBTYWx0ZWRfX566Sac1jshYe
 sHmNNuLHlQSvpho4s8r6kpOCFsqapUkwJUKLwJu2NxtTwTZDOrxjyRdp+Yg730GnMDOfu8qegkb
 MuomTuat5dhGg9uYM3E3A4udh0qDhCg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020074

On Fri, Oct 2, 2026 at 11:29=E2=80=AFAM Oleg Keri <okerixx@gmail.com> wrote=
:
>
> On Fri, Oct 02, 2026, Rob Clark wrote:
> > Can you share `dmesg | grep drm`?  In my case the initrd is missing fw
> > so gpu is initialized later, I guess when the compositor starts.
>
> Here it is. The kernel is built without modules and with the firmware
> built in, so the GPU is brought up right at boot. The GMU firmware is
> gen80100_gmu.bin from linux-firmware (v5.2.38).
>
> [    0.620358] msm_dpu ae01000.display-controller: [drm] Using Transparen=
t Hugepage
> [    0.621120] [drm:dpu_kms_hw_init:1168] dpu hardware revision:0xc002000=
0
> [    0.625910] [drm] Initialized msm 1.13.0 for ae01000.display-controlle=
r on minor 0
> [    0.626015] msm_dpu ae01000.display-controller: [drm:adreno_request_fw=
] loaded qcom/gen80100_sqe.fw from new location
> [    0.626115] msm_dpu ae01000.display-controller: [drm:adreno_request_fw=
] loaded qcom/gen80100_gmu.bin from new location
> [    0.626994] [drm] Loaded GMU firmware v5.2.38
> [    1.632277] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt=
] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for r=
esponse
> [    1.642345] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeo=
ut waiting for GMU OOB set GPU_SET: 0x4
> [    1.642360] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] =
*ERROR* gpu hw init failed: -110
> [    1.652389] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeo=
ut waiting for GMU OOB set GPU_SET: 0x4
> [    1.652401] platform 3d6c000.gmu: [drm:a6xx_hfi_stop] *ERROR* HFI queu=
e 2 is not empty
> [    1.858322] msm_dpu ae01000.display-controller: [drm] fb0: msmdrmfb fr=
ame buffer device
> [    8.053367] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU fi=
rmware initialization timed out
> [    8.053584] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] =
*ERROR* Couldn't power up the GPU: -110
> [    8.187443] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU fi=
rmware initialization timed out
> [    8.187650] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] =
*ERROR* Couldn't power up the GPU: -110
>

Ok, now it would be interesting to compare the same from Bjorn's CRD
vs zenbook..

BR,
-R
