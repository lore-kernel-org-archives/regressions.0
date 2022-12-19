Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122A76D24
	for <regressions@lists.linux.dev>; Mon, 19 Dec 2022 17:44:17 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id v2so5067791ioe.4
        for <regressions@lists.linux.dev>; Mon, 19 Dec 2022 09:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YqliwFtcJutPu3minuCfL/fQPu5mhh9/fFlsiWaptxQ=;
        b=LSPhxBMlDvUbquN88kj/pETVhz36BEiL8KPLu8lRowTRfpSdYadzsV7QarUczLC3Mv
         s3naiKmuai8ILttvEyggAe2Gv21et014yZI5o7RIoOWszEdSUe7DhqTRP1lZKgQ+ZPUx
         CuEAzxWGwx1kkrpNgH/jbN/zJw+XjnlF79jrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqliwFtcJutPu3minuCfL/fQPu5mhh9/fFlsiWaptxQ=;
        b=srWaXM5BeP62bE5ud2X30fxwMCRP53pCJkrFldVpe5uxFvJOJ7K3PqcCJ7aOxVY2SD
         e7g2bDDd2w3i3NnOEhf7BLJ2vgPrCgn7cCZwpxAKNib6oKac2JVF8eF6Wx3ZSl6v/3fp
         lbXpPdCwPyknDj7EuTMcK3FHO1AOFzYcGmpe4ghfXLf35N/z+sVUhl6eByRKkI3P/OyC
         qu469wwijehUQEEEOPuxIeLQCUbF/UN47eUiO3Apr44idrMQxHqqj1tnYxs+uoIlKNdB
         NsXwDDSuGAPzNAgGqxa+H4JOALsu4rRf8BI8yhUwTGbkip3eq5opu+tQABLJVFDP2KjO
         zarA==
X-Gm-Message-State: ANoB5pmt0OII/ERJ7af57kW62lRzfxrFadAWW/X1VoptNvmyx80z4ttp
	VzUlOiMm/LdXDiE2KTj+NJholA==
X-Google-Smtp-Source: AA0mqf4LLmCey9fB9AU/98DazVruZzCZN+1Q3RYhgvkYS3ur5qH8CSXmXOuA4oKNYnDKs8lCmRshOg==
X-Received: by 2002:a6b:cac7:0:b0:6d4:264f:2427 with SMTP id a190-20020a6bcac7000000b006d4264f2427mr26778283iog.21.1671471857120;
        Mon, 19 Dec 2022 09:44:17 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id x5-20020a0566022c4500b006d8b7bcaa6esm4197929iov.4.2022.12.19.09.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 09:44:16 -0800 (PST)
Date: Mon, 19 Dec 2022 17:44:15 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: Regression: onboard-usb-hub breaks USB on RPi 3
Message-ID: <Y6Ci7wWvbBRRQkR6@google.com>
References: <d04bcc45-3471-4417-b30b-5cf9880d785d@i2se.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d04bcc45-3471-4417-b30b-5cf9880d785d@i2se.com>

Hi Stefan,

Sorry for the regression.

What seems to happen is this:

arch/arm/boot/dts/bcm283x-rpi-lan7515.dtsi specifies device nodes for the
two (nested) USB hubs (which is done rarely since USB devices (including
hubs) are autodetected). The DT nodes were most likely only added to be
able to configure the LED modes of the USB to Ethernet adapter. With
43993626de00 ("usb: misc: onboard-hub: add support for Microchip USB2514B
USB 2.0 hub") the onboard_usb_hub driver gained support for the hubs on
the RPi3. The onboard_usb_hub driver expects a regulator ("vdd") in the DT
node of the USB hub, which isn't present for the RPi3 (this isn't an error
per se). Without the regulator the onboard_hub platform driver fails to
probe, when the USB driver of the hub is probed (onboard_hub_usbdev_probe())
it doesn't find the corresponding platform driver instance
(_find_onboard_hub()) and defers probing. When the deferred probe runs it
encounters the same situation, rinse and repeat.

One possible fix would be to specify the 'missing' "vdd" property, however
that wouln't fix the issue for other boards with a similar configurations.
Instead the driver could check if "vdd" exists in the DT node of the hub,
and not defer probing if it doesn't.

Could you please try if the below patch fixes the issue on the Rpi 3?

Thanks

m.


diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index d63c63942af1..4d2a27afb09c 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -363,6 +363,15 @@ static struct onboard_hub *_find_onboard_hub(struct device *dev)
 	hub = dev_get_drvdata(&pdev->dev);
 	put_device(&pdev->dev);
 
