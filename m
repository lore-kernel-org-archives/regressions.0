Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9789E37A485
	for <regressions@lists.linux.dev>; Wed,  8 Jul 2026 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517506; cv=none; b=YV6f22wjmgdVeJ9uIpuq4tKUzGpx9KPE2CpTza5PUEnfsyKkWEx60Sp3j+ZXO8LGKqfVVXFOdon2NBV4MOkUrNhqh9GAk27ZOfSkMU/YsDVVjmpHxKnwVE1rrnNsv92n5lWghy5AzqYGLxC7AEJoiyWzeNKbjTgdZUNIr8WQnHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517506; c=relaxed/simple;
	bh=JFQ5ZOBtWMOftJo1ydp3nD+9WNA1LVmHbMPFMaIDKDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a36EK/jR7TRQRtFPyYLa0UrW0/kikU/Y1F88YMZfCbHKrAYCmp3bBvu4wBIw5vQuMACtqmpUsCrOeAqf9vES9A2iaJoKNIR9sm04vwGmiHTsFCphWffmjAw+2Xj1hbmMT+5nOw6dFtVtk/YlZgl4c6Dfyky2O9d2qzyoixwhfxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBi8AVUo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wz/iqP9v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBi8AVUo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wz/iqP9v"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3S1b2667491
	for <regressions@lists.linux.dev>; Wed, 8 Jul 2026 13:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ef2H++Akvc3hms2OdUr0P9OSH1mzQR4iDT2y/4vbjtg=; b=IBi8AVUoYI1UJ4NX
	Xwazn1Ht6CnHOA8FVZ4a9oDHrLU7UdsNrEkAMJXkGst23mHBI/hMSRe1ycfAKS2D
	P7inGgzUz3jKrTekjP24xFtPK/ufRZBW2osW2Hl07vjJMsJcHGyqwK1z5BpflgOs
	I/G8RPQbehR1IVNF0Ak6dQVW/sKdU0NE+e0/ARq+C6OkjJUr5pHDmaSdalfOBjTE
	FBrzwO4815CEZXVwt9bjSYL+RcoGWaRWaYhp6QW5o4XQbBB3W9WaV4F0XZ6bZ7R5
	hnQDeRzKyuMmAggUz55MMfffU54PcqlpQZYZZBySu6bpsZSDPeMeQfy1SW8UMJgh
	CMjd3Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hguccd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Wed, 08 Jul 2026 13:31:43 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bebeb08c02so101431e0c.1
        for <regressions@lists.linux.dev>; Wed, 08 Jul 2026 06:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783517503; x=1784122303; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ef2H++Akvc3hms2OdUr0P9OSH1mzQR4iDT2y/4vbjtg=;
        b=Wz/iqP9vNMwAfX4ETrqEvm2mloiiS1OyRi0wUDvf4b6lMtNeAD7fPPSHdkrLZ5p+G+
         9F5Nu06xb/bkGiOi+B5DY4KtUqVIjOxvxsfKnK9ijho3hUU2wy59i13DgCgi5GI0SPiD
         U2eNYJo3SgSXXvPtPT4JWl5WzTeTrdwRX3rN7TCBrm35f/LR79q+Xagwi9S05aqgg8Yh
         ebHbUV9fzQ93+NCSuWyRqCauStWr07jIBiRZ147w7no88nnhSu9q1n95Cf600Jw/ZBeF
         X6A6K7qXKVVqlbgEuCaLP9vky7RlVzMzA7VxUGa4eOYY4E08E2omHryYJDjBJb4zjYau
         B1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517503; x=1784122303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ef2H++Akvc3hms2OdUr0P9OSH1mzQR4iDT2y/4vbjtg=;
        b=APSeQ81UOaJZpqD9Sigug5NIPhN6LjFgjv2tYPDbeEXIL7fsXvfTuN+JvdtLmm01mV
         Wb7PyHsG/WukrgTKAPIwvVxDWHm/qmEDMejoUJmDh1WIuI70GuF9f8wjh1mz6V7HcXaJ
         kGWB9BvHzIpiudoiKXeiaidTCgLAoj4sfR8YOYvzRoB2VAFDq4L8kxIPIzapvTPvYjA0
         zsBz6xllRgg0mWexQbG4ZMyvfJzxlpwevEbAVUMU2+WH9Chn4X50q9BKGsXTtiNvgnwt
         ENoA9T7hNBjxm8+L2CrCiokzx+CpipDiO1bd7n/a05C+PBD4bwZIKeKb49bB6QlCJY8f
         JnGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqI3HOQi2QpUZdrQ7Gs247GS4ovFpuqIIHeTYwzLMgftprcQuBq3d6VWMOPAYhuLBYJeBcpeEcLLqQA8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTwYFr9tpqUrhYgWDa6Ndt+aA6SKXsEICcq80SIOumtQBtYsRr
	KApDd3/DnnwYwitk9wBWx9MZdkEIr7OHP2JwKXJ6c7J870JGPwJ8pxbBIMaW7qbdwX0TRS+3REF
	Ktmqxzj0kycurPFQWNQA4u1mWnM39P5MVxI/SiTXI5fbjyp1sAOB3qDwmZpDlFQVGnA==
