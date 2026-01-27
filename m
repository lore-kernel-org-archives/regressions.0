Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1412DB79B
	for <regressions@lists.linux.dev>; Tue, 27 Jan 2026 18:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540346; cv=none; b=WS98r9b8sCfA4KEq4vhCmB1AoBnLyextG/PhNWdqi62i6u8UhDv0+LiPoJjOaWqQPnGgidJPeRiH7sNnFN/BdJVQtbQJdOGnrH+5zF4e4L1LtMS0Ozx+YCbmfGl6uKYsyCFPqgUcPqt32kIvBmxoquqqct3UeIYqsvJRt7uXwWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540346; c=relaxed/simple;
	bh=5IzPdojvBgPrpJZwphzsim8SMgwmkPRRtnBFqrO/msk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=QU6t2SCVZz91TNl+TJY9S1WnpS4qHgLvqjyZLt0HbTHK0451Ok5Pda8sC5/z/Z5Qo6D0u90THHvkOPbtdoUhy72Yb/EOYJ7dPzxddAyPXd0f/A+9AaaiAuFjo4aLNUeBXiybhi1luYkGUUxC1psbc95oSxIFUBulcaXwjMaZZos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=G+2EWTjf; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="G+2EWTjf"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-124a1b4dd40so420968c88.0
        for <regressions@lists.linux.dev>; Tue, 27 Jan 2026 10:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769540344; x=1770145144; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSGXJedx7qR79VfRusvQyIhsig7RD38T9b2+vtFHaMo=;
        b=G+2EWTjfKgM/WFu+AO9ahbS7bBOZgpSkIYtxf85XhTWYAiFk5ECIsuhYFrJH+mhs25
         rHtOgs8V1TaVc62FoKSXTBGuUo38mQeJpnkEVR1zdz2JPJt7Q/3DUa5EROk3UWOqWuX+
         HJcA/Kvuc5+ZJo/j5YdoC4WJAVtIi3Wlj4H3Re1W7HgRq55gqT+GdPP0FvB5O0S2Mt2V
         lvh/xJh0aIL/4HvdL2R1J9l+DTjbt5HkAG6NoFYSteOaGHoo7y6ofrI0Su6L5pgNoFi1
         8Cc3aLsCcIqzS57PrGWluM/2r6EZNHxWf0EDhXKysS350GE3CdpE00pUGp8ROZTeb+Mi
         hLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540344; x=1770145144;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cSGXJedx7qR79VfRusvQyIhsig7RD38T9b2+vtFHaMo=;
        b=baJDprThAr3/KcXPteRhRfZSxD0ybs9uPTunJiilqzb+kYJZgMMqpcJTe84cEyQ4H2
         FyZOnRaQoBJO6NnJHIe6iRhRAE46UbjSXwPCZu+YpAiPJNrkQA62wwJmsu1AZRdlu64h
         7B1DVCkdPXAutDBUyGuHAPDrePHNclGRgRVI9SaUeNzJqcQRfBP4m8Ax3VTlJEl1OGLo
         /uDlGX+djuJJ47imchOPzm1zaQm4SIWBdJPPqLQa9dVm9KQgZ88MQu3Jycf8nSp+9bo4
         II51Da62vWsfNoDuV//MIUub5XRQ0nvBkn6YcyNPAywRGgQ93qf1aHyKDjJYrYWI5Eih
         rKvA==
X-Gm-Message-State: AOJu0YyuYLEs4sGbQkpysdjHbE+0qjepc8EKAIWMCU5dM1lTk1jpGEqa
	tqaO+W5KgRYRnDhGxNE6kiPEodQgrv/TupHERWfb9h7ets45cBj0EYOViJRvbbttVizZFcb5FLy
	/aQ6hPm8=
X-Gm-Gg: AZuq6aJ6KyZ4TAgLci1uIVDsZ+zdzdXw7mDy1eXQKWPZdMGcqbOJlENR7VFOqHKvXn/
	q/ZHI6RRtvU+NpUJsKUWnqyxat5xyCLgX6Mh6myFtDmwBAxdHmU+/DMYbNymBvd0OeiQuX4CxGw
	t/4aTaszQRcj6xwftuVuPzbfwP9HAOFsUuCWa7DPwHEmx+sEKqq63x0oQ066NoTWlFaneUYodxt
	4DvMQsdHYKPSbOb4gd0w8PH14Ncj3oqPg4epYGc4+7OdfIcU3U+znGG/Nx9IoSBKGPDdIeqlvkW
	aa/JKCBUo5dtxlS55vBuHk2zXLwNTAcqGwrnaz9aWzfZC7jstoIaPS+LCQ+zLIXDDko4j7xnhM8
	A8G1sFly0emhE3fdsPMngb+zJz8/hA66PaDpoxhiyiSjskb077tVL1IXVoCvkVPd7X2WiEBJqMq
	b6ZcBY
X-Received: by 2002:a05:7022:6609:b0:11b:8161:5cfc with SMTP id a92af1059eb24-124a00c4cbamr1696781c88.36.1769540343935;
        Tue, 27 Jan 2026 10:59:03 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a7bd05b1sm786545c88.3.2026.01.27.10.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:59:03 -0800 (PST)
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
Date: Tue, 27 Jan 2026 18:59:03 -0000
Message-ID: <176954034280.3309.3334972019456076511@22d5995788c3>





Hello,

New build issue found on next/master:

---
 drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7c: can't find jump dest instruction at .text+0xc40 in drivers/hwmon/cros_ec_hwmon.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.warning]
---

- dashboard: https://d.kernelci.org/i/maestro:9be47da80cfd017764d8a2750178c200bba3ef54
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  4f938c7d3b25d87b356af4106c2682caf8c835a2
- tags: next-20260127

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7c: can't find jump dest instruction at .text+0xc40

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.12/x86_64/chromeos-amd-stoneyridge.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-chromeos-amd-6979019c1908a6300d99fbd5/.config
- dashboard: https://d.kernelci.org/build/maestro:6979019c1908a6300d99fbd5


#kernelci issue maestro:9be47da80cfd017764d8a2750178c200bba3ef54

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
