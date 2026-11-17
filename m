Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794912860;
	b=pRDHD+eLPR6DWiCmt5BlzukebYOSkzpnRxoKytXAjqrL3j2OLuOK3daDFJKdnwPfidug
	 OtbTnkSWe2g27m+43rfsJEWrEZ/SW0st0TCsGXQqy8uKbThwnNKmlx86MpQHnO8niOyUE
	 OarIMYFr634LYA5aufa9UdszMbUDEyiABAIP3YSqw58/a2Zxfo7P437fGFmthq+pJi5Y2
	 NloeV8nuI60JVtDeoBUOZxi+M1UwZg/NQesEGrJmUrpFXTPMKg2ldhMkZl0l1ba9h43WN
	 XBjhwxF6JcmG4CvKFDCe+AeExK/mNmerJuPWUfU7JP3ot0NuZ8X2EXPy4+H0QQodTOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794912860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PTs88JOJil1zv+VWb8/Lu7bcOjPi5qntSr6+ZYlo3es=;
	b=HE6g/cwCUA0I8lxmPUwr731fnrWHBCSAPccS7WXkOAT45LnTWgyttts7nCdh91T13qm1
	 Mn4jRhm6urSRBAIUt4fav0MjxXU8fpUgCouTziqTCWzfV/O7N3ny4JuIIuMugw2L8Zxsj
	 +y933zBHZsd4LIUTzESWyewE8E5sf2q2NDFKbhvskl0CDp5GYFx9N6Zt9qulXPvaG8Con
	 9a4TcSD/dxejGGNulvCD4GfBJLMzDN2IVjSkgIiYNoidVCwGvoA8/ICM+RmQRrQ9bE5EM
	 zzphg+DsfSK0acCG0hIE6Je2ViIu5HtvVtydQuL5fPCSrqV7naPeybdBeYmO1pPgdzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kCahjSi6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jo+gG9kH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7577606A31C
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 10:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7577606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kCahjSi6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jo+gG9kH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8hMxL3407597
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 10:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTs88JOJil1zv+VWb8/Lu7bcOjPi5qntSr6+ZYlo3es=; b=kCahjSi6w02VUeNV
	5fcTXcwuAtp0kRlw9hStmd82TepvvMihOQWopWZe4Yhip9S3uZZiyFcxAo6IkEBk
	fvC1poqVj6NAmBYa5lwd7HPY5PjXywXXNhV5EGPUmupVT0gsA1Lh8rPmKdg588F8
	tymi9nR5vlAIVvdZ7XEU4Hfk8WA1v8p4dil/l2jugCa5UqgvakcCUOlujTWog3Pk
	q++E1XI2W1ev4/CyNIUtJql/NYF2qpUKdYjAYfTBH4g7ffeqqM14RIrmX4rGmf1O
	ZTGqFmmD2MQKJXQ2zA9OgjIu9tV5NgH/Tm1MtDYWSUm3mYHTiT8MI0K86Mg7MqJG
	aml3Qg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09htjqd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 10:54:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-947a607ec40so431606585a.3
        for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 02:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794912858; x=1795517658; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTs88JOJil1zv+VWb8/Lu7bcOjPi5qntSr6+ZYlo3es=;
        b=Jo+gG9kHn10AmfRu6/8nHuaI6/kr4+VsuX/ud+gySaePumWsy1QzBQ7M8mOshcERB1
         qmFTDDU65Y1lsqmzFbeOe6jDsS+bYi5uBB02fD5p9oeW6Ub//U7Sck+2HLjY5V0YhqS6
         DXdf00Vn8SBoy41AJxDYFHCaj+ZOO979AQPNiNizcJdQqYKNSvzNy+i9dqSr2JIz5PXo
         PxZ7UUVPRwHUQI0JLQXXa1qwiiHHCLmFWtENBM2h/CO33gcbi9bdIF+MRrfjRLmurD/4
         cGBGffhJlkGjNeiqqPrAUZJ5kQI/Fx7MlI8LICycJYzy2NVbwcDpy6I8TqLllo1+aW1i
         b8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794912858; x=1795517658;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTs88JOJil1zv+VWb8/Lu7bcOjPi5qntSr6+ZYlo3es=;
        b=MPUkB4iz49Oaj6qLaq9TbK0euYEDG1XmMn6WvALLgOnxXObBDU51EG2ZvmEiO09l92
         OGy+fY83PABiE0kxzd1Dgt/AVUgWho0GM3ci47+LkJjYf/EkVa4OG/P0+VCvzhoYPAh2
         J15WsOHSFfTSNfEwFUB4CLYpyJMjl7TEGxv9sLunMmlJWtTaQtxDPW1X22yLx0Qq16H4
         4aXF5uLPkkGbAqgqEZGP3c4dN50BvmNgsmW4do2Vyr07Q6grl3uSFzlGHRQvzo69GOMx
         i347YQSI2P6F7zMZ2/ibc/58TOqz+LfnSayzJc5SK7Ok+Ddmgkde+H+zz5+b/lwP3Gju
         iJug==
