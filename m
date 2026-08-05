Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7679F27AC48
	for <regressions@lists.linux.dev>; Wed,  5 Aug 2026 00:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785888091; cv=pass; b=mJpZah84+svnvF5O7Er8wPW5sMcwbKe0qTD/RgUAKU3xI0Rju2NE5FPHdSSdsQGkE/0D4WBMMbpBZO0SuYgWOc/uqTDdecHU7qSdSeQFeFSgN4tveQnfLyWgLMsicP34uk1Jy99LISsDeBYRJi7GztyN7hNIP7MNQpjVLMDeQ3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785888091; c=relaxed/simple;
	bh=86K8uKiLATgTxa9IrfTr8hurJOunk82qbscdkmiHoXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PaTuXrkbqd7V1VvKp/r3vpqCRtWjSsGTg1CBvEJw0yfxrIoW0f8qBdoNazRJubIQ+DmKcY7Y5TbDcjXk7BzpThugazDHAsjkc7n0plk9CMN3RgJpSPj4j1jGGUoVFUfGhlIPpnOv9h57SXyBcmocHeJEWdJTtPWk+aQEqcuQ1T8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URmwGlYF; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URmwGlYF"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso4440355ad.1
        for <regressions@lists.linux.dev>; Tue, 04 Aug 2026 17:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785888089; cv=none;
        d=google.com; s=arc-20260327;
        b=REVgEXDrGX1DGeaPGKb1C79Y5ruuBcEvukIvSslYH31LAtXEqNxMR5fq0ASHVLI8kz
         u789bWclzBzHu3gAfDIXh0WnsnWENiFRi/BVIZzsGi8g15LejQS2PEbD58+C55K16AFy
         fZb8heIzIfKNfCplR/Gomjlky4b/yIdAIqr47uuiERjA5gL7wUMKesSTioRLD6oJAcTE
         0isyZp/yGujWfT5OBUSY1B095CXh2rNbhyGDYzIXSQSyxDYtrbAOIGnroGyzQJoJWzaY
         XL8kVsY6hy95IVsFA84OWHyTW/jH11P8/vro5YyvTki83e4uyTspFVHZ1Gc6YZ6p+5eW
         tjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NsdZbLvlXG2ntN+KudJSI+VASQm9D9JFdAQ63Uw/9rg=;
        fh=QvLCyr/EIQ+u4atGnOT/ns3rHT0uGlEBWbBTk2jAhGQ=;
        b=qr+wmrvxlQYwrf15k67kJLS1j/YsYENQKHlEvN3UHXfRe9KOae0ayqFPwiMV789WJj
         D9ID5gzbtpL/qI82m+QcxPTN6JSVdkvQ1cQqqlq18UiLF5JG/vjdNQyq0zi/BQ+E7hvG
         Yg/vgXXXqSbF6L1Y9CHz/S2rStBuAlVuyB4FMZSb8osBtMlYVaDpwbZK+4oIdLyVX/45
         H8gnMuxH+d31Ags0hKUjtNG92jw8Mo8KbmR/uwrHnajN1wjek/x3nCpjS2a3BB1LPjKc
         sa4lzKgBqjN+ZFEsnPHTKE4eRnEPtt49OrLDR0+6AaREBfxkM6uE3a2C/Q6GZks4xoYo
         D83w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785888089; x=1786492889; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NsdZbLvlXG2ntN+KudJSI+VASQm9D9JFdAQ63Uw/9rg=;
        b=URmwGlYFGplgSK5R4SumyA/+s0Bv5Vw8sGSFdN3pqqFwi1JNpE500mfWcTLU+ZoYts
         QUZTc1U/Er7X4jvUzIgVc5OsJozHJQs9MJIUpg3wvRrtN1VWzQCyM9FxtScshYZguF6l
         4H93wushIVH66wKipkhi4KLx13Uky//Axmvt29ABPcyx7yCWbQqpk9GSkQd1RXNqQsMb
         LbVZPnwPfEo431M6J+pLFZcRSHIvMwklbpNid9cI3kb6Eem6q586TLPejrxH1plqfN6S
         Hdm9T9iDhvB92c456XiDWQjb9vqpM8Vdc0GtJVSZwCAO0wwa5ZnUnIYJEXWetHbr+puu
         NnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785888089; x=1786492889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsdZbLvlXG2ntN+KudJSI+VASQm9D9JFdAQ63Uw/9rg=;
        b=HB+revg/FcO4sA+1v/2k7wYLC9FSTHidmWo5TTdGt28c8RiqVl0TWy1yV2lVol/CJG
         /qvVW4mqBoGFvPeGq7W1t5/C2Hx7qPYjYQXgXZgVcjijxOX23qN5Cw/chDo9F2EIEOUK
         XX3+78PmDyVi+cGi+QklwrlmmriMyhZOkvz8otNSgE1ZuKN9lP/EwyOHQ3TjXmW+c4UX
         8WPeve+Dq66GlOhxDKvCm2np/8enjP73KcAmziQr/Uzs50S+0QqTrGOO7w40NwW7A+Sl
         aGbA5PWdIDP4BnEsiDGisUyetnVoE/B4kwdKaJ74Uc7m8GJtF6tkn8PnU3X5yXpwuCrO
         Gq+A==
