Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1D66ADB
	for <regressions@lists.linux.dev>; Wed, 29 Mar 2023 18:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680114998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hngQVU0oLMQxvv+u8vuy/0tao+EP9VOUUrq5Ry57HH0=;
	b=TSq4XV5JigP0txiR3sESzymyUJQTgJWz+VDoS2wizdlUQQ5hckM7/WegPAZuLo2ApKVxua
	w7Ag6s5MOMov7mCHqwYsA+DhRRlSBzr66j2eS6F1THuciEZjqWKGGpAHfdbw/Tlwoo4Jb8
	nAoCi4bfQIzA/LQC2hg9UL6y9pCSsAo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-IuNzvuomP8-4dm36KnXidg-1; Wed, 29 Mar 2023 14:36:37 -0400
X-MC-Unique: IuNzvuomP8-4dm36KnXidg-1
Received: by mail-ed1-f72.google.com with SMTP id r19-20020a50aad3000000b005002e950cd3so23862258edc.11
        for <regressions@lists.linux.dev>; Wed, 29 Mar 2023 11:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680114996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hngQVU0oLMQxvv+u8vuy/0tao+EP9VOUUrq5Ry57HH0=;
        b=Bmc0P53DKspIBe6GXJfxzbIJ2z1WWxAkUhjArJXM9yUsv1e3nhu4J7FiASbFIdFUq+
         R8KJh2MLr1dNsGGKR0ZKO3mgHjUJRsXbvPLzp9AxGBkxRWvTJou8vMV2MoV8rqyEvVD/
         Ute96UGR1uuyWPImmKnlUrufA/9YxTNt27Lkr1lrwYSDDoZdllj1Z/YG8Zbc3aaZugow
         EvY3F8mlg1VVdaL8TRMSOxMhA5f/miiWijjIDHlK8EczdzULyxhd3/wB1PXv7kanYAa/
         u2o9yE6SELntCgbkRNA8t0DJh9RNY0+SRw7EzJIDFt5i8+KoSUU5EnFf/x1CfxUZEamU
         0q6A==
X-Gm-Message-State: AAQBX9chgn0KBmo761v1GyyXeJvNZkoE/IhNkgdJ6YfUp9F/rtAhgogO
	hK03shKbaneOXhRtuB/Ge7YhYJZn3mdqNfaI5WDEyxyHhnRMYDIHIkzd06XnGzOL8zPftEyfOli
	wKaTjzfJ0dzk66lyjkGjVOgcDyOp1OhI=
X-Received: by 2002:aa7:d806:0:b0:4fc:3777:f630 with SMTP id v6-20020aa7d806000000b004fc3777f630mr20222278edq.0.1680114995917;
        Wed, 29 Mar 2023 11:36:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350YgAX3gSQ0Z/vFKnB7klGJAaJ5a7qzVG7cAkRa+s694WTIbr4FbtGfu5jYyUuzo6PEfwjSlBw==
X-Received: by 2002:aa7:d806:0:b0:4fc:3777:f630 with SMTP id v6-20020aa7d806000000b004fc3777f630mr20222267edq.0.1680114995671;
        Wed, 29 Mar 2023 11:36:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m10-20020a50998a000000b004e48f8df7e2sm17522994edb.72.2023.03.29.11.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 11:36:34 -0700 (PDT)
Message-ID: <ffdf7e17-580c-ed13-c37a-bd795e116427@redhat.com>
Date: Wed, 29 Mar 2023 20:36:33 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: usb: uvc: fill in description for unknown
 pixelformats
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: regressions@lists.linux.dev,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
References: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/29/23 14:28, Hans Verkuil wrote:
> If the fcc is 0 (indicating an unknown GUID format), then fill in the
> description field in ENUM_FMT. Otherwise the V4L2 core will WARN.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")

Thanks, patch looks good to me:

FWIW:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 7aefa76a42b3..2f1ced1212cd 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -256,6 +256,9 @@ static int uvc_parse_format(struct uvc_device *dev,
>  		} else {
>  			dev_info(&streaming->intf->dev,
>  				 "Unknown video format %pUl\n", &buffer[5]);
> +			snprintf(format->name, sizeof(format->name), "%pUl\n",
> +				 &buffer[5]);
> +
>  			format->fcc = 0;
>  		}
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 35453f81c1d9..fc6f9e7d8506 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -713,6 +713,10 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
>  	if (format->flags & UVC_FMT_FLAG_COMPRESSED)
>  		fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
>  	fmt->pixelformat = format->fcc;
> +	if (format->name[0])
> +		strscpy(fmt->description, format->name,
> +			sizeof(fmt->description));
> +
>  	return 0;
>  }
> 
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 9a596c8d894a..22656755a801 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -264,6 +264,8 @@ struct uvc_format {
>  	u32 fcc;
>  	u32 flags;
> 
> +	char name[32];
> +
>  	unsigned int nframes;
>  	struct uvc_frame *frame;
>  };
> 

