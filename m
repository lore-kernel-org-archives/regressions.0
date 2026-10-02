Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96F836998A
	for <regressions@lists.linux.dev>; Fri,  2 Oct 2026 21:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977878; cv=none; b=jnH2HfyeEdk6fTsuPX0USVvOTvWNqRzSemdd7r5Vu8QZpabzO2tB9Eaq8MFnsbREA043cu65umzx1urkFd06pOoFO3J2JkxG8PwPAN8rmMUysWXSgGgouBwIMd+ommmNNkyNwrKUJ3yhmeclkn/8RMqENdbW/YlENOXWvd3gfAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977878; c=relaxed/simple;
	bh=DSZ6+7Z1JtgKXTPRpNOyPTvNSJRIeYIs57Z4SFa4lxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cf46I8ESmLeozFEWVyuDrqV6xFq6VyzJz92PzQCe4ihPktyWjSxBcYBPSHlpP7MofE9E/HchK15BZlAEotyxIRlSKkPyvKtaCyGvRcWHrBpkswQij7kHcODBoP0jdJ3g/vcdBZUzUzttNEqwsLz2533eJNqKANxYUPCg3qNh1oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZR/JA4QJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2lRFsz7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZR/JA4QJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e2lRFsz7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692KAaEI2068088
	for <regressions@lists.linux.dev>; Fri, 2 Oct 2026 21:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sMU6MKK0FAn2tWerO0qAxkcyuX7YPsGW1OWnSkMW9Qw=; b=ZR/JA4QJys1qmmOd
	sfIWHMrxeW9MurI4dn9r7upLneBy3rfUJbJ9K1C6mky3KbciGHyKYo4mKNgxo4zE
	GqyVIQzl4rzn2N6qaE+PpttUxhALuM73OgyK2DoLB1zPpzwK2NzaVacab50uZci4
	7b+0MM/NiV+HRnkrszmt0OI9dwM1nibJKCbP+aRCw5Alp7DW/6uxAC21dlxRJxHn
	3iuKmXgHcSrDJHDhJ+DCuI64RIBPDEmzB5Gatvf7t4LIuEqdvVXXd7BqwD0NKcGp
	qFiVq+lZWxYqxUbB+WIcsKhWg0ZlswUNTEAiHLNQeMEYmAGXd+TaTF9Jkar9vLUg
	aiSASw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ft8s9ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Fri, 02 Oct 2026 21:51:15 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14373747468so51263c88.1
        for <regressions@lists.linux.dev>; Fri, 02 Oct 2026 14:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790977874; x=1791582674; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMU6MKK0FAn2tWerO0qAxkcyuX7YPsGW1OWnSkMW9Qw=;
        b=e2lRFsz73zmvKkQiCHpYvHCjMCa8LKkAO1fxN2m5dG8UrW2fAgd7fujWgakx3lLZs+
         EAHnwUGPxKrre0AGHj8NMPoXUApQ4+LEm8BQkZfGXx6Mcr8cqh8qTqOyn2OEo7Uqh7Sd
         qfnbpExxWr2H4NSKWxf6h0+mGuWBx19bwpZGgAIGabitU1TquupZSN/H1Utid1Xd2xOz
         kB22Z/MdK8Ph/xaYfpu37mxSf6d6dqkfRxj74sYXcisGq8WXllMezTEisjOo5xN+rmf6
         XfdzhPxdSI34jE01sCbQubWsPIVAzalODwrrvbWHWGIIaMo0W0caRKe0LA8gSI2oE5nC
         j+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790977874; x=1791582674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sMU6MKK0FAn2tWerO0qAxkcyuX7YPsGW1OWnSkMW9Qw=;
        b=zNL+tRYSKmm/A135kWood9Nw1fWIxj9ofF5d25AcfllND5w9y1SXOpuWxr1sjAgnF5
         W8tEuIIhJmfaFYblLJN6MCn0IWZaHEx4AESEbVj/q8VfFu6eWH8ND9GRix7duUtgBb/5
         JI7RA8+OALdS20P5KllX0tJgumZCUVL1iYRaVe3eOV3DvBeWvqRqDBhkkpt/2icjP62R
         NUvb2TvXf4gAGb3RBlXNAADaGhx0sdacfmPHeIxAXY/PRPWfgYOIr8iiYAtdTjVcQ1hT
         7WP28pN4cth9rC42zru030+ttzurIXqZbSagzDuNzdFOVW1JjJW0G9roxRotaMO0nIyx
         hBKA==
X-Forwarded-Encrypted: i=1; AKwUvBzGD5e1O8lUQ+s+7gyFsrhn0K/D3DZgAPcfuz/OCfRQV1hy18g+yWZnoLsoLyPqTno1XvbCVgsMjJilEA==@lists.linux.dev
X-Gm-Message-State: AFuF++kiXCjR+h7+jyWALQh+R8da1bXSVlFCjgTbBvca4k3jLOR1DceH
	9GK638Vb8jJtwRKyaK9fl3bM+HI8pRTjM+7ArwZXY+pWgWGYnuxun9JMXhJIklIl4tbOkmc7YKv
	v70tTdp5OU3edJKma2jasR0PEs8ylquAJbl9nvNOs1WJvdRQRa0PztEPHs1zujNveYA==
