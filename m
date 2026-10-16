Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622D24BB80D
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 13:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156492; cv=none; b=NQvAcvkow7QznHSF5F7SVOKQyW0ECpKCMqwjCK4mqRZGx3314vULhyM2jFkQksdwc+QodQNtl6XCLmF0ESlBrl4gaAuANtdRxW5t1iRZ+iDIBfG1OLx0z3nHAOoYEMPfnLIqyGHJrVFHai9glsFCmRwp7BKDQH7XPwFESz7DHNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156492; c=relaxed/simple;
	bh=CndP1bLne+UX3AI97tK+HL16zqhF/jGzueNBiUg3cEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BEYLpDPPpb6SSEPVYSp19g/1AHIIuBNZZcA8JHIXjPkQPaO8hpU2u6VpkC+Q2KGkDO8F9bYGUqxNVdGPUC0XdXjQWAt/jjMpE3WX5Vj2CP6yKJ3w/Fcc+umyjL5Ov/aOaSmVf9TFtias5rLt9lA0ZnfR9IuSfGuW4OGgYW6/Mfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfG7Ut8w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnZ7ZpJe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfG7Ut8w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnZ7ZpJe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAOFh2496919
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 13:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQZsw4ftvBo7+ZjIXx+lUmsyKGeSp9JqGs4axL88zkQ=; b=OfG7Ut8wEH1FASSl
	NEvHE2n3yl99902oZL5LLaDFq7dvc20v6xIeQzZFh1PncyKohYE+C4nq69HHZKVX
	WN17GyN8VxxNLmLVPQlWBg1Z9kr8Y7PwSsnkBU6a1pIRiGhRrzAKPZ9SLIk2J2gI
	7iB2vkAgxufgYPzjoN8VejpzWNDck1fPhA/Bas3u2i7AUwNJKovlEMtVQjmQZkuB
	HvRiaQf3mWrALcCUAlom2KtqaXKgiLFIyi5LSbRz5r5kcQWo9KX4JZTDBgCbqewl
	Xwu/Jv9+crSCvZt6lM7CBybKRU86eB+C2DDvsP/IJM1mlbe0NSI1hh6vb1etnrb9
	++8WHg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa3uf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 13:14:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so20051985a.0
        for <regressions@lists.linux.dev>; Fri, 16 Oct 2026 06:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792156487; x=1792761287; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KQZsw4ftvBo7+ZjIXx+lUmsyKGeSp9JqGs4axL88zkQ=;
        b=gnZ7ZpJeMe2hNltOy307HxLGkhvnj+qOH80xS0/q8P5m5NI5E12/5lFGhavozgFc0W
         MoSSOefs+bURZC+huqb4BNfe8nyU3w/pZAM5oRtLkHpq8e1K7lWeit5dvfkVGZTl5WmV
         zuO2VxYLFBwgVrMYrGm796k/g4+YlskU44adw1qZupoZVQLx93CAXVbGYYAbkDjAv+rg
         4ECb3KFvO9jkX8m4ISxv2un0dnDRioNkdd5lhuMpe6A4AZTBWzfJcJoSgomq23gM54mS
         T+wGdhmjHUbGFKLkW62sAGhSPkwUlL0M/OiBTznQAWx5G/PPwnjEc7/1Jl0Puk32+DUd
         rbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156487; x=1792761287;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQZsw4ftvBo7+ZjIXx+lUmsyKGeSp9JqGs4axL88zkQ=;
        b=kE7Ic85T83y3zjLBNlSn+2tfh8/HeykYvYc3d4ZhzJEl81ugCYMIxwUbKJv+lRMlxz
         qCCwsBU5We0BM4hMJjG9rbteuCz4rT+ya3w/rIdhN9aTffVo0UV3aGKCommNCDQOgep6
         skY58MlREglA2GIc2XM6cwvhf0SCcxr2d99FVL3oxGUN7Y9s/zTZOlMnEXJnieJOxlyu
         ehJmQQhmQWmFb5SatpteD/N9nBULhkLuPh4Zdjq+YTbP9oDNdSITGi34oZrPA7//K8YU
         o9hmksy6uJ2+JJh2D4+DXQv+eCAteiPDBDx274zjgpcb4GnogHlkdsbHKwOP02JHbTyC
         l3ag==
X-Forwarded-Encrypted: i=1; AKwUvBw15SmGsJeh+kjwipQ7pVI/2VL7E4s9NSk47P0ikChGF7Y2qWZQz/hmk66HpQEXD7K0y9Rw8VN7/kDKOQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIyeuNQ5MGpbe6ahbFlnZkQPHaAZF5sPqJYSUUNabln8DJ+SgvU
	3GyiZHbnaZSE+CZtsc9ZGsc8FbTih8CnRGqrzt1C9+ttD4VYc1vBu9EpPytdymbZ5M6fSICriLd
	jDPl9qG3FLtjJ1iEJ25DNUN+fhSnu6PPLVAnk3sCewPD1H332OCVqqZXZOKFKnya9hg==
