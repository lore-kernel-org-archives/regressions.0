Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DD62D5C68
	for <regressions@lists.linux.dev>; Fri, 28 Nov 2025 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764317151; cv=none; b=dW0sf7IBq/yngeqyMJN80UcsejMCf2Mv/KzXxjcvT6htfTy14slhsYJtw2Y9dolkVTCS73oYLA3ygGY5Lc9s/SpYCOLIQU6POsV855SsEkqPPNtFnRizz15uI2OHq4ikJuuriUIX7my8XWOizudQEyrZlainKypUAJyDFRJsDmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764317151; c=relaxed/simple;
	bh=FPIIUOyTg8pGSe3VMid6kL7fnIsGm87S00jz238lCJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oOTQqr5PSU6eSlwdup8IkGh/vhjbOZC9viLkF23c41OQI5txSQmoY7M74F52AbFYNlZ8e+2Zp8z4oOf8AgjPnCrvPGcyO+UkZBQBpMfxaDRSrayXDVDWaeKJi276gptj467HB6iZN2Z/rI1fxaY3xCxHNvSzXYDadSSYFg+DCjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S7YiAuMP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S7YiAuMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764317148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p3QLe2XaO0RWFOq1Znr3L5adsNAtxbfgecqm9jeMni8=;
	b=S7YiAuMPMZ3mWeZHXHw99dh4JpsNdOp8v5mmvvCuDreR4ceaLjRcAnDh009LdgmUdxNfRY
	AxTnba+j/1oZk4pieSNxpeloajPAJCTxQD9UQg2DCc2SUSpXFuf6UkT45SH34QUqIvJoDr
	TP+8qkg5vfowhsdlqYMzHK4OplQNPUs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-T_H8wrb3OnWwwnBCbY8Sxw-1; Fri, 28 Nov 2025 03:05:46 -0500
X-MC-Unique: T_H8wrb3OnWwwnBCbY8Sxw-1
X-Mimecast-MFC-AGG-ID: T_H8wrb3OnWwwnBCbY8Sxw_1764317146
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b73599315adso118847366b.2
        for <regressions@lists.linux.dev>; Fri, 28 Nov 2025 00:05:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764317145; x=1764921945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p3QLe2XaO0RWFOq1Znr3L5adsNAtxbfgecqm9jeMni8=;
        b=SKgNtWQOX31zjKleRkDz3N4COogI8D3BPdfdiMNH6igA6pq7wfaHKZIZ01t52+4IrV
         K9ZeHkcUzMucXDo6/R/QacU2kGnDhRmbBznDyEO5VUuZ42dkaBhzY/SK/DB8T6WITQVG
         xcX7z+WkJpndbHdGuE3q6aOsmNxq0LMrNQHYPBJGp/xfxG3TI013uZMCR0q8mSgdeyEw
         mlFYiDi4KcWP2UrT3VKaqrWvjXCh85f/CgDRcnahH4ojR/oMSam6Nscw/sCcTSdR48VE
         bjr2YmWGUl+VpNx5xMwJYmKeQQYMz17Gst8qJdFy6W6XSSULQEk8VwtJklDTIOARn92o
         Cf5A==
X-Gm-Message-State: AOJu0Yw09C17LBG/LCs2mmIYocQb6b1T90XasmUCrMkGd8d6QNvCZkrt
	M3ugSFeZTgWRam0aZyJFfBcKLtz2B1bNXtE3EimCOH82AbMspgC5yBaXwfg2QwIUaoeAYxidfG2
	PMHgIu7bgLYWXIcWk6aDkf3Vf3QQEM8YgjAL4GPQrGyCanUPJAcTlSXayOEe+8MicLyl4UTv87G
	SPIro4bmhkKtFSVrNsKPCmjKbmQFMwQSFZ/tiYo3c=
X-Gm-Gg: ASbGncspWdDBAvM9bbl+2zF4U2+SCQ1oKyNCkYGi8dItxdps5mzMxwPtPFCtzETt5Vz
	ET8n1c3vOnYtwPQ6rmiJDIDdrX5nFBRfMYIEuoNZ40q9JsxzArkScZKqEWgQC8tkbPzIig8Ftwo
	J9bhiDtPO3JpHUYYIOxaNwhZvIG2j+jqpQ4AWZDD9AMxdSoRwBkzgW+Oar0M0biRBh9Cpf3YPtd
	Lfg
X-Received: by 2002:a17:907:970d:b0:b73:8cea:62b3 with SMTP id a640c23a62f3a-b76c555d4e4mr1585063466b.41.1764317145502;
        Fri, 28 Nov 2025 00:05:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKK0ygpmbqqehPl2TIRSD7djKwvPkm+PmaYUeeZWjX873/DUZ190EeXFzXWzQKSZKNDymJ9vPo1YTZbY7aFJ0=