+	/*
+	 * Some boards have device tree nodes for USB hubs supported by this
+	 * driver, but the nodes don't have all properties needed for the driver
+	 * to work properly. Use the absence of the "vdd" regulator as an
+	 * indicator of such nodes.
+	 */
+	if (!of_get_property(pdev->dev.of_node, "vdd", NULL))
+		return ERR_PTR(-ENODEV);
+
 	/*
 	 * The presence of drvdata ('hub') indicates that the platform driver
 	 * finished probing. This handles the case where (conceivably) we could



On Sun, Dec 18, 2022 at 02:35:43PM +0100, Stefan Wahren wrote:
> Hi,
> 
> unfortunately i didn't notice this regression sooner, but the following
> commits breaks USB on Raspberry Pi 3:
> 
> usb: misc: Add onboard_usb_hub driver
> usb: misc: onboard-hub: add support for Microchip USB2514B USB 2.0 hub
> 
> After these commits (and this new driver enabled like in multi_v7_defconfig)
> the connected USB devices doesn't work anymore (mouse is powered, but no
> function of keyboard and mouse). Reconnecting doesn't help. Running lsusb
> hangs forever.
> 
> Here is the relevant dmesg in error case:
> 
> [    0.078446] usbcore: registered new interface driver usbfs
> [    0.078516] usbcore: registered new interface driver hub
> [    0.078574] usbcore: registered new device driver usb
> [    0.078827] usb_phy_generic phy: supply vcc not found, using dummy
> regulator
> [    0.078990] usb_phy_generic phy: dummy supplies not allowed for exclusive
> requests
> [    2.897258] usbcore: registered new interface driver pegasus
> [    2.903161] usbcore: registered new interface driver asix
> [    2.908809] usbcore: registered new interface driver ax88179_178a
> [    2.915185] usbcore: registered new interface driver cdc_ether
> [    2.921281] usbcore: registered new interface driver smsc75xx
> [    2.927305] usbcore: registered new interface driver smsc95xx
> [    2.933298] usbcore: registered new interface driver net1080
> [    2.939219] usbcore: registered new interface driver cdc_subset
> [    2.945407] usbcore: registered new interface driver zaurus
> [    2.951238] usbcore: registered new interface driver cdc_ncm
> [    3.030909] usbcore: registered new interface driver usb-storage
> [    3.178104] usbcore: registered new interface driver usbhid
> [    3.191022] usbhid: USB HID core driver
> [    3.981848] dwc2 3f980000.usb: supply vusb_d not found, using dummy
> regulator
> [    3.992467] dwc2 3f980000.usb: supply vusb_a not found, using dummy
> regulator
> [    4.053728] dwc2 3f980000.usb: DWC OTG Controller
> [    4.065343] dwc2 3f980000.usb: new USB bus registered, assigned bus
> number 1
> [    4.079415] dwc2 3f980000.usb: irq 66, io mem 0x3f980000
> [    4.463447] usb 1-1: new high-speed USB device number 2 using dwc2
> [    5.063444] usb 1-1.1: new high-speed USB device number 3 using dwc2
> [    5.523440] usb 1-1.3: new low-speed USB device number 4 using dwc2
> [    5.685546] input: HID 046a:0011 as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0001/input/input0
> [    5.763446] usb 1-1.1.2: new low-speed USB device number 5 using dwc2
> [    5.777968] hid-generic 0003:046A:0011.0001: input: USB HID v1.11
> Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
> [    5.931991] input: PixArt Microsoft USB Optical Mouse as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0002/input/input1
> [    5.954668] hid-generic 0003:045E:00CB.0002: input: USB HID v1.11 Mouse
> [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
> [    6.263459] usb 1-1.1.1: new high-speed USB device number 6 using dwc2
> [   14.828915] onboard-usb-hub 3f980000.usb:usb-port@1: supply vdd not
> found, using dummy regulator
> [   14.829493] onboard-usb-hub 3f980000.usb:usb-port@1:usb-port@1: supply
> vdd not found, using dummy regulator
> [   14.829729] usbcore: registered new device driver onboard-usb-hub
> [   14.829945] usb 1-1.1: USB disconnect, device number 3
> [   14.829958] usb 1-1.1.1: USB disconnect, device number 6
> [   14.830419] usb 1-1.1.2: USB disconnect, device number 5
> [   14.854725] usb 1-1.3: USB disconnect, device number 4
> [   14.896865] usbcore: registered new interface driver lan78xx
> 
> Unfortunately i'm not that USB expert, so please tell me if you need more
> information.
> 
