Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A8A17DFFA
	for <regressions@lists.linux.dev>; Thu, 10 Sep 2026 07:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025233; cv=pass; b=nISpzJedoFxtSLLX8g/X7EqnJp2B2JE1Y/jJKtj1VQEVDLBZ8fGn/uH5uEzutaSeDdBrh5IUvTB5fp3fSg7nPx2Z4BYNUCGkhVWz8GQnCU2eQ1yEgXqXaR17Z7KTz3CVfLDhz7jddF9TDwVRnOoGqFOFTTowhJFjw8jP3qqZzlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025233; c=relaxed/simple;
	bh=bZxWK4/oaCwKffC7eILmS9hf1WFNkZfOkRz6Aks28xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXF66AGEXsQL/NYeGGb/AXt0++r/hEISyX7Ov9kM1plWiRgVrwflKCIb0Esouynz2kQZJ6RawXY67LiP+FXgEU9p+ttZ9dIctTVg74yHl5rgSG1qTAjxWD3Gkz8zXa/8TUgEEAyOW4jRvImrqTwLYBJkTgodk8EUAcXdjtUMAwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7I/PT09; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfaxSPO0; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7I/PT09";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfaxSPO0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5HMh92974690
	for <regressions@lists.linux.dev>; Thu, 10 Sep 2026 07:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	taZQwJTu7Xj2QDuBpgX98mgl88qdgGujFrGGLJjeO/Y=; b=R7I/PT09opctkmDP
	AtysNWExZ3Hw0+R+zBCwUyJ8Sn0N+LZ1p+JCqyJXtuKSJY1XwAeJwx/QwWWvv3oG
	e4f5kj3ra2K5GX3nwyrdemh7pdQRA2dkCO6dxjaknGFVceuypSuwYvIIr3UEZgKF
	witAiNhxaN5ePeNxct7pd6lpeiHLRHHCCWLfLQcNh9gSsxDcEWKj/vgrNgBFgcNh
	xSNDT6X9eBd34ghP8DpkY7qJkwn14h9MSFgXjt256gXtweedZkiTRFgGrDFQS/PE
	Y1GuxJiAfSRk/zdi9JqCqDxm5xmUw7znzIZij+yW7nQgtiYC5uVIS/ANxJvS1KEX
	E4U5Pw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg2md7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Thu, 10 Sep 2026 07:27:11 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66c70f4b830so7822046d50.1
        for <regressions@lists.linux.dev>; Thu, 10 Sep 2026 00:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789025230; cv=none;
        d=google.com; s=arc-20260327;
        b=ON21nk7cmKxygGrluToQRCz6Wk1+Tp7Q0ItFIE/08dRbn7fD50SVrxm/Cl5Guje4tB
         enpriOQj02De+jzlZOQlC7TJJy+GywSAcR9BA14BHN3eKwGfihe8Mpy6ANJvTRTrhNhz
         btN+NaBYephT7bUVBOuYZHxAprl9IT1LXrK9i/gKSZ/vlotaMBlnoMdjiFocAbH0Htir
         z7JX+1heXpP3hlNZXWuknldAypo2wPkY0BJIL9OK0wP92N+yXAXIOTDhPd28ffsZ9hZ1
         8pLHIJf7B3nHZMCw9vQxXHgPGPU5VAuWtjk3zKULQ0ruY7cj0oI6KPh4QJjgXXjptJ/t
         UiLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=taZQwJTu7Xj2QDuBpgX98mgl88qdgGujFrGGLJjeO/Y=;
        fh=Lzjgs1fb2Iv5K66lvtbXRxPbo6Csk6aTXDAiL4bs6/Q=;
        b=a2RpunbjHwKAmC/zM8nE23uGfhrLCF5LekRrIntZx1nwIe4UVeIZHB7rAlNAldAhaq
         SSOYSHdcxjKchcouT35fWbvPlHbM4dXTT4BTq3tXeCFeYDg/WEvtZMz/KvNAL9vU5pfb
         jvHgXjN2xaJV3HGG2wTHo8wWyq7URNa/0iy1C2Ril/1vnf4UWNvHZTbnHOYTtqHPhtkj
         P4ZO+zZ7ETBEXg9NunO2i0s8Z0T+wEm1Gk2d79LPelTGt6b7Op+H/q2EHmjqd3ZaiceR
         K4PXgRAO0RzT1p6r++Kp3bVklUrqc9HTYA++Z3GTGVREJ7iOCqV3Ix77KyG+j20ombRx
         bwAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025230; x=1789630030; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=taZQwJTu7Xj2QDuBpgX98mgl88qdgGujFrGGLJjeO/Y=;
        b=HfaxSPO0RCi1vxcOFKNTB05hz2tiIRPYPk28MZzeUrF15lk6+o+IWNaAS/3eB/J5Mv
         c4sOyO82o2tNATe9PzhnAYj+Zmz49IE4MLVACcaSBvm0jhiNvsrnSPlvDbn/F9gaxiCW
         pq4Niik6/WiHFZIHMSCaEyDErFW3abt+7MnkO5YqbIX/+0bA6mS/1x7/ERF/W8wA1aOR
         MQx0491t5t2IgJmLKjnrVq/p+MAbkODFh9OzxFZK3H/BlHGTZ51L7oQjSncZFGuBWUpa
         KVoV1H+J8CEsZCR0jrHnQGh0ujjumRgZ9qOmNvaXSd51mUsPNFmuiGfgNUDolGjLf5pC
         +CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025230; x=1789630030;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=taZQwJTu7Xj2QDuBpgX98mgl88qdgGujFrGGLJjeO/Y=;
        b=YqybiL92AABLZalFu0MNy70nf7PTX7/d0swTE+6fM81vA1mPn1qc3iXi6rIQ/A4pIM
         ncpJDy7u6biY3RZY1Bvs9CM/KwFhE0TlqNRTRHPPoL9VuOwcCDheVGzR41zQKTiQZIqI
         JmMemjuLiBGR+oNZedZKClBbLypP5VVBFmMk6G3CxUXTaPxdFc3puuDQqoQi5USTIhzC
         xD6As5PqnXP0agdJx5Cr3aONCMtIu329XdXM9nXCRYysDL2Iterr3vYHfpDBcGU5kXel
         Lw/paEMOui5zR4XekOfUUbT/ArIGE+8j41AcELXpN3l3pvvrdQ4eFAiIxW4kUd5CWQ/u
         UhGg==