X-Gm-Gg: AYBFou0Oo5ud6tGGxnyR0+HK0K3nKNAapvPstD+ZSB0BgnHaomjY+IIR8mcOtV0ucd/
	XSMM7QXeTvMBtO/6ZaUR1/pr5An9KJdemX+563zTSI4YtlZCgOcWNy3mJv7e6dzDuDEV34Bi8eJ
	k9XVAubj9iHdfRbqZRsWKLN/rlhoBNW09jmHgA9lKl8h03QOLKJKFIu6UlawzlBO1uAVujhXk+D
	kQYzjlbcRtLEQcglXG0ZS10S0mVd8jphxYOYqxgba5nD93uuSid6vIULi7fylxs9qfBPcogS1uz
	dnIe8/x0QENGZzZQ7By6CnGhT6I0aRZmkqOcsd4H3dEZ+qcl/Njl4HaQPBNYThlsa59sldOwh/O
	iwuG9tO4/IKCaobL9apmZ2w==
X-Received: by 2002:a05:620a:a43:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f211f7e97mr152805685a.5.1792156487402;
        Fri, 16 Oct 2026 06:14:47 -0700 (PDT)
X-Received: by 2002:a05:620a:a43:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f211f7e97mr152800585a.5.1792156486768;
        Fri, 16 Oct 2026 06:14:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408b4a85b8sm71612466b.0.2026.10.16.06.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:14:45 -0700 (PDT)
Message-ID: <bbdaabf7-ffdb-433d-91fb-f6ca03b0747c@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:14:43 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
To: Joonhoe Kim <26rote@gmail.com>, mani@kernel.org, davem@davemloft.net,
        edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com
Cc: horms@kernel.org, christopher.lew@oss.qualcomm.com,
        deepak.singh@oss.qualcomm.com, pranav.phansalkar@oss.qualcomm.com,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev, stable@vger.kernel.org
References: <20261016124600.31-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016124600.31-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MiBTYWx0ZWRfX8LJ7UZZuQHOG
 j31wnhEbiRk9rJaCNPJ+lT+Av8Gxyoc7ayX8225+izc3BHmG8WvO8qKxICfPBFNM1UGwO94mNnn
 6/h92T5MlDo2vyTBIR1kbYMKCXtWJpQ=
X-Proofpoint-ORIG-GUID: gfMgzMknyNlgZN27oalBSk4bHmtDjZxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MiBTYWx0ZWRfX5yhxSY1xokIw
 HZwHR4+Oe3luVy7ybg7uuiBdkeKQVwtakGZclKGJuMgmmkkin6p0oRHIiu8qJjSambp8iQF441d
 HVqXUa7+lgQ/nd+cdGYBGT3bMwIvzr8yozVtoGDOGJLWU3TVUvtcqyC5wYwtfCjE9EhrelcT3pQ
 4W0dWb6JxrOSq9WWoIklEuHG99AA7CmK+s3I65d9X6DYbCu2fUiq5lI7Vyr+Zu8EoXmDUr2n50O
 BR//eSvZeyi5a+WW8xrTLiA3PpTZGWBwpWdbv4y8KhWOfRa9mdaiw5yBeq/bV4SidjtbuJVLfw3
 oEtfxLjE9LyxKuDswn9UgAum1KA1PpFK5Bg25bMDBbJkUr2VBE4Cy9Qo3pNqeY9i9OkkWg8f9zD
 DJsfVLjbzyVIbJ0ScXlgAgV+qSxtppYQLLebwExjlqY/g05t/llXQRTm1/hycpRG6kbXSUG4LQG
 /n7mvu90rva82dmipfA==
X-Proofpoint-GUID: gfMgzMknyNlgZN27oalBSk4bHmtDjZxZ
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad22348 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=tdnHcQlNMze5R78DgzoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160052

On 10/16/26 2:45 PM, Joonhoe Kim wrote:
> Since commit 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint
> register"), qrtr_node_enqueue() returns -EAGAIN for every packet but
> HELLO until our HELLO has gone out to the node. The HELLO is retried,
> but the NEW_SERVER announcements sent in reply to the remote's HELLO
> are not, so a service registered before the remote came up is never
> announced to it.
> 
> On Kaanapali the modem sends its HELLO before it accepts ours. With
> rmtfs started first, the modem never learns about rmtfs and its
> watchdog resets the SoC about 40 s later.

Please remember about Assisted-by tags if they apply in your case

Konrad
