Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793941173;
	b=NhhkHKMHT7qFDI32M6S2OsnqPvGzOuji1FWay1RyvbpMgOVv9ZRAusgZKhZDNStDbWUV
	 qGlpMGBGE27ztUkNX6H0aqfT1x1GrIOUv23wfTU7sRawEPYqTJAUn8fXFXmo1RrjaNfLJ
	 +Fib/UMm8HGLUKmuA4yEDek4Qk8/pwyG608+vsll9uc+ydTrEvff3AoZsOaXPInfWrMzw
	 V5+wDbV4sUXFaIg6O8nEnX3kL0NvKNVYGSsht99rnKcSvbIC/NZa0fddJmmXvB96rSEr9
	 axay79AymzOlMrW4lMgMt9W24j+iat6fPxWm6JK9/ziKCLhbmcE2FXDM2gHGFt47DXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=nk53h9xGi0i8b4U2D9YQl5+MCk7G9ktrexEt257Eljk=;
	b=nVmb++0vAIHC8Gwa8FhCetlEjbTcIsFyGhjuILu4VTqJuC7GHp/V/UF0SxNkTDWPzQoi
	 fUBX3P4o+ckIeWrY4oXgtpJfDvZ4tT1KP5Yt5SDsRbXoHT9yD8sLILKcbkFMYrf2/+oFu
	 9CUTgZRztYih+E//CJeyVvLZ69zuHicjuMe7ijs2wh1gVeA0XRHj20kid0SlitXR2hC3T
	 RV3xb/riSRffpXiCAWhPBeW2IItzQvzWE9S5Gwvsp+0bgPCDC6CGfbF+mbVdBG+KfTbhA
	 beA7aoCAQbwaSnphNtP8z5ghW3Gqsa0rXAhdOFcXBtWFKFRVWqb5x+HVmnkIHMJmb1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q8Mv2cOA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE35606A329
	for <regressions@lists.linux.dev>; Fri,  6 Nov 2026 04:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE35606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q8Mv2cOA
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d30639709so26120866b.0
        for <regressions@lists.linux.dev>; Thu, 05 Nov 2026 20:59:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793941172; cv=none;
        d=google.com; s=arc-20260327;
        b=sYgydCSJIndB9xJKqlFWGIqNNN5bAQ84M8MjdBRUUiHfpmqGA+J6aRQigCYrLQdZeq
         SdbaFxXrKq4hx+W6Gf85Kd54r6venyr0BQyrCBuksXCa9tIbAG/bXtIIORExH/83fDdN
         xO9eE9O+45u0eVzKQ/147GeIZDjK1v2AE+AkiULYmM4wq4XZJ5pF2sEXrnNJoaT02iXc
         APy6NRpey5t44nsiwWrJE+0VIMxNkXOzgSaHPdOdEPxk1gUHsOSDMORDcxba4S+l4yo8
         qiw4cEzp9dpbSQ5DNi+PRv4sRRaSi8qLd6slr+t4muJ3jSbgGSJhzAykipnkey4PL7ST
         LkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nk53h9xGi0i8b4U2D9YQl5+MCk7G9ktrexEt257Eljk=;
        fh=6BBEDzD/Qpg1e4mlLrHSm4iPk0Pwesgq1g27Tg64xEo=;
        b=I/gWSNVA+HZswKhWZZMf3uJlMLr/hfVjlqYqJDJxcgPzZ4V+1TcBT2kOlVNdGXHs76
         YNu2BDzWztZHS1qv/48gzv3HLWNCqO18Dq3aHHNM0XCcCkJdjOZAC05wzZ2lkAL2j15I
         xrk2vgdFXsjOwc5jL/Yuh0EIf/kg2qaIefENQ016QsRn2/czPIKp1VBPMJ0bf/bg7w6+
         GVg9dpfUYIRcQiL7zaStSeyzezks4bxd9drSugD74tiy0pDMfknXWk7Ta15VJWE8Wkat
         5UisWzxxnQf0qlGXozDMFsrM9q19/lX99y+kwvva1/rJjsLlDgmvUpDVgIQnIj65Vk5p
         FPQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793941172; x=1794545972; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nk53h9xGi0i8b4U2D9YQl5+MCk7G9ktrexEt257Eljk=;
        b=q8Mv2cOA9e8/IiP1sAhvRMt0oQmPVWyGKww+9kl8v4yYjU4yOtnMAWHSxVHX21pl5W
         gRZYOPGKjwGnyCbteG4LXQ/1WROayj9XUnQo73NJWBN17KsqlTosORJqLMLohNo/Ef13
         Uvxaqic1a1ITicixGqffmPyFXgdHIpk+ZbGXshWZDPv3f3EIOLeqIj5Om9BeemYo0+X6
         uaXSSUkjDGkwcP6TaEYRLlK0sE/COelwcDg7Gwc01MOoUrLZ8s0lIOnZK52deV6iLJTK
         6W0b0w8Veom8M9tmWFpiVh2Gpj1HHYBl/4ZtWFAN1spZHv/gUulzM2hn9HekC7enihup
         GM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941172; x=1794545972;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nk53h9xGi0i8b4U2D9YQl5+MCk7G9ktrexEt257Eljk=;
        b=zqnONyKW0//UE3B5AKmL27iouSXdFyCiegIpI25/0jVCsSCFPmLfYGRoKsSlX7MiYH
         qJEtzUMYSW8o5vyNAItrvEOyLo6qbe6EinMQE70fMLKphqtpe1RtolSWoTThKTO1cFsx
         sZI96QtlA1TJKPc47/SD4RwVMszquVWlGJdxmSBvJoqeM1oDieHhZI6kBY7VGHb1oPN5
         rGF7V89jEzBy9+4KIqc3DTvZfbs9DbVtnSeRbmjd09Ij+m0MWVhvIWvQTJTYcxbIQdW9
         PUxjPa1d4sLwV4Jr1XiIxcBYPzuNA6Rg/OBdYLUJs8nL2niBJyK0Ky/xvb8cNdFnEUFj
         z6PA==
