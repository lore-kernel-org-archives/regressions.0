Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694AF37F8B6
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812180; cv=none; b=FtCxF51sX+Nta/CMj0ThBct8glwN6WhS3RMxXJfA/NAhu1W/ym3WDb05UDOVL29Sqb3QfClxcW7Gl/pv3owvfEL8MjqSX05eQjFxMoRudD5jMUlw14TcUl4x3nsE7OpIUSeH4PyxjFrorN2S0PawMv+P3XHam9mhmaB9XUHJQ40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812180; c=relaxed/simple;
	bh=wZLW2XdypAhHvwo+GHAiZC6sjIcx7C3BCwY22tUge+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CRuChZFiUq9eXXZSxA4DgL36ipgaS/ufIHpzbIqcqaUtAzr9s+yL84nfack1WxglrvXq0NJT2nwCwm8M7FkyY93DlVugC3y9q1F9wxhjCt85Z+VURPHj94Ttpgf8Uf5q4F2NNZH1Lq4nRIzjAPIa9HiOWqdyLlq0hp2ldcL+68E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWTnGaxX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F1DnzLcO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YWTnGaxX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F1DnzLcO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0AS9802084
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 13:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mX36Oh0ldjKH64bRULghbP9zkZHVCst58P7qBcvJdOc=; b=YWTnGaxXDF7dV0Xz
	fJ5z0RlKpai35YN/BfCDko0TuA8fMf5HQtijMWL+Lh8mhNWnzkF6aJB+y7aw2pCU
	HguhYficpp5M4Ef3UGOfu4z9o0PlpTOAL3RfJuTGMvwOhJf8QWCmSgLF/6aiDiGt
	wjaCvUhAhsN77vShkA77lIDQTuLB0HjPmlHZ2cfdlJ5f6n8q+SkXibBg0er3bTNI
	0hxNbdsENvG/1sIek8XxLio3dVfJHTaq4WxdppLcFiSpbUhaVvOyrZzX9UQ2H4SZ
	Kxl9ow01N54pH3b5BUSaHB05JR0jYf5KtOz/uRTVp50F1XJnKpGjsbfJ7Lz9bl0W
	TzMekw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcrwr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 13:36:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-919879b09b7so49748846d6.3
        for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 06:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791812177; x=1792416977; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mX36Oh0ldjKH64bRULghbP9zkZHVCst58P7qBcvJdOc=;
        b=F1DnzLcOIIPLRFaP2kIWCb/3dnlD1aZJkWVoGvFJ3EkuY44Gu4DM3jH8K0+epvfsbD
         Dut3Iad84H75wGH+EbFwNMmhmOUY/yvw0XHqfsEKoccUh2UrRsRLCYS8R7PLYuzbpu2C
         B3GzzARC8A6Q21fPaYifjCdyY8d5lmZWdLgeaVKvaEojt6pYBV6FDNXJ/Dcrx/lv2zxM
         kWVkZpoKjzTPfy8KFfy1ctt1Oda5HPezbREjqNpGm3vJTSsR8a0mOVHE1SNnvql3AJsY
         cwRLb58Vhxrcn03/e/nQWAp2OcortT7ZFg+DWruP2Do3Su+UZbtYwxqbTpP2qHJFGILO
         6kqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812177; x=1792416977;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mX36Oh0ldjKH64bRULghbP9zkZHVCst58P7qBcvJdOc=;
        b=bmaFPPanrNaJYQsRDHLQBXdxZSSqcOw6IU7l+SirFTo7J/joSFwEt/loVi+2McXhRf
         icRVkzsuZ4YJnZ1U3Octvaha5rXZBVoxZNac/OxqwFaYA3qzSagcCYzPkAvmqFPYTz4Y
         z7FkdVbqnXC9rBGjfuytKTd2EYjVow8TNiyy+Dc4VBqE4WeZELzvbTLOA+GzzWdKFWMB
         eViRNfGP7/25UIsX3ZlCAR1FI5+f2iUKdihvQaVbpgIrKewvk3egsmf+9Lw/f2qmSnUt
         deWHtt8lKbQT8Bu5EKO2mX2FRZeRM8g/wXXvm0rhNgElw+Q0N+LQRnoE7gg7Q4XQp7O0
         xONA==
X-Forwarded-Encrypted: i=1; AKwUvBwL33H9TKKwnsv6eM1wIeUI7EoFgL/ZfmAx4QW41OXoVY4+yi28kAhqXfmvTqZVPWFe/8u67wcG4cFFvA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLd8Li0cwCme0tF1EbZtJNrIfxzyQ7LINUx5dNxfDgGYgqvXe8y
	3kpKRsWHwsp/tgwttsazZd+XUDjZk/wdI+pLjmQXeXye8Z+AuaPNNyqgWp01KMkuxcNGwORQjxJ
	lBj5svFSlHJ0rN2esA7RBX0sunRWUtvkpSXvPEv/u140G9VZL9WsLUQCq1OQ7DWcpBA==