X-Gm-Message-State: APuU4Z/+ivkY6PeRx76uHnTsOxLum+El+w3W77+bGC5Gc+Tf0HjI9jHs
	H6+TzxKxeCpD3B5DmnTSfrroOVErpzSjCvhsqy0B4ovvxV4V/bDEYykhDcoYVf2QGgp/UujCkS+
	6QPWvHeWxzscH2IFiLu1TI0MtrmW2cyvpZ6X2yHSD4LFOx5nxKGEbNxOEWSyidft2mA==
X-Gm-Gg: AYBFou24Si8ydgXGhJ6Ew3P6OIUGwgmBdjnK6yNWh5sEpTnq7DnIRCX+oziTrqEUuTf
	ybD6HMOggcQeBtpCu0NnNtVXTn5nvmGOzxlv9BZpUur8Bc/T5swAdyue1TuDuC/ZS+5UxupzUKq
	lQc/ppmOqFHgk/JL7BUMDBrRF7ClaZ3L2pbHBFe8c4/TJn4ZGgxYUL33eNXoOEmhrfgmfZzFcVr
	rL/4gZG2VLQb1WZYfaTwykVxPKhtUvwyV/HrU5F36s82LdLkPKbLu4eOSiQKPXYsgO5AK5oies3
	R02oyIPLHdioN9QhnDhdWOxInlUyyth9tjDHJ9drwzfraLJ4XQtHWpycJMKjYGBszGCM4HGqVBC
	74I3XmrvtcmqMVgnc9/2bZZwB5WEx5KY++TaFr8KdSNOtAqfedmPgzJGl3Ib4eF0O4sxL
X-Received: by 2002:a05:620a:1a09:b0:93d:23b3:5088 with SMTP id af79cd13be357-9494bb88e1emr2137094885a.16.1794912857734;
        Tue, 17 Nov 2026 02:54:17 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:93d:23b3:5088 with SMTP id af79cd13be357-9494bb88e1emr2137092385a.16.1794912857208;
        Tue, 17 Nov 2026 02:54:17 -0800 (PST)
Received: from [172.20.97.137] ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8220sm58576545e9.5.2026.11.17.02.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 02:54:16 -0800 (PST)
Message-ID: <d5ece1f3-b70b-4c70-aa52-cd0d00253ea5@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 11:54:15 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: ASoC: rt5677: Do not apply Yoga Book ACPI GPIO mappings to Samus
To: Ted Vera <tedvera@gmail.com>, linux-sound@vger.kernel.org,
        Yauhen Kharuzhy <jekhor@gmail.com>
Cc: regressions@lists.linux.dev, oder_chiou@realtek.com, lgirdwood@gmail.com,
        broonie@kernel.org
References: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAFd_G9guhtVwE1aaFOXE3Ab43BAcwP3RBT=R_SdZ2KDfXB=LeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MyBTYWx0ZWRfX3i9v25dkNgRN
 VGeaQ8yAmgdNPLql+ttT7sgr4A4bcFJn5X4HYOrZ1FIURl4c2XwNgQ7cKAC6ZMMpsjXFVzGnEx/
 cNEhFaIQAY++aZf1KXANPyeWfQjpkes=
