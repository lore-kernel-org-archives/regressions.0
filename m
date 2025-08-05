Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F0B13B5AE
	for <regressions@lists.linux.dev>; Tue,  5 Aug 2025 00:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754355305; cv=none; b=Mkb/SUWXuTkpYeJ/n7VBesi4/QS+sq7Wj++t9MtMnboC4AKTxSJBlKciPYJBj1XxCkbqvjvvgxkfu9zqovJ2D276CqZ5hkvbKkffd1k1gsJJKr1UAytv9C84mM5p8dK1XeklNrlgWfvV0cG8gjt/vxqNW3CALnBr6bHTzcr1DG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754355305; c=relaxed/simple;
	bh=Ep8Wg2RpVtzK60eLPDWUZWfWsG/AE1vLI69yP3ipsq4=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=ioOpI1gWQjNIz1/6wWInWUDXvwlu27G0Z9lheEUnefMO6gG7F3N89Rw7Q6ZF+DfOYlVDJkaBfNK53J9r/20jzbugA20dS5Jg3fBuI0Tp4gdqLDhMh77ahTJnNmr3D7V9ncm0HuZfp2HSxmSUL6DN0K665sScbNS7ArQKtCfRTX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=1bqJC7sv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="1bqJC7sv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-236377f00a1so43958985ad.3
        for <regressions@lists.linux.dev>; Mon, 04 Aug 2025 17:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1754355302; x=1754960102; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep8Wg2RpVtzK60eLPDWUZWfWsG/AE1vLI69yP3ipsq4=;
        b=1bqJC7svz/Gn57VrLKu3H7FMedjhK4eMv4QCtbD5hK1ZOGnyLnOzFp5Ik/8ecdxT7j
         9lASFR5XkeFIoyuRPLsSAuFVKJI0fVaeom7EgTrzNYj5NnldM6tbr2dK0lIQmXd67Ccx
         v4yVhMnd0WtTGvj11mmLDnFJ21BU8KZsoOotP6AmQkjoIhr1zI9fWfV7pW5mpVsneCUP
         x3HDm3o8uzy47BdIUsmJq+Ijo8SnHqOkMW/vK1in1ZodHS4ABKjYKV230tQOYIcqjbG1
         KB7zgz09AspGUeFTV/KSbbBRnXqMq+MF9Lgba/YVOcffA78bqu2fAM/cCMKTr17ud/Cv
         IwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754355302; x=1754960102;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ep8Wg2RpVtzK60eLPDWUZWfWsG/AE1vLI69yP3ipsq4=;
        b=hSP2/WvkiBUAXoatWpi18P8XikZHgb0ZXw865noBUg357sNHjiG45xU81BpififqaW
         9uhF+uc+0Yq15oXukZjIf+vZ9c6GM9L28o/OOfn2DHijrXJcW9xlFM+/y8i3F3dwGHCR
         ZHAiJoGTYy/bYV84WTJaL+gzb8rE3eimhPkQU06IkZyaoeqXJ61C7pbqf3OTOlqWrC4G
         sbQbzlgnc3wXmcyJOvEho1BEZFcP6qThQBm1KTP6+XEDDWIlrpjgw/SizU5LLyMkZWzJ
         py8e0FGgR05jZoY/4qwmCWq6jul+F6w7ZGt/EpHZLzowYzyEjeGh/JBG1K3v4uM0I7mR
         cqhQ==
X-Gm-Message-State: AOJu0YyzxfZSDVKOwGB9TQEoLObFxLZ334BtlH15uyo1v8Zzfy13Wmy2
	ZvVY68Kvso4625++eCYo1yv0e2FVM+fI1jIADxzezb7xRTolsUUaRh6X0Stq554qXb9KGCOk1Q7
	eCvORwKDi0A==
X-Gm-Gg: ASbGncsOfNThkWCuJRtpgBQ6ZPce9qjSOEQht2aeDF519EWM4QasXyjtgZZuxtEr0P1
	07wLFF/yWUc27eYgPN2jlB5qoBt+qoQEygtU1YX+lHaaD9yoWcoPXvO7KOACtHidYEv4431PVJT
	oAsWajHZ5BLvDTaJ8gDROBoDsM3rjvleldg7bXc1k8hvAKqX/fE8B7kP5oMKo6yOQrHjepUKjLZ
	iJt8Wz5nkaZgT0I2PG40f5YGCTRvlGSstCTCubFC71cU5D7m6O3T826wa1CKBraBCaWrtzbVe63
	aiIcja1jqJFe7VKirJeyDO0aLPU3mMnLuE8si29hdPgL940+laOiN/tJAdpVAUk+8XMhP7Xupip
	gNaXY1bv0mrFrUQ==
X-Google-Smtp-Source: AGHT+IEOXv3zQ7vDD77EhyzwwJOSkCK59DkO6CkOqqFbehVZYQHfegDIuuUSIhmcFimS4SMW0HI7Zw==
X-Received: by 2002:a17:902:dacf:b0:240:49d1:6347 with SMTP id d9443c01a7336-24246ffbf2cmr147190985ad.35.1754355302315;
        Mon, 04 Aug 2025 17:55:02 -0700 (PDT)
