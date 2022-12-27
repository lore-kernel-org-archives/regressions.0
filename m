Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735DA1392
	for <regressions@lists.linux.dev>; Tue, 27 Dec 2022 13:15:46 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MPXpS-1pVYGZ1rV4-00MZ1Z; Tue, 27 Dec 2022 14:15:29 +0100
Message-ID: <0b7fadf3-7409-acc0-e722-e6bdfa4bf6c9@i2se.com>
Date: Tue, 27 Dec 2022 14:15:28 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Regression: onboard-usb-hub breaks USB on RPi 3
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Matthias Kaehlcke <mka@chromium.org>,
 Doug Anderson <dianders@chromium.org>, Icenowy Zheng <uwu@icenowy.me>,
 Johan Hovold <johan@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>
References: <d04bcc45-3471-4417-b30b-5cf9880d785d@i2se.com>
 <Y6Ci7wWvbBRRQkR6@google.com> <97c9b305-86f4-5918-54bf-4057e99eae3d@i2se.com>
 <Y6ECMZeh7G9bH8Fi@google.com> <db6f59bf-33a1-776e-b52c-4818ff9114e3@i2se.com>
 <Y6I8L45rDhqBMfUZ@google.com> <dde8b5e1-fbce-dd6c-6047-09e03ff2c00d@i2se.com>
 <Y6M5SPBpp/xMzUz7@google.com> <4a170314-6082-f3ba-cfb4-c19d7eb576c0@i2se.com>
 <Y6NYK4/jp/QmusOX@google.com> <8503cdb5-6089-b9e4-25ff-f3ac294b7a79@i2se.com>
Content-Language: en-US
In-Reply-To: <8503cdb5-6089-b9e4-25ff-f3ac294b7a79@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hM3x2b0bXO1vS4Iq8j6MEuV++26dyy9Oh6gRmo0TPOTqDoVmWjQ
 7oI+nT6R0b47AaAAkJI6sxVjpKqjQvBQC7N8HCzTyYjpdkPUzcFsbY9J/yh40Sbu6gQuYmr
 7oUTyDspPFlRzqGBOp/Em/YyiMA7c4mz9go4Lym4gmYjlkL7T2b8W7m8TfL7zSeb/Y/XQ+J
 7GuxCjZNj2YRIzwfy+KnQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zPvkTrhQOkU=;jClq5aR2JWaVWJVqdzPO288OB8B
 +RGivz0aFGNQxJpBUrW1VSGGOQ9lcVE0ZbkPGDgW4/W3SghDzUjyUIlHD2VyLQJLQpXnikLlY
 K0FPwJJBcqI2Vatf+OFA53iEmjnE9wZJi1pvhtgnHE1ujvUDc3CnAVAl1PNPQxnWWCwyrKsNP
 EOydRCDl/n5Ed6TuRBbl/0KmmTiqJaaoea/96v83ACBjbAJ9H8AWjqogHOQnLRYMAS6v1Rjcn
 gzNcoVrrMJNemPlF992bIRBD3wSDCiizLn/KLCU6bs+epdQHBzo8urxCVrWFZDcz1Vq6f7IeD
 GOiStdSuk9viChkMwXw2g2/16gcu7aUaC1qtrBmO7nI48wGEU6Fi8EByG1OA6iGgeuFq4DY/U
 vMRwJ6JHiMlTsr9N58x/MgZgGEs1HZqWG25RCMX6+9K4i/eSexmbahRfhdWBMsKIo2ld9tBcb
 HeaWy3U1NZXivTgn2u6/Cd0T097KwhaHAqX0yF2TaWLG0VLQHuuX6OfWC00pYVM2/hY5vlTQ4
 7Dz8u8WrZRXrijT9nZxpwNYjC3dO8iZzPKEYRc3vGHzGb/iVIzgqet2Y/V+IUZOftTuz07mFO
 S+L2D45TplU0r2jYXfOa6TkTdV0x0x3fuJJxhrk4rg77lUfkPGLrGomFx1DSLyzTR9FAwa/6x
 EBQbP5sQPJV9qUAI/eSPtLs+vJ9HQvYlDI5UP7Uspg==

Hi,

[add Doug, Icenowy and Johan]

