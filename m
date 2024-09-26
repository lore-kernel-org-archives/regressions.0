Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4743913BAFA
	for <regressions@lists.linux.dev>; Thu, 26 Sep 2024 14:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727362424; cv=none; b=ZO5yEB+msvbu8CCL0egbrVpI/khTS9FhTXEWELzzGDyHcnz2pnJWjiGUlFfcZodNDzRV1K3AIA/TLn/xbRx86uCsyDdhhp6LOadZiqhgMuBz10oplNKA5wPLdba/9m3Tt0H5pZiplzg5F5krMfWnRT6CTLR5daWXjQnlSoSDNg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727362424; c=relaxed/simple;
	bh=79CUvXXQEzLWmy7aBoCjyG05MpLOBJWsk6PgttOBDIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+Io820iFBMyMxm3YMqrZB0Qdc+TBb4xJrz00y7KJiFWXpyg5pd0uvqceYuVPflmIQOQ5lUf5oCJzqwvYzyKPXMxLYrVtFnatM9WTFmjdJqQBiLnEM890fJt+j+SQKnrCno7H0Urk5aXN3WX1m6MJ0lcBOBHLTv0FOUnzYXRwDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P08woj8s; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P08woj8s"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f75c6ed428so12269321fa.0
        for <regressions@lists.linux.dev>; Thu, 26 Sep 2024 07:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727362420; x=1727967220; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y91NulC7QRTVnN0dh/5ze7SVsOzL+3TRyL00hZ92QIY=;
        b=P08woj8sB0YEzy61ACtSiHRNOweOPe9g8eL2mSpboSw4ybKiZsrgvtYqz3wGUsC6fW
         YmXRJ2LuVS8b7G7/YI0gSU0fKHhrxvbqSHdwKGiyQMY4PaWLKCCMlzOQ7A3fRwW9fYZ0
         k/q+DA5aXm3h/o57nmP9lHWBbPyZDR8/oAmhTl7aY1JETPsrVBXX+JNvKVqnOTBUu3u+
         KHVGNqBbf2Lxk5fBRTbLD6zJ9fyH3rNrllT22vX5Wl7eZzqExUp0T1rSWiJyyQm5G/N1
         ssidGAXCc+/p3pGzyaZ0qVhNtuWjvr2qKckQix//SAH12/257bmxLadkEJexOAkdoUqo
         j80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727362420; x=1727967220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y91NulC7QRTVnN0dh/5ze7SVsOzL+3TRyL00hZ92QIY=;
        b=i2bZUqmd5NcSiJk5Npv2tm5ZGOcO2U88RfJQkk/SgWdXSEwkkvt0+BWB+lqrkFVBdI
         R/rJIhOEtAijVqZfzLgBoBsim7Psp5zQgZN7z6hL9mcJuHTg+XrhpmCV338FbHnpTJpk
         oUE6kZUUUH0xMoH49QZ1W8rZy+hu2aoesTBxBKGif6wwQft9BXJiTaIUUuV3ZaC3dp33
         KJ+SbIrxdAEZ5o3ZHCxCCGg2wnDPN6lb/P6DIrd2PmbtXLfoqLeX0tUgUbbWlTNHvWGa
         QpbjBDaYMoLzHLKUJs1thi4XQUzGV0zolMH7lkrwUPzk0i2VNk4/XmWXos7J1MeF2QCp
         SiiQ==
X-Gm-Message-State: AOJu0YxUuhDHi9r4UEuOEjM0PonkttbYmZZIU4u+hsMeRhTiRkxfk4AR
	z8uL0nXlGqrI/hiLtVHRQAoNZjFNVAaE2s7uGPuz+JyjcU/7A1eTaCGs5MYGkE16/kHDoq1AKcC
	cWx61JZy6PGyi/7DytG22URWwk3f7BmNd