X-Forwarded-Encrypted: i=1; AKwUvBybmJfCHAYgRtmH6sEmPBwofUeIG6t2tQwQchNuykcUDS4zEV+wi5HtttZnft1LjX0urwVD3oE19z5EdA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+RtNmd//MhuvzanDkGTRW20r0NEpMud0QZvv82U0h9jcRT2+Pv
	+PKYvM/R6Vh0YccuJ0TZ9qNAqvyHzuty4g2xZyOzGUIAYm56Dws2rOvVTAhV1VYNHm2eOps4Ne3
	y0AC+UhTI73DsF+GMoZG0FXWMFwrKIk0=
X-Gm-Gg: AYBFou1WQIq7E+frpBOhXG1KZblNauFTkv1L8lfYCuhPL2tyVHIA0DGE4ub1FxDWiwL
	znSdgy1IMp2nHHkrTtxViCpRg25phhYk7yqLI1kHX4KrqTY4PII7pboCQfw0epEnIugvXHiESG7
	lC+3Oj+01esbJQPrwKK+n/O2M7Sro7HJ0mV9hWSaa31qSkB18N+aITA6s9fK+zuAnWGbINNmX10
	SMAL9xrFsI203DLtWEGIjsqeFf1DpmRqaHNiY8fhJ8GO093ilXqUn2t6yGu9UipdCT2bC5CqGa7
	Ao/XF75QxG/0ydl4pp3nNuZCdY7f1pTGLDMlENdCVxB9Vs4+4euq+/ex1zESsq5Fqf/hC8nZiLG
	2pDPs2peFcZ/+QHZYJt5UrS/ecHT69MFv8vYytQ==
X-Received: by 2002:a17:907:d03:b0:c41:1e13:8891 with SMTP id
 a640c23a62f3a-c4d34a64653mr110110366b.9.1793941171526; Thu, 05 Nov 2026
 20:59:31 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Shantanu Sarkar <shantanu.connect58@gmail.com>
Date: Fri, 6 Nov 2026 10:29:14 +0530
X-Gm-Features: AclHuK_6yVfvd4MvFxvFI_KwNC62wXAmnA8mSmYy2zvtvvaMyEA2xYUb-GFYXG0
Message-ID: <CAK8Z4SCRhWcbL5i6NgwiLWDCX48YbMfcJ_+nFrGxKMZiN1vG3w@mail.gmail.com>
Subject: [REGRESSION] media: em28xx: list_del corruption on dual-TS disconnect
To: "Jiangong.Han" <jiangong.han@windriver.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Commit 826915b6b65e ("media: em28xx: fix use-after-free of
dev_next->devlist on disconnect"), merged for v7.3 and backported to
stable, makes em28xx_close_extension() unconditionally do

if (dev->dev_next)
list_del(&dev->dev_next->devlist);

On a dual-TS board whose secondary device is not audio-only (the
normal DVB case), dev_next->devlist was never added to em28xx_devlist.
em28xx_duplicate_dev() kmemdup()s the zero-allocated primary in
em28xx_usb_probe() before request_modules() links the primary, so
dev_next->devlist is {NULL, NULL}, and the list_del() on disconnect
crashes. On current mainline (7.4.0-rc1, 05441d697f7f), with
CONFIG_DEBUG_LIST=y:

  em28xx 5-1:0.244: Closing input extension
  list_del corruption, ffff88810de88250->next is NULL
  ------------[ cut here ]------------
  kernel BUG at lib/list_debug.c:53!
  Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
  CPU: 1 UID: 0 PID: 32 Comm: kworker/1:1 Not tainted 7.4.0-rc1 #1 PREEMPT(full)
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009)
  Workqueue: usb_hub_wq hub_event
  Call Trace:
   em28xx_close_extension+0x15a/0x390
   em28xx_usb_disconnect+0x16b/0x2f0
   usb_unbind_interface+0x295/0x9c0
   device_release_driver_internal+0x48d/0x7d0
   bus_remove_device+0x444/0x560
   device_del+0x523/0x8f0
   usb_disable_device+0x3d4/0x8d0
   usb_disconnect+0x346/0x9a0
   hub_event+0x1bd6/0x4d10

Reproducer: syzbot's C reproducer for the bug the commit fixes
(https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c), with
one byte changed so the emulated 2040:026d device (WinTV-dualHD
01595) exposes a DVB isoc endpoint 0x84 instead of the audio endpoint
0x83, i.e. in the memcpy of the extra endpoint descriptor:

-"\x83\x99\x35\x19\x1f"
+"\x84\x99\x35\x19\x1f"

Results in QEMU (x86_64, syzbot's upstream config, 5 min per boot):
  - tree at 826915b6b65e^ (before the commit):  no crash (3 of 3 boots)
  - same tree with 826915b6b65e applied:         crash above (3 of 3)
  - mainline 05441d697f7f (7.4.0-rc1):           crash above (2 of 2)
The unmodified syzbot reproducer (audio-only secondary) is fixed by
the commit, as intended. I have not tested real hardware or the stable
backports (6.12.y, 6.18.y, 7.2.y, 7.3.y carry the same change).

How this was found: we were testing AI coding agents on old syzbot
bugs, and an AI-assisted review of the candidate patches flagged this
path; I then confirmed it with the reproducer above. No AI-written
patch is included.

#regzbot introduced: 826915b6b65e

Thanks,
Shantanu
