Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BDB4D6C34
	for <regressions@lists.linux.dev>; Tue, 22 Sep 2026 09:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070487; cv=none; b=LY25ScpNDJUE0xT7ElgRurNCOjGVO0cDwj2pasjATYfcYNxKOLo6OlNXkZsAcTeNGT06t38hstmo55PPP+uHNaWRc8QvzP9b0vnteItopBOUfE1VybLFNsTeduOxYWlB9hFPvD1AFryCOIy5iMLBMe3a1oi1Ma8IbL8M8aqqFNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070487; c=relaxed/simple;
	bh=cfbJaDAqXz0WpZfSPMzfJh60AKYaO81sYrd7ccCA7/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fGt0rL0qDvTR8voMcRbX3UX5uulxO43JnORpo3JTqJMC5dx57/9HD7uNznm8wEshVxX/h6Eo8MoyRe74zZQy+N61lw6Ny1b4LuviX3GUj9wiGWmlgJ6JyU+8qYiGS27bOf5s3v6Y07Kp+oW5V7OXILb+Vfq5B7lu/JmTfnam4cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=g3RorEFj; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="g3RorEFj"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 26EE85E6E6
	for <regressions@lists.linux.dev>; Tue, 22 Sep 2026 12:47:59 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id E27F65E712
	for <regressions@lists.linux.dev>; Tue, 22 Sep 2026 12:47:55 +0300 (EEST)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 9D34D2029CC
	for <regressions@lists.linux.dev>; Tue, 22 Sep 2026 12:47:54 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790070474;
	bh=V5kWROyU8WMPqbcO1XzcbkXzwkxqv3KwZW4+FIRHPa4=;
	h=Received:From:Subject:To;
	b=g3RorEFjWgBIp+Tyuh7L/ESjx+6rGLmmWnuuIx4I1t05LBKKObF0klazSi4+D/anZ
	 +VDw42vCbBbE7H++svq91ECpJzidbTlh1KEr1r9NCrLtC0WlCXK94N0sZK0NkyUKUq
	 JY/arWbA+nj7TZFjT/waFmq7ZHtSKtxPfCSAcr1Pbv3vzMiauxnatoHswBUIx3Cobl
	 cJotkvD6bllnRsfiJ6z/rh8ZvPqk2xt7x0vEGYDGXwyeYssGdKx3TQbiDw5gBy0z5x
	 LCZ12b4ETvfi0PI20VQC9lzfqj5gUT+IEHRRg3EuL++wPUyEOjQW1m/NncDYBLppwv
	 c3+VibJ6zqoZA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.227.140) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj2-f12.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj2-f12.google.com with SMTP id
 d9443c01a7336-2d747f05ffcso30374985ad.0
        for <regressions@lists.linux.dev>;
 Tue, 22 Sep 2026 02:47:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBxxhCqGlxkjbXRd6rd02LLSNuPtBasjZDfcoDS9q0cb3WhuEs6pI5x9E4uhcWHFewGlZ+HLVMMoJYOMJg==@lists.linux.dev
X-Gm-Message-State: AFuF++lKEcgNJjFePXR/MFRy+2z/1I0mJZxPcsNbGBLgy3g+RtH1QgfV
	iGct+oBvksacXAzmHY+0agLEyYpp+jJI6KjSItkKNs26ty/dHGEbuP27Y3kLBmh514TMwBtuXqT
	X+biraqY4dJx+DhQvr+LodBPXwP1F3l0=
X-Received: by 2002:a17:902:d4d1:b0:2dd:c168:c4e0 with SMTP id
 d9443c01a7336-2df60880ed5mr7396975ad.0.1790070473205; Tue, 22 Sep 2026
 02:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <05f99d32-652f-4107-8e2f-379393f614b8@slotpi16m74>
In-Reply-To: <05f99d32-652f-4107-8e2f-379393f614b8@slotpi16m74>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 22 Sep 2026 11:47:41 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFcBQkdR1SH-11S-pXsWW3GAxZBUbC5WotAOu8uzcDpEg@mail.gmail.com>
X-Gm-Features: AcwNN1XJ-HDn3RmVtXyvuyKedFAMAYzjGQugTPuqyidvv8yljdU8YUmVKOXpEfQ
Message-ID: 
 <CAGwozwFcBQkdR1SH-11S-pXsWW3GAxZBUbC5WotAOu8uzcDpEg@mail.gmail.com>
Subject: Re: [REGRESSION 6.18.48 -> 6.18.49] hid-asus: ROG N-Key keyboard
 dead, also in 6.12.y
To: Grant King <gking@serow.io>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-input <linux-input@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
 Linux Stable <stable@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <179007047485.336640.14714699043767944120@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 22 Sept 2026 at 03:34, Grant King <gking@serow.io> wrote:
>
> Hi,
>
> Resending as plain text; the first copy went out as HTML and the lists wi=
ll have dropped it. Apologies to those receiving it twice.
>
> The built-in keyboard on my ROG Zephyrus G14 (GA403UV) stops working on 6=
.18.49. 6.18.48 is fine. The N-Key controller enumerates, but hid-asus fail=
s to initialise it:
>
> asus 0003:0B05:19B6.0004: using HID for asus::kbd_backlight
> asus 0003:0B05:19B6.0004: Asus failed to request functions: -75
> asus 0003:0B05:19B6.0004: Failed to initialize backlight.
> asus 0003:0B05:19B6.0004: input,hiddev98,hidraw3: USB HID v1.10 Keyboard
>     [ITE Tech. Inc. ITE Device(8910)] on usb-0000:65:00.3-4/input0
>
> An input node still appears, the keyboard just does nothing. On 6.18.48 t=
hose two error lines are absent and /sys/class/leds/asus::kbd_backlight sho=
ws up.
>
> ASUS ROG Zephyrus G14 GA403UV, BIOS GA403UV.308
> keyboard 0b05:19b6 (ROG N-Key), usb-0000:65:00.3-4
>
> The culprit looks like d0754db7883c ("HID: asus: simplify RGB init sequen=
ce") in 6.18.y, a backport of 56d1b33e644c taken as Stable-dep-of: 02bf61df=
b44f ("HID: asus: fix missing hid_is_usb() check"). Reading drivers/hid/hid=
-asus.c at each tag, v6.18.48 has the old code and v6.18.49 is the first wi=
th the merged init path; it is still there at v6.18.52. 6.12 LTS has it too=
, good at v6.12.107 and first bad at v6.12.108, still there at v6.12.110. 6=
.6.y never took the refactor and 7.1.y already has the mainline structure, =
so neither looks affected.
>
> Before the patch, the N-Key branch ran the init reports and never called =
asus_kbd_get_functions():
>
> if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
>         ret =3D asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
>         ...
>         ret =3D asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>         ...
>         ret =3D asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
>
> After it, get_functions runs for every device and returns early on failur=
e, so the 0x5d and 0x5e inits never happen when it fails. That is what kill=
s the keyboard here.
>
> It fails because of a size mismatch. The controller declares feature repo=
rt 0x5a as 62 bytes:
>
> 06 31 ff     Usage Page (Vendor 0xFF31)
> 09 76        Usage (0x76)
> a1 01        Collection (Application)
> 85 5a          Report ID (0x5a)
> ...
> 75 08          Report Size (8)
> 95 3e          Report Count (62)
> b1 00          Feature
> c0           End Collection
>
> and asus_kbd_get_functions() asks for FEATURE_KBD_REPORT_SIZE, which is 1=
6:
>
> readbuf =3D kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> ret =3D hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
>                          FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
>                          HID_REQ_GET_REPORT);
>
> The device answers with all 62 bytes into a 16 byte control transfer, so =
it overflows and hid_hw_raw_request() returns -EOVERFLOW, the -75 above. Th=
e call cannot succeed on this device, which I assume is why the old code ke=
pt it out of the N-Key path. That descriptor came from /sys/bus/hid/devices=
/0003:0B05:19B6.0004/report_descriptor; I can send the whole thing if it is=
 useful.
>
> The patch says "There should be no functional change with this patch", an=
d in mainline that holds, because 0919db9f3583 ("HID: asus: always fully in=
itialize devices") had already moved the init reports into asus_probe() whe=
re a failed get_functions only warns. 0919db9f3583 is not in 6.18.y or 6.12=
.y, so there the inits are still behind the call that fails.
>
> So either revert d0754db7883c in both trees and rework the hid_is_usb() f=
ix against the old structure, or backport 0919db9f3583 alongside it. The re=
vert looks like less risk for stable, but that is your call. Separately, as=
king for a fixed 16 bytes from a report the device declares as 62 seems wro=
ng in any tree. Sizing the request from the report would make the call work=
 here rather than just avoiding it.

0919db9f3583 came after. You mean e82ae34af29e910 is missing that
increases FEATURE_KBD_REPORT_SIZE to 64, correct?

Antheas

> Alpine has what looks like the same bug on a ProArt P16, same error strin=
g, same controller, bisected there to the same commit:
>
> https://gitlab.alpinelinux.org/alpine/aports/-/work_items/18451
>
> That reporter only loses the keyboard before root is mounted, mine is dea=
d in the running session.
>
> Caveats. I am on a patched distro kernel (Fedora 44, Bazzite "ogc"), not =
a vanilla build. The function symbols in its hid-asus.ko match upstream v6.=
18.44's, so I do not think it patches this file, but I have not proven that=
. I have not bisected; the first-bad releases above come from reading the t=
ags. I have not captured evdev output proving no key events get through, an=
d the 6.12.y entry is from reading source, not from running it. The descrip=
tor was read on 6.18.44, but it comes from the device so it should not vary=
 by kernel.
>
> I can reproduce this on demand and have a USB keyboard for recovery, so I=
 am happy to test patches or build a vanilla 6.18.49 if that would help.
>
> #regzbot introduced: v6.18.48..v6.18.49
>
> Thanks, Grant

