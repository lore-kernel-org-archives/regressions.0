Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190CC3515D4
	for <regressions@lists.linux.dev>; Sun, 20 Sep 2026 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789923623; cv=pass; b=B879JldlDUotxNU6x6/FR3/AP3sxsuaBh2mJsQrJcopLUap4e0LQK9ZPsEg3o/5bXKcXiVhWWhU1A0o/A23IxZYBC/c/8zEgTTjgGKU81VgKmT3CZ4brungK84t47+NKgo7IF+evYaWn2kiha9MDCkhC799FMtHX9mDJyfZyqPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789923623; c=relaxed/simple;
	bh=FOYRk6VydLS9eMfMxZB7qHkZwQsdY1XIXbZky0pHTu4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YNa5ZyVA3QDjV8c9civoj5Dtfv1zy4/YdoBjxC6u/KTxvvby3mdQEi23Waujov3brO48HGQJnkWeW1A+FWbQZgs4FgJUddgoTwV428FPbDfD5aDnkrFcdMPziKrPbNKkQxhjGEk55J9xxuEuLqXojaOKJokhUxVxXb44dv45Zv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4hor8wA; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4hor8wA"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fbef5018so28750955ad.0
        for <regressions@lists.linux.dev>; Sun, 20 Sep 2026 10:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789923621; cv=none;
        d=google.com; s=arc-20260327;
        b=QDjR2bzK3YnR2d7cReEMUUq8i7fC4RXj974lfO9hA+hUGF5aU3dS/P9yru+wWHvCz+
         hlBdFZ11EYRXWXTwuSM6eie9SyZ8+yD8K8OhoHT1NYe+cOpEBr6HJ2z2cxmA/qKv2HT4
         y3VH2/EDUbdVcmCF3ZtwX+4l4juJcHw2s4lw2NghCSS6/9JFTHELyAKAeCxphaEGuwrn
         MpQsC6ascirXG4OaAp7Qv+e0S8JkdZeS3g0y5iExeSBg9+uwh9hqYY4Sn7POPpHqbE0H
         Zjv8PoHpnGj2d7nJSjNughX5evw6W28UgkHJQ181hpEcZ5qz4SdunXwcjRWlhxZqLtRJ
         sYEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FZ6/bzlAkxVd+iCIF2oqKZ8IZif6Hsv3IteV35pkCVU=;
        fh=48hqTDCJiYzT9SokftmuXJE7MltjyOjAZOL95cjWobQ=;
        b=bxZyi6Vz0wuojb1/uiAcaNG+vLkRtTSj2blFnEmxoY4TBRKGCcBc5zuAJ+Kj88zTTY
         iupSuIFkE4a2dOkPyb6VuhwDB/7u2fWMojMhnaX7XX6v2uHt/4W+3m4KzgIHQWQ557Rp
         a77a/JzIrKNSsDXn0ecFAis7lPCQ0reG4eUF2v1VGhtWohlLSTAZOzSdOJSg+jMSs42s
         Wj1QjP/5TF+mQijHJRolgXQUjj0e3YN8248gFsXjOAmvQTvM5k6gFEbNnNQ/71IWnCg3
         oC2DBgYYSOfT4UnXMGFNrFPRJUo9fq4YMvOsail3q7/3GzJWNbR8A1DHaS1fUDbgASvi
         x/SA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789923621; x=1790528421; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZ6/bzlAkxVd+iCIF2oqKZ8IZif6Hsv3IteV35pkCVU=;
        b=f4hor8wAz7omIlmsspTmBOWqkGncGPl4gidQ2E4VqAJ+M2rau6UjwSumkkPd/grfJg
         J/YsGqariovRR2ExMGbVYTFPJqwJw0xztal6dy2HoGyipdjSAQZMzVAsNmRIxrj6O0IT
         s0M19MLJ2MHrLxla1aLhnxeHvDH/ZOP53829Mf5inGtI4WGZwJsSGWksKNHQRWOnJTq9
         afuqFp+VaQR4ObxGRvt3PV8NBKH8TXQ2Egbx15VQlRC76ZfmCHD1RnawocC+Pyi/KpaA
         cuvu5C7fNsS+7qTuhPkn/oYHwH3eFtcXTxDDVpkN30BGGwFYAABRbUPSvnnXHD2qttYX
         3TAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789923621; x=1790528421;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FZ6/bzlAkxVd+iCIF2oqKZ8IZif6Hsv3IteV35pkCVU=;
        b=s4LJpG1Pm+7JT2hloCUyYkb9Q2Yc6JfS5vaGHgz3kGSzJUFHGk7Z/vCwPAEdoSgEPS
         y4c1EcZL47QVCTr1bdtWxeZE1YSOjvnJORi9rdHKV6BDAdUIwskzvBJ6yAX44isxoxh4
         LtSr2IGseT5up7QxZKGYahyHFjqiYbVe2g1IaLonkiZiACboLS8QuXt5t308Cf74bcaU
         aKGnQ9yQOZTw0mqR6D3b3VnZzVn4vR1mvk7+VAApoE1r6OvwVk/91usyfIUaCfei/cwF
         S93mupb6p/UnIjMHiAWXdv+VRDBA6ZNbIUfrLuV3q2Cr9zNQAps/BLzs5cBqThIJ6vyg
         lCbg==
