Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E154A3A0B36
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 19:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785439706; cv=pass; b=NZJfXgkzitlgI3HnzE7iNVKWONMeE4pP4yVoBpL6dv3kBvL+5PN3JB1SXErYuoLLuPIdBmpBv+OJ6CjTOwsjWdA+Wi0DiCreF9B62ghgvhVbzHkTaUoxw0ynS/UwF+dsmkhmhbeEQPUakCSqPxYwhakZ75cqSrfFU5fSGGm7nkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785439706; c=relaxed/simple;
	bh=ll/FaK04GC8vCwFkBBQHSFd/0rrd11opybKM/RHi/Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ydb1yHa5isyPCCeZp59riybOJwNCXLChQJ5EDZP/AvjhnCQImMhKYCALHwglMC1zhUzNkVVeb5oEfoyB3VVxC+eqqvsJRSyyMT2fMZXb9PXNUXP+LsqiyTTcWtT0o7t+qdx4df0gfeRFhEwE/92LwB2p9GtpvgOZUIFaNpiLQto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDZXwIpW; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDZXwIpW"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38101f85591so959861a91.1
        for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 12:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785439695; cv=none;
        d=google.com; s=arc-20260327;
        b=FkQZ8JJLeLym8jcyTg50oBXbBSP7b7BOspT8iJUQQnbHHwhLMjwgH+QrTiDv1UaNVu
         KvWsKG1dmtxOvqd/16FlfZvDJNYFb1w/auTGpK26XQTv9PGeSp6G0zb9pnRFiDm5uuBV
         5nYX7zS9sE9QXzveywfsFJmx+B/UiWv5/92QhLlJwJg81vO/+6NsrUZWtdqx8xBxoxMq
         dRgNMEYQEncxqK5DXy0G1PfUxiE6HbGnLIHqWfgTzvgWuJvKEOm8FCfo0UVVDXXBZioA
         vbLORFkkfzaPiwIStp5RvcrIM6lHo71l+zN29Cj//hOup4ERqhuX4YytDnLe6lcDNVty
         8DNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hs3O7+0+O1BzynlCu6bABVAxk2P74JiftgV+5qL8qh8=;
        fh=xJLctwGnR5Tzcr1BFfqK7PrtHda5dlULXID1XjWnmkc=;
        b=oYjYjxlQ6L49yQzaHH4tS+QfcvarPOVUXscKW2nab4PXnxx251hwuRG23/eye6+f5W
         e8VuztVY8kbXWQvNw4hpVVgDkln6UFv1gjNBnjW9z6vGFrMjmtQ1ceClVm84cBjzsCc6
         qT/wk39+JxUje+6IoMrd6cmvp2vzruXIAK24RR87SJODQiwIPo2Xrr55tXYm2ZpEW2u2
         VtNCOs58X0gLEO1HI4N/dgkDS5X+h1Tjqjd6BdmRdigUwcZj8v7HJQG5zKHxCor1r9pS
         yIbDo42UXgS8VeBVxpFoJ+l7yjR1Lf7E86AD6vr9+7rCI9h/hJK0M4hIZpuuozErT3d2
         49Ag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785439695; x=1786044495; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hs3O7+0+O1BzynlCu6bABVAxk2P74JiftgV+5qL8qh8=;
        b=JDZXwIpWVFgqz5e9tyqqGWW7ZeTmKkSsklW8yhwc/dx/J04iSqMBYf4vVTZI573O0P
         w9uAQgk6Lc2pJd4AjpiHl5xNXpyhiqsOIF1e11aLAbiS0b0PV/Wdw83eeuQKGE0xe+Ov
         x1pZ2z9P9u3P6cdYcgad0GmX1ORc+Y9CtPjwjsgkvfUAQB+W9kxJTL/pjqM8qLaFRVTd
         cql0M9rL5pwfeJoy7Iic0pKrpvXoUNxv5mC5qcANaWlOXkQQeZZe2WJWcqBYbD8LAFi+
         eLsuA4Ok04H9FK4XEEtYWOcdw4uxCB2WRUOXGpousOQUQiBTRLKjuKJS9o/+eInlSf0Y
         Pb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785439695; x=1786044495;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hs3O7+0+O1BzynlCu6bABVAxk2P74JiftgV+5qL8qh8=;
        b=dI8CRkVba7+4pRCA/9jGEkSmL5kx08VH+GgVvcNt2oL6wP5a9Yes05nRi1RFXAae6r
         /MAqtg0x++u+5WC9jr9JhnkwiWfkK7xace/1wvuPIBc2PLrm++4gISzZYtr4s9Pu0wnY
         sVkd8iZTXVWuBOh54JC8WxKEXX0GahLwbQUgN5QNc4ux2jXdOeGGvbncY+tDrtYmY4qG
         w4G4iDCkq4tyclh9qKEki1xj+LGB5WVi1kIEPVFxJdjrC1QqtrfO4nTIkBVQATrEMe6s
         QDOBQiPuXXghMWXQkpm/c/HXWN5bzyL6H5Y7IKDEN/fSUmT00nlvJfqtOUZvKPzOAKRG
         sNIA==
