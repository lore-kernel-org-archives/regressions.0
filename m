Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0EA30F80A
	for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 08:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760429618; cv=none; b=ioGiHiCP3qd1irFoDj07qTr0a7WaQq7zp7EwCFrGulzmxL31D78L4BGqef+TzB7hrOllNjtMd0waX1xt5qbn6st1H/5jqVmRgB1FD9nmxZGH4wlmbg6ehr7VpdLV/mYK3snTNHBLE0nqfTsHwUuWumU1oE1M1OVaejgpVCfIBUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760429618; c=relaxed/simple;
	bh=+2LmzIVa9DmNGLrlYbtdQtzdJ1I1DZNXxMZgk2QxwOw=;
	h=From:Date:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n6lbKcNFh4x9FL9rxVvHao/1Wqo23KDCCgN0PFFKBH5gQKm22pRKaqbf8x7JGzvUaqbHu/FETvhDFt3sK5Gvoi0xrrswZAe2+aYEgH7tUDpscsZ2Th6iL3M7NwBRUhot438ew6DOvOAojXLBL6EhU7MmyqIdAV8a71DnW1mTX+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5MoH2Ea; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5MoH2Ea"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e2e363118so42566255e9.0
        for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 01:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760429614; x=1761034414; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xhf78mDj7L6zLhIAA4NyhL+vPp3/tw4ip9YZY4CJYUQ=;
        b=M5MoH2EaPXRr/6DuijT9KSH70wizM40aPj4Z1qVL0UZ/LdLoaN6fD0snc/XaTZFZKI
         vxjwtdj75Mm+GE5lyGgmQ8wAYn22eYVKKaQtFwSzACkZzdLw1ZebpHA9zIWnRNTGHf+m
         DO3vQRhcbQkxvflMFM1FjYELySX/M62+V0iVfO3HCbHCI47JayezkCismOErpKeZYL4j
         YGOd7LKkTWobkL3DC9mDJFZjJ1Xxc4JlS7/WVrgynG++O0lTl+huZJO2FMNX+PPFN46P
         fs5Z9fnPeQqPZoM21kax4Vxk3hNMRNqLvn37FEKvjbDlosU60iq9RVlYRkef/Y7tqQJt
         2O9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760429614; x=1761034414;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhf78mDj7L6zLhIAA4NyhL+vPp3/tw4ip9YZY4CJYUQ=;
        b=FnHG4CL/kchQcrBFuXhpKsRNeDbmsMuinh1CNLc8PR2Fy3vltfvhCH7F9ioUxgcLVI
         MsEGcScOnBn7eX2f2X0/Mcuu2Yjv9oLGaIRBqAOYefjxSeWuYpKsCJdgPyT59oLyB8Yt
         xLUmnLf/OucwoQYNJVo25e2cMYvmHV80+Masvo0q/STpaZsVTZsEIkAzESKih2J+n3tD
         fHcbF7fJZ4f94HvW0Eb3aKiSHEqkqgoDOweKZhmboUQQ0ayB9WwXt7yO3p1+BZxE6olC
         bgL4T0NQjsgYETXJR3OZNaIpgCeDam50b4+PECdeVtwJhCA8JTLMRfdYk4f5DNPlZAZa
         2aXg==
X-Forwarded-Encrypted: i=1; AJvYcCXhXyrEay0O8C31BgncmI3EGVKahyE4c7IKQL4/MqJbVgWg3UGJCluU++A5k3OxsLohCI6eAcK05iGcTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxF9NGcI3h9oDliXtmey+8NssuxpP42VYaYMvaebvyf4OIay809
	RNJsHYCunXqF6DHsOS8ypm0IUNc0hPQyeLNhcm8I8C5g/Fz2BFWKocWr
