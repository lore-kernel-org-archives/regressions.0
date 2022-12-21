Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3A33212
	for <regressions@lists.linux.dev>; Wed, 21 Dec 2022 21:36:38 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.22]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MlNgx-1oTEUV0Yk1-00lm3i; Wed, 21 Dec 2022 22:31:10 +0100
Message-ID: <8503cdb5-6089-b9e4-25ff-f3ac294b7a79@i2se.com>
Date: Wed, 21 Dec 2022 22:31:09 +0100
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
 <Y6M5SPBpp/xMzUz7@google.com> <4a170314-6082-f3ba-cfb4-c19d7eb576c0@i2se.com>
 <Y6NYK4/jp/QmusOX@google.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <Y6NYK4/jp/QmusOX@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZHVkYab0cjJnri/obCSg0cczunIM6z8ENxCDIrQZu/cdZ2zeme6
 rvEqoxra+cNV9ru2SrT7x3AC2NRhItdOAC+vNfvr9fZPcHsAYjubg8hVXRJPmKxPYBZFYvl
 u132m7IHMyYQ8QmxdIt0iJ1+ql7jLnMU1PPBYW7w+DXEipKluTNz9oG3F0XWc4aYh/HaozN
 JA7kOlmGBavUcCnzBF1qw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gAI28Pz3kUU=;Hys+v4qMNPMuRYTO4IlPavM81io
 Cf8I4827cV4+a4HPt92CdvzErqTgJY/wv18M/DcgdzEBMaDipPPrUDu1BbQIIjUn5AjvMVJyc
 7OIhuofbna7n8Do3jEmoBEl8/tFPRLC77GyScvt8QpZ92LDjr4JEwEGvUCmUU0DBjIs+t8F63
 xJ3EFQ/f0CsqZc7V15vZgcC0DrWfHoACVHV5nltS/vqnETUzyZ1yo2hBELvU2jQZ4Hr74lWsM
 1uh60vGtNC3oPAdUCfhnuou5W7HtgImUj1aPSVxw5QYKC9PzvHQ/Jof3vVE8rba52VmEz3kwU
 Z6wY52hrppvyIY7fKLELcJEvtYS9FgQL3r/C8DeME80OwIMcFbGKM589KmybW3LZz/omXMQtH
 20sW8O6ALrIjAZLAWeYbeXnfIe0ocImlvy0wC8WDVN71ctZONLy1lbtDjOgSOb3q/ErPtS1uv
 ThpPcLN7E8/sh9Erg8IuC90+PYQWgn/KSPDXZzhT5SorD7YiB8h/hxrk0oPAV3JjvSQfcUsCA
 L8tyeoYLCu0c2xXocbGWsl9GKQ/ObN3F0pJ0AUqeIuGqXjtXGdWmL0DnDEp4c0k2vmNBVylFc
 DHwjs1DtaGiVt4KRusUbSJYUdrLfSqfW4+GA3HkWxLdJsirIUAlE3KlatSFXVgzSEqVeAwUQw
 vqw840KakqKv0AzELFrfYWpLBLQ4StmMbKToL3HQuw==

Hi Matthias,

Am 21.12.22 um 20:02 schrieb Matthias Kaehlcke:
> Hi Stefan,
>
> On Wed, Dec 21, 2022 at 07:00:41PM +0100, Stefan Wahren wrote:
>> I will try to play with lock debugging.
> Thanks, hopefully that can provide some hint.
>
DETECT_HUNG_TASK reveals this in error case:

[  243.676253] INFO: task kworker/2:1:44 blocked for more than 122 seconds.
[  243.676284]       Not tainted 6.1.0-00007-g22fada783b9f #32
[  243.676294] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  243.676303] task:kworker/2:1     state:D stack:0     pid:44 
ppid:2      flags:0x00000000
[  243.676329] Workqueue: events onboard_hub_attach_usb_driver 
[onboard_usb_hub]
[  243.676388]  __schedule from schedule+0x58/0xf8
[  243.676419]  schedule from schedule_preempt_disabled+0x1c/0x2c
[  243.676445]  schedule_preempt_disabled from 
__mutex_lock.constprop.0+0x29c/0x948
[  243.676474]  __mutex_lock.constprop.0 from __driver_attach+0x74/0x188
[  243.676503]  __driver_attach from bus_for_each_dev+0x70/0xb0
[  243.676532]  bus_for_each_dev from 
onboard_hub_attach_usb_driver+0xc/0x28 [onboard_usb_hub]
[  243.676587]  onboard_hub_attach_usb_driver [onboard_usb_hub] from 
process_one_work+0x1f8/0x520
[  243.676637]  process_one_work from worker_thread+0x40/0x55c
[  243.676663]  worker_thread from kthread+0xf0/0x110
[  243.676685]  kthread from ret_from_fork+0x14/0x2c
[  243.676705] Exception stack(0xf091dfb0 to 0xf091dff8)
[  243.676720] dfa0:                                     00000000 
00000000 00000000 00000000
[  243.676737] dfc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[  243.676752] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[  243.676788] INFO: task systemd-udevd:148 blocked for more than 122 
seconds.
[  243.676800]       Not tainted 6.1.0-00007-g22fada783b9f #32
[  243.676809] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  243.676817] task:systemd-udevd   state:D stack:0     pid:148 
ppid:144    flags:0x00000081
[  243.676839]  __schedule from schedule+0x58/0xf8
[  243.676864]  schedule from schedule_timeout+0xb4/0x15c
[  243.676893]  schedule_timeout from __wait_for_common+0xc4/0x228
[  243.676922]  __wait_for_common from __flush_work+0x1a8/0x360
[  243.676949]  __flush_work from __cancel_work_timer+0x10c/0x1e4
[  243.676975]  __cancel_work_timer from onboard_hub_remove+0x28/0xbc 
[onboard_usb_hub]
[  243.677021]  onboard_hub_remove [onboard_usb_hub] from 
platform_remove+0x20/0x4c
[  243.677067]  platform_remove from 
device_release_driver_internal+0x194/0x21c
[  243.677092]  device_release_driver_internal from 
bus_remove_device+0xcc/0xf8
[  243.677124]  bus_remove_device from device_del+0x16c/0x468
[  243.677159]  device_del from platform_device_del.part.0+0x10/0x74
[  243.677187]  platform_device_del.part.0 from 
platform_device_unregister+0x18/0x24
[  243.677216]  platform_device_unregister from 
of_platform_device_destroy+0x98/0xa8
[  243.677249]  of_platform_device_destroy from 
onboard_hub_destroy_pdevs+0x48/0x6c
[  243.677287]  onboard_hub_destroy_pdevs from hub_disconnect+0x104/0x174
[  243.677321]  hub_disconnect from usb_unbind_interface+0x78/0x26c
[  243.677356]  usb_unbind_interface from 
device_release_driver_internal+0x194/0x21c
[  243.677388]  device_release_driver_internal from 
bus_remove_device+0xcc/0xf8
[  243.677419]  bus_remove_device from device_del+0x16c/0x468
[  243.677452]  device_del from usb_disable_device+0xcc/0x178
[  243.677486]  usb_disable_device from usb_set_configuration+0x4ec/0x8d0
[  243.677523]  usb_set_configuration from usb_unbind_device+0x24/0x7c
[  243.677560]  usb_unbind_device from 
device_release_driver_internal+0x194/0x21c
[  243.677590]  device_release_driver_internal from device_reprobe+0x18/0x90
[  243.677620]  device_reprobe from __usb_bus_reprobe_drivers+0x40/0x6c
[  243.677648]  __usb_bus_reprobe_drivers from bus_for_each_dev+0x70/0xb0
[  243.677676]  bus_for_each_dev from usb_register_device_driver+0x9c/0xd0
[  243.677713]  usb_register_device_driver from 
onboard_hub_init+0x30/0x1000 [onboard_usb_hub]
[  243.677765]  onboard_hub_init [onboard_usb_hub] from 
do_one_initcall+0x40/0x204
[  243.677811]  do_one_initcall from do_init_module+0x44/0x1d4
[  243.677840]  do_init_module from sys_finit_module+0xbc/0xf8
[  243.677865]  sys_finit_module from __sys_trace_return+0x0/0x10
[  243.677887] Exception stack(0xf4659fa8 to 0xf4659ff0)
[  243.677904] 9fa0:                   bf369800 0051dba8 00000006 
b6e438e0 00000000 b6e443f4
[  243.677921] 9fc0: bf369800 0051dba8 00000000 0000017b 00531658 
0051a1dc 00526398 00000000
[  243.677935] 9fe0: befbb160 befbb150 b6e3a9d8 b6f2aae0

