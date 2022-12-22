Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C6C15A9
	for <regressions@lists.linux.dev>; Thu, 22 Dec 2022 00:55:55 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id j28so278618ila.9
        for <regressions@lists.linux.dev>; Wed, 21 Dec 2022 16:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x88asDLtwY2V0XbB3nxSM+ocAIX8asbMfXSdfkvaDwY=;
        b=RjygQs9jjt6itooR+W+gGKp+iOnke7sTo4F11kftiMRz6qb5c6UC3Juk7BnImjIj8h
         NYAFp9BxPcMCR19h0X4TvP+aM9MS5reNKi+og47wm7Jd9FgBpV7Rro1TfxfRKe+7G+TA
         u93NlDJfXszK8ZXgaOKSWjrB0QAJ0TooEkIQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x88asDLtwY2V0XbB3nxSM+ocAIX8asbMfXSdfkvaDwY=;
        b=49iSwwRHffj0BjFgWYzMyDLG4BNmsohNuetjYslfHvRbRMbZdUzrz2OU9SblBLa3Fn
         T/fS9u1Ux/A7Goj8VED3RfGUfM6FrXBDrJ+wiAb5nQM1eRui01DD97njnd5G04hPh6V9
         NWNrM7EkMSUOHq+rRApL8V1x+DxgWMpHIsrdgJGKfh6EPCjaq5DzyOw0r9QPlYLR7Pyw
         GoeqrFxy28EsWJw5fGPMyLnBeMf+O5MG0CeVHNqjoPhFxNmdAVnoLs6VDK/w+IneOqDx
         ZQHjtp12vayZnDsG7i7/JWo39zkZJgHYPoQiUIAPitFIFDSTMQePvwulmCWO0KbgAwCf
         huYg==
X-Gm-Message-State: AFqh2kqDUH+5xUnKtZf0IYdb9BKm1QFSnv8OxVfkcAh75ZPt8hbacgNj
	jPwEhOVYxioS5aRbbj3rX0amdg==
X-Google-Smtp-Source: AMrXdXvc+ZyoSzi/MtcK1VlkJBcp8SifLyFUlGOCbTdNSXgBuBlMZQLuW0nAeHSSgHuED+zQJI287w==
X-Received: by 2002:a05:6e02:507:b0:30b:d29b:8073 with SMTP id d7-20020a056e02050700b0030bd29b8073mr3157505ils.28.1671670554924;
        Wed, 21 Dec 2022 16:55:54 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id p9-20020a056e02104900b003039a19a927sm5651133ilj.7.2022.12.21.16.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 16:55:54 -0800 (PST)
Date: Thu, 22 Dec 2022 00:55:53 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: Regression: onboard-usb-hub breaks USB on RPi 3
Message-ID: <Y6OrGbqaMy2iVDWB@google.com>
References: <Y6Ci7wWvbBRRQkR6@google.com>
 <97c9b305-86f4-5918-54bf-4057e99eae3d@i2se.com>
 <Y6ECMZeh7G9bH8Fi@google.com>
 <db6f59bf-33a1-776e-b52c-4818ff9114e3@i2se.com>
 <Y6I8L45rDhqBMfUZ@google.com>
 <dde8b5e1-fbce-dd6c-6047-09e03ff2c00d@i2se.com>
 <Y6M5SPBpp/xMzUz7@google.com>
 <4a170314-6082-f3ba-cfb4-c19d7eb576c0@i2se.com>
 <Y6NYK4/jp/QmusOX@google.com>
 <8503cdb5-6089-b9e4-25ff-f3ac294b7a79@i2se.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8503cdb5-6089-b9e4-25ff-f3ac294b7a79@i2se.com>

Hi Stefan,

