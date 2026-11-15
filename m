Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794758371;
	b=IikViB1Iy5j1gqmCWzR3p/Z+ji628XN4Pf7GHPsmfg3fRivEtHHXlkAkBPK6i5SE3aE5
	 uaEkMTEU72P3XcUwY3ZLDjj6TYZGE8HV86jFhX5EdotLZQUd5wPlyY9UEAjg5TR8IFyld
	 IhcVfaq+C+ayoXJ03uqSwTSN77WiWBMOWIJqn0b7w4FqXQ+P6c+81VBzJm1ZIpGW6hY+r
	 AR/tsvROfL5lNculQ7MeMNBvMAOsLN5YSeFrEoD5XeqG2bMkRBHZPU5XNcuvIZp0EvmkB
	 K2YTgo9f+PAnIpBrpPDANwQkpNavZaCH0blHpO81da/ozfabGhDL3JIdvJ3lCWY+GPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rU0kaOlqF9hCuvhvsgIDlYklK2QFRWqi/dYW1+IFo+I=;
	b=i6ENXI9JbdL/Q4H+IwS2vsnLF8C202EyC1iIJCG6jFui6HYDZLgVOnS7YvLu9W53NzSB
	 sEfHK6SfE1r+qg2EloBSD9LXC+ojJyHjfcVQldRMgHSVqXFaNlC4L1vDXoEXCDMweumcQ
	 UPVOU+Lw5wTRy0wMqFLtNULcBKKO6w6xbEI1aa4zqD6BX3ZGlKdNClbhvttjbSbR4y5Vu
	 0FhOXcttTBgMvDJ5plRqa/c+tALOFogAXZ805Sw1jZUqfFUZqaZzFjFTyoKNJC0v7etah
	 +EtmqpriPMuDXOgSpJyL9E/JNuAcFIsz4VCHDFSbrYWYBkZljeVi0sxRM2sx7FxYsOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ixfoMr+z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=br38JxJa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8148606A327
	for <regressions@lists.linux.dev>; Sun, 15 Nov 2026 15:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8148606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ixfoMr+z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=br38JxJa
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFFB8093083511
	for <regressions@lists.linux.dev>; Sun, 15 Nov 2026 15:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rU0kaOlqF9hCuvhvsgIDlYklK2QFRWqi/dYW1+IFo+I=; b=ixfoMr+zQPJ5pPB4
	N3Jra/9kLU4Tps7ooXjkJ16KY+CjnGJSpAb6BzhHiRwrfZdu0tIvNABYVeBzikph
	OE1Nco6B9zP2r/yu4zTkFbH3iE1Mc8AqCPBKIFJCnYIV3wA6M6qgTDzYVrs3NW5F
	fBVSL8F6IW8ImljVD5/xCZvixQdLcGvM+Dbo+lW38Mh5CyrvUzCmGAG6lxdgL/LO
	UmiuW1kQqnkCrwq3G+juHFX6+SjLE2shmtFHGc6aWUd7mwbT6u5EPDzixK/fyP/2
	1655qe+dpmL0LrohoCsU4n3IdZt4Ylg00PHln0cVxLXAOKXPAWONk0wcM0cvIwyS
	44s74w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk2397q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Sun, 15 Nov 2026 15:59:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso557054585a.0
        for <regressions@lists.linux.dev>; Sun, 15 Nov 2026 07:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794758369; x=1795363169; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rU0kaOlqF9hCuvhvsgIDlYklK2QFRWqi/dYW1+IFo+I=;
        b=br38JxJay9J3iUPjYA6NboTjxJvt29+tE7sJsQVZFKFepmubQCMdnYeC0dgnGQ108E
         MMvT8h2VBd5pShyK/9xwaJyiGxod+phuB/BLWuffKiFeuKqo4g9Kexa/U4pbUJoztD6r
         tjsOjlVfe8GmpAb9eEXqkHER2bJuPCc1LPdpaY6P0yRgpCbJ1pwV8IVFWDeN84bkS+HO
         XhbVhSUmOCOM683ZNLIrCXPj2loa/UdONvx70QiB9Jp077ozOkFeqXfMBs46135eLGmQ
         mSV/En5YnviwGiS87TtRj0X2hbIm5kNwCIkuS0j9rYJ/5w5hSh+3LbTdakkP3rbDZdwn
         1psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794758369; x=1795363169;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rU0kaOlqF9hCuvhvsgIDlYklK2QFRWqi/dYW1+IFo+I=;
        b=b0e1/0c9bHNx2O7SnMtXTcPIiQfripxt/4kdGYbficfnMPPSSB5p/s+NMY9jOqIxHb
         ifEx7Y7kNJTT6x/YKpRjUY0OC3ml/G7sgxMvw3AOPZjEAjxNwqE0Sqisg46yXbEYoWaY
         64GelpTuHqnnR0RZZ6e1Mf+nx8SiBFCRlijc94EkXH4xcLSsphrjDe20uHQbS4Z6molb
         Bdx6nwj88LuDBUfJ71yXvLZu2gfbeHuKcMCZpyMt9dGtu7L4ZztAcJR04QsaXv0+UGVL
         LhkFf/pqdAucp5F1uvR6Xjf2FL50F29kcW/V14WduA+mDQgxPHq6FysTGcVLhK84bpj1
         4IWQ==
