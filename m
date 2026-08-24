Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5C3AAF58
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560013; cv=none; b=dKFTjS08J8tT9PP61flceABaz7d0DAFUGAMzKnBXAZSbYXPpIrsNigfQDy+KaSi0XGw4M+IMQearTvbvH31IjZLzdYvHNVJ4md4uSAhxJcwV3UwaG+XtAMHLOf2lVWV8y1xhl+5/llzGiyKVLKIOaBNb8lpbhsBBksjfVOzlAiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560013; c=relaxed/simple;
	bh=Dd+7IFNuFCUaFNilAT23AV3amNqbj8E5ancLP8ZE0yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6FoMIyVkh6Kcd+J4gQfUuery6PrZCKokUpmczIalsoaULiu23eWhGAblBzyTjM7FzmB44y2trS2Pzv5C0KJh11bP9c2DklIwd3dBUUWDDA5A3yxz1bUSC7dxQGr/Ybv/Pbcf2drgJ5e2ckA0lxbzmv5lhihPDqYg7x80bgIYlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DkLjcrAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GKG9IZXy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DkLjcrAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GKG9IZXy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7BhMA1815894
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 08:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rVn8fxYfIoZBJmV1J5r8JZ/i
	ZJ+bvsQgkpm5xup6AAE=; b=DkLjcrAda33EQ57Bsm4cO+8qMFONVajh2yXLiUrn
	VTV0N0siBW4iY7m8a9TkdxUMW9FakiEzje1tCex6qBM2WuLonBh9TSW74JlfiFHu
	Uqyd/+fOUhNWYz3cFum5yDlHp+bD0UOHuwluebRcpjP0HqylvxBt0yeIrji0Wobu
	XLlddOcSxuL359Du8FLuY4w8rLwNysQMRp21oMQobquMlSm/+vZZgNnZZ78vYK2g
	NnfzYvt5nJbZXAJ2qeFVUj5No+juj8HuYxx0HlVvUwzo65vAUq/jhWKB8SNw3jn+
	/3WqqorNZyF08uEwHvxKLjXUdaazhbIRKYKeteUi4gaEZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbtg97r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 08:26:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d30035dso21715581cf.2
        for <regressions@lists.linux.dev>; Mon, 24 Aug 2026 01:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787560009; x=1788164809; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVn8fxYfIoZBJmV1J5r8JZ/iZJ+bvsQgkpm5xup6AAE=;
        b=GKG9IZXyCxNFKxCyDYRgkeecuHscU/p9TbS6bSmR1lgijMzZ16TtV4t0P4EZ3STApK
         2O8FiqHKG5Lhvkp46mRJebGDBOUkHfaVDugbeu935XO/rSrzDIbl9+7fceZXNu4+gaSn
         KKlgGv6x59pMR1bmnmOWDLHErRfHGI97mCPocXDcoYDWUXYEiKobHZWXOhEm9f9n97Ji
         aLrsfREQ1Hc/UVRFuKtQqybrLkKTygwt7sSesyfCRsK5Azd1GGReHKTXTSv6PUEhWIGr
         DwzuZhEGhz0HzibVRG51ptbLfi8I/orjI+Hu0O3NnKx3Eb+0A5DT2xpkvL+brj4jg8vk
         k+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560009; x=1788164809;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVn8fxYfIoZBJmV1J5r8JZ/iZJ+bvsQgkpm5xup6AAE=;
        b=a1SILVtbzA8AggW05+tbbK7os4Gb2MapQ+rH3gkhJ5m14Mc49yDQKQWUfImKTGe4fP
         THdFvOpyzHU+J8D3ydkdxtrpibOyBdg5J7HouZNtw+IgPihBQ0CTA47D/niwKze469Vo
         vsUxq31ZnGZHt+cYMLi8BbQgvle8F+XgMDdKiFyD1KBm2iDO9aitlCzdRQkAAieUjja/
         9FZIhX33+hlq+N3Upb9QKi73kVF+TZXtcFEogyNOWZjJDzx0fE4Q3hx5LmybzMJNX96H
         sG9kyPah3lOnDqZ4GCxaqnGyGIDcFydXw5MLSnPM2xEsh7EmWHjx8U9mVSdmNN7cutCH
         FGQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpam1zsL1XzCfkynz1gzsC6gEhwuqcnSQvKY93ksthDGahBOJ3gdoVB46MCThJxml+6En0BvWxGY+AmqQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lhkVU4Hgkq8Emym1iziLMLNuZpjKYoWonWplXzy0ffOQFFtR55
	mA8tD/fHNvTsXq+s5MWFJCdTXGkB5knRwP+byg8caK6dfQn1eTJj4BzC0l28wRWQGH3EwhSkPfc
	Ba8GyFZCEGaEiozggWLM7QMFlSrNC48KPbgcv72e9wN9TAIFvmDAmQ3xQz/84+O1Zlw==
