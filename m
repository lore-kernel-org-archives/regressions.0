Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5781B423B
	for <regressions@lists.linux.dev>; Tue, 28 Oct 2025 07:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761637147; cv=none; b=DuqKds51wrHFuOy+yazrAY+n10FYD7onEPSY/JMBmiKyizSh/EjJCwHLlIQgMPYasdRhmyfoOdXk33aDZ0VqxuvJE/MSOWkdY9BYQ7Q9gkVZA6d1pPoMv4cQV2rPMoM7QH1fzn/VzCiyxXUs98NOnp7ofIJUs3OZFlbPFynk66g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761637147; c=relaxed/simple;
	bh=sH3e7s8xPB6+HNIGAMv6PrTNEE0dGDJnlF85p02RvL0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=R6EmPDK07n6jJw1Wdv5VZD65sk0V9VjC/N+LVg6jI6S52IvltTH23Z+JtmOQXrfiJmlQzjj98One2iGh3t6wBcplHnw6qxgkjJq/b9MNfY/oBda7gWU41kBT4SndnkWGIsx4vfH7kSsZ8khmh30ofiWuuDjNoTNSeEF4Gx6eW8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFDinqSL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFDinqSL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-269639879c3so48549975ad.2
        for <regressions@lists.linux.dev>; Tue, 28 Oct 2025 00:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761637145; x=1762241945; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fZQcAE3NiFPEWRiaaSdgMTBw653ZGnPFrSKRDHStXzg=;
        b=WFDinqSLPbpuH/ZLv+NWriOnJsafCLbvMN+dHcB1k1AmtZUA/1ioV+8GucxitJ0qk0
         SBuLwN+no9ERkNK2Vqf596WejT6/QpR1HXz5aZIsPNu8F2quA8f1Z7BtlhKQ8vTYWoBv
         7so6kEdeeb0OwtCFasTWDbEDF446ObAFIot7mlUjIxZkrQdY1h2SK10aMuugnlAXtt7h
         ZCKBBg4Mum15TKSPLZQJ/WBm7iI2M7yH/lgUisf96NC4/AQflNAjZiu4LmVAc15WPnFx
         doRF2g+dLSQ6vQlBduHymhv7UHUIohCZNjg5OTB8MkHvTm7RfJRKZR47SfUUxHMma+dO
         Dk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761637145; x=1762241945;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fZQcAE3NiFPEWRiaaSdgMTBw653ZGnPFrSKRDHStXzg=;
        b=S23YBfY39s6/RLW0Yjl9B/ntqaEsr1sDkPkrSg5XU/LP5QjxKmF92viXBcVB3C4Xsp
         zS/WxUjkjOkjMhqdUwyW0F/+yDUGnvECOCYAdyCsskcbSYZb4Wa5AGaIaG96Hv3PNYen
         +35vpp7Sd6yOUut1EcjUnBocKinBI8UGzHjXh7ddLRAFJn9IUdEKzuTarePR8Lc4U4OE
         cmd7+Rd3/5oup+BROsfHz7kCJ6k9wwYBTq/NbC8EZAU/SEtK06eziHr5idw6xZ3VQZqL
         VCJ+r3nRgg64O5BAut/9lVHKmzlS2u/APrLo3pBVjY6m5WLwbT0ojyoV2YhxQ7xOoJri
         3BJQ==
X-Gm-Message-State: AOJu0YwmXYkDBPY0E/GKlWO+3gV3f8PPbpjblQO78eM3rEfcyV01pXX6
	fh+dvtqC+QREgyaiblKhW+JUNXg+1Cw6oLUlUdqavZx4ilW8hA20yvkvOt3i37Xxjp8kCzDkSEU
	yHhF7lmldh2deqPYu5FqqIclZPtJJUik=
X-Gm-Gg: ASbGncvUOjXknbOyEIRWncE8CS6Tyi1rXyo50z7XXxsE7gRhGmDsz0i1WftNAyDKQHQ
	ZQvJ7LIC2+b1Kme0YPUSAiDmclRcO2vXLfxTP1ETjVtYHhhcoDebCz1bgjxUW6sU0ocy9H7DBsJ
	aAdzsank2MeQeujZQRubiIbrbM2HeHjhE/pDJAS9ZdWliLyB9nfIaFLxQcSbJu3UwchLwpJ1XXb
	Cx/38Di+mvq01XAUXnSae2gvHh77j+B3erm2kupHT6PxF4EcOcq5rbah5isZi0Rakiq60uc8rGP
	TjAxnM2X8fwNMQ==
X-Google-Smtp-Source: AGHT+IGFh2TYLasVGXUF21rpEaEF/tSw6kHufc0/I2DgN9Fg5FFpCLuzmunsuUK3bHPgMcURl/Aj5TjMj7GW+UrQwnM=
X-Received: by 2002:a17:902:ce91:b0:27e:e1f3:f853 with SMTP id
 d9443c01a7336-294cb35ec0emr25822415ad.8.1761637145420; Tue, 28 Oct 2025
 00:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Christopher Harris <chris.harris79@gmail.com>