X-Forwarded-Encrypted: i=1; AKwUvBx47+WsJcDHFh2cg4L6ACa30fXiONC/0VsrUmdDQXJJiEdosnsFuiUszIYiILnmb9XjRP5V66840VAOAQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nSPzXbqIq7Tj70076DvxBWEdapPGOml/UhdgQVBzEze0tigD1T
	umR9eYRfiQPsnIwrRaQuz/0u5dbggi3RBMvNtUdPI5i/wLKatArcREBcFhrJ160bhayx4Kbn4d4
	R0wtvfuuQlSsuidM1/5r3PgOIU123c9nVVbrKCGzVd+Y0J4cXNNscs7Z5kIJNBpFKdmmG7ZfVn6
	r3O8olA8FhdwG8cbUYShBrlVRhloa3OId6TtvAUO2F
X-Gm-Gg: AYBFou2OtSOd7MvDduBk4mNuSD+Xq92MWy8KxWY7jUwXahUE5z1hNWMHlgECnkSym6x
	feys1KolYsqSB+1MIIVQWNallI2Sq/2zZGsDz+gpPCMl2TOfLWeMWNXov39QZI7LtAu3dOpL3mI
	jev5BlcgbTsNgb5ii+7mPDTAIPD9b+gwJbKWiEOeRmi03c77inZWarPWfUhg==
X-Received: by 2002:a05:690e:4188:b0:666:396e:bf59 with SMTP id 956f58d0204a3-6710feea457mr1891094d50.1.1789025229995;
        Thu, 10 Sep 2026 00:27:09 -0700 (PDT)
X-Received: by 2002:a05:690e:4188:b0:666:396e:bf59 with SMTP id
 956f58d0204a3-6710feea457mr1891087d50.1.1789025229603; Thu, 10 Sep 2026
 00:27:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821081325.89088-1-phollinsky@holtechnik.com>
