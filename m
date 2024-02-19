Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDA42E410
	for <regressions@lists.linux.dev>; Mon, 19 Feb 2024 12:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708346273; cv=none; b=D9ifHlE/xlc3i7nv1EsjPRCXxBNnLgfvPGZ85W4pR3KnO8x+LsyK2X14sMkojKZFnT1r3l48Y6y1FYDmyiqaX3dp3/uB/nBRyLzcfMlxypRxazrBfEhF9zlQNfIkMzicT2hpeb2L5qw1abK+bmSZzMMZpYE06OUdMRorcvz+Z2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708346273; c=relaxed/simple;
	bh=GY8KIVqzsOKGT5UsEsAg9niPyy7MPrFyGo7zraijhPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M27HtmJ/ArVfPw/5Td2nzupBlzp+qlco4zZSfrKFYLgHm/U5MqR8sCMPe43WwZw1fPWIEJpgJrEV8VDj6uXNoot5nTGhfc53/jYLBGCugsBbxJgz3oG7aqT8leqqbjb98gfrl9CWD68YLNQyllFPAuJew9aHFW2XMD4uFqkIM4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=duV+qDeB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="duV+qDeB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708346270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9NUbNB6aBViIXTgaODmTHiYaijHpW84fTtczd3qM8yE=;
	b=duV+qDeBKp41AVQEj/vnh/WfRc0Brdfi89t/hRxUL4Ss7c4rtVKpz2PKqMMUhXR665Ptm4
	pqX6B8mmpBD05Rj91i9u/dnwg3bB03z3zXsv7MCutnnZ7+8ZJQNrgD9Es7WKr0WJkQVq0o
	DgeISgYr56gFMNUqsEJxwBmp3PcMbKI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-yOViYoGLNSWkinJjTXAaOw-1; Mon, 19 Feb 2024 07:37:49 -0500
X-MC-Unique: yOViYoGLNSWkinJjTXAaOw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a2c4e9cb449so336828666b.1
        for <regressions@lists.linux.dev>; Mon, 19 Feb 2024 04:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708346268; x=1708951068;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9NUbNB6aBViIXTgaODmTHiYaijHpW84fTtczd3qM8yE=;
        b=CSr9t7KD4hSKdPf3sC9lJWGDZmVt1d1ZXMEPmjvh3P0lEs8smNDVFLSObqOLgLyWxL
         uuAavQehUioYuRziAUnxC88irgXDxjSzAlmZ8CyIWuordRANPl4YLqtukoDzV4H8zVgq
         i6RDlRnHRmuxjAfbLNuvcy580cxTmMtcVGrO9Dvci2YnwMy6xoSbm+gvtQOcE5mgEvB0
         ccKyK9WdIf1ZJXLiPd+42noHxxqek8p9ZTUUqMXPiswdzJoYxAp0Vg5Hr1SFtE6BEg4h
         H+qUygWVld6eEzPjZdlS0Y9vMcXWOdpwrHm263UcjWhRu+oDNIOt0MFXlRWNm1R9zV2q
         JxvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPYU04C9GEGr2jrTggEomx7D6OB4EAoHD1HQ4plnJhUSM3AWlMmY8pUZHpDjHdXFtR+su5JXnGScRrhVgdpeLQMc1lrJNZGi9xkRU=
X-Gm-Message-State: AOJu0YxUEeshHU5Nc6OziaF87x7bNYSYaxOLtWmvRPdd+EO9Y9LOcPjU
	S7KON/ofQJW0xCGN5yYeLXRy/AP/JhnHStINZ0s7MToVsSkX8+bkkwweb7dt/tD/B4UT2tVDe99
	+Oh2jWWNHIwUMIhh5MychoywaszdR83aRqjgWUd+YcFkY5wgIi/1RWW0wRYMK
X-Received: by 2002:a17:906:69a:b0:a3e:a8e9:9662 with SMTP id u26-20020a170906069a00b00a3ea8e99662mr1196625ejb.63.1708346267907;
        Mon, 19 Feb 2024 04:37:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqz0b4HLJ/9PQmyPbkskX7AkRoz5aMO+JB6bXzgS95r0pkYly3Y7zosh6lr80y/WHlAvfrxg==
X-Received: by 2002:a17:906:69a:b0:a3e:a8e9:9662 with SMTP id u26-20020a170906069a00b00a3ea8e99662mr1196618ejb.63.1708346267564;
        Mon, 19 Feb 2024 04:37:47 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id wp1-20020a170907060100b00a3e2e03c155sm2363377ejb.155.2024.02.19.04.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 04:37:47 -0800 (PST)
Message-ID: <8c5e67e4-9625-44c9-9f1e-f098d38018a6@redhat.com>
Date: Mon, 19 Feb 2024 13:37:46 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Fix a suspend hang on Framework 13
To: Mario Limonciello <mario.limonciello@amd.com>, Shyam-sundar.S-k@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Trolli Schmittlauch <t.schmittlauch@orlives.de>
References: <20240217005216.113408-1-mario.limonciello@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240217005216.113408-1-mario.limonciello@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/17/24 01:52, Mario Limonciello wrote:
> The buffer is cleared in the suspend handler but used in
> the delayed work for amd_pmf_get_metrics().
> 
> Stop clearing it to fix the hang.
> 
> Reported-by: Trolli Schmittlauch <t.schmittlauch@orlives.de>
> Closes: https://lore.kernel.org/regressions/ed2226ff-257b-4cfd-afd6-bf3be9785474@localhost/
> Closes: https://community.frame.work/t/kernel-6-8-rc-system-freezes-after-resuming-from-suspend-reproducers-wanted/45381
> Fixes: 2b3a7f06caaf ("platform/x86/amd/pmf: Change return type of amd_pmf_set_dram_addr()")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


> ---
>  drivers/platform/x86/amd/pmf/core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 853158933510..4f734e049f4a 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -299,8 +299,6 @@ static int amd_pmf_suspend_handler(struct device *dev)
>  	if (pdev->smart_pc_enabled)
>  		cancel_delayed_work_sync(&pdev->pb_work);
>  
> -	kfree(pdev->buf);
> -
>  	return 0;
>  }
>  

