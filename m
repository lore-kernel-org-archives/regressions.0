Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792640206;
	b=K/3Il/Xx68F9ucSmwNQmpvZ73V1S///WU3IbM5sWO0+jlHCkxosNDRkosTeibY8SnNgv
	 U7KdfRVCfTReiEGHMAJQc+Rtz9gKBECtIGQLE1RKHsnQYuzV9AkkUjjdbfAGlSodX1Z/z
	 Lx6jpLrnyXgf32GYcpSMFBpUzKcp8XjCsWd0CoeZigIoGOGzVfBRwQQkt1vipjixDzW5o
	 IK3SXyxI9WCwZTYPwNJRdxxTo3vxQpAON3UDqX5AlwhT15gu9I6qWo6C3wBTu/Hx+EwFc
	 Mg7mzdxwIuVfhl3TpOjZv6zy7gg41KI7elhUBtcduUScvB+TKAfgdXWpVRiLoNMs0fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792640206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=awwXifPb5aHvVxBftaP8w2SImHVCu8Aljuq6PIur9ho=;
	b=Nj5CZp3Mf3RDb3fnfI9Y696L9esccHDIXWpUfqSqBhvgV+rajCukk2Avn6iNN6R2CeN3
	 Nis37UzhkmuOZLdDFs/zlAlmjdVjtkjmzuNbAulsQs+z3d1Tfkl+wkQY5eJ8aCFuQSAGs
	 2R58hDWcm44Hp0TQAg3E9fmmvmOSi2xFQlf0mcGFkAY3fG8ln3jwcIOg7ybDHC+AIgtou
	 st1dakQxyfMf9VIGAcAZInb4898KdEO/6qWkEqlrOp2kolMNpIWVL20ARhMLp83BiLwaK
	 Fl8nB5A/hi/iCY6G/MoX8erHaL7jRxm6VFhZyXfGP+yh8z+Vihdh7N80vYF6tC8RGzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OJkt3QaG;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBDF606A334
	for <regressions@lists.linux.dev>; Thu, 22 Oct 2026 03:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CBDF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OJkt3QaG
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53665358476so14615161cf.2
        for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 20:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792640205; x=1793245005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=awwXifPb5aHvVxBftaP8w2SImHVCu8Aljuq6PIur9ho=;
        b=OJkt3QaG73pvf657Ks15Gg1eiqYw7g1VTkgFH4GUYfYpLWwB0FW8MaUvgjQtB/CbAL
         VABORppMCaZjllE2IJslCyxm5kAqTQHU5JzPxIs4vMpZdiavD4fQVMMm0mP+4Kn9ZsBI
         38l6djJfygfBM6xW4UfdTsxaydqFN/MBzD0sxu6ocsZadsvrTEoyESoQ+DE8rZtMm32l
         9RjirQRzor4KlHiNW1mXZmtT9lFzW3znkpjC/K+TCopq+HMhoikBLQxCRWWlzDH0UUlb
         SOVVHISL82Obi0RM7WQS4h3GWHXiFoc9Cubny2R3bthgYwdsPk/YCxFmhDiyOOftCACo
         9lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792640205; x=1793245005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awwXifPb5aHvVxBftaP8w2SImHVCu8Aljuq6PIur9ho=;
        b=nYtu1y8K5lVzeFAezApHXw7wawvmJDSkJ+c66mu/uY2YZFjgWwMD+v/WQjYWUq9Vt4
         S3laDwOX7KdxNx7iU7/GWX7uHuGUyXPKg6EkEhRtnfiNOgcvf7UVKqLkhl7hr0z8EAUs
         Wut9HVLLiK+ZV5LOYxB3AyutHSPfygbjNMgMZeRMk6FwkvagJnGaIMjOTpo+qGo7qDq0
         rcEd6lFPmC69qLRuL2VVkJye36TngdOHbOw2vXb23oPb9SAfoYOnSQ100BHNIhjcWohK
         ir32dz8OuKqGLu38gSp99+hX7+A93WIsm1s1yJg/HMnFuaYC8OZYccFhs4Jw4MxyodBN
         LVJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkeXW61uRjdKrHRt8QU75lYOM2pxuWbn9muTjRFIoR1bAsNsnQNe0BN6aq/+WH3C4zoCIb0m6r5oGSlg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJN+o3jHeikcucCzNnH/jpgdS4x890jn4NyqQLpDn2PIpZUfMFN
	OfRu32mgcC7puIWxYMrNj6XzWUD+kvvoKCLMS803lbq2XaR/+0XCsOZI
