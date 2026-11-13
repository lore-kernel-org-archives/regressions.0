Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592104;
	b=fQRmTx91XbLuyLPa/ZdReEL3SBcPkCxQ/xO/QrhrN32u30Ec8cYHa8kEEadZhdXlu6E3
	 PeakBTiZ1q8ct6yBg8LLk251EAQIcCWMg0aSRySUJHhgItZ1vt8O40iueIVLacfIKIH1+
	 vyT9UdIUngOMHKqaBpZftKf4RnKUByQ0I9dYhA8fb1ipzBT2pOcgSXTjR1yVtIaZkldEb
	 2eAkfgOAxrGN4nMYHTOsND7jAbX1LRUxc7NwhYPKJdtz/RVBwXfm1+70iOAd6x9rn73l2
	 +z+afOluyYHZIUMyRSAMptVJKxo7rDAt4KgU6Xu7+1twGdismEoD+TB1bs6x93j7i7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592104;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=;
	b=H6zRoFZmFu2aB8Xqrwy8fhfUZe+8mDUwrV4vrqlcZBWhyaAtUjlHz42KXwFthTW0tskt
	 GAw+4dWXioyM8EU4Lorxds1hoA5BK1KP0os7KuU4b1lvEbSKp7XTrhGYl9svbiXuMo5BT
	 irVwWQuJ+YHQYi1l6tygSj1jBYS6DhXnCeCbHh72xArVPxL54zgdyEy+fDYpmzxCGlGfa
	 vV67fzJtl7lToDHxpJZ2nOOBLeOhMJ0pcHWFsZQ6d9lIYWIsGT3BsQJ9of+MkZTRipB/f
	 /1hQLJq6SSgZ1ohAXjxEXWwRiDNiVbgxeargIx9rxFW0Q3CLriE/xeZ4Fqt8Qv3vkww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BMatpwbj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SNFAarF3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314C360776FF
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 17:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 314C360776FF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BMatpwbj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SNFAarF3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRRbt3296047
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 17:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=; b=BMatpwbjJXhz7tmC
	ljasbfmlGO95hnJLqxJOCrP4eQA5/NxRquVwQI3nLTw2AQPvJfq6nrHByqab//Or
	5cbUlGEvb4Ay1pzSqsgpN9VN66PuxfhxglCSwt38Bcz5q4qZEJMmu93sMzSrplGf
	jpt5AhTtjiAuqNRwyv3gZisR+GTvitPePq3x637xstffZODbFPHWA6ygF6EFyNef
	NImCZYdSZCXJxJ46T/kfSXeFigDFJ/2LEFXabR7rv3oDAZ/HTgWrm08IPCrIHaAT
	ZCIYO+VDeRCRqlUe1Kgnhgr8042q0MdFVDTRgX5Ceh4yC0Ttwb4HqH4Nq7uJFu11
	UrX1zA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6tej7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 17:48:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b15e47e57fso743831a91.3
        for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 09:48:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592102; cv=none;
        d=google.com; s=arc-20260327;
        b=ZY57vZL6WvIYouDgAPY6czmzcTUCRGhRRC7Zk2pYBH6ginEEGnNJ2+ij4oFL3x/xkw
         H6YRNaUYfLE8jDH8mqFjN2FOwapx4tY7U6YuWaJFEGkpeqiiNrjUhDvd6nY/aMo0UEtn
         al4FhLobJO4dJwOslfvnFo5+Tna4Iz2aBPFiPrbR0Gd3TnvrYt9eEpoxe7X+MyoA3iEn
         JbpsaMeR0IUwXeSetfs/Qf5uAOzpWDllzLleCQbksj7SGmommFIX/T+ccu175Wv6uena
         2YTTJsxqXpI7bOgZtGH5/QkX/iN0yylQrJM8DF1DCWoM+hvmJYh3j/nliRxPfQc33ci/
         ujYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=;
        fh=hF5s8rzcxJ9JJxGsi1aJ2uWLMScR7fjieP96xXQevfY=;
        b=e8KlNsy+4P+BL3awSzUHmjxE6q/3+EV6ISkIgo6kHXP3/HlaHxRN83jGiiHzJZncs9
         efkGP+4rTErYXOFyZUYkA7rRzBKquNWfL9oKao8vVQB2kMkSMJBWMRJSFoSP1JA7cwLq
         sb2115Xw68WHkuNbcmBuxcZUxbpqLHtvPMP/VF0LTVIOR2ysc4E69cpOx9ni2I7akhky
         +83Xjqg9LociaTVuWqc6R5im8aUpsBaox9EyJJbOyRFlEUF5lGJbdmvuULdrypM/uBs4
         LDtCLHO6xF/CYSUDPvqxifXnFSMJyUVSppCqUmOu8mtcgpTGXMWqXGBLk1fMUPscT5e8
         xHiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592102; x=1795196902; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=;
        b=SNFAarF3NSr2n5As/4jcLokZUVON35FpAqg+WHmBGhWjFEPlzpJFJcGdz17QwcqEnf
         nPUkS45mcrfhCxwiyl/qSVl5MR9GaNtW1P5WMGqzIuPaw6EjysUoF9km1IEAmmAfCO9U
         qyt+jfQwooSza9lORoVu3tLMV38rl0P/m7rEZWB1n6mC3Xs29AQ4akiKpQBX0U+X0ubb
         iGibyIr7klfESdHrZoJBCZSL/mlIiAfh8KcbpeDbVFPOdW8X4jg2BKkGv9h7/G45X3a+
         YL5pOpdBw9usr5mm+nNsMu21JWRtS9xeZJfpG3HjgF4h5dzvFZ8TFrTg4Y6NxIt1zQCq
         ie8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592102; x=1795196902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1gktfBHpWHBxsfGL/xBUGKxuJBDF2lVN2TGmLj0SVk=;
        b=Hl3VI8DnfRSNKejkCvsq8OBUn3HAsMOD8FJeBBS1kHJBFLyPYtqYRLSOOLMwOgs2h1
         3iiT5CVJ570ttDbICdFdm4JhfzGFFjYZiGDmh2GeHF0Pc4xVCLox2S6HwLFDjptvek/z
         wWhorW46z76CMJeHuMgPPswTNMnki6DunNR7IiAO1sdVoxSKORX04bV2Assjs28iBxyr
         gl9NJVH6N19skHiFSkwb1TAZckubPJ+GXPjxfEZdknV4VzD/9oH/qM4+Z75fl5AFhd8Z
         dXl8KdPENuTR1QNlm1nlV8v7DUQL102WVgGOrra3m7aLAZT4hFzbeGat5O+iq+BdNsGC
         GJJg==
