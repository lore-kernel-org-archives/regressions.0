Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CD937145
	for <regressions@lists.linux.dev>; Sun, 18 Feb 2024 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708252024; cv=none; b=a7xIMa5qVcSZLrXbLt1Ym7iiJePoR9pknn7s91p+Gocs+/9A64kvx0Z0zSirxPH9lpu63xXeDjVmjBk7/wywBIIZ5xLXOk99tmvJMb3PY1YQ1YPQ8x2DRDDh6yILwfLU4gz5ufKq8x9+1kKMEpp0JdPOpzdnFq64PXVx2PYqLxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708252024; c=relaxed/simple;
	bh=aePQbG4b2G+c+SGyhxjzdhxz8DnTmdOIk4xi7+UtVtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vEaxp3ydYh/uZwVol1s+y35KQQtvzECzOZjInldGLPGFEL+sKgilR1TJsr7hlz9I1xhIUtiJ/E9HiFbOz8OibDUZu/ihdivq/Lf84Mr4bWrI6wWXYmRe8cfX6QuWoQy4/UXJt8x9DGoST7IF+LWAfymLSIGdB0Xsy7vHbXsQFyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b930ZSM3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b930ZSM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708252021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSTWCWfGDb+Ca5J7proRAWQQgeYhikCAseb6RpZTm70=;
	b=b930ZSM3glFTyTkkM1O2neg696QUexs/gs/8XyDTzPddMUNAsWT56IogeGOPHrBgsOyz1W
	ftw8T5GoNLMVLVyPGRZ75kI0/53lQeSOm95DLny16fz/6NJXp1+sOmIDUTFDASJBEryrHU
	WYMUmdV4qcW0LD88dEbK0BKnn9B/n3M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-uSVQAhEEPGCoEI6lyFlPmA-1; Sun, 18 Feb 2024 05:26:59 -0500
X-MC-Unique: uSVQAhEEPGCoEI6lyFlPmA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a2bffe437b5so280304366b.1
        for <regressions@lists.linux.dev>; Sun, 18 Feb 2024 02:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708252018; x=1708856818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSTWCWfGDb+Ca5J7proRAWQQgeYhikCAseb6RpZTm70=;
        b=vQteFpLJ+yWhpzjZDQbd+VAhTygZ3XdZR7mlvgsJ1TmVmVpqGOb0yrPVc9RvFce27e
         PwJKUWdXuQt/OZoJ3nHVlCjGJUPkqDaLGcf3zwkZ6iIgiG+5RmujM5OtsbPTSmCyT9f0
         sNpLZcisEW9726A7eX6S676p4ctXL4P3aQa4O4jOyEcTDvioLUQ8jYdGUuXhYgiiMGsh
         3Wu8/V+6U3ySvvoKXUL1HGMygQ87xw1DYugdVquuc77ltDDIFeUyinrejKAOC8PJbhj7
         oUiyyNbaG2zPsQCVw4d1QHoJm0fMItWS+iQIDw1uHsDpUQISAn4J3NSyLcFY3eRTYxT1
         6iWA==
X-Forwarded-Encrypted: i=1; AJvYcCUODA83s/gEPfkAQJVmMq/2htaYaOHUFFUtHKVbRzNS5U2w5UF0xqnP1pyNGqKSh1TBWfJJss/qoRRC3/826GeoJO8APxWw8RcwyB0=
X-Gm-Message-State: AOJu0YxGeTce40DC+g7gJRWEQMepG3Erpml7+HuyV7rLT7mGEyeFg+Cd
	ww0T0EQsZcA1j7tsPc7IAh0DU3vhf7ZPxYesMNO5uS7VyAJHMJV3VhbJGDAQ5CYxTIL5d0PpNHX
	Onh3/m61S8vpw2zeg+b2rql+fVzIoMfk1wayEDPtA5JnFhPXUsI6DJzatGvTF
X-Received: by 2002:a17:906:397:b0:a3e:62f8:bbaa with SMTP id b23-20020a170906039700b00a3e62f8bbaamr870531eja.17.1708252018386;
        Sun, 18 Feb 2024 02:26:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgCRADRrQGCDfG54ZJZXr20hXS5ma+vll0yT7H/0sZvUFC/raicvFnaxOU/TOeWhwkUgsQjw==
X-Received: by 2002:a17:906:397:b0:a3e:62f8:bbaa with SMTP id b23-20020a170906039700b00a3e62f8bbaamr870521eja.17.1708252017997;
        Sun, 18 Feb 2024 02:26:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id un1-20020a170907cb8100b00a3d5a08ccc1sm1812528ejc.191.2024.02.18.02.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 02:26:57 -0800 (PST)
Message-ID: <3e81d005-663d-4c80-b9e9-5ddf56600c56@redhat.com>
Date: Sun, 18 Feb 2024 11:26:57 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmf: Add debugging message for
 missing policy data
To: Mario Limonciello <mario.limonciello@amd.com>, Shyam-sundar.S-k@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20240217012205.113614-1-mario.limonciello@amd.com>
 <20240217012205.113614-2-mario.limonciello@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240217012205.113614-2-mario.limonciello@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/17/24 02:22, Mario Limonciello wrote:
> If a machine advertises Smart PC support but is missing policy data
> show a debugging message to help clarify why Smart PC wasn't enabled.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 8b7e3f87702e..1359ab340f7c 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -252,8 +252,10 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  	cookie = readl(dev->policy_buf + POLICY_COOKIE_OFFSET);
>  	length = readl(dev->policy_buf + POLICY_COOKIE_LEN);
>  
> -	if (cookie != POLICY_SIGN_COOKIE || !length)
> +	if (cookie != POLICY_SIGN_COOKIE || !length) {
> +		dev_dbg(dev->dev, "cookie doesn't match\n");
>  		return -EINVAL;
> +	}
>  
>  	/* Update the actual length */
>  	dev->policy_sz = length + 512;

