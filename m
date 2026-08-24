Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FD319D07A
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 06:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787551951; cv=none; b=o9f2U3FVo1PKR+omzsptCbzx4AjMB90shvH0PSaWnpFMSX3st1xhF+NwtwxSD3wI4foh8LUC191l2rZPLIKVF+4rI4L/SPU3dpckEfoRPbGtSPVu8fFDTO9X+AxA40up1e8enqdOTVBUmGzZCuw1PHGo2q1Ewc2tOex6cLHXcgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787551951; c=relaxed/simple;
	bh=UEFTefeAsv2qh5vvlMQhjsN6dfN8Sm6dSGVONX8CTCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUkjx5OHggNw+m1VOhc8ApnWO9GxL7P/snpHp+REiKttBNjBa8SySLCF9skGPNrETwRsWZ2Buru8X/rWFiA8ttfAmFu+5iOyzD2hxQyo0zE5Ul/UquR/zAnyPc//zLAUGoiaAwTX7VdHDoKjoxCxX/s7o/oQXeoYFBPTDLzLPp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDJ9mCE8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKSnKDeA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDJ9mCE8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKSnKDeA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O67epa1662629
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 06:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UEFTefeAsv2qh5vvlMQhjsN6dfN8Sm6dSGVONX8CTCI=; b=bDJ9mCE8GtJiY+1O
	1eSD2GI5q2it/1mGV1cvqkCCrnGpxYvbF8Cem+kOFSzos3lOrWWfs7n6X1elvu6G
	nk9A+ZyD48tHJ8OINfvmSkCZ3AKB3ZmuLzEigWNtGUyJQ7Dkhu1Wp3JSfkmoJMTw
	GyD0TGZlcATAGtvaJOro0dST3ENOC+58Sr8y9OR/swLbKvq/FV/gt2TQ6YMJWA5O
	aSFEJsHtyhXQ4DEDVdbvXYws13TJm/Iy761cvzYkxKCu1fmJ8WqaGx9bIjTmcKT3
	s5hygI7ZdANdDFsbn1MfTbDcFB3/GHuVxkNsVQNA9yvmrFaJYG37IcNMiKLXjTj6
	dM/Y/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsg0ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 06:12:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ca37ce4c3so5615831cf.3
        for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 23:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787551948; x=1788156748; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEFTefeAsv2qh5vvlMQhjsN6dfN8Sm6dSGVONX8CTCI=;
        b=DKSnKDeAOi9dcqvnLlkjwEPBu/ag3crVveV5Mb+Jwb4B5GXi3Dvsl02baInAqZ/FxY
         X4dQoicyycPWIwpJ5rF5CPUKiKWe9MnbTM8uly920lT/AdSWAVTpHSz7pjFjgZskj9Js
         rleHKDa1huES4G/utkpDaP9mdW3Fh85agDIUHXfm+qFyOnzs/5fzbFepRHDaSplEInbH
         YP/bZqmGEwricxOh/xGWc1diPJ7bbvptRwCkp7+EX+YBrswlrdwUY6aNjTxD1GtAgWzN
         o+sBj4COYeGk+49mdNVXRKTFf3AiywHkyJIz2iI75sOzcfDicd+gnMM/BpyojOqeFdUE
         tnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787551948; x=1788156748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEFTefeAsv2qh5vvlMQhjsN6dfN8Sm6dSGVONX8CTCI=;
        b=m+o9n8kQUCTnjmiWjUONj27wHvc5KoQoilKzkaFYQ2oE0tKoY0lDPhzyGslz0wVu1/
         UooixNcQhtVz48Rp9khz0gkPNUTtYZoOhxrd3r4jebXuN2y7meh0nREnbtIpd91XB7Hn
         4kxwgoqKBVoK8caunYBlfhBfEIpF42QIYSDcqMxJq+uHItstVTre2EoTw6UkpNQJPPgt
         kjD1xAqD7U4tTFE3vP9868ClbtUIMztu5zHrjBFMxXKf30l7P4seJpJK0OxzDcEi5Rqx
         Gi2B5mXiYqGO+Pck3GT3vOT0XI9hOS+60xJNGgBzVWoX0ayjBgMSpFCCtBv8DVnOcuQx
         xiug==