X-Gm-Gg: AYBFou3xU9ShBtQVpb5i6XKBzhVQhJ1IqHpFv1EPEGCezxc3l4XgYmbbWySi9cWE5PP
	TpMjAeukth5AxAXuGuc3fHqJcv1Mz/sU33+UaiVYy53Hfa4zMuHRWGmO03P3WEysPXZfPa8OPOw
	9fuvUC3LjArVwslLF040nPW59qhSUg0Zxgmx2/A0BpEwgP3AHnMe4tVlxAF63vi0lsDNLJ4po3/
	FYYrg4monCzhQ111W5YaaZwJlp4bmlj7TMZSUs9iBRWJs8gaz5dth96I6KRN/DMTrAnyzTVIynH
	gpAlx57RwyLDd5lSib9fGN9eDbz5U48kum0noK+WuZnnDOCpMJBtbtrvkGsVuA8not1zVpAFEW7
	t7t0denIUDjSqyEj7jIfXSvX4P8gO37dUaJFU9W2XHd4unHkh6BGmk1La0a69A5xWQiEtbGTOY8
	FmHaNzAM7viMK4WTFM+Z3YeTpiyG0QOuqzGUPdkNy8toSVBcf1q4D3saeXc3y+xlrDEISVjZaRX
	vbvymH1SNi2CSEWJAvWAyOT1oumvL00s8w1BGvEiWG+yhagqhClfQmBX+3iwf1unaa7hR/7yhiD
	trA=
X-Received: by 2002:ac8:5a85:0:b0:535:2763:16a2 with SMTP id d75a77b69052e-5369b8f93f9mr64806861cf.43.1792640205211;
        Wed, 21 Oct 2026 20:36:45 -0700 (PDT)
Received: from localhost.localdomain ([2604:7a40:c601:5090:676a:ee3:7aa7:5c53])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10bd5d8csm40818286d6.24.2026.10.21.20.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:36:44 -0700 (PDT)
From: Saurav <thatsme.saurav@gmail.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [REGRESSION] i2c: qcom-geni: HID keyboard fails reset on x1e80100 (Yoga Slim 7x) since 7.2.9
Date: Wed, 21 Oct 2026 23:36:36 -0400
Message-ID: <20261022033638.32460-1-thatsme.saurav@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Since 7.2.9, the internal keyboard on the Lenovo Yoga Slim 7x
(x1e80100) no longer works. 7.2.8 is fine. 7.2.11 still ships the
same i2c-qcom-geni.c as 7.2.9, so I expect it is affected too.

The keyboard is a HID-over-I2C device on i2c0 (i2c@b80000, 400 kHz),
address 0x3a, VID:PID 048D:8987, IRQ tlmm 67. On 7.2.9 it fails with:

  i2c_hid_of 1-003a: device did not ack reset within 1000 ms

The touchpad on the same bus (0x2c, hid-descr-addr 0x20) keeps
working. A USB keyboard works as normal.

If I build 7.2.9 with drivers/i2c/busses/i2c-qcom-geni.c taken from
7.2.8 and change nothing else, the keyboard works again. So the
regression is in that file.

Five commits touched that file between v7.2.8 and v7.2.9:

  82339215fc00 i2c: qcom-geni: release DMA channels on probe error
               (upstream 268aacb2e2a5)
  139efdb3ee6e i2c: qcom-geni: Fix hardcoded clock index in SE_GENI_CLK_SEL
               (upstream cb97bf3d4f91)
  6c3420d6ba34 i2c: qcom-geni: Store of_device_id data in driver private struct
               (upstream 692e0c84db5f, Stable-dep-of cb97bf3d4f91)
  4edab037132b i2c: qcom-geni: Move resource initialization to separate function
               (upstream ed4b34033db2, Stable-dep-of cb97bf3d4f91)
  fb54df3645d8 i2c: qcom-geni: Isolate serial engine setup
               (upstream d8d3bb127ad1, Stable-dep-of cb97bf3d4f91)

I have not bisected within this series. My main suspect is
cb97bf3d4f91.

#regzbot introduced: cb97bf3d4f91

7.2.8 always wrote 0 to SE_GENI_CLK_SEL in qcom_geni_i2c_conf().
With cb97bf3d4f91, geni_i2c_clk_map_idx() uses
geni_se_clk_freq_match() to find the index for 32 MHz or 19.2 MHz,
stores it in clk_idx, and qcom_geni_i2c_conf() writes that index to
SE_GENI_CLK_SEL.

On x1e80100 the QUP SE clocks are registered as DFS RCGs
(gcc_dfs_clocks[] in gcc-x1e80100.c). geni_se_clk_tbl_get() builds
its table from clk_round_rate(), so the table comes out in ascending
rate order. I suspect that index does not always match the hardware
DFS perf level that firmware set up on this machine, where index 0
happened to be correct. If so, the engine runs from a different
source clock than the SCL counters were computed for. I have not
confirmed this yet. So far I have only shown that the 7.2.8 file
fixes it.

I have not tested mainline yet.

System:
  Machine:  Lenovo Yoga Slim 7 14Q8X9 (83ED)
  SoC:      Snapdragon X Elite, x1e80100
  BIOS:     NHCN62WW
  DT:       x1e80100-lenovo-yoga-slim7x.dtb (in-tree)
  Kernel:   gentoo-sources 7.2.9 (genpatches do not touch this driver)
  Good:     7.2.8
  Bad:      7.2.9

I can test patches or run more debugging if useful.

Thanks,
Saurav

--
Drafted by Claude.
