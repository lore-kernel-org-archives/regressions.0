Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4F82066C5
	for <regressions@lists.linux.dev>; Wed, 12 Feb 2025 15:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739372534; cv=none; b=ekNs0+qHdqI7pJPMmk28MUG5iWY/V/KgDrwTzY745gDxNmuWW3Fy5Pvn0bIim7vI6+zpWxuSfYqB9f8lw1EjuUtfSlV1soato6ygqQoGCc/Gw2D6pfu7wytNI5QBoTph6J2HscMQYDS+MzyDQVXsAS5IK9/3rdZTLMN83/Yyviw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739372534; c=relaxed/simple;
	bh=5W/0kDH2iE8jdU0mcwhPKQVDesaBbPuYLkNnrZQXzoM=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=j+G1uHyanYTmYKAA0rcnoDAc99BbwKT5YN0Yc9fKWcUFOb3VrXv9tMNZ6SYlyaXzs+8yhVeTQIv0YXqfg0IMzC0EMGjxUp4BzwyzdUILCx6gUn9DHr0IFQpwlYhdytNG87lDoAB/TZj5ExF3kNbOOhaye10dmm5NsU58mwwrXdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=bS3GT3S8; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="bS3GT3S8"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso4994697276.1
        for <regressions@lists.linux.dev>; Wed, 12 Feb 2025 07:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1739372531; x=1739977331; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ue60ZjyGWrVaLeaSu2xAx8yr+4Vq3hGcMgDBpVnlCyc=;
        b=bS3GT3S8+TOKhkBrjkDe6H/rlpyGUgXwhWp1CWuP1ADlqU1FBCEQGHqfZPHJUvf2Xe
         Qe6V1wKa8ePOPuQvSTBVbKoX6kdRrSfVPDH36DollkNh9VO749btWTowTrXFF63su9zm
         zrYnqX0sSMVlEAoh38vwsJfj9zOlxxEFCKvp0Mvi0ypxUcY/8RRuAgMA0Dg1Rt5tGnKr
         f7Cs+I2wUJ0W012rDU0poYCMcKW3YBOtgC7psjSHiv5eQBrothT9sWNq/zM3AKJkeuJT
         Kmeogw6/trISe+16j7o4B/xqk44bT2yaivlZSRs9sXqwuLhGha3jF8FWb1kw4Bu1j73B
         ZdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739372531; x=1739977331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ue60ZjyGWrVaLeaSu2xAx8yr+4Vq3hGcMgDBpVnlCyc=;
        b=qzEDRX0WOcpF0aamrzDVLGHeCcEUXn6F1K2RdnRh/rvpJuR+EDkhI0zqH2qCiXflbl
         lJbGYWr2TnjquvabV6XrU1Kqzn0eG2rVTvLklUKKqUSaqLpWMrFhZO367SI59NIAn9if
         Br6H1oOAy/Px+SOerJwbDwfx2VhfZQ0gTNNbWhxDQt0onFaVxpfseSq6d068BqNrlOXr
         72R3Suo/Op7SD+y70UplCzMXf3NRVYmG6xn9BjusAACIftIf9CeuSApZvEG6FvIEa+P5
         GN1HhDLzsmhnpvrn8RJ4LKaTXHbHnVi4yfY5X7PrCZUu5RYoHEDlv8JoOOCH1XMUVucs
         gyGw==
X-Gm-Message-State: AOJu0YzklOMzaj0BCFZQllZXkgZ25msg8NlmNJb5D7Qkm1Lz6UniVky6
	SSemW9yL+3n3lowuy70iiJzP7GIamkBX51gzWdw/DIFTxE/e+7ayGRcGDNJeqYKH6woAI5D/Wu/
	hfQAXOnuWY3Mq4TYOzcITOY5yu+nxat4XZQe9zg==
