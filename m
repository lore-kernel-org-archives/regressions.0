Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4AD248887
	for <regressions@lists.linux.dev>; Mon, 24 Feb 2025 14:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407519; cv=none; b=KJAOrUw3S/SCJ8Iikuf9gXKN9DFo/KTY5T/O1f6S20WJlLQi9dGBzDLS+wb1oLFxpzzlza6bx8VbveSdHfhQqKZ/vgvpkmHJeJZgodmAbibpYn1lwPJIK53stAISYy8BgCusdTr3ES7+IYX0WOTOv/2YZ+cFrvXXr1BZJ0blnkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407519; c=relaxed/simple;
	bh=7BTEAjJQ8blhFC1CFNxImWK1MoNpUxID//E6pLg+0sA=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=djq1+YnaebVQZU9xlwygTKzk7hv7zvaYlB/KDG5am8fItW4q4fVeEwi2tEnjTy18Bg1AjoiHD1LbVjSu8siOqbpwuB/XJ+9q0vCOnxpSROXlraRmzOTaANWNj2Z9mS6HMbW1z1LGC76fEj/vy1FE8c/H0q0KzEtCCkPu4nk2YWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=G4qWCk+f; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="G4qWCk+f"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f9625c0fccso37598087b3.1
        for <regressions@lists.linux.dev>; Mon, 24 Feb 2025 06:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1740407516; x=1741012316; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UuRj0/hl5otXS1xzkJHObruwY3rIp1PSjZqlsLGNFo=;
        b=G4qWCk+fgrnYVEcaeg+6B0QG/ocsyuZ6f+1r5aF14FXKO4rjbP6pOmEaddO81JD/h3
         kjYrEPQRkXr7XAldIjaUY1AjQyyDvpXi5DqnFwqZuR0O/lP56SALKt7mVKzVrrOnGFNE
         LgLoLWGwiY5d1JBupV39p3n9qkeGb8i6G7t52bCKmcYKptw0PyzZQixDTByuJ58NTezD
         AcbDYLfKTqp4U1cOBMbfX1/HBcJeI13fbOqdtL0U8y74qJElq/NFxyWD7pd0EVsUGdBG
         y/ylYb5lDzFJZg7EQ74z92AqWVwWD37l3u4y0MCA8PQ68rbu3VtUsxUJqbMCqkyicHHT
         w0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407516; x=1741012316;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UuRj0/hl5otXS1xzkJHObruwY3rIp1PSjZqlsLGNFo=;
        b=TCnnpGMWRLtylhKLZ1cgtuAJAl4oCTu1DKWrRwx9ufg8PUE0Imm53wHu47x1QMDTX6
         wF6fuPnfanQTVcMWRC+MYDW33LJyoqj1lx2CDIFzRllhq7x/s7aYmQj8joUaUECdKYp4
         uxfDcTzS3u/RFzqPFRmrYNvtCDS+o4JcRLyoy3q40qybe8WX0Y1quuxsRq8XTRcjb0xR
         K6gkXrqkKFHtUD99xa1V5l8YYiXYWerMTZ99v+5V2CSEfLOl6ehptARpSnONPMbmAVDi
         lnmZKB46vRHrCH/WKQhBu8CT4CXrnfZlpwVqgJNgwTE4LIYNV21x6NFu0KygHV8Q4+3C
         QD1g==
X-Gm-Message-State: AOJu0YxSNwVDLiGK/jlVLyKDFfm3p1j7hB5h1+UP8tqiDRANsmSRwdmP
	ozdn87EC9gwwcefKaBH9nVeNUfQySPqkHKdYlVZ/VHGTrHK7BzA0prKF9wEuwI+Z4LGbKZiUgPW
	XBuqlEfb5nLG+C9ZtimeMo2y2O2CPWj+EOwzPln9Vrvagcvh8UO4=
X-Gm-Gg: ASbGncvbPO6t8fLvgPKd2d53Gn0qGJwdJjUCfIG+cKMq6QcyoE2wEABY71a8S41nkbV
	3KRSng9X0kQvKuSqQp2qrMlXE/D1JkJJnZs123cYswcgGY12sUJNalZ7DztrOz7WKLuBcp2up3J
	Jv3e/GtmzMGhg4GuaFEAWzdKopGvvOwKtdCunvcjfQ
X-Google-Smtp-Source: AGHT+IGUYB7j2q//Sj+hC9PPLGRvL7/t9IeJ5cNT4TuPQ2qY9Vfdf7lGOuhonLuEkJCiE3jHKeAnEYgjRCIob9+6S+Q=
X-Received: by 2002:a05:690c:480e:b0:6f8:c21c:3668 with SMTP id
 00721157ae682-6fbcc383222mr87719837b3.26.1740407516057; Mon, 24 Feb 2025
 06:31:56 -0800 (PST)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Feb 2025 06:31:54 -0800
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Feb 2025 06:31:54 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Mon, 24 Feb 2025 06:31:54 -0800
X-Gm-Features: AWEUYZmGXc_DjZvNk1TAmw5VLt0FIhBMPOr9VFUlo_5u7VVtGijqe27ra__95Hg
Message-ID: <CACo-S-0GeJjWWcrGvos_Avg2FwGU2tj2QZpgoHOvPT+YbyknSg@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) call to undeclared function
 'kaslr_offset'; ISO C99 and later do n...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 call to undeclared function 'kaslr_offset'; ISO C99 and later do not
support implicit function declarations
[-Wimplicit-function-declaration] in kernel/trace/ftrace.o
(kernel/trace/ftrace.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/issue/maestro:8422848002e8ac24affaabe454c1142ac621359b
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  4ef7aa6a88280d015c6533a210e46efd55bdb57f


Log excerpt:
=====================================================
kernel/trace/ftrace.c:7074:17: error: call to undeclared function
'kaslr_offset'; ISO C99 and later do not support implicit function
declarations [-Wimplicit-function-declaration]
 7074 |         kaslr = !mod ? kaslr_offset() : 0;
      |                        ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## aspeed_g5_defconfig on (arm):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:67bc4c56323b35c54a855ac0


#kernelci issue maestro:8422848002e8ac24affaabe454c1142ac621359b

Reported-by: kernelci.org bot <bot@kernelci.org>


--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
