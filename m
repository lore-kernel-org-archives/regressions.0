Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398225;
	b=3sVUNkTOYk7bUskumt6fY4K8OPKCbZbgwvzvaQvdIRMws5drq1Ojwmai0Xcf+5L156hm
	 AG11rAOC5/OgbZVQ7wQZ7WUenrJRutWbuaqqVVju+lRB9GUdOEIhURqUjPSCf0Vn4XjLz
	 371NeJkYd4Qw3X0fYOQtgc4wBmOSPwx6xm2fWnq6yl1Ftm4C6rh5arc9ol2Q4JpAm8Ef5
	 pYDjuVewHeuLzKGJw737tHWCScZMCbQ54NS6rfZtFnWNu0+KGmX866odkD5HIS1N4t+Df
	 N3NgI3hzld1tUjBocxm0bSik21X7r34HofzmguRM3kqP1DrzBwlKY4Vkrg8DJ28AiLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yYwVfjz75ut/AcgKweAfY5wR+RPlJVoxdZQtXPiJQlg=;
	b=40Ue2zuaZ0Ss9pfhn9764OwsDG1N37yjwFkevkXALucO6BSgKvZSdhtlNgeiOTtxqBtb
	 VcpzpzHXCQlojCNv2RoFmRR9kOQLKDe/nlFVcuIkKmTyTN9N4CAmmRBqsgQ3C4MoADToT
	 tYIKmoNMBJBX+S7hNENYJul7OyZpsshjPZ3dYBgETNnc0ALIhbfQcok/e0/yTCa1dVdjl
	 rh/SgTrVgG4tbgDtisec3+q/3fvUbLCet6VJyyy+SHUqrsJjyCDp/gWB4nTArwWAXaW5F
	 o0dAWvd8TVTqlO2N9NxHQL7EYJy9s6iMEWdkPMA8ABsVKkWC6ctvVlZ2x6ggzaPmXBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMVsou1P;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BCC60A2609
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 11:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38BCC60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMVsou1P
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b179528d56so602253a91.3
        for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 03:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398224; x=1795003024; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYwVfjz75ut/AcgKweAfY5wR+RPlJVoxdZQtXPiJQlg=;
        b=cMVsou1PKJZyJG70C5zr+EJsjKLolCfQjbqt5XB7A4h6o+3sEvAI2LLog0C6wGOUVo
         QTh8nJqdk3WqscCilhwaB7iaI5WtnyHiRy/MSAbM8/rQl1cg08zrJGAqGNjd5Du61iEv
         4ZTg5XE2dqfyakcVKoSKs0LiYVBUCmuOAly43a7vVdIIT78u2ZA4rOS+3GdnEMN7wf+I
         XLZEVULKRkbh9hg+oxjxQFfNlpm3GSswVgeq+0wF/Uu2kj8jC/KmQVdge34uDdxd7ifA
         XieFM4gYGw9UjNhyMSus+1f4uY9SpfgSaaamsxiTPODzhVVXcKei6PPz1VRjshzq5Qy3
         MRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398224; x=1795003024;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYwVfjz75ut/AcgKweAfY5wR+RPlJVoxdZQtXPiJQlg=;
        b=UwCv8oyyvEG9fo2G2uTPUkcPvJU4GtayxbXhS22eJl2hjysybUJ/VbN9c7a/b/bh13
         ISVjpjRgyl7eAX3S3Ja4uNwrDhov0515XJiCCpsxe4CygzMMRSHvBsGOvPgdWuutKLaD
         +6A9mS2EwrLgWMD8AG0XXN2wcZ3OMAqMaqpv1LnF0lPZG721DDTx7Q5nI0H56tvYLNe6
         WFUl9oDMg3TcJ/FLi9Eo/UehUmW1upOyb4Yp0tP742hwRVaHPrLf4m4HYinuLWyW60h4
         kA7YoYT9HfSU0R7XRwQxAzsp/gvbnjUqZ3dCLY0OVAOmPL0lFTddZHtKexzUPxV9syun
         pZGA==