In-Reply-To: <20260821081325.89088-1-phollinsky@holtechnik.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:56:57 +0530
X-Gm-Features: AcwNN1Vn6UxHVxU9O2c-HcaEnhmPjnjZ2yWHOjiTvHE8Ao96P_jBheKuiWTFEXE
Message-ID: <CAGptzHM1tuR+JPoT4CmA9fO77pheTq6d+14XnpxtNysrBW71jQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Only check for PAS when a zap shader is present
To: Paul Hollinsky <phollinsky@holtechnik.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=bMqDs/+Z c=1 sm=1 tr=0 ts=6aa25bcf cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=8dbcrQVTAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=L0M3gnoWJ22_1Ho6GyMA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=2958AbVqUNA9gn3SDOjC:22
X-Proofpoint-GUID: Aa0R4WaTe1ixoOjisFZiAlENEw9J69Wn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3OSBTYWx0ZWRfX50nxhfAPFukM
 9/726JuOa1P0WxBrN+QfDDPhHZDE/2agwc3Xejg9qj0v4VySoh7wva9QF7CQpxrFG9b1gwyMhht
 sHlBkbRYukd0lUiG7zWTfYYLeWCuQiQAUFuMT+NTS9jo3SKofvc5Kppg458IoyeUQPjuEQf6Wzi
 ngVdSBU1gsbAEaQwh9nrFxzumnrtwj2wUcC3ZX0cDG3iTk1KoE+stNSSaWV6K0I45jlbzIQV+SC
 Nx8SI0fYgYgU0QwnfAIGtgzLGnzUZK71VGF0R8bNMqkNrrET/noaqW/TIyyk1Rmc4br1dOlU0Ef
 ZFXICskjOG7022fjH4Fb+kOzirn5y9m2Syx2QCHmflWD5aXR5EWJ16hDiV9JxYwE6T5icGskvW9
 L39Gr6dCMVc/nM8vOC3Xg34BtguBvk2wIq3BgbHBe8zqxUTBXAwIHjDSv8c4zQ0i5WXv0Gl9hRb
 OV44/7tdC0+xXN4KF0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3OSBTYWx0ZWRfX+aV8hgyI8JXz
 i3Bv0NZ6Zv5b7+7xhSpaYxMLLjLd6I5cBqvJepTvqoKMO5Ts1xdM6FGJNufDBEhAhpz2eY3kaWY
 5lxV1A6IrxrEGP9EYToDpeLIGsAm+Mc=
X-Proofpoint-ORIG-GUID: Aa0R4WaTe1ixoOjisFZiAlENEw9J69Wn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100079

