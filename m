Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E41239790
	for <regressions@lists.linux.dev>; Mon, 13 Jan 2025 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736760356; cv=none; b=T6hRQNy0Ffp1gMtgdNmHLGWDXtTdU+K58c/4J4U4X7bZfncfBNlgdVwARDIJ9PBekzxX7N7Zn6RYLSp177D9OSbxqSXj/VUmfyVZUW2Cy9imvot1Sq4Gf/Z0UeMlR0tXnJVsAXhGrnd5/pkg0RtqEe7jFfUPAj0IRVwI53ox5L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736760356; c=relaxed/simple;
	bh=I7jtrYFX8NwyBNgoJwjFGDHlT+nlofEimAek6xAmWuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFITyOygUR0HdTPh0wYyxXagu4ffrqXOryTUR0UA2G/s1CrFNOOnzX+wmUVgrpcwe8wpk8EDtaSNGKxE6acEwxIgkaP8U8qlqx3Bc67P9i6WW/e2CMgm78l5slUf8vpIJ6mA99/hdltOJyvDHrjGcZHOd9o9fxKHk69P+9pMiFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WNVsjbnN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WNVsjbnN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736760353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Anfkmk5eIXHRBtHcAoLzGmn+FA7n8XKUaOMpxGXT8us=;
	b=WNVsjbnNFe49d26YdXLkcTiczGm2VmRM5HLl67nUh2Bo3v1VOaXdNB497pnE36aYlSva8O
	2YlB4QAUlacFk2ZaTteEltmXuAskkn8S0LF+l4dBaHuOc6XpvcCeZIlgiA7jeVF54GQPH1
	/r5MAdK0jHTOSTb4+lHPtK8zF86D/5g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-nNwqfg0hPTCujbgZs8Zw-w-1; Mon, 13 Jan 2025 04:25:51 -0500
X-MC-Unique: nNwqfg0hPTCujbgZs8Zw-w-1
X-Mimecast-MFC-AGG-ID: nNwqfg0hPTCujbgZs8Zw-w
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d43ec75bc4so3703652a12.2
        for <regressions@lists.linux.dev>; Mon, 13 Jan 2025 01:25:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736760350; x=1737365150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Anfkmk5eIXHRBtHcAoLzGmn+FA7n8XKUaOMpxGXT8us=;
        b=o0tu7kdCr/Q54CVkz9AUOlD2ttfREvmTvOcnu6H6FwwYjhQwfMQuA86PajtGpAqQQX
         2dBLsQmJ/R8wgWehbbRdxCrgV/BphrypJHA8/QRjbBWtRr1f4J4VtPg8DdqodYVCuNY7
         1RhCtc9b/FS2DjlHQsaUg2oTKpNZFEC3DicHPjlYyPPmRISe5DrwnbOdAtV+wQ2htQ6P
         9i0Vmx7UAwrusi+oJlMfwGy81egUbVT+vFfyDk/AXKMg1rWQ1vAS/PZTxWn9L7Q3Is8M
         6nbVlwCvEcAIdoyrGzPzgoYmKZEIwCIJUEACSY1Zmc5zrFETcFtoXrGSV5WLxpnF2Grj
         O0sA==
X-Forwarded-Encrypted: i=1; AJvYcCXPWrtMnpt1Nz2DJlFIioKL7akL+DJm2/rO5Xl8oiw75cpxvNVbdIkfmC7wX4FZ5St1my0G0RtXOw3CbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzN3ulrI278k5b3GdKl9WHaXsHATlwAKjU4nTDmvMFodzIsdcq7
	6RvBeM3G1nYPtDnyNiDiLZcAWcaLmemFnF3WcCPzH/fjz84JWFmo8odWWEBit61JOXYOWfsOCAg
	IjRDDAJ0ybdBFft+IoLM0UObSLoEeVM3ZYjNpPDQmrHRF/l97pEvNOgyOk0HG
