Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019007;
	b=d2aAF4S7omSSbCePmNReTZF5htCkiRj3iFZ2cD3Cr7aUp4o03LZZ6HbPK0ojvIQNC1Jg
	 l80ycM+bICcqGxUzY/Ulv+mI2qPxuoZjNooXrLZ99u6MwGQHgRK/6zYldZPyXABtzG9eH
	 GAcWI+n5bz3vzX+sK2mX9dy0dTnJkqu28E+I/I1+UPE5zf4KoaW9FBOMQXEf6ow8kyT1o
	 I7cgoIitj/iUl7Tf5fe2noByBuiCheG7QLy1GlAedS7XIh4m2Ky3VFCojVC796PcmlmJK
	 mAKMD5U81V5Mkd+LcgazmHXqGgiZ6simI7c+FeBP2avVaBBDXADnl+60gndCpGCufeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qTahpPHpbDlYYuB1ig8Pwb/kWwkqX6TStG8OWom3lfY=;
	b=qWM1rWK0XLUZ0CeLIXJvJNjsig5rTRvOawbSPetT079SvFVfDvbgrMrGv5hhd4yI1APJ
	 R0vfNeuYORaGZlGjiR+WG+FSn9RzvNGTpQcoBptGr2NHRgBmQWRheKC6DIZUxm6pD6OAc
	 owgtJxb5lnf27JqOkVYpoL/zY1A5P6t3xToRdNiXsTPx+R4wboVawr7LfyXzczYEVSKu7
	 ZuFNiVkMQf41MtdVAiJHRimwPdevyluAIF/pz4ftVQC72n564A9guPq16PmZrykwqOfat
	 kLYRA7AszkJpwSw2EY5159bvaZg5q8TjBUbsj1VU+PNLTn6doYPymOuGP2BVnUTv+Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FcEoz0iS;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF73606A32D
	for <regressions@lists.linux.dev>; Sat,  7 Nov 2026 02:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DF73606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FcEoz0iS
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1641521eec.1
        for <regressions@lists.linux.dev>; Fri, 06 Nov 2026 18:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794019005; x=1794623805; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTahpPHpbDlYYuB1ig8Pwb/kWwkqX6TStG8OWom3lfY=;
        b=FcEoz0iSbybzgni8aTm2QTcycEyLreAGPIYx7QYvbQdJywtc0O2WyB1ffKQwsT4NXs
         f797ITw6C+jEFlwTKGHAdrXCjOGJEg1Hxiss050kMbovsOLtYyHhwkiim9gOuKdSN2Lb
         9dv7BKG6m7fOkMopOh/NqEf1HCd2SL97wXxDmoUoHzSSj/stcfH0JqQ3/l/4pWTDhG0Q
         Ul8M534XjoP/UVuMWWFa4ivcAaMMYDMPBXAOqe7bjBEWpz4CX9Ghff5L6cvIA9cagWBY
         AuWSIVPPfJX9IK5PAE1jX+EyVIyM0wt3aFYM+meztUz74txkRvLfYBnMixjXMJtIoQb/
         f2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794019005; x=1794623805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTahpPHpbDlYYuB1ig8Pwb/kWwkqX6TStG8OWom3lfY=;
        b=kvHd9mPdjrrql/05SJcP1MNMK27LZVivDY+91Jmt4TwiybeZfGZk1yKHorYVWUcsJF
         aUrAq8fJi2r6KUViGKy41xjY6hMT6bwVsc81vt20u9755J3t/IG8/vQo2lh4ijW4299p
         mLJqpeyUskLv19kbp+KbQaSsc9VdISdZIIK+SiyjmQpk61Io3JQTD5srpikN2oSV5VUM
         MOHDCvq9Ljhu7IVhqdT9lKdY53IIsfUMHBIu1+6kG4qNmLpD6C3n94Q8N6WS1iNvqXs0
         HBjsz1Rnp9quoBBmcJrI0O8guUinoLc+KCaGaT5SwiKkbdSmUqsDW1FRBZD6gPEasFHy
         T+VA==
X-Forwarded-Encrypted: i=1; AL+hErFfyvjv+e1vRUlU5keQNctc8PXkD9nVbK3oNSPPEqzs+61q1FVW4QlNdts8FhSHnmrpSYjkZHkeDbHliA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/3FgEZXYRRkdahcIst6TVr2IZL8ewKQ8Z0TIHz89/lhxkxhW+7
	SU7MzXdI5orxeGx5RqZWNp990Rksd4aboFm9bQfHq3Ki/66kpfUpRFZN0oReCPQvCw==
