Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB9164E
	for <regressions@lists.linux.dev>; Thu, 13 Apr 2023 05:45:42 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5aebdb.dynamic.kabel-deutschland.de [95.90.235.219])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6215E60027FE8;
	Thu, 13 Apr 2023 07:39:21 +0200 (CEST)
Message-ID: <dbbf4556-2719-5827-efbd-da9e87c0de40@molgen.mpg.de>
Date: Thu, 13 Apr 2023 07:39:20 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: btusb driver need to be unloaded and reloaded after boot & lag
 issue
To: help.7ocym@8shield.net
References: <168133719213.7.14774994518515251513.119182329@8shield.net>
Content-Language: en-US
Cc: linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 regressions@lists.linux.dev
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <168133719213.7.14774994518515251513.119182329@8shield.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[Cc: +regressions@lists.linux.dev]

Dear JLM,


Am 13.04.23 um 00:06 schrieb help.7ocym@8shield.net:

> sorry to address both list, but this issue seems related, without
> knowing where lies the issue > my hardware : https://wiki.gentoo.org/wiki/Lenovo_Yoga_900
> I use the pre-built gentoo linux kernel,
> 6.2.8-gentoo-dist #1 SMP PREEMPT_DYNAMIC Wed Mar 22 17:15:39 -00 2023 x86_64 Intel(R) Core(TM) i7-6500U CPU @ 2.50GHz GenuineIntel GNU/Linux
> 
> since a few update (sadly I didn't noted the latest kernel version
> that didn't had the issue), after a boot, the bluetooth isn't
> working, nothing bad in dmesg, I just have to unload btusb module and
> modprobe it again to have bluetooth working again...
> 
> after a suspend to ram, I have to power off-power on the bluetooth to
> have it work again (bluetoothctl power off; bluetoothctl power on)
> 
> bluetooth mouse can also be extremely laggy sometimes,but without
> error message in dmesg, most of the time `bluetoothctl power` off-on
> cycling do solve the issue....
> 
> I also included the usb mailing list because it might be related to
> some behavior I noticed :
> 
> I have usb3.0 micro sd card reader (SanDisk MobileMate UHS-I microSD
> Reader/Writer USB 3.0 Reader, Kingston MobileLite Plus (MLPM) microSD
> Card Reader USB 3.1 microSDHC/SDXC UHS-II, for example) and some
> extra fast micro sd cards (like sandisk extrem 512G), when
> transferring data the read rate can be as high as 110Mo/s and write
> 70Mo/s sustained, nothing impressive but when such rate is achieved
> for a long time (big file transfer) either reading only access,
> writing only access or read write, the usb bus become unusable, I
> can't even use a usb mouse connected to it by wire... even if cpu
> usage is really low (less than 10%) I don't have the issue if I
> connect a M2 usb3 flash drive, with comparable transfert speed... so
> not related to some bus over usage...
> 
> so I suspect that there is an issue with the usb driver, and that
> maybe the bluetooth issue can be related to the usb issue, since the
> bluetooth controller is on the usb bus on the laptop >
> the transfer issue of usb is much more older than the bluetooth
> issue, it's approximative, but : >   - the btusb boot issue is about 3 month old,
>   - the suspend/resume issue of bluetooth is more than a year old
>   - the usb transfer issue as more than a year...
> 
> I'll gladly provide any useful information, can also do patch tries...
As you use Gentoo and are able to build your own Linux kernel, the 
fastest way to get these issues addressed is to bisect them. To shorten 
the test cycles, I recommend to try, if you can reproduce the issues in 
QEMU and passing through the problematic devices to the VM [1][2].

I also recommend to start a separate thread for each issue and, as these 
seem to be regressions, also keep the regression folks in the loop [3].


Kind regards,

Paul


[1]: 
https://lore.kernel.org/all/5891f0d5-8d51-9da5-7663-718f301490b1@molgen.mpg.de/
      (The commands were working for after all, and the device didn’t 
show up due to a (second) Linux kernel regression.)
[2]: https://station.eciton.net/qemu-usb-host-device-pass-through.html
[3]: 
https://www.kernel.org/doc/html/latest/admin-guide/reporting-regressions.html
