Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3909F2FF64D
	for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 08:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761120028; cv=none; b=CC8fxACCAdv6ir3chLfVH0PCRKlL7njTQrnth1aFP9/EDE3ngTwu91BF+OVRz0nyNnHcaYM3ibn2IX1nZa8/PZD0/u+UcnD1zCXDHrcDZQRXUFIkoxrp0m/Ycsj84olr2awiody6918jiSjE6EBF5GpH6YoxzaQ4axrxtHL1/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761120028; c=relaxed/simple;
	bh=L6JYs4ivoCFvVciQgaMIR/lmHduqqGaaz0VtISeqwJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQJliuGEK+Z5tvxTkrPMIuymGY5RSg1CWULCk8udauoPlG/zFkaEJLaz+OS//cO7L9jvRQEvQMsZI+ReLNjuVLMfFy/0jlHXt+20KtctjtUnLu6gRQkQCpN9isZy1K3ti3zzjBDvZOwJAo2bqPtzf77tIC/guUObTZJo55Hacp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQ+WIKNp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQ+WIKNp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2RLws018585
	for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 08:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XYXVFaAaMLwr6fG2n4FdstC9bqlVQImA3Ymx6v8/8mI=; b=nQ+WIKNppkakuGoq
	HNCN57+udiDo9ZKqUV2gpSbuppm2Gs7W6lfqPcebpF21aUqbzMPsxh399Vr7Q/XM
	+u0aLJxhQa68vIJ1qmxla0JukMwXMSzCeKWxTPnWAU8H9khPMG2V7/Skixpdyybc
	NqdB05mXyKXpFkC8eD+BrMiEtXBDueQQkDwnOM6JS8G4OclIQCL+mf+QEwwF+luJ
	//eNrKanvzCpAyKY2bzUhgYg5+T+GFcNuYh4yVRSc2mibI4hvwMVag0wNq+Qwq98
	IZs3U8YVfxfeexExDzk6fIGJYWDdpgNHWs+hkU4G/0ucAYVTOm2kc4k9IpghZlSp
	8y9QCQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469kr1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 08:00:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso12709745b3a.0
        for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 01:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120025; x=1761724825;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYXVFaAaMLwr6fG2n4FdstC9bqlVQImA3Ymx6v8/8mI=;
        b=aaQH0VVdAgh3aKtC15k5Hs4aqwcY95pokwRws1KZs421O2h8V9WnU7idTSExEpUBqJ
         s0ncPgpRKdOxgangXQf+mZn0/RbeAGAzIWheIXtXZs0qNIAuLeLgwOEh6eQC7PDiEExQ
         hviU6slhgzgX5mRmiyP/9pE/Olb1du04ILi45NWE9+vETPPzP5501QU23jYimUvIwafP
         zleUT8win0kutWy8eaDerOURrNTOqeRkff1sGWbXfzCYlxobH24vZbCoUCWEr3/Vfilo
         gBDxCAieDWE6xcaJ3i2vPC2I8xmAUiIXBHY0I2vQXqZ9vjcCLaXk/7dwVSRRKsos0GGN
         zuGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+YEdPHmOBZac7rB/+ohTAA7Reu6DuGzddE5dvYlccL5P031m5gngWKC7PIjgAlNjLt3b+qeECAMvVTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkbeYkddkS2ZpNleS/TlJVpna3bozZJDQdPnxhGkUFItBM7eEC
	oxVcWoEkgmUWzTdKMGEBx+qmSid9KfpjMnQhIjLVLazN3sXJ18cfjQp9Z44bu0OEEV+7kHkzKiw
	KFzVhEtVw8fbv2uUiGMUzsvwkAwkxPC/4118ylsMCksHZ8/QDWXd8piezw9AZ3SzKZg==
