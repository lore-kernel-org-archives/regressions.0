Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC9A3A6B66
	for <regressions@lists.linux.dev>; Fri,  2 Oct 2026 18:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790964749; cv=pass; b=Hy+1dH1OVWtU27RMfDi0jvzxKNpYxyBGfj1el9WpRcpeRnofd3Ll6LchEo3XK0K9FZREra7C/bKXyhoAtEVNw4ihHH8yPdaFKTubo8pr/savF2zU4c94wK5lfOzjo8ctMR44JIcNVTp5OJ64oXA50mQ08Bg34SzDiKWD/PZQt8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790964749; c=relaxed/simple;
	bh=olqnuNuLfhNSbTMlRj084yoEjd7JnAYtZyXcGN1R2bA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKDOjkUWESxH7DJeu+Sk47Fo1wLDdQtzRIh8Ujo+15kK4cqWuGCPIjjqA0tBNRni4dZ84a9uMHP57qMvgP8vDTiP2V2mLqcPSGgXJWrppLcYm5Kf7NfevpouXBVGBShQl5vCSbpGIB6/SXAvg+UyykGJGaZPHx7h6mN1FKwNWYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrVDpYW4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kq1UmoAf; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrVDpYW4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kq1UmoAf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H66Ub1130370
	for <regressions@lists.linux.dev>; Fri, 2 Oct 2026 18:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=4CSRn9tEcJU8kiGoAhArcrJMiSynVhSMb0NK4Ngxt90=; b=Xr
	VDpYW4tG2obycAgp20TaucD8Vlyh2tE2ttwyxMbJfYFbQ3bj76r85LAnMm9+ONuc
	aIWOb7wmSr0krUoM2GvgQbwoclukaXijDnpdIje7jub9D8U7XJdtqAFarz5wCoSi
	EHpeNM6FgfcdOcX4KY2s+4qNoVtEbkT329pF4/6ZYBt4YNEGJ6lJpHWZp7lv7KTg
	ozklH6x0iRTsC4TQn+TBExdaqjUd9MRUUz2gJRH2Fd2q5b3fBLK9Y4MJEGfqg98b
	zHdL9oNCTt63yJUIfmj6Q2pU7ppqfdnvRHFd48KptMxSrtsKkZ7cc/w1QKeiNv3Z
	g1Ssx6fHfgHFEvM+V7kg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v034u2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Fri, 02 Oct 2026 18:12:25 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46a5954cdfcso209018fac.3
        for <regressions@lists.linux.dev>; Fri, 02 Oct 2026 11:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790964744; cv=none;
        d=google.com; s=arc-20260327;
        b=LiZ6PdSc9C6Ygg3GDnomsTawQhe5tFRmGMptH1Abgmv/xCBTQtAPGAHHRbPDeRI8gE
         bZiNFHe3fIgtz7gHDMKmj3M0pUImGxCfWsgEEAWF8txuEuJTx/EaaJiGGBXdu6zOXJsF
         aJCaluWyuh2YQyu5Xdy9G/tNpBTaUVKVu1NiCwmW/feWE7smkduODz68Bg/woZh4YlEw
         AeD7fnS5aOzmpgSYlPBh+LBx1nGRe8Q2qStn0mTctSXqDKkpT0aXp78K1SjETCiNzGD7
         iSetAwT0TZer+VQZbtuwGRlTu/AXKa89q1CQ9/o+PatxemGXXsFnd4FGpPYS/OssaR6x
         rV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=4CSRn9tEcJU8kiGoAhArcrJMiSynVhSMb0NK4Ngxt90=;
        fh=MSJ36o5zzLzoQnlCgL+xtUjZJkKwJGPG2++6+rEA/cw=;
        b=ow6Fbqw8VkYoZcZjeZ+mmEP/nK6R93Lqj6f6ACMpulh12Kvs/65YKFVfs2E0uqTMf0
         MmJS8NYoPEF0AemxjoGHxeClCwhgtB7DzqsBfuE3FfBl+KQT2gO+knLGCBan3sDWKlMn
         QBAFkhRk2y1He1tW3960uZoTLoPrAyUaAovCdY8+rL0BCF8n1wQfbtwwJom9l2F6nw2v
         LRKgtkg+wfzBaHr1UJHNiEFWi00xvejCzefFt+RT8Hsp353cdQoaY5Z8ictxG01Hr2yg
         5GglBxFh4659FFlvsmbYUA/nhE56MKf61FYt9772G56JHA/uvsRV/XSY4vxlITo/csB0
         FC7Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790964744; x=1791569544; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4CSRn9tEcJU8kiGoAhArcrJMiSynVhSMb0NK4Ngxt90=;
        b=kq1UmoAfduM3sGICxGo7TKKZMeIACl23vlEpL/fKn9Ma3+cWyggBkqdcuBLpQGKU/C
         3mPzsj7aJt2ZDijvQ3Grwd1ddocxxAEJ+4MK71kXvz8jMLNSkHW28Cey2at3fZCP2au8
         o2lCQ0bbpa3DTi0iSMa7u/gBEAzcJeAxJ5U7iOckpJp7xzSWl7VdauBSThOTdsma0WLz
         YbFU3eUE4m5Fc9s5CL1Z9N8BJg79S2tcMo5XUEibPQzjQIncYCR4Uzqgavh9/rQB5aBv
         fNjOChairwmrqfkrI5jWO2U0SHSYigYMJuA/2IryLoTY2wq3dnfxmTohf5mDgwQ3NvtM
         zF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790964744; x=1791569544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CSRn9tEcJU8kiGoAhArcrJMiSynVhSMb0NK4Ngxt90=;
        b=QYQAMme9LmbPGlXUVSTQHWvCGtyytoPrJYIkIJUIQ2wgaCv9UfG69gZu08/eCvOvdq
         wyJ/8KWwOfharv2e/GSzsAFk4V1twqRTJ/cvR5ScnefKzK1yRQMBjNOsZO9JwdWVt3iJ
         ZKLJPiZbWbwef93UzdzBM19mmY/bkn6lqnMxmHuYIu0f7qvpI5tYphkrlffcbRCzzjQb
         WerroDkHdNL2irLpxvxXg8eM83uxNXxtTB64WqtPA7hgF28t/8Ocn6/cZv8ftKJ2u7Ov
         Rwdz49PS7H4Q/eX8y5X+5lMGkQ0enYbcDTsCcHE/nTwzKyaHx2i3g8zHt8I9nW7Mu6NE
         ssoA==