Date: Tue, 28 Oct 2025 00:38:54 -0700
X-Gm-Features: AWmQ_bnrt0pbyscnBc_FU7k8Dqzb61ZnfyKrV__muDPkT_bA0X_pvnkmcGfo5-g
Message-ID: <CAM+eXpdDT7KjLV0AxEwOLkSJ2QtrsvGvjA2cCHvt1d0k2_C4Cw@mail.gmail.com>
Subject: [REGRESSION] AMD P-State fails with "_CPC object is not present" on
 AMD Zen 4 (EPYC 4484PX) between 6.10 and 6.11
To: linux-pm@vger.kernel.org
Cc: regressions@lists.linux.dev, mario.limonciello@amd.com, perry.yuan@amd.com, 
	rafael@kernel.org, viresh.kumar@linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced: v6.10..v6.11

[Regression precisely identified: Last working 6.10.0, first broken 6.11.0]

## Summary

The AMD P-State driver fails to initialize on AMD EPYC 4484PX
processors starting
with kernel 6.11.0, returning "_CPC object is not present in SBIOS or
ACPI disabled"
error. The same hardware works correctly with kernel 6.10.0 and earlier.

The regression was introduced between 6.10.0 and 6.11.0.

## Hardware

- CPU: AMD EPYC 4484PX 12-Core Processor (Zen 4 architecture)
- Motherboard: SuperMicro (confirmed CPPC enabled in BIOS by vendor)
- Tested on multiple identical systems

Note: This issue likely affects other AMD Zen 4 processors and
possibly other AMD
generations, though testing has been performed specifically on EPYC
4484PX systems.

## Regression Test Results

**Working** (amd-pstate loads successfully):
- 6.8.0-84-generic (Ubuntu 24.04)
- 6.8.0-86-generic (Ubuntu 24.04)
- 6.9.0-060900-generic (Ubuntu mainline)
- 6.10.0-061000-generic (Ubuntu mainline)
- 6.10.14-061014-generic (Ubuntu mainline) **<-- LAST WORKING (latest 6.10.x)**

**Broken** (falls back to acpi-cpufreq with _CPC error):
- 6.11.0-061100-generic (Ubuntu mainline) **<-- FIRST BROKEN**
- 6.12.0-061200-generic (Ubuntu mainline)
- 6.13.0-061300-generic (Ubuntu mainline)
- 6.14.0-061400-generic (Ubuntu mainline)
- 6.16.7-061607-generic (Ubuntu mainline)
- 6.17.1-061701-generic (Ubuntu mainline)
- 6.17.5-061705-generic (Ubuntu mainline)
- 6.18.0-061800rc3-generic (Ubuntu mainline RC)
- 6.17.1-1-cachyos-server-lto (Arch Linux)

## Error Message

```
[    4.508125] amd_pstate: the _CPC object is not present in SBIOS or
ACPI disabled
```

## Steps to Reproduce

1. Boot with kernel parameter: amd_pstate=passive
2. Check driver: cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver
   Expected: amd-pstate
   Actual: acpi-cpufreq
3. Check dmesg: dmesg | grep "_CPC"
   Shows: "the _CPC object is not present in SBIOS or ACPI disabled"

## Kernel Configuration (identical in working and broken kernels)

```
CONFIG_ACPI_CPPC_LIB=y
CONFIG_X86_AMD_PSTATE=y
CONFIG_X86_AMD_PSTATE_DEFAULT_MODE=3
CONFIG_X86_AMD_PSTATE_UT=m
```

## Testing Environment

- Tested with vanilla kernels from Ubuntu mainline PPA
- No additional modules or patches
- Kernel not tainted
- Reproduced on both Ubuntu 24.04 and Arch Linux distributions

## Impact

This regression prevents affected AMD systems from using the optimized
AMD P-State
driver, forcing fallback to generic acpi-cpufreq with approximately 5-10%
performance loss. While confirmed on AMD EPYC 4484PX (Zen 4), this
likely affects
a broader range of AMD processors that support CPPC/ACPI P-States.

## Next Steps

I'm prepared to:
1. Run amd-debug-tools to capture detailed reports if needed
2. Test any proposed patches
3. Perform git bisect between 6.10 and 6.11 if required
4. Provide any additional debugging information

## Bisection Results

Through systematic testing of Ubuntu mainline kernels, I've identified the exact
regression window:

- **Last working version**: 6.10.14-061014-generic (latest 6.10.x series)
- **First broken version**: 6.11.0-061100-generic

The regression was introduced during the 6.11 merge window. All 6.10.x versions
work correctly (tested through 6.10.14), while all 6.11+ versions
fail. The issue
persists through all subsequent versions tested up to 6.18.0-rc3.

The regression appears to be in ACPI _CPC object detection/parsing, as the same
BIOS/hardware combination works with the entire 6.10.x series but
fails with 6.11+.

## Additional Information

The same ACPI tables and BIOS work correctly with 6.8 kernels, confirming
this is not a firmware issue but a kernel regression in CPPC/ACPI handling.

ACPI/CPPC related messages from working system (6.8.0):
- No error messages, driver loads successfully

ACPI/CPPC messages from broken system (6.17.5):
```
$ zgrep "ACPI.*CPPC" /proc/config.gz
CONFIG_ACPI_CPPC_LIB=y
$ dmesg | grep amd_pstate
[    0.714133] amd_pstate: the _CPC object is not present in SBIOS or
ACPI disabled
```

I've tested on multiple identical systems with the same results. I'm available
for testing patches or providing additional debugging information as needed.

Thank you for your attention to this regression.

Best regards,

Chris Harris
chris.harris79@gmail.com