X-Forwarded-Encrypted: i=1; AL+hErEsKAJUwdR91D1wiJthB+QjvSo9OPmPr0WxCd/lWtCN2fx2v+YrUFfn28qvXjlzs/o3rRbDwiyIooYeyA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+9p3Lru1LqYk2D9fwlB9OIc5aplfQ6Bmb7FnWp31iYHdpGsLdb
	cIXDLd6g8z0Jjzu9aEwcDyu5BuKScuUGlzFIHZVDe9Dkxii93jxsXI2i
X-Gm-Gg: AYBFou3LFvssaagsgzkjD/4mP4duISyn1HpIZsyL1Jm4eiGiyldTJ1+l5Cknf814uOb
	SeuJp22uaVw8C3Ym3LE1uH+j19k0wt/115BdLqBR5Tyo98C+2i9fBxlb+r7EdiV0A1uWm7xbi9M
	WBaKQEcSdrI05FXszMhItmT+8EIarxUPklHlQsENIHyxgzc+0QDoHgRWJpbkm5twI/erxXXSkOE
	y1eEzCQbCMozDOubzP0CLM2kum2qc7xaE1Hu2BmXgvENOoNJ8pQFOm+kHFIemcg+xzjE9ijzbLe
	Sjmbe5qPKRs8depcZABHUCMCOzE/PTcuNRNUFw1Z6iHFrbXaWD6+VeZTHiVTk/tiPBtviu+mskr
	4OIgbm7oiOiKNG7VkLFYxfvWhGEYBwPxVSfgismr/SStKRy1igQgacc0ODxQqRbso9vb53lySOP
	aO9T/rgsH3ufyXJQyYvrmLHdqybhzgecQUr01AittWWnpaUQamnuRcS9Gp7rnJnl9d81xoWVxya
	Lp/2X8BQeAmdrhNNU+bzJBiVUPhXjlT718MJ9SZlr/IKOm5KpNvXyb/cB1qqSoYVRZ86+H/Cepa
	xkie+Zzcfcn/Rn8QRdje76PbIH+LBzLeocp4eHq6xAJvDx1vBA==
X-Received: by 2002:a17:90b:4c4c:b0:3b0:e2a9:3466 with SMTP id 98e67ed59e1d1-3b182eebe65mr2137944a91.16.1794398224505;
        Wed, 11 Nov 2026 03:57:04 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:a3fa:5561:c74e:50a4? ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e1f88casm4108769a91.12.2026.11.11.03.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:57:03 -0800 (PST)
Message-ID: <49e43ccd-fa28-44a0-9e8d-554868d0585e@gmail.com>
Date: Wed, 11 Nov 2026 19:56:58 +0800
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
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: Oleg Rybalov <rybalov.oleg.dev@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 regressions@leemhuis.info, regressions@lists.linux.dev,
 shlyapugin@gmail.com, Musaev Ibragim <atomicus.xyz@gmail.com>
References: <CA+Kibh6FHk-QgmPsi4spmQ5MHGvt05xYHuRiiMMQdPP+31Z70A@mail.gmail.com>
 <f718e7cd-24f1-428b-b9f7-28bb1a923a11@gmail.com>
 <CA+Kibh6T9tPKwhSF2X5Jwoo8OUoieypuAyM4GBKVujUDWgpr-g@mail.gmail.com>
 <08e0f238-4330-418b-ae3b-fa7ce0f6ef62@gmail.com>
 <CA+Kibh4GtWjz97Fnxa3n8-B9+dTtcG5oPtn8b3HvcpUcR3Su_Q@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CA+Kibh4GtWjz97Fnxa3n8-B9+dTtcG5oPtn8b3HvcpUcR3Su_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 04:35, Oleg Rybalov wrote:
> Follow-up with what I found while testing, and a correction.
>
> [...]
>
> Not covered: the address comes from BIOS RMAPH5B0P0909 only;
> profile_get returns an error if STNM is outside 1..3.
>
> Cc'ing Musaev Ibragim, who tested the Redmibook side of this series on
> the same board and BIOS in July.

Please send your patch with git send-email.

https://git-send-email.io

