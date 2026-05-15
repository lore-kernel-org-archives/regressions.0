Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBA63EFD31
	for <regressions@lists.linux.dev>; Fri, 15 May 2026 07:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831016; cv=none; b=DQ8zAHbbGCRtcD+I6+NjkCjZL/O28eS5xgNooqQlBP7AycheZQyWRFicCOWYvMAUupt5OPUwyCtDLQ+kgKLEGi4WpeZfqq3+JK+0H9alT74Wn7J1fDISfBdnvr886Je23dljhi5CU/TtW+gJEF2e///cCIdEdxUeI7ujOOr7DtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831016; c=relaxed/simple;
	bh=+4ePIhu3O40dHWjlCdwyhUEUNi1zHfIgpYolXR3DEio=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PAeztAiibrOuL5kY4KYa1LLe71hnLpg1J2si7zWpWUZ89ADL2Hjv7fAHtfXyhBhVAwUGz60P3OUFo0SvN0nYNJ3rFaTwnFoyn0bRXuAbBjrjfokb+juh2BXicmPykGvxBLVJrvm80XaLJLqy+wEuVdLk8nfijiSWe7vkfL7QIGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1H2e7/Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j2VX6oIL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1H2e7/Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j2VX6oIL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5HqU34020904
	for <regressions@lists.linux.dev>; Fri, 15 May 2026 07:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Z7LPMBLyHHjy4yfGUUaKmg4n9iqRPbm6MK5swWzLHA=; b=N1H2e7/QC46tHRD3
	i1B48ip1E/cj+Z9QoyCDebJgoBkH1zNCXClrOju29al0KbywunZp+ckWbhL7rVSV
	IoAvOGwT+4jS5POzf953rQZZqCimZb1YtyX/KZ9fm5o23jakW+sTB5YXp27EYrWm
	nb20YVfSCmj5HWYII2G/XpVHiLFn7gWDbY08A4+J0FD73edPqm/ymuIxuhh60dxx
	88ucnnFDssHDNRVmBgS7KXTNuPmxZWeXJ81x+hOEIIauGNAZP+Nt/OrmMVpOHWjJ
	0i2xqPmEGbrz8icV5G5p2XzCIH5H7/ZIsg3mUvQK+qPcOTeVbkL5K/o5xmrWJ4j6
	iNF1YA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1rt6yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Fri, 15 May 2026 07:43:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6314220f28eso12110271137.3
        for <regressions@lists.linux.dev>; Fri, 15 May 2026 00:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778831012; x=1779435812; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Z7LPMBLyHHjy4yfGUUaKmg4n9iqRPbm6MK5swWzLHA=;
        b=j2VX6oILCUV5+uRJZuNuiZeqzlBYArfdoqtp396HhjmYV0CXz37BgL8nDbCnGsSUp4
         54eewHoL01Dhxs30/2jqHvED5r/0gwbpzSp0fmShCW/qRYfDiaVNAQvPTtJwtspBNefM
         esKaRRtaDBMDTOKD01x7OtHODJBeqHK25a21uSMP99U+0gzU4y9bK2omqxtursDvqyxp
         4wQ5zzxkCdUWE4iuyajenDYbLZlzeAOMbNzvCah5q2fuuwMZFsGJePXd3oIX7m5ql68q
         5MSomX7wAGlKTeb/5jNhHHaqDDQsKsshfnwSickEPr9527U2WlFJbHCzJk+9847V7wa3
         Y1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831012; x=1779435812;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z7LPMBLyHHjy4yfGUUaKmg4n9iqRPbm6MK5swWzLHA=;
        b=cT9GYJdtP7FRpVgulV3ebKxB/O47olR66D/vWHGH/ANqBfTw+r8k1obLG5bZGrP6UR
         t0XX7NGTfE9eHbjoYpSq8Tsia5zz2WIDxOrxMoZXvTZb7Fg4nYI9UNfh/8/HnNuDDtFp
         fTsosJLMgoXf6Wga2BqcEoOqTsP5RtHcwiU4ZOjFDmACPdV2ZbnYegyH/36EknFS0hZb
         V9xncwm2+cn1zTTT0JgN97XvZNPXdciVGMHkfsbXqcWAvS1yH2fdizFnIjBSlsFRL0D2
         7hH33NU35J1PlcsEgEAEunwwGTX5rgv1K+QEiRPRftJboWI+kTuiIY4Hwkluhg6Z5QGJ
         WZCg==