X-Gm-Gg: ASbGncv1TyG8TXQfsiW6BJy9x50RvJ9o9Upqfq008aK2X5IDihiGJ9ixFw7TN03QfqA
	25Ny9BtegxAaecOgPArPn6b8406w2a3C94Piuwwy/6FmVgYjaA4S6AI5XPx+yuBMCkbGqCmZCQf
	qoAZ5uKxtJZ+h24R6KOqz7U8deETHrH2gRkFJJY8y9/prv1JN0y+TqjyCHWY9g+bXkb6gY2/qms
	1Xl+JPpKbI1M9ka6NJQtgG7f2+uW1cixSvJlqNZn5XXWpzpxW//N1YuF+uJ
X-Received: by 2002:a05:6402:360c:b0:5d0:e826:f0da with SMTP id 4fb4d7f45d1cf-5d972e1683fmr19533137a12.16.1736760350248;
        Mon, 13 Jan 2025 01:25:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG78H0pXhzhxaOz7jwatHbOLLwf8gzKXFnmuzkS+oexEXq4wWGsB1QoLdJwllz3q9jZAAjDsQ==
X-Received: by 2002:a05:6402:360c:b0:5d0:e826:f0da with SMTP id 4fb4d7f45d1cf-5d972e1683fmr19533112a12.16.1736760349793;
        Mon, 13 Jan 2025 01:25:49 -0800 (PST)
