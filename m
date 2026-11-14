Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794643103;
	b=pZNaHtdEs2XoFVLkSr0ui/mt8rdNeCP4QtPPeGvrXK6Y9Xq5qhzh6Sys51eCv72yAVlg
	 4gnidKGh9j+Ts/KJqH2NE/o4x2cFIRmpMdOozW4C/FsV/bSQQe6MvAtM/Nz+kZc3uT5xJ
	 noX03ytIbQ6ZabybXwejViOgcI2txJkZsk73Eppw+5GNrLST/OHZNefmVjxziQHkTkLjz
	 TEZ5qZILBk9BhpZJ2PUPGT75ktpAtsGWzAdTXG58JJ6IN3OjKlSGfb8touCuNj/VSLAi/
	 SMyZEy+MujNAZJLmfypyyCdRhavr5s5ky9p6dvdn0C6s798nYhQtpo/mwG+HT82uCGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794643103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=fH8xyR9GaPBsRxXtD1+NUn7yLY4DJpsFGBlspSqLDtE=;
	b=Y1Bi3biMmm7ivJUgrUl4ymGapnLMO3m837s3JyOzfwH6YbLtrHSHBiKMo5osTT58IkcV
	 SD9LHJNDSyp4yArHpkUn0sfENnEdv9aKlp1JMDHBokEihnmNnO8soFm+ifQaKGDOR7x/e
	 FHaCNFiwzkU5K+1sVDuUUNQL0KRFfUb86jnt7nhkqOrPQjI9ASamlDMfbHHKOKliLO1ZB
	 XpXtujcfZuEOLjqrcpA6rHEAMfQfg5YFKyfoFOd9ipZHFSqHklofwZor+sUOteEk1IIWp
	 UPnthfTGV1YL4dnAn8XOJFw0SXFLoGLOlWZrX+s5wXy1HiSDu4wLXw1uXSTLez1cukQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jVZcfZE8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFEC606A323
	for <regressions@lists.linux.dev>; Sat, 14 Nov 2026 07:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EFEC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jVZcfZE8
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f2f2edb19so227668585a.0
        for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 23:58:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794643102; cv=none;
        d=google.com; s=arc-20260327;
        b=Coajrsqyu8dDEn6pGMgvfOi+7X7zZbmPcPb5vXPfQIvFzMZT8ORASzHJ+dGCao0Y/b
         26R33NZZYNRZ6GdSMxiQNhll5SQ9i2eRPB804AUJRw69tVlM3bOqzY2JtHV/F3z2JNJu
         w9wIwilfcD2YpSL2PS4//4fy9QBqsXgm+NV6za0eoARSniRMcpyDUNdLZvge4XyNijC3
         AOkr4fz4gdJ8cjVDYLPjnEgh0it0DLh8gsjYVRiWTZOnxdom6RDuNmgEYZXSMkWqULTL
         UprYIvrP78W/FG4gn4xgTFTYMmcZsiACaEyvTu0HaTQbs6p7n86MUXgkqKE+Qfktujug
         XH3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fH8xyR9GaPBsRxXtD1+NUn7yLY4DJpsFGBlspSqLDtE=;
        fh=ktILtpnh8AXB+huSjgLqwIZrOXtEysOZDtRPFQjY1eI=;
        b=Yf+Uvhssvj9ZwCXQkBHLjBar89/Z4vxZoABkErrb4vY8V5cBuwgGzsgbspggrzrKA2
         bP25ULrqq1QPOzzOuxLFtRMqRwZzZiqoVTYE49jhpa5/Aila5Kv3EYy7K/0lWGjigBf7
         wZ/wiC6ZdB9olQsMsKKDnBpF/j6qepVC21YWMPaItnbbecbvSdjcb6et433/GI7s+ozz
         B+fHr8MqORkTLDe0IvniWc2XSZVESwFJVNJGo5KCikQ1gNzhgm1CfayofEI9wgW15c68
         w2BzMBLDtVfRZjiyd8GohNRLKjM/deTaxR8LKMDcHLENW3HmhdaCqIg5i5b+vjeg6YZk
         Q/Bg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794643102; x=1795247902; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fH8xyR9GaPBsRxXtD1+NUn7yLY4DJpsFGBlspSqLDtE=;
        b=jVZcfZE83SD89BnOqyJxhzCl+qKa+dspWvQ+PUvwvVuu2Cm8ewQPe1JJhJ4z0dfr+d
         sS5aYFaGVFdqPp5XnrIs76lhoKRdID/qEXEiouNAZjlmROEl5NuR5w4iKekH1YfPa+LQ
         jG7vG2uZbZ7cHukfKCA84nfKCZJm945uXa/7sxAgYJApqC3c9yLtG6xhBqQvZX+wkxjp
         di5XZ+/U7mGGG19AJedH/8ZaKtEVpzMANFVHeCBkS+RRVJ/IyNfoveZt7f6UQghebhJd
         xol0w+3b0rV0E0OpC72ghNkdH1rki3zl8mEdiJj0wGzwhdLPY2BhfFEluNtU+6dY6kLd
         OfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794643102; x=1795247902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fH8xyR9GaPBsRxXtD1+NUn7yLY4DJpsFGBlspSqLDtE=;
        b=2cF+uKLFluqM/N1bCOOOA07wKa113gMCoKRcEgZhIJaTUQxIX6oTKPNQ/9ZY263F4k
         X3HNJ7HDFq7cdUgY1DH7hGIMBMjaQAInezhBFwSm5ZrVpblBDLue91mp3YeukgqMuiLw
         9Aj41jXqnyVSjo+WkvZXcAjBJVSr8paQZVy3v56yZcEXBn+0VXClv3KcaPKHuXYvD1ie
         o9lXFKs8JzXvyHKE+zZogXAvoeUh/hPgz7TXlEqk6jz8TnVVdEpBCXSVRd42LZyvkNpq
         Dx/L9HLLwIfVkA+27llMjEw0TztcChzc5I8/Rs9L5ojDrPLTrTBICJaexQo6k1tFIEVO
         CXoA==
