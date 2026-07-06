Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BF041B354
	for <regressions@lists.linux.dev>; Mon,  6 Jul 2026 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331557; cv=none; b=OhdUeHn1kB0v+hiswxt4kbjxqMt8xdRrVPnriW2ay3vccc6qLQLhC/6B4qxff+rYlhFjZ8nE8GxHDjET+HvZ+LWXxtwV9PBd8m3dU0+i6cvcl0pL8SD7WaW6sVEHbATEclCiZW2f9KFb7EdAk5ISByC7PbZisyhEO/gsFTv5ziM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331557; c=relaxed/simple;
	bh=CT+6sTQWuPnhtOdpILmRJgYsA+lqXyqFq362sw8L9Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBDXvmAyTidTm68aorPETiNM0V+axu6rzPexI4ZLFDz6n5B4fsAbDBipVch78e+Rcq6is8l59w4DfHTHup//lgVJQjeO0ft+DUEa6DGcXRIfLhRL9mpui2eBKbQa3hocOFWwXLvF/ZWS47Q/x0aFytv5p6jvR8H/t7oiN//5HOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k51dKZg9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B67sAHUN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k51dKZg9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B67sAHUN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669498S056982
	for <regressions@lists.linux.dev>; Mon, 6 Jul 2026 09:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ymiCvoZUHnvPV3UZWE3h9gNLgtym4Czr4Iw523eM3AQ=; b=k51dKZg9OvEZm8mO
	V65Bh35rQB9pDW3pfKnt/YioF/TmIHOaEKTKmzXF2FoDqvSLG3JTaq82KuGMwVHh
	f9DkDecvTmnLePdBr4MEtws+tq5rkHGfeiNF9lXYum61eyxXAcRbOVv2Ve2n+JfJ
	me/L0UjjscMbH6T7acjPDd9gjG6/wiQTHBaMubgkhIpleQNmXLb+FZo2oKUmXn1J
	C5jWoA8Z6VCEr9ddCWK/axrMY4Djo6Afz9Tq06TK98pqlkhtLw0URo8+C6cZPSid
	9mhMD+SZQPiYIZBKwGDGRiEi6DBITGNoZMIW7Iqkfm4f4ZedsKJhLTdqw0UvAMCK
	LLvukw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7gn18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Mon, 06 Jul 2026 09:52:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so4078797a12.0
        for <regressions@lists.linux.dev>; Mon, 06 Jul 2026 02:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783331542; x=1783936342; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ymiCvoZUHnvPV3UZWE3h9gNLgtym4Czr4Iw523eM3AQ=;
        b=B67sAHUNwvnv9/VFO2f3eh6KEPMNWa0I8cJjuX498w7q1TeYPeVLx/PSeeF77PqyEC
         uEVAcD0PWiQhjYrA8ROR52Hxciw81f5tvIr1zxLS2BF1/kFWuk8nXynlKQfsxtmKotr4
         URIWKLK3G159y2VwzVA4EfR2Z6ouPriCrzVNEHvN1swG37wi6xnnsQBvYUloV4tmozo+
         miWm7WnNvCH8dR+Q3fihlegDFCcuyrDDzAWKb888mQZfztW7wyw7oqqDvSgUdiuojOVc
         Qdk5i5zJXL/SzVj+uCTvGLAjK8jilYXL5//V/EJb5Poj+FTSOOlo4a2NciEqEECG7kYZ
         0TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331542; x=1783936342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymiCvoZUHnvPV3UZWE3h9gNLgtym4Czr4Iw523eM3AQ=;
        b=XOaXHM+pderzU4S+4vGZDZzUkSSEC26Xg8Ac0ATb+lCC/aAokBzKw2cwJR1MXB6Rbl
         SLIMCi1CwIuCk1zpWmVicopGgoUux9tNsnaUzFXtBXLmahWHdkyXYzgC26rWNL75pde8
         NgKw85f8zY+ZRCy3ApGPsuS2LbxrcxAIZdh1K2BNeMiE3JlgZCSQrEzmzLD/b6R8nLNh
         cPLumJt1Hpw9lLD4niFzw3MHao2yZojfAy3adnVqPFxHbkquBqhRfHzvS+9VrCdVbDLP
         mab74XOGK90zx61xH5xqYQfJmnLH1s8PF8bvfechFD3ssiToBQX+88oTokUxQ1jBzLMB
         5Msg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9RMe7X8TdI9WukAVjzGAiJdF0FZ01skSAwv+VSPQqm7K1tvD93NR65hU3NLUVqUxijxtfJZkp3KMxdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9dDVjapY2Wh/ELeeiHu2FYXYNxGV7xCI/039CsMjzL/VVcW4q
	qo0KaOtMkMWWiWVq4Ki+qGrE/9GbrF06sDia/5+oHV9KX8Oo7Di0tmSIam9F8r27LjcSHt66Ell
	+dBwDA3v0vq+oQEFoxrJ7RKcH2GgmxcROXKV90I0Bseo0vZwY3Rp7nSLvZtcOOUo5sg==