X-Forwarded-Encrypted: i=1; AL+hErHfS5yf/ztVL77yA9TYRGZzuFNWdud2L/3dnmEszhdqEftqWWWa+LP4kjAcBP4qbZ3Qr5abjwueCZN4Fw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+d6ikLY7ln9p0U4pmBLcHqh/B//SSmeZ2dc6fFrFLChPemajTS
	nj5DldRRlVFxweRr5e2rC8H6tMG5JQOwuR9tA+s7nA+TQwZ9rT9F0hQLvLCsYHc6MFqPR+AMB67
	Jl96EIbUmvjxAanlRo0u0+VIF/+CBl4/YpdLTZM4Vl+RMCVAWoqCwdKqS6Yi+TceiOmyB/jZzoW
	JOu9XmNidCHSKjAixYJUAv5rzSHfT62DAbhwDChjJ/
X-Gm-Gg: AYBFou3HEPcDV5Twy//rJwWpvcrKeITackF2ZUPmePYvHax+3q1ooYHa1tG/OsXm5mX
	oLWeYDARA0hVEEsJxN4l316qoVV9YlAsOKqvOMNBXQmZ5yhcxbJlsrebTFtxlp1GTvGzVlBKqd8
	HqD9SWGBTy5xKoNH0vmdCK1Mi1N6fNmWHPqA0QfVQqaNjee0r2yZkSulFfJA==
X-Received: by 2002:a17:90b:993:b0:3b0:e2a9:3466 with SMTP id 98e67ed59e1d1-3b1b09fa555mr2052178a91.16.1794592101932;
        Fri, 13 Nov 2026 09:48:21 -0800 (PST)
X-Received: by 2002:a17:90b:993:b0:3b0:e2a9:3466 with SMTP id
 98e67ed59e1d1-3b1b09fa555mr2052164a91.16.1794592101492; Fri, 13 Nov 2026
 09:48:21 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021080517.2161-1-okerixx@gmail.com>
