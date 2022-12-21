Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B128FC
	for <regressions@lists.linux.dev>; Wed, 21 Dec 2022 16:50:18 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id d14so8161713ilq.11
        for <regressions@lists.linux.dev>; Wed, 21 Dec 2022 08:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VQdZu8N/DS9tgyGPl3GlJuDcOjmwaH3SgMLnskg/MIw=;
        b=fspS9VnVPM4o2NizSSRZoGdKGxwaFSrhib45ZZMVp9ywsmZEU11dDKZmHtHq6NJQQ7
         6jn9kyzssAZVK10sMUF6+klu7zYZBLrfdc4K9YoSYCsivGMhPpKtAY3v25yuRch8rxi5
         dbx0eGanaFUUX+BC27wZ/TdXTrkNkXcUIuovY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQdZu8N/DS9tgyGPl3GlJuDcOjmwaH3SgMLnskg/MIw=;
        b=2ZdiEoxiwnk6vmYClu4fw6KJmOn+N5Lx7LC8ILlLRPTnxZxVLHodHQma2IWsdUcRa3
         Ii39n7PCkDg5qK+sl7CHZ1yDBYcaM7oJGMqofDm9ikrvgZkyMx877rWlvvWGkM0iFTwe
         l+pQsMpBoxPs5IfWfpnn3+OnAeREs/y1Cw+5x9J54vQc3O8rXDKJCiY2GN47vz6zU4No
         T/+Tu7OPxkWAl7liWBVylXexQIIBagHOnL5gAZK3Eq9+WLNFeAj1dU9UHyVBH9NhOExI
         YEH0eGKvJ4fus9HObVRj4U5t4ktnh1keCtOZVCRoqADSAC2GKyNBg74L1/Z/uQfCu+vk
         eaVA==
X-Gm-Message-State: AFqh2ko8V+4ORTkHHyG5nAWT7KSntlHQ2IF9/+aQ5BMrNhvIB/gqcHtC
	BkGnirB5mzXEoHGE8nTth6jJVA==
X-Google-Smtp-Source: AMrXdXuRq/OmsQF1FIMl8uXXTKt/MhDbMAEE5otg3ZjGplharDSVgaXnPxJOw6cVsxYWx/GW95scpw==
X-Received: by 2002:a92:cb44:0:b0:303:2965:9617 with SMTP id f4-20020a92cb44000000b0030329659617mr1690890ilq.9.1671641417467;
        Wed, 21 Dec 2022 08:50:17 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id e6-20020a022106000000b0038a007a26e7sm5803049jaa.126.2022.12.21.08.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 08:50:17 -0800 (PST)
Date: Wed, 21 Dec 2022 16:50:16 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: Regression: onboard-usb-hub breaks USB on RPi 3
Message-ID: <Y6M5SPBpp/xMzUz7@google.com>
References: <d04bcc45-3471-4417-b30b-5cf9880d785d@i2se.com>
 <Y6Ci7wWvbBRRQkR6@google.com>
 <97c9b305-86f4-5918-54bf-4057e99eae3d@i2se.com>
 <Y6ECMZeh7G9bH8Fi@google.com>
 <db6f59bf-33a1-776e-b52c-4818ff9114e3@i2se.com>
 <Y6I8L45rDhqBMfUZ@google.com>
 <dde8b5e1-fbce-dd6c-6047-09e03ff2c00d@i2se.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dde8b5e1-fbce-dd6c-6047-09e03ff2c00d@i2se.com>

On Wed, Dec 21, 2022 at 01:29:25PM +0100, Stefan Wahren wrote:
> Hi Matthias,
> 
> Am 20.12.22 um 23:50 schrieb Matthias Kaehlcke:
> > 
> > Today I learned that regulator_get() doesn't return an error when the regulator
> > isn't specified, but the 'dummy regulator'. With that the platform driver is
> > instantiated, which is not intended. The proper fix is probably to skip the
> > creation of the 'raw' platform device in onboard_hub_create_pdevs() when the
> > 'vdd-supply' does not exist.
> 
> Yes, i can confirm this by debugfs:
> 
>  regulator                      use open bypass  opmode voltage current    
> min     max
> ---------------------------------------------------------------------------------------
>  regulator-dummy                  8    7      0 unknown 0mV     0mA    
> 0mV     0mV
>     serial0-0-vddio 1                                 0mA     0mV     0mV
>     serial0-0-vbat 1                                 0mA     0mV     0mV
>     3f980000.usb:usb-port@1:usb-port@1-vdd 1                                
> 0mA     0mV     0mV
>     3f980000.usb:usb-port@1-vdd 1                                 0mA    
> 0mV     0mV
>     3f980000.usb-vusb_a 1                                 0mA     0mV    
> 0mV
>     3f980000.usb-vusb_d 1                                 0mA     0mV    
> 0mV
>     phy-vcc 1                                 0mA     0mV     0mV
> 
> > 
> > I tried to repro the Rpi 3 case by adjusting sc7280-herobrine.dtsi to look
> > somewhat similar to the Rpi 3 hub config, but so far I wasn't 'successful'
> > with breaking USB by deleting 'vdd-supply' (and 'peer-hub'). So I don't fully
> > understand your scenario, but I'm relatively confident that not creating the
> > platform devices should fix it.
> 
> I just played a little bit with arch/arm/boot/dts/bcm283x-rpi-lan7515.dtsi
> and removed only the second hub node (including ethernet chip). After this
> the issue also doesn't occur without any modification to onboard-usb-hub. So
> it seems to me that the real issue is caused by the cascade of 2x Microchip
> USB2514B USB 2.0 hubs.

