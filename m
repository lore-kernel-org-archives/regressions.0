Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931C329CA
	for <regressions@lists.linux.dev>; Sun, 12 Dec 2021 09:48:25 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mwLSp-00060o-1C; Sun, 12 Dec 2021 10:48:15 +0100
Message-ID: <3bb113cd-fbf6-6898-6ae3-2f8cb8c64992@leemhuis.info>
Date: Sun, 12 Dec 2021 10:48:14 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-BS
To: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>,
 regressions@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org,
 Cristian Birsan <cristian.birsan@microchip.com>, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>, Jonas Bonn <jonas@norrbonn.se>
References: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget
 (atmel_usba_udc)
In-Reply-To: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1639302505;7845398a;
X-HE-SMSGID: 1mwLSp-00060o-1C

[TLDR: adding this regression to regzbot; most of this mail is compiled
from a few templates paragraphs some of you might have seen already.]

Hi, this is your Linux kernel regression tracker speaking.

Top-posting for once, to make this easy accessible to everyone.

Thanks for the report. BTW, if anyone like me wonders what the included
patch is about: it afaics is the revert of the patch causing the
problem. Anyway:

To be sure this issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced 70a7f8be8598
#regzbot title usb: gadget: atmel: ethernet over USB Gadget not
recognized anymore after disconnect and reconnect
#regzbot ignore-activity

Reminder: when fixing the issue, please add a 'Link:' tag with the URL
to the report (the parent of this mail), then regzbot will automatically
mark the regression as resolved once the fix lands in the appropriate
tree. For more details about regzbot see footer.

Sending this to everyone that got the initial report, to make all aware
of the tracking. I also hope that messages like this motivate people to
directly get at least the regression mailing list and ideally even
regzbot involved when dealing with regressions, as messages like this
wouldn't be needed then.

Don't worry, I'll send further messages wrt to this regression just to
the lists (with a tag in the subject so people can filter them away), as
long as they are intended just for regzbot. With a bit of luck no such
messages will be needed anyway.

Ciao, Thorsten

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply. That's in everyone's interest, as
what I wrote above might be misleading to everyone reading this; any
suggestion I gave thus might sent someone reading this down the wrong
rabbit hole, which none of us wants.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.



