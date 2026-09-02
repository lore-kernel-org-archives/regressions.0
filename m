Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3004AA41A
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366332; cv=none; b=lg3Mms8ED2Y6WORxv0/gGXoLlooyepXFi1IJyJajDh/l6/teg1NMsH6L8MtYxwWopsejMzJZluPO+kg3hzk7Hv1LxxLkPUDUxO7xYbHtdBwyAWi/R/tNftodwFrfCcL0xsfmxTxKER+HaSkAswjigCYrI2QPqxx0lzWGKYIPjvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366332; c=relaxed/simple;
	bh=qXq2bOvTf7o4sUYP639ubvxv7ythX6GpXy1EZ/ecsVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvRsfto4Kyk30I595r6ADinAc/mfVLuQu87cxcgoZBIi4Pw/ufEQt956rKr73PbryniQa+kV9ErKKA9HdwxJKwiqqlP9uGZQ3fesTafpdwK+Z8tKpeXXodvZQ/b8X6erZZdzyFWC/c+kncEMekMmQNoRbIEbMeyX58oqcLCqSVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZYT8mibH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e294sZh3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZYT8mibH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e294sZh3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZFAR2670668
	for <regressions@lists.linux.dev>; Wed, 2 Sep 2026 16:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vll2VNtgeq6WEC1OJPy99NAYbaOgldOffi/qKXQ4WPU=; b=ZYT8mibHzIlUNHys
	azPpKyPOYqQUgT2AsSJ/6SiwPkSaxF1AB2D6yu/Ey++VnqPqmSOpoUPCtOi6YLsv
	eJa3jLMmBmE7lTT1Dk5RYd3zgbMBtIVd/8wVdfke4HchwKvGye2tX9/ECJD+On7h
	4uJe0WGCQjx0kXru4f1v+gtI+DBOiVPQIpiqcXjm0bYE5zp2e/yG8874tmiCzEMC
	VsH+HM5Ntx913lytuEcEe3JGHH7OBbTtaOVdJ5CsMJx8l7YZIrJxLVxR06I3W8/H
	slydq98bv2PUg85lQQ9M9/rPqNuWcY8Ccd5s4i/HcpzuPyK2Tsrb5B2WnpAKKmbG
	qX/QnA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx2wgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Wed, 02 Sep 2026 16:25:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39906175917so1753103a91.2
        for <regressions@lists.linux.dev>; Wed, 02 Sep 2026 09:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366329; x=1788971129; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vll2VNtgeq6WEC1OJPy99NAYbaOgldOffi/qKXQ4WPU=;
        b=e294sZh3oXbUUPhF1VtnOeJJad/YRQtUCQlCgrlVPpqOFy1quKuMsvVm11qdZFJVaC
         tXnNscW5AnbM2lNMo7ONNeDqnLZdv9R5/aIIQjQ4kAZS4K8MZGjqQbIS75LFYHYPeoCT
         HqKO1GgSSgs3WgHyTq60cOk0LjyxKRg3R5NmxWYa78fzWMn2T022Jt/VR9TsUlYGz8dP
         BhzuishrU9FgAnMBUwvK0AiQvM9mNtSVZo0XXh+8cV4u9z6zwDl9eXwuLCmLfrS3KjUB
         pB2EIXSWCNosTVozIpQHwPuEmLGrHhrQiXZyh/A4/MlgIasZoAi6E/B5GUxxbPzUhTBQ
         YhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366329; x=1788971129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vll2VNtgeq6WEC1OJPy99NAYbaOgldOffi/qKXQ4WPU=;
        b=cG1FpvSNZvTYs55ce9nTAekozfoLzZJbJ+4PL9y3M8ZUMLgfYdpP5U9LsOYpMLTkM5
         GtRHiSpXuSmthTl2A8XO7uLZgPDCFC/HenJEf8d6rrDsP2hpkBXdOKBEd1cXbs298d8b
         t8P2e2jE1E19m17KKq9x1qRTcjg+q+xE1V/Md0PUFFXbEXHr+6yAsLy6L9gcUWfmXNmM
         tf38J6KglxX+rlrX+bBpWvReA3Lx4EieFN432I6Y2qtoLvGyQix+ZirNcVvmmY3RmN5B
         UOMlG/0QVKy47XPw+eyeqE0+mmHxwzMs9GYvSBYSkxYsnISbJ2HePN8jguX2kAk0/qJu
         k/Aw==
