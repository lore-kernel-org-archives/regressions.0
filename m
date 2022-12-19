Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126E67E
	for <regressions@lists.linux.dev>; Mon, 19 Dec 2022 10:41:07 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p7DZy-0003XI-0p; Mon, 19 Dec 2022 11:41:06 +0100
Message-ID: <4d8f77ab-d5e9-7366-a823-0e6a620d6374@leemhuis.info>
Date: Mon, 19 Dec 2022 11:41:05 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Regression: onboard-usb-hub breaks USB on RPi 3 #forregzbot
Content-Language: en-US, de-DE
To: regressions@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <d04bcc45-3471-4417-b30b-5cf9880d785d@i2se.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <d04bcc45-3471-4417-b30b-5cf9880d785d@i2se.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671446468;4b637afd;
X-HE-SMSGID: 1p7DZy-0003XI-0p

[Note: this mail contains only information for Linux kernel regression
tracking. Mails like these contain '#forregzbot' in the subject to make
then easy to spot and filter out. The author also tried to remove most
or all individuals from the list of recipients to spare them the hassle.]

On 18.12.22 14:35, Stefan Wahren wrote:
> 
> unfortunately i didn't notice this regression sooner, but the following
> commits breaks USB on Raspberry Pi 3:
> 
> usb: misc: Add onboard_usb_hub driver

that's 43993626de00

> usb: misc: onboard-hub: add support for Microchip USB2514B USB 2.0 hub

that's 8bc063641ceb

/me wonders which of this it actually is and assumes it's the latter

> After these commits (and this new driver enabled like in
> multi_v7_defconfig) the connected USB devices doesn't work anymore
> (mouse is powered, but no function of keyboard and mouse). Reconnecting
> doesn't help. Running lsusb hangs forever.

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced 8bc063641ceb
#regzbot title usb: onboard-usb-hub breaks USB on RPi3
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

> Here is the relevant dmesg in error case:
> 
> [    0.078446] usbcore: registered new interface driver usbfs
> [    0.078516] usbcore: registered new interface driver hub
> [    0.078574] usbcore: registered new device driver usb
> [    0.078827] usb_phy_generic phy: supply vcc not found, using dummy
> regulator
> [    0.078990] usb_phy_generic phy: dummy supplies not allowed for
> exclusive requests
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
> [    5.685546] input: HID 046a:0011 as
> /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0001/input/input0
> [    5.763446] usb 1-1.1.2: new low-speed USB device number 5 using dwc2
> [    5.777968] hid-generic 0003:046A:0011.0001: input: USB HID v1.11
> Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
> [    5.931991] input: PixArt Microsoft USB Optical Mouse as
> /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0002/input/input1
> [    5.954668] hid-generic 0003:045E:00CB.0002: input: USB HID v1.11
> Mouse [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
> [    6.263459] usb 1-1.1.1: new high-speed USB device number 6 using dwc2
> [   14.828915] onboard-usb-hub 3f980000.usb:usb-port@1: supply vdd not
> found, using dummy regulator
> [   14.829493] onboard-usb-hub 3f980000.usb:usb-port@1:usb-port@1:
> supply vdd not found, using dummy regulator
> [   14.829729] usbcore: registered new device driver onboard-usb-hub
> [   14.829945] usb 1-1.1: USB disconnect, device number 3
> [   14.829958] usb 1-1.1.1: USB disconnect, device number 6
> [   14.830419] usb 1-1.1.2: USB disconnect, device number 5
> [   14.854725] usb 1-1.3: USB disconnect, device number 4
> [   14.896865] usbcore: registered new interface driver lan78xx
> 
> Unfortunately i'm not that USB expert, so please tell me if you need
> more information.
> 
> 
> 
