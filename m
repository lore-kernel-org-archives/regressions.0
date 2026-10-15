Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36E526D4CA
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066621; cv=none; b=lVkGIrZ0SD16YrCaL99+4o1ykne8YuxWVALkl3GOT09dy7dsBu+Zk+NmQQfKGCp5rkFC5NpRnP2pAeNj/l/sCgb+YuN8sNF5OJ7frvyfjoqPW36PRUzAlFw6I6K8rnlZarlwFeCp8UQmWo995CtTQ5hkN+kPIl+zMX6X30xKXX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066621; c=relaxed/simple;
	bh=RoSelfqR+JFVG/SXKTvafXJAkj900s5jRJkiQxTyBi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVHcE6NvjpZld6yNVZPmiBpNHgXsG1grdpr/atVKwXkNeUIiNOApqPnTbcnWh1QzW2OrUyE2tQsTQrp+ifU3RzMBmx0TqppIekNBiHvIDG7RE34BJBDtK84MUOjNPzikTwWh5qhJkQQWEzaKtyDM3lUzdedLbtPd6HxxTiGfNKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M461zxc+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5ulLlH8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M461zxc+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5ulLlH8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jnvK3408842
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 12:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qeW+7v3cARPoD69ymwyoS4BW4yUp98r1IGfhAo6sxJU=; b=M461zxc+qhaAcn2/
	qklCd5eNp6kJ0EFD36l77Z1Jx6dCSpVVEI8/GLxzB0TxK12HJxxI/Lgi3qiPuzK/
	VmGQoKKqAtcGhDQ4dz03+gSjZxGWNmMSC+n/S785IhPvtuaGQk6YtCCf0zdBZ0EJ
	iqQBZfS7GB1DgXi3UfRIbrqasoSEz2cVBCKQ0bU3580ie1kKHrkSNHWS71Nw4OsG
	rkcLBm/Chln+rD1lrrUHKiM1IiD64bfuIzhPO1qdoAMpakSIZa6K1MtizlN+ezBs
	/DaMhjqRG4IZlEOqFbfutxCLnvMOWDrnmqkCsGdkRgpdSl9yPtySXvd8gwh02Efu
	UbQhvg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn2p8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 12:16:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so3548047a91.0
        for <regressions@lists.linux.dev>; Thu, 15 Oct 2026 05:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792066618; x=1792671418; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qeW+7v3cARPoD69ymwyoS4BW4yUp98r1IGfhAo6sxJU=;
        b=H5ulLlH8jtiV025lRVGPQ5ACRf1meVjFB4f+My0nLXx+veZa76Rhk0R16Z3LVaK1eM
         sLXW2AKbFMjG089Sfxb6V3HTCN+0ckj1ehJCXTcgpzYeGnfygxBjPG7T2Yx3bZRTt/WK
         RdnXiVPUi6VrDCZFxMS8peAQxZFSS8yDlXWO8E10LWVB5ddc3Wk8A72740dKzBUi+65/
         QgDuMQsxvJA8UFgRq+jbNXWpuYy4ezxceryQTB6lJm3YVksmHg/DrrldKIkeD3luJGAe
         ztzpbJw60tGkgd2oXTVFY9+NLJeZ20YOGQcfU9dy24h4WtYF1Y03MdfZZRnhNhFbbLsl
         LMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792066618; x=1792671418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qeW+7v3cARPoD69ymwyoS4BW4yUp98r1IGfhAo6sxJU=;
        b=uKuYaCiyFsxOXNamgdcE9KM4ur10zWRlZv1zfdpUPGMuoQS5rtsWk7ZPSecXCvoRKT
         aOet+VGbMyVJpNX4Mlasgu+fHR9Wd8KulS4KcRP+U/x1SjNSrx3uQ+WVhZhXMPJw0Re9
         weEc4Tv/u3rZyIY+34/jSePfpwNgri4mFvb8jqnTWDN/yFhXxRpafsuQz82xxjLdnoSJ
         Ehd2XmEc0TJkm8jRrdE0zdj2E1++g2GCwFGuYByZhY7bI6Dn9VVoLnBNyCCJ2VozuhAy
         wewKT2DTBcq6iaz2p1VGC73hZUIyDRf6HN+/2pZWjzzYhAL4DCM9oqWKZYqwEuL9/jcu
         q/HQ==