X-Forwarded-Encrypted: i=1; AKwUvBzIoDkiH6SR8r2/tFOOS2qMTMMsbjSYlvi1X69VLOlqn95NqIRt85jEreVWgR4P1tn/LK6VRLy/a/YIhA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKNZaGegqKFvQTQC2jUOx7B6houGFqpM1Ps+/K+nW6tFhv1KXF5
	4kG+NNCjTdfqJNppk/1ccY80sJRdBSKx6ty5YYGYX9viyr/Vw1zSATlsqu/lTjELUuoQa2I5RJe
	wIgJjH3z1M1ZW6YEi9CeiCRSN2I1TJdU8cWp0ub3/DidthHWlHo4h0DwkpZKNMdPeSIy/xxNWTW
	x+7N3vhFyrvVMRvitBY73YtIKDMfcoUiirYcIs4rtW
X-Gm-Gg: AYBFou2zbEpEv9hGgI6vKYjRaLSMUX84ckDVdhAXAi7xFlcyOy6eGZCPLrY066saGYj
	qm79pVrb9seFuLW1yki1/Ri/XRFsZexphi6XZ+R6AE2ujcSoxHvAEK/Adq3cd8iQzV+yxSS0yvZ
	3Hc12cN0ArY90c/z6KZIBlppz5Vdroo3Ud4WbMRXfuNgbxltpFIw4ViKPM
