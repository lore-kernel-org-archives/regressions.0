Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CB412E61
	for <regressions@lists.linux.dev>; Sun, 18 Feb 2024 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708252000; cv=none; b=OEY7ASnYENywUrXUF3neSE5njhqRq5wlmliTgX8e2HYf77HqcpfBX6O2cHFWpE7KhgxgfK6JCPu259F3fx6vBem0Ej0Saqz0SQGbgIOlMZZ8V/FGrPXNWGoFyTRz9tsbhNDchY1vdSgXmZzcUy5kVuBqnU2qfpwp9lLWTQ7VuTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708252000; c=relaxed/simple;
	bh=73xM8HfwtjYvZeQh6N+9c+UZ7gdRDzATR9UR06S7DOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LaIecit1MFcJbOsE401ochxQeKjSOf21/CDzr+9aKaj5J1sxcYNVfm8fmKCTNIIes7KNmffJTWgPR4RO+bn2upcLNY4SG4xeI7KFwXscAuRV1F08p4UVsnLP331h4pxtbK/QzMGipIH8zyxvY1c1i/wE1z6BjyPEpoQQdEHXGMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HeYLv+CV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HeYLv+CV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708251997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3iL7cm/0gzvphX08YlG1pTdWcKTR7vjKbJ6kYFx0SGQ=;
	b=HeYLv+CVBfZw/yWI/+ArjAMDOLqHk84qx8dPGzXshzld34taARkfIAJ8P+VlPm1LJg36/c
	94PdN7VCF3xZhEB0FjftBOafWs7upOoJSOZcpREnLwWn8UPWnpkoQ6kXSWgYuJIdEhjcge
	q53Sp9bC9qbRia/qcm5bNVdtpX0YQg0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-lqXoZnzDPrKU0BIDTW__FA-1; Sun, 18 Feb 2024 05:26:35 -0500
X-MC-Unique: lqXoZnzDPrKU0BIDTW__FA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a3bdd99a243so322453966b.0
        for <regressions@lists.linux.dev>; Sun, 18 Feb 2024 02:26:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708251994; x=1708856794;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3iL7cm/0gzvphX08YlG1pTdWcKTR7vjKbJ6kYFx0SGQ=;
        b=e+0MgvQy+gkGf4Jf1U5oYaLqAexMyAEVRDnD3x1H5wLXEL5niUlL5x0dy+kuH4sS2v
         zH4ija0gDq6qgf7DiR/vockl3AL4sX5P7E3G6MEhhraUWwuW1/aKz1VvAXOMejRuJBib
         2oCtH1pKlg7LwTKNARJfOcrOHdD53l1ZDSQPbZPVjyw+VN1LgE/UUTPTOVxv9DHuUOea
         s+eormmU8uJkelNH/ApNaktIIYYnjj6y2iq36dmRiwdZumsfquz/78LZR4QBDDKafjoc
         Ni3HUcvCYPdyEHRWM7UtW7GK/Fp0kkXsM+8TBmGsHtdayfB8P2WibIC8Zc0AQZQdTD59
         AgKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgs8Bs0eu1W3Wk1xJ0jwzl1QplO6gxTSH/p+4ooky/Mc5CNR2pCKBUxsdOAR0Ovp0SIo1EW5zQ/bAZcxPKCX2IFlHMlI6LzVBP6lY=
X-Gm-Message-State: AOJu0YwcapEc6Rd74cb2EfEdif+IedwQ8jTLzoY2NC4/7AGCCN4RKuxo
	oT5mRYnkcWuUM1HSM5nU54aR07cfBNGFdC8L+J9m7M3GTe8Oqs9M4X0mtiqCGq0shq8kH9j0Hu2
	yBGL1KxyPPM9kG65p9VXSs/AUSsSJHK4FXxtFgEdIM2njdp787MDXBPic58W+
X-Received: by 2002:a17:906:d293:b0:a3d:df97:47be with SMTP id ay19-20020a170906d29300b00a3ddf9747bemr4945775ejb.1.1708251994466;
        Sun, 18 Feb 2024 02:26:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2LPWogWqNaTO56lcudkdC1bbE+GHPBOzFooj4aTxaOOb4vFusuX04kOGUJ+8ZKLqElym9FA==
X-Received: by 2002:a17:906:d293:b0:a3d:df97:47be with SMTP id ay19-20020a170906d29300b00a3ddf9747bemr4945752ejb.1.1708251994129;
        Sun, 18 Feb 2024 02:26:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id un1-20020a170907cb8100b00a3d5a08ccc1sm1812528ejc.191.2024.02.18.02.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 02:26:33 -0800 (PST)
Message-ID: <f6cced34-087a-4593-b510-a8a728deab97@redhat.com>
Date: Sun, 18 Feb 2024 11:26:33 +0100
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
Content-Language: en-US, nl
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

Ugh, I should have caught this during review. I especially asked
for the alloc parameter to amd_pmf_set_dram_addr() to be added
for this. Ah well ...

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

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

