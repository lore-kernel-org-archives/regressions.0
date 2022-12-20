Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3726B4C75
	for <regressions@lists.linux.dev>; Tue, 20 Dec 2022 16:19:40 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.22]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M2w0K-1pAyj51sgG-003MZU; Tue, 20 Dec 2022 17:19:35 +0100
Message-ID: <db6f59bf-33a1-776e-b52c-4818ff9114e3@i2se.com>
Date: Tue, 20 Dec 2022 17:19:34 +0100
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
 <Y6ECMZeh7G9bH8Fi@google.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <Y6ECMZeh7G9bH8Fi@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rppBP7ELZeC/w1L9EmkgsbH5XfXYSiTeMWLQD9ZCSxlBWUYEuBE
 XAflW9rnSQPasoN/3+nnAk0hyvYOw3hNvC+6z9qvY6KiWhpR8/F1W/McIE247VIf2cicq21
 3FFWGzg45IonhPqa+nUq0zO1glALyosKjpjOcYGAvdOvju/cPRvJHoHkJ4ZCIsNZL3VgUmh
 BRmxkFfMtVEOt9pv88hbw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1iAib5eTT0s=;x0hQWWyMfPNJK4kh4PDTtegdJDK
 Z/H2L1xryUTg3rdYlT3rXIL7c0o+ozLYi8ITEok2BvF2wz5m8CfUUh5VLOQo9xbx1+XH6ie4q
 oddJ/K3pQ2+zKmV6RZ+1StXoL2IEoFal9S9j9E0HvWnzCPpRFTcpxUL6c2lDiNuASAdPr5T8M
 tcVqUYrgpDhUL0Mg708+O/O6t+X3sEGxQDjnBPE/CGNia4CyeE572p31uR7vdhGGiFKy4kyLd
 z8d+6ykJtUxwWTE1fXvQt3weW1eKa/WhWpAUPWgz6lev6hFioOu7VJ4lPSX5BszJ8UjpZ1Dd9
 BQip7V71/Cu1worhHzkPiyL8QeOZd2tsfv3W8ahJagF1wyAH8dz04AwEAEeibYcllXb2Eb4kp
 43crMg6cZkyXkoTSD4OEFcu0r/uiTovo+47Ow963y/Ghpmco/rBw6eScwz89vp0VaN0DcDYut
 geKE7FsMMZ+/ybvogQlvpKuIv5BaaIDdaJ4kruGJ9G2m+W/RnlZYQKwY7P8wqqebB5mjnL5vL
 d7ph6qDsvSyhm/f9XfWgXpk3XJuTkwTurb1jwD73wIR9G4obG5+ngkftS6GjpZ9Ocke0pdQVO
 ojrCqesq85ClTSJwkgk7A9l6ZVoGv88X6vfj2UDwcBm5LXg/in5TwD2J1GclZxG67vqtgtfXt
 feoT3goAXdvt9A7SPMCa1j4dhY1kDjqqUY3sYP8slg==

Hi Matthias,

Am 20.12.22 um 01:30 schrieb Matthias Kaehlcke:
> On Mon, Dec 19, 2022 at 11:32:58PM +0100, Stefan Wahren wrote:
>> Hi Matthias,
>>
>> Am 19.12.22 um 18:44 schrieb Matthias Kaehlcke:
>>> Hi Stefan,
>>>
>>> Sorry for the regression.
>>>
>>> What seems to happen is this:
>>>
>>> arch/arm/boot/dts/bcm283x-rpi-lan7515.dtsi specifies device nodes for the
>>> two (nested) USB hubs (which is done rarely since USB devices (including
>>> hubs) are autodetected). The DT nodes were most likely only added to be
>>> able to configure the LED modes of the USB to Ethernet adapter. With
>>> 43993626de00 ("usb: misc: onboard-hub: add support for Microchip USB2514B
>>> USB 2.0 hub") the onboard_usb_hub driver gained support for the hubs on
>>> the RPi3. The onboard_usb_hub driver expects a regulator ("vdd") in the DT
>>> node of the USB hub, which isn't present for the RPi3 (this isn't an error
>>> per se). Without the regulator the onboard_hub platform driver fails to
>>> probe, when the USB driver of the hub is probed (onboard_hub_usbdev_probe())
>>> it doesn't find the corresponding platform driver instance
>>> (_find_onboard_hub()) and defers probing. When the deferred probe runs it
>>> encounters the same situation, rinse and repeat.
>> I forgot to mention that in error case /sys/kernel/debug/devices_deferred
>> was empty.
>>> One possible fix would be to specify the 'missing' "vdd" property, however
>>> that wouln't fix the issue for other boards with a similar configurations.
>>> Instead the driver could check if "vdd" exists in the DT node of the hub,
>>> and not defer probing if it doesn't.
>>>
>>> Could you please try if the below patch fixes the issue on the Rpi 3?
>> Yes, this prevents probing of onboard-usb-hub and the issue.
> Thanks for the confirmation, I'll send out a proper patch to get this fixed
> upstream.

sorry, i accidentally disabled this driver during testing of the patch. 
So i erroneously assumed the patch is working, but it's not. I seems 
that the change is never reached (add dev_info around your change).

The following worked on my Raspberry Pi 3 B+

diff --git a/drivers/usb/misc/onboard_usb_hub.c 
b/drivers/usb/misc/onboard_usb_hub.c
index de3627af3c84..570e9f3d2d89 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -227,6 +227,9 @@ static int onboard_hub_probe(struct platform_device 
*pdev)
      if (!hub)
          return -ENOMEM;

+    if (!of_get_property(dev->of_node, "vdd", NULL))
+        return -ENODEV;
+
      hub->vdd = devm_regulator_get(dev, "vdd");
      if (IS_ERR(hub->vdd))
          return PTR_ERR(hub->vdd);
@@ -340,6 +343,15 @@ static struct onboard_hub *_find_onboard_hub(struct 
device *dev)
      hub = dev_get_drvdata(&pdev->dev);
      put_device(&pdev->dev);

+    /*
+     * Some boards have device tree nodes for USB hubs supported by this
+     * driver, but the nodes don't have all properties needed for the 
driver
+     * to work properly. Use the absence of the "vdd" regulator as an
+     * indicator of such nodes.
+     */
+    if (!of_get_property(pdev->dev.of_node, "vdd", NULL))
+        return ERR_PTR(-ENODEV);
+
      /*
       * The presence of drvdata ('hub') indicates that the platform driver
       * finished probing. This handles the case where (conceivably) we 
couldThe following changes worked for me:


