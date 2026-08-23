Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0C51F8691
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 00:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787445384; cv=pass; b=ee4C7MtH0iHyAFYJpEidN+xvzloAJbQwoUBc5suc4droyDpIKugKlsNHlSAcmhqI4itd6EbXNX/u5IHXOCfpFfoesSgpjpRJ1scgizoRUaVG0GhY+SViPPfmhrz+AYB1MmPDJ8lLdedAVi5/jm7B1ORb2eZHk9hyLA5PLMhJ00w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787445384; c=relaxed/simple;
	bh=IpHcjZ3NayMqvBih3E3O9x4doOsXtbt93QADiafRZnc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=q6f7c+z29yY1mjxJUwZPn9BtsCZmkMByqECbb+GQe3UC6a47VdveUe5pLGw1GqgCSQugUAQ2Enr0+pR7eUs6Qhb70fqD9Wt6fyx6NzZbUJDwjAwIIndpeP2UZI2Lbh68wqgCWDlIppdYHeD7ShORrdECkSz1nfkF37xl9duwrH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTzYijVJ; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTzYijVJ"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c5a818a3d6so1844980e0c.1
        for <regressions@lists.linux.dev>; Sat, 22 Aug 2026 17:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787445382; cv=none;
        d=google.com; s=arc-20260327;
        b=nnFGWzEgofKduqrg3k0zXGZU0naJKWAIco8CoxfR6vmVyCn3tHhH78BHGt+u9n50+Q
         Oer5PKT5dwc9l6Sl/HzxPMV3r5FRd/u00M1vgHOwJISWBoSO6jU2VqPb6ctRgiSlKrQZ
         vcxF7NVfzXsjLdzytzL/3r/i0VvNu0YeT9/TYXpj7ywIB8I5XgK3vNCCx10SB30xJqON
         atwTvfoUYLxXwRKDi5bnFYSAsQIKgy5sufYelAPVtx4jNGGMYjt3Uwz2/Td21McA6EuT
         6gdV50gjCC/rt0TDnXIj0J5TucteOWn20e4YCl30lwTvE98plASm1sUYYqt1mhvXIcBj
         chhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3Pdm/5HsS5zC32B4oG3X1nNqflyH/Na8m3BnnAtmnRA=;
        fh=CPSF9JIVBT5vcBb2tw4CBsUrf86Q60jPt98yuHcIyo8=;
        b=iaZlbma8PB0OeVNFDXlly/PYRr/SWhtHQYvV15/V72Yf3TJQaeND/8a+aDcsLIMcwz
         H+imrSVmIJTIaLu2OsYUO7s/bYzOJWtXKDmmpC2TpcrqgO0rblL2kOnNSj39UjJtmhpq
         NUCFzTOz21jXywUKbhS3IQjs7yk/k/fSMf7iG0T5VcX8kfGe/X7Duh891qaM6Yh16te0
         fxRiJr1vrVEuwNVjxLzGNeg6vtupox4f35NiuUQ9t0UlN9FrTC7iPaDDV15QGaxlANKI
         r0QXEyy+LTn70iIZsP6OeYDij3xNnFAU4JnzyWv3ufzqZpaWee9Tmu3BlhFzruKs8dQr
         PPFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787445382; x=1788050182; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3Pdm/5HsS5zC32B4oG3X1nNqflyH/Na8m3BnnAtmnRA=;
        b=dTzYijVJEX+fvQBgSSZl9LvSHZerZlP8DU/PbuUNymd3bBdvqFiybB9pAnldhPQw0k
         w2D8e0PzsjdX1TtVYdNoGq9geUKhHp/7Ig6MbHXpwQxU9CUolzZC9PBaTwYvxh2DqCcM
         ERPakQA7KoVLfP9YbhPNH7/LUtBtdUopuVLHm1LkVfWG68X+qV3qtsQrSF5O0KcGzYR9
         wXig2fW+DTptIQu0xL2UuROgCgMSJMJcM/T/F3JdhSg6N4xJ2+C/UBQV78qIJh/niGfx
         t7q2YzsW9ccddgKs334QtOAKkLO/EpnyRfAobYGqBXtp8JUd3A6V3BhYuLbUwIxqVLRZ
         gF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787445382; x=1788050182;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Pdm/5HsS5zC32B4oG3X1nNqflyH/Na8m3BnnAtmnRA=;
        b=tWgZVCbKpWo2Rw5J8HE8xuypwp0sDBHYV5J9glD/OGzpbTI7JuMjg3UKVb7o1HtJv4
         tIVqN1yQAkHTpKpXH/GoqJLBh3PS1ByHwYNcPo5eg00g5wMrxscxLtRZ1Iunn2HfkLmS
         1s4vEpdNiNtaDh9POp4Zj8/kmePVqnJu8zLzHkAbpE0wSxesh+qsdEdkImd/dScG5mfS
         NyDvU6nswY1ONRTr4AfjHGRzNKiD644lqRVVxH6OlSqOVaXjXqleIBbCUWGs6eZdwyhE
         /dQHHl3Q9CVG7D8wQJou8GL282fJP58Zxp6tsqoF3BvRX1E8EheQdjSdjdLF6lPWC/fv
         3+hQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpu2XTSwr3Zi4oEoa4/HzfenCggi90EYX7YTlRjSYc4488X4SEqnhN1r9+Z9h3VoeEDQQaUJ3tWj2+MMA==@lists.linux.dev