X-Gm-Message-State: APuU4Z/tTyJrbD71NLJGTPl0RvFt93az7xis/7fOe1tifZJOtf8YRluk
	FsQj7p8iKegSIuM2XvUN0/FyB5UXq2/g/lnYuWLygaz0g8u2r21XK866mxNhRduBd11F3DGeK9z
	yVbrnJa5oyDgtsn0sgBg8ksZ7ppTt4H4=
X-Gm-Gg: AYBFou1NvqQY+wlVO7B3AQbA5npZ2cypUMs6l30Azo2fW4nZdgxbMRALoWgYXqBcv3w
	HuBIyVSXbxXN2beIeGKyc7lhq7fX17vpJVv+FTwRyAaAv6tVHbnQ9Ik3B5Ym2rVPlXXmhw07m67
	LL1x/yiQdLR4G8tCRQry1cLpdzqRF7xS+6cb3KuM/8PRU7pmJ5L9cFbD7ZntCab9gHbWHyWGO8s
	Ow7a2jR75MXlBP+hBsGReLOYu4dmsoU8ADnRUkBk1Yl9xXE+LLowjQcPy0TS9MIkDa008ViP/Mn
	KL4N32KuDKDHD7I6wSiOe/KButocOb4SoYWH5oJxhSvUZjCpLlo4qkARe+gg5/HpUUOCUc/7I/O
	u8QHmRAxaTojX1vofmliuwZg4XeAVHldZlcD+0Mn1fEGzrqBqOJochUOtXir85CdqEVM3zvc=
X-Received: by 2002:a05:620a:4385:b0:949:6982:3f0c with SMTP id
 af79cd13be357-949698240admr49465885a.19.1794643102326; Fri, 13 Nov 2026
 23:58:22 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAMX8SmaXHh-dzH2n6pRhQr8q=iN=Ui7T3TC42e35LBUjvMaH1Q@mail.gmail.com>
In-Reply-To: <CAMX8SmaXHh-dzH2n6pRhQr8q=iN=Ui7T3TC42e35LBUjvMaH1Q@mail.gmail.com>
From: Ali Lin <alexlin901107@gmail.com>
Date: Sat, 14 Nov 2026 15:58:10 +0800
X-Gm-Features: AclHuK9OD-1dRkAk7hg2LVikoKEOpM6xeD9JXNxhkHhmRw2wcVilFf37-UWNvsQ
Message-ID: <CAMX8SmaVN0aghH4zmwn8nUg9y6Uz0JGovrTWTSD4Yngnfa3bmQ@mail.gmail.com>
Subject: Re: [REGRESSION] HID: Corsair K70 RAPIDFIRE interface 1 times out on
 Linux 7.3.4
To: linux-input@vger.kernel.org
Cc: regressions@lists.linux.dev, jikos@kernel.org, bentiss@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have updated the diagnostic Gist with two complete boot captures for
each kernel on the same machine, using the same Corsair Gaming K70
RAPIDFIRE keyboard (USB ID 1b1c:1b3a, bcdDevice 3.08) connected to USB
path 1-4 via the Intel xHCI controller at 0000:00:14.0 (8086:a36d) on
Arch Linux:

https://gist.github.com/Alexlin7/65e0705265c7c369d83f9d4a7515faed

Results (2 tests per kernel):
- Linux 6.18.63-2-lts (tests 1 and 2): Both HID interfaces initialize
and bind successfully with no probe timeouts:
  hid-generic 0003:1B1C:1B3A.0001: input,hiddev96,hidraw0
  hid-generic 0003:1B1C:1B3A.0002: hiddev97,hidraw1

- Linux 7.3.4-arch1-1 (tests 1 and 2): Interface 0 registers normally,
while interface 1 consistently fails to probe with -110 (ETIMEDOUT):

  Test 1:
  [   36.929333] archlinux kernel: usbhid 1-4:1.1: can't add hid device: -1=
10
  [   36.930375] archlinux kernel: usbhid 1-4:1.1: probe with driver
usbhid failed with error -110

  Test 2:
  [   36.929377] archlinux kernel: usbhid 1-4:1.1: can't add hid device: -1=
