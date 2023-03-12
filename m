Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860E21FC5
	for <regressions@lists.linux.dev>; Sun, 12 Mar 2023 13:35:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-21-162-nat.elisa-mobile.fi [85.76.21.162])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA3F7814;
	Sun, 12 Mar 2023 14:35:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1678628117;
	bh=i12hO1PUAyR3dmhHcBKmwKrmbhy4ZFmFCh5ieHe903Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QYw4LWUOY3qRXWvE9mihptD5+ustVuM8asnUMYghXAct8XjbNiYSmKpRrBcIp6FPB
	 S3jKqJs3V4ecPMORmjsgzNGe7eOoHPzFjG3sU/sCndvRYHY/BI8EsICl6VfKPRSVPN
	 Nnpe7rXoXrwJZZkplzae820FgwQ9dPDlRJ9m7YV0=
Date: Sun, 12 Mar 2023 15:34:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 14/17] media: i2c: imx290: Initialize runtime PM
 before subdev
Message-ID: <20230312133435.GI2545@pendragon.ideasonboard.com>
References: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
 <20230116144454.1012-15-laurent.pinchart@ideasonboard.com>
 <20230227175245.GA3728693@roeck-us.net>
 <73bec5a8-98f7-5dca-3b34-cb6fe0b61249@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <73bec5a8-98f7-5dca-3b34-cb6fe0b61249@leemhuis.info>

Hello Thorsten,

On Sun, Mar 12, 2023 at 02:10:16PM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 27.02.23 18:52, Guenter Roeck wrote:
> > On Mon, Jan 16, 2023 at 04:44:51PM +0200, Laurent Pinchart wrote:
> >> Initializing the subdev before runtime PM means that no subdev
> >> initialization can interact with the runtime PM framework. This can be
> >> problematic when modifying controls, as the .s_ctrl() handler commonly
> >> calls pm_runtime_get_if_in_use(). These code paths are not trivial,
> >> making the driver fragile and possibly causing subtle bugs.
> >>
> >> To make the subdev initialization more robust, initialize runtime PM
> >> first.
> >>
> >> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >> ---
> > 
> > This patch results in
> > 
> > Error log:
> > <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> > drivers/media/i2c/imx290.c:1090:12: error: 'imx290_runtime_suspend' defined but not used [-Werror=unused-function]
> >  1090 | static int imx290_runtime_suspend(struct device *dev)
> >       |            ^~~~~~~~~~~~~~~~~~~~~~
> > drivers/media/i2c/imx290.c:1082:12: error: 'imx290_runtime_resume' defined but not used [-Werror=unused-function]
> >  1082 | static int imx290_runtime_resume(struct device *dev)
> > 
> > if PM runtime support is disabled( alpha:allmodconfig, csky:allmodconfig,
> > and others).
> 
> Looks like Guenter never got a reply, but from a recent kernelci report
> it looks like above warning still happens:
> https://lore.kernel.org/all/640bceb7.a70a0220.af8cd.146b@mx.google.com/
> 
> Laurent, do you still have it on your radar?

I don't. Arnd has sent a fix
(https://lore.kernel.org/linux-media/20230207161316.293923-1-arnd@kernel.org),
I've reviewed it, now I expect Sakari to pick it up and get it upstream.

> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> #regzbot poke

-- 
Regards,

Laurent Pinchart
