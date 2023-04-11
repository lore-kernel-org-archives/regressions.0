Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DAD8BEE
	for <regressions@lists.linux.dev>; Tue, 11 Apr 2023 12:06:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84CC07F8;
	Tue, 11 Apr 2023 14:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1681214766;
	bh=77bzU3Qz+IIy8ymUUNrXWzQuIsT6FrzaZG0nmESv7w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iAFG1dHkQkzDxregYa8aqIalQYBEecmBzxOd2wjwlPYHLDJNwjwEf+eYd+5CZkgq5
	 jnY4JG58k9V+aJwICoaP1yws8pYF8aztxLqIFsD+6hENyu+y8Ji2f3V6qPF1c9XWWO
	 kftml4H3gsMHeP4Llv0NLnj85SrF8KcOjZq25O2s=
Date: Tue, 11 Apr 2023 15:06:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	regressions@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] media: usb: uvc: fill in description for unknown
 pixelformats
Message-ID: <20230411120617.GI11253@pendragon.ideasonboard.com>
References: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
 <e66fceb5-6621-54bb-cffb-66889941cf17@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e66fceb5-6621-54bb-cffb-66889941cf17@leemhuis.info>

Hi Thorsten,

On Tue, Apr 11, 2023 at 01:49:03PM +0200, Thorsten Leemhuis wrote:
> On 29.03.23 14:28, Hans Verkuil wrote:
> > If the fcc is 0 (indicating an unknown GUID format), then fill in the
> > description field in ENUM_FMT. Otherwise the V4L2 core will WARN.
> > 
> > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
> 
> Thx for working on this.
> 
> Would be good to have Reported-by and Link tags for any reports about
> the issue; I'm aware of the following two, maybe there were more:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=217252
> https://bugzilla.redhat.com/show_bug.cgi?id=2180107
> 
> And a Cc: <stable@vger.kernel.org> # 5.15.x would likely be good as
> well, as the culprit was backported.
> 
> But I write for a different reason: how urgent is this fix? Is this
> "just" fixing a kernel warning, or do users notice this as some apps
> crash? The bugzilla.redhat.com ticket's subject indicates it's the
> latter; and I think I saw someone else mentioning that this leads to
> crashes, but maybe I'm mixing things up.
> 
> Because if this fixes a crash, it afaics would be good to get this fixed
> rather sooner than later in mainline, so that it can be fixed in stable
> as well.

As far as I understand, it fixes a WARN_ON(). That's technically not a
crash, but it looks like a big scary one to anyone watching the kernel
log.

> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> > ---
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 7aefa76a42b3..2f1ced1212cd 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -256,6 +256,9 @@ static int uvc_parse_format(struct uvc_device *dev,
> >  		} else {
> >  			dev_info(&streaming->intf->dev,
> >  				 "Unknown video format %pUl\n", &buffer[5]);
> > +			snprintf(format->name, sizeof(format->name), "%pUl\n",
> > +				 &buffer[5]);
> > +
> >  			format->fcc = 0;
> >  		}
> > 
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 35453f81c1d9..fc6f9e7d8506 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -713,6 +713,10 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
> >  	if (format->flags & UVC_FMT_FLAG_COMPRESSED)
> >  		fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
> >  	fmt->pixelformat = format->fcc;
> > +	if (format->name[0])
> > +		strscpy(fmt->description, format->name,
> > +			sizeof(fmt->description));
> > +
> >  	return 0;
> >  }
> > 
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 9a596c8d894a..22656755a801 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -264,6 +264,8 @@ struct uvc_format {
> >  	u32 fcc;
> >  	u32 flags;
> > 
> > +	char name[32];
> > +
> >  	unsigned int nframes;
> >  	struct uvc_frame *frame;
> >  };

-- 
Regards,

Laurent Pinchart
