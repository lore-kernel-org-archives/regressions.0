Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB1074E33
	for <regressions@lists.linux.dev>; Fri,  9 Feb 2024 16:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497404; cv=none; b=el5bB2x4yv0kOnFNMVocPKCfsbOKjOow7jHwOVcUNq8W2anIgUECRXaf6WEV/lfguH6rEy4FpIwp+cgAAnA1slWwN6Gk9MG3IuknBNWz+YnyJ3ioec+fgVDgkhsTPeuKo404qZfwXLG8VGpevucqtwWJYa9yNuHzl2/TPNZBlWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497404; c=relaxed/simple;
	bh=lcEncMjWx1cHj3mi+d6/pRmr14bUoDw+wvvYprditqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbePpbj74JH+aVyARILMQNyQwS7YOmH1jc5++8HhujdW3eSJ6EDBZXgCMSxljmWloNXB/IvtjsRUvsuyCs8mv4W3cLefSjs6kXLx4JIC4oYxE2psW7aRN+Ku1qJVpZV74PnmAhYFt7cMH5ZHROA9QoNstYKFgPIKPsCMyL+rTTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=huopN3AH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="huopN3AH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707497401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iv56PqPnsvTXTwarveHsnRnFq5SGF+BFGaQ7j/GRxRk=;
	b=huopN3AH0CGe1fN7lpVFAmoVawQTr7MEbV04Lf27vCCKXwQIQcrBaDFcPSWMO9Rp7FqpLQ
	mnasFEyw152eadu4cpPt/ZR5w/Rp0+VSAtDsmtU2S7YRursqWuWhIGE8+RCibY4sJhbchX
	zc3ExaVju5i57fTodTM1/W4elUhLxRg=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-22ABXvU9NU2f2JL413O8wQ-1; Fri, 09 Feb 2024 11:49:59 -0500
X-MC-Unique: 22ABXvU9NU2f2JL413O8wQ-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-5d8bdadc79cso1188910a12.2
        for <regressions@lists.linux.dev>; Fri, 09 Feb 2024 08:49:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707497399; x=1708102199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iv56PqPnsvTXTwarveHsnRnFq5SGF+BFGaQ7j/GRxRk=;
        b=kO3DM8GZ7uuejJFU1hXuGneeNf4Da94dGmiNh+LcVpeKZbsHwzMlaNnT3s15DESNPv
         C9Rf5/Pi5j4My1raOJSr97BVkqhuyf8AHxIzGuF4IyUiRnFrTUSLtZjBJPJ3uAELhO8p
         u7u339BBv4rjZpY6M/kUMtt/AXZcWy7w3hLY0sFDvwb08xBfFpDsElSNm7ugTn5tQMCD
         u9vSq/l5a9OrumlbpFGa0DscaO5aE5SyT3i3z3eWMFt2XtnoyyuIu3Ccw3R4QBMhaKUe
         WTX/xYSiAG28HOmapJsbTsL9XtnGDCAEt7TlZDEpDzUb66bN8Y35g9yv88sFW9FBJVj2
         WJjw==
X-Forwarded-Encrypted: i=1; AJvYcCWgUaBzn/4MFMWtuhw+HI58afxTKHpXbdApx9oE8R7Am9klz35fCctEWfA4sxQdai56TQtnb82VvZo/oMEZJhXks45E6p6PGbO1n58=
X-Gm-Message-State: AOJu0YyEqTXLQXTvB+OkCt79juePpqLlDP1sW6mVXb0ei9TCC4OzXlIg
	VMscjjHMGMvjpFDnoZ9FK8mES3aH+e9UiOU4m4HM7OqaLBxfgG6uSWIHH3kbOQZ5E62pNSoLUXi
	HtvR2XxKJeFY6wgqfHuQ+YG4ntvGnh1mG48UsIydhXUnK3LRc3xVn8SuuqedK2HZOsN27EqHZlE
	skH7BbQ3rSX63TdZAZKoLNh8O+idbK5Hc1W6U=
X-Received: by 2002:a17:90b:4014:b0:295:fe86:ad25 with SMTP id ie20-20020a17090b401400b00295fe86ad25mr2139900pjb.36.1707497398797;
        Fri, 09 Feb 2024 08:49:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgOkRWUTSqInTRg13d4URgeXtvTpA7pyw7Ka22GIvJnxFBw36TfEgDb0tEyld0wHgAinA0NFa9/Bkq4ZnaI3o=
X-Received: by 2002:a17:90b:4014:b0:295:fe86:ad25 with SMTP id
 ie20-20020a17090b401400b00295fe86ad25mr2139878pjb.36.1707497398427; Fri, 09
 Feb 2024 08:49:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240209163454.98051-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20240209163454.98051-1-srinivas.kandagatla@linaro.org>
From: Eric Curtin <ecurtin@redhat.com>
Date: Fri, 9 Feb 2024 16:49:22 +0000
Message-ID: <CAOgh=FwFMaYvTwmqeOQrqHq2XANxghZbTuY3+SgFx_ozpysBOg@mail.gmail.com>
Subject: Re: [PATCH] nvmem: include bit index in cell sysfs file name
To: srinivas.kandagatla@linaro.org
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, regressions@lists.linux.dev, 
	Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Chen-Yu Tsai <wenst@chromium.org>, asahi@lists.linux.dev, Sven Peter <sven@svenpeter.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Feb 2024 at 16:43, <srinivas.kandagatla@linaro.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Creating sysfs files for all Cells caused a boot failure for linux-6.8-rc=