X-Gm-Gg: ASbGncvAMIhIdjvqqdcriDarqvKmuDhkV+Y8HopkmPKRCCpFL5sOUO0T+WFLvWlDPOY
	n22EOVAbsap3Ng8dE6gtYuzGk/hGTEnrXDRTWXK5axuKnXZMNWIn2VeiqZ2Sj/WOv3qxJz7L+eL
	ELXZZbxuij4ScLVzPtvj+G99xWGi20zY1NG76YQ7r0S9pSDHvQuZQZFfJ3n5cjGie9NwHgGcWTR
	6OsbITXXhBRxwd6XHdWhe27OO0nN84BGrcqnMXmbgwrs8KjTdXJs4nOelOGPVkliAMFmYv12HVG
	t4pKMjOXv4o+Ki7rsX38U8XQyCyoM8Pi3w92yhVxOhwm13J/mNs0Th5MgdLcDKG3a52Lkg/GXfb
	EWv/0RTeg4AODZVoZHoFPofbjKOVkSEhixeFia5a3vqJY23hYmwRY4TduQgbytXLXP5aPmplOLI
	7Q9idioF9yyf3qZwKg3xyoh080iHig+WlU8M42Z0LixdUCE5Vy4uEEYmA=
X-Google-Smtp-Source: AGHT+IE/yvvNi7f9ywz4oKxH3zGAx/TZVEsNIIjjDV3XuFHg8dmmWzqobqnhmfB1Aan5xjCCgtdy/A==
X-Received: by 2002:a05:600c:314b:b0:46c:adf8:c845 with SMTP id 5b1f17b1804b1-46fa9a98f32mr174482375e9.16.1760429613749;
        Tue, 14 Oct 2025 01:13:33 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb49c3eeasm225979145e9.14.2025.10.14.01.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 01:13:33 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
X-Google-Original-From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Date: Tue, 14 Oct 2025 10:13:31 +0200
To: Anusha Srivatsa <asrivats@redhat.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	regressions@lists.linux.dev
Subject: [REGRESSION] drm/panel/panel-simple v6.17 WARNING regression
Message-ID: <hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello everyone,

Commit 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in drm_bridge_attach/detach()")
introduced a regression with the below warning dure probe with panel
dpi described in the device tree.

[    9.160074] ------------[ cut here ]------------
[    9.160092] WARNING: CPU: 0 PID: 66 at /usr/src/kernel/lib/refcount.c:25 drm_bridge_attach+0x2c/0x1dc
[    9.160138] refcount_t: addition on 0; use-after-free.
[    9.160147] Modules linked in: coda_vpu(+) snd_soc_fsl_asrc snd_compress v4l2_jpeg pwm_imx27 imx_vdoa spi_imx imx6_media(C) imx_media_common(C) videobuf2_dma_contig etnaviv snd_soc_fsl_ssi v4l2_mem2mem imx_pcm_dma panel_simple gpio_keys gpu_sched pwm_bl loop fuse ipv6 autofs4
[    9.160423] CPU: 0 UID: 0 PID: 66 Comm: kworker/u10:2 Tainted: G         C          6.17.0-rc5-0.0.0-devel #1 PREEMPT 
[    9.160459] Tainted: [C]=CRAP
[    9.160476] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[    9.160497] Workqueue: events_unbound deferred_probe_work_func
[    9.160535] Call trace: 
[    9.160546]  unwind_backtrace from show_stack+0x10/0x14
[    9.160603]  show_stack from dump_stack_lvl+0x54/0x68
[    9.160637]  dump_stack_lvl from __warn+0x7c/0xd4
[    9.160672]  __warn from warn_slowpath_fmt+0x130/0x1c4
[    9.160726]  warn_slowpath_fmt from drm_bridge_attach+0x2c/0x1dc
[    9.160780]  drm_bridge_attach from imx_pd_bind+0x74/0xa0
[    9.160836]  imx_pd_bind from component_bind_all+0xfc/0x254
[    9.160881]  component_bind_all from imx_drm_bind+0xa8/0x154
[    9.160903]  imx_drm_bind from try_to_bring_up_aggregate_device+0x1f8/0x2b0
[    9.160959]  try_to_bring_up_aggregate_device from __component_add+0x9c/0x160
[    9.161003]  __component_add from imx_pd_probe+0xa8/0x160
[    9.161042]  imx_pd_probe from platform_probe+0x5c/0x90
[    9.161066]  platform_probe from really_probe+0xd0/0x3a4
[    9.161093]  really_probe from __driver_probe_device+0x8c/0x1d4
[    9.161144]  __driver_probe_device from driver_probe_device+0x34/0xd0
[    9.161195]  driver_probe_device from __device_attach_driver+0xa4/0x134
[    9.161248]  __device_attach_driver from bus_for_each_drv+0x90/0xe4
[    9.161299]  bus_for_each_drv from __device_attach+0xa4/0x1cc
[    9.161328]  __device_attach from bus_probe_device+0x84/0x88
[    9.161354]  bus_probe_device from deferred_probe_work_func+0x8c/0xcc
[    9.161395]  deferred_probe_work_func from process_one_work+0x158/0x2e0
[    9.161434]  process_one_work from worker_thread+0x254/0x3fc
[    9.161449]  worker_thread from kthread+0x128/0x24c
[    9.161473]  kthread from ret_from_fork+0x14/0x28
[    9.161494] Exception stack(0xe0aa1fb0 to 0xe0aa1ff8)
[    9.161505] 1fa0:                                     00000000 00000000 00000000 00000000
[    9.161517] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    9.161529] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    9.161539] ---[ end trace 0000000000000000 ]---

