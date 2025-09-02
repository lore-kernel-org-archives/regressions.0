Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B0C275AE1
	for <regressions@lists.linux.dev>; Tue,  2 Sep 2025 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805433; cv=none; b=m88sVGV4msBdaAkuijIIvjzip2KuJlXOUH9aSWbOmydYEWrhZsKDiuHXBplvwQFP+i15Obqa6b6/Tsz/3CVWwv6MbdvevD5F2VdSp5fa8MKRVYuVBYSSKhAh/tRyhVI8ioVF/81MAIn5wYra++r3JxpXtc0rTL8kUEoiCd8jM74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805433; c=relaxed/simple;
	bh=dM/J4EWSRWSIxbOj5OAlxBlqKOA6FNTaQsCA4gH91BM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ehVJ2HTUnZJyf9SI6vazLMxNfYXYRO3loBSqXJ23sN99AmLShneYZTzTW9AAdkg9i24aErPzu78vACk8A9dOnZ2+W9ssFduLtemY6DwdCJMdsNbxXVzxBOBFGd7098Q+DJbD/LoEEHj0eWPzTdf9LrJKlQgMImu6n9EGsD0T3eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RRXcCrK6; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RRXcCrK6"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7722bcb989aso2744438b3a.1
        for <regressions@lists.linux.dev>; Tue, 02 Sep 2025 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756805431; x=1757410231; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D7OKt9F9u3JGw8Hji9kO63gaBin4yVJprAEpigams7g=;
        b=RRXcCrK6OK0zzhI6QNub7ST2SvKuMsnB/YetRLFoaYtR7xrGBmcx0VVa7e6SI9YKhm
         Be0MN2ZhxMovguJr9ZYp4sfD7b4mfX/BrJ2XCpQ0nv9rtucM//9kqodecngfuMZSFnEn
         vqbevtWF3U9sgS0fQHnMdc14XO15lLaF8yNujYXpW5LC7BJdQGkGt3XXmNBEbS3hF4BX
         OcFfRM3HeFLo/PxnVh8A5pmRehXIyLDvfTURhMfr35bmUlqjGURFFB56CdDzuVwIv1l9
         AaxkIyTumN/45Cp0xRWt4oubum9+jKGBa9YljixSboqwNeIc4kcUrGxZGU915FnuTdwi
         bSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805431; x=1757410231;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D7OKt9F9u3JGw8Hji9kO63gaBin4yVJprAEpigams7g=;
        b=Sb+2ep1Jbh77cxafWxxIfNuvbWHMOEMcpwwQO0KbmamPmFdMUe6Jzj0y9hD+FfzE8z
         UKo7pP28+FG3Ez1rj1FIQ4WsCus/yeQhfa7zUQZO4W0S7zSShmek3ElxauY4eSgGYte1
         AZjFiz5tkqOtNTckGU9yGKHWzvFYLTjWgx54Xx1B753YKowMfNqbQaeoNA7TNcxMUUFs
         vXGQaG7CTF5TKJ/yDrkyllvgfquKHaG/NcJPbs5XArwOpZrlaskI4n5O2DiFxws/D3U5
         ljLNjWpo1xbmCS2NiAoio/QYe8LuqZMiycaa7xC8tsv0navj0e629Vk40DmN+KG9TrZg
         R4MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfoRXw0KWm+i9HkXiA+RBssdbetFVdy8wagaCKtzL6Xv1ENEvNkrNo/+3zlxUq1F3zpwftHoWtx6V4fA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8ACOOzk/e9Jefwu10IQ5Z+T7eyNI/3UUkApYRz4jOg/Uuq/hL
	Sc5ujOG9HzpPqXi5AcYYaz+O9nS9m3G1Fi0JR+jai2L//yGDc8xTyxChEvXV3dfB4oE7sRGEKiq
	CgNSag4tBMrrG6aaWUFLE5mDVYfYcUMDpTwDw23XWsQ==
X-Gm-Gg: ASbGncsVkURZSrOXvEVmwWx0wQYRQTlZNXNjo63BvJcbj/8Ic5accPOqWMJp+FzHFvN
	CsMD5hd50L1nWFlEQQDKC/39go9OI/MD2HKD4Z/WqKvp9p9vmFycjVbYgyjuUG4ubCNLprd3YaV
	idbUmWlHHRnhreIAVMckDAAn7Xr0tJjTFlBkY0zQwxMtprdRcrj5I/WI8fOxvzq9JFv0QJVKQSL
	SaR7Au5CsH66xdoSoEw4EshF2Gsc4xLUUOLCzmc
