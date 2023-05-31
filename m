Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAADC8ED
	for <regressions@lists.linux.dev>; Wed, 31 May 2023 11:48:54 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q4KJw-0001sI-F9; Wed, 31 May 2023 13:48:52 +0200
Message-ID: <a47b5d61-f512-22ca-ca75-5f7ec40c5af7@leemhuis.info>
Date: Wed, 31 May 2023 13:48:51 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH] media: usb: uvc: fill in description for unknown
 pixelformats
Content-Language: en-US, de-DE
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: regressions@lists.linux.dev,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1685533735;63399093;
X-HE-SMSGID: 1q4KJw-0001sI-F9

On 29.03.23 14:28, Hans Verkuil wrote:
> If the fcc is 0 (indicating an unknown GUID format), then fill in the
> description field in ENUM_FMT. Otherwise the V4L2 core will WARN.

What happened to this? It seems this fall through the cracks.

BTW:

> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Afaics it might be good to have these in here:

Link: https://bugzilla.kernel.org/show_bug.cgi?id=217252
Link: https://bugzilla.redhat.com/show_bug.cgi?id=2180107

A comment in the former is what brought me here.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot ^backmonitor:
https://lore.kernel.org/lkml/dc8e5276-ef88-648f-9f0d-10151ea62c90@leemhuis.info/
#regzbot poke

> Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
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