Note that this commit was added to branch 'drm-next-2025-07-30',
which did not contain an already mainlined fix for another regression [1].
Without that fix [2], this new regression is masked.

Reverting 94d50c1a2ca3 on top of
commit 260f6f4fda93 ("Merge tag 'drm-next-2025-07-30' of https://gitlab.freedesktop.org/drm/kernel")
fixes the issue. At that point, [1] was fixed in mainline, and the new
regression reported here was merged in. v6.17-rc1 to v6.17-rc7 are in
this state.

However, later on, another regression seems to be introduced by
commit 8fa5909400f3 ("drm/bridge: get the bridge returned by drm_bridge_chain_get_first_bridge()")
so reverting 94d50c1a2ca3 on top of drm-misc-next does not solve
everything. This was tested by rebasing drm-misc-next onto (260f6f4fda93
plus the revert of 94d50c1a2ca3) and then bisecting.

So in v6.18-rc1, both regressions are present.

There, I get the following additional warnings:

[    9.732278] ------------[ cut here ]------------
[    9.732336] WARNING: CPU: 0 PID: 38 at lib/refcount.c:22 drm_bridge_get+0x10/0x18
[    9.744608] refcount_t: saturated; leaking memory.
[    9.749634] Modules linked in: nvmem_snvs_lpgpr phy_mxs_usb coda_vpu v4l2_jpeg spi_imx imx_vdoa imx6_media(C) pwm_imx27 snd_soc_fsl_asrc snd_soc_fsl_ssi snd_compress 4
[    9.776972] CPU: 0 UID: 0 PID: 38 Comm: kworker/u8:3 Tainted: G        WC          6.18.0-rc1-00214-g1226cd7c7686 #138 PREEMPT 
[    9.788476] Tainted: [W]=WARN, [C]=CRAP
[    9.792320] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[    9.798858] Workqueue: events_unbound deferred_probe_work_func
[    9.804729] Call trace: 
[    9.804744]  unwind_backtrace from show_stack+0x10/0x14
[    9.812532]  show_stack from dump_stack_lvl+0x68/0x74
[    9.817614]  dump_stack_lvl from __warn+0x7c/0xe0
[    9.822355]  __warn from warn_slowpath_fmt+0x130/0x1c0
[    9.827526]  warn_slowpath_fmt from drm_bridge_get+0x10/0x18
[    9.833218]  drm_bridge_get from drm_bridge_connector_init+0xc8/0x72c
[    9.839685]  drm_bridge_connector_init from imx_pd_bind+0x80/0xa0
[    9.845809]  imx_pd_bind from component_bind_all+0xf4/0x254
[    9.851422]  component_bind_all from imx_drm_bind+0x98/0x128
[    9.857109]  imx_drm_bind from try_to_bring_up_aggregate_device+0x1d0/0x29c
[    9.864097]  try_to_bring_up_aggregate_device from __component_add+0xa0/0x164
[    9.871263]  __component_add from imx_pd_probe+0xa8/0x164
[    9.876690]  imx_pd_probe from platform_probe+0x5c/0x90
[    9.881940]  platform_probe from really_probe+0xd0/0x3a4
[    9.887280]  really_probe from __driver_probe_device+0x8c/0x1d4
[    9.893227]  __driver_probe_device from driver_probe_device+0x30/0xc0
[    9.899694]  driver_probe_device from __device_attach_driver+0x98/0x10c
[    9.906337]  __device_attach_driver from bus_for_each_drv+0x90/0xe4
[    9.912634]  bus_for_each_drv from __device_attach+0xa8/0x1c8
[    9.918409]  __device_attach from bus_probe_device+0x88/0x8c
[    9.924097]  bus_probe_device from deferred_probe_work_func+0x8c/0xcc
[    9.930563]  deferred_probe_work_func from process_one_work+0x154/0x2dc
[    9.937205]  process_one_work from worker_thread+0x250/0x3f0
[    9.942883]  worker_thread from kthread+0x12c/0x24c
[    9.947787]  kthread from ret_from_fork+0x14/0x28
[    9.952513] Exception stack(0xe0961fb0 to 0xe0961ff8)
[    9.957575] 1fa0:                                     00000000 00000000 00000000 00000000
[    9.965762] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    9.973948] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    9.981052] ---[ end trace 0000000000000000 ]---