X-Forwarded-Encrypted: i=1; AFNElJ/OJAxAaNUOFNbPbuhZQVAuPGmdkSPQCJNJ/m/e/PNOtVM7EaVC8KZNTlW9v5emsPq9xLgLgv1BhWI85w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWUxDMjzA5f20PGA22GpQ2K4C/f90FNcLvCjMEpOxwAKLzSUMd
	0OZrVJkMEU9WVB23Z9LWfzP9J/VIW1Vhx/AQi9ikZ4Xk8GVJW+gFa/hOe88uhji0DsAksLvqE9p
	BIijSJkomDrLxC/NvJLEKV7PYKfxrIzAvkBMSgK+uD9u7fdntK+DjA1+nPjRwsmXsEQ==
X-Gm-Gg: Acq92OGb1/12kwE87YxL3AVATM4bOo1MLe70jCyg8jV2GyYQgzjBp2HAscl14YLXYUW
	Vv8UZG4bQRPGXbTO1RoWGBSHf15AjZBA5ZVW5TBztxiaH7gNXn1E1VV46FMQ1v9FSKTDha71VKU
	Vo7EXY3HSvfOvzy7iYc2DjvgP21XFwSJXG3edjL8tq4762QUi6FDgAOCbBKFRhZv3sga44JeMez
	WW/v9S8h48rr/mfOTMd+FDVcjYIf2ukBuAh0yAqxjX4mSf2kiipjgUOS/0LwbxuGfJ80ucE3fZ7
	uBEQ5091B1GEzGcLYEzvDVIkEB9BDDNHUhDXIi8LGAubS4Ff8s/4sYvqAx6Zo9NZvp+eyiYjv/Q
	4671m9WjTh500Yl5blO/m0+Uh+c34StBU2oE4tBsf//F1fZnPArCMcYL/ogCHTgQvS5BtR2tlXo
	kVAf74bgLvW15DckiJiLK9l4TNqp/gxYIi+8sDQXnPzPVJ9cYt5zjldcjtj9atjx/o2JTaS5Mz7
	LUCVhAte7viL9O3
X-Received: by 2002:a05:6102:50a9:b0:633:c6c4:b321 with SMTP id ada2fe7eead31-63a3ea7d313mr1297688137.18.1778831012079;
        Fri, 15 May 2026 00:43:32 -0700 (PDT)
X-Received: by 2002:a05:6102:50a9:b0:633:c6c4:b321 with SMTP id ada2fe7eead31-63a3ea7d313mr1297679137.18.1778831011680;
        Fri, 15 May 2026 00:43:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd2f5csm187895966b.3.2026.05.15.00.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 00:43:30 -0700 (PDT)
Message-ID: <7ba6b4ee-fd2a-470e-951c-2c69961b977a@oss.qualcomm.com>
Date: Fri, 15 May 2026 09:43:30 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: Linux 7.1-rc3 regression (Bluetooth)
To: Greg KH <greg@kroah.com>, August Wikerfors <git@augustwikerfors.se>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Linux kernel regressions list <regressions@lists.linux.dev>,
        stable@vger.kernel.org, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Pauli Virtanen <pav@iki.fi>,
        Mikhail Gavrilov
 <mikhail.v.gavrilov@gmail.com>,
        markus.suvanto@gmail.com
References: <f652d5d9841a9b7c100dd19ee97c86099f580724.camel@gmail.com>
 <01ffb0cc-dcf6-4e60-adf3-fbb96e0666d0@leemhuis.info>
 <51b55b97-615b-4f5e-b454-df646f4058b7@augustwikerfors.se>
 <2026051514-scorch-ecologist-5e7e@gregkh>
