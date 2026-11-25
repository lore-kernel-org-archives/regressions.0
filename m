Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795625223;
	b=29qjfoVyc0ygWaGJa0jLJvv0a283CKaJtRlkSiU1EIQXrzpQMlVktGX4wMMVWVG4cGG6
	 tABX8fUkLtC9cOeknk19QFKOvsMMuwq0lfzRmWQViO43GrpBUHpvMBCjkhZJPNEDZIcbs
	 UXvqFzygVIUTJV92Ra0OYJPH+BcvHwqxb1hQDEQX9oG5frFLezB4XJQPkX7HrpeHevtmB
	 P66pWdop8hsANsXNy+teiSICp7tq9sUzKVDKzKVI3fNhuP44vyL+7n8tGu8ngfIOpEu+R
	 HPw3aBd41kaF7SNuT5+iLaBtmTh2D1roDHGT1PgMsWhgqkf4YeWIW7Us38qtTK5+RCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AShdtrHvNaEwqIheqlFySuHF5NlLfzwjwhTuC38bcb0=;
	b=3R/lggNw9rFhbn7nnFgeZKWTzbMUE11YlB4VQWOjvF3BQ1yyr0NmsT9y111IPmjQG5bF
	 U9+mYR+ikVlvSG2088/SOzBluy238Z7aMbN2zGTP3f7Z4UOjWB1VUmtrrPOVGYHfuRFw2
	 wB3jUgO/tPibKhM0i/UbOF6sqVoWFvUngewbJgkCHYh6+dyznWqnD6g2a8zC/ERbs0tJI
	 P8SLWQRKXcKWvlycVbiVGkOwGJOQrCwhFrN1Q6VyM88Inv8V41hGrDadWTH0mzawLk52T
	 E1DJm2eI0DYn+RUyuDjNXpbzO4nzQW0oivBtZucwmJNj/He6r/JdSb+tkDi2OyoS09g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FpUUUqsR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2929D606A326
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 16:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2929D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FpUUUqsR
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f04b676219so33619785ad.0
        for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 08:47:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795625222; cv=none;
        d=google.com; s=arc-20260327;
        b=NnvzhmbGFvjk9J4prt5Jvhgf86EWLJFThRei/32Rns0zNA5A/NmJuCW0rVc8oKLWG4
         TjnqKXXdgrqWw3N8dSEikrWbfwSX9RC3EW0O98wrnWXmtx3uzToxOg7oJdE4AJiCdy/G
         5JBjigt4Pe2HZbfPx5PxixBuOfT7VVX8DFPLTJlRz/LHEo0fluOp6fSSlqNhrf+usfix
         BcF0NEfGtEDC08G7Hl3XdjDIs2mwoCB7MfD7IUfzGTCYIwjyuVGBliEmO1BRPIwqVRGM
         R8l70LdwRiFJMR30+4HaOHz6KDrutu08lajKcabihWSfmOg6+4UW+S352U+w5rNwws1k
         RxeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=AShdtrHvNaEwqIheqlFySuHF5NlLfzwjwhTuC38bcb0=;
        fh=bFxA5Xhsh1qtVo2Qb9ruO1tQu7Ql7UM6Pw1eYohbo2A=;
        b=Ll4RvGffFUvIM9Q/EfF2KhIuZUPpA4tpRWBsJofuzULSg/lSa1BB12wfDpYbNoL7B0
         pk46w9C+TCQOO0xFMzgzsoprKZTTtOg4zmsEaKbOKICOInfKW/kFod4A+eaBoWq/1/1t
         +cnhozF96lcKzm2k2/uGA2D+Osjd63UD0WT8Yc8/HYjbXSJfOGIGGEJsNlhC1hoUzd+K
         qhh18XPiKP3NO3WuoOety4eC5yMCK2Zx8T9dQmooCV/n3CzRys/7dbWCPWGsxbaUuzT/
         MAldwZ5kXKbv26n5sbW7yqBEh5x2P1YIYDpFRQ0AgXJHAJtqt4kAoNVD9yWM7CvctJDx
         D9/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625222; x=1796230022; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AShdtrHvNaEwqIheqlFySuHF5NlLfzwjwhTuC38bcb0=;
        b=FpUUUqsRiSG12uKyHzF3ANUXX7dP39XklLdgJrhIY5BrSpCLUGXMEqDXdCxdaa9p2g
         Jg4ROJ7kBj2mPp2+akfNlYvuJ8cM0gHhEqNDpFYYWfffllXabn1zOQc/zT67lVLdnXyI
         yzgJTmuJDht/or1RXmdyNOJodx+vjITH5mmxxnNvt8uL4Ux8EQlufdSUKDKeMlrHknKP
         kRKwmfK15gWIU3XpNfsXEnlmtM43+wrlmGGcTAzayj08wyVMD2ua6DeWW4oCAvhxYp5d
         RZ9IRfoHP3fX+EKIrJYITUtClGGAZpteZ7z9TybypNQixbC5Gm9nBmYwxdQQLuZRRt5M
         vQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625222; x=1796230022;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AShdtrHvNaEwqIheqlFySuHF5NlLfzwjwhTuC38bcb0=;
        b=DoxWjnNi5KdP+TdLmNokN6r+CvZ9SgBz1TL+yyUHC0P/fiETCQmYBdkdyNVKn+9wl3
         06YMgF8BIp0+riI730hHbM27XqVe/wCGmpR148xA6bOStU4p2AgDkU++BJ5z5DNgo0uZ
         ymUYOUXALcTlAgMCPdRajlUC4bvZ5olpywxxMEiddp2+QNqR/SIEITWCoZaKB3nXQlGB
         BqIW4XrdXIlWazcchViz1Ofm6MUdLfqQgz0zM/XBkM/AUXscBtr/8c3H+yOGIjhge+yZ
         c27rPLkG0+fML7ovqtrav4PLlIX/PdCt6iGKBTRupXIyFDuUBiNsJ7KYL/C0yoo/cIRp
         wbog==
