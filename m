Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C232599
	for <regressions@lists.linux.dev>; Tue, 16 Jul 2024 01:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721094277; cv=none; b=SdK5hpYeZGxdwy3k8RD7FaYjvHKps3AJ3b/LBE5dljFUJ6lLZttA+k26GRK2VI/D7Hn2Pot19dQvRr+emnZm1IXXDfHdbBPlhlQzJZF9xsSrkLSBjjcGGTHuv2ZIzqdlf8zRvpop9jcttQczVKkjSb+I69HgwWF7US5J6p5zQOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721094277; c=relaxed/simple;
	bh=7zZ9tQnbqTU68C02onBT3UHWbkDPBTNCRLUcaCpM+a0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XW2p0EPVCY3bBYaS8YaZYFP70zsFyZ8Uhp4WF6qwcE9UUwRWfKRb1sg69QFc9hAQCdpY3RNz9BuPDs6ZW11C0kN+LTA4LD6TLNlFXOZ3yosk42bnmNt9rBPNO6cjL3+rgHiVIVJaNZKireO+iG8IMDWjZVa5N9pB9R5i3pZ5iK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schmorgal.com; spf=pass smtp.mailfrom=schmorgal.com; dkim=pass (1024-bit key) header.d=schmorgal.com header.i=@schmorgal.com header.b=Y5f1ZyD1; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schmorgal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schmorgal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=schmorgal.com header.i=@schmorgal.com header.b="Y5f1ZyD1"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70af8644530so151731b3a.2
        for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 18:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google; t=1721094275; x=1721699075; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Qt/SPI9w4Ydlf5F3lgn/F+VMPpJrd+IRMvd2pRUL/U=;
        b=Y5f1ZyD1TuvfBQuvoWrwkjK/idw3xMAoM7uARtWNOQRYRPGGjQIcX/961+LUveNxd+
         /53lYIunpuPN9kifll5dvNrzJBWWBfn3J/h8ciW3yHPYwpw4uUUO5E4YUOldVNW75gKQ
         xv8O8SCrJVnoyAP9wHTTXfRZ0EeY27ZDGRcRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721094275; x=1721699075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Qt/SPI9w4Ydlf5F3lgn/F+VMPpJrd+IRMvd2pRUL/U=;
        b=LqNWGwUWJvm91GHbgBCvw1DP+Vtj9Ps4A5MeDTTdUTN2GXPxb1CxFKv1LpjuyEFQE0
         FfbH7+ZBefhsp3+qgqUp1rbJNtivxEsDZmNgJ/aQi0Xn299ExysEeXpLaOaap8miwoOj
         EdkwgRdvNl7wBJ0vap8/lj6IcOKqcyjUx8eoOufKrioY1PJIAiV4HbyAtLGbV9xDaXnX
         NXAqF0QyO1/6CdCq/covn3wVNjHlPu5wuQCjugEQNX0j9NEAYy9dCHAigHGOzZgtg3id
         WTFXshUQm7Eq4D2pGhyCxwZ3YzCyUUyJ3HeTylxQ+EeWMJFYGzMryikDBHNV/151Wmj5
         McjQ==
X-Forwarded-Encrypted: i=1; AJvYcCULVA/CIr786Xm8IQEybHM/m3FnC2aiXt4nt8E+UI7GneLfe+IRxhKLRj6wtKQ5QbY8QGgBEBmze/GW6TcFIxBIcs/SdQ+eQ9UkaVo=
X-Gm-Message-State: AOJu0Yw+P6aGGSFS23n8wYLfVgpxzfggYa9a7lp89dhyDZ1gYY9Z4eZv
	Dcjy95I3JwBoa1x26thwhJD9a7Vekd/+L8uWnbjonkLIHfoujAByVgHLMqTjKPI=
X-Google-Smtp-Source: AGHT+IHW+WnJXZahgXnwYzOQ47BHvXthzkNIwiv+2EdlxveKcdFOl0yH2UivBrARch0QR2rf9MWqpw==
X-Received: by 2002:a05:6a00:6584:b0:70b:705f:8b12 with SMTP id d2e1a72fcca58-70ba48e76efmr1093813b3a.4.1721094274807;
        Mon, 15 Jul 2024 18:44:34 -0700 (PDT)
Received: from [192.168.1.33] ([50.120.71.169])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-70b7eb9c8f2sm5073301b3a.41.2024.07.15.18.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 18:44:34 -0700 (PDT)
Message-ID: <1e7be166-30bf-46ee-b5d3-93def3465b07@schmorgal.com>
Date: Mon, 15 Jul 2024 18:44:33 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] drm/vmwgfx shows green Xv instead of actual video
 (bisected I think)
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
References: <bd9cb3c7-90e8-435d-bc28-0e38fee58977@schmorgal.com>
 <CAO6MGtjxnm3Hc=T8jv-upP46XBzAc0ZNmLVF3=KNN8buGBwg1w@mail.gmail.com>
Content-Language: en-US
From: Doug Brown <doug@schmorgal.com>
In-Reply-To: <CAO6MGtjxnm3Hc=T8jv-upP46XBzAc0ZNmLVF3=KNN8buGBwg1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ian,

On 7/15/2024 12:32 PM, Ian Forbes wrote:
> Hi Doug,
> 
> Can you try this patch with 6.10.
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> index c45b4724e414..e20f64b67b26 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> @@ -92,7 +92,7 @@ static int vmw_overlay_send_put(struct vmw_private *dev_priv,
>  {
>         struct vmw_escape_video_flush *flush;
>         size_t fifo_size;
> -       bool have_so = (dev_priv->active_display_unit == vmw_du_screen_object);
> +       bool have_so = (dev_priv->active_display_unit != vmw_du_legacy);
>         int i, num_items;
>         SVGAGuestPtr ptr;

I can confirm that this patch fixes the problem for me. Nice! I did have
to manually apply it -- looks like email converted the tabs into spaces.

I don't know if I'm supposed to put tags here for you to include in the
final patch or not, but I'll do it just in case:

Tested-by: Doug Brown <doug@schmorgal.com>

Thanks!
Doug