X-Gm-Message-State: AFuF++nvnQAQxkeLhtHAL5pqrkikvhLLx+8ub8YdgKhwQRosloP+r3yo
	7M+4d8ze0cdpvMEmYf13lmxXveMd2w0pBRw5T4bxo3TFh9UtwulOqPK8DHJBx6hTzGuUtTwiUC9
	EdmGjuUNKixxkk7CWPK9tGRqFSi2abt9J3ETj2ho=
X-Gm-Gg: AR+sD115hbGlYGEkdQxkpFTVyDtu+uwxWR11bYOBumejr+dAMTSBgAiduXKHQDRNjpw
	ectS5iYv1Dsc3vBK8GNslcmJZjN1Kak6LzI+f1mTwz56HwD4GofqA1jiU0szLah7xXwZuSNhOSj
	doFF+XXvllOD+GqImyxsyKKkKjMxWivfczVup9IG80JHtHqzZuU8QVSds1Bjx882pYftV1Z2yEF
	+0kvH3D60ElIOdsvMoEYePYKuusyCdTYixAn1VPia0L5cpPtb17l1rp1yNAyDcM8hmQWelrPjOX
	9lRa/TzeStQExK+gkUYrgdvRZzV4pKornBlcaPeU3mY+
X-Received: by 2002:a05:6122:489a:b0:5c3:2f5c:55b3 with SMTP id
 71dfb90a1353d-5c5ff7a68a2mr8236180e0c.3.1787445381909; Sat, 22 Aug 2026
 17:36:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?Q?VOLKAN_SAL=C4=B0H?= <volkan.salih.06@gmail.com>
Date: Sun, 23 Aug 2026 03:36:10 +0300
X-Gm-Features: AcwNN1W0_Bz7QYAT9V60rz2l4_bJDFUR0hstZX3hdx3Ab_UhZbX18RbGhS9ja7g
Message-ID: <CA+wWBLPxFPQB1Dt0MAJSNZ43dhGDspSD9jH98TArTf_etjLmSw@mail.gmail.com>
Subject: [REGRESSION] hp_bioscfg hangs boot on HP Laptop 15-bs1xx;
 blacklisting fixes it
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I am seeing a boot regression involving hp_bioscfg on an HP Laptop
15-bs1xx.

System:
  Model: HP Laptop 15-bs1xx
  SKU: 7WG51EA#AB8
  Mainboard: HP 8444
  BIOS: F.75 (04/26/2024)
  GPU: Intel HD Graphics 5500 / Broadwell-U [8086:1616]
  Distribution: Zorin OS 18.1 Pro (Ubuntu 24.04 based)

Kernel results:
  6.17.0-40-generic:
    boots normally

  7.0.0-30-generic:
    hangs during boot

  7.0.0-30-generic with acpi=off:
    boots

  7.0.0-30-generic with only hp_bioscfg blacklisted:
    boots normally with ACPI enabled

The working kernel command line workaround is:

  module_blacklist=hp_bioscfg modprobe.blacklist=hp_bioscfg

The boot reaches hp_bioscfg initialization immediately before the hang.
The WMI GUID shown during probing is:

  5FB7F034-2C63-45E9-BE91-3D44E2C707E4

The system also reports these firmware ACPI errors:

  ACPI BIOS Error (bug): Could not resolve symbol
  [\_SB.PCI0.LPCB.HEC.ECRD], AE_NOT_FOUND

  ACPI Error: Aborting method \_TZ.TZ00._TMP due to previous error
  ACPI Error: Aborting method \_TZ.TZ01._TMP due to previous error

I inspected the hp_bioscfg module from Ubuntu's 7.0.0-30 kernel:

  /lib/modules/7.0.0-30-generic/kernel/drivers/platform/x86/hp/hp-bioscfg/hp-bioscfg.ko.zst

It contains the old error strings:

  hp_bioscfg: ACPI-package does not have enough elements: %d < %d
  Error expected type %d for elem %d, but got type %d instead

I noticed the recent patch series:

  "platform/x86: hp-bioscfg: fix ACPI package handling on HP EliteBook 840 G2"

including:

  e0ddfd77c0c3 - pass validated element count to package parsers
  1d143d78299d - bound ordered-list parsing by package count
  40e10e6cc8f7 - accept reduced ACPI packages from older HP BIOS
  b0e2af3ec94e - warn on element type mismatch instead of failing

The series was applied to the platform-drivers-x86 review-ilpo-next
branch.

Could this HP 15-bs1xx boot hang be another manifestation of the same
older-HP-BIOS ACPI package handling problem?

If so, would these fixes be suitable for backporting to the affected
stable/vendor kernel series?

I can test patches or a patched hp_bioscfg module on this machine.

Regards,
mr.Volkan SALiH