On Wed, Dec 21, 2022 at 10:31:09PM +0100, Stefan Wahren wrote:
> Hi Matthias,
> 
> Am 21.12.22 um 20:02 schrieb Matthias Kaehlcke:
> > Hi Stefan,
> > 
> > On Wed, Dec 21, 2022 at 07:00:41PM +0100, Stefan Wahren wrote:
> > > I will try to play with lock debugging.
> > Thanks, hopefully that can provide some hint.
> > 
> DETECT_HUNG_TASK reveals this in error case:
> 
> [  243.676253] INFO: task kworker/2:1:44 blocked for more than 122 seconds.
> [  243.676284]       Not tainted 6.1.0-00007-g22fada783b9f #32
> [  243.676294] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
> this message.
> [  243.676303] task:kworker/2:1     state:D stack:0     pid:44 ppid:2     
> flags:0x00000000
> [  243.676329] Workqueue: events onboard_hub_attach_usb_driver
> [onboard_usb_hub]
> [  243.676388]  __schedule from schedule+0x58/0xf8
> [  243.676419]  schedule from schedule_preempt_disabled+0x1c/0x2c
> [  243.676445]  schedule_preempt_disabled from
> __mutex_lock.constprop.0+0x29c/0x948
> [  243.676474]  __mutex_lock.constprop.0 from __driver_attach+0x74/0x188
> [  243.676503]  __driver_attach from bus_for_each_dev+0x70/0xb0
> [  243.676532]  bus_for_each_dev from onboard_hub_attach_usb_driver+0xc/0x28
> [onboard_usb_hub]
> [  243.676587]  onboard_hub_attach_usb_driver [onboard_usb_hub] from
> process_one_work+0x1f8/0x520
> [  243.676637]  process_one_work from worker_thread+0x40/0x55c
> [  243.676663]  worker_thread from kthread+0xf0/0x110
> [  243.676685]  kthread from ret_from_fork+0x14/0x2c
> [  243.676705] Exception stack(0xf091dfb0 to 0xf091dff8)
> [  243.676720] dfa0:                                     00000000 00000000
> 00000000 00000000
> [  243.676737] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000
> [  243.676752] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [  243.676788] INFO: task systemd-udevd:148 blocked for more than 122
> seconds.
> [  243.676800]       Not tainted 6.1.0-00007-g22fada783b9f #32
> [  243.676809] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
> this message.
> [  243.676817] task:systemd-udevd   state:D stack:0     pid:148 ppid:144   
> flags:0x00000081
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
> [  243.677590]  device_release_driver_internal from device_reprobe+0x18/0x90
> [  243.677620]  device_reprobe from __usb_bus_reprobe_drivers+0x40/0x6c
> [  243.677648]  __usb_bus_reprobe_drivers from bus_for_each_dev+0x70/0xb0
> [  243.677676]  bus_for_each_dev from usb_register_device_driver+0x9c/0xd0
> [  243.677713]  usb_register_device_driver from onboard_hub_init+0x30/0x1000
> [onboard_usb_hub]
> [  243.677765]  onboard_hub_init [onboard_usb_hub] from
> do_one_initcall+0x40/0x204
> [  243.677811]  do_one_initcall from do_init_module+0x44/0x1d4
> [  243.677840]  do_init_module from sys_finit_module+0xbc/0xf8
> [  243.677865]  sys_finit_module from __sys_trace_return+0x0/0x10
> [  243.677887] Exception stack(0xf4659fa8 to 0xf4659ff0)
> [  243.677904] 9fa0:                   bf369800 0051dba8 00000006 b6e438e0
> 00000000 b6e443f4
> [  243.677921] 9fc0: bf369800 0051dba8 00000000 0000017b 00531658 0051a1dc
> 00526398 00000000
> [  243.677935] 9fe0: befbb160 befbb150 b6e3a9d8 b6f2aae0

Thanks, that's useful!

The flow is something like this:

- USB root hub is instantiated
- core hub driver calls onboard_hub_create_pdevs(), which creates the
  platform device for the 1st level hub
  - the platform device is created even though the onboard hub driver
    hasn't been loaded yet, because onboard_hub_create/destroy_pdevs()
    is linked into the USB core
- 1st level Microchip hubs is probed by the core hub driver
- core hub driver calls onboard_hub_create_pdevs(), which creates
  the platform device for the 2nd level hub

- onboard_hub platform driver is registered
- platform device for 1st level hub is probed
  - schedules 'attach' work
- platform device for 2nd level hub is probed
  - schedules 'attach' work

- onboard_hub USB driver is registered
- device (and parent) lock of Microchip hub is held while the device is
  re-probing

- 'attach' work (running in another thread) calls driver_attach(), which
  blocks on one of the hub device locks

- onboard_hub_destroy_pdevs() is called by the core hub driver when one
  of the Microchip hubs is detached
- destroying the pdevs invokes onboard_hub_remove(), which waits for the
  'attach' work to complete
  - waits forever, since the 'attach' work can't acquire the device lock

For the Rpi 3 B Plus and boards with similar configurations it should be
enough with not creating the onboard_hub platform devices, which anyway
is the right thing do. I'll send patches for this.

The above race condition could also impact boards which actually should
use the onboard_hub driver, so not creating the pdevs for some boards
won't be enough.

Out of my head I can't think of a clean solution. The onboard hub driver
doesn't control the locks involved. Detaching the driver is necessary
to make sure the onboard_hub USB devices don't hold stale pointers to
their platform device. Re-attaching is needed because of the detach.

One option could be to change the 'attach' work from being a member of
struct onboard_hub to a static variable owned by the driver. With that
onboard_hub_remove() wouldn't have to wait for the work to finish. An
inconvenient is that only one instance of the work can run at any time,
which could result in a race condition when multiple onboard hubs are
probed closely together. It could happen that the USB device of the 2nd
(or 3rd, ...) hub isn't re-attached if it wasn't on the system wide USB
'bus' yet when the 'attach' work of the 1st hub runs. Probably a rare
condition within the (as of now) rare scenario of multiple onboard hubs,
but it could happen. A mitigation could be to enter a sleepy loop if
schedule_work() returns false (work is already running) and schedule it
again until it is actually scheduled on behalf of the platform device
in question. I might go for that if I don't get a better idea.

Happy holidays!

m.