X-Received: by 2002:a17:907:970d:b0:b73:8cea:62b3 with SMTP id
 a640c23a62f3a-b76c555d4e4mr1585059566b.41.1764317145083; Fri, 28 Nov 2025
 00:05:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMBhvbYA=onQkkcgkODaTj=+tkybwo28Cdi6P3vodGpVZi8OVA@mail.gmail.com>
In-Reply-To: <CAMBhvbYA=onQkkcgkODaTj=+tkybwo28Cdi6P3vodGpVZi8OVA@mail.gmail.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 28 Nov 2025 09:05:33 +0100
X-Gm-Features: AWmQ_bkLgWKix4gnWAJoUAVbND5jxAoYl0f5o50yL4aev8Kz282JnEE0s8Yv9uc
Message-ID: <CAO-hwJJRisVpZWeSA+3_fLaa8_52f7ypUocDcD+PojuF3KjHYw@mail.gmail.com>
Subject: Re: Regression: SYNA3602 I2C touchpad broken in Linux 6.17.7 (works
 in 6.17.6 and previous versions)
To: Vijay <vijayg0127@gmail.com>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, jikos@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C5sGXdzt3KDzD9aYWJ2PSyt8gODk5atjj8bG7PYfbQ8_1764317146
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 28, 2025 at 7:40=E2=80=AFAM Vijay <vijayg0127@gmail.com> wrote:
>
> Hello,
>
> I would like to report a regression in the Linux kernel affecting I2C-HID
> touchpads that run through the Intel ISH + DesignWare I2C controller.
>
> Hardware:
> - Laptop: Infinix Y4 Max
> - CPU: Intel (13th gen core i5)
> - Touchpad: SYNA3602:00 093A:35ED (I2C HID)
> - Bus path: SYNA3602 =E2=86=92 i2c_designware =E2=86=92 Intel ISH =E2=86=
=92 HID
> - OS: Linux (Arch/CachyOS)
> - Kernel config: Default distro config
>
> Regression summary:
> - Touchpad works perfectly in Linux 6.17.6 and below versions
> - Touchpad stops working in Linux 6.17.7 and all newer versions (6.17.8, =
6.17.9, etc.)
> - Desktop environment does not matter (Hyprland/GNOME both fail)
> - The failure happens before userspace loads
> - Touchpad also works fine in Linux 6.12 LTS
>
> This is a kernel-level regression introduced between:
>     Good: Linux 6.17.6
>     Bad:  Linux 6.17.7
>
> **Dmesg logs from broken kernel (6.17.7 and newer):**
>
>     i2c-SYNA3602:00: can't add hid device: -110
>     hid_sensor_hub: reading report descriptor failed
>     intel-hid INTC1078:00: failed to enable HID power button

Looks like i2c-hid can't even communicate with any I2C device, so this
is slightly worrying.

>
> And the DesignWare I2C controller logs around the failure:
>     i2c_designware 0000:00:15.0: controller timed out
>     i2c_designware 0000:00:15.0: lost arbitration
>     i2c_designware 0000:00:15.0: transfer aborted (status =3D -110)
>
> These errors appear only on 6.17.7+ and not on 6.17.6.
>
> On working versions (6.17.6 and 6.12 LTS), the touchpad initializes norma=
lly:
>
>     input: SYNA3602:00 093A:35ED Touchpad as /devices/.../input/inputX
>     hid-multitouch: I2C HID v1.00 device initialized
>     i2c_designware 0000:00:15.0: controller operating normally
>
> This narrow regression window should make it possible to identify the off=
ending
> change in either:
> - HID core
> - I2C-HID
> - Intel ISH HID
> - DesignWare I2C controller
> - ACPI timing changes
>
> I can provide:
> - Full dmesg (working and broken)
> - acpidump

Are you running on a full vanilla kernel?

The changelog between 6.17.6 and 6.17.7 is rather small, so it should
be easy enough to bisect and get the offending commit.

I have my suspicions on:
f1971d5ba2ef ("genirq/manage: Add buslock back in to enable_irq()")
b990b4c6ea6b ("genirq/manage: Add buslock back in to __disable_irq_nosync()=
")
3c97437239df ("genirq/chip: Add buslock back in to irq_set_handler()")

Because anything else is unrelated to any component involved in i2c-hid.
(But that's also assuming you are running vanilla kernels without any
extra patches.)

OTOH, I've booted a 6.17.8 and 6.17.7 shipped by Fedora and I don't
see any issues related to i2c-hid, so those 3 commits might not be the
culprits.


>
> Please let me know what additional data is needed.

Can you do a bisect between v6.17.7 and v6.17.6?

Cheers,
Benjamin

>
> Thank you,
> Vijay.

