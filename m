Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235A228FC
	for <regressions@lists.linux.dev>; Wed, 21 Dec 2022 18:00:47 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.22]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MWixU-1pNQWo3Eca-00X5Si; Wed, 21 Dec 2022 19:00:42 +0100
Message-ID: <4a170314-6082-f3ba-cfb4-c19d7eb576c0@i2se.com>
Date: Wed, 21 Dec 2022 19:00:41 +0100
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
 <Y6I8L45rDhqBMfUZ@google.com> <dde8b5e1-fbce-dd6c-6047-09e03ff2c00d@i2se.com>
 <Y6M5SPBpp/xMzUz7@google.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <Y6M5SPBpp/xMzUz7@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8Nl0fu1XpP1qaKzIcJNB4iqNTZBdyVTIf96QqMa4K7+kq95nuHG
 PJkvwbrf1JCX/des3KBC4LU97I7b5ScsiYil14YdCD1ztaTiJR3XOjDCpJ959icFYHBCRf5
 s6gV4CElwEphnvR3ZNYXx1tFZSIiiBtNCk2tyzWO0ye/q6fkYWmEjzHJ2vhac0O34H5/zqj
 rr+h3D914TVQPT00D9BMQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A3pw0p8sNXM=;ynD0m/ZzqPGFcJEqInT/AiC6HD/
 dsH1ssMLs6br3y7ekPHlPcVBlOVjoD/DdpHIUMIcToU8mllJgGnKwPNgSzm3L1fBbCjLvpzKf
 NtefPXvJAxjvLFFw1FFwAEEOWBZJ4MuH5rgL5/B8ZFvQiBRi5ZnGzwQGB/2icVAbVdGeLv8rh
 lZ6LCKMPBip/4DeA57gSud5FKpJRmwLn+ZGHOch7848zqqQu4KXUUz9gmkD30TzRHRfQ1Pi2Q
 AVQHr0b0WAhHJOB54rL7roixt2ukuLiRJ+2jKEDtlbvCotCXdgzalSOu4btdi/BjayAlQjoe3
 TGgMyjMD8aVkx2c/BPGJq1g0rk6HOdaVoaJb+Yu5D7Jlrs9bBKJARICDC/ky+Vk1DI9yp5Dvv
 vWYnqkoLRWh/Wb0fV37NFK9UUOAII4wJSxGqBIwEnIDlNt/DIXwFIuT6cIKLWQFECynRiN3ob
 XMkWeFvwPbJT5moAnI91NuPoKp/7xq3HTIZyJI8M4Od4tkZb4K4FGYP6pK3T4I1zFiErTXZM2
 WvVkpxmgEan6arITjmBp8Dhb3xfsLktUqk/3aFp7BxCnUIb7iqyKoqz617JvkCdrlb6R7UGgF
 iHjU1FT9qeKIVK7Y85orqiPyduuFcJ0kN0HwCgevEC1RewIgrFyjfgQfmlWQcMgtyFHBFIC4L
 qlTFl3s8vfkE9wt3iauCc89vxJkhH/KxtHe/8XNtMg==

Hi Matthias,

