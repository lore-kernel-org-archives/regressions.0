Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4980F10EC
	for <regressions@lists.linux.dev>; Mon, 19 Dec 2022 22:33:05 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.22]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MVMqF-1pI0tg3YSl-00SP5r; Mon, 19 Dec 2022 23:32:59 +0100
Message-ID: <97c9b305-86f4-5918-54bf-4057e99eae3d@i2se.com>
Date: Mon, 19 Dec 2022 23:32:58 +0100
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
 <Y6Ci7wWvbBRRQkR6@google.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <Y6Ci7wWvbBRRQkR6@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:As6opfvjPyZztiky7u1/Mu28Houw39bLetoI6yIpRhk1NOOISiW
 72Myy6q6MBgLsEM3q+fv2Aw2zUxcAen8mxsq0bmPmlv5D0z4mZSjyetoywsScoBpH7vgUpd
 Q1gk7Etn0HjcuFxjbbkJ3IjHFRmNZO1vk6GATp25f5UvSgxkv7qqEleFqixLPYnWhnDPoM6
 MVXOhnfHdbrt2QgQjLmRw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ayxt22qc8V8=;KCowfcAFluJbCRPZDPEmfst6/zB
 HVH2yRg+zMWIAwbazD+oNzFRnp2R3paLW7xwJfJ5ZyqZiMF1LQ8eceQ/Sp9g5w9LxfQzHaR+t
 KdUMgUhHxaWo8w4ryYL9kk6Uo9WcXPHHmxqgvwYuKRJxulEw1uFaTcUST/Zon8HFKBd/qus5X
 x/gRi/O/an09P7g89ZlrAK9zcOMg8IbsVZfiNLUXHf+kiWppvgTxv5LpA2Pe7zTVm56ShOOpz
 H6zhtynQBvKjLxz1jLEeTVP7k+pQMLOyAZmloVG7KoJTN0o6oHjTx8fmFIY0MZDUGmiPWTABJ
 6TXWyKomv4pErmGWk4g38IVVBk5xwwi8+7h0BdIyJFk91ndHr4waR8eTCqUK1HrWujeMONDJw
 uFnSVXqTKVgBc7q5KzD0E+tX+oLB0jQXmc3YoTdNvQf+UoBgLFwK9DE2kjjO47y3vWkNew34v
 a3oqs0z3NW72LBp3OYi/UaNz+R5LTYs+hiQP4RsJjj4tyVT4QE5GLh8s+PMbN2pHhHK1/dy6c
 wotQHclWN0+38gfC9+BS2wBkF5YKrG+rmljdtRsjh8A0fPukxGM0Dq5n/uuKqAPW2u3HkayLA
 I45Xrrb9FLiRqPi/l0gkfGS+12/TYHlxGc/2/+QKx00Nwkm3+QrcLLL+vGIW/GGN/ytJN0EXI
 QtFZAkEbEKl6FlrgLIpT327j8TUMPmuIQE7vXnOe+w==

Hi Matthias,