X-Forwarded-Encrypted: i=1; AKwUvBz2Yn9o6NyP4ls+ZnmpJsY0Gc1+ryc1cl22qVscDtRZUPtJIAIYgO6acmzBUKTBSzI4pwauDYQsqWimCQ==@lists.linux.dev
X-Gm-Message-State: AFuF++ltkTOolu2hzsPCz/iuoTxepSmEsFG6EDkZC9GA+qac87/A/yJU
	1zC0EmA7IdeaZXqvB9OX1rAfpenYDyRGKBVSB19LY3A/4C5wdw7rNo4zjX1fbsZSnKxW5mG2sTo
	XroLM77Wpd1nHeBsDeAZExli3srrXhSo8tGLP1y/C4F8ucb2717XDUVI/BRALHxyZ0g==
X-Gm-Gg: AYBFou0KNl6TnIm20S7A5KR6rKeFOMhxLH3gNkppZ854UzVfFScuqslcKz92cf/gK9V
	N5zbawhBAUmZ+HbegfAMUJ06VcbiQLh+e6MH86bz2eml/a05QhpJ+SbtjXxO4IiYCESBl8uny6i
	2qdikA7daylVKalkJij2FZ5FEo4pxn4h6geXwpdbl82kuvBO+F5WHH7+Wh0hBXxdBtyHYxRDPTE
	uCKceFnBsS84b4WniRz+8mqv3JLSH1/IPhRU0LIFpIk8y2w1zEwFEyDT9E1xdjqdnMxoNpw3iL1
	rPghsKwDIGJh5zD7+kuW5n/Mj1DM1R0s9KQG5dCc9b+MYPR+siRPiw+o4E7JbwpqYdQ2HQ4JZY+
	SN0X/nbMZCGOYuIeJfuw5nsEaKnx/sti+Ci0=
X-Received: by 2002:a17:90b:1b47:b0:398:e6b6:acc2 with SMTP id 98e67ed59e1d1-39aee084eddmr8495112a91.12.1788366329131;
        Wed, 02 Sep 2026 09:25:29 -0700 (PDT)
X-Received: by 2002:a17:90b:1b47:b0:398:e6b6:acc2 with SMTP id 98e67ed59e1d1-39aee084eddmr8494493a91.12.1788366326062;
        Wed, 02 Sep 2026 09:25:26 -0700 (PDT)
Received: from [192.168.29.63] ([49.43.230.111])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f077fad2dsm8300330eec.0.2026.09.02.09.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:25:25 -0700 (PDT)
Message-ID: <8c882adb-a83f-414a-9fe4-b8f270533df7@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 21:55:16 +0530
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] PCIe/qcom: on-board WCN7850 link stuck in Polling on
 X1E80100 (Surface Pro 11)
To: Thorsten Leemhuis <regressions@leemhuis.info>,
        franzelverbier <info@humanlearning.ch>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof Wilczynski <kwilczynski@kernel.org>,
        Rob Herring
 <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        regressions@lists.linux.dev, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260731122233.18345-1-info@humanlearning.ch>
 <qgol7nv7vrhdwt6sofbxip3dat3kag4xgoamgp6li25rkbn4oa@ie5dhaswmxbt>
 <f64db45c-63f7-4f2e-aa10-e8ee5fd9accb@leemhuis.info>
 <0c287133-e866-42db-943f-d6750bc14b44@leemhuis.info>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <0c287133-e866-42db-943f-d6750bc14b44@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Z3R3Hq0dAVW-rqdqN2ePEUm0zTQYcEbr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NCBTYWx0ZWRfX2iBmNHQcZjwA
 DyB8y8pty+lJTQ28Bw0Lc12PcN3PHc770K/srH/qni6ZL5FjpvSSUGf6XV9EEVOPqrB7YKXBE9a
 DBeNuW9bWN7XyxIgiWkaRV7QTfD7WP+47y55LJOhngIkdsbg2PYfv5ynjj7G9yCWOdKUd4f2Pm8
 VYaSESfKc3Xf1NKwjPUPovHhrKq3nONPNCx1fXjzbW428E/qv8NSwZ0CcZuBGs9d/vzJTocfAtT
 hKUgyggh2IFs2MShoJ3239WKEiS5UQi+OdxnvRo+LbL4uKBRyWwYfBnVTOSwH0P25cN9/2E2IYX
 qO/tEHnUTucN/9qGIkp/kWWSNJjcbNLnx62S7PtaN4ppsLub6aVJ4+4UJk3B0xeeEgtFJ6ptxDw
 wd4MvFPFzT3PeLXQVTlvs8psQJrEXtJqntCxecb22PSfqnfUJq33g6q2YQvH7weoMjuDzk4jzSx
 BqsI+32x5a87kJbSWiQ==
