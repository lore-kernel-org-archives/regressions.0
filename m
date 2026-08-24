Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1820035B63F
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 06:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552153; cv=none; b=swWDXRAJXJe241fRqPu6of2wuiYHMvct9bP7LioTpeN+aVPsKHFtf6EoValEp2IhFiERTujvZnI2eOL9GcmvfWb5bXSkwyZ/DfO62OwsDPfTRIzErgEW5BqQbfj0Ari1XsHvp+X0bicEGWmmABZiPPQsm+3TpHZG+YQUhuswI3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552153; c=relaxed/simple;
	bh=tRQCXgKtyVduFGdDijZW87qrNHFarcqJUlMobl3NQIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pt0pjf0fodJnYDJeXx0G0sIAWedfKN208gcbPnObCavaYqfM4Bu5WFkgSZDn591lNL/Vbc98/kMnGrSo9/SIN1cqm5iVx4W7HC7/fxtjm5/cyTgGw7o+dpPWIUgK/2rEusYX56ZjawwuEXxOZZyQUOLHxzqqsRjXpTsMFtg2PQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6ta27ZT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewLWMMUW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6ta27ZT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewLWMMUW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RBES1937653
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 06:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y30mWngwb6kQRZHbIUppMdqrLbx0K2yCmsdwDBbotd8=; b=d6ta27ZTlsxf/jdo
	/nsLxC9EiTAsiCuUNO8Wwk2CozrjNqx970szHEdoDQfO4/NVQNcat4QC+MzLe1W5
	J3NgWQ0PaGstxdUTng9cCGVWaZ/DQDaOQdlNEXNFRbDhPKOG+91tQBzGVaMeVgD6
	Wat8V5oeqtZlMy8LwqsHE4agJ0OGfYdtkwA3Ue8UasXr90CVgAhhVyUDHQFnVT7K
	St2Fd6CQzmalljIiO8U+U0kYZXBLRn99wFleb3lfD6aOFyNgzMFqkxaZdB8hRS+W
	0ZKvmWCUDa8EVK7ylQ4f2R+TMsYmwfSNoSS3UdQwIYRLA2rnMym6ni78+Ul7CvPP
	+e3eaA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qwmap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 06:15:51 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c7429029bso24352241.3
        for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 23:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552150; x=1788156950; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y30mWngwb6kQRZHbIUppMdqrLbx0K2yCmsdwDBbotd8=;
        b=ewLWMMUWxaBJPCnlpqXpOHaRtyVu+DxYRPF6iPwIQbtHK5q6H4KqlF/VOoajnCs4im
         C7MYZfHVMioJALbIaKuG77FMaKpGmuMgv/NvqxrJk8TfDPWpj3WSha2AidMPCxA28TWG
         5C29cbrujZctiimhzZuBT+Z4bmzMoD7A4CSFwL0upV6wqS4rjUeUNUa2/kWqgg7qDTfx
         yUA08Ttdf+POEcswquZCT/1NqV0ogOYc5Vu44mtNA5CSo1DUfN2YahjqQhmJbstd252J
         q07BzPgkDerPH1m8weV+EGWPcilzkmuaU0c2CU7l8xP79pzkguer8KLEfc4UHhL96Mif
         a/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552150; x=1788156950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y30mWngwb6kQRZHbIUppMdqrLbx0K2yCmsdwDBbotd8=;
        b=P3onUq0wPLdimgiXK0y5oRIGaW7TtvX+bUaSipL0jd0QpvIL5BzMWd6aoV1xtW9x9M
         i2I6LVgEQKIAEQ+mYI8uod3vhJRoR8zD6gO4K3fAn/NxLi/35PZsrU942YsmJSMcvarI
         dPaz+38100MgJLZeqMqbf8fkEv66/czjhwjRtYxWuGl+/cSxZNVMZcXrDudzHANInTDy
         SThqFGrvuI2d/aeo1qvq+K4SseP108I8Ys8PT66xlOu3IUfYAO4av9ymrcPx3yqQ816a
         xe09cmgUJt6NHD7bBn+GX4lWsMmLgIMo/n18zJrCByig56yt6pfjwpm1yMf6w2+t76ss
         WLdA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0nEIxqN/r98ujeu0nWoRFMKc0IfSjwv5JThFitDLaM0tJv0GKvIYUw9HH5p2P9Avi6mJwvkj8aA1s1w==@lists.linux.dev
X-Gm-Message-State: AFuF++mK4NmWitahLiTPgBYl80bWg4yGMdFHgGNtE9bY+N+M96Mnob80
	OfOQUwZ/BfTBBIT471pseLPaqZvrjlZ1JQS+ei2g/NXb6AyoMF7Rn/yL0w8eUKwmEiSgHXjbTbW
	7iZsRlD07HTrYrRMhF7RJrUx3AKfSZZ7eGeZUrMfB02f0/GLtsqiCkaMIwO+gEyBfTQ==