X-Forwarded-Encrypted: i=1; AKwUvBynZQXpEPhJv2dvs4fm3PNQgVr4jxxWFoslCPP3qNq3lzzlhhpzKvxyMirbcVM6AjyNnqCkB5JbefDh+g==@lists.linux.dev
X-Gm-Message-State: AFq9FYIf2CNwH/yHUywLRmgo8Ekw/+7eOwRaU/xeZR70LS8MSrluLqOa
	VBcqIpuW+I+4RfmnrVgcOFayQ3vn5CTz5aMcLNwdQIAA1pMhkOmUCNLuDIuW4AYP8hzbsMKcLcU
	t3CdwuZ41O5xKZ3/BVIotJB0co2wKp8SkxZ9M9U6dUZk8KukhzhYjDa7re3rbZqU7BQ==
X-Gm-Gg: AYBFou0TDmsz9OEen5QznYU6id8209zTaM8LN3WAWqgTj2oRtYg0m9TXV+lsSgbDIkg
	5IKQBiZHy59qRDH7BSeM4BRK38qHFuUaSmgiXM0nE0cXDmqbTEFBHO4bP3g2D/jA+D+IuVocwux
	L6cIWosEzCU7vtav7SWh+CJOgmHkPPI0G/bwjq/gUYm7shTbQ1+jHvlVTlOlXhSxHRXhvkRUEyP
	y8AHyeHu/UrEwlBlc8CoeSg//WQbJqTA6FcNq498cO2QlciXXceIYAUvYuyixbPl4GDHOEi0zWl
	/cnyI30PctzVZMpIq1Y7TOF4gWJTvM4eDRDuwEQ6Pyff7our6mN703iRUkPwjsr6iQwrE8SiGX6
	X/+wGItlQ/tqQWdbiA9h14BhO73vffzCS
X-Received: by 2002:a17:902:ce07:b0:2e7:12d5:cc3a with SMTP id d9443c01a7336-2e8429ad199mr147196305ad.36.1792066617698;
        Thu, 15 Oct 2026 05:16:57 -0700 (PDT)
X-Received: by 2002:a17:902:ce07:b0:2e7:12d5:cc3a with SMTP id d9443c01a7336-2e8429ad199mr147195935ad.36.1792066616942;
        Thu, 15 Oct 2026 05:16:56 -0700 (PDT)
Received: from [10.218.10.175] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e94ba30f6asm15395685ad.57.2026.10.15.05.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:16:56 -0700 (PDT)
Message-ID: <52bc42c2-f60b-4249-976d-83d360933ede@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 17:46:52 +0530
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: qcom-geni: Fix hardcoded clock index in
 SE_GENI_CLK_SEL
To: Birk Skyum <birk.skyum@pm.me>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org, regressions@lists.linux.dev,
        Andi Shyti <andi.shyti@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
References: <179173732257.29426.7905170638383807320@pm.me>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <179173732257.29426.7905170638383807320@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX9MEw00T0Tf/6
 v6Ys1To00X6wfrGZP+noP+JRb+EMNQIb1hZr2oJu/9QsTpVc7PbHEPeosoA0gNCUuXlu1rwQg4s
 ZggJFeEPAf+hPWy7a+rVsdSwC4vBmfCXm9Hh/4jSJXSw9NdN/ZspuGXv/EytfUXLrLVREZZOsN8
 qgFbiFLN3fPvmgf/hGhpM2wRammQWdbD4eeFhfaUrLKlE5kFAK+9qCPv57x5GlHelz28r6oXDBE
 ev5KX0UpA0bJfWveHz/IdqZtYo4pbhPpHVxZbci+ww6xs9Bs/wt0GZZy+vMhA1zY+/aW2aUuBWp
 UnXSDvEkCpfBwI/DPVVCwn1VD6T/ncI7nnHM/L/odaiItMymG2VKnHudcv7iY2+bTGqIcA8D1bJ
 9rNPrv6L31+85p0pzUr6MM9UxiTNw1VMmORjNCe4fH5lOAtCiDvczlyGuU5Fb4tG6UfueRVn9G8
 ph+tuFwcVWs5ioGmoOw==