X-Gm-Gg: AYBFou3Ezp8NWI7HjvFWp5ClzqmVPfDyWBwqnv9sNYfEmzCPQCpq3d1kxaYm1Ap8hwi
	L2yxOm5vYXawH2N+vH2vYKyd4bSgfZlNHZlX40097937TFLM47Cg6QxLW9QAcDMABi0FVHj6ds0
	pTZ3S81cwPasCQrS8Ypcd7Pg5bqQG8KBggaOAGzv0gNgECHZUL6x2c8/t4ddEFd4cFLcZFCJvhU
	jNDjjkk7sc5LhSB+3Tkpbv0ZmfWtpz4Xu2XYz2vekDlyLChCEJvJiHvt7EdCau4qOz/H4R3ZXiz
	+Tmm+uzAAsvmVy9eSMdx2fGjrmXj5brQzxf07O0tuFMN8jTAtPaZiLAyZ5XAH43llgLBZIW+OMS
	qEmtJO+N+lhDhEtQj9YIannpuia03bIHFFNAzdlh2bB+Jg1JbbUrPORwmI4ImN+oEGm/HRDa6Va
	4dOauXmB7yOo9IxXZCvRrLPCLz/r/b+X25HhB3wD+EkDUjrDNlPW6ATLwzmxKn6pIAFISNMJXCc
	d1YvpEEyS9jRPcmo0HUT77RJxmTZ1BrEoZ/3mBja6CzxJT8LR6Cx+FA9rk/6l4VD0sq9j6s+Jif
	jYvqHr5vyu68tWAwfgjBjlT+BJc9PuXujG6nLwaCSF4lJ+S/68hp7NfsLGeWCstXskkU1X+WHg7
	Pg6+xJzRZvCq3K9iKEpo=
X-Received: by 2002:a05:7300:4fa6:b0:36e:e349:f2cb with SMTP id 5a478bee46e88-36fb6a9164dmr5030384eec.19.1794019004825;
        Fri, 06 Nov 2026 18:36:44 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b4680sm10421618eec.20.2026.11.06.18.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:36:43 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v5 0/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Sat,  7 Nov 2026 09:36:36 +0700
Message-ID: <cover.1794018128.git.jjc@jclark.com>
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

On a BeagleY-AI, kernels since commit f918e3804498 ("arm64: enable
HAVE_SHARED_GPIOS for all ARM64 platforms") no longer boot: the on-board
USB hub is re-probed in a loop, because onboard_usb_dev defers probing
after the hub has been configured.

Following Johan Hovold's suggestion [1], patch 1 exports the generic
driver's operations, and patch 2 changes onboard_usb_dev to call them
itself instead of setting generic_subclass, so that it can defer probing
before the device is configured.

Tested on the BeagleY-AI on top of v7.4-rc1: the board boots normally,
and unbinding and rebinding the onboard-usb-dev platform device works.
With the peer-hub property removed from one hub's node, that hub binds
to the generic driver.

I used an LLM coding assistant to help prepare this series.

Changes in v5:
- Patch 1: added Alan's Acked-by
- Patch 2: stopped matching a device that has no platform device, so
  that the generic driver binds it (Sashiko)
- Link to v4: https://lore.kernel.org/all/cover.1793941292.git.jjc@jclark.com/

Changes in v4:
- Switched to calling the generic driver's operations from
  onboard_usb_dev, instead of adding pre_probe to the USB core
- Link to v3: https://lore.kernel.org/all/cover.1793669297.git.jjc@jclark.com/

Changes in v3:
- Added a patch fixing existing problems in usb_probe_device() (Alan)
- Link to v2: https://lore.kernel.org/all/20261030151919.3511106-1-jjc@jclark.com/

Changes in v2:
- Switched to adding a pre_probe callback to the USB core (Johan)
- Link to v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/

[1] https://lore.kernel.org/all/auSdA8MfolA8OhdM@hovoldconsulting.com/

James Clark (2):
  usb: core: export the generic device driver's operations
  usb: misc: onboard_usb_dev: don't defer probing after the device is
    configured

 drivers/usb/core/generic.c         |  4 ++
 drivers/usb/core/usb.h             |  6 ---
 drivers/usb/misc/onboard_usb_dev.c | 67 +++++++++++++++++++++---------
 include/linux/usb.h                | 10 ++++-
 4 files changed, 61 insertions(+), 26 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