X-Gm-Gg: AYBFou38AYN6cDNoKnSa5i4Th4aOkFg0YsykX9mnRjgrvkDfI5izLRGYVJ7pbs3zQWp
	B4nmxESr8ZDuwtQO3GFC26rjzppKNcOTATsdD4Gn+y1M96lVvAlZxuEC7Ryiaz/aomiD9yaWWJ8
	amW9sb+BjUrGyCyPOc//nD/KzawF1SHoCTwkDmDL7DRxCR3OGLTDI1Bg2T88mz37R+obJ6qSIIc
	zrSiAu4ZzASdtZbm2wFReFnxGQZzsvLmrnWr4vflKApfuFPucCtgynAI8YKbB3Rt0E0MiTHbKj5
	UzMGZkpKR1xqXVe9HOPrXY39iMl8PZ4D3sxmUu2G1EkvbeuIc3/m929hp1tbBsGmQzUssGNnRN7
	EeIMLb1O+iUweFa0IwPJEWw==
X-Received: by 2002:a05:701b:2513:b0:13d:31c5:815e with SMTP id a92af1059eb24-151c32d97cdmr825114c88.17.1790977873858;
        Fri, 02 Oct 2026 14:51:13 -0700 (PDT)
X-Received: by 2002:a05:701b:2513:b0:13d:31c5:815e with SMTP id a92af1059eb24-151c32d97cdmr825075c88.17.1790977873258;
        Fri, 02 Oct 2026 14:51:13 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.235.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f0672c2d1sm11715212eec.4.2026.10.02.14.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 14:51:12 -0700 (PDT)
Message-ID: <9355acaf-60a1-4fc0-a27e-8195eda3aac4@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 03:21:05 +0530
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
To: Bjorn Andersson <andersson@kernel.org>, Oleg Keri <okerixx@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
References: <20260516-a8xx-clx-support-v1-0-62508bf651ac@oss.qualcomm.com>
 <20260516-a8xx-clx-support-v1-3-62508bf651ac@oss.qualcomm.com>
 <ar_AuRr1eaZzOfw9@baldur>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <ar_AuRr1eaZzOfw9@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Qvq-epxoaSLkm0EL8svuRejsgmxT3ta6
X-Proofpoint-GUID: Qvq-epxoaSLkm0EL8svuRejsgmxT3ta6
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6ac02753 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=AE3SQRS/NFwxibvl9JJKcg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BHwv5AXLfuIp9uWDur0A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA4NyBTYWx0ZWRfX2yb3OX3sJfjb
 9As3YLiaddPHYiSR3JgTCyJRktEEHQ2B0XCNo0msP8MgJlfMi8kppIcHief1i9uuJXaW5fBXdIb
 WaqWOdGxWlk0JheoQhbG1oyzu5miTfc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA4NyBTYWx0ZWRfX4EoZPNRGgOkm
 ZTSFHREwN4sQ0ZoyeZTlCnet/zCGykzJ2GPQEwnhwzpJnkx8q9ZJMj/H9i4YM0tJwF/fzec5j6q
 VcBg9WrNwFRuzKdLKm0/AiBPwndKy9h1Y5R4l6MzedyGwSiLth6IIaP6Z+23kYhcxyAkX4wAC8w
 VD4no1ln67R4Lr3KaPZ7UB49An8U3zxd6SZy+lXjCIqraGn38MeCWXkhZaeHZk+hAxKdiiZ3/fx
 9J1fWPZVKnN9t2403WhW+89za5S17Rf0qjyNmhi8+7oGA/ZMnK3Rt7AxU2IM9NQrj3i8kQFAMcQ
 eJiGDVpk0v35n4vQ9kpp7EKnPwCKvhL1bICHFYCyW5sgciLXx4qY35TKcEjJQmcdv7j/DR10Hx5
 1Uf8MJJi4Y/HA29KoQdxADyy2nzmWlGsqfclhzJBYJwst9MssEfEM0C+25/ZIh2z0R4uxgsjWTK
 iVQuEwPhwFYG0uSlvCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_06,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1011 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020087



