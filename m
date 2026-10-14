Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617154E3234
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983858; cv=none; b=VN35kex/BATp1pxsP63zB/LGwzld17QMuiL5P4iBn5SYLYiv88P+6HYkoeif8idHZtW+dXWqIdXHq1vos53jJ+xrp/mBc6tOyinYaVZo47axkYteHJlS6xX83yIiaPQ9N66bXfPFIc+64WMxZaPKKqDtJxJIa1kcXOGsXaM5HAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983858; c=relaxed/simple;
	bh=NAhNj+xAYKXjwTf4Bu4MG+U94N39qFYkCb06SSvAYiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TrMucwoPoS7l2+PALiBgF3t1aw5kQWlbvyYaqsWUC1oltHXuXJO91R6eMrKnf7YXLwgeb0ME4+PR0YdfQLY9nN+ATMFuuY+GrYcYI+8inmwntT7n2q9qOFFhsxtQ7lQ+pgRf3a5cOr1DDo6tjey5D2etY4120TjuOiGLHziFm8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCdxPO/6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UR7sCytE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCdxPO/6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UR7sCytE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBFdbI3951349
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 13:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vmr9fYYhrMz/+NTty6Yb5DMS3qhB8lLFFLzfZXJtLww=; b=KCdxPO/6K+SOR16t
	VvioE/s5u7GQ6HhRNcXzGbSjQ1HPMDslfihNbr9hqD/v7z0JZnHmE2OvtGZISgQ+
	yc0/m7lwjVj3DbV1vgPc1UYX2hTVti7/VyimwojtDshyUZfZ2G8ObqVCT5G5jrBd
	kPuz9LuiG3JE5DCGBvE3VZZqb+QCs/qp9rtio+6r2lOl/NVob94g5Icfq3mpznfD
	3AAshC4ZLiiaom1h1nXlTxI54zlizxOTFret/w1XA0dDbV95RRs9BdCHNf7T7MTC
	c36nVMqWP9f8kK41Nee0oCN6c2KbSny0EH6QIC3Uu/kquJWu4Gr32yngJDjjFmzD
	AHLu0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p1rt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 13:17:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53568f05f8bso12448161cf.3
        for <regressions@lists.linux.dev>; Wed, 14 Oct 2026 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983855; x=1792588655; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vmr9fYYhrMz/+NTty6Yb5DMS3qhB8lLFFLzfZXJtLww=;
        b=UR7sCytEgtPdXS0gGQJU38E95diP65LZyGLGqVSblxYRBvponvU2hZDP2zA1jJ1ICQ
         Gj1+oPOn2u00SGdqcAqgUJ6YIuBmxAUSljJyO99GXBODT5aI05CsiK5MVn3zIFA6ynQs
         kZX/x/hRe6lXwoHNBHo61G7VF1rZ4YzpzqQ4VVujxk5QG3Zf3V5OryGtFlP7G51V3sbF
         jIdV9WCc7NMYKQu3meKSbUNgdN9uJKWmdV5lDcHAKt3MrTmxB/qgelgHrmLuT9jQQU/V
         1+wEGAJ7tFPPp8AQlzY2F3Og///vZnxsQEDFRz1H9xArXQkIc+63tvWM6MbMrvMhcDjR
         1lbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983855; x=1792588655;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vmr9fYYhrMz/+NTty6Yb5DMS3qhB8lLFFLzfZXJtLww=;
        b=ymLPIOPzyqrk9CM4m8dxHxVVPrVdVqe4RhKHv2TAops9R8nQiTiDj+UKFkggW59b49
         Vr6z+oHpfXwMJB86GxaOalg8u1cssJmqsB3DnIScotnHpJHuP61TAHCxOkf0ysGggBSk
         THB47Mq3LFqHb561ErkodAk9T+Z8StbLGhwIhSaHYF8zPSnlxcb4PH/ww+KH70L5rj2P
         yC6dfP16MvgwkvYMIBkrlZRfGaXv6suKT05NiUR5/iiANxHI3yLHWChWogKCeYIhn8YT
         f/8VMaJDfJkekKYHDA02nZysocp83un/eKgrF7DxQRNNvfZzwnVwuGRb56Nyt9VAytx3
         yj8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxyozlq81QVLhrhDZcOsasyBlJtkk7/FWv66dSKNZHrwCcSCdbI7BL2whyGFeSRCeOSycBrya5NVKCIwg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJw64FRlP3ly49i7+QM6NESeU86BbTpHAHv+Ojdj0pTo3z/hLV/
	Me2+Z7PEF/P/XJ0b7AtJzfBFlgYC2UM3JahKqbSgjEn1fV78SgP+AyVMdBZbudrNqC4nvL4TdjP
	CNPPEpoBVdVV70UreqwaeoD8xjpIifhNMKl6z7wtqESlZfDgsbDw/FUY8rceSKXCN8w==