10
  [   36.930405] archlinux kernel: usbhid 1-4:1.1: probe with driver
usbhid failed with error -110

Additional diagnostic notes:
- USB topology confirms interface 1 is bound to usbhid on 6.18.63 LTS
and left unbound ([none]) on 7.3.4.
- Both 7.3.4 descriptor captures report LIBUSB_ERROR_TIMEOUT when
retrieving interface 1's report descriptor, and fail to read device
status (errno 11).
- The 6.18.63 LTS captures mark both report descriptors unavailable
(as expected while bound to the kernel driver), so those are not
complete report-descriptor dumps.

These captures confirm a 100% reproducible, kernel-version-dependent
initialization failure across two boots per kernel. I have not yet
identified the first bad kernel version or commit, and the logs alone
do not establish whether this interface 1 timeout directly causes the
lock LED malfunction.

Please let me know if additional traces, quirk testing, or a kernel
bisect would be helpful when I next have physical access to the
machine.

Best regards,
Weibo Lin


Ali Lin <alexlin901107@gmail.com> =E6=96=BC 2026=E5=B9=B411=E6=9C=8814=E6=
=97=A5=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=882:56=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> I would like to report a possible Linux HID regression affecting the
> Corsair Gaming K70 RAPIDFIRE keyboard (USB ID 1b1c:1b3a).
>
> On Linux 7.3.4-arch1-1, the keyboard works for normal typing, but the
> Num Lock, Caps Lock, and Scroll Lock indicator LEDs do not function
> correctly after boot.
>
> Unplugging and reconnecting the keyboard restores normal operation.
>
> The problem was not observed when booting Linux 6.18.63-2-lts on the
> same machine.
>
> System information:
>
> - Distribution: Arch Linux
> - Architecture: x86_64
> - CPU: Intel Core i5-8500
> - Motherboard: ASUS PRIME H310M-K
> - BIOS: 3204 (2023-12-14)
> - Keyboard: Corsair Gaming K70 RAPIDFIRE
> - USB ID: 1b1c:1b3a
> - Device revision: 3.08
> - USB speed: Full Speed (12 Mbps)
> - USB host controller: xhci_hcd
>
> Test results:
>
> Linux 7.3.4-arch1-1:
>
> - HID initialization timeout reproduced on two separate boots.
> - Normal keyboard input continues to work.
> - Lock indicator LEDs do not function correctly until the keyboard is
> reconnected.
> - USB interface 1 fails to bind to usbhid.
>
> Linux 6.18.63-2-lts:
>
> - One successful boot observed.
> - Keyboard input and Lock indicator LEDs work normally.
> - Both keyboard HID interfaces initialize successfully.
> - No corresponding HID initialization timeout was observed.
>
> Relevant kernel messages on Linux 7.3.4:
>
> [   36.929377] usbhid 1-4:1.1: can't add hid device: -110
> [   36.930405] usbhid 1-4:1.1: probe with driver usbhid failed with error=
 -110
>
> The USB topology on the affected kernel shows:
>
> Port 004, If 0: Driver=3Dusbhid
> Port 004, If 1: Driver=3D[none]
>
> Additionally, the USB descriptor collection for interface 1 reports:
>
> bInterfaceNumber 1
> wDescriptorLength 29
> Warning: can't get report descriptor, LIBUSB_ERROR_TIMEOUT
>
> Additional observations:
>
> On Linux 7.3.4, the HID timeout occurs approximately 36.9 seconds
> after kernel startup. Subsequent USB devices are enumerated shortly
> afterward.
>
> On Linux 6.18.63 LTS, the keyboard HID interfaces initialize at
> approximately 1.3 seconds.
>
> During one boot with Linux 7.3.4, systemd-udevd also displayed a
> stop-job delay in the initramfs shutdown phase. The system eventually
> booted successfully.
>
> I have not determined whether the delayed USB enumeration and udev
> stop-job observation share the same underlying cause.
>
> Steps to reproduce:
>
> 1. Connect the Corsair K70 RAPIDFIRE directly to a motherboard USB port.
> 2. Boot Arch Linux using kernel 7.3.4-arch1-1.
> 3. Observe that normal keyboard input works, but the Lock indicator
> LEDs do not function correctly.
> 4. Check the kernel log for the usbhid interface 1 timeout.
> 5. Unplug and reconnect the keyboard.
> 6. Observe that the Lock LEDs function normally after reconnection.
>
> Diagnostic logs:
>
> https://gist.github.com/Alexlin7/65e0705265c7c369d83f9d4a7515faed
>
> The Gist includes:
>
> - Linux 7.3.4 kernel boot log
> - Linux 6.18.63 LTS kernel boot log
> - USB topology
> - Corsair K70 USB descriptors
>
> The exact kernel version or commit introducing the issue has not yet
> been identified.
>
> The affected computer is located at my family home, and I do not have
> regular physical access to it. I can perform additional tests when I
> next have access to the machine, although hardware testing responses
> may be delayed.
>
> Thanks.
> Weibo Lin
>
> #regzbot introduced: v6.18..v7.3.4