Received: from [10.40.98.179] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d990469ee8sm4720711a12.70.2025.01.13.01.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 01:25:49 -0800 (PST)
Message-ID: <809d617e-b0e5-4322-a6fe-00923babe5f3@redhat.com>
Date: Mon, 13 Jan 2025 10:25:47 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ACPI: video: Fix random crashes due to bad kfree
To: Chris Bainbridge <chris.bainbridge@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, alex.hung@amd.com,
 regressions@lists.linux.dev, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Z2yQvTyg_MWwrlj3@debian.local>
 <b98f2fa5-fbe8-4958-bf20-fa5d28c5a38b@math.uni-bielefeld.de>
 <Z2yw_eJwR5ih1Npr@debian.local>
 <CAJZ5v0i=ap+w4QZ8f2DsaHY6D=XUEuSNjyQ-2_=DGOLfZjdn+w@mail.gmail.com>
 <Z4K_oQL7eA9Owkbs@debian.local>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z4K_oQL7eA9Owkbs@debian.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2Zwij9fXj_1_3478GkcjPnd1nmhyySJIT2UY086Lap4_1736760350
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Jan-25 7:59 PM, Chris Bainbridge wrote:
> Commit c6a837088bed ("drm/amd/display: Fetch the EDID from _DDC if
> available for eDP") added function dm_helpers_probe_acpi_edid, which
> fetches the EDID from the BIOS by calling acpi_video_get_edid.
> acpi_video_get_edid returns a pointer to the EDID, but this pointer does
> not originate from kmalloc - it is actually the internal "pointer" field
> from an acpi_buffer struct (which did come from kmalloc).
> dm_helpers_probe_acpi_edid then attempts to kfree the EDID pointer,
> resulting in memory corruption which leads to random, intermittent
> crashes (e.g. 4% of boots will fail with some Oops).
> 
> Fix this by allocating a new array (which can be safely freed) for the
> EDID data, and correctly freeing the acpi_buffer pointer.
> 
> The only other caller of acpi_video_get_edid is nouveau_acpi_edid:
> remove the extraneous kmemdup here as the EDID data is now copied in
> acpi_video_device_EDID.
> 
> Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> Fixes: c6a837088bed ("drm/amd/display: Fetch the EDID from _DDC if available for eDP")
> ---> Changes in v2:
> 	- check kmemdup() return value
> 	- move buffer management into acpi_video_device_EDID()
> 	- return actual length value of buffer

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/acpi/acpi_video.c              | 50 ++++++++++++++------------
>  drivers/gpu/drm/nouveau/nouveau_acpi.c |  2 +-
>  2 files changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
> index 8274a17872ed..3c627bdf2d1b 100644
> --- a/drivers/acpi/acpi_video.c
> +++ b/drivers/acpi/acpi_video.c
> @@ -610,16 +610,29 @@ acpi_video_device_lcd_get_level_current(struct acpi_video_device *device,
>  	return 0;
>  }
>  
> +/*
> + *  Arg:
> + *	device	: video output device (LCD, CRT, ..)
> + *	edid    : address for returned EDID pointer
> + *	length  : _DDC length to request (must be a multiple of 128)
> + *
> + *  Return Value:
> + *	Length of EDID (positive value) or error (negative value)
> + *
> + *  Get EDID from ACPI _DDC. On success, a pointer to the EDID data is written
> + *  to the edid address, and the length of the EDID is returned. The caller is
> + *  responsible for freeing the edid pointer.
> + */
> +
>  static int
> -acpi_video_device_EDID(struct acpi_video_device *device,
> -		       union acpi_object **edid, int length)
> +acpi_video_device_EDID(struct acpi_video_device *device, void **edid, int length)
>  {
> -	int status;
> +	acpi_status status;
>  	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>  	union acpi_object *obj;
>  	union acpi_object arg0 = { ACPI_TYPE_INTEGER };
>  	struct acpi_object_list args = { 1, &arg0 };
> -
> +	int ret;
>  
>  	*edid = NULL;
>  
> @@ -636,16 +649,17 @@ acpi_video_device_EDID(struct acpi_video_device *device,
>  
>  	obj = buffer.pointer;
>  
> -	if (obj && obj->type == ACPI_TYPE_BUFFER)
> -		*edid = obj;
> -	else {
> +	if (obj && obj->type == ACPI_TYPE_BUFFER) {
> +		*edid = kmemdup(obj->buffer.pointer, obj->buffer.length, GFP_KERNEL);
> +		ret = *edid ? obj->buffer.length : -ENOMEM;
> +	} else {
>  		acpi_handle_debug(device->dev->handle,
>  				 "Invalid _DDC data for length %d\n", length);
> -		status = -EFAULT;
> -		kfree(obj);
> +		ret = -EFAULT;
>  	}
>  
> -	return status;
> +	kfree(obj);
> +	return ret;
>  }
>  
>  /* bus */
> @@ -1435,9 +1449,7 @@ int acpi_video_get_edid(struct acpi_device *device, int type, int device_id,
>  {
>  	struct acpi_video_bus *video;
>  	struct acpi_video_device *video_device;
> -	union acpi_object *buffer = NULL;
> -	acpi_status status;
> -	int i, length;
> +	int i, length, ret;
>  
>  	if (!device || !acpi_driver_data(device))
>  		return -EINVAL;
> @@ -1477,16 +1489,10 @@ int acpi_video_get_edid(struct acpi_device *device, int type, int device_id,
>  		}
>  
>  		for (length = 512; length > 0; length -= 128) {
> -			status = acpi_video_device_EDID(video_device, &buffer,
> -							length);
> -			if (ACPI_SUCCESS(status))
> -				break;
> +			ret = acpi_video_device_EDID(video_device, edid, length);
> +			if (ret > 0)
> +				return ret;
>  		}
> -		if (!length)
> -			continue;
> -
> -		*edid = buffer->buffer.pointer;
> -		return length;
>  	}
>  
>  	return -ENODEV;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> index 8f0c69aad248..21b56cc7605c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
> @@ -384,7 +384,7 @@ nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector)
>  	if (ret < 0)
>  		return NULL;
>  
> -	return kmemdup(edid, EDID_LENGTH, GFP_KERNEL);
> +	return edid;
>  }
>  
>  bool nouveau_acpi_video_backlight_use_native(void)

