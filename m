Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B449B3FE7
	for <regressions@lists.linux.dev>; Tue,  5 Aug 2025 00:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754355280; cv=none; b=H7Q2awll4B8U92GpttHroztP1It8Pdi3DavNwnyQ/AdAsu4UedVOxy/tBGfMNVAuDkKsHl2pnzOBVpdx72S9hvLBuDLujNWHOTsacitMm88ItWnVQOYZ3mFxlrnbaS7Z9Un3tkN2x3OnRS3WHLs2BROVcHsqwMrkqUz5fJqvFiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754355280; c=relaxed/simple;
	bh=Z262DhWFXHG/X5pl1gjHURNRIp3gqbuVg5XVKu2TMOs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=BhJen9cSXGvOsAGEVzb9SEExwFzVGDLNiZkt59qFo1Lr1g9XCdRaNC3Yw9Ul2soyx1mZYru/tzk61vQ6nZBwxhCHy2xYK+SId9rszkl8QfThUpTaMs+8GLclcgjTw9+Si/AlrNQcTzkx0W6BwqaxbA32wAZRuxdClMuovuqsjsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=K1CUlPFX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="K1CUlPFX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2401b855635so37839625ad.2
        for <regressions@lists.linux.dev>; Mon, 04 Aug 2025 17:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1754355278; x=1754960078; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZ5XkuAHHBX80+IZHPXPxpGUwZiw4jRcIJN7879IdBk=;
        b=K1CUlPFXy5MIryXPhGC5nEVMP7a0iiuCMJbMmhauFWBBHSOAAlWq0ZGT28GPKaRZwT
         Dx8wLdTE18S3xOjrbBaxwsBuk6VoWONtiEfsWwtsiJWu8eYqp/WjQKgtPsZ5iCfweRWF
         /NLWl+VfkyzjrKoTnpyWgIY8VUyEH7mkoOxFCH5xm6HpvGbuGWM3AhFeluEvyX5aF6KX
         iSI1cvfmR5jfRgqkrKozNbvNzoL8p7RCHoZyUwmf0bMTE/txVNrCOsv8OU7q55QvupcD
         pXkbZ7BUQfE7WxbTdWwom7uXhaJo2SWBATRPjO4KnC4GDePf+n/K+pgm+fzujw3Fx8nd
         XPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754355278; x=1754960078;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LZ5XkuAHHBX80+IZHPXPxpGUwZiw4jRcIJN7879IdBk=;
        b=DX978Vj2Kj3ImdTce41mIN4PUI0jRe5wvrhV9sODyJN/pAp5e+VoZQx8O5nNjI0aAg
         nej/+8q8EUSv5DbxS+L+1LB3DQGMMwEJpx0FU3uBcrTkvhYRSFx3ArYe2OEzXOOAiGZO
         4NWOy1hhTHhvUchBpYABGBtVUj4VNrzy4NVIcqdMxiRbP/xWDVpqAnjT6osQaZxgExC+
         /vnbHffgW9rzJrUiBg7O+KY/qVUwHAuChAtbi8A6HUnpTpHiOP8AkmI7Ue1DiJhOiLTa
         hRML5s1h/ngjRxkjAiCX4RQpugCBBkVt8iuzvb6ck4DbcVPfF+fQGHj9kpCT/JHRVIpw
         JAfg==
X-Gm-Message-State: AOJu0Yzak/OeDMjty9qirKIJM1HO7c/fBPl91DBnevqQBrljlZwcYTCZ
	ceqUPXAoLHcDPdvtm6dT3dANoFfEtsDdCnRt1wpGt3nX/qLiFDCVujp++5A1x62vNXI=
X-Gm-Gg: ASbGncsehM89UEvYv9neoqdZgA8n9bgR/b1cthQzd1DSfpj3C9yp69HcekZ0W0k01Hz
	ZUJ4vnM2f4jAfV5HeKohQ5o5uknqGrMxL+kvAwcgP+lBh6r+qkCKFH80m9l8yky6BPeviwocGqA
	ifkoQpq0W6XyIhxZW4WgoB7KjSnKz6cm/F658jIkDAqaUweQxsQa2PbtyI9i0mQ2FOnpqWoWQk4
	aNDf2jgraQkztao41EiMB7EFA943ZneYj7ud8H/AOl1rIVN48ClcVA9xqR9FsKx4iv6Mm+EhjbN
	ATbB0HfzUo84zG62cfQnC7dlp/NKyMi+GRN1LEIopDwvtImE9oHicMZwWORrRyohRkrL0BKtK1a
	E2DyR3iBAKHM5LJdvYSv6Lz4m