X-Google-Smtp-Source: AGHT+IHIhnSg+cP/Fqowz2wiTX8W2FNsq9NPxmOou+y2u/0ClSyfAk7eRkkPc3SAVV0hkmaWQ8Vp02r7gGsp1lCf0to=
X-Received: by 2002:a2e:be8e:0:b0:2f7:64b9:ff90 with SMTP id
 38308e7fff4ca-2f915fc366bmr46845491fa.9.1727362419364; Thu, 26 Sep 2024
 07:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <af319b4c-2417-4f2f-85d0-e72d1c4fb2ac@leemhuis.info>
In-Reply-To: <af319b4c-2417-4f2f-85d0-e72d1c4fb2ac@leemhuis.info>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 26 Sep 2024 10:53:26 -0400
Message-ID: <CABBYNZJJ+28EvyEvDsVzZv6ZbZLhSkZ-tuDckAvNfR_=qCKVMw@mail.gmail.com>
Subject: Re: [regression] NULL dereference pointer in Bluetooth at boot
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Christian Casteyde <casteyde.christian@free.fr>, Chris Lu <chris.lu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 26, 2024 at 5:16=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Hi, Thorsten here, the Linux kernel's regression tracker.
>
> I noticed a report about a regression in bugzilla.kernel.org apparently
> related to the bluetooth code. As many (most?) kernel developers don't
> keep an eye on the bug tracker, I decided to write this mail. To quote
> from https://bugzilla.kernel.org/show_bug.cgi?id=3D219294 :
>
> > Since Kernel 6.11 compiled from vanilla source, I get occasionnaly an O=
ops at boot on my Lenovo Slim 5.
> > This is a regression.
> >
> > Kernel 6.11 / Slackware 64 (Slackware 15 + recent Mesa).
> > AMD 7840HS 16Go
> > When the problem occurs, the boot doesn't finish, but I got the followi=
ng in syslog:
> > Sep 19 19:57:15 latile dnsmasq[924]: no servers found in /etc/dnsmasq.d=
/dnsmasq-resolv.conf, will retry
> > Sep 20 22:22:29 latile kernel: ACPI BIOS Error (bug): Could not resolve=
 symbol [\_SB.PCI0.GP18.SATA], AE_NOT_FOUND (20240322/dswload2-162)
> > Sep 20 22:22:29 latile kernel: ACPI Error: AE_NOT_FOUND, During name lo=
okup/catalog (20240322/psobject-220)
> > Sep 20 22:22:29 latile kernel: ACPI BIOS Error (bug): Failure creating =
named object [\_SB.PCI0.GPP6.WLAN._S0W], AE_ALREADY_EXISTS (20240322/dswloa=
d2-32
> > 6)
> > Sep 20 22:22:29 latile kernel: ACPI Error: AE_ALREADY_EXISTS, During na=
me lookup/catalog (20240322/psobject-220)
> > Sep 20 22:22:31 latile kernel: i8042: PNP: PS/2 appears to have AUX por=
t disabled, if this is incorrect please boot with i8042.nopnp
> > Sep 20 22:22:34 latile kernel: Bluetooth: hci0: HCI Enhanced Setup Sync=
hronous Connection command is advertised, but not supported.
> > Sep 20 22:22:37 latile kernel: BUG: kernel NULL pointer dereference, ad=
dress: 0000000000000000
> > Sep 20 22:22:37 latile kernel: #PF: supervisor read access in kernel mo=
de
> > Sep 20 22:22:37 latile kernel: #PF: error_code(0x0000) - not-present pa=
ge
> > Sep 20 22:22:37 latile kernel: Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> > Sep 20 22:22:37 latile kernel: CPU: 2 UID: 0 PID: 153 Comm: kworker/2:1=
 Not tainted 6.11.0 #1