X-Gm-Gg: AYBFou3Vol7gIAiKLXi6Azc3+0+UEcEe+fk0QJQXd9qZrnCZzRB1JcCbI94NL688JyC
	1TBiKJb6gvM9a6snoW45jgDS8/PC7kfEXjKD1pkb03Em+orruJRcwaRmQD1jQcEEIQkZQ7xih36
	DvgQwrXCek0Ty03V34iVbRrAan6EHhI5DgG4tWSAOOh5VlMMHbNBjG2Hcu2axyfDGvd/VUyJ+9I
	rIE4W/kyQEAAAKVyydYpXqUIAlfuYFwes+59HNOTOslfvJUtHogl/FE5Auip1bkAnmxIVtCt6XG
	7pTN/HbmNp1Zlllr4wdekX8y6QC/M0CAC2z//uGzEPHLJHUvqTdoNISxGBmmljHbQ3tMyDTR2sg
	S2Six8HzAMAH6adI5yqo/UA==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2938893985a.4.1791983855379;
        Wed, 14 Oct 2026 06:17:35 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr2938889785a.4.1791983854924;
        Wed, 14 Oct 2026 06:17:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d704c1sm632732e87.25.2026.10.14.06.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:17:34 -0700 (PDT)
Message-ID: <230a39d3-6957-4203-a54b-88c871092e08@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:17:30 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "i2c: qcom-geni: Fix hardcoded clock index in
 SE_GENI_CLK_SEL"
To: Birk Skyum <birk.skyum@pm.me>, Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
        Daniel J Blueman <daniel@quora.org>, Sasha Levin <sashal@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        regressions@lists.linux.dev
References: <20261014130805.48840-1-birk.skyum@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014130805.48840-1-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX/GAag0VRS0/h
 XYaOdKAytWO3ZyEhPOYqT36L0WpMh4fW4KowxWxR/HB6pNSJe9cFgd+e5/krW8+EOalXqN7Itut
 o7SNdwTjR5LhUAbqGsRZy27wmCesCKA=
X-Proofpoint-ORIG-GUID: adDLv5G1tOQywUvPESK_tnPmERtGIhyq
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf80f0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zjrlJ_9gmUhWjCpjid0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfXx8hgdmE1QY20
 R11Uqs3UQ92wheGY7x7DJfhgFz3w3Wbb+DCuLygbjNnA3tN1aOUBgGRCKdFZ5DZaVF+3lRM7EpG
 0Ut+ogQb1KjCI7NIGpiMiokvM7yRjcIuZ7skmhVnx01iUyTJu5is/tj+EruD0NyLQdI8/FMj7HB
 n46DkhI1jQJa1OqFHDlwUtiXYh+4A+21WmvV+fS9UFyz6+nuP+wsE+yJ6PIsMI8C6JVh9fhLQHM
 1zk6KrpCgOgeRdAJsHNYL1ijBhtWwStgg3sCc0Mq5RPbm0exthh/GmBxEkqp1Z0MWm620P7yPVb
 POPCXhasqw6agCl0FBThGorNKuZz5UnIRWseUkfUR+masrmva27jgccgd5FdkBQBs794GHeo9/r
 FPiG9zn0PqxiTMWurNS1DSuPWu8EeECSd2R3rR7jNWCog+NEZbgvaU5IXguZ/CsTjH3D3zj5IoW
 xWmc1K7eX1gGkFa6wXw==
X-Proofpoint-GUID: adDLv5G1tOQywUvPESK_tnPmERtGIhyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140052

On 10/14/26 3:08 PM, Birk Skyum wrote:
> This reverts commit cb97bf3d4f91453b881acaf8e9f0cc47bb40b604.
> 
> With that commit the keyboard and touchpad of the Lenovo Yoga Slim 7x
> (x1e80100) are dead, also at the disk passphrase prompt, on 7.2.9 and on
> v7.3-rc7. The first transfer on their bus fails.
> 
>   geni_i2c b80000.i2c: Bus proto err, noisy/unexpected start/stop
>   i2c_hid_of 1-003a: failed to fetch HID descriptor: -5
> 
> With the commit the I2C serial engine clocks read 32 MHz, without it
> 19.2 MHz. A fix for the 32 MHz fast-mode timing is still being
> discussed, so go back to the previous behaviour for 7.3. This brings
> back the hardcoded index 0 in SE_GENI_CLK_SEL.
> 
> On v7.3-rc7 with only i2c-qcom-geni.ko swapped, the keyboard is dead
> without this revert and works with it.
> 
> Fixes: cb97bf3d4f91 ("i2c: qcom-geni: Fix hardcoded clock index in SE_GENI_CLK_SEL")
> Reported-by: Birk Skyum <birk.skyum@pm.me>

(this looks funny because you're the author of the revert but
it's fine I suppose)

> Closes: https://lore.kernel.org/r/179173732257.29426.7905170638383807320@pm.me
> Link: https://lore.kernel.org/r/ae03e7a3-75f1-42df-b0e6-0e64358be647@oss.qualcomm.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Birk Skyum <birk.skyum@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