X-Proofpoint-GUID: Z3R3Hq0dAVW-rqdqN2ePEUm0zTQYcEbr
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a984df9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nmlP1JGDO1WHMdNil6E2Tw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=MC_tZzTHk6VszvnzAm0A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NCBTYWx0ZWRfXxeZb24WNkV5H
 21YEDf3gUEMYXMfpYllmLeMVrqBFMFC8hIJ3v4tnyLxqVkL/foZo0IVb77WAmHuAtAk8AOYbl9k
 nYeBTTGJJXhVfeexMy53ApfcUu2vmTI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020144



On 9/2/2026 9:30 PM, Thorsten Leemhuis wrote:
> On 8/24/26 14:46, Thorsten Leemhuis wrote:
>> On 8/18/26 13:13, Manivannan Sadhasivam wrote:
>>> + Krishna
>> Hmm, nothing happened here. Or did it and I just missed it?
>>
>> Krishna, it seemed Mani thought you might haven an idea what's wrong. Do
>> you do by chance?
> That did help afaics. Happens.
Sorry, for very late reply here. I totally missed this.
>> If not, I guess Franzelverbier might need to bisect this.
> Franzelverbier: looks like we are stuck here. So I guess this is
> unlikely to go anywhere unless you git bisect this (after verifying if
> the problem sill happens with latest mainline/-next).
>
> Ciao, Thorsten
>>> On Fri, Jul 31, 2026 at 02:22:25PM +0200, franzelverbier wrote:
>>>> Hi,
>>>>
>>>> On a Microsoft Surface Pro 11 (Snapdragon X Elite, X1E80100, board
>>>> x1e80100-microsoft-denali-oled), the on-board WCN7850 Wi-Fi PCIe link
>>>> no longer trains on linux-next. It works on 6.17.
>>>>
>>>>   Good: v6.17
>>>>   Bad:  next-20260721, next-20260723
>>>>
>>>> #regzbot introduced: v6.17..next-20260721
>>>> #regzbot title: PCIe/qcom: WCN7850 link stuck in Polling on X1E80100
>>>>
>>>> The device sits behind PCIe controller 1c08000.pci (pcie4,
>>>> qcom,pcie-x1e80100, gen3x2) and has no PERST# GPIO -- it is
>>>> power-sequenced via wcn7850-pmu / pwrseq.
>>>>
>>>> Symptom
>>>> =======
>>>>
>>>>   qcom-pcie 1c08000.pci: Device found, but not active
>>>>   qcom-pcie 1c08000.pci: PCI host bridge to bus 0004:00
>>>>
>>>> dw_pcie_wait_for_link() finds the LTSSM in POLL_ACTIVE/POLL_COMPLIANCE
>>>> and returns -EIO. The endpoint 0004:01:00.0 is never enumerated, ath12k
>>>> never probes, and there is no wlan interface. On 6.17 the same
>>>> controller trains at ~0.6 s and ath12k probes normally.
>>>>
>>>> Ruled out: the chip is powered, and power control is bound
>>>> ==========================================================
>>>>
>>>> - Bluetooth on the same WCN7850 (UART) comes up fine, so the PMU and
>>>>   regulators are on.
>>>>
>>>> - pwrseq_qcom_wcn is loaded, and pci-pwrctrl-pwrseq is bound to the
>>>>   platform device 1c08000.pci:pcie@0:wifi@0 (compatible pci17cb,1107 is
>>>>   present in pwrseq_pwrctrl_of_match[]). The vddaon-supply
>>>>   validate_device() check passes.
>>>>
>>>> Ruled out: not a device-tree regression
>>>> =======================================
>>>>
>>>> The wifi@0, &pcie4 and &pcie4_phy nodes are equivalent between the 6.17
>>>> and 7.2 device trees -- same supplies, same compatibles. The only
>>>> difference in wifi@0 is "disable-rfkill;" (6.17), which is
>>>> post-enumeration ath12k behaviour and cannot affect link training.
>>>>
>>>> What changed
>>>> ============
>>>>
>>>> qcom_pcie_host_init() was reworked around the pci-pwrctrl framework,
>>>> and qcom_pcie_start_link() now calls qcom_pcie_common_set_equalization()
>>>> -- absent in 6.17 -- before enabling the LTSSM.
>>>>
>>>> Finding 1: Gen3 equalization prevents link training
>>>> ===================================================
>>>>
>>>> Forcing the port to Gen1 makes the link train and ath12k probe:
>>>>
>>>>   &pcie4 { max-link-speed = <1>; status = "okay"; };
>>>>
>>>>   qcom-pcie 1c08000.pci: PCIe Gen.1 x2 link up
>>>>   ath12k_wifi7_pci 0004:01:00.0: Wi-Fi 7 Hardware name: wcn7850 hw2.0
>>>>
>>>> qcom_pcie_common_set_equalization() only programs GEN3_EQ_* for speeds
>>>>> = 8GT, so max-link-speed=<1> skips it entirely, reproducing the 6.17
>>>> behaviour of no EQ programming.
>>>>
>>>> Note this is not a wrong preset value. The presets come from DT via
>>>> of_pci_get_equalization_presets() and are applied by the DWC host core.
>>>> In hamoa.dtsi:
>>>>
>>>>   pcie4  (pci@1c08000, gen3x2, on-board WCN7850)
>>>>     eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
>>>>
>>>>   pcie6a (pci@1bf8000, NVMe, gen4x4)
>>>>     eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
>>>>
>>>> Both use the same per-lane preset 0x5555. The NVMe port trains at Gen4
>>>> fine; only the WCN7850 port fails. So the WCN7850 endpoint specifically
>>>> cannot complete Gen3 equalization with these presets on this
>>>> controller, while an NVMe SSD on the same SoC can.
>>>>
>>>> The board DTS (x1-microsoft-denali.dtsi, also in mainline) leaves
>>>> &pcie4 as status = "okay" with no per-port override, so it inherits the
>>>> SoC preset.
>>>>
>>>> Finding 2: an LTSSM re-kick does not recover the link
>>>> =====================================================
>>>>
>>>> Even at Gen1, the link does not train on the first attempt at boot
>>>> (~4 s); in one instance it only came up much later via a pciehp slot
>>>> event. An experimental retry in qcom_pcie_start_link() toggling
>>>> PARF_LTSSM.LTSSM_EN (clear/set) for up to 30 s never recovered the
>>>> link.
>>>>
>>>> That suggests the endpoint needs a full power/reset re-sequence
>>>> (pwrseq) to leave the failed state, not just an LTSSM restart -- i.e.
>>>> the pwrseq power-on may be racing link bring-up at boot for PERST-less
>>>> on-board devices.
>>>>
>>>> When the link does come up late (fragmented CMA, tight PCI windows),
>>>> secondary symptoms appear that are absent on a clean boot-time
>>>> bring-up:
>>>>
>>>>   ath12k ... qmi dma allocation failed
>>>>   BAR 0 ... failed to assign
>>>>   rfkill ... Hard blocked: yes
>>>>
>>>> Questions
>>>> =========
>>>>
>>>> 1. Are the qcom_pcie_common_set_equalization() Gen3 EQ presets expected
>>>>    to be safe for a gen3x2 PHY driving an on-board WCN7850? They
>>>>    prevent link training here, and skipping them (Gen1) works.
equalization settings are applicable from gen3 onwards and can change from
platform to platform, the EQ presets values
depends on the pcie trace length, May be in your platform there are different
presets programmed by OEM.
Can you remove the eq-presets-8gts from the pcie controller node once and try
if that solving the issue.
>>>>
>>>> 2. Is pci-pwrctrl/pwrseq power-on racing link training at boot for
>>>>    on-board devices with no PERST# GPIO, such that the endpoint is not
>>>>    ready on the first LTSSM attempt and cannot be recovered by an LTSSM
>>>>    re-kick?
The pci pwrctrl/pwrseq are enabling power to the endpoints before controller
starts link training.
So there will not be any race conditions here.

wifi devices has some limitation in gen1 and some times it takes time to link
up. if there is delay
in the link training pci sw starts enumerating and it detects root only at
that time, as the bridge is not
plug capable pci sw will not allocate sufficient bar memory for the endpoint
that gets detected little
late. Due to that you might see bar allocation issue.

I would suggest try to link up in gen 2 by using max-link-speed = <2> instead
of gen 1 here.

- Krishna Chaitanya.
>>>> I have not bisected to a single commit yet -- the range above is v6.17
>>>> to next-20260721. I am happy to bisect, test patches, or dump any
>>>> register on this hardware; rebuilding is a short loop here.
>>>>
>>>> Environment
>>>> ===========
>>>>
>>>> linux-next next-20260723, CONFIG_PCIE_QCOM=y, CONFIG_CMA_SIZE_MBYTES=128,
>>>> ath12k, board x1e80100-microsoft-denali-oled, Arch Linux ARM (aarch64).
>>>>
>>>> Thanks,
>>>> franzelverbier
>>