Content-Language: en-US, nl
In-Reply-To: <2026051514-scorch-ecologist-5e7e@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MeGNr98GV5FgArxso_HKM4dX8DdSYOx0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA3NiBTYWx0ZWRfX+A67keLHJQPS
 jlS+tjTAXZuUCL2M+xzod+czfavHCdGi5emRzysU82igLaJEUSefznCUO9qa3hxuulp5Y/tNC/l
 q1BLrHfruuaZQf+aYjn3F6MUak63p1jZxWjDwKiCVWNRyDdPIkYXGPq1Ol296XbNCahRPsUbqvk
 yyy1jTMH0ntLyptgYcdbLHnJ7GJjg4TH+LQDoSBBIO+mjC2XVZmBcLCW9BabBGgGB18Nm1IOfZG
 4pH92UU3tEYHWTtG2EpUEXWi9/m8FHiNEEo11s3qdVSEhMIXDbJ99E3S6EgDuCbYNzsDRBQrz+w
 cUSg9gyQ293JeYECPAPz+dkpfDfGCiOL8/r/ceyPdJCEykFe5f6sG65/F/jGUCEimu4vRWyrU67
 /cnz/KONYaNOpzKNu8/8DWSZNfFqpl/WRRMmaPuY/ZE18rRnCjFbJqIdJJwopFNLG1D0+9HJ1XZ
 REKbymCynqdWzwMVdgg==
X-Proofpoint-ORIG-GUID: MeGNr98GV5FgArxso_HKM4dX8DdSYOx0
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a06cea5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=x5eH5QKNjoUSqzY6eP8A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150076

Hi,

On 15-May-26 07:37, Greg KH wrote:
> On Fri, May 15, 2026 at 04:26:38AM +0200, August Wikerfors wrote:
>> On 2026-05-11 08:30, Thorsten Leemhuis wrote:
>>> On 5/11/26 07:17, markus.suvanto@gmail.com wrote:
>>>> Hello
>>>>
>>>> I upgrade 7.1-rc2 to 7.1-rc3. After that bluetooth  didn't start
>>>> hci0: Failed to send wmt func ctrl (-22)
>>>> My fix was to revert commit 634a4408c0615c523cf7531790f4f14a422b9206
>>>
>>> Thx for your report. FWIW, there are two proposed fixed for this change
>>> floating around:
>>>
>>> https://lore.kernel.org/all/20260508173121.27526-1-mikhail.v.gavrilov@gmail.com/
>>> https://lore.kernel.org/all/770d36b07311bf88210c187923f243fb9f126f04.1777058551.git.pav@iki.fi/
>>>
>>> Given that this is the third revert within a short time-frame I wonder
>>> if we should fast-track a fix (once ready) to spare more users the pain
>>> of bisecting & reporting.
>>
>> FYI the commit that caused this regression was backported to the latest
>> stable releases (6.12.88, 6.18.30 and 7.0.7). I encountered it after
>> updating to 7.0.7 and can confirm that the patch from the second link
>> fixes it. That patch is now in the bluetooth tree as e3ac0d9f1a20
>> ("Bluetooth: btmtk: accept too short WMT FUNC_CTRL events") and a pull
>> request [1] has been made to the net tree. Unfortunately this seems to
>> have been a few hours too late to make it into the net pull request for
>> 7.1-rc4 [2], so the fix might not get into mainline until next week.
>>
>> As a side note, it is unfortunate that there does not seem to be a
>> process to prevent patches that are known to cause regressions from
>> being backported to stable releases. As far as I can tell, this was
>> added to regzbot tracking [3] a day before the culprit was queued for
>> stable [4], so such a process could have prevented this regression in
>> stable releases.
> 
> You can email stable@vger to let us know to drop a patch, or when the
> -rcs are released, respond to the offending patch in that list.  THat's
> why we have -rc releases!

That relies on someone actively intervening in the process though,
I wonder if it would be an idea to have some CI which checks patches
in stable RC releases vs regzbot tracking?

This assumes tegzbot tracking includes the mainline git hash of
commits causing the regression (if/once known).

Regards,

Hans