X-Google-Smtp-Source: AGHT+IE8Yrx7PIEHWr7GBuT6CR6OOXizH5auPXW+y/+V0FBm3oCtap+/O+brH9ArwbKXJtHKdi5XLNVxxZpQhJ6oyCI=
X-Received: by 2002:a05:6a20:1595:b0:243:d26c:4802 with SMTP id
 adf61e73a8af0-243d6e00a3cmr14965979637.16.1756805430855; Tue, 02 Sep 2025
 02:30:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 2 Sep 2025 15:00:19 +0530
X-Gm-Features: Ac12FXx1zyo6Or4T4_OK4vkNL4SKnoNS4plyRwcQt4YbOf4Pp4VblMYRHeLcvTI
Message-ID: <CA+G9fYsgiqTo7t3e36P5cysc+jEX5Fub1quTj+fuKGM8jkxbFA@mail.gmail.com>
Subject: next-20250901 drivers bluetooth bpa10x.c:77:33: error: array type has
 incomplete element type 'struct h4_recv_pkt'
To: linux-bluetooth@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Calvin Owens <calvin@wbinvd.org>, pmenzel@molgen.mpg.de, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors are noticed on powerpc ppc6xx_defconfig
with gcc-13 toolchain running on Linux next-20250901 and next-20250902.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

First seen on next-20250901
Bad: next-20250901 and next-20250902
Good: next-20250829

Build regression: next-20250901 drivers bluetooth bpa10x.c:77:33:
error: array type has incomplete element type 'struct h4_recv_pkt'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Powerpc:
  build:
    * gcc-13-ppc6xx_defconfig
    * gcc-8-ppc6xx_defconfig

Build error:
drivers/bluetooth/bpa10x.c:77:33: error: array type has incomplete
element type 'struct h4_recv_pkt'
   77 | static const struct h4_recv_pkt bpa10x_recv_pkts[] = {
      |                                 ^~~~~~~~~~~~~~~~
drivers/bluetooth/bpa10x.c:78:11: error: 'H4_RECV_ACL' undeclared here
(not in a function)
   78 |         { H4_RECV_ACL,     .recv = hci_recv_frame },
      |           ^~~~~~~~~~~
drivers/bluetooth/bpa10x.c:79:11: error: 'H4_RECV_SCO' undeclared here
(not in a function)
   79 |         { H4_RECV_SCO,     .recv = hci_recv_frame },
      |           ^~~~~~~~~~~
drivers/bluetooth/bpa10x.c:80:11: error: 'H4_RECV_EVENT' undeclared
here (not in a function)
   80 |         { H4_RECV_EVENT,   .recv = hci_recv_frame },
      |           ^~~~~~~~~~~~~
drivers/bluetooth/bpa10x.c: In function 'bpa10x_rx_complete':
drivers/bluetooth/bpa10x.c:99:37: error: implicit declaration of
function 'h4_recv_buf' [-Werror=implicit-function-declaration]
   99 |                 data->rx_skb[idx] = h4_recv_buf(hdev, data->rx_skb[idx],
      |                                     ^~~~~~~~~~~
In file included from include/linux/array_size.h:5,
                 from include/linux/kernel.h:16,
                 from drivers/bluetooth/bpa10x.c:9:
include/linux/compiler.h:197:82: error: expression in static assertion
is not an integer
  197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...)
((int)sizeof(struct {_Static_assert(!(e), msg);}))
      |
                  ^
include/linux/compiler.h:202:33: note: in expansion of macro
'__BUILD_BUG_ON_ZERO_MSG'
  202 | #define __must_be_array(a)
__BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
   11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) +
__must_be_array(arr))
      |
^~~~~~~~~~~~~~~
drivers/bluetooth/bpa10x.c:103:49: note: in expansion of macro 'ARRAY_SIZE'
  103 |
ARRAY_SIZE(bpa10x_recv_pkts));
      |                                                 ^~~~~~~~~~
drivers/bluetooth/bpa10x.c: At top level:
drivers/bluetooth/bpa10x.c:77:33: warning: 'bpa10x_recv_pkts' defined
but not used [-Wunused-variable]
   77 | static const struct h4_recv_pkt bpa10x_recv_pkts[] = {
      |                                 ^~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors


## Source
* Kernel version: 6.17.0-rc4
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250902
* Git commit: 3db46a82d467bd23d9ebc473d872a865785299d8
* Architectures: powerpc
* Toolchains: gcc-13
* Kconfigs: ppc6xx_defconfig

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250902/testrun/29725581/suite/build/test/gcc-13-ppc6xx_defconfig/log
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250901/log-parser-build-gcc/gcc-compiler-drivers_bluetooth_bpax_c-error-array-type-has-incomplete-element-type-struct-h_recv_pkt/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/328DwMMwNOpSAj0qnRpJavgtz9C
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/328DwMMwNOpSAj0qnRpJavgtz9C/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/328DwMMwNOpSAj0qnRpJavgtz9C/config

--
Linaro LKFT
https://lkft.linaro.org