X-Forwarded-Encrypted: i=1; AL+hErEjc4jh5Tw6BelX/BjBFx2/tFxsvt1iF+XOZCgmUAPewy2uhJDq3+eQ5hqvY6//ccyGXo21fm8elv9q3Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9yZuAKw6x8JSbMcdnThjLwESB8eT1L7yUsQ0VkMke8zpSTI9HY
	+C4t4RpaFbzgNAmbpZsw1jM/NnKiIM/47CUf2kmL+qIFQWfJIJk+7WYHtwxqjY/GSflSxrl4CY6
	Pz4icg+7Sao1T6Irh47dMy9bVmmnRZJQ=
X-Gm-Gg: AZFdTZe9AgIE1X0tk7G0JMFHHhC0qM79IY4rIaxh/I0AXL/Bq0aCNrGi5dQPc0bkY2q
	3Xd3j89LHSdYafG4fnUwkKoTrZt7aG8ZlZmqXR/+mwINzJFIgCJQ4JiZEXr6OCvW33Z8p83+fWL
	kX+vxy8apaqh5prpzboD75vJBRGYBOwHJ7nC5YQrUk/B/NIKvLhtC8Ex1lJYjqa5pDjJlgKLrBs
	3hvF6pMYbXCflFbVtF4gwSBPx6cLJf8xihAGCCd5maGzfQl4hr8+HvrGyZjxK5EDz+GwoxnOQec
	nnyWJemQtkZispjjp/pG7RufB2XgjjM/WjDmUx13tSNTUGf6/hYZt4ItMjCSYf+Qf3tkKPAQx7/
	RrqQDiObXzWNcExcfhBBER/rUdKc0sTLU