X-Received: by 2002:a05:6871:c941:b0:49d:e1d3:e6e5 with SMTP id 586e51a60fabf-49e15ead8e1mr2700820fac.43.1790964744578;
        Fri, 02 Oct 2026 11:12:24 -0700 (PDT)
X-Received: by 2002:a05:6871:c941:b0:49d:e1d3:e6e5 with SMTP id
 586e51a60fabf-49e15ead8e1mr2700784fac.43.1790964744129; Fri, 02 Oct 2026
 11:12:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ar_AuRr1eaZzOfw9@baldur> <179096320161.1973.2852858792260211089@gmail.com>
In-Reply-To: <179096320161.1973.2852858792260211089@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:12:13 -0700
X-Gm-Features: AclHuK8o91bLNwt3TjoUBHpVEYotMXP-4T0PZxyf-cMbJnzFu-NNTFKBRF7Wws8
Message-ID: <CACSVV00GwWvMFDR5QC7h8gonC-9qYbaG958nZHSxtUdWXGG_sg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
To: Oleg Keri <okerixx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3MiBTYWx0ZWRfX3B2kliOQ5yi9
 knYVwluBLW1q38dMWf2ep9RCjhYB/hzL8uC/rlSOtSRgMJr+AfYyeoHRVN/FzPqd2H1Rh5bSNOb
 XhpmC8EVwo8Utm0TRHkH42kjTpypkNA=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abff409 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=AHIf9BOdGwd-gaNHwY0A:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: UyyM9xVU7Nm1EGclPDXsokdm6SBmrei-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3MiBTYWx0ZWRfX1T96ACzaumgA
 qAyXkj7qoUWsofYp3AvYVwNGyXB3Loo/shEecA1Hxbc/CCVBarcX7jIY8rwLkLKT5F+MtLzkpis
 aBo9ISoBrkT/o9/Qo43HxliYEdSsMRSMbz5MrLYjpCoH8vhX69kCIhkA5CPvHgmTjCKIdFOg52+
 Mp3aCJniqEd5B6j2yucVGbyHlsecsFBJL5B71x5z1LnKTeHJc/nBYSLejXErBB5VuoY3/KZ8vtO
 3J3RXcmguyZp5CWIg5QsOPeHXx7osI811LL6EF6ytHIdNCWkKHGSNFkLqgEuDtjStx6x5E8zd46
 tT6OUeSusIGSBw477zs9MJtsYXEi7vU0EuiOJoM2rwdjtCtjDB7lp5a4K8ZMPbCPKrLe75o3hVx
 LTeLKukzePEYU6ljSZ/rJVHca4fwhFhb6kP4ALtuM3OKpxE0YS8AV07slM0f7X5u4C7TRMoKW5e
 WrlXre8kqLZcNfLO+Cg==
X-Proofpoint-ORIG-GUID: UyyM9xVU7Nm1EGclPDXsokdm6SBmrei-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020072

On Fri, Oct 2, 2026 at 10:47=E2=80=AFAM Oleg Keri <okerixx@gmail.com> wrote=
:
>
> Same on a Lenovo Yoga Slim 7x Gen 11 (Glymur) with next-20261001, GMU
> firmware v5.2.38:
>
> [    1.632277] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt=
] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for r=
esponse
> [    1.642345] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeo=
ut waiting for GMU OOB set GPU_SET: 0x4
> [    1.642360] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] =
*ERROR* gpu hw init failed: -110
> [    8.053367] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU fi=
rmware initialization timed out
> [    8.053584] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] =
*ERROR* Couldn't power up the GPU: -110
>
> Compositor fails on the first start and works on the second.
>
> Reverting this patch fixes it here as well.

Interesting.. I'd been using this patch, but cherry-picked on v7.3-rc3
(on glymur slim7x) for a few weeks with no issue

Can you share `dmesg | grep drm`?  In my case the initrd is missing fw
so gpu is initialized later, I guess when the compositor starts.

BR,
-R
