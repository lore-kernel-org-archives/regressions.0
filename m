Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658FA23A4
	for <regressions@lists.linux.dev>; Wed, 21 Dec 2022 12:29:32 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.22]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N1fei-1ojWVq0QAK-011wTb; Wed, 21 Dec 2022 13:29:26 +0100
Message-ID: <dde8b5e1-fbce-dd6c-6047-09e03ff2c00d@i2se.com>
Date: Wed, 21 Dec 2022 13:29:25 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Regression: onboard-usb-hub breaks USB on RPi 3
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>
References: <d04bcc45-3471-4417-b30b-5cf9880d785d@i2se.com>
 <Y6Ci7wWvbBRRQkR6@google.com> <97c9b305-86f4-5918-54bf-4057e99eae3d@i2se.com>
 <Y6ECMZeh7G9bH8Fi@google.com> <db6f59bf-33a1-776e-b52c-4818ff9114e3@i2se.com>
 <Y6I8L45rDhqBMfUZ@google.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <Y6I8L45rDhqBMfUZ@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:WzvLKeoZz1JPq3yq0oihQi0uHDFNQPNLazVttT4I6Ez2hQp0drJ
 DA+TjSKmRrDCKicL49Z343z6YAnoofcw4QLNYk7ASzJ5/BYC0Hkue3ZsCCgu/X2n3rk4Brw
 ko7SWhB4aJzSNnadV9LrQ8p5vxgrf63RlBM95WWatuDM5jd6txa1DWKBXeZtYAaPn1wnQW2
 EWEAqVuwREI3zXIg/Nbvg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Yz6Au85ayy8=;/WmL5nqTYq/wHsmnpV859a1UO12
 +C0ZAPpy7HVINuyD40vAzM3XkFfRmxZ3DMETjHC4NfWrg4MCxxVBivCe+qh31fZd63a7uWMWb
 uGjYdgbtbqbCYGEj8Ee/aoQPs9DamYLkINpsx877cBbk17add2MHsm2FUN+Dqv9K3hkvD/gpu
 w3aPVykLbJGZnh0cqHfqFDGj49NY2MBvkUPREHLHx66U4BfC36rgvPLMsWV3+CiEBU2q4lCBO
 LqORAFAlb9Z9t4hlmakwmDIWXBt8Y5lluC824vbExhpPt1OxuoTClnj15zHhSl46z1Ro1O77T
 jAnlSLB7vrYBAHe67WZd061NF12VoiSRi2iD1jMI9ulWdH+qQiW0RKtjh+94tELzB+gv3BA2X
 j1ayIAeOTCSnVzsxBfK6NT0YFfWt3b9JnDgGMVLcxPefVwUSOUdcAfp+KBuTuV06pg7I/NEPc
 DjLEKnmW3Ap8ql8dkgc9FN30u/bl7esfkJDlUwVTvWXt+lnzip46kS1lo1F1ExBjTkhMoEkun
 QxFzPNOLOAIWYbvK+xKO6UwsWjAcaQt5oSzj3bS/JvU00Q/nRkiOJbZSPA3kgap9vevmRqk3i
 vf/HxICLI/9enq7cidky5/iYSFi8V0ct/91VzLPjMIgHUUs7lmRJV0eyMArW7XxTm/K2dZKwD
 Jb5y3xK83TNpV4NA+qFpNax0P9VmpfuVmQTZVrYDBw==

Hi Matthias,

Am 20.12.22 um 23:50 schrieb Matthias Kaehlcke:
>
> Today I learned that regulator_get() doesn't return an error when the regulator
> isn't specified, but the 'dummy regulator'. With that the platform driver is
> instantiated, which is not intended. The proper fix is probably to skip the
> creation of the 'raw' platform device in onboard_hub_create_pdevs() when the
> 'vdd-supply' does not exist.

Yes, i can confirm this by debugfs:

  regulator                      use open bypass  opmode voltage 
current     min     max
---------------------------------------------------------------------------------------
  regulator-dummy                  8    7      0 unknown 0mV     0mA     
0mV     0mV
     serial0-0-vddio 1                                 0mA     0mV     0mV
     serial0-0-vbat 1                                 0mA     0mV     0mV
     3f980000.usb:usb-port@1:usb-port@1-vdd 
