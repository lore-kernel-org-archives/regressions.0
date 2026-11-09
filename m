Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242063;
	b=NX6biaL3luALl3yf5Hpf11IhrgP1JpvE8dHECAGc2csNHARRDNxCx2c7dSVDCdbiCAnw
	 LqWRwFfQQmheHi+3TrAytpxxBOjmwHQHKklAPSmF8lBtgNzDDxy9yMCv0EFJ+YgnwwmQp
	 Xjg2KxxLgcvdNmrFGuNv96kfflgCQDcFYROm3IN0QANOcuPqfXHiAmfe8orJBC1sk8rvi
	 rHGzUhToGWceHd2UTR7tiBovtzksQ6I9E2j5Txsuy3QeUtBuDgcP1WbClPnTzjDx+DbFo
	 0i20Z1JbxYguQPzFlxwhxvbo72m87IG4zYonh0Eb39qVLHMVFs6/a0NJ6iEjW8WnjOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RbYLKZJReBRYNMnQD9Gq9gm7nUierN4cjniygw/hBYA=;
	b=B2JGYibL2fPDIYM6RqWJpCa+5Kcs5wsfJW7CcDCc32M2GbhNLzLzjfwRby8Jm5g7TUc1
	 Yn7vw4+yrnm6lBKRxgSdZ6ShghpCTRtNHU27Tk++2+jSGyaJVmygzBAbZpNZZwM/RaVE+
	 KD0UyoZOrESlKvJ/tC8ki71Eg14nhvHra3Tfft24HeGF35YPPxDaFsH23SQcX8llEgVMx
	 nRSp/lQ94zfRQAz7+428ALBtWLtWqPNxDcCnHQQc9QZpTGEsP67vweI4jJ5oOOGh5rwRZ
	 rJ+ioyUg5kFSjioV+W/OfLhHvdifwgR3jUzlHTn4weIVYQ2H7MX/uHldO3Jr71E4Oxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0PQXf7F/";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66716606A331
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 16:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66716606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PQXf7F/
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490c1d337d8so785108f8f.2
        for <regressions@lists.linux.dev>; Mon, 09 Nov 2026 08:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242062; x=1794846862; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RbYLKZJReBRYNMnQD9Gq9gm7nUierN4cjniygw/hBYA=;
        b=0PQXf7F/yGxEKNBeDhD+wnQ6h3qIPbypFVnP/iW8dtMQnTqp04GSW6fwcxzp9eCZfU
         4OjUjzm8WWR30waVWvxWMTsc1spvFDTZC52ca6vn+SV/EnH2XTOQTIDXKuhUbNSn+Ytl
         Fp9QXVCNy3qPwAl9+kEUPxkyxcaYPB7hRFgDhu1K9shmkz6RgFfMRSp2zzlMkns+aGgg
         rlh2eOQfEYpBc6lFr/2YCEy6iqYJfe1fdxna8L1d3z8N8ViLwDfLNxpJU7WSBKqNQ+Kr
         /BQ5iSRh0DZGBdi+Y5K9NfvpEExyhC5LufetBsDqBCxwgs1Hzk8rb9FcTBVKCd8b0YXU
         uEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242062; x=1794846862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RbYLKZJReBRYNMnQD9Gq9gm7nUierN4cjniygw/hBYA=;
        b=bb1UZuh7hVtZ3TA/TIW0wxj3/9Ys0fLkg6ZGWdwG4cy+2gnHo37RlrDAN8yPIc7cvW
         tkriP+IdW7DL652+cc8O+ozq2TQ9PW0EHgnTtIxRaMuDeqbSLyDZMnROAP27zqdmQUX1
         pnRr3FCPHoBd+Axj8siMuQXJO2Hi7OxcWT4bpH11zAyB6XwREV+0mTULwNpUtSFSiy5U
         Iylkzj5z+N6ctZ1UWQ0ZFbaRkeD7dFF/oUj7Z26EXsLXKmmzzD1fYU3nsCgn3jJ24hSJ
         j9NMUlm9kGcTLDSQsOQnN39Pzfb+QKGykSxdvSyEvI09zmVTUQ1SP4tMnMsIiHKLAIIo
         gNEw==
X-Forwarded-Encrypted: i=1; AL+hErFHerYkLRIjZSg6UAF0N9in/DEqr5KPWTd75v8hAphtfRrYlQc1MO7zTCFJ1y41N86ayzPTbKdLLnFw4w==@lists.linux.dev
X-Gm-Message-State: APuU4Z+PbQ8TsTw8Nb+JzgPtMcP/0JRf7axdhh837D/JugSkKWTv6yYN
	HGhGAwWKOhw2tsUlqJPjBT21/FfNxfpiUB9pdnX2OsytFrChBHkjFY4=