X-Received: by 2002:a17:902:ecca:b0:2f0:4e5d:ff9a with SMTP id
 d9443c01a7336-2f04e5e0119mr149933095ad.55.1795625222273; Wed, 25 Nov 2026
 08:47:02 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 25 Nov 2026 10:47:01 -0600
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Flavio Giacchetti <flv.giacchetti@gmail.com>
In-Reply-To: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
References: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
Date: Wed, 25 Nov 2026 10:47:01 -0600
X-Gm-Features: Aa3M54qfON0_W-XuR0c3kYvZ0LE9PvCxw6i2-OaWxsTgsI7rmm0dwB5QEokQNW0
Message-ID: <CACKiate5HP20D6StbQk9S2Z4bdLne=FBtOPLh8-SK8529L7EoQ@mail.gmail.com>
Subject: [RFC PATCH] USB: cdc-acm: skip the Creative Sound Blaster X3 ACM interface
To: linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fedora 45, one Creative Sound Blaster X3 (041e:3264, bcdDevice
10.90) fails to register with ALSA on 7.3.4-300.fc45. The kernel
binds cdc-acm to interface 1 around the initial disconnect. The
audio driver subsequently gets timeouts while reading sample rates
and mixer controls. Audio works on the previous Fedora 7.3.3 kernel.

Apply IGNORE_DEVICE to interface 1 of this USB ID so the audio and
HID interfaces can still bind to their own drivers. A normal boot
with this quirk restored registration and playback on the affected
system. This removes access to the X3's ACM interface on Linux.
Its role in vendor controls and firmware updates needs validation.

The first bad upstream commit has not been identified.

Signed-off-by: Flavio Giacchetti <flv.giacchetti@gmail.com>

---
 drivers/usb/class/cdc-acm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1775,4 +1775,9 @@
 static const struct usb_device_id acm_ids[] = {
 	/* quirky and broken devices */
+	/* Creative Sound Blaster X3 */
+	{ USB_DEVICE_INTERFACE_NUMBER(0x041e, 0x3264, 1),
+	  .driver_info = IGNORE_DEVICE,
+	},
+
 	{ USB_DEVICE(0x0424, 0x274e), /* Microchip Technology, Inc. (formerly SMSC) */
 	  .driver_info = DISABLE_ECHO, }, /* DISABLE ECHO in termios flag */


On Wed, 25 Nov 2026 10:46:58 -0600, Flavio Giacchetti
<flv.giacchetti@gmail.com> wrote:
> Hi,
>
> My Creative Sound Blaster X3 stopped appearing in ALSA on Fedora 45
> after the update from 7.3.3-300.fc45.x86_64 to 7.3.4-300.fc45.x86_64.
> Booting the previous Fedora kernel restores audio on this PC.
>
> Hardware:
>
>   USB device: Creative Sound Blaster X3, 041e:3264, bcdDevice 10.90
>   Host controller: Intel 600 Series xHCI [8086:7ae0], revision 11
>   Connection: rear motherboard USB port, enumerated at 480 Mb/s
>
> With the stock 7.3.4 Fedora kernel, the failure reproduced on two rear
> USB ports. On one failed plug-in the kernel enumerated the device,
> bound cdc_acm to interface 1 and then logged a disconnect. After
> re-enumeration, the USB audio driver repeatedly failed to query sample
> rates and mixer controls. The X3 never appeared in /proc/asound/cards.
>
>   cdc_acm 1-12:1.1: ttyACM0: USB ACM device
>   usb 1-12: USB disconnect, device number 7
>   ...
>   usb 1-12: parse_audio_format_rates_v2v3(): unable to retrieve number of sample rates (clock 33)
>   ...
>   usb 1-12: 13:3: failed to get current value for ch 0 (-110)
>
> An experimental cdc-acm quirk skips interface 1 for 041e:3264 only.
> With that module on the same 7.3.4 Fedora kernel, the X3 registered
> with ALSA and played stereo audio at 48 kHz. The first hot-plug test
> still logged errors during re-enumeration, then recovered. On a
> subsequent normal reboot with the patched module installed and the X3
> connected, ALSA and PipeWire exposed the output and input, and the
> earlier rate-query errors and timeouts did not recur. Playback worked
> after the reboot.
>
> This is the result of testing one unit on one host. I have not isolated
> the first bad upstream commit or established what functionality needs
> the ACM interface. The results so far are for Fedora kernels.
>
> Would a device-scoped ACM exclusion be appropriate here, or would a
> comparison of USB traces with and without the ACM binding help narrow
> this down?
>
> Thanks,
> Flavio