X-Gm-Message-State: AOJu0Yzy0xuBQl+S0Zrkc6PXu8u3yfEswjdk9riB4G06jzO/GVbIQ1AJ
	S68pNqxZITllfayPSD1VbEV5Twx7MA8oG5KZHC7Uwv005qtlvF4SYSv5rMi780y8OIhMKUq1uI+
	seNuzNFFn55g4AR+NLlyccqlXwDQ/XYg=
X-Gm-Gg: AR+sD105ZkA6JZ3+69iGhTCqsx6b9z6pVtUrK2LieojqiIDVGcYCzuO0NMMlaGLdVyL
	iMjgJdtoBpQwjWEv2Y12HN7Aw/u7Gwvo9+jogkVubjsF7ZocZqilBHiYNxBSeFlirP/Z1BcXXBj
	AAHUCFUv20nM2g1+3v1MkNWlA/zOcG2sPBfQOW0BZaeD4x2mFqHDbsOXx1qEhPxdYLC+E/vxgAu
	FAowvmC1H37LIOWU5clT8gJochgmPrbgGxRdOVU89ZaJQ/tDJCby4EQwv0aiDp7xG5riQG3rgc8
	YoAi4ZgT3kUrZHFblw5If8psgUiEZipwi8UIjDIv7W3SIzLBItAbRRz+pGtN3aNoJXweoNSjF3s
	AJJqO4KIfeD/k8EaLK9MjQMKa8J4=
X-Received: by 2002:a17:90b:4c85:b0:387:d5bd:622e with SMTP id
 98e67ed59e1d1-38fa7824b05mr937031a91.17.1785439695076; Thu, 30 Jul 2026
 12:28:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
In-Reply-To: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
From: Jamie Stephens <jamie.stephens@gmail.com>
Date: Thu, 30 Jul 2026 15:28:02 -0400
X-Gm-Features: AUfX_mz_8J7N5cSdJsnEi7DuUMOyhEc8gY0WtMhugK0SpmdWDoQhR3Drz3IuJAo
Message-ID: <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
To: jikos@kernel.org, bentiss@kernel.org
Cc: regressions@lists.linux.dev, gregkh@linuxfoundation.org, 
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Per the recommendation on Proxmox Bugzilla #7850, I=E2=80=99m reporting wha=
t
appears to be a Linux USB/HID regression affecting a CyberPower
LE1000DG UPS.

Hardware

UPS

CyberPower LE1000DG
USB VID:PID 0764:0501

Affected x86 platform

Intel Tiger Lake-H USB 3.2 Gen 2 xHCI Host Controller
PCI ID: 8086:43ed

Problem

When connected to the x86 system, the UPS enumerates successfully and
is bound by the kernel to hid-generic.

Kernel messages include:

usb 1-3: New USB device found, idVendor=3D0764, idProduct=3D0501

usb 1-3: Product: LE1000DG

hid-generic 0003:0764:0501.0001: hiddev0,hidraw0:

USB HID v1.11 Device [CPS LE1000DG]

However,

sudo lsusb -v -d 0764:0501

reports:

wDescriptorLength     504

Warning: can't get report descriptor, LIBUSB_ERROR_PIPE

cannot read device status, Resource temporarily unavailable (11)

As a result, usbhid-ups is unable to reliably communicate with the
device and NUT cannot reliably monitor UPS status.

Kernels Tested

The issue reproduces on:

Proxmox VE kernel 7.0.14-5-pve
Proxmox VE kernel 7.0.14-6-pve
Ubuntu mainline 7.1.5-070105-generic

Reproducing the issue on an Ubuntu mainline kernel indicates the
behavior is not specific to Proxmox and appears to exist in upstream
Linux as well.

Comparison

The identical UPS, USB cable, and NUT configuration were moved to a
Raspberry Pi 5 running:

Debian 13 (trixie)
Linux 6.18.34+rpt-rpi-2712
NUT 2.8.1

On the Raspberry Pi:

the device binds successfully to hid-generic
usbhid-ups initializes successfully
NUT communicates reliably
upsc ups@localhost consistently returns complete UPS status, including
charge, runtime, voltage, load, and other telemetry

This behavior has remained reliable through repeated testing and reboots.

For completeness, lsusb -v on the Raspberry Pi also reports the HID
report descriptor as unavailable. Despite this, usbhid-ups
communicates with the UPS reliably. The communication failure only
occurs on the affected x86 platform.

Troubleshooting Performed

Tested multiple USB ports
Tested USB 2.0 and USB 3.x ports
Replaced the USB cable
Tested NUT 2.8.1, 2.8.5, and current development master
Tested as both root and the nut service user
Verified udev permissions
Verified USB VID:PID 0764:0501
Reproduced the issue on Ubuntu mainline 7.1.5

A Proxmox developer suggested this may require a USB HID device quirk
and requested that the issue be reported upstream.

Reference:

Proxmox Bugzilla #7850: https://bugzilla.proxmox.com/show_bug.cgi?id=3D7850

Please let me know if additional information would be helpful. I can
provide complete dmesg, lsusb, and usbhid-upsdebug logs or perform
additional testing if needed.

Thank you,
Jamie Stephens