Am 21.12.22 um 22:31 schrieb Stefan Wahren:
> Hi Matthias,
>
> Am 21.12.22 um 20:02 schrieb Matthias Kaehlcke:
>> Hi Stefan,
>>
>> On Wed, Dec 21, 2022 at 07:00:41PM +0100, Stefan Wahren wrote:
>>> I will try to play with lock debugging.
>> Thanks, hopefully that can provide some hint.
>>
> DETECT_HUNG_TASK reveals this in error case:
>
> [  243.676253] INFO: task kworker/2:1:44 blocked for more than 122 
> seconds.
> [  243.676284]       Not tainted 6.1.0-00007-g22fada783b9f #32
> [  243.676294] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
> disables this message.
> [  243.676303] task:kworker/2:1     state:D stack:0     pid:44 
> ppid:2      flags:0x00000000
> [  243.676329] Workqueue: events onboard_hub_attach_usb_driver 
> [onboard_usb_hub]
> [  243.676388]  __schedule from schedule+0x58/0xf8
> [  243.676419]  schedule from schedule_preempt_disabled+0x1c/0x2c
> [  243.676445]  schedule_preempt_disabled from 
> __mutex_lock.constprop.0+0x29c/0x948
> [  243.676474]  __mutex_lock.constprop.0 from __driver_attach+0x74/0x188
> [  243.676503]  __driver_attach from bus_for_each_dev+0x70/0xb0
> [  243.676532]  bus_for_each_dev from 
> onboard_hub_attach_usb_driver+0xc/0x28 [onboard_usb_hub]
> [  243.676587]  onboard_hub_attach_usb_driver [onboard_usb_hub] from 
> process_one_work+0x1f8/0x520
> [  243.676637]  process_one_work from worker_thread+0x40/0x55c
> [  243.676663]  worker_thread from kthread+0xf0/0x110
> [  243.676685]  kthread from ret_from_fork+0x14/0x2c
> [  243.676705] Exception stack(0xf091dfb0 to 0xf091dff8)
> [  243.676720] dfa0:                                     00000000 
> 00000000 00000000 00000000
> [  243.676737] dfc0: 00000000 00000000 00000000 00000000 00000000 
> 00000000 00000000 00000000
> [  243.676752] dfe0: 00000000 00000000 00000000 00000000 00000013 
> 00000000
> [  243.676788] INFO: task systemd-udevd:148 blocked for more than 122 
> seconds.
> [  243.676800]       Not tainted 6.1.0-00007-g22fada783b9f #32
> [  243.676809] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
> disables this message.
> [  243.676817] task:systemd-udevd   state:D stack:0     pid:148 
> ppid:144    flags:0x00000081
> [  243.676839]  __schedule from schedule+0x58/0xf8
> [  243.676864]  schedule from schedule_timeout+0xb4/0x15c
> [  243.676893]  schedule_timeout from __wait_for_common+0xc4/0x228
> [  243.676922]  __wait_for_common from __flush_work+0x1a8/0x360
> [  243.676949]  __flush_work from __cancel_work_timer+0x10c/0x1e4
> [  243.676975]  __cancel_work_timer from onboard_hub_remove+0x28/0xbc 
> [onboard_usb_hub]
> [  243.677021]  onboard_hub_remove [onboard_usb_hub] from 
> platform_remove+0x20/0x4c
> [  243.677067]  platform_remove from 
> device_release_driver_internal+0x194/0x21c
> [  243.677092]  device_release_driver_internal from 
> bus_remove_device+0xcc/0xf8
> [  243.677124]  bus_remove_device from device_del+0x16c/0x468
> [  243.677159]  device_del from platform_device_del.part.0+0x10/0x74
> [  243.677187]  platform_device_del.part.0 from 
> platform_device_unregister+0x18/0x24
> [  243.677216]  platform_device_unregister from 
> of_platform_device_destroy+0x98/0xa8
> [  243.677249]  of_platform_device_destroy from 
> onboard_hub_destroy_pdevs+0x48/0x6c
> [  243.677287]  onboard_hub_destroy_pdevs from hub_disconnect+0x104/0x174
> [  243.677321]  hub_disconnect from usb_unbind_interface+0x78/0x26c
> [  243.677356]  usb_unbind_interface from 
> device_release_driver_internal+0x194/0x21c
> [  243.677388]  device_release_driver_internal from 
> bus_remove_device+0xcc/0xf8
> [  243.677419]  bus_remove_device from device_del+0x16c/0x468
> [  243.677452]  device_del from usb_disable_device+0xcc/0x178
> [  243.677486]  usb_disable_device from usb_set_configuration+0x4ec/0x8d0
> [  243.677523]  usb_set_configuration from usb_unbind_device+0x24/0x7c
> [  243.677560]  usb_unbind_device from 
> device_release_driver_internal+0x194/0x21c
> [  243.677590]  device_release_driver_internal from 
> device_reprobe+0x18/0x90
> [  243.677620]  device_reprobe from __usb_bus_reprobe_drivers+0x40/0x6c
> [  243.677648]  __usb_bus_reprobe_drivers from bus_for_each_dev+0x70/0xb0
> [  243.677676]  bus_for_each_dev from 
> usb_register_device_driver+0x9c/0xd0
> [  243.677713]  usb_register_device_driver from 
> onboard_hub_init+0x30/0x1000 [onboard_usb_hub]
> [  243.677765]  onboard_hub_init [onboard_usb_hub] from 
> do_one_initcall+0x40/0x204
> [  243.677811]  do_one_initcall from do_init_module+0x44/0x1d4
> [  243.677840]  do_init_module from sys_finit_module+0xbc/0xf8
> [  243.677865]  sys_finit_module from __sys_trace_return+0x0/0x10
> [  243.677887] Exception stack(0xf4659fa8 to 0xf4659ff0)
> [  243.677904] 9fa0:                   bf369800 0051dba8 00000006 
> b6e438e0 00000000 b6e443f4
> [  243.677921] 9fc0: bf369800 0051dba8 00000000 0000017b 00531658 
> 0051a1dc 00526398 00000000
> [  243.677935] 9fe0: befbb160 befbb150 b6e3a9d8 b6f2aae0
>
since Matthias patch [1] has been rejected any ideas to this issue would 
be helpful.

Best regards

[1] - 
https://lore.kernel.org/lkml/9f42f88f-26bc-1e82-03a0-659c85c40469@i2se.com/T/

