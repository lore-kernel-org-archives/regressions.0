Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8782CA6
	for <regressions@lists.linux.dev>; Wed, 17 May 2023 10:36:10 +0000 (UTC)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 03C5420B66;
	Wed, 17 May 2023 12:36:00 +0200 (CEST)
Date: Wed, 17 May 2023 12:35:57 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Alistair <alistair@alistair23.me>,
	Badhri Jagan Sridharan <badhri@google.com>,
	gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
	colin.i.king@gmail.com, xuetao09@huawei.com,
	quic_eserrao@quicinc.com, water.zhangjiantao@huawei.com,
	peter.chen@freescale.com, balbi@ti.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v4 1/2] usb: gadget: udc: core: Invoke usb_gadget_connect
 only when started
Message-ID: <ZGStr1oZvmJ0XzSu@francesco-nb.int.toradex.com>
References: <20230407030741.3163220-1-badhri@google.com>
 <0cf8c588b701d7cf25ffe1a9217b81716e6a5c51.camel@alistair23.me>
 <1ac16f0a-3cca-40ca-c444-82719f85a24c@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ac16f0a-3cca-40ca-c444-82719f85a24c@leemhuis.info>

On Wed, May 17, 2023 at 12:23:39PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> [CCing Francesco Dolcini; and the regression list too, as it should be
> in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> 
> On 16.05.23 14:53, Alistair wrote:
> > On Fri, 2023-04-07 at 03:07 +0000, Badhri Jagan Sridharan wrote:
> >> usb_udc_connect_control does not check to see if the udc has already
> >> been started. This causes gadget->ops->pullup to be called through
> >> usb_gadget_connect when invoked from usb_udc_vbus_handler even before
> >> usb_gadget_udc_start is called. Guard this by checking for udc-
> >>> started
> >> in usb_udc_connect_control before invoking usb_gadget_connect.
> > [...]
> >> Cc: stable@vger.kernel.org
> >> Fixes: 628ef0d273a6 ("usb: udc: add usb_udc_vbus_handler")
> >> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > 
> > This patch causes a kernel hang when trying to boot with the
> > usb/chipidea/udc.c driver.
> > 
> > The call stack below causes the hang:
> > 
> >  - gadget_bind_driver(struct device *dev)
> >     - mutex_lock(&udc->connect_lock);
> >     - usb_gadget_udc_start_locked(struct usb_udc *udc)
> >         - udc->gadget->ops->udc_start(udc->gadget, udc->driver)
> > 
> > At which point we are calling ci_udc_start(..), but with the
> > connect_lock mutex locked.
> > 
> > ci_udc_start() then calls usb_udc_vbus_handler() which tries to lock
> > the connect_lock while it's already locked. Resulting in a kernel hang.
> > 
> > Reverting this patch fixes the hang.
> 
> Not my area of expertise, but I guess it might be the same error as this
> one:
> 
> https://lore.kernel.org/all/ZF4BvgsOyoKxdPFF@francesco-nb.int.toradex.com/
> 
> Francesco sent a revert on Friday, but no reaction from Badhri Jagan
> Sridharan or Greg yet afaics.
> 
> https://lore.kernel.org/all/20230512131435.205464-1-francesco@dolcini.it/

Revert patches were applied and are in linux-next. I expect those to
land in Linus tree with the next pull request from Greg.

Francesco