In-Reply-To: <20261021080517.2161-1-okerixx@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:48:09 +0100
X-Gm-Features: AclHuK_cX9nfIfMsECKx5geydS7UVI339oofu71FfWZMTLtQ_zkBB1Cw2kA9Opo
Message-ID: <CAPx+jO8N4yLD8pZ2vr9_3MD9==FFMdvQG+=1JjDoe2kG7DR1iA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: don't clamp gfx and gmxc before sync_state
To: Oleg Keri <okerixx@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
        Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX5IeTZ2G5YmKw
 Ha2S8EkZ2cpfn0nq94za/L8gJAPYN3i7yMYaskfCTqVjTC1L43c+qLbsUiiE9zuhOGCl7SjpCQm
 sMiTx76btXZx96USKhqKnWtQrWIsXAMdWEB8x9NrvB+Fw3/MLR9HyypoBZZ78+crPVeDcSe5gyn
 0adCc4xzweiZqWX9d8PC7IQ+YhCR04R371VrS/k+wFq3LqwfdpDh/A+4wDBTCr5MJolCQtLbwG8
 LOMONRPKyPPVkzE5Kwk4X+QvxOyN83YM1IoH1adRCEVyrQa0klfzF86+iylMnG9wzPTeSgX6Vv1
 DrvQJNo0kDabcFv3Q6eqHtsinJxgv01jtq88j1gabbbjjnQHnNE+MSHKemoWtd73pYHTqqG5S72
 qBlC2XFBfGThVgG4Kc6T3XgMBHfJSFntmPyfFLXKW+Qz/JbZDySIWjh/qoRlBGMf2e3cvsH6QlB
 XkwWfZDA9rJ7vFOFf9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX/+kJwU1uCoAR
 EHGgc9Wia5u6T5ZmJZ13jm7FGrb7KXBtguapANycFqUxgZdSQwOEKMD++0hCvrCCbrT8cjXFZnV
 XLmJGiCj9vnjffAFWMfyyPd5byYGTgM=
X-Proofpoint-GUID: PxsJWjuBHsuMD0fMMDdLps7415AbhwqW
X-Proofpoint-ORIG-GUID: PxsJWjuBHsuMD0fMMDdLps7415AbhwqW
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af74d67 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=4GocJDDa9GRkIFf5CVIA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070

On Wed, Oct 21, 2026 at 10:05=E2=80=AFAM Oleg Keri <okerixx@gmail.com> wrot=
e:
>
> Until rpmhpd's sync_state every vote is clamped to the highest corner,
> so that hardware the bootloader left running keeps the rail level it
> needs until its driver takes over.  Nothing the bootloader leaves behind
> runs on the GPU rails, but the clamp hits them anyway: the GPU clock
> controller's probe runtime-resumes and suspends its GFX and GMXC
> domains, and from then on both rails are pinned at their highest corner
> until sync_state.
>
> On Glymur gfx.lvl has 14 levels and the clamp holds the rail at the top
> one, 0x1d0, while the GMU's own performance table ends at level 11,
> 0x1c4.  With the GPU driver and firmware built in, the GMU boots long
> before sync_state, and its CLX DCVS calibration does not survive a gfx
> rail held that high: the firmware gives up with HFI_F2H_MSG_ERROR
> 0x007306c7 (ResMgrCalibrateDcvsLvl), the first HFI_H2F_MSG_GX_BW_PERF_VOT=
E
> times out and the first GPU init fails.  On the Lenovo Yoga Slim 7x
> Gen 11 this means the compositor cannot start at first login.  Pinning
> gfx at level 11 or 12 instead fails the same way, level 10 and below
> boot fine, and pinning gmxc alone has no effect.
>
> Leave gfx and gmxc out of the clamp: they have no bootloader-configured
> consumer to protect, and the GMU votes them through its own RSC.
>
> Fixes: 93b6c8d10fad ("drm/msm/a8xx: Enable CLX feature on Adreno X2-85")
> Link: https://lore.kernel.org/r/179248663855.32151.9955864156939592299@gm=
ail.com
> Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

@Konrad, can you please confirm this makes sense, at least short term wise?

Kind regards
Uffe


> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhp=
d.c
> index fa8fed5bd3e5..2c9d4beeffbe 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -1006,7 +1006,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *p=
d, unsigned int corner)
>         unsigned int peer_active_corner =3D 0, peer_sleep_corner =3D 0;
>         unsigned int peer_enabled_corner;
>
> -       if (pd->state_synced) {
> +       if (pd->state_synced || pd =3D=3D &gfx || pd =3D=3D &gmxc) {
>                 to_active_sleep(pd, corner, &this_active_corner, &this_sl=
eep_corner);
>         } else {
>                 /* Clamp to highest corner if sync_state hasn't happened =
*/
>
> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
> --
> 2.55.0
>
