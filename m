Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451160;
	b=YQWJ+7K/KjbJTeZOsWge3aSVVPeJpam9VVmW0hrsYSH0YeARcLiCRHypozNRhMAFBwsI
	 L4JaYxsbrXUHZPzVc1wFsf3JNIiGhn9PTH6fcnzYnmPIULFdFS0AbGg+LN9moCEIrbxpF
	 7nbb6WEEzP0YGiV8L/8pMJLsM9XFJIpsjHY6FQ4j0nAD0HML36HnEIAG2+OGMGjt9os1a
	 O0gLb2GmVspxxTpo/Mu3IQN7n9op2TjzdZObGREXo/9XmbQblg0g6zCYQ/hgvonuMiPCP
	 BJ4aSCbZhRIadoU9HV5C64YkMWR7DdGFPIc46niLOAoSH1YNcr7gld9iQxN78aJ4c0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UKsPhBFXVevVRUvcrB6+ZjmJljc8N9iawL0bPcXvtQY=;
	b=sb76lGNPdPlVyySa8m/Uv5Sbov2H3cyE9vw/RPAnOsBj1OVTko/nHG2LOh2VAercDVSZ
	 zmvFP3Pe4Zbk0V8Xotr9zD8Cdl/H2glHV8eI67EOH0/iXBsz0zPTujqD6Ri3aegaPANW9
	 NgO+pEMEmYCz+9t3JAYTK3+T6D3ounMCsVZHBk8az++twVOxkplg2GGzxk1kRiZsQrSb1
	 y9ACC7EmFbJZ8cJSnVDlGTIEaVl6t8tfQs3fYXyVTtUEi79Y8X+Dk1NVGD2Mjt2H+XeiD
	 BTjMCqE7eSpwFHOAbgEh4qfpOrx031v3enxFcYx3vRobon/S3Uz5gtnSexHoa9eFycQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o++ksNix;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEC8606A333
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 16:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AEC8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o++ksNix
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1626939b3a.0
        for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 08:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795451159; x=1796055959; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKsPhBFXVevVRUvcrB6+ZjmJljc8N9iawL0bPcXvtQY=;
        b=o++ksNixaItrKUG5PC7arTR33Sa7jAr/wtRJ+8e6wH18J9tZnI1OEBN1zvBMijQbCn
         BpqMYFU863hDHnSPQqthzCKhFsM6me8OY1qYLGLUoknFnoa58S9w2JQOJ9teVekNxowf
         D27vv8Zp0RVZ3BSc3w4rR8fHp2wvTNshqEsdzljgJ1tsbJWWd1BpPdM81Z+TgcLaOMZj
         SmOpsntv8H6fs7PAT42bYHQXvUYTcd6dcnAxdx2BvoA1A3seppndbeKTRayzhu2LR3V5
         WQwoVguan62dh2qLt24rp7XhrcZBRMmx/z26AyjsED98O7rZL3lGKh3LaXK4FoOJlpML
         g6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451159; x=1796055959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKsPhBFXVevVRUvcrB6+ZjmJljc8N9iawL0bPcXvtQY=;
        b=0YUm+9jF9h6lJ0hTeEVIW3gsL1cx7/ZEGrfkh3B/gv0RRTCmwAzPcd+NFyYmYnyo/G
         7AXa8nURxpvYKxk+uXaq0/ugrWARgkT1/DQY0yTQAH6LIwE1be7QMSktg60rJIS8zU/U
         F2JwW6pR9sIp4m20lScaF+PzviETVi36gqM8jM6W1ODV/k1Rf/xDtDtPtNelk+EF7VrT
         gTQXEZduPksNBnaONFUMZj3a3xiyrLOUGg6np2/JLcoQDhZWnxDUi6+4Mchf1KhjWFeC
         Vj4XDoaSGsOL9ex/YTK7WlJPOulGr1QmhqGloIFGV0jK05sKwDccabdXZDFFJIx3Ct70
         U8kA==
X-Forwarded-Encrypted: i=1; AL+hErHFgHt6OErNb9lT9GvvzdJWuq5IppE3LX/GgTpuIwIrGMc2hPhSSQJOUswQ46lpKHqj3b+F3HejHWT+FA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9y8rg6kOs0t26lZQ3EMou/GnWGxTDh9SustLUnEHS0BNWtk24R
	I39tQmMbwa1ViEH+N4VWYOKik9WYFDicrq3t84mifJBa+8reI2hwzWs=
