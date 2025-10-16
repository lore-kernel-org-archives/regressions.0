Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88492AD11
	for <regressions@lists.linux.dev>; Thu, 16 Oct 2025 02:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760580121; cv=none; b=Dhs7V7MXR6Xi+JQfUjA3tvScQ3FXNzypa40uZUi6sy/n55T+YbTvqzZRsSvPAbiLiApUJAZ1hmi+omIpo3pbnMYKk+zDf63U6fb0G3Pqw4uuzFpCqWyzmaNwz92269YsgjJtYApevVwByTsUYajADP+qXgUqR4FdXMvc/FoClqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760580121; c=relaxed/simple;
	bh=gZpk9l4GODKcAbTHiyKB6PL4aJAfqpr67cEFyclZlfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VjIBUe/wfVAGqlH9/9eHDogrpD6S10DXJ1nlOOeEWUPdzp6/+ppgbd+v56opof+twvTfUYaSGXIKtXS3te9fAAMCBoBFvsgWcACpsUhmW2BQa80O4UMk5qU7h8ejVOHqrhm6/kCy6SxRyKlStHoINSCoyIx2duOPtyMOdTBVO1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xoh3AENT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xoh3AENT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJql8e002700
	for <regressions@lists.linux.dev>; Thu, 16 Oct 2025 02:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k4GrjthokzpfV3NB+jVI7qiQ1VZwJxFM9jmJgqFonaY=; b=Xoh3AENTNxOgLXUT
	VMGPyqZFr+VXzmP5E58zC1DJ1FOcIG8sqBZoCFuU7pTNvIYRIL0w/mCydV0Qr+g9
	2vLBVmdtYL4X5Z9dwnYiCQuHKj37vmNzj6YzoqIIWml/RqSME38600X+wzcCbHqx
	VR69i4KwD7txLIR0vYjM2GFN+VkY/uEdCjBVXIxezLGysJHfJwYy21q/k1r2mKrd
	ZbeugMPjsaJyb7GSJwzKULzWetKy4XsBihQe978hTX9pXkLivNzZgHLdln2jAYhE
	npXbcai8bhJbsiINSD69ft2IFOzk+euR9eQAHkvFaUaLZVhamNjwC/cOWssH/Ii/
	CiN6Cg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8em8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Thu, 16 Oct 2025 02:01:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33ba91f1660so310123a91.1
        for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 19:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760580116; x=1761184916;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k4GrjthokzpfV3NB+jVI7qiQ1VZwJxFM9jmJgqFonaY=;
        b=VShbH3r63YbE84yp2047WEsFagHBpUVuNHRcABWKojcZGimYwnDmNLlfBVVVgy7qb2
         AfM8uOO8KriLTbBI28Mv0JNvTpDyPtDuUyYlO65I5f/BZ/7O0vn5mzswMcPIQ5MFsdRZ
         JOAI3ZVNTMsapcK5coBBJILD668bzIb5HSjlZ4I28a6XqEZuIvgFJI6EOE7aOwRRdc+E
         AbZkqZRh8Qe/kQeaRr7Xx0UT5oxaHGEBQFnmdXmL4M62IUqhLR7G9c51rYKnp72rhiJk
         6rl9T5JMNSOXS4aHZVuc+fqvSFVVOWoBYcpssOzeuBQHDufFXwS4odDU2VYWhGTpdMi3
         9LWA==
X-Gm-Message-State: AOJu0YygVsAAmr1UyK4TjFsPdmAup9ocDxHIiwu2g365AXqE3PaQwkRr
	fAayiaPP+PU6LgsFX28pD/hPeILp7iCVfyGgG0Fx9TFSWZEETdUPz+hg99zlmCcvHGO6fyNZwFn
	V7gW8EGIolwLNUEM1wvZ5NU5MzxBSJfFwP8MpEfjxgmzJezyuw9k+eZpzZ70GLmCzjQ==
X-Gm-Gg: ASbGnct1Bk8JLJuZYngCfkIXnnVGeI1e1YLRkYbowyJo77ilTR+VYOemL7oHdQiGQua
	24IXiLdgzASVXvyXdU6GRMxdDYAR6KVoU4dCU5PKbKPLnpTj9fDKGmZuO7hqrALWsdrjwjAp5TY
	5GIrdNWxNGzSoBoUWvbnvYCOcMrm4HXg5sE49q5s4Oxq5ZoI81m0eJ9l0IKbj/cr731uqsi8Ens
	2fVLM+eIQkE+cQ3cEe4mX/ipsGA5bGLysMIl2uxIasaXDyvrAc8ZMA9SVseECPD7E7v56dDJviQ
	QDwXBGS9LmWZvd00mLBHr+qHfX8dhKf2uhJFB1YkmmSWEdlF/DBFxSVF29SeoEshC1b4vNElIvT
	yIExV5NFoTGFt68SxU7yjV1xofHRdZSzaQepap54fAFHrPVgoCqs5Xl/P572UNsjPOg/jPHM=