1                                 0mA     0mV     0mV
     3f980000.usb:usb-port@1-vdd 1                                 
0mA     0mV     0mV
     3f980000.usb-vusb_a 1                                 0mA     
0mV     0mV
     3f980000.usb-vusb_d 1                                 0mA     
0mV     0mV
     phy-vcc 1                                 0mA     0mV     0mV

>
> I tried to repro the Rpi 3 case by adjusting sc7280-herobrine.dtsi to look
> somewhat similar to the Rpi 3 hub config, but so far I wasn't 'successful'
> with breaking USB by deleting 'vdd-supply' (and 'peer-hub'). So I don't fully
> understand your scenario, but I'm relatively confident that not creating the
> platform devices should fix it.

I just played a little bit with 
arch/arm/boot/dts/bcm283x-rpi-lan7515.dtsi and removed only the second 
hub node (including ethernet chip). After this the issue also doesn't 
occur without any modification to onboard-usb-hub. So it seems to me 
that the real issue is caused by the cascade of 2x Microchip USB2514B 
USB 2.0 hubs.

Here are the relevant kernel log entries:

[    4.025150] dwc2 3f980000.usb: supply vusb_d not found, using dummy 
regulator
[    4.038776] dwc2 3f980000.usb: supply vusb_a not found, using dummy 
regulator
[    4.104207] dwc2 3f980000.usb: DWC OTG Controller
[    4.115852] dwc2 3f980000.usb: new USB bus registered, assigned bus 
number 1
[    4.129921] dwc2 3f980000.usb: irq 66, io mem 0x3f980000
[    4.513217] usb 1-1: new high-speed USB device number 2 using dwc2
[    5.123296] usb 1-1.1: new high-speed USB device number 3 using dwc2
[    5.623217] usb 1-1.3: new low-speed USB device number 4 using dwc2
[    5.785049] input: HID 046a:0011 as 
/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0001/input/input0
[    5.863240] usb 1-1.1.2: new low-speed USB device number 5 using dwc2
[    5.868998] hid-generic 0003:046A:0011.0001: input: USB HID v1.11 
Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
[    6.031327] input: PixArt Microsoft USB Optical Mouse as 
/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0002/input/input1
[    6.031490] hid-generic 0003:045E:00CB.0002: input: USB HID v1.11 
Mouse [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
[    6.333278] usb 1-1.1.1: new high-speed USB device number 6 using dwc2
[   24.165633] usbcore: registered new interface driver lan78xx
[   24.423801] onboard-usb-hub 3f980000.usb:usb-port@1: supply vdd not 
found, using dummy regulator
[   24.424202] usbcore: registered new device driver onboard-usb-hub
[   24.424376] usb 1-1.1: USB disconnect, device number 3
[   24.424385] usb 1-1.1.1: USB disconnect, device number 6
[   24.564921] usb 1-1.1.2: USB disconnect, device number 5
[   24.624696] usb 1-1.3: USB disconnect, device number 4
[   25.523236] usb 1-1.1: new high-speed USB device number 7 using dwc2
[   26.143248] usb 1-1.3: new low-speed USB device number 8 using dwc2
[   26.305673] input: HID 046a:0011 as 
/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0003/input/input2
[   26.374840] hid-generic 0003:046A:0011.0003: input: USB HID v1.11 
Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
[   26.383241] usb 1-1.1.2: new low-speed USB device number 9 using dwc2
[   26.521526] input: PixArt Microsoft USB Optical Mouse as 
/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0004/input/input3
[   26.522241] hid-generic 0003:045E:00CB.0004: input: USB HID v1.11 
Mouse [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
[   26.833251] usb 1-1.1.1: new high-speed USB device number 10 using dwc2

As you can see the input devices are deregistered after probing of 
onboard-usb-hub and then registered again. The re-registering doesn't 
happen in the error case (as in my first email). Also in error case i 
noticed an unusual high load on the Rpi board, which doesn't occur in 
good case. Is it possible that both onboard-usb-hub instances are in 
some kind of deadlock?

>
> I'll try to send out a v2 of the fix before disappearing over the holidays
> after tomorrow.