X-Forwarded-Encrypted: i=1; AL+hErF13wOs0XAxW1+mJrmzpPuLj9IoBFtn2YrE+PeJd5tCJfTSPAPgOleaulUrS08Xj6aPQ5nfRH4sekXcJQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z91wSXcvL195h24aqIdNpm3ZAVRPYeQ25B59vs6c4WCGkNyPQQk
	kiFuUIeJcdgT1ZvRphO4tFF7u6OrH67RNBclma5rK4vGSo4ccRPHnl0zQLosxuJM9XQ/1oQfTOA
	mOWTo+Ks9R9T0+qd7ibSxtqOz39vjnXUmTLjXDzyCgGI/BHipp6dRNrxAvrCINHwzHQ==
X-Gm-Gg: AYBFou1juh2mScLgiIydD3/U0VEcJfDJmzob8TYZwQPBQh5weFQOWf2Rf1vPOhPo72m
	RC4D3TlsoM1xUhGNJhca7yyWZeSiFci0ZlSv/0IEqGkIIT1KDLvuFQr7xe6OTKlaRyp5IyZ/yEg
	rjAtghNmyJ8LiuKoZNb2wt4I2N6Ea7bkgIMtY2CHkypLTCM9Xp/ngVEdx49rQewzhEfhen0NZXw
	LydbF3ogz+aAfOP4SpkwlQAOb9SJFQDdg6eXPFaS+rYLlKuEpjhprGq4RutLNKw9LPHIKmWhWYo
	pMUlFqPrP4s+/QX3QU+QYAkUf4xm48hSWF3ufqqo78wMS0W98/NC+wsc2CiVHCg5toLEaO1mY6c
	gMc+i8jpnlFKLDskE965AUlu+2xd3KXlM7GOQseqi+mu1/q6N6xgXAenBBOU/s6WiKeHB9ZE1JX
	yfrqI4PoEq3Odpn3goU5kAEZfiBPn3wTPWgdZRHjSlwUcnFFOJ9jRfut/MzLt/BVaV+ALLVVeyO
	dzEmqkjKXuthpPzC/GtmgXrPszhAGv9ny/eK/Mts1DV
X-Received: by 2002:a05:620a:bcb:b0:93e:c12c:4402 with SMTP id af79cd13be357-9494bcb40d5mr1383888485a.79.1794758368699;
        Sun, 15 Nov 2026 07:59:28 -0800 (PST)
X-Received: by 2002:a05:620a:bcb:b0:93e:c12c:4402 with SMTP id af79cd13be357-9494bcb40d5mr1383885485a.79.1794758368150;
        Sun, 15 Nov 2026 07:59:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611bdsm3439393a12.8.2026.11.15.07.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 07:59:26 -0800 (PST)