X-Received: by 2002:a17:90b:17c2:b0:327:734a:ae7a with SMTP id 98e67ed59e1d1-33b5114ac35mr45958458a91.11.1760580116213;
        Wed, 15 Oct 2025 19:01:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWVYvmEDzBuW8u69AvWwe6XINE0/1Tv/gUO4QvhGqoFqfVxgghQxKpegnYo4snoGk9Y9sHxw==
X-Received: by 2002:a17:90b:17c2:b0:327:734a:ae7a with SMTP id 98e67ed59e1d1-33b5114ac35mr45958420a91.11.1760580115690;
        Wed, 15 Oct 2025 19:01:55 -0700 (PDT)
Received: from [10.133.33.11] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61b0dd26sm21392512a91.22.2025.10.15.19.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 19:01:55 -0700 (PDT)
Message-ID: <fe63bbbf-3833-477e-a820-d41e621e6a41@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 10:01:52 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wifi: ath10k: avoid unnecessary wait for service ready message
To: Andreas Tobler <andreas.tobler@onway.ch>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev
References: <03727147-0115-4ce9-b68d-756c6e41db94@onway.ch>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <03727147-0115-4ce9-b68d-756c6e41db94@onway.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K12CAILlMCII3NbQnUU30fRNJ7IPmHaF
X-Proofpoint-ORIG-GUID: K12CAILlMCII3NbQnUU30fRNJ7IPmHaF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX6c/7wWBStgJT
 tMOtgTFyjK8opNcnHxDcWSXPGOKTm4VmFrgWe3Js3ujm6atHoNRGXPaA8G/R6P3Lp5zmwF3qllr
 uprJV9QZhcuRggE8nsALcHLfgkgjOQOu/SKB2v5AbYqnP6Cz4RNz411ozMzfHMcYS6gab4rUGlo
 fMLjFKvmO6bGJUP7XEKzTXLaGAsfXbzSdfIwuHiVQIa4Vjw2bAPDOVQ6+nlwqeiEXYHWXd6tXHI
 7QdjwoQx6MarpyGhbnCwM3KoSBnO4LFM0rNBOm0QMzRwWu4+qRhocH1EUZkyH7xoeeuWiUbpctw
 9eSLlS0L8khKhPyk5W1p59my7ftM/xanhQcC6q7hk229u7VxYZjy1KGT7Aw5KN9x1QRDj0Ksm6X
 2Yt3Tdh+tOs9dZe5bxTxrzqHBHaFZA==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f05215 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=oC5KwCwwnPi90cocTB0A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017



On 10/16/2025 4:10 AM, Andreas Tobler wrote:
> Dear all,
> 
> this commit (Upstream commit 51a73f1b2e56b0324b4a3bb8cebc4221b5be4c7) makes our WLE600
> Compex wifi cards (qca988x based) unusable. Reverting the commit brings the wifi card back.
> 
> This was discovered on the v6.12.53 from today.
> 
> ath10k messages excerpt:
> --------------
> Oct 15 22:00:13 klog: ath10k_pci 0000:05:00.0: pci irq msi oper_irq_mode 2 irq_mode 0
> reset_mode 0
> Oct 15 22:00:13 klog: ath10k_pci 0000:05:00.0: qca988x hw2.0 target 0x4100016c chip_id
> 0x043222ff sub 0000:0000
> Oct 15 22:00:13 klog: ath10k_pci 0000:05:00.0: kconfig debug 0 debugfs 0 tracing 0 dfs 1
> testmode 0
> Oct 15 22:00:13 klog: ath10k_pci 0000:05:00.0: firmware ver 10.2.4-1.0-00047 api 5
> features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 35bd9258
> Oct 15 22:00:13 klog: ath10k_pci 0000:05:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
> Oct 15 22:00:20 klog: ath10k_pci 0000:05:00.0: wmi unified ready event not received
> Oct 15 22:00:21 klog: ath10k_pci 0000:05:00.0: could not init core (-110)
> Oct 15 22:00:21 klog: ath10k_pci 0000:05:00.0: could not probe fw (-110)
> --------------
> 
> Beside reverting, how can we help fixing this?

Thank you Andreas for the report.

If this 100% repro?

Can you try just ignore the err and see what we get? I am suspecting we are missing the
interrupt for unified ready message.

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6f78f1752cd6..cf4cc44d0a1e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -3217,7 +3217,6 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
        status = ath10k_wmi_wait_for_unified_ready(ar);
        if (status) {
                ath10k_err(ar, "wmi unified ready event not received\n");
-               goto err_hif_stop;
        }

        status = ath10k_core_compat_services(ar);


Anyway, please help collect verbose ath10k log, you may enable verbose log by

	modprobe ath10k_core debug_mask=0xffffffff
	modprobe ath10k_pci

> Thanks & regards,
> Andreas

