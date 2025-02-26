Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DCE2AE9A
	for <regressions@lists.linux.dev>; Wed, 26 Feb 2025 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740562495; cv=none; b=MKs2bBEezJU0Jy6bDu+8Ogdkw8AnR0W1lTo8XQO77pUBSV9DilGACrzqULYs9yiYuadQCO2EcvFqI5Od75B11OKfpqYvfrZPk5cKVYftpIfdmOqav4e+h8bHyo1u5UzPG9IjlTiiY1+tebeh5e83Y4tvE18TSJQqkZZe+6C2Hik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740562495; c=relaxed/simple;
	bh=/3MY3IqUKv9uCLbshKR6GoUCK3Pi6WOoNCnyiLFHIw8=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=Z0FyqubgxHzEMS5XNXm0z//Lgnp92wATnu8Ix3fv4TyuCicvLDHKiZsJMulXXGmst/u8U/cOGwWjrzdhCaaR6DTy2jTkPsG/iPQDT+P62k35I+OcbIcFqsPh6QBv3UEkD4xPJ1PeqjJi81flh9jQxHDnWTGhRSzFDTA8NWqRG3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=FCq21rHc; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="FCq21rHc"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6fcf0617523so28303947b3.3
        for <regressions@lists.linux.dev>; Wed, 26 Feb 2025 01:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1740562492; x=1741167292; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkNov1NO7p31Q7s5icaLo0Yfjwu6p2gGVyjcXe6U9PY=;
        b=FCq21rHcodKBwv/oT0blIDhQpGFzKErA4uYDQpIJpajwKYcLpFIGe3OaBwN6K/rR5e
         ncRIy+Imi14TfyaSS+mTOY3ghG8WyUkBwPoio7ZVakR9hPVFFnc3fEJye1nh208QdUNw
         U0H3VkWT7ekTw5jLpq+2d/+HBnBoajo7GH3bZyF+RkTsz5K+77MW0xmiTx63QDS+/wIs
         xFBMPA64o6QhvN0HmiEaCJHkyci34aXcVGFV6y9SuPLO+JMAcPwhUpyYcJGLmAJdzgXy
         GLRjG1wESHHdWTU4cJXr9ffFW/mUDlDp7XfqDy9LP6VbOe75MLWgiwmu8fri6654sERH
         kGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740562492; x=1741167292;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkNov1NO7p31Q7s5icaLo0Yfjwu6p2gGVyjcXe6U9PY=;
        b=lmpFOshHMAsGgseOHCvrqfcbTn62J0TAHOFlHXqIRuT3qMUFD+FLp16NQbQixTvcUA
         R45GJio+s8WeTqrXRf9gTxrfPblKwvy5492BrRyOnKw9mcbjWCir8HWpwY5tyqdlUhG/
         +G3kWiXJX3rVQUYZc1BVHweF93PU+UkS8VFET0l8UzXkIRzzoTz2lCoBoxQDR8tRSzwQ
         ndok2+Ac0n9TzVG6uEVjxFA98EHkB+fOVRujij87ZnShuBQyTVG7HFsMbzJfwXPAdXZ5
         Ilb/Hdh9mRV/P0ZjCAYLa+94XgcRnvwXqV5ZPSoD7FPZEx2LlB7YpgRh53W+JJ3FD2wk
         pL1g==
X-Gm-Message-State: AOJu0YwB8DHjY1VLl5cXtPDKHWcFX76xQrrt05FlsnfbzniPVAOfsTz3
	aNtq3YMa9eyBHTElkgo7g+Pj/zOsbfldlKUFizsmtwwj+Ad3WEe2/Ryp3kCvJ+n5diSSgDdf7/I
	ARkeODoFdwVPSXA4iStYAtl5Ys5M5rrnXRJfCng==
X-Gm-Gg: ASbGncuc7ILgBdTEAYBxoWFlBS+Uxix4ShTSnGCInzvPU97AX2VsD6ZV82DzjwEXLK1
	U2RfT1NYqnczf4ist3XWbsEqBeFWKLpc1SVEcqB1MTloc+lEkSVJJWVtuxzuD/0SqQQI26v3ms3
	EzcyC06PRNEOwp0PR7Eckp0ODIwyedLSka6XEws8xG
X-Google-Smtp-Source: AGHT+IGDl4UN308udeJTcJqWyRvra4LejQEjEKXTweFMInNxdwCfwYvG0fQd7uXMOmlqTPh3FEnIhBv6DSFK/Us+3Ao=
X-Received: by 2002:a05:690c:3807:b0:6f7:ae31:fdf with SMTP id
 00721157ae682-6fd109ecae8mr61115067b3.12.1740562492365; Wed, 26 Feb 2025
 01:34:52 -0800 (PST)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Feb 2025 01:34:51 -0800
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Feb 2025 01:34:51 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Wed, 26 Feb 2025 01:34:51 -0800
X-Gm-Features: AQ5f1JrOPXUWqTkCJ6LRB67TBpmcgVWRLoK94WkbLdE-39cT04t1FOLkXSO1gAs
Message-ID: <CACo-S-0dFTtSNf+0CVgARwtW3qMkY1RwUyZWgcWPppKKkGUfLA@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) variable 'uflags' is used
 uninitialized whenever 'if' condition is...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 variable 'uflags' is used uninitialized whenever 'if' condition is
false [-Werror,-Wsometimes-uninitialized] in fs/namespace.o
(fs/namespace.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/issue/maestro:1781983bb469ab82952e8157bf2698e16cf6c037
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad


Log excerpt:
=====================================================
fs/namespace.c:4622:6: error: variable 'uflags' is used uninitialized
whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
 4622 |         if (flags & MOVE_MOUNT_F_EMPTY_PATH)    uflags = AT_EMPTY_PATH;
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fs/namespace.c:4623:48: note: uninitialized use occurs here
 4623 |         from_name = getname_maybe_null(from_pathname, uflags);
      |                                                       ^~~~~~
fs/namespace.c:4622:2: note: remove the 'if' if its condition is always true
 4622 |         if (flags & MOVE_MOUNT_F_EMPTY_PATH)    uflags = AT_EMPTY_PATH;
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fs/namespace.c:4602:29: note: initialize the variable 'uflags' to
silence this warning
 4602 |         unsigned int lflags, uflags;
      |                                    ^
      |                                     = 0
  CC      kernel/bpf/arraymap.o
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:67bea9d9a694a9a6d835d1b9

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:67bea9e0a694a9a6d835d1cd


#kernelci issue maestro:1781983bb469ab82952e8157bf2698e16cf6c037

Reported-by: kernelci.org bot <bot@kernelci.org>


--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
