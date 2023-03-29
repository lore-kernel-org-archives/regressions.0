Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA192F30
	for <regressions@lists.linux.dev>; Wed, 29 Mar 2023 16:06:11 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id le6so15373873plb.12
        for <regressions@lists.linux.dev>; Wed, 29 Mar 2023 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680105970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RGeLND7CqNFElzj+KkwONKJwoCGzjwKOWHOimvr2vj4=;
        b=dEY+jYtIsCskXn4yrVQKzXxJC4HO5IXF7ys7nIF2JgIK56FLpAZFcmvRdHb9rNKs8/
         uNwZEWcvfOAWOSTUsVQ+ksf9XpXhLeNvGxtk7GYqu2uYtKLU9ReXV+M5Tmakhh9KNZvJ
         tO29jH2j0HYJX87tWo4XuHeuxP23u7/uK3TJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGeLND7CqNFElzj+KkwONKJwoCGzjwKOWHOimvr2vj4=;
        b=xsR1ojoIhnyneJraBUxG/olsNTbZ4yR+zTjbDBhnzQ/gLBuyqGFMirhtUc5CmH3/+n
         v1/YgeQX+BHNntM1R4HfC/J94QZtUspqTNYU3BnjwmUt2N+j8wNkisUxM25kcNPoydWQ
         DqsxyjBePMgjy+tgFDbpOotq+HkUTIhSiZ1oCXry/U2gDL01cqc6h3jli3EcsWxannJH
         7fmVpAsW1JSvEOFoDvjXnUp9QIPRfxf4TTAnJilW4nmXb2D3f4Olvdi55kGvJj7anqsb
         YbWh/sY6t9Iks5MyGYgIi1iwtgj1/DKy+MudPMWio/sWqZufSjXnIMzVp8c/h0QXrkTX
         SOpg==
X-Gm-Message-State: AO0yUKWhLcoCoTx9eSdZcBU1AyQo3sN6igwMmkP2xeSoPNBQA6CjHd/O
	I8fnhYirxNsNTv4vNz3oN+sJIrEh298vvUtl21U=
X-Google-Smtp-Source: AK7set+94KN1tRNEkOpTMrcfeqpCLGsiLStENfj2kbufaVyUGuwV5IVBepqmQr32P8P3QlsaLzLOQQ==
X-Received: by 2002:a05:6a20:29a0:b0:d9:2028:dfd4 with SMTP id f32-20020a056a2029a000b000d92028dfd4mr15630497pzh.19.1680105970087;
        Wed, 29 Mar 2023 09:06:10 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d18-20020aa78692000000b0062a515874b4sm12439646pfo.32.2023.03.29.09.06.09
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 09:06:09 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id x15so14492799pjk.2
        for <regressions@lists.linux.dev>; Wed, 29 Mar 2023 09:06:09 -0700 (PDT)
X-Received: by 2002:a17:902:ce83:b0:1a0:4321:920e with SMTP id
 f3-20020a170902ce8300b001a04321920emr7390726plg.12.1680105969005; Wed, 29 Mar
 2023 09:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
In-Reply-To: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 29 Mar 2023 18:05:57 +0200
X-Gmail-Original-Message-ID: <CANiDSCuiHLw6FBu8GV93Mm2WK5suCnGk8PBUDfn_krtMfPwdaw@mail.gmail.com>
Message-ID: <CANiDSCuiHLw6FBu8GV93Mm2WK5suCnGk8PBUDfn_krtMfPwdaw@mail.gmail.com>
Subject: Re: [PATCH] media: usb: uvc: fill in description for unknown pixelformats
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, regressions@lists.linux.dev, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

Thanks for the patch.

I believe the user can fetch this info from lsusb, so this is kind of
duplicated info, and this is why it was removed.

Is there an app that uses this unknown format code ? Or the only
complaint is that WARN() is too loud for the user?

Regards!

On Wed, 29 Mar 2023 at 14:39, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> If the fcc is 0 (indicating an unknown GUID format), then fill in the
> description field in ENUM_FMT. Otherwise the V4L2 core will WARN.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
> ---
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 7aefa76a42b3..2f1ced1212cd 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -256,6 +256,9 @@ static int uvc_parse_format(struct uvc_device *dev,
>                 } else {
>                         dev_info(&streaming->intf->dev,
>                                  "Unknown video format %pUl\n", &buffer[5]);
> +                       snprintf(format->name, sizeof(format->name), "%pUl\n",
> +                                &buffer[5]);
Don't we need at least 38 chars for this?

https://docs.kernel.org/core-api/printk-formats.html#uuid-guid-addresses


> +
>                         format->fcc = 0;
>                 }
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 35453f81c1d9..fc6f9e7d8506 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -713,6 +713,10 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
>         if (format->flags & UVC_FMT_FLAG_COMPRESSED)
>                 fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
>         fmt->pixelformat = format->fcc;
> +       if (format->name[0])
> +               strscpy(fmt->description, format->name,
> +                       sizeof(fmt->description));
> +
>         return 0;
>  }
>
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 9a596c8d894a..22656755a801 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -264,6 +264,8 @@ struct uvc_format {
>         u32 fcc;
>         u32 flags;
>
> +       char name[32];
> +
>         unsigned int nframes;
>         struct uvc_frame *frame;
>  };
>


--
Ricardo Ribalda