X-Forwarded-Encrypted: i=1; AHgh+Rp87idf5toGOlskN1pyxVjLipGPmIj198EGlrMsv993g8bKWuhIEctSMqV6tSMVNXKkHekL33dJvEZPog==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRcns6C4noIi1E+ylUSly/l+ct0/bvW0zIBPiMrhYhki6h+rls
	ZWcXzlM7q+ESDaFK5C3jB6yc9hxPRzz4ReiCNs2P/gvfu3YDzV1XW7At89ZA0HZRxV/SSOqVejM
	aM9gcwKPdzoZbgwkMZ9WvojA5gauWhyY=
X-Gm-Gg: AR+sD11k/zKIDWbyr9GihRR37CNlR6Ik9/dKbOi0rrZu18HUhby7C4fPEMTyLwibWN4
	VYlAw2U5qwcrEOvyHuAYy1r9EiPxpaJyMDBcJyq+/A96hRJS010kyI3BkYWuJE7B5XJoQuP9ZBs
	55IdnxHYZeS6Qj2gUZ6ks7y6lxUme86eYhrRDOpSHazt7N5u+Mk6eDnAJ7SE4g5NS7Kc/OSuzF9
	CCzOsO9wtkp3WVOrkO3Ow7aPJyYe6jisIQJdyXZ8VNpIt1ksoasK1GM1Tks0AXWwIXt20lDsF5Q
	0XnWdEdduUguBZgcnx4dzBGO0K7HGdjxIHiKC6VIZ0PzCws6ltsxkWehcgvgR6l5DfJR2J4Mcow
	kPo1/CAq62rAjegZR9R7wGbMn/9DNk/Z2HYhKfXWV+Q5QIim/wjm8QNDoHcC7
X-Received: by 2002:a17:902:e84b:b0:2ca:e5c:7fcf with SMTP id
 d9443c01a7336-2d0ca7b5490mr23513245ad.3.1785888088568; Tue, 04 Aug 2026
 17:01:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
 <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com> <anIhyHL4Kl-DX2G_@eggarch>
In-Reply-To: <anIhyHL4Kl-DX2G_@eggarch>
From: Jamie Stephens <jamie.stephens@gmail.com>
Date: Tue, 4 Aug 2026 20:01:16 -0400
X-Gm-Features: AUfX_mxwyh_MML33tokD_7o_JuJogH0BhSC8wEjmWkVQTWtJhzWv662Egc00qSY
Message-ID: <CABWMpWQEfycicrctrW3RD1yNf0rv1ZrioY9FcjoZZGEz4GAm_Q@mail.gmail.com>
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
To: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, regressions@lists.linux.dev, 
	gregkh@linuxfoundation.org, stern@rowland.harvard.edu, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lovekesh,

I have now tested 02-resume-reset.patch separately on Linux 7.1.5 with
the CyberPower device 0764:0501.

The patched kernel was active:

  7.1.5-ups-reset-resume

The device was detected by lsusb, but USB initialization still failed:

  usb 1-3: new full-speed USB device number 4 using xhci_hcd
  usb 1-3: New USB device found, idVendor=3D0764, idProduct=3D0501
  usb 1-3: New USB device strings: Mfr=3D3, Product=3D1, SerialNumber=3D2
  usb 1-3: can't set config #1, error -71

The UPS therefore never attached to hid-generic and NUT could not use it.

I then returned the same USB cable and UPS to the PiAware NUT server,
where it immediately resumed working normally:

  ups.status: OL
  battery.charge: 100
  input.voltage: 122.0
  output.voltage: 122.0
  ups.load: 23
  driver.version.data: CyberPower HID 0.8

Results so far:

  01-no-lpm.patch: did not resolve the regression
  02-resume-reset.patch: did not resolve the regression

I will proceed with the requested git bisection unless you would like
any additional targeted logs or tests first.

Regards,
Jamie Stephens

On Tue, Aug 4, 2026 at 2:56=E2=80=AFPM Lovekesh Solanki
<lovekeshsolanki00@gmail.com> wrote:
>
> Thanks for the report,
>
> On Thu, Jul 30, 2026 at 03:28:02PM -0400, Jamie Stephens wrote:
> > sudo lsusb -v -d 0764:0501
> >
> > reports:
> >
> > wDescriptorLength     504
> >
> > Warning: can't get report descriptor, LIBUSB_ERROR_PIPE
> >
> > cannot read device status, Resource temporarily unavailable (11)
> >
> > As a result, usbhid-ups is unable to reliably communicate with the
> > device and NUT cannot reliably monitor UPS status.
> The lsusb failure and NUT seem to be seperate, lsusb failure could
> simply be device property.
>
> Few possibilities I can think of worth testing:
> 1) It may be related to LPM, the device may be advertising this but may
> not be handling it properly.
> 2) Commit 8020c41b39f5 (usb: core: allow ACPI-managed hard-wired ports to=
 power off)
> lets acpi managed ports be powered off even if hub does not advertise
> power switching. The UPS may be sitting on such port and its power could
> be cycled out and leave it in a stale state.
>
> I'm attaching two patches to see if they have any effect, please apply
> and test them seperatly and let us know the results.
> And, as per Thorsten's advice above, run git bisection regardless.
>
> Regards,
> Lovekesh