Message-ID: <42350f50-d20b-4141-9ff5-bbfad5fec2a7@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 16:59:24 +0100
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
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: don't clamp gfx and gmxc before
 sync_state
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>, Oleg Keri
 <okerixx@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20261021080517.2161-1-okerixx@gmail.com>
 <CAPx+jO8N4yLD8pZ2vr9_3MD9==FFMdvQG+=1JjDoe2kG7DR1iA@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAPx+jO8N4yLD8pZ2vr9_3MD9==FFMdvQG+=1JjDoe2kG7DR1iA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -rsF4lJPud1RtsLDMs5Jldsa1gEiBJJh
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af9d6e1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6R6alxyDzFe-mgSiMmgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA2MyBTYWx0ZWRfX/ailuC5gdu/H
 c7Kfc/53e6DS1qEFlFY1vt9rTRztep7qUfsT1f2t7eakAXMuVw7S1bdiMN9eSm2W4yjHdPXAtHf
 aWe68PBXx5qwdsB8wi1T6U0duZ9OctKiHHsxvc51O0EWcFgeB4aGkt/8AQqhzmqkMpJ8HRyFolT
 kZklu3gBEs5Fpz+8r2vSxbIT0v0L0/g3wxz8g02UlPY8P2lToimL0rfrVRWGA7p/Sen6JBU2WTV
 Kif3iQc7IwplQQafe8UiHWA85liflWb5cjgu0UDfazthe4unCYiWtKZhoIbGxBarKfGxA5YrK3M
 cxBFNxHzioF7yaPrLnU/7OJJAHJCHbcn4+TUmf4ovVP8c3j3JT/z8+ejaSM9fnipXJBdVtCutr+
 UAA8oFrK1FhcoHfZSecmOiLFQtRkVw3F1H7CLgt+fX4OQSfRwha+JOIfXFRfXzJD+LM/lx/Il1x
 PuDEZYkU2jknXBgstqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA2MyBTYWx0ZWRfXwalsL9Uata7+
 bjqOSljkzCxku1z6HrNpx75Wqtah7FqXCeAlwf3YmKluO8HqPRI29pFEXyv3kWwkgelJdEOObSO
 t+LAi13TyBnmglkXtNJ8cL9UVpU5qE0=
X-Proofpoint-GUID: -rsF4lJPud1RtsLDMs5Jldsa1gEiBJJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150063

Hi Ulf,

On 13-Nov-26 18:48, Ulf Hansson wrote:
> On Wed, Oct 21, 2026 at 10:05 AM Oleg Keri <okerixx@gmail.com> wrote:
>>
>> Until rpmhpd's sync_state every vote is clamped to the highest corner,
>> so that hardware the bootloader left running keeps the rail level it
>> needs until its driver takes over.  Nothing the bootloader leaves behind
>> runs on the GPU rails, but the clamp hits them anyway: the GPU clock
>> controller's probe runtime-resumes and suspends its GFX and GMXC
>> domains, and from then on both rails are pinned at their highest corner
>> until sync_state.
>>
>> On Glymur gfx.lvl has 14 levels and the clamp holds the rail at the top
>> one, 0x1d0, while the GMU's own performance table ends at level 11,
>> 0x1c4.  With the GPU driver and firmware built in, the GMU boots long
>> before sync_state, and its CLX DCVS calibration does not survive a gfx
>> rail held that high: the firmware gives up with HFI_F2H_MSG_ERROR
>> 0x007306c7 (ResMgrCalibrateDcvsLvl), the first HFI_H2F_MSG_GX_BW_PERF_VOTE
>> times out and the first GPU init fails.  On the Lenovo Yoga Slim 7x
>> Gen 11 this means the compositor cannot start at first login.  Pinning
>> gfx at level 11 or 12 instead fails the same way, level 10 and below
>> boot fine, and pinning gmxc alone has no effect.
>>
>> Leave gfx and gmxc out of the clamp: they have no bootloader-configured
>> consumer to protect, and the GMU votes them through its own RSC.
>>
>> Fixes: 93b6c8d10fad ("drm/msm/a8xx: Enable CLX feature on Adreno X2-85")
>> Link: https://lore.kernel.org/r/179248663855.32151.9955864156939592299@gmail.com
>> Acked-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> 
> Applied for fixes and by adding a stable tag, thanks!

Nice, thank you.

Talking about regression fixes, any chance you can take a look at
this MMC fix, which as the cover letter explains also is sorta
a regression fix (the root cause is not a regression but other
7.4 changes make it easier to trigger):

https://lore.kernel.org/linux-mmc/20261112124430.110629-1-johannes.goede@oss.qualcomm.com/

and if your happy with the fix can you queue this up for
7/4-rc# merging?

Regards,

Hans