X-Proofpoint-ORIG-GUID: v1-ZvaK8A6LVDMtnkKcI35iRjnXeVpY6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MyBTYWx0ZWRfXzZdDSjbHaoTc
 ggfHIoDVLVPRAhIE6JEYo2B3wm6ePjT/6Z5NZCk9QR80oEfgJ++67cEFnKoHdiFglvYOW1qB8nS
 tY/hu4X9J7MQk7UxPuT08Bns1optx+u/RA26Vvsx3cBVEINpjRgfRFg7221KuRAN6sDSrXtAHlF
 D+J/Pu01YGXVnG8kX0MILR2lrv5GUWdXIQ45PmzM9yhsR7XF4MYxZnlEHICACeCWpx9LGjEsVL9
 tJ5Ah5UGWwl+uXqutJoc11f9iPSWGXvfMBRro/vLo6uHe5Z4qbXD8wLSkS/B1ez9HG7IJHf+XZd
 tKkOtvO0i7Qk0DqGWJjctm+mL3SwaeAcM117qo39Ebc3U3EZLazjVKTWf/xvQTIDHAXuZIrRUp+
 djkVvoEer/KeOnZhSMHkRnfK+NJCxy2vonO5r+yh8QaSHWGxwe2jgLnnxPUtKE6Qv8Ge/mw4RYA
 xgbUQ4uuSJ28h+ZzE3w==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc325a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=dsTg57I5qmWE0NA2W7kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: v1-ZvaK8A6LVDMtnkKcI35iRjnXeVpY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170043

Hi,

Note adding Yauhen the author of the troublesome commit to the To: list
(why was this not done in the first place ?).


On 16-Nov-26 22:24, Ted Vera wrote:
> Summary:
> On a Google Pixel 2 LS Chromebook (Samus, EVT2) running Fedora 45
> kernel 7.3.3-300.fc45.x86_64, the RT5677 codec repeatedly fails probe
> with Failed to request POW_LDO2: -517 (-EPROBE_DEFER). The codec
> appears in devices_deferred, no RT5677 ALSA card is registered, and
> only HDMI audio is available.
> 
> The driver’s ACPI GPIO mapping added by commit 0cc00de3dd5b maps GPIO
> resource indexes 0 and 1 to reset and pow-ldo2 for every ACPI RT5677
> device. Samus’s DSDT uses those resources for codec GPIOs (jack detect
> and mic-present), not Yoga Book-style external reset and power GPIOs.
> The driver requests the mapped GPIOs before registering the codec’s
> GPIO chip, which appears to cause the deferred-probe loop.
> 
> Test and result:
> I built a temporary module against the matching Fedora kernel source
> that skips devm_acpi_dev_add_driver_gpios() on DMI board Samus. With
> that module, the RT5677 device bound successfully, the bdw-rt5677 ALSA
> card appeared, and laptop-speaker audio worked. Secure Boot remained
> enabled. This strongly supports the ACPI GPIO mapping as the cause.
> 
> Suggested fix: Restrict the mapping to devices whose ACPI GPIO
> resource layout matches the Yoga Book, rather than applying it to
> every RT5677 ACPI device.

Only adding the GPIO mappings (devm_acpi_dev_add_driver_gpios()) on
a DMI match of the yogabook sounds good to me.

DMI strings can be taken from:

drivers/platform/x86/x86-android-tablets/dmi.c

Note there are both a X90F/L models which ship with Android and
use a different BIOS, as well as X91F/L models which ship with
Windows (same hw, different BIOS).

Yauhen, I guess the ACPI mappings where for the Windows X91 model,
since on Android I expect the GPIO's to be hardcoded in the driver?

So the devm_acpi_dev_add_driver_gpios() should be only done
if there is a DMI match for the X91F/L models, re-using
the DMI match strings from:

drivers/platform/x86/x86-android-tablets/dmi.c

Regards,

Hans