X-Forwarded-Encrypted: i=1; AHgh+Ro1B2k55ptcg0yvtoWguRdNpkoJIFlSfZBcztcLTANqRlnE/xmYepA3UTU1qEZlg4lzhro/j9YN0e1Vbw==@lists.linux.dev
X-Gm-Message-State: AFuF++k728bp0gfn8wmFbiPOQWLGDVR9h5UVu+Tpe08cSxLW9++f+iF3
	wrzeyU+d9Z0+IEqarVB6fZAKkfqS3Yl3spyfCmbw84BFLMdK9B4QZOjdQx794folz5xb5lhOOBn
	UIztE2yz36yo8CE1Tcl+fj1Rm7Xp0Gn5xNLxfnTy4r+DdIuQnhRMTSCDv3tKouaqWHg==
X-Gm-Gg: AR+sD10XrMMaS5Cj8oIL14+qkyEh3lUBsHbHN/hzKBOqZHjKx7bixTeW0XHeO2M53uL
	q6WM7fYJLFfTM5pfNgdOp5jHLAyR0OABHtT2K/Sq166BzX4jEnxPJ+3pv4r3YtS5m6FLkDQLrQ6
	i9spumQNydP9dYDQsNbrnZ0LjcdnxYu4/IWDfqxER+HgqHqB18HfPvOXlPCnwiPpUUDJdjX9oqr
	G4AA+89O/i6JD1SGti7nxZlkE5p26ZgEfsTdE6iUPJocjS8k20MxtsxEEzoLk6EXvZH/JH++mi9
	+N0unPSN2w0YbG9NB7m45cbtVdDs0rxkvbRlQMIINzQYJNsVz2RJRKiO71Q715UsRpUm/qKh1KK
	TU+4rnbAjm1OAgwTENCefAmbE
X-Received: by 2002:a05:622a:15c2:b0:51c:2101:f0 with SMTP id d75a77b69052e-52df56d00ebmr175961201cf.2.1787551947893;
        Sun, 23 Aug 2026 23:12:27 -0700 (PDT)
X-Received: by 2002:a05:622a:15c2:b0:51c:2101:f0 with SMTP id d75a77b69052e-52df56d00ebmr175960721cf.2.1787551947423;
        Sun, 23 Aug 2026 23:12:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968ba7b6sm1031837966b.62.2026.08.23.23.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:12:26 -0700 (PDT)
Message-ID: <7a21f01c-288a-418c-8c7a-a57fb40e2124@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:12:22 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Only check for PAS when a zap shader is
 present
To: Paul Hollinsky <phollinsky@holtechnik.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20260821081325.89088-1-phollinsky@holtechnik.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821081325.89088-1-phollinsky@holtechnik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uELYapFiGkVPrAHFOzOddF3gzPj8vuEl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1MiBTYWx0ZWRfX2A1EzW8fPIiz
 gaZXwxV8o+qOtUP2M+u7EDvzCTPtAykzRv7f1WQPhELe3adz3+r39oU63rn1DPj+tGV4/ZzpFX9
 rabV7pxEDdUZPZgpcb+znwtDUjv7JIhWm9iJh9EbpW6kgVSqR85khkj6CYEb9WYd5QnTjmvsgGV
 CbNeD/Q/k9UhaJPg82r8N/Wmi1DT6eglLFeoYNTtEe1sauSRylBhkwXpXEZc0X11zng1nwXkqgp
 CVmoLGzlNKbW3MBV/xqCp5Ri5KwMIqumYqAQVqT8O3oID8poJrTtLPn4kbUivqte03v4y5R7p+H
 EfusgeEsIacPb7oZxPQCoOI8T5G2Vkx167m5uZgQdP7ZmnQoWp+kqkf5x22leSW8w/mAEXmjaGT
 6OscLV4+hawTusu2IeJCJesLXG3d02qD0CZo03lE47G8709n3sNG21amy2yxrsNK47gitMvlIic
 zaWV21MXsHSaB8rZynw==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8be0cc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Bzkix8dev8cQr7rmkK0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: uELYapFiGkVPrAHFOzOddF3gzPj8vuEl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1MiBTYWx0ZWRfXxu9ECF7X1+GJ
 REwuv0vQiIcJY37SrTKfhj8NuHcFAnSeXDKjsa7p545lW4pVGjXf05eUoD4I7FPiZnn31WrXqZJ
 EutVTwcpKQUP/8iZq9clkBjSgUFnYAo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240052

On 8/21/26 10:13 AM, Paul Hollinsky wrote:
> Commit 0be72be03ca7 ("drm/msm: Switch to generic PAS TZ APIs") replaced
> the qcom_scm_is_available() check in adreno_zap_shader_load() with
> qcom_pas_is_available(). These are not equivalent: the former reports
> whether the SCM transport is up, the latter whether the TrustZone
> firmware implements the peripheral authentication service.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