[    9.985782] ------------[ cut here ]------------
[    9.985835] WARNING: CPU: 0 PID: 38 at lib/refcount.c:28 drm_bridge_connector_init+0x328/0x72c
[    9.999210] refcount_t: underflow; use-after-free.
[   10.004119] Modules linked in: mux_core error nvmem_snvs_lpgpr phy_mxs_usb coda_vpu v4l2_jpeg spi_imx imx_vdoa imx6_media(C) pwm_imx27 snd_soc_fsl_asrc snd_soc_fsl_ss4
[   10.032757] CPU: 0 UID: 0 PID: 38 Comm: kworker/u8:3 Tainted: G        WC          6.18.0-rc1-00214-g1226cd7c7686 #138 PREEMPT 
[   10.044260] Tainted: [W]=WARN, [C]=CRAP
[   10.048104] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[   10.054642] Workqueue: events_unbound deferred_probe_work_func
[   10.060511] Call trace: 
[   10.060523]  unwind_backtrace from show_stack+0x10/0x14
[   10.068309]  show_stack from dump_stack_lvl+0x68/0x74
[   10.073390]  dump_stack_lvl from __warn+0x7c/0xe0
[   10.078127]  __warn from warn_slowpath_fmt+0x130/0x1c0
[   10.083296]  warn_slowpath_fmt from drm_bridge_connector_init+0x328/0x72c
[   10.090115]  drm_bridge_connector_init from imx_pd_bind+0x80/0xa0
[   10.096238]  imx_pd_bind from component_bind_all+0xf4/0x254
[   10.101843]  component_bind_all from imx_drm_bind+0x98/0x128
[   10.107525]  imx_drm_bind from try_to_bring_up_aggregate_device+0x1d0/0x29c
[   10.114512]  try_to_bring_up_aggregate_device from __component_add+0xa0/0x164
[   10.121676]  __component_add from imx_pd_probe+0xa8/0x164
[   10.127101]  imx_pd_probe from platform_probe+0x5c/0x90
[   10.132348]  platform_probe from really_probe+0xd0/0x3a4
[   10.137683]  really_probe from __driver_probe_device+0x8c/0x1d4
[   10.143632]  __driver_probe_device from driver_probe_device+0x30/0xc0
[   10.150099]  driver_probe_device from __device_attach_driver+0x98/0x10c
[   10.156742]  __device_attach_driver from bus_for_each_drv+0x90/0xe4
[   10.163035]  bus_for_each_drv from __device_attach+0xa8/0x1c8
[   10.168804]  __device_attach from bus_probe_device+0x88/0x8c
[   10.174490]  bus_probe_device from deferred_probe_work_func+0x8c/0xcc
[   10.180955]  deferred_probe_work_func from process_one_work+0x154/0x2dc
[   10.187595]  process_one_work from worker_thread+0x250/0x3f0
[   10.193270]  worker_thread from kthread+0x12c/0x24c
[   10.198172]  kthread from ret_from_fork+0x14/0x28
[   10.202895] Exception stack(0xe0961fb0 to 0xe0961ff8)
[   10.207956] 1fa0:                                     00000000 00000000 00000000 00000000
[   10.216145] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   10.224330] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   10.231448] ---[ end trace 0000000000000000 ]---


[1]: https://lore.kernel.org/all/20250612081834.GA248237@francesco-nb/
[2]: https://lore.kernel.org/all/20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org/

#regzbot ^introduced: 94d50c1a2ca31d80f12d9c2bdbc41437751e320c
#regzbot ^introduced: 8fa5909400f377351836419223c33f1131f0f7d3

Does this ring a bell for anyone?

Kind regards,
Ernest

