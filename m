Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38CC2FB61A
	for <regressions@lists.linux.dev>; Mon, 22 Sep 2025 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542349; cv=none; b=MgXB8Fj1KO6vpXSa54HMIeNVwzM5wdo6K8LBj/GRLcPlCMhTI40X5/v+qamGj1/Jjv6VYT6Ul56XXms6SYtAXbs2s13BzyaOvIteLkz4m0Ac0yNWSMKdOTW8LxSZXaeVhPf8/c5/fqEV7r86BA9Hjfu42AKfChwbfyaB+BF2g+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542349; c=relaxed/simple;
	bh=8iOAb7k9M3R892MfyDBFeeAalq8574Z6x4gz4w92fzI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=PHRi1yQloKYK6RtJH5BBxtNXwMN9SeENu73Ji3k7lM7l03QKPfoAFRurWln5P24ZhSHM591x3n2s8YKhYwVzE1kxnvEfidEi4SKLFDs5N23nPj/I40A9aFgfmqVNE70NGwmNg245NdXcUZh36mKl6zJRFAVY9iEpIgtFAXTEeUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ypGPbOsX; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ypGPbOsX"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso3246338b3a.2
        for <regressions@lists.linux.dev>; Mon, 22 Sep 2025 04:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758542347; x=1759147147; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3szr+kJTUuNS+iVcKOU+a7GHZg5bpUVvZtqIRdh2MYc=;
        b=ypGPbOsXVRxEuqY6n9KiyWVP3pabJASwZ3Aqg8pQhdmkqPhBuOwyiifv5KF/25+zhK
         3H/8s9WC+c5q0GCSc1WFVPvJtIj9GQC0xErAIe8sk0vBWwpxsOUUf25Ae0JR1wMJDHQL
         vv97xN53KnP2t6Zk9yVlRs3D5fVvH/12B6mf36SQClBEJmBLwPWMiQbBkxsWAVyQL8PN
         TbodFxARepct2z5byDkFeS6yDpF0FdAWrh5UdLyi0kXyecq6HTbxp12PMKB3x72WVhzl
         5WosR5+s2XXjN67XL5+zJQRHEhAFc+in97FEKWGyIJ6isTWr+EJV+oFdBGJcpEEZSWy3
         PD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542347; x=1759147147;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3szr+kJTUuNS+iVcKOU+a7GHZg5bpUVvZtqIRdh2MYc=;
        b=S8DNhiVekk/GwZ30//lQT4nf85QIZCVnk/+qzlCtpLQgZypCaS5nlzwVWY6wbUc6T7
         ECJoInQK9paWSLspGZ83BP9wuu4FRC/7H3B8CYB37KyM3k3U2ehZ9MsVEBssGWOEuyDf
         EZWGgyeUsYSYC6zBoSAXBwnVJON0f8NAcseASRiO3swfOntumZnh7Cnden0Zav0BkfXt
         bfi7HfQqYKRvYroDx16v0PNuscWHynfV590cY9hmfpjJxVaw03r46gZ9ZNS5M2TVPMRv
         04YkHm32rqZjTNDQV/mYtss+L1zCjYadXjxBAUkYtDjInC4u2ln3NXchjy5f8vhnG0Am
         Cmig==
X-Gm-Message-State: AOJu0YyGc+FyqpxLUy9oTf8vg6lpgKECx9VuBWKeA1zfZ/OMSbGegmFB
	tPrhYe/bG729lq16o5K6pUUs5Ubj1lkVs7trMffJ7LyJYnoSqi0MpZ8MY+6EdER1Cno=
X-Gm-Gg: ASbGncve+mPyCtddkVjJNKATAOqk42BGvVDklLq721LX6FhF9iXkrvW7vOcuVKettAR
	2YZFWPbQoFaErPIobAQQwOOmC3kzKG1kvH8LBN65lybYVss6uQ0Xt+fnrKP8cpRFM/CoatVva3M
	VJXKtGlzlDXfR+98Oj23pAGV152WFsm7B/XQNAvlimWdE0lR1TVrcdecXUDtCZhDzSOWi5Y4LCN
	sly/2B5gPA212wG6/4evgbZg5bTns2kdqvkJAQdxCtPwNkyJXAOsmfbqQ1klmxtRZS689iNkMVn
	I+V7YWuJc/J51BuucJYEXxQiAiPKW91e7UG+DZL8MJ+SHOWqR0eq3FHwsyN4rBB4XMVrPqFwxNm
	ORiXUeAY/A7yREuIGU1JJn/h4sK4=