X-Gm-Gg: AYBFou2yARxUoNgO03oximu4qltyTB+4bBIh2+8U1yJbQnLEt3XuudBNFlTK2RLgFrV
	bQ3kJHOSCxUcPWV5005e2jR7VKCAGHGKrNSjl9JcxahnhszC0/mi76FdyHc14eSUbk6zr0FzL+E
	2cwHj2owLxlBV2Td6oxqHpeG5PjAYbZlcHbu6cSP66SBa7M3ZwLTVmJeRED/ay+LKIH4l6Ug2al
	n6VVLPQetRSZAe58ZcWln+ZVX+KKjz27oJbhSVRBUMthcTJEFMPiUus1FvmZ3Ml8zczEq+jfyW+
	ByT5/H8K6kpm6UzvCTnDwEbtSdgvIIYfUoG+aMgTBdP/oShjVwYO97RrqNwgxsEZKYo4gUIsqxC
	d9z2gcZR5ys27M1meYwGYHcs+2Go=
X-Received: by 2002:a05:620a:17a3:b0:93e:84e5:3c66 with SMTP id af79cd13be357-93ebd21ffd0mr1649957985a.40.1791812177579;
        Mon, 12 Oct 2026 06:36:17 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93e:84e5:3c66 with SMTP id af79cd13be357-93ebd21ffd0mr1649950785a.40.1791812176979;
        Mon, 12 Oct 2026 06:36:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm121124535e9.2.2026.10.12.06.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:36:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Fran=C3=A7ois=20Roux?= <franzelfranzel@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, regressions@lists.linux.dev,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] power: sequencing: qcom-wcn: power off WLAN at probe
Date: Mon, 12 Oct 2026 15:36:13 +0200
Message-ID: <179181217126.5143.7104145391205542787.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261004165124.4277-1-franzelfranzel@gmail.com>
References: <20261004165124.4277-1-franzelfranzel@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JkeczeKkCxSP1hRBF9zWHAneeFLY4p0K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NCBTYWx0ZWRfX77M4/AtSIa+8
 N1oHuWCWyoGaMT/nIun0FhuELRAaNtxqjXtFp7VuLcTpdjdo7PrdXTy3FXLZ4ZObOUMekt01ZOB
 xggXY5YiZF/vkFHxRbAnwFzeOCvktbA=
X-Proofpoint-ORIG-GUID: JkeczeKkCxSP1hRBF9zWHAneeFLY4p0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NCBTYWx0ZWRfX7fONY3VLdbJl
 xx/r8THilUB2xDabAJaoC1R7udUAA6AWF4xHijadAEakA8r+KeRdj7beeo3CMNJXm6abB/+VA7d
 LMLZA3SZrm9ual9Az4DRL2jEaC0M3l2RdkZqoCfWSiRlu/SiMRRTQNeO3GS4TYoer0PGCmBcyPF
 B0LNl4z1/bofkHIkJqnDXg6qmROlW1BOSLG52krpFGrXCX4hdfJYSidD8ea3IIHKzq+V96zWW0O
 AcgFkffD0fy2oItc7Y2mzVdqzv7cGKef5zhXrN5ZSA5JDLQKeKD2aOQIqB/y9TH8pyYLJfZ3QTW
 Q+jmq4ZOirRPyvM6E7+E5/ag5wzf1M39O4TDRDGphkAZ6sDHYARyfsqGeq82R1yIsJs+Me/hwkd
 dhGw6zPPFFYizWMOxmcSUG1UTwu+M0gKLAPg/5zxEKvRvzlLB8JN8hZw82QViEqeZG/oHSyTHvY
 EfPgwefiIup5GZ52k8Q==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acce252 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R6-RoArAaa4DRIP8ZZgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120054


On Sun, 04 Oct 2026 18:51:24 +0200, François Roux wrote:
> The WLAN enable GPIO is requested with GPIOD_ASIS and then kept at its
> current level, so that a WLAN module left powered on by the firmware is
> not switched off. The FIXME explains why: toggling it would take the
> PCIe link down, and the controller driver could not recover from that.
> 
> That reasoning held while the PCIe link was trained before the
> sequencer probed. Since commit b921aa3f8dec ("PCI/pwrctrl: Switch to
> pwrctrl create, power on/off, destroy APIs"), qcom_pcie_host_init()
> powers the endpoint through pwrctrl before it starts link training, and
> defers until the pwrctrl driver is bound. That driver cannot bind
> before this sequencer has probed. Power-on therefore always comes
> before link training, and keeping the firmware state is now harmful.
> 
> [...]

Applied, thanks!

[1/1] power: sequencing: qcom-wcn: power off WLAN at probe
      https://git.kernel.org/brgl/c/dbd674ccf30f66f5eccf637964a93910df8dbf84

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