X-Gm-Gg: AYBFou0Q9RKRluBEs0OB9JOooqzWGFGU7NtAThwB2plxYreYbbVuYFJxtqKd6g2Z8vz
	vY0GqqD/UOs82GAmsRIzIJC/3KYzFUA/W/J5bAo1bCXCstXTE3Qax5qxakL9nNYmXRPchkVYqbc
	fgbXpNLeuWs7MDjeqtSjPPHKbWCM/NBC947j7vVmd/3anhpXQSnRFEEhJMHqzfaE/qh5T/bYjff
	4iqNKaVzCFPuKTuQvaUBt7IYWao8knrpgNM6L1ixqz2aA7XYhdy/QSXY/OMx9ts4OLnbT8l+SHI
	v8Ca8T/lmg6soCeJJk4yX6L79/t7TFDLP5v0TROTQ5+loT/flMMtwVAIgmUqF4hIb86VRicvseg
	M8JSibC8H4bS18IdhPBi4cqxUDASdm8coWBR4gzw8fxqEC+Dj5k38sHHMGMCr68Uh6OZwp3z47x
	GQIIDIr+I5SfIAgvDpiJP1PZ9Ph7xSRbyEVtfIdp2kyD2Xan77Us2eftEqkSvM0htKMkmdJtKQG
	PUp+wq/3VII2CLXgq6505hFItJ/vnnVfNSQb42SOMk1zcA5xRBmfNq4VqnXUNQto47ApSo5QpsV
	Ok9WUrXxGffCY0ueGzOuoz1eX5awzFbgGadxd9Xcp6vB6hOhIO02ijnEYKhy/a1Nvso8ORjPyP2
	Wmkux49gEzzn8rgJ1d3d8qBa8uFwSMdYy/UgjYJjNZ7OOiwhcBNcZ7sA9AeJPLpbE9b3V9q5aFg
	==
X-Received: by 2002:a05:6000:288d:b0:48e:25e1:5eb8 with SMTP id ffacd0b85a97d-4982b28aa42mr46827f8f.3.1794242061567;
        Mon, 09 Nov 2026 08:34:21 -0800 (PST)
Received: from chateau ([194.65.85.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597ef6db0sm11269050f8f.59.2026.11.09.08.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:34:21 -0800 (PST)
From: Sergey Zagursky <gvozdoder@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sergey Zagursky <gvozdoder@gmail.com>,
	Jake Steinman <j@metarealtyinc.ca>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] ipu-bridge: HM1092 entry hides IVSC-attached OV02C10 on Dell XPS 16 9640
Date: Mon,  9 Nov 2026 16:30:02 +0000
Message-ID: <20261109142140.ov02c10-hm1092-regression.e938253b8516@gmail.com>
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

Since v7.3 the built-in camera of my Dell XPS 16 9640 (Meteor Lake
IPU6, OV02C10 behind the Intel IVSC, plus a Himax HM1092 IR sensor in
ACPI as HIMX1092:00) is no longer found by libcamera. It works with
v7.2.8.

The cause is commit 4fdb0342f05e ("media: ipu-bridge: Add Himax HM1092
IR sensor"). ipu-bridge now adds an async connection for the HM1092,
which has no driver in the kernel, so the IPU6 ISYS notifier never
completes. The OV02C10 binds to the IVSC CSI sub-notifier, and its
sub-device node is only created from the ISYS .complete() callback, so
it never appears. The sensor driver probes and the entity is in the
media graph without a device node, and libcamera skips it:

  ERROR V4L2 v4l2_device.cpp:92 'ov02c10 20-0036': Failed to open V4L2 device '': No such file or directory
  ERROR SimplePipeline simple.cpp:1930 No valid pipeline for sensor 'ov02c10 20-0036', skipping

This is the same problem that commit 7456b40bc992 ("media: i2c: cvs:
Add sensor node in bound callback") fixed for CVS in v7.4-rc1. The
IVSC path still has it.

I can see two possible fixes, and I'm not sure which you would prefer:

- Revert 4fdb0342f05e. The comment above the ipu-bridge sensor table
  says not to add sensors that are not supported, and I found no
  HM1092 driver in mainline or linux-next.
- Do for IVSC what 7456b40bc992 did for CVS. I'll reply to this mail
  with that patch.

The second one only covers sensor nodes. As far as I can tell from
the code (not tested, my sensor has no VCM), a VCM instantiated by
ipu-bridge still gets its node only from .complete(), so with an
HM1092 in the tree a camera with a lens would lose focus control
regardless of IVSC.

Testing, all on CachyOS kernels. Their ipu-bridge and ivsc-csi
modules have the same srcversion as modules built from kernel.org
v7.2.8, and the test modules were built from kernel.org v7.2.8 sources
with clang 23.1.4 (the kernel itself was built with clang 22.1.8) and
loaded unsigned, so the kernel was tainted (E):

- 7.3.1: camera missing as described.
- 7.2.8: camera works.
- 7.2.8 with only the HM1092 entry from 4fdb0342f05e added to
  ipu-bridge: camera missing, same libcamera errors.
- Same, plus the patch applied to ivsc-csi: the sensor gets its
  sub-device node, libcamera lists the camera, PipeWire exposes it,
  and "cam -c1 --capture=10" streams at 30 fps. No kernel warnings.
- 7.2.8 with only the patch applied (no HM1092 entry, so .complete()
  runs after .bound() has already created the node): the sensor has
  exactly one sub-device node and streams at 30 fps. No kernel
  warnings.

I have not booted v7.4-rc2 itself. The patch is against v7.4-rc2 and
builds without warnings with W=1 under GCC and clang.

Hardware: Dell XPS 16 9640, BIOS 1.4.1. libcamera 0.7.2.

#regzbot introduced: 4fdb0342f05e

This report and the patch were prepared with the help of an AI
assistant (Claude); I reviewed them and ran the tests above on my
machine.

Thanks,
Sergey