1 on
> Apple M1, which (in downstream dts files) has multiple nvmem cells that u=
se the
> same byte address. This causes the device probe to fail with
>
> [    0.605336] sysfs: cannot create duplicate filename '/devices/platform=
/soc@200000000/2922bc000.efuse/apple_efuses_nvmem0/cells/efuse@a10'
> [    0.605347] CPU: 7 PID: 1 Comm: swapper/0 Tainted: G S                =
 6.8.0-rc1-arnd-5+ #133
> [    0.605355] Hardware name: Apple Mac Studio (M1 Ultra, 2022) (DT)
> [    0.605362] Call trace:
> [    0.605365]  show_stack+0x18/0x2c
> [    0.605374]  dump_stack_lvl+0x60/0x80
> [    0.605383]  dump_stack+0x18/0x24
> [    0.605388]  sysfs_warn_dup+0x64/0x80
> [    0.605395]  sysfs_add_bin_file_mode_ns+0xb0/0xd4
> [    0.605402]  internal_create_group+0x268/0x404
> [    0.605409]  sysfs_create_groups+0x38/0x94
> [    0.605415]  devm_device_add_groups+0x50/0x94
> [    0.605572]  nvmem_populate_sysfs_cells+0x180/0x1b0
> [    0.605682]  nvmem_register+0x38c/0x470
> [    0.605789]  devm_nvmem_register+0x1c/0x6c
> [    0.605895]  apple_efuses_probe+0xe4/0x120
> [    0.606000]  platform_probe+0xa8/0xd0
>
> As far as I can tell, this is a problem for any device with multiple cell=
s on
> different bits of the same address. Avoid the issue by changing the file =
name
> to include the first bit number.
>
> Fixes: 0331c611949f ("nvmem: core: Expose cells through sysfs")
> Link: https://github.com/AsahiLinux/linux/blob/bd0a1a7d4/arch/arm64/boot/=
dts/apple/t600x-dieX.dtsi#L156
> Cc: regressions@lists.linux.dev
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Cc: Chen-Yu Tsai <wenst@chromium.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: asahi@lists.linux.dev
> Cc: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Seems reasonable to me.

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
> Hi Greg,
>
> Here is a fix in nvmem for 6.8, could you queue these for next possible r=
c.
>
> Did not cc Stable as this is only targeted for 6.8 and no backporting is
> required.
>
> Thanks,
> Srini
>
>  Documentation/ABI/testing/sysfs-nvmem-cells | 16 ++++++++--------
>  drivers/nvmem/core.c                        |  5 +++--
>  2 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-nvmem-cells b/Documentation/=
ABI/testing/sysfs-nvmem-cells
> index 7af70adf3690..c7c9444f92a8 100644
> --- a/Documentation/ABI/testing/sysfs-nvmem-cells
> +++ b/Documentation/ABI/testing/sysfs-nvmem-cells
> @@ -4,18 +4,18 @@ KernelVersion:        6.5
>  Contact:       Miquel Raynal <miquel.raynal@bootlin.com>
>  Description:
>                 The "cells" folder contains one file per cell exposed by =
the
> -               NVMEM device. The name of the file is: <name>@<where>, wi=
th
> -               <name> being the cell name and <where> its location in th=
e NVMEM
> -               device, in hexadecimal (without the '0x' prefix, to mimic=
 device
> -               tree node names). The length of the file is the size of t=
he cell
> -               (when known). The content of the file is the binary conte=
nt of
> -               the cell (may sometimes be ASCII, likely without trailing
> -               character).
> +               NVMEM device. The name of the file is: "<name>@<byte>,<bi=
t>",
> +               with <name> being the cell name and <where> its location =
in
> +               the NVMEM device, in hexadecimal bytes and bits (without =
the
> +               '0x' prefix, to mimic device tree node names). The length=
 of
> +               the file is the size of the cell (when known). The conten=
t of
> +               the file is the binary content of the cell (may sometimes=
 be
> +               ASCII, likely without trailing character).
>                 Note: This file is only present if CONFIG_NVMEM_SYSFS
>                 is enabled.
>
>                 Example::
>
> -                 hexdump -C /sys/bus/nvmem/devices/1-00563/cells/product=
-name@d
> +                 hexdump -C /sys/bus/nvmem/devices/1-00563/cells/product=
-name@d,0
>                   00000000  54 4e 34 38 4d 2d 50 2d  44 4e         |TN48M=
-P-DN|
>                   0000000a
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 980123fb4dde..eb357ac2e54a 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -460,8 +460,9 @@ static int nvmem_populate_sysfs_cells(struct nvmem_de=
vice *nvmem)
>         list_for_each_entry(entry, &nvmem->cells, node) {
>                 sysfs_bin_attr_init(&attrs[i]);
>                 attrs[i].attr.name =3D devm_kasprintf(&nvmem->dev, GFP_KE=
RNEL,
> -                                                   "%s@%x", entry->name,
> -                                                   entry->offset);
> +                                                   "%s@%x,%x", entry->na=
me,
> +                                                   entry->offset,
> +                                                   entry->bit_offset);
>                 attrs[i].attr.mode =3D 0444;
>                 attrs[i].size =3D entry->bytes;
>                 attrs[i].read =3D &nvmem_cell_attr_read;
> --
> 2.25.1
>
>

