Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4322F22
	for <regressions@lists.linux.dev>; Wed, 21 Dec 2022 19:02:05 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id z9so8366278ilu.10
        for <regressions@lists.linux.dev>; Wed, 21 Dec 2022 11:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XmRQV3OYWSxYRu8IwtQFaD5v+Hsvw152isdiT6FinQM=;
        b=XY1E+dSbCa8nDPJrQhDavv8olG4qTFl/SJtoEL/u0Rg5qWWugg779jGtyrivOxyv3n
         IxrXPl6t2JTFXUAB/7inK7QeF2XWrmEo9be/2qz635469vYmNETUftdf2+XRrdD6x8rs
         dQTPsqtQGjX31DqYJ530zEDoNpLxZIiinz4uM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XmRQV3OYWSxYRu8IwtQFaD5v+Hsvw152isdiT6FinQM=;
        b=GvDPEwJ9pvaOkhXRLflvK0mp2brmrM5lTMn2FKgZgtWqR0rhFVGHwBrVUcu/xRxnS7
         6x4GNZ0YZITAfryDSK+UK4tXpFHhOZ7BmYBEYKCyGD+0pi5bZupOtUr4BRuXLqIXqOTe
         iAFaJBXhmWmQpTKMrzAZSRnU91ea5w1Ly+dGTpRyLObCj67REM54DAJHF/EdAKAiL5Bh
         zcTJL5p/2F+++hHcE6gt1jHwakSvuJt93Fr5cDVrtBCrcvy9YyCBCDhJG02zb7NrjK6J
         kYYdLmH8j7fAkmDGngKNPlS91ocXAut7GaYlTJ8aQov+zaMb2hc+YZ60+/aPV+0loA2Y
         L1yA==
X-Gm-Message-State: AFqh2kpocqMeq6Pu2lfdTweCbAIRYiWvWjhHoNs1cG4bYu6Z3mHZfFWJ
	q9edTKON2EwT0jzw1BEpy5NNlg==
X-Google-Smtp-Source: AMrXdXsmfZvPBvWuNxFVMNeO1Ac0PYKrfEsmbp3mlc1a88WTqTmMa3h81U+mBPX+aW0amyx2WnjElA==
X-Received: by 2002:a92:ccc9:0:b0:303:3034:3bf5 with SMTP id u9-20020a92ccc9000000b0030330343bf5mr1919443ilq.8.1671649324462;
        Wed, 21 Dec 2022 11:02:04 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id bo20-20020a056638439400b00374cd28d842sm4639774jab.104.2022.12.21.11.02.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 11:02:03 -0800 (PST)
Date: Wed, 21 Dec 2022 19:02:03 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: Regression: onboard-usb-hub breaks USB on RPi 3
Message-ID: <Y6NYK4/jp/QmusOX@google.com>
References: <d04bcc45-3471-4417-b30b-5cf9880d785d@i2se.com>
 <Y6Ci7wWvbBRRQkR6@google.com>
 <97c9b305-86f4-5918-54bf-4057e99eae3d@i2se.com>
 <Y6ECMZeh7G9bH8Fi@google.com>
 <db6f59bf-33a1-776e-b52c-4818ff9114e3@i2se.com>
 <Y6I8L45rDhqBMfUZ@google.com>
 <dde8b5e1-fbce-dd6c-6047-09e03ff2c00d@i2se.com>
 <Y6M5SPBpp/xMzUz7@google.com>
 <4a170314-6082-f3ba-cfb4-c19d7eb576c0@i2se.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a170314-6082-f3ba-cfb4-c19d7eb576c0@i2se.com>

Hi Stefan,