> > Sep 20 22:22:37 latile kernel: Hardware name: LENOVO 82Y9/LNVNB161216, =
BIOS M3CN42WW 01/11/2024
> > Sep 20 22:22:37 latile kernel: Workqueue: pm pm_runtime_work
> > Sep 20 22:22:37 latile kernel: RIP: 0010:btusb_suspend+0x14/0x1b0
> > Sep 20 22:22:37 latile kernel: Code: e4 10 00 83 80 d4 0a 00 00 01 eb d=
b 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 0f 1f 44 00 00 41 54 55 53 48 8=
b 9f
> > c8 00 00 00 <48> 8b 13 8b 82 bc 09 00 00 03 82 b8 09 00 00 03 82 c4 09 =
00 00 03
> > Sep 20 22:22:37 latile kernel: RSP: 0018:ffffbf1280b67ca0 EFLAGS: 00010=
206
> > Sep 20 22:22:37 latile kernel: RAX: ffffffffa62de3b0 RBX: 0000000000000=
000 RCX: 0000000000000002
> > Sep 20 22:22:37 latile kernel: RDX: 0000000000000003 RSI: 0000000000000=
402 RDI: ffff9bcc85e17000
> > Sep 20 22:22:37 latile kernel: RBP: ffff9bcc85e17000 R08: ffff9bcc8930e=
800 R09: ffff9bcc85e174b0
> > Sep 20 22:22:37 latile kernel: R10: 0000000000000003 R11: 0000000000000=
063 R12: 0000000000000402
> > Sep 20 22:22:37 latile kernel: R13: 0000000000000003 R14: 0000000000000=
000 R15: ffff9bcc8930e800
> > Sep 20 22:22:37 latile kernel: FS:  0000000000000000(0000) GS:ffff9bcfa=
e480000(0000) knlGS:0000000000000000
> > Sep 20 22:22:37 latile kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
> > Sep 20 22:22:37 latile kernel: CR2: 0000000000000000 CR3: 000000035f82a=
000 CR4: 0000000000750ef0
> > Sep 20 22:22:37 latile kernel: PKRU: 55555554
> > Sep 20 22:22:37 latile kernel: Call Trace:
> > Sep 20 22:22:37 latile kernel:  <TASK>
> > Sep 20 22:22:37 latile kernel:  ? __die+0x23/0x70
> > Sep 20 22:22:37 latile kernel:  ? page_fault_oops+0x159/0x520
> > Sep 20 22:22:37 latile kernel:  ? exc_page_fault+0x404/0x740
> > Sep 20 22:22:37 latile kernel:  ? asm_exc_page_fault+0x26/0x30
> > Sep 20 22:22:37 latile kernel:  ? btusb_isoc_tx_complete+0x60/0x60
> > Sep 20 22:22:37 latile kernel:  ? btusb_suspend+0x14/0x1b0
> > Sep 20 22:22:37 latile kernel:  usb_suspend_both+0x94/0x280
> > Sep 20 22:22:37 latile kernel:  usb_runtime_suspend+0x2e/0x70
> > Sep 20 22:22:37 latile kernel:  ? usb_autoresume_device+0x50/0x50
> > Sep 20 22:22:37 latile kernel:  __rpm_callback+0x41/0x170
> > Sep 20 22:22:37 latile kernel:  ? usb_autoresume_device+0x50/0x50
> > Sep 20 22:22:37 latile kernel:  rpm_callback+0x55/0x60
> > Sep 20 22:22:37 latile kernel:  ? usb_autoresume_device+0x50/0x50
> > Sep 20 22:22:37 latile kernel:  rpm_suspend+0xe8/0x5e0
> > Sep 20 22:22:37 latile kernel:  ? srso_alias_return_thunk+0x5/0xfbef5
> > Sep 20 22:22:37 latile last message buffered 1 times
> > Sep 20 22:22:37 latile kernel:  ? finish_task_switch.isra.0+0x96/0x2a0
> > Sep 20 22:22:37 latile kernel:  __pm_runtime_suspend+0x3c/0xd0
> > Sep 20 22:22:37 latile kernel:  ? usb_runtime_resume+0x20/0x20
> > Sep 20 22:22:37 latile kernel:  usb_runtime_idle+0x35/0x40
> > Sep 20 22:22:37 latile kernel:  rpm_idle+0xbd/0x270
> > Sep 20 22:22:37 latile kernel:  pm_runtime_work+0x84/0xb0
> > Sep 20 22:22:37 latile kernel:  process_one_work+0x16d/0x380
> > Sep 20 22:22:37 latile kernel:  worker_thread+0x2cb/0x3e0
> > Sep 20 22:22:37 latile kernel:  ? _raw_spin_lock_irqsave+0x1b/0x50
> > Sep 20 22:22:37 latile kernel:  ? cancel_delayed_work_sync+0x80/0x80
> > Sep 20 22:22:37 latile kernel:  kthread+0xde/0x110
> > Sep 20 22:22:37 latile kernel:  ? kthread_park+0x90/0x90
> > Sep 20 22:22:37 latile kernel:  ret_from_fork+0x31/0x50
> > Sep 20 22:22:37 latile kernel:  ? kthread_park+0x90/0x90
> > Sep 20 22:22:37 latile kernel:  ret_from_fork_asm+0x11/0x20
> > Sep 20 22:22:37 latile kernel:  </TASK>
> > Sep 20 22:22:37 latile kernel: Modules linked in:
> > Sep 20 22:22:37 latile kernel: CR2: 0000000000000000
> > Sep 20 22:22:37 latile kernel: ---[ end trace 0000000000000000 ]---
> > Sep 20 22:22:37 latile kernel: RIP: 0010:btusb_suspend+0x14/0x1b0
> > Sep 20 22:22:37 latile kernel: Code: e4 10 00 83 80 d4 0a 00 00 01 eb d=
b 66 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 0f 1f 44 00 00 41 54 55 53 48 8=
b 9f c8 00 00 00 <48> 8b 13 8b 82 bc 09 00 00 03 82 b8 09 00 00 03 82 c4 09=
 00 00 03