X-Proofpoint-GUID: N1pk42OhOtm_PF_bwprJlWGJfO8Po6Qa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX4+qNkXyvUvTk
 dtOWSMlE+d+PrjaJG22m2cx2BeLn5UMt1RC6l/xss6ynVajreJhBbLwLq8bsM54RzTNDhj2JyUc
 Es1glbEdMCHABv81YvCPf0IuoWESxZY=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0c43a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=5YmnReTpXDDOs48wh34A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: N1pk42OhOtm_PF_bwprJlWGJfO8Po6Qa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150048



On 10/11/2026 10:18 PM, Birk Skyum wrote:
> Hi Viken,
> 
> This change takes away the built-in keyboard and touchpad of the Lenovo
> Yoga Slim 7x (x1e80100). It reached stable as 139efdb3ee6e in 7.2.9,
> and with it the laptop has no keyboard, also at the disk passphrase
> prompt.
> 
> With the change the first transfer on the keyboard's bus fails.
> 
>   geni_i2c b80000.i2c: Bus arbitration lost, clock line undriveable
>   i2c_hid_of 1-003a: failed to fetch HID descriptor: -11
>   i2c_hid_of 1-002c: failed to fetch HID descriptor: -110
> 
> The touchscreen on a80000.i2c keeps working. Both buses are set to
> 400 kHz in the device tree.
> 
> To narrow it down I took a 7.2.8 kernel that works on this laptop and
> replaced only i2c-qcom-geni.ko, built from the same tree. It is a
> distribution build of 7.2.8 whose patches touch neither this driver nor
> qcom-geni-se.
> 
>   7.2.8 driver                                keyboard works
>   7.2.9 driver (its five qcom-geni commits)   keyboard and touchpad dead
>   7.2.9 driver with 139efdb3ee6e reverted     keyboard works
> 
> One thing I can see from the outside. The driver does not set the rate
> of the SE clock. Without the change clk_summary shows the clocks of the
> I2C controllers at 19.2 MHz, so the 19.2 MHz table is used and
> SE_GENI_CLK_SEL is 0. With the change the same clocks read 32 MHz.
> 
>                                       without     with
>   gcc_qupv3_wrap0_s0_clk (b80000)    19200000    32000000
>   gcc_qupv3_wrap1_s0_clk (a80000)    19200000    32000000
> 
> So as far as I can tell these buses now run from the 32 MHz source with
> the 32 MHz table. I have not found why that fails on b80000 and not on
> a80000.
> 
> I have not tested mainline, which carries the change as cb97bf3d4f91.
> The same backport is in 6.18.y (5815329988ac) and 6.12.y
> (f5d0302416aa), which I have not tested either. I can test patches on
> this laptop.
> 
> #regzbot introduced: cb97bf3d4f91
> 
> Thanks,
> Birk
> 

Hi Birk,
 
Thank you for narrowing this down.
 
Could you please test whether increasing the I2C pad drive strength
resolves the failure with the new driver still applied?
 
On the Yoga Slim 7x, the affected b80000.i2c bus uses GPIO0 (SDA) and
GPIO1 (SCL), via the qup_i2c0_data_clk pinctrl state in hamoa.dtsi. It
currently specifies:
 
drive-strength = <2>;
 
Please change this to:
 
drive-strength = <6>;
 
and test with cb97bf3d4f91 present, including a cold boot if possible.
 
We have previously seen the same “Bus arbitration lost, clock line
undriveable” failure on another GENI I²C bus. Increasing the pad drive
strength from 2 mA to 6 mA resolved it there. This test would help
determine whether the 32 MHz clock selection exposes marginal I2C pad
drive strength on this board.
 
Thanks,
Viken