X-Gm-Gg: AfdE7clIr4AUYBbM3AJpbxhfqEfgBourp2zrNYENbXIZJynTEF3w1Xk7ddptmSH6+8m
	nSAtVQg5XY2Clm7yLGG6ZRg3ak+qSawqJEcqjn0yZsnhT35hqyV9EKmpn/29MTFRnBbJHy9z8zm
	JRlM0OGHPMmUKPm1JapS2+CGjXkpjWSKCvXPxSQ1jshWbpzOjZK+l4BG1+3FQ11rXg4kVQpU/BP
	KXXChpoqRNZpCZy30W4wvD6Qag6inkbF8ozvHlNz//kPP7A55sHYfKEgNqfQRsCYwkDh+xRdFDQ
	GFwPVA601fnYkIYTEEQJf2w+8RGK138z3leaWgPtJAfUq2dB9j4GZzVIpQTfUqdVjwtY5In0lwQ
	W4cqRGlhxGV5bBfAqMW2TqT17Sn2Ld0c1cgBhdfF2Mm6GhOksBJPHHoVoas2oY/MUmJlwtmmL5p
	EDQ9VkXtnGgZ4mNM42TewOl2gE
X-Received: by 2002:a05:6122:4d02:b0:5be:2177:70b3 with SMTP id 71dfb90a1353d-5bf75e7266dmr991021e0c.10.1783517502593;
        Wed, 08 Jul 2026 06:31:42 -0700 (PDT)
X-Received: by 2002:a05:6122:4d02:b0:5be:2177:70b3 with SMTP id 71dfb90a1353d-5bf75e7266dmr990975e0c.10.1783517502168;
        Wed, 08 Jul 2026 06:31:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a2dsm4485853e87.70.2026.07.08.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:31:40 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:31:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Mohit Dsor <mohit.dsor@oss.qualcomm.com>, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        vishnu.saini@qualcomm.oss.com,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Resolutions broken after "drm/msm: dsi: fix PLL
 init in bonded mode"
Message-ID: <d7v4kwmc42k5ymgdt4mn2qc7dkrf5jj2l5afgyjqrm3pxterl4@guulk22xwlzs>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
 <ae07cef84AmXK43H@hu-mdsor-hyd.qualcomm.com>
 <wrhuksrzlxw2pjlvjm37dwjuztcv7qs5t6mqiav4ujecwqdkwj@ozbfxpbgaimt>
 <CAJfMnmEVwUwt=wMJ-8HKH1yz9+erWLrRGB+6wVYCdSGDK+_T_Q@mail.gmail.com>
 <114b9be8-1fca-4762-822e-1d53838d5de5@leemhuis.info>
 <o64cxeq5f4ffqpdmbai5cvsmxei2cnw3p6acvu55xl3cj5w3z3@6o6kokszvng7>
 <akt6z1irWlXA5UIy@hu-mdsor-hyd.qualcomm.com>
 <493b8d4c-164e-43c9-93c8-40cc251b1c3b@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <493b8d4c-164e-43c9-93c8-40cc251b1c3b@leemhuis.info>
