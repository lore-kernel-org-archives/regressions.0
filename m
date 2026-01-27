Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F80331A7E
	for <regressions@lists.linux.dev>; Tue, 27 Jan 2026 21:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769551146; cv=none; b=j49rm1UTOaSGndgirXhCjAdB2cAVC2T8l1Xl+MToaLum6kTeTq4tmiUAZD1/xSflOaUfxEFnn6+ykYOwC2r1sdAysUAXuygmZ/G8aOC6cK5dngfg2/7S9xoCQ9adQM7IQDxW5KTl/vS/qptpwUR9zbqR23mAW/BXWj7EFzklLXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769551146; c=relaxed/simple;
	bh=QdLu62pR2lusMO+0suqgRVty1ILKnCO6FuairQFnFfg=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=p8YMuXm1ZAZgHAY+UX32jgSGNYqUwUUdqu3DcV7m4JtXFYfBvP0S3xfrZzsDYaXRqadiDqrUE2BMaaG2LmcaoJkqTWGN718zIvcWmBVfKv7VB9ysO9KvMKdZ6fYxzm1ZkVgHaq6iesNpSIzozKHv5Xw14SimRKxwgIPH0h0VG3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=YIkrVgb+; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="YIkrVgb+"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-124877d78a6so3911418c88.1
        for <regressions@lists.linux.dev>; Tue, 27 Jan 2026 13:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769551144; x=1770155944; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZN9zZD5JHhq2eCRz3FpcJuHJS43qoJIvIxBY26o07o0=;
        b=YIkrVgb+SEtxBDgYb0xua2LiyKZujBCbsi9euHUTKAzxzjmvJCJABoJPAhTNmpJf7B
         EcO9dB5NIOol87OFxNmEkfIazSL3C0tkFQHlehk5+gvkCKvea8cl6ub3tQr5C5SRczAv
         4CYSYhOHcj3qYx/7IRQ7Ov8+ThG0q4J1R0BvRCQ8rxej2qepgmD4y2N2t9pDmJBy7zXk
         No5Mw5C5PnOUq8iCUKHrrmHrBj41aCM3Oq9KcF/DDzQbTbT59qHV4BOZJNYDlWnk0ku/
         5dbIwR+xnu1JwzNB3sBAe65BrTXmYlI0JsM5vHoUEQC1NaJ6Nf7f5n/BdwPeSE7c4Dgy
         DGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769551144; x=1770155944;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZN9zZD5JHhq2eCRz3FpcJuHJS43qoJIvIxBY26o07o0=;
        b=e4atsQ5KZGMhOlwZ+wMUo5JRmpj/GR1SDd3OS2nfbKwJ++iAmmFPn5P2ni8W7KCqRl
         NQDWJODReTp0tD/Bg0G1xhQUIcC3m67abqb+vCkL6hc90rL+bqD/FJ3ucBuHNiqKgWPg
         SGJMIWU/e2cuIHih/PDUS+Nqpuh2Y5JzFJq5FWTIG2TEIcMsRYfNyQ1y+5XiGXkwxMA4
         gMp+iEd5QDvfuruKMa0ajQgmcJ5busLpJJi9NEB1b1MqbDvnlnaj3ysX1OL8H6lWuwuZ
         Ct2/54ZlQOQ07Wqb5TudUwnKA9bo8f9CzXJ8knGPNHgweFs/ZRlijSMOb7BrQ3s/kEQQ
         mfmg==
X-Gm-Message-State: AOJu0YxiDYajMxcxSmMS/A72lCrnJBrkJ117EGoqA7MvjCy05munhbY3
	XBYdA+328h/BKKEjzeV+D6rV34Rtz2P927OW/l0w6VTag7NQEL2WJeP2v+/ZRUhuv5U=
X-Gm-Gg: AZuq6aK+D+oH1PazFjZDai2bH86Y9EROtWBMTzaZqMqWJTyy/+IdzULGshuckYfEamS
	/HTYcCYoPlhNZj0e++YGwkVNec6JgfRkip6uZ86zGYsRVn12bp+QbbYqPHOVTmPCQDF+iXxFrdb
	hiyGTKXcmOCK1rs+4252AAPVvYWcaoaTihYc3jsc5rQ+Drfke8MFo8q9VjA5li8PDyRkblDSmzH
	MbpsFUBiPNp0KLysVKmIUX4QQWj9c7YHhGMfwWaZfdaQmqNCD8vhByadlH7Of9TdfDftMpslaSp
	TcioVb+Lcly6r+J5F1ZkFEeZJ+5AB6dUPti3oC+GY3i9dW/2mTunkyiO27Uw3Eq2xY4gzZqupC8
	qdsrxsqAWJoDdR0g75db+DmE00wbSOaBjzeMLUNWVgO6jMU2hq++MO6Qubjo4FkvoglwsPbH+cD
	VnaIb9loQaiS3e+MU=
X-Received: by 2002:a05:7022:20c:b0:124:65f7:2c2e with SMTP id a92af1059eb24-124a00e8c1dmr1561128c88.43.1769551144265;
        Tue, 27 Jan 2026 13:59:04 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a7c979a0sm1229836c88.17.2026.01.27.13.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 13:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) drivers/hwmon/cros_ec_hwmon.o:
 warning:
 objtool: cros_ec_hwmon_rea...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 27 Jan 2026 21:59:03 -0000
Message-ID: <176955114271.3366.15377999788690065865@22d5995788c3>





Hello,

New build issue found on next/master:

---
 drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7c: can't find jump dest instruction at .text+0xcf0 in drivers/hwmon/cros_ec_hwmon.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.warning]
---

- dashboard: https://d.kernelci.org/i/maestro:afa9c68f088cdf27ef09179db83770ab9ade3741
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  4f938c7d3b25d87b356af4106c2682caf8c835a2
- tags: next-20260127

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7c: can't find jump dest instruction at .text+0xcf0

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.12/x86_64/chromeos-intel-pineview.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-chromeos-intel-697901a11908a6300d99fbd8/.config
- dashboard: https://d.kernelci.org/build/maestro:697901a11908a6300d99fbd8


#kernelci issue maestro:afa9c68f088cdf27ef09179db83770ab9ade3741

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