X-Gm-Gg: ASbGncvU9gxIFzJ9/KMUW0/uh48rtadrWK+XlzXc9BFhg8K6Jewmg2WfXIKnCotm/Nw
	eRvngQ/PO2SRoRsDtT9jtDapec/cHtLkhhYSBY6pE2MBL4+F9PJgguuXlDYbGyLXyhd9fUnTQrL
	ZXEt/rVf2yQSomc7+P3livPWx+u3gSMyTqzIZ3jxeXOVc2ATdsBfF4z3s2evDPbGG2r2H1a9B5s
	ZBV+94ZIWn8wVeAxu7UnibD5BoMq/SJOxxY6ghK9NgQ2e9VBev4CUp+/IIzdixk+7jfYx6rpThN
	uV7ZwfiCcS3UpXwXCnmtmyNlHGf7n5g/XWGkX5X7vvKVmX+FKML3r0ge8FHBazOEWtwE7KKKBw1
	rCns9LD1s8RawBFzq8Q04i8db8JuWy4QIMcTTkbY8ccfintMlbgxGRO0t9scZyANPpskRBVfX
X-Received: by 2002:a05:6a00:99b:b0:793:1955:2384 with SMTP id d2e1a72fcca58-7a220ada794mr29166886b3a.17.1761120025211;
        Wed, 22 Oct 2025 01:00:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVyRz86S4Hw9/gYeNtzxJUUmTcx16JDUBodGshnXBo7XeH/deuGV1Ia/yK2XgOqxc89Wmg0Q==
X-Received: by 2002:a05:6a00:99b:b0:793:1955:2384 with SMTP id d2e1a72fcca58-7a220ada794mr29166840b3a.17.1761120024635;
        Wed, 22 Oct 2025 01:00:24 -0700 (PDT)
Received: from [10.133.33.147] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230121ebfsm13617531b3a.70.2025.10.22.01.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 01:00:24 -0700 (PDT)
Message-ID: <5466e122-9143-482e-a9ab-7f956e19bf86@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 16:00:20 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ath10k fails initialization, bisected to "wifi:
 ath10k: avoid unnecessary wait for service ready message"
To: Klaus Kudielka <klaus.kudielka@gmail.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        regressions@lists.linux.dev
References: <20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
 <175823924851.3217488.17742065327824732992.b4-ty@oss.qualcomm.com>
 <6d41bc00602c33ffbf68781f563ff2e6c6915a3e.camel@gmail.com>
 <76d4235d-db4e-40f4-9ede-8cb536b82fbd@oss.qualcomm.com>
 <10919281648e306fd3f6713437b4793c50bb6692.camel@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <10919281648e306fd3f6713437b4793c50bb6692.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 44WBXBe1WIkBttTfKetwKl_WR6PUtZ78
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX3Xjeb8u/diD8
 5CXhW5yhOPwTgYhZ0A3fl6T5x6V9eewL7TjyIGl/XsKNmnM47p8GXnT/BWCHiZbxEPQbw0mn2l5
 sisvF+PAYyJ95W7fDp29vRmW5yOlOL5zJ+wUQ0+42tb28UbpIE3yDcYF9eoNLf1oMO8C32Eip/D
 4BRfGUNMG224IlgAQaHO9eyY6f8kvdFuOT+jHAR703JzGlto7NIQh7S3HlFHDMG2DSwR4aHjnji
 3myWKX/MClf5MIYi6mDSBEcHmXIifvVdH+pYI2h9mjiVKw2uaEFAuVtYLw7JG1iNaBwPCZIwr09
 anWUCIYK054i3LPeGfrQwhzKLWGxVbZhPAa6g3Ew1yUt5rJ1KPRPcqbxdy4e6trOd9Tr8r7A3CJ
 6iuBgOrFmRLpYOQb/4YtSMj0kdhrfg==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f88f1a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=PjCq7wsziC7u3JKYlTIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 44WBXBe1WIkBttTfKetwKl_WR6PUtZ78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032