> > Sep 20 22:22:37 latile kernel: RSP: 0018:ffffbf1280b67ca0 EFLAGS: 00010=
206
> > Sep 20 22:22:37 latile kernel: RAX: ffffffffa62de3b0 RBX: 0000000000000=
000 RCX: 0000000000000002
> > Sep 20 22:22:37 latile kernel: RDX: 0000000000000003 RSI: 0000000000000=
402 RDI: ffff9bcc85e17000
> > Sep 20 22:22:37 latile kernel: RBP: ffff9bcc85e17000 R08: ffff9bcc8930e=
800 R09: ffff9bcc85e174b0
> > Sep 20 22:22:37 latile kernel: R10: 0000000000000003 R11: 0000000000000=
063 R12: 0000000000000402
> > Sep 20 22:22:37 latile kernel: R13: 0000000000000003 R14: 0000000000000=
000 R15: ffff9bcc8930e800
> > Sep 20 22:22:37 latile kernel: FS:  0000000000000000(0000) GS:ffff9bcfa=
e480000(0000) knlGS:0000000000000000
> > Sep 20 22:22:37 latile kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
> > Sep 20 22:22:37 latile kernel: CR2: 0000000000000000 CR3: 000000035f82a=
000 CR4: 0000000000750ef0
> > Sep 20 22:22:37 latile kernel: PKRU: 55555554
> > [...]

I suspect this has been fixed recently:

https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.gi=
t/commit/?id=3D6f3f7e9414834fc4210a2d11ff6172031e98d9ff

@Chris Lu perhaps you want to check since it seem to be hitting
something else related to btmtk code:

Sep 17 21:53:23 latile kernel: Bluetooth: hci0: Execution of wmt
command timed out
Sep 17 21:53:23 latile kernel: Bluetooth: hci0: Failed to send wmt
func ctrl (-110)


> See the ticket for more details and another oops. Reporter is CCed.
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> P.S.: let me use this mail to also add the report to the list of tracked
> regressions to ensure it's doesn't fall through the cracks:
>
> #regzbot introduced: v6.10..v6.11
> #regzbot from: Christian Casteyde <casteyde.christian@free.fr>
> #regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=3D219294
> #regzbot title: net: bluetooth: NULL dereference pointer in Bluetooth at
> boot
> #regzbot ignore-activity



--=20
Luiz Augusto von Dentz