X-Forwarded-Encrypted: i=1; AKwUvBxtNRUX3HCA/TYibCwoEriQ2snRX97TB2kZaLAb1Fvv00gs/3uOsPyQKNX1kbCiK4ow2NpdvpqUgs2V3w==@lists.linux.dev
X-Gm-Message-State: AFuF++k190WJ4Ftt1WE2PKGI1/Lbn4wpRLF81Bz1dBhTqKNDZEgtMI8x
	8yELDeHxlcDfikWQraqJ9Lyo7CPK+FxoOFH0KQaqHCMIIDn38OfAP0bFq3g+PsDGA6xpzvKKSJ6
	0NvSwAnFz0PemBSBSUEN93gBi7L1hRXw=
X-Gm-Gg: AYBFou3hnhg4uRfDFwQkUnwmZLRj821ACFT6aZqb20N5GeNmwyMqxENRLgj7C61ftHO
	c3x8qFIvq7mGW9BYBNfZI/TktAYBl0q/OytPo8V69Bg1aeAavpnpnY+mKuGdT1e/blzI9tcVGsf
	ipcCmMlpxaGY3n3wuQAL+3DQ1nkTK3zc0rmfvYca/JTlbPr94B9zglAVu437R8NAbSSKqK/PzTA
	q4xCD/LEEG4eQIMez890f8ymBRRYfmFvhBHJYGRJOSwpl3ySHQaP1UqeZWz/nbG9x8v2I1MO7dP
	ZpP3BdaIh1ro8kA0FNdVqTekpredPiKssbT4ZRistWer0B4JUSMJ
X-Received: by 2002:a17:902:f545:b0:2df:3f0f:d65 with SMTP id
 d9443c01a7336-2df3f0f0e1bmr26183525ad.22.1789923621367; Sun, 20 Sep 2026
 10:00:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Olzhas <marat.olzhasss@gmail.com>
Date: Sun, 20 Sep 2026 22:00:07 +0500
X-Gm-Features: AcwNN1XtjfcG1A3vuRXuZwWNFiaCVgATiKsMbPLyoi8g9WObhx_BLl_2Vjqsho8
Message-ID: <CANzgjV0YWUX6=ZGTbn4KEKqQmVhsZTsDPeRf0Nfq=YFT1eoPzA@mail.gmail.com>
Subject: [REGRESSION] pinctrl-amd: Don't clear S4 wake bits at probe causes
 power off to reboot AMD Ryzen laptop
To: "mario.limonciello@amd.com" <mario.limonciello@amd.com>, linusw@kernel.org
Cc: linux-gpio@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org, sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mario,

I am experiencing a regression on my laptop where attempting to power
off the machine results in an immediate reboot instead of a shutdown.

The last known good kernel is v7.1.7, while v7.1.8 is the first known
bad release.

I bisected the regression across 9 kernel builds and identified the
following commit as the first bad commit:

a7c855969b1a ("pinctrl-amd: Don't clear S4 wake bits at probe")

With this commit present, running:

    systemctl poweroff

causes the laptop to power off and then immediately power back on.

I reverted this specific commit on top of v7.3.0-rc3 and the issue is
completely resolved. The laptop now powers off correctly and remains
off.

Hardware:
- Laptop: Chuwi CoreBook Plus 16
- DMI board vendor: Default string
- DMI board name: Default string
- DMI BIOS version: AB8139_S_2C_V00.01_007
- DMI BIOS date: 2025-08-05
- CPU reported by the system: AMD Ryzen 5 7430U with Radeon Graphics
- The CPU/hardware appears to correspond to Ryzen 5 5500U / Lucienne
  silicon, although I am not certain whether this is relevant.

Software:
- Distribution: Arch Linux
- Last known good: v7.1.7
- First known bad: v7.1.8
- Current test kernel: v7.3.0-rc3 with a7c855969b1a reverted

I have verified the fix by booting the reverted kernel and testing
poweroff successfully.

Since the DMI board strings are generic ("Default string"), I would be
happy to provide an ACPI dump, dmesg output, kernel configuration,
bisect log, or perform additional testing if needed.

I suspect this may be related to an S4 wake source left enabled by the
firmware, but I have not identified the exact wake source yet.

Best regards,
Olzhas Marat

#regzbot introduced: a7c855969b1a