X-Gm-Gg: AR+sD132LBHu1Sg3o/tPov0JnVtwRrX2ptlA+8qjgEIvXDuE1o8WJJgZT3CGwqfN9iq
	nlh1cC7wU2a1JfT4l9tW6TM8MxEo1oB3I9wv2G6kXXiR+s6OZilx481cblTANNKiAaqHNCKPFJq
	4EYdJSDaTyyjLMSo/LBCgs3yJbdH+v0vcI7HlhLtjeWCCbYItZc/D19UcsBO45KBTDIhX5sZdDF
	Gmud4WHtmsrrPOyNEZkbjID5WA5AANNYqrejycgFhEJIVVTYg0OZS5RiIyC0MI49b218tjXV4rs
	jeZAOwg7oowtf4eLqMxKKj/awhhmPhhRjFcQMJVBt18/jg1o+KMhh7eBMqV1Q7VSiAt2ucWlxEt
	yXNm3Ikw0sjICXiM=
X-Received: by 2002:a05:622a:648:b0:527:73d6:f6f5 with SMTP id d75a77b69052e-52e09cec5bdmr164050631cf.41.1787560009518;
        Mon, 24 Aug 2026 01:26:49 -0700 (PDT)
X-Received: by 2002:a05:622a:648:b0:527:73d6:f6f5 with SMTP id d75a77b69052e-52e09cec5bdmr164050371cf.41.1787560009023;
        Mon, 24 Aug 2026 01:26:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496296cafsm1165175766b.14.2026.08.24.01.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:26:48 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:26:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Paul Hollinsky <phollinsky@holtechnik.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Don't require PAS for memory
 protection
Message-ID: <bxljh7bwnpoes54yucll2wsflskiwbhy7w2u34lhreezpw5co7@chzok7jtx3dh>
References: <20260821081540.89137-1-phollinsky@holtechnik.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821081540.89137-1-phollinsky@holtechnik.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NCBTYWx0ZWRfX+gdc0yhF4Go0
 bmUR78l3E4NizbKnxU6hiH1wZ/gQALfD/iqtY/G0W7FCmn5CcmyE2CekV2JrlZemAWJvW48zs3O
 SCA/4UQq82QGkUr0iX2Daxj0giSnddXqqn4QFNi45GMYHM0fkAtaU7ZICnwUABoq9czSvK2MVVE
 5g7IQ5Wim+z8Ggd8+Pyu/8FrU0cOVSrmg1Ad2Hy+pDFc+TZFJuxrJHWhvlCLOfe3ZQMvZ8yyLtV
 JkU1Onh2Xmx7csHiSPGTqfAA5rjgaDgdDR/0eUmj2fq75q5EcC9rHjE6VT9A0G1S9r6sF6i8zde
 Xwu2dX39lFm0meuay5R6mXRBUNatpSRLu1YhUPHQrvOJvrABjgKTYd898sQOdBgZ1RMNzpMqR26
 H2fIfJ/3o9CmHByyZSXPXethSb+3oF+OuWiLdndO2x0dj8NQN4HYe7HYifuCcsug9dshQo/gkFB
 0izqQ1VsFCwX0OIFk0g==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c004a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=8dbcrQVTAAAA:8 a=EUspDBNiAAAA:8 a=O9LFjDSsXfd6YXdYHBYA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=2958AbVqUNA9gn3SDOjC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NCBTYWx0ZWRfX42+BicYyEYGa
 q7wZkEgnlN+OxaxdDYwHRiFyEeDxOmLc2XLg1lRhbnYpPSIEhwq8szv0v+mUX0+jTmARlO8csXc
 7apePA5teJF2CEFQjzkLR9qIsVH9sZA=
X-Proofpoint-GUID: lfkIBs3WcevlgBH_0InqZXaFA_rrDWoo
X-Proofpoint-ORIG-GUID: lfkIBs3WcevlgBH_0InqZXaFA_rrDWoo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240074

On 26-08-21 01:15:40, Paul Hollinsky wrote:
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

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