Am 19.12.22 um 18:44 schrieb Matthias Kaehlcke:
> Hi Stefan,
>
> Sorry for the regression.
>
> What seems to happen is this:
>
> arch/arm/boot/dts/bcm283x-rpi-lan7515.dtsi specifies device nodes for the
> two (nested) USB hubs (which is done rarely since USB devices (including
> hubs) are autodetected). The DT nodes were most likely only added to be
> able to configure the LED modes of the USB to Ethernet adapter. With
> 43993626de00 ("usb: misc: onboard-hub: add support for Microchip USB2514B
> USB 2.0 hub") the onboard_usb_hub driver gained support for the hubs on
> the RPi3. The onboard_usb_hub driver expects a regulator ("vdd") in the DT
> node of the USB hub, which isn't present for the RPi3 (this isn't an error
> per se). Without the regulator the onboard_hub platform driver fails to
> probe, when the USB driver of the hub is probed (onboard_hub_usbdev_probe())
> it doesn't find the corresponding platform driver instance
> (_find_onboard_hub()) and defers probing. When the deferred probe runs it
> encounters the same situation, rinse and repeat.
I forgot to mention that in error case 
/sys/kernel/debug/devices_deferred was empty.
> One possible fix would be to specify the 'missing' "vdd" property, however
> that wouln't fix the issue for other boards with a similar configurations.
> Instead the driver could check if "vdd" exists in the DT node of the hub,
> and not defer probing if it doesn't.
>
> Could you please try if the below patch fixes the issue on the Rpi 3?
Yes, this prevents probing of onboard-usb-hub and the issue. Thanks
>
> Thanks
>
> m.
>
>
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index d63c63942af1..4d2a27afb09c 100644
> --- a/drivers/usb/misc/onboard_usb_hub.c
> +++ b/drivers/usb/misc/onboard_usb_hub.c
> @@ -363,6 +363,15 @@ static struct onboard_hub *_find_onboard_hub(struct device *dev)
>   	hub = dev_get_drvdata(&pdev->dev);
>   	put_device(&pdev->dev);
>   
> +	/*
> +	 * Some boards have device tree nodes for USB hubs supported by this
> +	 * driver, but the nodes don't have all properties needed for the driver
> +	 * to work properly. Use the absence of the "vdd" regulator as an
> +	 * indicator of such nodes.
> +	 */
> +	if (!of_get_property(pdev->dev.of_node, "vdd", NULL))
> +		return ERR_PTR(-ENODEV);
> +
>   	/*
>   	 * The presence of drvdata ('hub') indicates that the platform driver
>   	 * finished probing. This handles the case where (conceivably) we could
>
>
>
> On Sun, Dec 18, 2022 at 02:35:43PM +0100, Stefan Wahren wrote:
>> Hi,
>>
>> unfortunately i didn't notice this regression sooner, but the following
>> commits breaks USB on Raspberry Pi 3:
>>
>> usb: misc: Add onboard_usb_hub driver
>> usb: misc: onboard-hub: add support for Microchip USB2514B USB 2.0 hub
>>
>> After these commits (and this new driver enabled like in multi_v7_defconfig)
>> the connected USB devices doesn't work anymore (mouse is powered, but no
>> function of keyboard and mouse). Reconnecting doesn't help. Running lsusb
>> hangs forever.
>>
>> Here is the relevant dmesg in error case:
>>
>> [    0.078446] usbcore: registered new interface driver usbfs
>> [    0.078516] usbcore: registered new interface driver hub
>> [    0.078574] usbcore: registered new device driver usb
>> [    0.078827] usb_phy_generic phy: supply vcc not found, using dummy
>> regulator
>> [    0.078990] usb_phy_generic phy: dummy supplies not allowed for exclusive
>> requests
>> [    2.897258] usbcore: registered new interface driver pegasus
>> [    2.903161] usbcore: registered new interface driver asix
>> [    2.908809] usbcore: registered new interface driver ax88179_178a
>> [    2.915185] usbcore: registered new interface driver cdc_ether
>> [    2.921281] usbcore: registered new interface driver smsc75xx
>> [    2.927305] usbcore: registered new interface driver smsc95xx
>> [    2.933298] usbcore: registered new interface driver net1080
>> [    2.939219] usbcore: registered new interface driver cdc_subset
>> [    2.945407] usbcore: registered new interface driver zaurus
>> [    2.951238] usbcore: registered new interface driver cdc_ncm
>> [    3.030909] usbcore: registered new interface driver usb-storage
>> [    3.178104] usbcore: registered new interface driver usbhid
>> [    3.191022] usbhid: USB HID core driver
>> [    3.981848] dwc2 3f980000.usb: supply vusb_d not found, using dummy
>> regulator
>> [    3.992467] dwc2 3f980000.usb: supply vusb_a not found, using dummy
>> regulator
>> [    4.053728] dwc2 3f980000.usb: DWC OTG Controller
>> [    4.065343] dwc2 3f980000.usb: new USB bus registered, assigned bus
>> number 1
>> [    4.079415] dwc2 3f980000.usb: irq 66, io mem 0x3f980000
>> [    4.463447] usb 1-1: new high-speed USB device number 2 using dwc2
>> [    5.063444] usb 1-1.1: new high-speed USB device number 3 using dwc2
>> [    5.523440] usb 1-1.3: new low-speed USB device number 4 using dwc2
>> [    5.685546] input: HID 046a:0011 as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:046A:0011.0001/input/input0
>> [    5.763446] usb 1-1.1.2: new low-speed USB device number 5 using dwc2
>> [    5.777968] hid-generic 0003:046A:0011.0001: input: USB HID v1.11
>> Keyboard [HID 046a:0011] on usb-3f980000.usb-1.3/input0
>> [    5.931991] input: PixArt Microsoft USB Optical Mouse as /devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1.2/1-1.1.2:1.0/0003:045E:00CB.0002/input/input1
>> [    5.954668] hid-generic 0003:045E:00CB.0002: input: USB HID v1.11 Mouse
>> [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.1.2/input0
>> [    6.263459] usb 1-1.1.1: new high-speed USB device number 6 using dwc2
>> [   14.828915] onboard-usb-hub 3f980000.usb:usb-port@1: supply vdd not
>> found, using dummy regulator
>> [   14.829493] onboard-usb-hub 3f980000.usb:usb-port@1:usb-port@1: supply
>> vdd not found, using dummy regulator
>> [   14.829729] usbcore: registered new device driver onboard-usb-hub
>> [   14.829945] usb 1-1.1: USB disconnect, device number 3
>> [   14.829958] usb 1-1.1.1: USB disconnect, device number 6
>> [   14.830419] usb 1-1.1.2: USB disconnect, device number 5
>> [   14.854725] usb 1-1.3: USB disconnect, device number 4
>> [   14.896865] usbcore: registered new interface driver lan78xx
>>
>> Unfortunately i'm not that USB expert, so please tell me if you need more
>> information.
>>