Am 21.12.22 um 17:50 schrieb Matthias Kaehlcke:
> On Wed, Dec 21, 2022 at 01:29:25PM +0100, Stefan Wahren wrote:
>> Hi Matthias,
>>
>> Am 20.12.22 um 23:50 schrieb Matthias Kaehlcke:
>>> Today I learned that regulator_get() doesn't return an error when the regulator
>>> isn't specified, but the 'dummy regulator'. With that the platform driver is
>>> instantiated, which is not intended. The proper fix is probably to skip the
>>> creation of the 'raw' platform device in onboard_hub_create_pdevs() when the
>>> 'vdd-supply' does not exist.
>> Yes, i can confirm this by debugfs:
>>
>>   regulator                      use open bypass  opmode voltage current
>> min     max
>> ---------------------------------------------------------------------------------------
>>   regulator-dummy                  8    7      0 unknown 0mV     0mA
>> 0mV     0mV
>>      serial0-0-vddio 1                                 0mA     0mV     0mV
>>      serial0-0-vbat 1                                 0mA     0mV     0mV
>>      3f980000.usb:usb-port@1:usb-port@1-vdd 1
>> 0mA     0mV     0mV
>>      3f980000.usb:usb-port@1-vdd 1                                 0mA
>> 0mV     0mV
>>      3f980000.usb-vusb_a 1                                 0mA     0mV
>> 0mV
>>      3f980000.usb-vusb_d 1                                 0mA     0mV
>> 0mV
>>      phy-vcc 1                                 0mA     0mV     0mV
>>
>>> I tried to repro the Rpi 3 case by adjusting sc7280-herobrine.dtsi to look
>>> somewhat similar to the Rpi 3 hub config, but so far I wasn't 'successful'
>>> with breaking USB by deleting 'vdd-supply' (and 'peer-hub'). So I don't fully
>>> understand your scenario, but I'm relatively confident that not creating the
>>> platform devices should fix it.
>> I just played a little bit with arch/arm/boot/dts/bcm283x-rpi-lan7515.dtsi
>> and removed only the second hub node (including ethernet chip). After this
>> the issue also doesn't occur without any modification to onboard-usb-hub. So
>> it seems to me that the real issue is caused by the cascade of 2x Microchip
>> USB2514B USB 2.0 hubs.
> Thanks for your debugging efforts.
>
> I did some limited testing with nested hubs during development of the
> driver, using an external hub as alleged 2nd level onboard hub. I went
> back to such a configuration, unfortunately I still can't repro what
> you are seeing :(
>
>> Here are the relevant kernel log entries:
>>
>> [    4.025150] dwc2 3f980000.usb: supply vusb_d not found, using dummy
>> regulator
>> [    4.038776] dwc2 3f980000.usb: supply vusb_a not found, using dummy
>> regulator
>> [    4.104207] dwc2 3f980000.usb: DWC OTG Controller
>> [    4.115852] dwc2 3f980000.usb: new USB bus registered, assigned bus
>> number 1
>> [    4.129921] dwc2 3f980000.usb: irq 66, io mem 0x3f980000
>> [    4.513217] usb 1-1: new high-speed USB device number 2 using dwc2
>> [    5.123296] usb 1-1.1: new high-speed USB device number 3 using dwc2
>> [    5.623217] usb 1-1.3: new low-speed USB device number 4 using dwc2
>> [    5.785049] input: HID 046a:0011 as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0001/input/input0
>> [    5.863240] usb 1-1.1.2: new low-speed USB device number 5 using dwc2
>> [    5.868998] hid-generic 0003:046A:0011.0001: input: USB HID v1.11
>> Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
>> [    6.031327] input: PixArt Microsoft USB Optical Mouse as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0002/input/input1
>> [    6.031490] hid-generic 0003:045E:00CB.0002: input: USB HID v1.11 Mouse
>> [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
>> [    6.333278] usb 1-1.1.1: new high-speed USB device number 6 using dwc2
>> [   24.165633] usbcore: registered new interface driver lan78xx
>> [   24.423801] onboard-usb-hub 3f980000.usb:usb-port@1: supply vdd not
>> found, using dummy regulator
>> [   24.424202] usbcore: registered new device driver onboard-usb-hub
>> [   24.424376] usb 1-1.1: USB disconnect, device number 3
>> [   24.424385] usb 1-1.1.1: USB disconnect, device number 6
>> [   24.564921] usb 1-1.1.2: USB disconnect, device number 5
>> [   24.624696] usb 1-1.3: USB disconnect, device number 4
>> [   25.523236] usb 1-1.1: new high-speed USB device number 7 using dwc2
>> [   26.143248] usb 1-1.3: new low-speed USB device number 8 using dwc2
>> [   26.305673] input: HID 046a:0011 as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0003/input/input2
>> [   26.374840] hid-generic 0003:046A:0011.0003: input: USB HID v1.11
>> Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
>> [   26.383241] usb 1-1.1.2: new low-speed USB device number 9 using dwc2
>> [   26.521526] input: PixArt Microsoft USB Optical Mouse as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0004/input/input3
>> [   26.522241] hid-generic 0003:045E:00CB.0004: input: USB HID v1.11 Mouse
>> [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
>> [   26.833251] usb 1-1.1.1: new high-speed USB device number 10 using dwc2
>>
>> As you can see the input devices are deregistered after probing of
>> onboard-usb-hub and then registered again.
> It looks like the onboard_usb_hub driver is built as a module, which
> is the cause of the de- and re-registration. On a system that actually
> intends to use the onboard_hub driver I would recommand to make it a
> builtin driver to avoid this, but a module driver should still work.
Yes, most of the USB stuff is builtin, but onboard-usb-hub is build as 
module.
> I changed my kernel config to use a onboard_hub module, but that didn't
> help either with reproducing the issue.
>
> Which kernel version are you running on the Rpi 3?

I started with v6.1, then went to v6.0 and then

43993626de00 ("usb: misc: onboard-hub: add support for Microchip 
USB2514B USB 2.0 hub"). All of them showed the issue. The configuration 
based on arm/multi_v7_defconfig. In the last case i need to enable 
ONBOARD_USB_HUB in the configuration.

Based on my observations in v6.1 it wasn't always reproducible (50/50 
chance).

Btw the initial subject wasn't precise only Rpi 3 B Plus is affected.

>
>> The re-registering doesn't happen in the error case (as in my first email).
> Could you add logs to onboard_hub_usbdev_probe() to see whether it is called
> at all and how far it gets? Confirming whether onboard_hub_probe() completes
> successfully might also help.

Sure:

[    7.963910] usbcore: registered new interface driver lan78xx
[    8.231548] onboard-usb-hub 3f980000.usb:usb-port@1: 
onboard_hub_probe called
[    8.231590] onboard-usb-hub 3f980000.usb:usb-port@1: supply vdd not 
found, using dummy regulator
[    8.231763] onboard-usb-hub 3f980000.usb:usb-port@1: 
onboard_hub_probe success
[    8.231867] onboard-usb-hub 3f980000.usb:usb-port@1:usb-port@1: 
onboard_hub_probe called
[    8.231880] onboard-usb-hub 3f980000.usb:usb-port@1:usb-port@1: 
supply vdd not found, using dummy regulator
[    8.231971] onboard-usb-hub 3f980000.usb:usb-port@1:usb-port@1: 
onboard_hub_probe success
[    8.232090] usbcore: registered new device driver onboard-usb-hub
[    8.232256] usb 1-1.1: USB disconnect, device number 3
[    8.232264] usb 1-1.1.1: USB disconnect, device number 6
[    8.380602] usb 1-1.1.2: USB disconnect, device number 5
[    8.447421] usb 1-1.3: USB disconnect, device number 4

So onboard_hub_probe() is called successfully, but 
onboard_hub_usbdev_probe() doesn't seems to be.

>
>> Also in error case i noticed an unusual high load on the Rpi board, which
>> doesn't occur in good case. Is it possible that both onboard-usb-hub
>> instances are in some kind of deadlock?
> Possibly. The driver itself uses a mutex for locking, which shouldn't result
> in a high load in case of a deadlock, in any case the high load you are
> observing seems to be related with the issue if it is only seen in the error
> case.
I will try to play with lock debugging.
>
> Do things work properly when of_is_onboard_usb_hub() returns always false?
> That would be similar to the fix I have in mind for configs that shouldn't
> use the onboard_hub driver.
[   24.781914] usbcore: registered new device driver onboard-usb-hub
[   24.782097] usb 1-1.1: USB disconnect, device number 3
[   24.782110] usb 1-1.1.1: USB disconnect, device number 6
[   24.916725] usb 1-1.1.2: USB disconnect, device number 5
[   25.011118] usb 1-1.3: USB disconnect, device number 4
[   25.648211] onboard-usb-hub 1-1: onboard_hub_usbdev_probe called
[   25.648259] onboard-usb-hub 1-1: failed to find device node for peer hub
[   25.648264] onboard-usb-hub: probe of 1-1 failed with error -22
[   25.965643] usb 1-1.1: new high-speed USB device number 7 using dwc2
[   26.107578] onboard-usb-hub 1-1.1: onboard_hub_usbdev_probe called
[   26.107636] onboard-usb-hub 1-1.1: failed to find device node for 
peer hub
[   26.107642] onboard-usb-hub: probe of 1-1.1 failed with error -22
[   26.415691] usb 1-1.3: new low-speed USB device number 8 using dwc2
[   26.567393] input: HID 046a:0011 as 
/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0003/input/input2
[   26.637183] hid-generic 0003:046A:0011.0003: input: USB HID v1.11 
Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
[   26.645694] usb 1-1.1.2: new low-speed USB device number 9 using dwc2
[   26.793634] input: PixArt Microsoft USB Optical Mouse as 
/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0004/input/input3
[   26.793859] hid-generic 0003:045E:00CB.0004: input: USB HID v1.11 
Mouse [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
[   27.135695] usb 1-1.1.1: new high-speed USB device number 10 using dwc2
