Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CF2305E2E
	for <regressions@lists.linux.dev>; Mon, 22 Sep 2025 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542350; cv=none; b=Ffik98u6hFWnGE2N348frT7VIOeRiXJV2pVIB76WG//8k8WoXHbzudF8VrpuEbfRncFiZMRSrbW2Kd1HzZXtMkuIAdQ1w+dhGg64+8CQk3Cplz5mopkM6USAIzqmCAY2G4zvWrAcJqCbu9HUBGUVvZLkyyzTJ4lJpGooGaZ2CPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542350; c=relaxed/simple;
	bh=8iOAb7k9M3R892MfyDBFeeAalq8574Z6x4gz4w92fzI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ZWrRp1S5+ttas6NLPRjxioOZN+TxQusQ2H3wwuRYVuJn7qJAOveMUOmd0NnIQaBK44Eri6zFKlsJmubZa6k07OiwMiLq0aMLyQmY011BeTIJEcgqca6xUI/LxJkGjGyXaW0Tmmj/19H4t2qh5Ac7bDBHkzgy5tkOM4nF0k+nneQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ZxPPxThd; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ZxPPxThd"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77f169d8153so1981795b3a.3
        for <regressions@lists.linux.dev>; Mon, 22 Sep 2025 04:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758542348; x=1759147148; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3szr+kJTUuNS+iVcKOU+a7GHZg5bpUVvZtqIRdh2MYc=;
        b=ZxPPxThdaj1EYS9XzjEMFV2xWk3MDDVGux7V5Qo+7mt/UwP5LztAbEYrnSxaS5zy1X
         IBUizyWPL0KRQ4PjMqGuOliYn4dQcBwi7kCWwfHgJV9FojFyGevixqTzo+nWxXiBiXOr
         WI26yLAYaQDTZvJ9avEjHkkhjDXE01xw9hiwjWBrt2/M7C3uKcHZ6raP+Ik8ziQ6Oc5h
         KZC7DS7EbPG3ijYKYU2X5eO8Gi4HcmONhjHkBR2yAmK6gFZoZ5HXlif/EZGoxkmiZ+/q
         w0UhNqs9br6ti4RO1NI8akFzyEnLtNnzOxkLFCeJ++6XCln3hjMDvNzGiIiCYSZc4I45
         8mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542348; x=1759147148;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3szr+kJTUuNS+iVcKOU+a7GHZg5bpUVvZtqIRdh2MYc=;
        b=e3cDlHJB4ogSnmRnX0ug6POnUfaAeHwNNn9YzccZ9WFv08cqDYVDI6Y8tR2OARxsiu
         lW52ZUQ7Oy2g1/MSsWc3sm2xC3NRnOZjoSBfQvlaRpzo4Habqjfa9yg1wiHNgrYkxLRU
         xGWNnb/DRqq0P68+O6kEEvjnetjQYH13hW8BHPg85oRp9TTBMDY+wBFHUs10KUJ/IYtL
         Gor4sZXHpUxrXMDcEOCob0/pUhJJW3PHQvm/KWjyEql1zwb61XCeEqF6aQx8kyQjJCD3
         urG9XCPTP4Bn+7nLPU4UbLhKjPAoEXpQ9YS3/mpBFPYOYs4yK8IcgMduWPOVFSoKHDDf
         8CLA==
X-Gm-Message-State: AOJu0Yw37kp0ULXJ1+pjybtFwkpmBHHhiiX4ca8I0eu7SW2GGT+FubSo
	PghlRAj3dZe6V8DvqUqzpBxH+EE0lUWOvu2saIRYGR4jOHkq04kWmYfmGHsjxvrzSZM=
X-Gm-Gg: ASbGnctYu+IxWOgVilBj7gkxbYfjL1oMf+2p6QDhUVUbh4EkWxHry6j0gFnlMIiE1s6
	eyCOk85HAr0Jf8vrso9zli5YSKs5zTfvNpDWd8t79ViFHBbSfLY7+awH+p3pHQeWJSElEWFpG1K
	FajnKUHEcb7uAEaK9BotBfin8yqrc2lnzeS1mVZOC02ktxlJUZW+z0e22AqBC7uXiwwN7UeRmbf
	3faLfR26NCYgpWf3Uwki60hLtCjO1K3+qjZGdBhOi5WfuEViDXOVEGGae5XMCkucLlLyunJ9DSt
	PvZ2oLKNyWLW0TW+txGF5isdM7NnUSF2x1hmty8vkFukPr98OZsqoT6FWUFt5/hHRQi0T0qlJuD
	6gasakop2n74D1Q46
X-Google-Smtp-Source: AGHT+IEo6TxyeKQFPnH7fFjO/SFRiLs45bi+V+6/rjTaNwCleBNEA0whKIvyEP7jO4bUrtuvNsLcZw==
X-Received: by 2002:a05:6a20:9149:b0:253:1e04:4f4 with SMTP id adf61e73a8af0-29272b52720mr17042976637.48.1758542348016;
        Mon, 22 Sep 2025 04:59:08 -0700 (PDT)
Received: from 166871acc15a ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff3fd7easm12057676a12.30.2025.09.22.04.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:59:07 -0700 (PDT)
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
Date: Mon, 22 Sep 2025 11:59:06 -0000
Message-ID: <175854234627.725.771324603757490830@166871acc15a>





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
