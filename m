Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C736D227BA4
	for <regressions@lists.linux.dev>; Fri, 23 May 2025 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994348; cv=none; b=VKcgAc1xgL0G7R09V8QK6sO9CCSRWysPGDdcFzoifKxrAGnDDHDBxJrvHYbyM/XDxw4pLB2upGf+xiHCaZxyU/rPhKfRisimGqw3SiJd96qLb8FYXhP+og/luzgMHXW7lFs6EdWSeHPu3oDedIEz7yZMy7HrKtaGNnbWxFcy/EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994348; c=relaxed/simple;
	bh=6k5sARl4egvQjB2tDiWx3blzghCZ/GspQdjLGvMSf7Q=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=iPe+pZwA98M6ltlNFVnAas8WrH7YfM+oUH7M14bc48X9Ckf7UgzipNeeor6nGw7OScT5DabjIIQnRMBSiFsL3NvLf34t9bgkHdcoRF6KIgA3KrfZq33Cx+S4ZTsqz7MPbzvUCEh50HjmEVyrC29bQ1xrYmGOA12XpzfdZ4+gAoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=wZsQuRuX; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="wZsQuRuX"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e7d64106f22so2180640276.1
        for <regressions@lists.linux.dev>; Fri, 23 May 2025 02:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1747994344; x=1748599144; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GOTT5nIGs/DAYCQr79O2D7rhlDUI6zUndiZEx00HOGo=;
        b=wZsQuRuXRjvq9+Ujc1/vI3gCkNZsbOCf6dE27AhKvBOXQ7s7YQoeoKubhlCU31GIy2
         F9WxwR7PQj9PPuTlco9+kNONEdUqcKkdwWeP4Hb3/Qk2S/U5REpMMQepwpkVf7pfh0qk
         5cV1e3hinVsaBVj1E90tGDC6qiqvSnzibDq4HiS3mAIVOINA16ylh1yWuecNqlAcPxRC
         U+EtEG6yH3LwXoXlTzKlQxI6039oc+j6QPH4sTZ9ZJpuYqOpHOERhoSZTJ2FNODpVcXR
         +CwdAFe+ZFiQbnXK5TJWfutSE5LSyC4aXujYA9sc2Cnt+rR1HEUrSpM4BXjTM2CZmjX2
         mIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747994344; x=1748599144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:reply-to
         :from:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOTT5nIGs/DAYCQr79O2D7rhlDUI6zUndiZEx00HOGo=;
        b=bW97ChUaVVTQb1CNdsQTkP1CMCygf7BmKKlTCLLoRORBShchP3oTbp3ay0Ns7EKvc5
         /CjCD/mQaDGrVvVvXLebDcs4WA8AqOMXME26RIuZqdrAV4nIVV1Mr5U4GPRSiHBEumTC
         Zb5Bsb1lHvC9msWiKyiO9y+AfOWyGDhI1yzBBYvhSKkb8hM+mYUrLV91RWYiyGXbpp4o
         ngbuuCeixAkRDgJj00fd4Q1M6T+yAlRlNvDi4zVX5gZx4CI/IhsiXC3RE5JkkXBzLImj
         bE5RJkxe2Q5RhYNW+phX+SrTa+vUd3x7/9dNWrk5vdxpyWN9Q6lYpzYmVEYnhXo0pPDH
         GfOQ==
X-Gm-Message-State: AOJu0Yx1iRC0S1Xj0UheBEFRxFEDYNN2iyxfkMkFUdHKwUVKehPDwpci
	y6pXLmKMIcDzZkIkZY+X+nu6zlnX2QNMohbAIIzgsV4Jm6dPYNwHLPVhObD5PUnukj9eAFra9Pf
	ozhJ+IzVzsx+PXaKVdTKdUjEp/9hTXDCZdYeq/CCciQ==
X-Gm-Gg: ASbGncv5HTOsZN2Rfkwa56DX7kLdcFtlU3skMnFJwpZcN+Lw3WmvycROrrxAq9cEeCS
	XQ6WYFZu29tLW9qURM23YdL7tQzOrM3ld89+mV65BZcRKW0iC01J7lDLtBrjYb8zaBxI51Bg87e
	x8dw4oyyGTRBiKiQi9BdKVbyCY8phMnzs=
X-Google-Smtp-Source: AGHT+IERNywlOqsHb76ESwwDhic5zl7OM6pA2LNxMcdRkZpKWbnd4VVWvvs3aOURWYY1L3F6GKj5CxrcgvYNSS61EUY=
X-Received: by 2002:a05:6902:2b13:b0:e7d:5bcb:ff56 with SMTP id
 3f1490d57ef6-e7d5bcc003amr12419064276.36.1747994344684; Fri, 23 May 2025
 02:59:04 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 May 2025 05:59:03 -0400
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 May 2025 05:59:03 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Fri, 23 May 2025 05:59:03 -0400
X-Gm-Features: AX0GCFvh9HZekbOR2cYNZu4etliQQCix7gndUiTG9DLsThUusscz0GlaOg_ARjQ
Message-ID: <CACo-S-1w-6Qudd1KrffaNNFe+NRpfeSdqyCe=3hKx5i97GbntQ@mail.gmail.com>
Subject: =?UTF-8?B?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIOKAmG9uYm9hcmRfZGV2XzU3NA==?=
	=?UTF-8?B?NF9pMmNfd3JpdGVfYnl0ZeKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bi4uLg==?=
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

New build issue found on next/master:

---
 =E2=80=98onboard_dev_5744_i2c_write_byte=E2=80=99 defined but not used
[-Werror=3Dunused-function] in drivers/usb/misc/onboard_usb_dev.o
(drivers/usb/misc/onboard_usb_dev.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:a7d500f8bc2bacd741b9ca5388289=
875fcea3bb8
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  176e917e010cb7dcc605f11d2bc33f304292482b


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
drivers/usb/misc/onboard_usb_dev.c:358:12: error:
=E2=80=98onboard_dev_5744_i2c_write_byte=E2=80=99 defined but not used
[-Werror=3Dunused-function]
  358 | static int onboard_dev_5744_i2c_write_byte(struct i2c_client
*client, u16 addr, u8 data)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/usb/misc/onboard_usb_dev.c:313:12: error:
=E2=80=98onboard_dev_5744_i2c_read_byte=E2=80=99 defined but not used
[-Werror=3Dunused-function]
  313 | static int onboard_dev_5744_i2c_read_byte(struct i2c_client
*client, u16 addr, u8 *data)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  AR      drivers/gpu/drm/panfrost/built-in.a
  AR      drivers/gpu/drm/xlnx/built-in.a
  AR      drivers/gpu/drm/gud/built-in.a
  AR      drivers/gpu/drm/sitronix/built-in.a
  AR      drivers/gpu/drm/solomon/built-in.a
  CC      drivers/gpu/drm/drm_atomic.o
cc1: all warnings being treated as errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## cros://chromeos-6.6/arm64/chromiumos-mediatek.flavour.config+lab-setup+a=
rm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy
on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:68303248fb37369f44a3fd8f

## cros://chromeos-6.6/arm64/chromiumos-qualcomm.flavour.config+lab-setup+a=
rm64-chromebook+CONFIG_MODULE_COMPRESS=3Dn+CONFIG_MODULE_COMPRESS_NONE=3Dy
on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:6830324cfb37369f44a3fd92


#kernelci issue maestro:a7d500f8bc2bacd741b9ca5388289875fcea3bb8

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