X-Gm-Gg: ASbGnctXakVA7mt1R3fagvi3RFvu1u4IvzjeM82Nl9nWGEv2CsZTqb4evPclcDao2zv
	nC29cpbDWUo/6ULvw9lFdAHMEH4of99X7FLQRQ6G0KjbS3mjDacrgwect5YHesWhYl49JddGg+T
	zbbGig8Mlf7eZsUSt3UraBNrQCVnz8yw==
X-Google-Smtp-Source: AGHT+IHhFhOXzJwSAIWweSYzvFoZYxNnzLTNmGFduMSuVGpvd0yGDCGB+seiAMWmOMBUE4ST4esRRCqwQ/celgFMX8A=
X-Received: by 2002:a05:6902:1105:b0:e5b:32f5:e38b with SMTP id
 3f1490d57ef6-e5d9f11e33dmr3185611276.23.1739372531004; Wed, 12 Feb 2025
 07:02:11 -0800 (PST)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Feb 2025 07:02:09 -0800
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Feb 2025 07:02:09 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Date: Wed, 12 Feb 2025 07:02:09 -0800
X-Gm-Features: AWEUYZm15ZGhN4kwVNpit-crolY82HCWxHmb6fls6IBOcuU21xjTZqjJWHV2gUA
Message-ID: <CACo-S-0yDKa4KA6Jy_hCGvygz0U9=0yr0aoT1K5avP5WtekmHQ@mail.gmail.com>
Subject: =?UTF-8?B?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIC4vaW5jbHVkZS9saW51eC90aA==?=
	=?UTF-8?B?cmVhZF9pbmZvLmg6MjI1OjI4OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYdmEuLi4=?=
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

New build issue found on next/master:

---
 ./include/linux/thread_info.h:225:28: error: unknown type name
=E2=80=98validate_usercopy_range=E2=80=99 in security/landlock/net.o
(security/landlock/net.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://dashboard.kernelci.org/issue/maestro:137e010e3d61dc46e=
10f16fec9e6734266fa9c64
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
- commit HEAD:  c674aa7c289e51659e40dda0f954886ef7f80042


Log excerpt:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
                 from security/landlock/net.c:9:
./include/linux/thread_info.h:225:28: error: unknown type name
=E2=80=98validate_usercopy_range=E2=80=99
  225 |                            validate_usercopy_range);
      |                            ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/thread_info.h: In function =E2=80=98check_object_size=E2=80=
=99:
./include/linux/thread_info.h:231:13: error: implicit declaration of
function =E2=80=98static_branch_maybe=E2=80=99 [-Werror=3Dimplicit-function=
-declaration]
  231 |             static_branch_maybe(CONFIG_HARDENED_USERCOPY_DEFAULT_ON=
,
      |             ^~~~~~~~~~~~~~~~~~~
  CC      crypto/michael_mic.o
./include/linux/thread_info.h:232:34: error: =E2=80=98validate_usercopy_ran=
ge=E2=80=99
undeclared (first use in this function)
  232 |                                 &validate_usercopy_range)) {
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/thread_info.h:232:34: note: each undeclared identifier
is reported only once for each function it appears in
  CC      arch/arm64/mm/pgd.o
  CC      fs/proc/self.o
  CC      mm/mmu_gather.o
  CC      arch/arm64/mm/mem_encrypt.o
  CC      crypto/authenc.o
  CC      block/bfq-wf2q.o
  CC      arch/arm64/mm/mmu.o
  CC      fs/proc/thread_self.o
cc1: all warnings being treated as errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D


# Builds where the incident occurred:

## cros://chromeos-6.6/arm64/chromiumos-mediatek.flavour.config on (arm64):
- compiler: gcc-12
- dashboard: https://dashboard.kernelci.org/build/maestro:67ac3516b51b43eae=
dd7bcf6

## cros://chromeos-6.6/arm64/chromiumos-qualcomm.flavour.config on (arm64):
- compiler: gcc-12
- dashboard: https://dashboard.kernelci.org/build/maestro:67ac3519b51b43eae=
dd7bcf9


#kernelci issue maestro:137e010e3d61dc46e10f16fec9e6734266fa9c64

Reported-by: kernelci.org bot <bot@kernelci.org>


--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