On Fri, Aug 21, 2026 at 1:44=E2=80=AFPM Paul Hollinsky
<phollinsky@holtechnik.com> wrote:
>
> Commit 0be72be03ca7 ("drm/msm: Switch to generic PAS TZ APIs") replaced
> the qcom_scm_is_available() check in adreno_zap_shader_load() with
> qcom_pas_is_available(). These are not equivalent: the former reports
> whether the SCM transport is up, the latter whether the TrustZone
> firmware implements the peripheral authentication service.
>
> On SC7180 Chromebooks (trogdor) TZ does not implement PAS at all. SCM
> call-availability queries return 0 for every PAS command while other
> services answer normally:
>
>   svc 0x06 cmd 0x01 IS_CALL_AVAIL    -> 1
>   svc 0x02 cmd 0x01 PAS_INIT_IMAGE   -> 0
>   svc 0x02 cmd 0x05 PAS_AUTH_RESET   -> 0
>   svc 0x02 cmd 0x07 PAS_IS_SUPPORTED -> 0
>   svc 0x0c cmd 0x16 MP_ASSIGN        -> 1
>   svc 0x05 cmd 0x01 IO_READ          -> 1
>
> so qcom_scm_probe() never registers a PAS backend and
> qcom_pas_is_available() is false for the lifetime of the boot.
>
> That on its own need not matter, because sc7180-trogdor.dtsi does
> /delete-node/ &gpu_zap_shader;, and the intended path for such a board
> is for zap_shader_load_mdt() to find no zap-shader child, clear
> zap_available, return -ENODEV, and let the caller fall back to
> SECVID_TRUST_CNTL.
>
> The problem is the ordering. zap_available is a static initialised to
> true and is only ever cleared inside zap_shader_load_mdt(), but
> adreno_zap_shader_load() consults PAS before calling it. The discovery
> that decides whether a zap shader is needed at all can therefore never
> run, the flag is never cleared, and every call returns -EPROBE_DEFER:
>
>   adreno 5000000.gpu: [drm:adreno_zap_shader_load] *ERROR* PAS is not ava=
ilable
>   msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* gpu h=
w init failed: -517
>
> Nothing retries that deferral, either. adreno_zap_shader_load() is
> called from a6xx_hw_init() rather than from probe, so the -EPROBE_DEFER
> is not a probe return value: it propagates up until adreno_load_gpu()
> returns NULL. load_gpu() re-attempts on every DRM open while priv->gpu
> is NULL, each open fails identically, and PAS cannot become available in
> between - which is why the error repeats and userspace stays on
> llvmpipe.
>
> Move the availability check into zap_shader_load_mdt(), behind the
> zap-shader node lookup, so the driver only consults PAS once it knows it
> needs PAS. Boards with no zap-shader node take the intended -ENODEV
> fallback without ever asking, and boards that do have one keep the
> qcom_pas_is_available() gate.
>
> Fixes: 0be72be03ca7 ("drm/msm: Switch to generic PAS TZ APIs")
> Link: https://lore.kernel.org/r/20260808034716.58888-1-phollinsky@holtech=
nik.com
> Signed-off-by: Paul Hollinsky <phollinsky@holtechnik.com>
> ---
> Reported and analysed in:
> https://lore.kernel.org/linux-arm-msm/20260808034716.58888-1-phollinsky@h=
oltechnik.com/
> Konrad agreed with this shape in
> https://lore.kernel.org/linux-arm-msm/b63e93e4-2f4c-4cad-b726-e1b0565379d=
7@gmail.com/
>
> 0be72be03ca7 landed in mainline during the v7.3 merge window (via the
> soc-drivers-7.3 pull), so this is based on Linus' tree. Note that
> msm-fixes and msm-next both still predate it as I write this, so it
> needs a base that includes the merge window; happy to respin against
> whatever base you prefer, and it can equally go via the qcom tree the
> culprit came through.
>
> Tested on a Lenovo IdeaPad Duet 3 (sc7180-trogdor-wormdingler) on
> next-20260805, which carries the same code: with this applied the GPU
> initialises and logs "Zap shader not enabled - using SECVID_TRUST_CNTL
> instead", and userspace gets a6xx rather than llvmpipe.
>
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 489462065ea9..995161215ad5 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -52,6 +52,12 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, co=
nst char *fwname,
>                 return -ENODEV;
>         }
>
> +       /* We need PAS to be able to load the firmware */
> +       if (!qcom_pas_is_available()) {
> +               DRM_DEV_ERROR(dev, "PAS is not available\n");
> +               return -EPROBE_DEFER;
> +       }
> +
>         ret =3D of_reserved_mem_region_to_resource(np, 0, &r);
>         if (ret) {
>                 zap_available =3D false;
> @@ -170,18 +176,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu,=
 const char *fwname,
>  int adreno_zap_shader_load(struct msm_gpu *gpu, u32 pasid)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> -       struct platform_device *pdev =3D gpu->pdev;
>
>         /* Short cut if we determine the zap shader isn't available/neede=
d */
>         if (!zap_available)
>                 return -ENODEV;
>
> -       /* We need PAS to be able to load the firmware */
> -       if (!qcom_pas_is_available()) {
> -               DRM_DEV_ERROR(&pdev->dev, "PAS is not available\n");
> -               return -EPROBE_DEFER;
> -       }
> -
>         return zap_shader_load_mdt(gpu, adreno_gpu->info->zapfw, pasid);
>  }
>
>
> base-commit: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c
> --
> 2.55.0
>