On 10/18/2025 9:50 PM, Klaus Kudielka wrote:
> On Fri, 2025-10-17 at 08:57 -0700, Jeff Johnson wrote:
>> On 10/17/2025 8:37 AM, Klaus Kudielka wrote:
>>> Unfortunately, this particular commit completely breaks the ath10k driver in my setup.
>>>
>>>
>>> Hardware:
>>> - Turris Omnia (arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts)
>>> - Wifi card (output from lspci): Network controller: Qualcomm Atheros QCA986x/988x 802.11ac Wireless Network Adapter
>>
>> This issue was previously reported with that particular chipset.
>> This is currently being tracked at:
>> https://bugzilla.kernel.org/show_bug.cgi?id=220671
>>
>> It may be useful to supply your information as a separate record to that bug.
>>
>> /jeff
> 
> Some more observations on that topic with the hardware shown above.
> 
> ath10k_core_start() calls ath10k_wmi_wait_for_service_ready(), and later ath10k_wmi_wait_for_unified_ready().
> 
> The now *unconditional* call to ath10k_hif_send_complete_check() inside ath10k_wmi_wait_for_service_ready()
> makes the later call to ath10k_wmi_wait_for_unified_ready() fail.
> 
> If I call and handle wait_for_completion_timeout() first (as it was before the patch),
> ath10k_hif_send_complete_check() is *not* called, and both ath10k_wmi_wait_for_service_ready() and
> ath10k_wmi_wait_for_unified_ready() succeed. Everything is back to normal.
> 
> Side note:
> ath10k_wmi_wait_for_service_ready() succeeds in both cases with time_left == WMI_SERVICE_READY_TIMEOUT_HZ.
> 
> 
> #regzbot monitor: https://bugzilla.kernel.org/show_bug.cgi?id=220671

Thank you Klaus, can you please try if below diff can fix this regression?

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 7bbda46cfd93..1a981d333b5c 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1256,6 +1256,19 @@ void ath10k_ce_per_engine_service(struct ath10k *ar, unsigned int
ce_id)
 }
 EXPORT_SYMBOL(ath10k_ce_per_engine_service);

+void ath10k_ce_per_engine_check(struct ath10k *ar, unsigned int ce_id)
+{
+       struct ath10k_ce *ce = ath10k_ce_priv(ar);
+       struct ath10k_ce_pipe *ce_state = &ce->ce_states[ce_id];
+
+       if (ce_state->recv_cb)
+               ce_state->recv_cb(ce_state);
+
+       if (ce_state->send_cb)
+               ce_state->send_cb(ce_state);
+}
+EXPORT_SYMBOL(ath10k_ce_per_engine_check);
+
 /*
  * Handler for per-engine interrupts on ALL active CEs.
  * This is used in cases where the system is sharing a
diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
index 27367bd64e95..9923530e51eb 100644
--- a/drivers/net/wireless/ath/ath10k/ce.h
+++ b/drivers/net/wireless/ath/ath10k/ce.h
@@ -255,6 +255,7 @@ int ath10k_ce_cancel_send_next(struct ath10k_ce_pipe *ce_state,
 /*==================CE Interrupt Handlers====================*/
 void ath10k_ce_per_engine_service_any(struct ath10k *ar);
 void ath10k_ce_per_engine_service(struct ath10k *ar, unsigned int ce_id);
+void ath10k_ce_per_engine_check(struct ath10k *ar, unsigned int ce_id);
 void ath10k_ce_disable_interrupt(struct ath10k *ar, int ce_id);
 void ath10k_ce_disable_interrupts(struct ath10k *ar);
 void ath10k_ce_enable_interrupt(struct ath10k *ar, int ce_id);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 97b49bf4ad80..ce8e0c2fb975 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1812,7 +1812,7 @@ void ath10k_pci_hif_send_complete_check(struct ath10k *ar, u8 pipe,
                if (resources > (ar_pci->attr[pipe].src_nentries >> 1))
                        return;
        }
-       ath10k_ce_per_engine_service(ar, pipe);
+       ath10k_ce_per_engine_check(ar, pipe);
 }

 static void ath10k_pci_rx_retry_sync(struct ath10k *ar)