X-Gm-Gg: AZFdTZcM8ANcpU24OkqHIBtr6eeuYVAc5jz4pfhlwX/sjDEQs1pC8cvf60bXS2Vs2/R
	6elxqtjTQna3MHgziFWTd27N267DXEbzL0R7e06uNOTCRKFWOTs5KBeTK/MbcGO/F/64GnVUp4K
	dTSRx9bJUb5lpZJwtEOwYIdt7OxbHwZI+2Wb9Q2v6oTZvkBCGjncuuKnf2FysLRgblcQ2YnSoMH
	cxnYurc7oERzm44AD02m8EePRJa20D0CyG0xhco0peryrcJ68rqtnH+tsnOxPuG7QRDfaPBdf2H
	KFCxworEqWR//vJb6FVXwzj09QuQ4oDcvCP2D7m2PeeoGe3x8SKte9CgkKnqZsPDmAMFFxrD25b
	acBToIsXM7bqZhZ+be2YST3+0FPR9XnHeDsuJv6akdy3rDKI7CdayNHeeYXfMdoFNTFTvB8nUeL
	hwUmy0AfUyHaPufUNtaV3Ghr2uzdWzFVGEWDGpEUDAhRlT+BNdxsEsLWn0Lvr2FWFqY65/7TFur
	9CbYMJe53C4iCLbEBIEel8nbZwkOYbT6mENfuHmOSkUgsJb4TJIHuiUmaHJbSocTq5CVLAiMnIf
	ISWbFwNDwELlvYbkz3KeYCSiBguDwAQjKe4gNISanjsktLv4Mfks/fZvjLoik+w=
X-Received: by 2002:a05:6a00:94c8:b0:89f:129a:9590 with SMTP id d2e1a72fcca58-8c87d01fbc2mr10377955b3a.48.1795451159489;
        Mon, 23 Nov 2026 08:25:59 -0800 (PST)
Received: from [10.1.1.198] ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm5904879b3a.28.2026.11.23.08.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:25:58 -0800 (PST)
Message-ID: <6052053c-5e1c-46e4-98e3-e6e7608683c1@gmail.com>
Date: Mon, 23 Nov 2026 08:25:57 -0800
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
Subject: Re: [PATCH] drm/msm/dp: skip the link teardown after a failed enable
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 robin.clark@oss.qualcomm.com, Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
References: <20261104072048.3486286-1-burke.cates@gmail.com>
 <0212b0be-857c-475c-98a3-165df9de34c7@leemhuis.info>
Content-Language: en-US
From: Burke Cates <burke.cates@gmail.com>
In-Reply-To: <0212b0be-857c-475c-98a3-165df9de34c7@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/11/2026 03:00, Thorsten Leemhuis wrote:
> Was this regression ever resolved through the proposed or another
> patch[1]? Looks like it feel through the cracks, but it's easy to miss
> something from the outside.

No, it is still open, and there has been no reply from the
maintainers. 1bda647ce61b was not reverted, and nothing in
drivers/gpu/drm/msm/dp has changed this path in v7.4-rc4 or
next-20261120: msm_dp_display_unprepare() still calls
msm_dp_ctrl_off_link() after a failed enable. The patch applies
unchanged to both.

Two other postings touch the same function, but as far as I can tell
neither covers this path:

- Gianfranco Mariotti's 7/7 has a Fixes: tag for 1bda647ce61b. It
  gates the dongle power-down and PHY re-init on dp->plugged for a
  cable unplug; the off_link() call stays unconditional.
  https://lore.kernel.org/all/20261121214105.32596-8-gianfranco.mariotti94@gmail.com/
- MST v9 08/29 replaces power_on with active_stream_mask. After a
  failed enable no stream bit is set, so unprepare() still runs
  off_link(). My patch would need rework on top of it.
  https://lore.kernel.org/all/20261119-msm-dp-mst-v9-8-ca61be4edfc3@oss.qualcomm.com/

Xilin Wu's broader rework (hdr10 v2 09/20) has no newer revision.

I'm happy to send a v2 or test a different approach on the A16.

An AI coding assistant helped check the trees and draft this reply.

Thanks,
Burke
