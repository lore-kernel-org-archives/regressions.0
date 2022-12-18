Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CA310E3
	for <regressions@lists.linux.dev>; Sun, 18 Dec 2022 13:41:07 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.22]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MsYzF-1omUKh1mCh-00u276; Sun, 18 Dec 2022 14:35:44 +0100
Message-ID: <d04bcc45-3471-4417-b30b-5cf9880d785d@i2se.com>
Date: Sun, 18 Dec 2022 14:35:43 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Regression: onboard-usb-hub breaks USB on RPi 3
To: Matthias Kaehlcke <mka@chromium.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev,
 Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gDzA7c/TuVoZ5rJbtljSuN6SqCdFsXHlW5B93ysBeqmWe8ZOPyt
 SNooWtEAufPMxGwxn3njOB2btZPe9CkIEaYijymWXjHLG0oVuCHbnlQvkxU1qpFqqcRp5+3
 XMe1uCNRZbTGOc6C4KZQ/C2c2XRKhbmhs+k7APeN0OUvPngWNx/WBfHwQA7B6INnRa2MQ8A
 iLil96GMpKnJoXLyViaRw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CI5mAbaTDOc=;fl2L4aDaAEHvB9FAaDIiS91MQ9c
 bbYsaTKElw/5t7monOEZ1jrfIvR2DjLVsRLUvZhyTLte01DmesARsV2f1ILY5BMNaG2DEYYME
 HoBwI2+cPa73eRUfKXytKaDp0kob6Fwb42QjzNuoPfhmhQflI/yMrNyR/uo2JMem1NNaJxZYz
 gLaPQd/QgY9SAj5afAD0doGBFuZcE92iA0X/i8TIvBgjHw/K3QfQhTxsH9GxV/csUWsfF9fVD
 D1XR4+s6wYJ1tZW5QzuTiKI60FgFgh6rN6wVWt9KvD4jSZhRjli+FoWCxuL7/N8rojKufDIBy
 8vwvFpFH2Icro1QTMPElURCZJsZ2BQWXZMxa+extZB+ayYkorKuUEerxmR0CJTlsdj4ctBvQ3
 zOe6d5MQPehunwkqGx1PTqHP8/Mf1OPxdJeVr4xXnUpRTG5LmSmrZQMlUsmQ5jnxaOWFFgSWU
 1tyPYqfCrgBkDiJbf1S5FcB1uYZ7olDvbDcnpVsrgsAK5TYobKyWu/6hGqlg/ZZgYK9cbIkGO
 brVK7q6q4TIbmhOLTjlldm/DraYnGcweuPJqAOWQfr+jxyLL5Dx3HdtarsltyztV2tYAEj4m7
 rSPhbvV6vORAz0kLQmAH0m3tAySSts0uiHr0XPBV/hUf3Mx5ZNyrcwYIVE0AjXPLUueATAT15
 vRq9WuOw/b2GuB9hQlK+yAXty1y62e8iXG4n3n2r4A==

Hi,

unfortunately i didn't notice this regression sooner, but the following 
commits breaks USB on Raspberry Pi 3:

usb: misc: Add onboard_usb_hub driver
usb: misc: onboard-hub: add support for Microchip USB2514B USB 2.0 hub

After these commits (and this new driver enabled like in 
multi_v7_defconfig) the connected USB devices doesn't work anymore 
(mouse is powered, but no function of keyboard and mouse). Reconnecting 
doesn't help. Running lsusb hangs forever.

Here is the relevant dmesg in error case:

[    0.078446] usbcore: registered new interface driver usbfs
[    0.078516] usbcore: registered new interface driver hub
[    0.078574] usbcore: registered new device driver usb
[    0.078827] usb_phy_generic phy: supply vcc not found, using dummy 
regulator
[    0.078990] usb_phy_generic phy: dummy supplies not allowed for 
exclusive requests
[    2.897258] usbcore: registered new interface driver pegasus
[    2.903161] usbcore: registered new interface driver asix
[    2.908809] usbcore: registered new interface driver ax88179_178a
[    2.915185] usbcore: registered new interface driver cdc_ether
[    2.921281] usbcore: registered new interface driver smsc75xx
[    2.927305] usbcore: registered new interface driver smsc95xx
[    2.933298] usbcore: registered new interface driver net1080
[    2.939219] usbcore: registered new interface driver cdc_subset
[    2.945407] usbcore: registered new interface driver zaurus
[    2.951238] usbcore: registered new interface driver cdc_ncm
[    3.030909] usbcore: registered new interface driver usb-storage
[    3.178104] usbcore: registered new interface driver usbhid
[    3.191022] usbhid: USB HID core driver
[    3.981848] dwc2 3f980000.usb: supply vusb_d not found, using dummy 
regulator
[    3.992467] dwc2 3f980000.usb: supply vusb_a not found, using dummy 
regulator
[    4.053728] dwc2 3f980000.usb: DWC OTG Controller
[    4.065343] dwc2 3f980000.usb: new USB bus registered, assigned bus 
number 1
[    4.079415] dwc2 3f980000.usb: irq 66, io mem 0x3f980000
[    4.463447] usb 1-1: new high-speed USB device number 2 using dwc2
[    5.063444] usb 1-1.1: new high-speed USB device number 3 using dwc2
[    5.523440] usb 1-1.3: new low-speed USB device number 4 using dwc2
[    5.685546] input: HID 046a:0011 as 
/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0001/input/input0
[    5.763446] usb 1-1.1.2: new low-speed USB device number 5 using dwc2
[    5.777968] hid-generic 0003:046A:0011.0001: input: USB HID v1.11 
Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
[    5.931991] input: PixArt Microsoft USB Optical Mouse as 
/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0002/input/input1
[    5.954668] hid-generic 0003:045E:00CB.0002: input: USB HID v1.11 
Mouse [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
[    6.263459] usb 1-1.1.1: new high-speed USB device number 6 using dwc2
[   14.828915] onboard-usb-hub 3f980000.usb:usb-port@1: supply vdd not 
found, using dummy regulator
[   14.829493] onboard-usb-hub 3f980000.usb:usb-port@1:usb-port@1: 
supply vdd not found, using dummy regulator
[   14.829729] usbcore: registered new device driver onboard-usb-hub
[   14.829945] usb 1-1.1: USB disconnect, device number 3
[   14.829958] usb 1-1.1.1: USB disconnect, device number 6
[   14.830419] usb 1-1.1.2: USB disconnect, device number 5
[   14.854725] usb 1-1.3: USB disconnect, device number 4
[   14.896865] usbcore: registered new interface driver lan78xx

Unfortunately i'm not that USB expert, so please tell me if you need 
more information.

