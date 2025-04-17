Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8FC207A30
	for <regressions@lists.linux.dev>; Thu, 17 Apr 2025 20:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744923547; cv=none; b=t41U88A4ukj3Q1Z5Teppv5nMLKKOq0k3dIxvYFzSG8aCXzqnxdwUNkAkUW1xzmUUgP2pva3aZhEBTHDI8Nl6+Mfv0CIux3bSCJ/ujNeFWqYWIirDKh4Vw/JmdYxCrHA7sfJlGA/5quyTq6bwF/MY2UbIofhmvTQ7BWdWRH4O17M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744923547; c=relaxed/simple;
	bh=FPv1ZWA3SVRut5D1KBbX8VHcVG6F+5Ai+0bw3Qe4ouM=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=tXnNEuEajAuWh/rwp/iNedkjYY4+Y1Zm78dHW0Qf0jrwiiHTUbMs2WIALOJdkh68ayB0IvYcf/0rz239YNJBYgXnhIh4vcJjLyHkIjoqW2qg5kOx4VHbo9Nheu0b9pXNGJmJ7sYKHxCp+gqiQne1H0GgMbMwXbrPtv4wpdd8P14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=XXZDCijg; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="XXZDCijg"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7020d8b110aso11621307b3.1
        for <regressions@lists.linux.dev>; Thu, 17 Apr 2025 13:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1744923544; x=1745528344; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgB13twq5vpvqEzoJ+7vDkX9KulnT1RIMYETzjEP0yU=;
        b=XXZDCijgmUzFcIr2yACxopnUmRsswPCYrYq8wOuNruk/Ou0Vvl0eHv9nSl/EdGBi/c
         7sWBompirOOkuzyOyHs/bqyfyIbbnER6jaoSUd73bTiMq3fufq4S/ly3tGgeYRv7MEO7
         PkHVUmRI2DCXWYz+FLV5AJdyuscQP8KdYoRrBknaFei45tVMXJGoSXoBobLtWp+NAW9i
         n4x0rD7QS3e72mwWAChDHVocDafZ3y6kmK9YIqTIYoil/4vCHELUPhrDzUiIEu5jtJuy
         ZQoIRM+rfxqfvh/G7ajX9CLSEzSw8nQp5LiLHLy+eHlXiexRvSxbuLqDJGbtTzTru/9w
         /cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744923544; x=1745528344;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OgB13twq5vpvqEzoJ+7vDkX9KulnT1RIMYETzjEP0yU=;
        b=e5H0PFoq5HSdSxZ+QPlS8e/iXWafgvHgccXJyGti8lr8kOheXBEjLDl3NWloPsZurj
         Jb38OzRL24a08l64jKzGi2Vrpti6Dd13RHzJwYAtlewazeS5MHOinqnL8SZS7kvNnc8p
         +OyTvwKXzLzskyjcmFS08/AsJLlFNIUNyuqijr33P8H8TntUe3VOoRw9cDadxZcJiSTx
         YWEdaQcYTFsBMxU2U4MHCJHIOr4jZtzW41Rmw5HvktjtVJFC1vtlLHyu36NSkSkdIrSl
         yfQ1oNAcspwQExy+cm4w3oNARBJnQHZij8qPV8f5u0LCm37bw774DyxfvhzQviz0xOVa
         Efow==
X-Gm-Message-State: AOJu0YzGK5ti1r4v2FiX46nHJKuh42WpD540ovjPxXiWbz9y2zbBtesY
	PBfDJ8PbHdrDX8/OShIf9Iw2o89zBwC4Au12pWosRdAoZp6zCHsIpXFqnhFeY1b+J8CeKO+/X2N
	Gz2nXycYeNf6edL3cNOz6sM26c/npCGwEi8nd8g==
X-Gm-Gg: ASbGncuuD3U/IHjuRAi/XkdcvkL6zdbc3a0wbgnIEJmWlJ+p7pwY6wfXKkU0ZSaPQL5
	5hXFkYVaZ7a5MYScUTiRC0GlwQdtc/kXTeyi7EgE/6phRoA0lewYcCKUYXnB7LU4ZA+7SmfaEkD
	QAO5qUGLCqz6u+85U0eVbeyStyZfxbBUE=
X-Google-Smtp-Source: AGHT+IFe8kP8VwMXs0RtKiwr7kjTe1lf4IC0QokG0fPbuCE6fY1DBhNrEVPKAZABVS0+Wf1xCYwlUfqLjVclYzC7Rsw=
X-Received: by 2002:a05:690c:6888:b0:700:a913:854 with SMTP id
 00721157ae682-706ccca86cdmr5665557b3.5.1744923543951; Thu, 17 Apr 2025
 13:59:03 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Apr 2025 13:59:03 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Apr 2025 13:59:03 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Thu, 17 Apr 2025 13:59:03 -0700
X-Gm-Features: ATxdqUGa9dqj4BB8r_AK8JaFQnOreBVOikN7qPhwwth3388yXP_mmerHWc28jys
Message-ID: <CACo-S-21iUmPaQoARiub+iiTwqYOta-DPvfdd=1Nb8iW1a1O4Q@mail.gmail.com>
Subject: [REGRESSION] mainline/master: (build) "__aeabi_uldivmod"
 [fs/xfs/xfs.ko] undefined! in Module.symvers (s...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com, 
	shreeya.patel@collabora.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on mainline/master:

---
 "__aeabi_uldivmod" [fs/xfs/xfs.ko] undefined! in Module.symvers
(scripts/Makefile.modpost:147) [logspec:kbuild,kbuild.modpost]
---

- dashboard: https://d.kernelci.org/i/maestro:977ba6639ed619058b7e88a8aba33b7cc81edf93
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  7adf8b1afc14832de099f9e178f08f91dc0dd6d0


Log excerpt:
=====================================================
ERROR: modpost: "__aeabi_uldivmod" [fs/xfs/xfs.ko] undefined!

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:680136c769241b2ece0ff7f8


#kernelci issue maestro:977ba6639ed619058b7e88a8aba33b7cc81edf93

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