Thanks for your debugging efforts.

I did some limited testing with nested hubs during development of the
driver, using an external hub as alleged 2nd level onboard hub. I went
back to such a configuration, unfortunately I still can't repro what
you are seeing :(

> Here are the relevant kernel log entries:
> 
> [    4.025150] dwc2 3f980000.usb: supply vusb_d not found, using dummy
> regulator
> [    4.038776] dwc2 3f980000.usb: supply vusb_a not found, using dummy
> regulator
> [    4.104207] dwc2 3f980000.usb: DWC OTG Controller
> [    4.115852] dwc2 3f980000.usb: new USB bus registered, assigned bus
> number 1
> [    4.129921] dwc2 3f980000.usb: irq 66, io mem 0x3f980000
> [    4.513217] usb 1-1: new high-speed USB device number 2 using dwc2
> [    5.123296] usb 1-1.1: new high-speed USB device number 3 using dwc2
> [    5.623217] usb 1-1.3: new low-speed USB device number 4 using dwc2
> [    5.785049] input: HID 046a:0011 as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0001/input/input0
> [    5.863240] usb 1-1.1.2: new low-speed USB device number 5 using dwc2
> [    5.868998] hid-generic 0003:046A:0011.0001: input: USB HID v1.11
> Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
> [    6.031327] input: PixArt Microsoft USB Optical Mouse as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0002/input/input1
> [    6.031490] hid-generic 0003:045E:00CB.0002: input: USB HID v1.11 Mouse
> [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
> [    6.333278] usb 1-1.1.1: new high-speed USB device number 6 using dwc2
> [   24.165633] usbcore: registered new interface driver lan78xx
> [   24.423801] onboard-usb-hub 3f980000.usb:usb-port@1: supply vdd not
> found, using dummy regulator
> [   24.424202] usbcore: registered new device driver onboard-usb-hub
> [   24.424376] usb 1-1.1: USB disconnect, device number 3
> [   24.424385] usb 1-1.1.1: USB disconnect, device number 6
> [   24.564921] usb 1-1.1.2: USB disconnect, device number 5
> [   24.624696] usb 1-1.3: USB disconnect, device number 4
> [   25.523236] usb 1-1.1: new high-speed USB device number 7 using dwc2
> [   26.143248] usb 1-1.3: new low-speed USB device number 8 using dwc2
> [   26.305673] input: HID 046a:0011 as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0003/input/input2
> [   26.374840] hid-generic 0003:046A:0011.0003: input: USB HID v1.11
> Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
> [   26.383241] usb 1-1.1.2: new low-speed USB device number 9 using dwc2
> [   26.521526] input: PixArt Microsoft USB Optical Mouse as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0004/input/input3
> [   26.522241] hid-generic 0003:045E:00CB.0004: input: USB HID v1.11 Mouse
> [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
> [   26.833251] usb 1-1.1.1: new high-speed USB device number 10 using dwc2
> 
> As you can see the input devices are deregistered after probing of
> onboard-usb-hub and then registered again.

It looks like the onboard_usb_hub driver is built as a module, which
is the cause of the de- and re-registration. On a system that actually
intends to use the onboard_hub driver I would recommand to make it a
builtin driver to avoid this, but a module driver should still work.

I changed my kernel config to use a onboard_hub module, but that didn't
help either with reproducing the issue.

Which kernel version are you running on the Rpi 3?

> The re-registering doesn't happen in the error case (as in my first email).

Could you add logs to onboard_hub_usbdev_probe() to see whether it is called
at all and how far it gets? Confirming whether onboard_hub_probe() completes
successfully might also help.

> Also in error case i noticed an unusual high load on the Rpi board, which
> doesn't occur in good case. Is it possible that both onboard-usb-hub
> instances are in some kind of deadlock?

Possibly. The driver itself uses a mutex for locking, which shouldn't result
in a high load in case of a deadlock, in any case the high load you are
observing seems to be related with the issue if it is only seen in the error
case.

Do things work properly when of_is_onboard_usb_hub() returns always false?
That would be similar to the fix I have in mind for configs that shouldn't
use the onboard_hub driver.