X-Gm-Gg: AR+sD11LJpQ95QzSbs2JtF9Uw9U8CpHAuK6d9RZdEAd3slidrCmwO1uuQUOPpAX1GKR
	ernASdDduJ4ohZuSdgePp35BDRK8zeRHMKyc5ow2TCqpxQjtC4jnnEs+TIjZrRQiPz4ywOIc7X0
	zzC51zp7+vdkmibSWkbk9HzjmeUh2ZuS7CgWDPl0NImtFs5koEWaApnsOAcOxCIDIXYUwbWZhcu
	u/SnVlM4NjMvruG6o97RBMACeHH/ueM/A7n8Q/av95e0YtAoyHFBixGs5WQB2r/oQBaFkT02URm
	KmKlG/AxCCrAS8TPIr8xqPVA21bvDj7cff2PUS4zelZu0TzINOnQneJA3IdGEUJ0LXdeAD2aKDE
	3tX71BCcuPDD5TjK/VmDM/ZaU
X-Received: by 2002:a67:fc4b:0:b0:77b:6331:7472 with SMTP id ada2fe7eead31-77b63317868mr2098746137.2.1787552150353;
        Sun, 23 Aug 2026 23:15:50 -0700 (PDT)
X-Received: by 2002:a67:fc4b:0:b0:77b:6331:7472 with SMTP id ada2fe7eead31-77b63317868mr2098734137.2.1787552149949;
        Sun, 23 Aug 2026 23:15:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199ad5sm6808499a12.18.2026.08.23.23.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:15:49 -0700 (PDT)
Message-ID: <06cec69d-2188-4bc0-a4ea-98d99de8a37f@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:15:47 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Don't require PAS for memory
 protection
To: Paul Hollinsky <phollinsky@holtechnik.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio
 <konradybcio@gmail.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
References: <20260821081540.89137-1-phollinsky@holtechnik.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821081540.89137-1-phollinsky@holtechnik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1MiBTYWx0ZWRfX6KlR6HsNWypi
 +aZPKGqbgmbZZHfHuQFP2w2v63ZgjsqazWypkMUaFgJBX5Djlyl/gveqbD7j6Dr31vEIBM4GX6E
 7xT+YfOwHZ9ZcrGGKPlEZyM3WPBX7Aw7kI8hz7hhrhGX9vaQLp0II1DxqHuf1eVxwkx/EgP97y3
 sksv1hosSnJMDs2yvVnjrRcK/kBFAUqomz5ttOCUNSqVTVXjD4s1UiTn7WTHfPiFTSyXxmt5HYL
 RQVl/wt97iK8JcAJKLBuWWHTHvMWIwy7WW9viJUuxoj+2DdwOXa0j0ZfsriF+68NsPFjz/0ZHK7
 TM7NdvKbdL5yX79XP2L+XhJiB9sqCdrRQ8xPZIv5/zraRmbbb6F47lVRDdII5axhsQj0k4ZFT/K
 OleTnCt6IxsTrj2SZ0CWGwvW2aP6lOpszszxyD7Fc/Q1jl0whAsY0NHaX/zu+rOI5QIlx4uwmcQ
 Rk56AxOq6yfFj7V8EIw==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8be197 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=8dbcrQVTAAAA:8 a=EUspDBNiAAAA:8 a=O9LFjDSsXfd6YXdYHBYA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=2958AbVqUNA9gn3SDOjC:22
X-Proofpoint-ORIG-GUID: 6xVbSnFZ-A2etBOEp5Klt6_loVJEpM3J
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1MiBTYWx0ZWRfXze3RaI774MXW
 XQoR62H+6Oh6SCnwkfznszKirW47oCLwEjMjJEDbauy1ioJeM3QKnUORuu+Rzr3weW2tr2pJAON
 Tew6MvNR3KhLmDTKSMns7XjnC2Az4qY=
X-Proofpoint-GUID: 6xVbSnFZ-A2etBOEp5Klt6_loVJEpM3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240052

On 8/21/26 10:15 AM, Paul Hollinsky wrote:
> Commit f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS
> TZ APIs") changed the probe-time gate for need_mem_protection platforms
> from qcom_scm_is_available() to qcom_pas_is_available(). Memory
> protection in this driver is implemented with qcom_scm_assign_mem(),
> which is a TZ service distinct from PAS. The only PAS call in the driver
> is qcom_pas_mem_setup(), and it is already guarded by need_pas_mem_setup.
> 
> No descriptor sets both flags: sc7180, sc7280, sdm660, sdm845, msm8996
> and msm8998 set need_mem_protection only, while msm8937, msm8940 and
> msm8953 set need_pas_mem_setup only. On TrustZone firmware that does not
> implement PAS - for example SC7180 Chromebooks, where call-availability
> queries report every QCOM_SCM_SVC_PIL command as unavailable - the modem
> consequently never probes:
> 
>   platform 4080000.remoteproc: deferred probe pending: (reason unknown)
> 
> On those machines the modem is also what loads the WLAN firmware, so
> ath10k never receives QMI and wifi does not come up either.
> 
> Gate memory protection on SCM availability as it was before, and require
> PAS only where a PAS call is actually issued. Keeping the SCM check
> matters: qcom_scm_assign_mem() passes __scm->mempool to
> qcom_tzmem_alloc() without testing __scm, so dropping the gate entirely
> would allow a NULL dereference when qcom_scm has not yet probed.
> 
> Fixes: f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs")
> Link: https://lore.kernel.org/r/20260808034716.58888-1-phollinsky@holtechnik.com
> Signed-off-by: Paul Hollinsky <phollinsky@holtechnik.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