On 11.12.21 19:36, Marcelo Roberto Jimenez wrote:
> The regression occurs on the second time a self powered gadget is
> connected to the host. In this situation, the gadget no loger accepts
> an address in the USB enumeration phase.
> 
> The regression has been introduced in
> commit 70a7f8be8598 ("usb: gadget: atmel: support USB suspend")
> 
> Signed-off-by: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
> ---
> 
> Hi,
> 
> I have been using an ACME Arietta board (Microchip AT91SAM9G25 MPU, ARM9@400Mhz) for some years, and from time to time I need to do a kernel upgrade to fix issues or introduce new required features.
> 
> I have recently noticed a regression in the ethernet over USB Gadget. The system boots fine and when the device is first connected to a host it is recognized. But upon disconnection, the second time the device is connected to the host, it is no longer recognized. Of course, the gadget is self powered.
> 
> I did a "git bisect" and found that the patch introducing the regression is this:
> 
> commit 70a7f8be85986a3c2ffc7274c41b89552dfe2ad0
> Author: Jonas Bonn <jonas@norrbonn.se>
> Date:   Wed Feb 20 13:20:00 2019 +0100
>     usb: gadget: atmel: support USB suspend
>     This patch adds support for USB suspend to the Atmel UDC.
> 
> I understand that supporting USB suspend state is important for power consumption, but something in this patch has broken the hardware behavior, so my suggestion is to revert it until we can figure out what is going wrong.
> 
> I have tested and confirm that reverting that patch makes the issue go away.
> 
> On the host side, I can see some log messages that indicate that the USB gadget is not accepting a new address in the enumeration phase. The following log shows the successful initial connection and disconnection, and then the failed second connection attempt:
> 
> usb 1-4.3: new high-speed USB device number 85 using xhci_hcd
> usb 1-4.3: New USB device found, idVendor=0525, idProduct=a4a2, bcdDevice= 5.10
> usb 1-4.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> usb 1-4.3: Product: RNDIS/Ethernet Gadget
> usb 1-4.3: Manufacturer: Linux 5.10.80-linux4microchip-2021.10-rc2+ with atmel_usba_udc
> cdc_subset: probe of 1-4.3:1.0 failed with error -22
> cdc_ether 1-4.3:1.0 usb0: register 'cdc_ether' at usb-0000:00:14.0-4.3, CDC Ethernet Device, 4a:85:ff:68:fa:82
> cdc_ether 1-4.3:1.0 enp0s20f0u4u3: renamed from usb0
> usb 1-4.3: USB disconnect, device number 85
> cdc_ether 1-4.3:1.0 enp0s20f0u4u3: unregister 'cdc_ether' usb-0000:00:14.0-4.3, CDC Ethernet Device
> usb 1-4.3: new high-speed USB device number 86 using xhci_hcd
> usb 1-4.3: device descriptor read/64, error -71
> usb 1-4.3: device descriptor read/64, error -71
> usb 1-4.3: new high-speed USB device number 87 using xhci_hcd
> usb 1-4.3: device descriptor read/64, error -71
> usb 1-4.3: device descriptor read/64, error -71
> usb 1-4-port3: attempt power cycle
> usb 1-4.3: new high-speed USB device number 88 using xhci_hcd
> usb 1-4.3: Device not responding to setup address.
> usb 1-4.3: Device not responding to setup address.
> usb 1-4.3: device not accepting address 88, error -71
> usb 1-4.3: new high-speed USB device number 89 using xhci_hcd
> usb 1-4.3: Device not responding to setup address.
> usb 1-4.3: Device not responding to setup address.
> usb 1-4.3: device not accepting address 89, error -71
> usb 1-4-port3: unable to enumerate USB device
> 
> The steps to reproduce are very easy:
> 1. Have both the host and the gadget turned on.
> 2. Connect the gadget to an USB port.
> 3. Disconnect the gadget from the USB port.
> 4. Reconnect the gadget to the USB port.
> 5. The gadget is no longer recognized.
> 
> On a side note, the ACME Arietta board DTD does not use VBUS sensing by default, although the hardware diagram shows a provision to do that using the PB16 GPIO. I have tried to enable that via DTD, but there seems to be a hardware design flaw (assuming that the intention was to provide VBUS sensing) due to a connection with the processor SHDN pin, which is from the processor shutdown controller, and the 3.3 volts voltage regulator enable pin. The problem is that even when the USB is disconnected, the voltage never gets near enough zero to trigger the GPIO interrupt, which I could verify that would indeed happen by a temporary short of the (unconnected) USB VBUS pin to the ground. That was only to say that even without VBUS sensing, the device has always worked, and that enabling VBUS sensing is not a viable solution in the current project.
> 
> Best regards,
> Marcelo.
> 
> 
>  drivers/usb/gadget/udc/atmel_usba_udc.c | 55 +++----------------------
>  drivers/usb/gadget/udc/atmel_usba_udc.h |  1 -
>  2 files changed, 6 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
> index 2b893bceea45..54cdea5cc31c 100644
> --- a/drivers/usb/gadget/udc/atmel_usba_udc.c
> +++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
> @@ -1705,9 +1705,6 @@ static void usba_dma_irq(struct usba_udc *udc, struct usba_ep *ep)
>  	}
>  }
>  
> -static int start_clock(struct usba_udc *udc);
> -static void stop_clock(struct usba_udc *udc);
> -
>  static irqreturn_t usba_udc_irq(int irq, void *devid)
>  {
>  	struct usba_udc *udc = devid;
> @@ -1722,13 +1719,10 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
>  	DBG(DBG_INT, "irq, status=%#08x\n", status);
>  
>  	if (status & USBA_DET_SUSPEND) {
> -		usba_writel(udc, INT_CLR, USBA_DET_SUSPEND|USBA_WAKE_UP);
> -		usba_int_enb_set(udc, USBA_WAKE_UP);
> -		usba_int_enb_clear(udc, USBA_DET_SUSPEND);
> -		udc->suspended = true;
>  		toggle_bias(udc, 0);
> +		usba_writel(udc, INT_CLR, USBA_DET_SUSPEND);
> +		usba_int_enb_set(udc, USBA_WAKE_UP);
>  		udc->bias_pulse_needed = true;
> -		stop_clock(udc);
>  		DBG(DBG_BUS, "Suspend detected\n");
>  		if (udc->gadget.speed != USB_SPEED_UNKNOWN
>  				&& udc->driver && udc->driver->suspend) {
> @@ -1739,17 +1733,14 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
>  	}
>  
>  	if (status & USBA_WAKE_UP) {
> -		start_clock(udc);
>  		toggle_bias(udc, 1);
>  		usba_writel(udc, INT_CLR, USBA_WAKE_UP);
> +		usba_int_enb_clear(udc, USBA_WAKE_UP);
>  		DBG(DBG_BUS, "Wake Up CPU detected\n");
>  	}
>  
>  	if (status & USBA_END_OF_RESUME) {
> -		udc->suspended = false;
>  		usba_writel(udc, INT_CLR, USBA_END_OF_RESUME);
> -		usba_int_enb_clear(udc, USBA_WAKE_UP);
> -		usba_int_enb_set(udc, USBA_DET_SUSPEND);
>  		generate_bias_pulse(udc);
>  		DBG(DBG_BUS, "Resume detected\n");
>  		if (udc->gadget.speed != USB_SPEED_UNKNOWN
> @@ -1764,8 +1755,6 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
>  	if (dma_status) {
>  		int i;
>  
> -		usba_int_enb_set(udc, USBA_DET_SUSPEND);
> -
>  		for (i = 1; i <= USBA_NR_DMAS; i++)
>  			if (dma_status & (1 << i))
>  				usba_dma_irq(udc, &udc->usba_ep[i]);
> @@ -1775,8 +1764,6 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
>  	if (ep_status) {
>  		int i;
>  
> -		usba_int_enb_set(udc, USBA_DET_SUSPEND);
> -
>  		for (i = 0; i < udc->num_ep; i++)
>  			if (ep_status & (1 << i)) {
>  				if (ep_is_control(&udc->usba_ep[i]))
> @@ -1790,9 +1777,7 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
>  		struct usba_ep *ep0, *ep;
>  		int i;
>  
> -		usba_writel(udc, INT_CLR,
> -			USBA_END_OF_RESET|USBA_END_OF_RESUME
> -			|USBA_DET_SUSPEND|USBA_WAKE_UP);
> +		usba_writel(udc, INT_CLR, USBA_END_OF_RESET);
>  		generate_bias_pulse(udc);
>  		reset_all_endpoints(udc);
>  
> @@ -1819,11 +1804,6 @@ static irqreturn_t usba_udc_irq(int irq, void *devid)
>  				| USBA_BF(BK_NUMBER, USBA_BK_NUMBER_ONE)));
>  		usba_ep_writel(ep0, CTL_ENB,
>  				USBA_EPT_ENABLE | USBA_RX_SETUP);
> -
> -		/* If we get reset while suspended... */
> -		udc->suspended = false;
> -		usba_int_enb_clear(udc, USBA_WAKE_UP);
> -
>  		usba_int_enb_set(udc, USBA_BF(EPT_INT, 1) |
>  				      USBA_DET_SUSPEND | USBA_END_OF_RESUME);
>  
> @@ -1896,19 +1876,9 @@ static int usba_start(struct usba_udc *udc)
>  	if (ret)
>  		return ret;
>  
> -	if (udc->suspended)
> -		return 0;
> -
>  	spin_lock_irqsave(&udc->lock, flags);
>  	toggle_bias(udc, 1);
>  	usba_writel(udc, CTRL, USBA_ENABLE_MASK);
> -	/* Clear all requested and pending interrupts... */
> -	usba_writel(udc, INT_ENB, 0);
> -	udc->int_enb_cache = 0;
> -	usba_writel(udc, INT_CLR,
> -		USBA_END_OF_RESET|USBA_END_OF_RESUME
> -		|USBA_DET_SUSPEND|USBA_WAKE_UP);
> -	/* ...and enable just 'reset' IRQ to get us started */
>  	usba_int_enb_set(udc, USBA_END_OF_RESET);
>  	spin_unlock_irqrestore(&udc->lock, flags);
>  
> @@ -1919,9 +1889,6 @@ static void usba_stop(struct usba_udc *udc)
>  {
>  	unsigned long flags;
>  
> -	if (udc->suspended)
> -		return;
> -
>  	spin_lock_irqsave(&udc->lock, flags);
>  	udc->gadget.speed = USB_SPEED_UNKNOWN;
>  	reset_all_endpoints(udc);
> @@ -1949,7 +1916,6 @@ static irqreturn_t usba_vbus_irq_thread(int irq, void *devid)
>  		if (vbus) {
>  			usba_start(udc);
>  		} else {
> -			udc->suspended = false;
>  			if (udc->driver->disconnect)
>  				udc->driver->disconnect(&udc->gadget);
>  
> @@ -2028,7 +1994,6 @@ static int atmel_usba_stop(struct usb_gadget *gadget)
>  	if (udc->vbus_pin)
>  		disable_irq(gpiod_to_irq(udc->vbus_pin));
>  
> -	udc->suspended = false;
>  	usba_stop(udc);
>  
>  	udc->driver = NULL;
> @@ -2393,7 +2358,6 @@ static int usba_udc_suspend(struct device *dev)
>  	mutex_lock(&udc->vbus_mutex);
>  
>  	if (!device_may_wakeup(dev)) {
> -		udc->suspended = false;
>  		usba_stop(udc);
>  		goto out;
>  	}
> @@ -2403,13 +2367,10 @@ static int usba_udc_suspend(struct device *dev)
>  	 * to request vbus irq, assuming always on.
>  	 */
>  	if (udc->vbus_pin) {
> -		/* FIXME: right to stop here...??? */
>  		usba_stop(udc);
>  		enable_irq_wake(gpiod_to_irq(udc->vbus_pin));
>  	}
>  
> -	enable_irq_wake(udc->irq);
> -
>  out:
>  	mutex_unlock(&udc->vbus_mutex);
>  	return 0;
> @@ -2423,12 +2384,8 @@ static int usba_udc_resume(struct device *dev)
>  	if (!udc->driver)
>  		return 0;
>  
> -	if (device_may_wakeup(dev)) {
> -		if (udc->vbus_pin)
> -			disable_irq_wake(gpiod_to_irq(udc->vbus_pin));
> -
> -		disable_irq_wake(udc->irq);
> -	}
> +	if (device_may_wakeup(dev) && udc->vbus_pin)
> +		disable_irq_wake(gpiod_to_irq(udc->vbus_pin));
>  
>  	/* If Vbus is present, enable the controller and wait for reset */
>  	mutex_lock(&udc->vbus_mutex);
> diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.h b/drivers/usb/gadget/udc/atmel_usba_udc.h
> index 620472f218bc..b44873148393 100644
> --- a/drivers/usb/gadget/udc/atmel_usba_udc.h
> +++ b/drivers/usb/gadget/udc/atmel_usba_udc.h
> @@ -343,7 +343,6 @@ struct usba_udc {
>  	struct usba_ep *usba_ep;
>  	bool bias_pulse_needed;
>  	bool clocked;
> -	bool suspended;
>  	bool ep_prealloc;
>  
>  	u16 devstatus;
> 