X-Google-Smtp-Source: AGHT+IHo0J6DmO9uvDERQYmbyjGnFsDOfDJfTmhDv2LK6SDL8fW1Y2citMkFq8VMqbDlBoQE2gOJfQ==
X-Received: by 2002:a05:6a00:2d21:b0:76e:885a:c332 with SMTP id d2e1a72fcca58-77e4f29df94mr16875675b3a.32.1758542347169;
        Mon, 22 Sep 2025 04:59:07 -0700 (PDT)
Received: from 1dfac204f25d ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77e0bb98790sm10380518b3a.9.2025.09.22.04.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:59:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) comparison of distinct pointer
 types
 ('typeof ((mirror_idx)) *' (a...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 22 Sep 2025 11:59:05 -0000
Message-ID: <175854234556.873.4742782914953194439@1dfac204f25d>





Hello,

New build issue found on next/master:

---
 comparison of distinct pointer types ('typeof ((mirror_idx)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types] in fs/nfs/flexfilelayout/flexfilelayout.o (fs/nfs/flexfilelayout/flexfilelayout.c) [logspec:kbuild,kbuild.compiler.warning]
---

- dashboard: https://d.kernelci.org/i/maestro:76d27462ca9e8dd64519bf79c841aca15d98a0e5
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bf2602a3cb2381fb1a04bf1c39a290518d2538d1
- tags: next-20250922


Log excerpt:
=====================================================
fs/nfs/flexfilelayout/flexfilelayout.c:685:2: warning: comparison of distinct pointer types ('typeof ((mirror_idx)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
  685 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/div64.h:183:28: note: expanded from macro 'do_div'
  183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
      |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
fs/nfs/flexfilelayout/flexfilelayout.c:685:2: error: incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
  685 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/div64.h:199:22: note: expanded from macro 'do_div'
  199 |                 __rem = __div64_32(&(n), __base);       \
      |                                    ^~~~
./arch/arm/include/asm/div64.h:24:45: note: passing argument to parameter 'n' here
   24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
      |                                             ^
fs/nfs/flexfilelayout/flexfilelayout.c:685:2: warning: shift count >= width of type [-Wshift-count-overflow]
  685 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/div64.h:195:25: note: expanded from macro 'do_div'
  195 |         } else if (likely(((n) >> 32) == 0)) {          \
      |                                ^  ~~
./include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   76 | # define likely(x)      __builtin_expect(!!(x), 1)
      |                                             ^
fs/nfs/flexfilelayout/flexfilelayout.c:696:9: warning: comparison of distinct pointer types ('typeof ((mirror_idx)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
  696 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/div64.h:183:28: note: expanded from macro 'do_div'
  183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
      |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
fs/nfs/flexfilelayout/flexfilelayout.c:696:9: error: incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
  696 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/div64.h:199:22: note: expanded from macro 'do_div'
  199 |                 __rem = __div64_32(&(n), __base);       \
      |                                    ^~~~
./arch/arm/include/asm/div64.h:24:45: note: passing argument to parameter 'n' here
   24 | static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
      |                                             ^
fs/nfs/flexfilelayout/flexfilelayout.c:696:9: warning: shift count >= width of type [-Wshift-count-overflow]
  696 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/asm-generic/div64.h:195:25: note: expanded from macro 'do_div'
  195 |         } else if (likely(((n) >> 32) == 0)) {          \
      |                                ^  ~~
./include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   76 | # define likely(x)      __builtin_expect(!!(x), 1)
      |                                             ^
  AR      drivers/phy/mediatek/built-in.a
  AR      drivers/phy/microchip/built-in.a
4 warnings and 2 errors generated.

=====================================================


# Builds where the incident occurred:

## multi_v7_defconfig on (arm):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:68d1301275b320799d36f149


#kernelci issue maestro:76d27462ca9e8dd64519bf79c841aca15d98a0e5

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