X-Google-Smtp-Source: AGHT+IFPqrNawUAjKr+8epdr9t/Bs89BKTAEVet4UGrVMdLhTUd3JgS2iQl98GRv2+A7HiqAwGIe2g==
X-Received: by 2002:a17:902:ecd2:b0:23f:fa2c:3aff with SMTP id d9443c01a7336-2424703f41amr159533035ad.52.1754355277924;
        Mon, 04 Aug 2025 17:54:37 -0700 (PDT)
Received: from poutine ([2804:1b3:a701:ff56:648c:a86e:fc5f:581e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef674bsm118727785ad.17.2025.08.04.17.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 17:54:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [TEST REGRESSION] next/master:
 kselftest.dt.dt_test_unprobed_devices_sh_sound
 on imx6dl-udoo
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 05 Aug 2025 00:54:35 -0000
Message-ID: <175435527445.939831.13413330026205856182@poutine>




Hello,

New test failure found on next/master:

kselftest.dt.dt_test_unprobed_devices_sh_sound running on imx6dl-udoo

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit HEAD: 5c5a10f0be967a8950a2309ea965bae54251b50e
tags: next-20250804

test id: maestro:68904704236da8c8a0d735f8
status: FAIL
start time: 2025-08-04 05:37:08.841000+00:00
log: https://files.kernelci.org/kselftest-dt-68904461236da8c8a0d72015/log.txt.gz

# Test details:
- test path: kselftest.dt.dt_test_unprobed_devices_sh_sound
- platform: imx6dl-udoo
- compatibles: udoo,imx6dl-udoo | fsl,imx6dl
- config: multi_v7_defconfig
- architecture: arm
- compiler: gcc-12

Dashboard: https://d.kernelci.org/t/maestro:68904704236da8c8a0d735f8


Log excerpt:
=====================================================
or-2p5
# ok 18 /soc/bus@2000000/anatop@20c8000/regulator-3p0
# ok 19 /soc/bus@2000000/anatop@20c8000/regulator-vddcore
# ok 20 /soc/bus@2000000/anatop@20c8000/regulator-vddpu
# ok 21 /soc/bus@2000000/anatop@20c8000/regulator-vddsoc
# ok 22 /soc/bus@2000000/anatop@20c8000/tempmon
# ok 23 /soc/bus@2000000/clock-controller@20c4000 # SKIP
# ok 24 /soc/bus@2000000/dma-controller@20ec000
# ok 25 /soc/bus@2000000/gpc@20dc000
# ok 26 /soc/bus@2000000/gpio@209c000
# ok 27 /soc/bus@2000000/gpio@20a0000
# ok 28 /soc/bus@2000000/gpio@20a4000
# ok 29 /soc/bus@2000000/gpio@20a8000
# ok 30 /soc/bus@2000000/gpio@20ac000
# ok 31 /soc/bus@2000000/gpio@20b0000
# ok 32 /soc/bus@2000000/gpio@20b4000
# ok 33 /soc/bus@2000000/iomuxc-gpr@20e0000 # SKIP
# not ok 34 /soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi0_mux
# not ok 35 /soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi1_mux
# not ok 36 /soc/bus@2000000/iomuxc-gpr@20e0000/mux-controller
# ok 37 /soc/bus@2000000/pinctrl@20e0000
# ok 38 /soc/bus@2000000/reset-controller@20d8000
# ok 39 /soc/bus@2000000/snvs@20cc000 # SKIP
# not ok 40 /soc/bus@2000000/snvs@20cc000/snvs-lpgpr
# not ok 41 /soc/bus@2000000/snvs@20cc000/snvs-rtc-lp
# not ok 42 /soc/bus@2000000/spba-bus@2000000
# not ok 43 /soc/bus@2000000/spba-bus@2000000/asrc@2034000
# ok 44 /soc/bus@2000000/spba-bus@2000000/ssi@2028000
# ok 45 /soc/bus@2000000/timer@2098000 # SKIP
# ok 46 /soc/bus@2000000/usbphy@20c9000
# ok 47 /soc/bus@2000000/usbphy@20ca000
# not ok 48 /soc/bus@2000000/vpu@2040000
# ok 49 /soc/bus@2000000/watchdog@20bc000
# not ok 50 /soc/bus@2100000
# ok 51 /soc/bus@2100000/audmux@21d8000
# ok 52 /soc/bus@2100000/crypto@2100000
# ok 53 /soc/bus@2100000/crypto@2100000/jr@1000
# ok 54 /soc/bus@2100000/crypto@2100000/jr@2000
# ok 55 /soc/bus@2100000/efuse@21bc000
# ok 56 /soc/bus@2100000/ethernet@2188000
# ok 57 /soc/bus@2100000/i2c@21a4000
# ok 58 /soc/bus@2100000/i2c@21a8000
# ok 59 /soc/bus@2100000/memory-controller@21b0000
# ok 60 /soc/bus@2100000/mmc@2198000
# ok 61 /soc/bus@2100000/serial@21e8000
# ok 62 /soc/bus@2100000/serial@21f0000
# ok 63 /soc/bus@2100000/usb@2184000
# ok 64 /soc/bus@2100000/usb@2184200
# ok 65 /soc/bus@2100000/usb@2184200/usb-port@1
# ok 66 /soc/bus@2100000/usbmisc@2184800
# not ok 67 /soc/bus@2100000/vdoa@21e4000
# ok 68 /soc/cache-controller@a02000 # SKIP
# ok 69 /soc/dma-controller@110000
# ok 70 /soc/gpu@130000
# ok 71 /soc/gpu@134000
# ok 72 /soc/hdmi@120000
# ok 73 /soc/interrupt-controller@a01000 # SKIP
# ok 74 /soc/ipu@2400000
# ok 75 /soc/sram@900000
# ok 76 /soc/timer@a00600 # SKIP
# not ok 77 /sound
# ok 78 /usbphynop1
# ok 79 /usbphynop2
# # 14 skipped test(s) detected.  Consider enabling relevant config options to improve coverage.
# # Totals: pass:52 fail:13 xfail:0 xpass:0 skip:14 error:0
not ok 1 selftests: dt: test_unprobed_devices.sh # exit=1
WARNING: Optional imports not found, TAP 13 output will be
ignored. To parse yaml, see requirements in docs:
https://tappy.readthedocs.io/en/latest/consumers.html#tap-version-13
dt_test_unprobed_devices_sh_ skip
dt_test_unprobed_devices_sh_capture-subsystem fail
dt_test_unprobed_devices_sh_clocks_ckih1 skip
dt_test_unprobed_devices_sh_clocks_ckil skip
dt_test_unprobed_devices_sh_clocks_osc skip
dt_test_unprobed_devices_sh_cpus_cpu_0 skip
dt_test_unprobed_devices_sh_cpus_cpu_1 skip
dt_test_unprobed_devices_sh_display-subsystem pass
dt_test_unprobed_devices_sh_gpio-poweroff pass
dt_test_unprobed_devices_sh_ldb pass
dt_test_unprobed_devices_sh_pmu pass
dt_test_unprobed_devices_sh_regulator-panel pass
dt_test_unprobed_devices_sh_soc pass
dt_test_unprobed_devices_sh_soc_bus_2000000 fail
dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000 skip
dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000_regulator-1p1 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000_regulator-2p5 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000_regulator-3p0 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000_regulator-vddcore pass
dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000_regulator-vddpu pass
dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000_regulator-vddsoc pass
dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000_tempmon pass
dt_test_unprobed_devices_sh_soc_bus_2000000_clock-controller_20c4000 skip
dt_test_unprobed_devices_sh_soc_bus_2000000_dma-controller_20ec000 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_gpc_20dc000 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_gpio_209c000 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_gpio_20a0000 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_gpio_20a4000 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_gpio_20a8000 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_gpio_20ac000 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_gpio_20b0000 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_gpio_20b4000 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_iomuxc-gpr_20e0000 skip
dt_test_unprobed_devices_sh_soc_bus_2000000_iomuxc-gpr_20e0000_ipu1_csi0_mux fail
dt_test_unprobed_devices_sh_soc_bus_2000000_iomuxc-gpr_20e0000_ipu1_csi1_mux fail
dt_test_unprobed_devices_sh_soc_bus_2000000_iomuxc-gpr_20e0000_mux-controller fail
dt_test_unprobed_devices_sh_soc_bus_2000000_pinctrl_20e0000 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_reset-controller_20d8000 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_snvs_20cc000 skip
dt_test_unprobed_devices_sh_soc_bus_2000000_snvs_20cc000_snvs-lpgpr fail
dt_test_unprobed_devices_sh_soc_bus_2000000_snvs_20cc000_snvs-rtc-lp fail
dt_test_unprobed_devices_sh_soc_bus_2000000_spba-bus_2000000 fail
dt_test_unprobed_devices_sh_soc_bus_2000000_spba-bus_2000000_asrc_2034000 fail
dt_test_unprobed_devices_sh_soc_bus_2000000_spba-bus_2000000_ssi_2028000 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_timer_2098000 skip
dt_test_unprobed_devices_sh_soc_bus_2000000_usbphy_20c9000 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_usbphy_20ca000 pass
dt_test_unprobed_devices_sh_soc_bus_2000000_vpu_2040000 fail
dt_test_unprobed_devices_sh_soc_bus_2000000_watchdog_20bc000 pass
dt_test_unprobed_devices_sh_soc_bus_2100000 fail
dt_test_unprobed_devices_sh_soc_bus_2100000_audmux_21d8000 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_1000 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_2000 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_efuse_21bc000 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_ethernet_2188000 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_i2c_21a4000 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_i2c_21a8000 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_memory-controller_21b0000 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_mmc_2198000 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_serial_21e8000 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_serial_21f0000 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_usb_2184000 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_usb_2184200 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_usb_2184200_usb-port_1 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_usbmisc_2184800 pass
dt_test_unprobed_devices_sh_soc_bus_2100000_vdoa_21e4000 fail
dt_test_unprobed_devices_sh_soc_cache-controller_a02000 skip
dt_test_unprobed_devices_sh_soc_dma-controller_110000 pass
dt_test_unprobed_devices_sh_soc_gpu_130000 pass
dt_test_unprobed_devices_sh_soc_gpu_134000 pass
dt_test_unprobed_devices_sh_soc_hdmi_120000 pass
dt_test_unprobed_devices_sh_soc_interrupt-controller_a01000 skip
dt_test_unprobed_devices_sh_soc_ipu_2400000 pass
dt_test_unprobed_devices_sh_soc_sram_900000 pass
dt_test_unprobed_devices_sh_soc_timer_a00600 skip
dt_test_unprobed_devices_sh_sound fail
dt_test_unprobed_devices_sh_usbphynop1 pass
dt_test_unprobed_devices_sh_usbphynop2 pass
dt_test_unprobed_devices_sh fail
+ ../../utils/send-to-lava.sh ./output/result.txt
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=shardfile-dt RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_ RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_capture-subsystem RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_clocks_ckih1 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_clocks_ckil RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_clocks_osc RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_0 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_1 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_display-subsystem RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_gpio-poweroff RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_ldb RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_pmu RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-panel RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000 RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000_regulator-1p1 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000_regulator-2p5 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000_regulator-3p0 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000_regulator-vddcore RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000_regulator-vddpu RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000_regulator-vddsoc RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_anatop_20c8000_tempmon RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_clock-controller_20c4000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_dma-controller_20ec000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_gpc_20dc000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_gpio_209c000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_gpio_20a0000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_gpio_20a4000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_gpio_20a8000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_gpio_20ac000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_gpio_20b0000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_gpio_20b4000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_iomuxc-gpr_20e0000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_iomuxc-gpr_20e0000_ipu1_csi0_mux RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_iomuxc-gpr_20e0000_ipu1_csi1_mux RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_iomuxc-gpr_20e0000_mux-controller RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_pinctrl_20e0000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_reset-controller_20d8000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_snvs_20cc000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_snvs_20cc000_snvs-lpgpr RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_snvs_20cc000_snvs-rtc-lp RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_spba-bus_2000000 RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_spba-bus_2000000_asrc_2034000 RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_spba-bus_2000000_ssi_2028000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_timer_2098000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_usbphy_20c9000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_usbphy_20ca000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_vpu_2040000 RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2000000_watchdog_20bc000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000 RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_audmux_21d8000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_1000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_crypto_2100000_jr_2000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_efuse_21bc000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_ethernet_2188000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_i2c_21a4000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_i2c_21a8000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_memory-controller_21b0000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_mmc_2198000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_serial_21e8000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_serial_21f0000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_usb_2184000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_usb_2184200 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_usb_2184200_usb-port_1 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_usbmisc_2184800 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_bus_2100000_vdoa_21e4000 RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_cache-controller_a02000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_dma-controller_110000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_gpu_130000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_gpu_134000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_hdmi_120000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_interrupt-controller_a01000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_ipu_2400000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_sram_900000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_timer_a00600 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_sound RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_usbphynop1 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_usbphynop2 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh RESULT=fail>
+ set +x
<LAVA_SIGNAL_ENDRUN 1_kselftest-dt 1636242_1.6.2.4.5>
<LAVA_TEST_RUNNER EXIT>
/ # 

=====================================================


#kernelci test maestro:68904704236da8c8a0d735f8

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