Received: from poutine ([2804:1b3:a701:ff56:648c:a86e:fc5f:581e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976cbdsm120412375ad.75.2025.08.04.17.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 17:55:01 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [TEST REGRESSION] next/master:
 kselftest.dt.dt_test_unprobed_devices_sh_soc_video-decoder_16000000_video-codec_16025000
 on mt8186-corsola-steelix-sku131072
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 05 Aug 2025 00:55:00 -0000
Message-ID: <175435529841.940562.17094645738857201320@poutine>




Hello,

New test failure found on next/master:

kselftest.dt.dt_test_unprobed_devices_sh_soc_video-decoder_16000000_video-codec_16025000 running on mt8186-corsola-steelix-sku131072

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
branch: master
commit HEAD: 5c5a10f0be967a8950a2309ea965bae54251b50e
tags: next-20250804

test id: maestro:689042d7236da8c8a0d7149e
status: FAIL
start time: 2025-08-04 05:19:19.165000+00:00
log: https://files.kernelci.org/kselftest-dt-68903fbb236da8c8a0d6f6db/log.txt.gz

# Test details:
- test path: kselftest.dt.dt_test_unprobed_devices_sh_soc_video-decoder_16000000_video-codec_16025000
- platform: mt8186-corsola-steelix-sku131072
- compatibles: google,steelix-sku131072 | google,steelix
- config: defconfig+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
- architecture: arm64
- compiler: gcc-12

Dashboard: https://d.kernelci.org/t/maestro:689042d7236da8c8a0d7149e


Log excerpt:
=====================================================
IGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_100 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_200 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_300 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_400 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_500 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_600 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_cpu_700 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_idle-states_cpu-off-b RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_idle-states_cpu-off-l RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_idle-states_cpu-retention-b RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_idle-states_cpu-retention-l RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_l2-cache0 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_l2-cache1 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_cpus_l3-cache RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_dmic-codec RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_firmware_chromeos RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_firmware_coreboot RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_fixed-factor-clock-13m RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_gpio-keys RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_lpddr-channel0 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_lpddr-channel0_rank_0 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_lpddr-channel0_rank_1 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_lpddr-channel1 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_lpddr-channel1_rank_0 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_lpddr-channel1_rank_1 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_opp-table-cci RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_opp-table-cluster0 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_opp-table-cluster1 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_opp-table-gpu RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_oscillator-26m RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_oscillator-32k RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_pmu-a55 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_pmu-a76 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_psci RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp1000-edpbrdg RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp1800-dpbrdg-dx RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp1800-edpbrdg-dx RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp3300-disp-x RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp3300-edp-dx RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp3300-ldo-z5 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp3300-s3 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp3300-z2 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp4200-z2 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-pp5000-z2 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-ppvar-sys RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_regulator-usb-p1-vbus RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_reserved-memory_audio-dma-pool RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_reserved-memory_memory_50000000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_reserved-memory_memory_60000000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_reserved-memory_memory_61000000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_reserved-memory_ramoops RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_aal_1400c000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_adc_11001000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_adsp_10680000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_audio-controller_11210000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_ccorr_1400b000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_11017000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_13000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_14020000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_15020000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_15820000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_1602f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_17000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_1a000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_1a04f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_1a06f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_1b000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_clock-controller_1c000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_color_14009000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_dither_1400f000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_dsi-phy_11cc0000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_dsi_14013000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_efuse_11cb0000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_gamma_1400d000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_gpu_13040000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11007000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11007000_anx7625_58 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11007000_anx7625_58_aux-bus_panel RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11008000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11008000_touchscreen_5d RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11009000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11009000_trackpad_15 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_1100f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_1100f000_dp-bridge_5c RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11016000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_i2c_11016000_codec_1a RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_interrupt-controller_c000000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_iommu_14016000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_jpeg-encoder_17030000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_mailbox_1022c000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_mailbox_10686100 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_mailbox_10687100 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_mmc_11230000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_mmc_11240000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_mmc_11240000_bluetooth_2 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_mutex_14001000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_ovl_14005000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_ovl_14006000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_pinctrl_10005000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_postmask_1400e000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_pwm_1100e000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_pwrap_1000d000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_pwrap_1000d000_pmic RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_pwrap_1000d000_pmic_audio-codec RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_pwrap_1000d000_pmic_regulators RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_pwrap_1000d000_pmic_rtc RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_rdma_14007000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_rdma_1401f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_scp_10500000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_scp_10500000_cros-ec-rpmsg RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_serial_11002000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_14002000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_14003000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_14004000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_14023000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1502e000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1582e000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1602e000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_17010000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1a001000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1a002000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1a00f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1a010000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1b002000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1c00f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_smi_1c10f000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11000000_flash_0 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0_extcon0 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0_i2c-tunnel RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0_i2c-tunnel_sbs-battery_b RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0_keyboard-controller RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0_typec RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0_typec_connector_0 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11010000_ec_0_typec_connector_1 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11012000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_spi_11012000_tpm_0 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_svs_1100bc00 RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_10000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_10001000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_10003000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_10006000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_10006000_power-controller RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_1000c000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_14000000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_syscon_c53a000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_t-phy_11c80000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_t-phy_11ca0000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_thermal-sensor_1100b000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_timer_10017000 RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_usb_11201000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_usb_11201000_usb_11200000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_usb_11281000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_usb_11281000_usb_11280000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_video-decoder_16000000 RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_video-decoder_16000000_video-codec_16025000 RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_video-encoder_17020000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_soc_watchdog_10007000 RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_sound RESULT=fail>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_speaker-codec RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_timer RESULT=skip>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_wifi-pwrseq RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh_wifi-wakeup RESULT=pass>
<LAVA_SIGNAL_TESTCASE TEST_CASE_ID=dt_test_unprobed_devices_sh RESULT=fail>
+ set +x
<LAVA_SIGNAL_ENDRUN 1_kselftest-dt 19410038_1.1.3.5>
<LAVA_TEST_RUNNER EXIT>
/ #

=====================================================


#kernelci test maestro:689042d7236da8c8a0d7149e

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
