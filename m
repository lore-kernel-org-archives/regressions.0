Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F132CA0
	for <regressions@lists.linux.dev>; Mon, 20 Dec 2021 15:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100F9C36AE8;
	Mon, 20 Dec 2021 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1640012552;
	bh=I20d041YHnGLZarmk86theUw3YjEMYMjHmOKySQj/9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RvRe7Ck4dgVwV7Rn3IF0OZfFmp5L0JjhMwFgrd+6sW4oCMNtwX0DghYXEsNWFDdrY
	 vMR6U+whjzlxuBtGXDkmWl9eXRJtXof4gZYtfMsQmKllym1HpBTyUt+eI+yLCD3MmQ
	 V08ZgTnzKHet4vLrk5OxwtHErOJdk9DdHtExhuHE=
Date: Mon, 20 Dec 2021 15:50:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Cc: Cristian Birsan <Cristian.Birsan@microchip.com>,
	Jonas Bonn <jonas@norrbonn.se>, regressions@lists.linux.dev,
	Nicolas Ferre <Nicolas.Ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ludovic Desroches <Ludovic.Desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Felipe Balbi <balbi@kernel.org>,
	Sergio Tanzilli <tanzilli@acmesystems.it>
Subject: Re: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget
 (atmel_usba_udc)
Message-ID: <YcCYJeGTFIhxK62s@kroah.com>
References: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
 <d406fd08-39d9-42db-f01c-2eccf5b0be00@norrbonn.se>
 <CACjc_5pHbLStniQnOVLDW5iLbKn8ovePuQsFFqeEnQPSSYxJoQ@mail.gmail.com>
 <42f2afc6-f1a0-dc33-830e-0fcc5382ed1d@microchip.com>
 <CACjc_5qZjXbE1CwQCpc4+vzbsobfn5YKpU=UCVJpMGG1ROEfTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACjc_5qZjXbE1CwQCpc4+vzbsobfn5YKpU=UCVJpMGG1ROEfTg@mail.gmail.com>

On Wed, Dec 15, 2021 at 12:54:49PM -0300, Marcelo Roberto Jimenez wrote:
> Hi Cristian,
> 
> On Wed, Dec 15, 2021 at 10:04 AM <Cristian.Birsan@microchip.com> wrote:
> >
> > Hi Marcelo, Jonas,
> >
> > On 12/13/21 4:31 PM, Marcelo Roberto Jimenez wrote:
> > >
> > > Some people who received this message don't often get email from marcelo.jimenez@gmail.com. Learn why this is important <http://aka.ms/LearnAboutSenderIdentification>
> 
> Hum, shame on me.
> 
> > > Hi Jonas,
> > >
> > > Thank you for the quick response, I really appreciate it.
> > >
> > > On Mon, Dec 13, 2021 at 7:02 AM Jonas Bonn <jonas@norrbonn.se <mailto:jonas@norrbonn.se>> wrote:
> > >
> > >
> > >     Given that the patch that you want to revert is almost 3 years old, it's
> > >     a bit of a stretch to call this a regression.  I suspect that a cleaner
> > >     way forward is to introduce some kind of quirk for your board.
> > >
> > >
> > > Well, the board is basically the MPU, so if there is a hardware problem it would mean that it is a problem with the on chip peripheral.
> > >
> > >
> > >     I have a self-powered board where the USB suspend sequence works and
> > >     device add/remove works fine.  So fundamentally, I suspect that the
> > >     driver is ok.
> > >
> > >
> > > Maybe you have VBUS sensing enabled in your board. As I reported before, the VBUS sensing is not an option in this board. Nonetheless, the code in the kernel suggests that VBUS sensing is optional, since the presence of a VBUS sensing pin is explicitly tested in it.
> >
> > Is it possible to add a wire that connects VBUS to the right pin on the MPU ? Just to see if this has an impact or not ?
> 
> Yes. Maybe I was not clear about that issue, so let me try to clarify.
> The board _seems_ to have a provision for VBUS sensing, but it is not
> working. I was not involved in this board's project and I found no
> other documentation on the ACME Systems site, all I am saying here is
> from reading the circuit diagram, so it is all my personal
> interpretation. For hardware reasons, the aforementioned VBUS sensing
> pin does not reach zero volts when the USB connector is removed, which
> makes VBUS sensing ineffective. But I have tested it anyway and to
> make it work, the first step is to prepare the board as specified here
> https://www.acmesystems.it/arietta_power_supply in the section "Supply
> power at 3.3 volt". The key here is to remove the R36 resistor, so
> that the board can be fed by an external 3.3V voltage and become self
> powered. Then, you add a line "atmel,vbus-gpio = <&pioB 16 0>;" below
> the "usb2:" line in the Arietta DTD. After recompiling the kernel and
> installing, it still does not work by just unplugging the USB cable.
> You need to manually and carefully (!) short circuit the +5 USB line
> to the ground when the cable is not connected. Only then VBUS sensing
> will work and the device will accept enumeration again.
> 
> In short, the VBUS sensing code in the kernel is ok. But that is not
> my point. My point is that the kernel code implies that it is possible
> to do without a VBUS sensing pin. The file
> Documentation/devicetree/bindings/usb/atmel-usb.txt states that
> "atmel,vbus-gpio" is an optional property. So, it seems to me like the
> code should work without it, and indeed it worked. That is why I have
> called this a regression.

Yes, hardware that used to work, and now does not, is a regression.

So, should I revert the offending patch here?  Adding new features is
not a good reason to keep things that break systems.  Or is there a
potential fix in this thread that I missed?

thanks,

greg k-h