X-Proofpoint-GUID: EsZYT0qCOyrZJQ-kpCTJMpEezMQBDEL1
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e513f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=omIcalozpB-dROxQmn4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: EsZYT0qCOyrZJQ-kpCTJMpEezMQBDEL1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzMiBTYWx0ZWRfX0n9VpuEi/R3f
 Zm8pgJL3mGO08AsJF6O1FWWQSj/TzADIww862sxQFfCIvhZ0rSEaQFkqpMnUejCpgMfjawu3lfh
 8h5QNIa8MEZ2cnTH101UljzgWfKwqno=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzMiBTYWx0ZWRfX0AZesshkIGtZ
 pozN9pAIEdMeKfhT6zqNHKq7CKFedCIWfJCa2UlCQmtH7NfcPwK8qv/WW4D1shkTWP5oWjfT66k
 4mhFytcogn8Il2gVfoNiRtA6k4j1kB9drKe3B3In94+rtyHmiRYeMm9ZM/CbHnUW0c9EXw8cUSZ
 bIF0QdcpITylc2o3BCizBj2EHw/D1+m4aLUlaW/bbaT0hdnJQTO0srPPXLLlWcGES6bOcUVLhzP
 JnCOiXN9UMoRasBAbUdsHhHtxN51q9d+XpfdYKO6gAGr+d/uH4KMTiSVXP8NtCIAkUtJ3tCQkzv
 7A1P0UIcdUmJTyTMwI7BxCknI2pDqmV7FsHon2amm9wdjzaSWmxqBDCPeSe82pRGcVwvwSQp1hu
 dqMIFMvZty9etfu0vQZu8I8OkbQZ48p65nwh0Xo2TKznZf/J8empdmvXYQIhqwQ8qjpYEKXtmgX
 +iK3Cngzt8LyASe08Ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080132

On Wed, Jul 08, 2026 at 09:26:04AM +0200, Thorsten Leemhuis wrote:
> On 7/6/26 11:52, Mohit Dsor wrote:
> > On Wed, Jun 03, 2026 at 03:11:34PM +0300, Dmitry Baryshkov wrote:
> >> On Wed, Jun 03, 2026 at 11:56:15AM +0200, Thorsten Leemhuis wrote:
> >>> On 5/4/26 22:09, Mohit Dsor wrote:
> >>>> Sorry for the late reply. I am attaching clk_summary and reg_dump in
> >>>> working and non working case. Lilliput is just a normal display working
> >>>> with hdmi and has 720p as preferred mode. Yes, I was talking about RB3
> >>>> Gen2 only.
> >>>
> >>> Neil, Dmitry, and Mohit: what's the status here? From the outside it
> >>> looks like this regression is still unfixed with nothing happening for
> >>> weeks now. Or has progress been made and I just missed it?
> >>
> >> Thanks as a reminder. Unfortunately, it takes some more time (and I've
> >> been a bit overloaded lately). Worst case I will send a revert soon.
> >>
> > Just wanted to check if you had a chance to look into this issue and whether there's any update on the investigation from your side.
> Hmm, no reply. Given that we are entering holiday season and are way
> past what Linus expects in a situation like this[1] I'd say we should go
> for a revert, unless some fix shows up really soon now.
> 
> Ciao, Thorsten

Please send a revert.

> 
> [1] To quote Linus statements from
> https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
> 
> """
> From 2026-01-22:
> 
>  But a user complaining should basically result in an immediate fix -
>  possibly a "revert and rethink".
> 
> With a later clarification on 2026-01-28:
> 
>  It's also worth noting that "immediate" obviously doesn't mean "right
>  this *second* when the problem has been reported".
> 
>  But if it's a regression with a known commit that caused it, I think
>  the rule of thumb should generally be "within a week", preferably
>  before the next rc.
> """

-- 
With best wishes
Dmitry
