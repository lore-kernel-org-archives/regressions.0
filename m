Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D7618EB0
	for <regressions@lists.linux.dev>; Tue, 26 Mar 2024 16:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711472226; cv=none; b=Jg50Zr5O9gBt8SxFBIDHY/sA6CAcvkrKF14CH3n784+EDccwzH4a4hBNsG+60l4ay+Pq0/lhrosUpHDc4xzHaLD0oE3tU8fln9sR0lw19HswvCe5EOXjesGb60VRcsbiVsmUWmI+bJFasyg5F5LwsGkoYptYeKyCFTOCCvizL4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711472226; c=relaxed/simple;
	bh=2qeRp3NpCuiDAJ/3gyrJI5txbBbOCmyfgeNGwUJ34QM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeXg1uaGseb1Pp1ZlAIDk27kRWKZJBf9fWxNT8l/WxVJGTo8tcFIDUmIDI5V+g8uLPq5C5U4wTKnmspeft3Yew8Oax3X5ENGvdCNX/xEtYg2Zvu5LT5UTNxtzIH0vue1EEnohBdI9hP9zwv1RqQzmAy+EadInUQnZEDfP1ls988=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6R/n9/Q; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6R/n9/Q"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d49f7e5c2cso75601541fa.2
        for <regressions@lists.linux.dev>; Tue, 26 Mar 2024 09:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711472223; x=1712077023; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IU22RLww3/XOivsSv4VG6tutKJTJKSIdnxTJz7w+A7w=;
        b=i6R/n9/Qj2vZ65q8C+twssMAfZWG/kniEv5wglF401ZqDC9Qt1vN+Uqx+P9QXPJNIo
         7khZ5inqsVFWweZsmnTbEmaMVYOL0aEg7J7aBK4ba8o5mO+ob03JisICa93kEMxRwX9c
         rxqURpHgWX3uaq9Fz7vlmZa3FJzsDbc9tHsac+GIQ6/yjvPTRU6hBpIyZq+rLczGDJM6
         6nzXilwZK+YPjLJhgJUuznZclvoMagGUumuiPn/5KlC262LPbR9gPc7S+u7L79dFhFXG
         UtMtgkNdgdYKAW2+QYd80eRtAuccgyHdpbNHXusOl6jOXrsA87ApwyCxyE9MQ12F7dV2
         w9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711472223; x=1712077023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IU22RLww3/XOivsSv4VG6tutKJTJKSIdnxTJz7w+A7w=;
        b=ks2QyiL+HByaRH+4pp0VK4pE+PcnXDgmgoTj8TYe/vZLYSbhIvfLTSaWvGNg/6MVgt
         Qm9p2fypaRQ9/TDhdExs0v5QWdTB5IO2chZMIq5TRlfFHR6VrELWm3DTpw+f6Y0UB5ZH
         em/ls4Wm3ZQphtGT6CGzl7U475ODMVdHU/JzVQfPxCMROqUpchm7qESe9VYeaPY7F5+G
         jgWutxHfSixDSP/+Ah3gvwrXkPdBUYKAD/Mk4dLS7Gxnr03pj96pxJYqwiQm88a6Vubr
         dN4IZ5aaBFxolDJOLJ2PkNk9uHI9mmy19ddGRwTge13HhxyCorMABCxIm+mnfs6xrn+V
         Q4pw==
X-Forwarded-Encrypted: i=1; AJvYcCVfUManP8XsbL7JtOJw6WQ00VsyX0eeIkK6qtDGMRkqTJk5PmqFMiC1vUxRjFm7EyEUdFoHzlIhPm2c0V869Jb235szrARmz+kcbRk=
X-Gm-Message-State: AOJu0Yzei9Pd3ThT0NAlLjNvQNF8ahWy9KIEsXgTdkGUV+T7We9xly39
	GIiaKvz/2lBdQrxdw66KoIrh751Y86QjXfJH56/RFiSJuQSG8016ckeHBCCJtdMY1ZdJjhKkMrr
	38e/97pri6DT7goVZGUNUlXche8M=
X-Google-Smtp-Source: AGHT+IG1ZbFTx/MVVy6KI+dZ/kXiCyWDzCYWscY6etooM2mCnGEIMPlRg7hdSoLTGuQbmIXPG1EoR/a1KhikHD0w/O4=
X-Received: by 2002:a2e:b8cb:0:b0:2d2:dac3:90f with SMTP id
 s11-20020a2eb8cb000000b002d2dac3090fmr157304ljp.52.1711472222756; Tue, 26 Mar
 2024 09:57:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <08275279-7462-4f4a-a0ee-8aa015f829bc@leemhuis.info>
In-Reply-To: <08275279-7462-4f4a-a0ee-8aa015f829bc@leemhuis.info>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 26 Mar 2024 12:56:50 -0400
Message-ID: <CABBYNZKDa9KR8A_4TbpPyiLWFFH22T=Z9jk7N=o6U+z1oB+7vg@mail.gmail.com>
Subject: Re: [REGRESSION] Oops during init in btintel_read_debug_features with
 today's mainline
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Tue, Mar 26, 2024 at 4:44=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis.i=
nfo> wrote:
>
> Lo! Just booted 6.9 for the first time and noticed the Bluetooth code
> causes an Oops (see below) during boot that did not happen with 6.8 and
> earlier. This is on Fedora 40 with a vanilla kernel on a Lenovo Thinkpad
> T14s Gen1 AMD.
>
> Do I need to bisect this? Or is this known already? Or does anyone by
> chance an idea what might cause this? Or is there some other way to get
> down to the problem?
>
> Ciao, Thorsten
>
> [Full dmesg: https://www.leemhuis.info/files/misc/dmesg-6.9-btprob]
>
> [   19.903869] Bluetooth: hci0: Found device firmware: intel/ibt-20-1-3.s=
fi
> [   19.903908] Bluetooth: hci0: Boot Address: 0x24800
> [   19.903913] Bluetooth: hci0: Firmware Version: 255-255.255
> [   19.906245] usb 6-4: USB disconnect, device number 3
> [   19.906364] usb 2-2: Found UVC 1.50 device Integrated Camera (04f2:b6c=
b)
> [   19.906583] Bluetooth: hci0: FW download error recovery failed (-19)
> [   19.906649] Bluetooth: hci0: sending frame failed (-19)
> [   19.906666] BUG: kernel NULL pointer dereference, address: 00000000000=
00070
> [   19.906672] #PF: supervisor read access in kernel mode
> [   19.906677] #PF: error_code(0x0000) - not-present page
> [   19.906681] PGD 0 P4D 0
> [   19.906688] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [   19.906701] Hardware name: LENOVO 20UH001HGE/20UH001HGE, BIOS R1CET77W=
(1.46 ) 10/26/2023
> [   19.906706] Workqueue: hci0 hci_power_on [bluetooth]
> [   19.906775] RIP: 0010:btintel_read_debug_features (/usr/src/debug/[...=
]/drivers/bluetooth/btintel.c:1306) btintel

Seem like the following could be reason:

https://patchwork.kernel.org/project/bluetooth/patch/20240326164317.1460864=
-1-luiz.dentz@gmail.com/