On Wed, Dec 21, 2022 at 07:00:41PM +0100, Stefan Wahren wrote:
> Hi Matthias,
> 
> Am 21.12.22 um 17:50 schrieb Matthias Kaehlcke:
> > On Wed, Dec 21, 2022 at 01:29:25PM +0100, Stefan Wahren wrote:
> > > Hi Matthias,
> > > 
> > > Am 20.12.22 um 23:50 schrieb Matthias Kaehlcke:
> > > > Today I learned that regulator_get() doesn't return an error when the regulator
> > > > isn't specified, but the 'dummy regulator'. With that the platform driver is
> > > > instantiated, which is not intended. The proper fix is probably to skip the
> > > > creation of the 'raw' platform device in onboard_hub_create_pdevs() when the
> > > > 'vdd-supply' does not exist.
> > > Yes, i can confirm this by debugfs:
> > > 
> > >   regulator                      use open bypass  opmode voltage current
> > > min     max
> > > ---------------------------------------------------------------------------------------
> > >   regulator-dummy                  8    7      0 unknown 0mV     0mA
> > > 0mV     0mV
> > >      serial0-0-vddio 1                                 0mA     0mV     0mV
> > >      serial0-0-vbat 1                                 0mA     0mV     0mV
> > >      3f980000.usb:usb-port@1:usb-port@1-vdd 1
> > > 0mA     0mV     0mV
> > >      3f980000.usb:usb-port@1-vdd 1                                 0mA
> > > 0mV     0mV
> > >      3f980000.usb-vusb_a 1                                 0mA     0mV
> > > 0mV
> > >      3f980000.usb-vusb_d 1                                 0mA     0mV
> > > 0mV
> > >      phy-vcc 1                                 0mA     0mV     0mV
> > > 
> > > > I tried to repro the Rpi 3 case by adjusting sc7280-herobrine.dtsi to look
> > > > somewhat similar to the Rpi 3 hub config, but so far I wasn't 'successful'
> > > > with breaking USB by deleting 'vdd-supply' (and 'peer-hub'). So I don't fully
> > > > understand your scenario, but I'm relatively confident that not creating the
> > > > platform devices should fix it.
> > > I just played a little bit with arch/arm/boot/dts/bcm283x-rpi-lan7515.dtsi
> > > and removed only the second hub node (including ethernet chip). After this
> > > the issue also doesn't occur without any modification to onboard-usb-hub. So
> > > it seems to me that the real issue is caused by the cascade of 2x Microchip
> > > USB2514B USB 2.0 hubs.
> > Thanks for your debugging efforts.
> > 
> > I did some limited testing with nested hubs during development of the
> > driver, using an external hub as alleged 2nd level onboard hub. I went
> > back to such a configuration, unfortunately I still can't repro what
> > you are seeing :(
> > 
> > > Here are the relevant kernel log entries:
> > > 
> > > [    4.025150] dwc2 3f980000.usb: supply vusb_d not found, using dummy
> > > regulator
> > > [    4.038776] dwc2 3f980000.usb: supply vusb_a not found, using dummy
> > > regulator
> > > [    4.104207] dwc2 3f980000.usb: DWC OTG Controller
> > > [    4.115852] dwc2 3f980000.usb: new USB bus registered, assigned bus
> > > number 1
> > > [    4.129921] dwc2 3f980000.usb: irq 66, io mem 0x3f980000
> > > [    4.513217] usb 1-1: new high-speed USB device number 2 using dwc2
> > > [    5.123296] usb 1-1.1: new high-speed USB device number 3 using dwc2
> > > [    5.623217] usb 1-1.3: new low-speed USB device number 4 using dwc2
> > > [    5.785049] input: HID 046a:0011 as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0001/input/input0
> > > [    5.863240] usb 1-1.1.2: new low-speed USB device number 5 using dwc2
> > > [    5.868998] hid-generic 0003:046A:0011.0001: input: USB HID v1.11
> > > Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
> > > [    6.031327] input: PixArt Microsoft USB Optical Mouse as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0002/input/input1
> > > [    6.031490] hid-generic 0003:045E:00CB.0002: input: USB HID v1.11 Mouse
> > > [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
> > > [    6.333278] usb 1-1.1.1: new high-speed USB device number 6 using dwc2
> > > [   24.165633] usbcore: registered new interface driver lan78xx
> > > [   24.423801] onboard-usb-hub 3f980000.usb:usb-port@1: supply vdd not
> > > found, using dummy regulator
> > > [   24.424202] usbcore: registered new device driver onboard-usb-hub
> > > [   24.424376] usb 1-1.1: USB disconnect, device number 3
> > > [   24.424385] usb 1-1.1.1: USB disconnect, device number 6
> > > [   24.564921] usb 1-1.1.2: USB disconnect, device number 5
> > > [   24.624696] usb 1-1.3: USB disconnect, device number 4
> > > [   25.523236] usb 1-1.1: new high-speed USB device number 7 using dwc2
> > > [   26.143248] usb 1-1.3: new low-speed USB device number 8 using dwc2
> > > [   26.305673] input: HID 046a:0011 as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0003/input/input2
> > > [   26.374840] hid-generic 0003:046A:0011.0003: input: USB HID v1.11
> > > Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
> > > [   26.383241] usb 1-1.1.2: new low-speed USB device number 9 using dwc2
> > > [   26.521526] input: PixArt Microsoft USB Optical Mouse as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0004/input/input3
> > > [   26.522241] hid-generic 0003:045E:00CB.0004: input: USB HID v1.11 Mouse
> > > [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
> > > [   26.833251] usb 1-1.1.1: new high-speed USB device number 10 using dwc2
> > > 
> > > As you can see the input devices are deregistered after probing of
> > > onboard-usb-hub and then registered again.
> > It looks like the onboard_usb_hub driver is built as a module, which
> > is the cause of the de- and re-registration. On a system that actually
> > intends to use the onboard_hub driver I would recommand to make it a
> > builtin driver to avoid this, but a module driver should still work.
> Yes, most of the USB stuff is builtin, but onboard-usb-hub is build as
> module.
> > I changed my kernel config to use a onboard_hub module, but that didn't
> > help either with reproducing the issue.
> > 
> > Which kernel version are you running on the Rpi 3?
> 
> I started with v6.1, then went to v6.0 and then

Ok, I also tried v6.1, besides a downstream v5.15 kernel.

> 43993626de00 ("usb: misc: onboard-hub: add support for Microchip USB2514B
> USB 2.0 hub"). All of them showed the issue. The configuration based on
> arm/multi_v7_defconfig. In the last case i need to enable ONBOARD_USB_HUB in
> the configuration.
> 
> Based on my observations in v6.1 it wasn't always reproducible (50/50
> chance).

Good to know, so timing might be a factor.

> Btw the initial subject wasn't precise only Rpi 3 B Plus is affected.

Ok, thanks for the clarification.

> > > The re-registering doesn't happen in the error case (as in my first email).
> > Could you add logs to onboard_hub_usbdev_probe() to see whether it is called
> > at all and how far it gets? Confirming whether onboard_hub_probe() completes
> > successfully might also help.
> 
> Sure:
> 
> [    7.963910] usbcore: registered new interface driver lan78xx
> [    8.231548] onboard-usb-hub 3f980000.usb:usb-port@1: onboard_hub_probe
> called
> [    8.231590] onboard-usb-hub 3f980000.usb:usb-port@1: supply vdd not
> found, using dummy regulator
> [    8.231763] onboard-usb-hub 3f980000.usb:usb-port@1: onboard_hub_probe
> success
> [    8.231867] onboard-usb-hub 3f980000.usb:usb-port@1:usb-port@1:
> onboard_hub_probe called
> [    8.231880] onboard-usb-hub 3f980000.usb:usb-port@1:usb-port@1: supply
> vdd not found, using dummy regulator
> [    8.231971] onboard-usb-hub 3f980000.usb:usb-port@1:usb-port@1:
> onboard_hub_probe success
> [    8.232090] usbcore: registered new device driver onboard-usb-hub
> [    8.232256] usb 1-1.1: USB disconnect, device number 3
> [    8.232264] usb 1-1.1.1: USB disconnect, device number 6
> [    8.380602] usb 1-1.1.2: USB disconnect, device number 5
> [    8.447421] usb 1-1.3: USB disconnect, device number 4
> 
> So onboard_hub_probe() is called successfully, but
> onboard_hub_usbdev_probe() doesn't seems to be.

Odd, the 'onboard-usb-hub' driver was registered, onboard_hub_probe()
completed for both hubs and the 'disconnect' logs seem to indicate that
re-probing started:

usb_register_device_driver
  __usb_bus_reprobe_drivers
    device_reprobe
      device_driver_detach   <= this should be the cause of the 'disconnect' logs
      bus_rescan_devices_helper
        device_lock(dev->parent)
        device_attach
	  __device_attach
	    device_lock(dev)
	    bus_for_each_drv
	      __device_attach_driver
	        driver_probe_device   <= one of the subcalls should call onboard_hub_usbdev_probe()

Maybe in the failure case some other thread acquired the device lock first
and then the parent lock, leading to an ABBA deadlock? Pure guess work ...

> > > Also in error case i noticed an unusual high load on the Rpi board, which
> > > doesn't occur in good case. Is it possible that both onboard-usb-hub
> > > instances are in some kind of deadlock?
> > Possibly. The driver itself uses a mutex for locking, which shouldn't result
> > in a high load in case of a deadlock, in any case the high load you are
> > observing seems to be related with the issue if it is only seen in the error
> > case.
> I will try to play with lock debugging.

Thanks, hopefully that can provide some hint.

> > Do things work properly when of_is_onboard_usb_hub() returns always false?
> > That would be similar to the fix I have in mind for configs that shouldn't
> > use the onboard_hub driver.
> [   24.781914] usbcore: registered new device driver onboard-usb-hub
> [   24.782097] usb 1-1.1: USB disconnect, device number 3
> [   24.782110] usb 1-1.1.1: USB disconnect, device number 6
> [   24.916725] usb 1-1.1.2: USB disconnect, device number 5
> [   25.011118] usb 1-1.3: USB disconnect, device number 4
> [   25.648211] onboard-usb-hub 1-1: onboard_hub_usbdev_probe called
> [   25.648259] onboard-usb-hub 1-1: failed to find device node for peer hub
> [   25.648264] onboard-usb-hub: probe of 1-1 failed with error -22
> [   25.965643] usb 1-1.1: new high-speed USB device number 7 using dwc2
> [   26.107578] onboard-usb-hub 1-1.1: onboard_hub_usbdev_probe called
> [   26.107636] onboard-usb-hub 1-1.1: failed to find device node for peer
> hub
> [   26.107642] onboard-usb-hub: probe of 1-1.1 failed with error -22
> [   26.415691] usb 1-1.3: new low-speed USB device number 8 using dwc2
> [   26.567393] input: HID 046a:0011 as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0003/input/input2
> [   26.637183] hid-generic 0003:046A:0011.0003: input: USB HID v1.11
> Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
> [   26.645694] usb 1-1.1.2: new low-speed USB device number 9 using dwc2
> [   26.793634] input: PixArt Microsoft USB Optical Mouse as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0004/input/input3
> [   26.793859] hid-generic 0003:045E:00CB.0004: input: USB HID v1.11 Mouse
> [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
> [   27.135695] usb 1-1.1.1: new high-speed USB device number 10 using dwc2

The keyboard and the mouse are enumerated, so it seems generally the fix
would work. We should probably get rid of the "failed to find device node
for peer hub" log, the assumption was that the driver only gets probed
when it should be used, but that isn't always the case. And _probe() should
probably return -ENODEV when no platform device exists, not -EINVAL.