On 10/2/2026 8:08 PM, Bjorn Andersson wrote:
> On Sat, May 16, 2026 at 01:37:51AM +0530, Akhil P Oommen wrote:
>> Add the CLX domain table and the IFF/PCLX limits tables to the catalog to
>> enable CLX feature support on Adreno X2-85 GPU present in the Glymur
>> chipset.
>>
> 
> This patch landed in next-20261001 and while it works on my Glymur CRD
> (COB), on the Asus Zenbook A14 I see the following failure during boot:
> 
> [    4.843643] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt [msm]] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for response
> [    4.853804] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x4
> [    4.853878] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu [msm]] *ERROR* gpu hw init failed: -110
> [    4.863980] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x4
> [    4.864038] platform 3d6c000.gmu: [drm:a6xx_hfi_stop [msm]] *ERROR* HFI queue 2 is not empty
> [    5.128548] ------------[ cut here ]------------
> 
> And then as one can expect there's no more GPU.
> 
> Reverting this single patch makes next-20261001 work again.
> 
> #regzb introduced: 93b6c8d10fad ("drm/msm/a8xx: Enable CLX feature on Adreno X2-85")

Could you please try this fix?

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 662f09bec9d5..52cd60272870 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1241,8 +1241,12 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
                        goto done;
                }

-               ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
-                                            QCOM_SCM_GPU_TSENSE_EN_REQ);
+               u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ | QCOM_SCM_GPU_TSENSE_EN_REQ;
+
+               if (adreno_gpu->info->a6xx->clx_tbl)
+                       gpu_req |= QCOM_SCM_GPU_CLX_EN_REQ;
+
+               ret = qcom_scm_gpu_init_regs(gpu_req);
                if (ret) {
                        dev_warn_once(gpu->dev->dev,
                                "SCM call failed\n");
> 
> Regards,
> Bjorn
> 
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 86 +++++++++++++++++++++++++++++++
>>  1 file changed, 86 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index c503912a61c7..9ad13eb173de 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1799,6 +1799,90 @@ static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
>>  };
>>  DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
>>  
>> +static const struct a6xx_hfi_clx_table_v2_cmd x285_clx_tbl = {
>> +	.version = (2 << 16) | 1,
>> +	.domain = {
>> +		/* GX DOMAIN */
>> +		{
>> +			.data = CLX_DATA(60, 11, 0, 1),
>> +			.clxt = 0,
>> +			.clxh = 0,
>> +			.urg_mode = 1,
>> +			.lkg_en = 0,
>> +			.curr_budget = 100,
>> +		},
>> +		/* MXG DOMAIN */
>> +		{
>> +			.data = CLX_DATA(60, 3, 1, 1),
>> +			.clxt = 0,
>> +			.clxh = 0,
>> +			.urg_mode = 1,
>> +			.lkg_en = 0,
>> +			.curr_budget = 100,
>> +		},
>> +	},
>> +};
>> +
>> +struct a6xx_hfi_limits_tbl x285_limits_tbl[] = {
>> +	{
>> +		.feature_id = GMU_MIT_IFF,
>> +		.domain = GMU_GX_DOMAIN,
>> +		.feature_rev = 0,
>> +		.cfg = {
>> +			.enable = 1,
>> +			.msg_path = 0,
>> +			.lkg_en = 0,
>> +			.mode = 0,
>> +			.sid = 12,
>> +			.mit_time = 5,
>> +			.curr_limit = 18000,
>> +		},
>> +	},
>> +	{
>> +		.feature_id = GMU_MIT_IFF,
>> +		.domain = GMU_MX_DOMAIN,
>> +		.feature_rev = 0,
>> +		.cfg = {
>> +			.enable = 1,
>> +			.msg_path = 0,
>> +			.lkg_en = 0,
>> +			.mode = 0,
>> +			.sid = 18,
>> +			.mit_time = 2000,
>> +			.curr_limit = 6000,
>> +		},
>> +	},
>> +	{
>> +		.feature_id = GMU_MIT_PCLX,
>> +		.domain = GMU_GX_DOMAIN,
>> +		.feature_rev = 0,
>> +		.cfg = {
>> +			.enable = 1,
>> +			.msg_path = 0,
>> +			.lkg_en = 0,
>> +			.mode = 0,
>> +			.sid = 6,
>> +			.mit_time = 3,
>> +			.curr_limit = 66000,
>> +		},
>> +	},
>> +	{
>> +		.feature_id = GMU_MIT_PCLX,
>> +		.domain = GMU_MX_DOMAIN,
>> +		.feature_rev = 0,
>> +		.cfg = {
>> +			.enable = 0,
>> +			.msg_path = 0,
>> +			.lkg_en = 0,
>> +			.mode = 0,
>> +			.sid = 6,
>> +			.mit_time = 3,
>> +			.curr_limit = 18000,
>> +		},
>> +	},
>> +};
>> +DECLARE_ADRENO_LIMITS_TABLE(x285_limits);
>> +
>>  static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
>>  	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
>>  	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE_BR) },
>> @@ -2227,6 +2311,8 @@ static const struct adreno_info a8xx_gpus[] = {
>>  				},
>>  				{ /* sentinel */ },
>>  			},
>> +			.clx_tbl = &x285_clx_tbl,
>> +			.limits_tbl = &x285_limits,
>>  		},
>>  		.speedbins = ADRENO_SPEEDBINS(
>>  			{ 0,   0 },
>>
>> -- 
>> 2.51.0
>>
>>

-Akhil