X-Gm-Gg: AfdE7cn8MiF2xYcGrCwbgJc7GE3fpnDRxVZCeeqFYTlGhSsfG56FJKWFkAkD+k0xG18
	maM0pMvxRIdnm4itH9tGa2WE5KKKNm+U5iBp283cQDY/c720JpqFLZV+ddU3y50KPMjTO1PF7Fh
	RLdAh4niT2psP/1/y5u7L3HYs/Mbtq0DPpaOiDOljRs6/uPSj5bLhneGtmLE5/Up4tXeTy4axTS
	xQzEbdueFLtQikM6h88mnwcAOvL8Uq3TeQeX6Z88gb27ZqeN78hrktKqRoqBD3cFooVMdxThYVJ
	k8IGuQEsmaWdTEF3UpilI8FL6Kd85uu1AHfqQHh20XYQLfF1tWSonKqU5lJQtvpZcujFBhwwqst
	Drx4cTTqZdw5AFBF3uKHOmtTRqhDfEVCTyXxJ
X-Received: by 2002:a05:6a20:72a0:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3c03e52c6efmr10345060637.59.1783331542224;
        Mon, 06 Jul 2026 02:52:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:72a0:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3c03e52c6efmr10345031637.59.1783331541747;
        Mon, 06 Jul 2026 02:52:21 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a1bsm52826858eec.3.2026.07.06.02.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:52:21 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:22:15 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        vishnu.saini@qualcomm.oss.com,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Resolutions broken after "drm/msm: dsi: fix PLL
 init in bonded mode"
Message-ID: <akt6z1irWlXA5UIy@hu-mdsor-hyd.qualcomm.com>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
 <ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com>
 <wrhuksrzlxw2pjlvjm37dwjuztcv7qs5t6mqiav4ujecwqdkwj@ozbfxpbgaimt>
 <CAJfMnmEVwUwt=wMJ-8HKH1yz9+erWLrRGB+6wVYCdSGDK+_T_Q@mail.gmail.com>
 <114b9be8-1fca-4762-822e-1d53838d5de5@leemhuis.info>
 <o64cxeq5f4ffqpdmbai5cvsmxei2cnw3p6acvu55xl3cj5w3z3@6o6kokszvng7>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <o64cxeq5f4ffqpdmbai5cvsmxei2cnw3p6acvu55xl3cj5w3z3@6o6kokszvng7>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5OSBTYWx0ZWRfX1lbqjb+edRLn
 QOTzph+YSTlWk7TdrwkM9PwOmh1dChRRvpt3eDyZynLAwHbl8HnqS91fqrOx4vCtnsvQhgXGgxC
 zx2L7bd/q+Jyx2ZCXjmRMvMHp/o3orAwnk7gdrh+J81sY9Ej+lXD3NPBilw8GTAdk2ypz06rmw4
 pplyS7UJito150gKEPYoRq0PvTJSrnHxjUTJhHR+KRZ0h/tT9/IpcYB/w01d/gJBw1Az8Fgcn4Y
 3W/fNJmQ3e4NDRNtkrVuNPPCZbEVxkVKfdnI53xCvZGIXl0K2wyFR2XSVEy1YV9TcWkmwkiRDOJ
 5wWjfYmLZtWobk/O13uBJTMDr3xldiL2qLasoLeXdIGIFD23YtxhZ68nO6mJBQWt5HxehKgVIYB
 Xej5v5scEfuu+6Dd8xHEPDXW1Tazuk4b8ySY1ie/ec3wxVKOQXP5nn4SAa4glSh237+E+u64Jt7
 nk3drCGQ5jQKTnuZ2cQ==
X-Proofpoint-ORIG-GUID: k2zHpwsHIY4I4RNYmf9T5riyILEaWMeS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5OSBTYWx0ZWRfXz4uPe8IawFtx
 xYd8v9tLLFvdBTr7TyE/84EhuqMGcX+6mq+fZkVkNsuNYFxitZVwrg38P8LExa5iJ/bxRaQpdDK
 dX9DmWef0utt1RdVfkoZi+KJATojnPU=
X-Proofpoint-GUID: k2zHpwsHIY4I4RNYmf9T5riyILEaWMeS
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b7ad7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=X_DaoaUhr7fqxi3pwtIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1011 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060099

On Wed, Jun 03, 2026 at 03:11:34PM +0300, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 11:56:15AM +0200, Thorsten Leemhuis wrote:
> > On 5/4/26 22:09, Mohit Dsor wrote:
> > > Sorry for the late reply. I am attaching clk_summary and reg_dump in
> > > working and non working case. Lilliput is just a normal display working
> > > with hdmi and has 720p as preferred mode. Yes, I was talking about RB3
> > > Gen2 only.
> > 
> > Neil, Dmitry, and Mohit: what's the status here? From the outside it
> > looks like this regression is still unfixed with nothing happening for
> > weeks now. Or has progress been made and I just missed it?
> 
> Thanks as a reminder. Unfortunately, it takes some more time (and I've
> been a bit overloaded lately). Worst case I will send a revert soon.
>
Just wanted to check if you had a chance to look into this issue and whether there's any update on the investigation from your side.
> > 
> 
> -- 
> With best wishes
> Dmitry
