Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5571428E3F
	for <regressions@lists.linux.dev>; Fri,  4 Apr 2025 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776240; cv=none; b=kk6mUXXyYVtwcT7EwQDMlgXU49Nqf2SLxDFLYS7d0Ek28L4vnJMJzWtALWqiuipQgYOC6L5kIE2/qzG9FMqIuZPvwl6/cBPNU/hqD3RiI/vAxPmoobkPh390MprtocWmxKUgxmoUvFp2ObWex89RTAGOFhJfmgrpRD7C7v64Pj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776240; c=relaxed/simple;
	bh=+1U1cWovTA5uTsLrg02/upXbC5wZqI1dP4zYTSOQYpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IyL56dJ04vtjPCS+4JRdovpUKiluJKJNYJkIaKICxxcZXKm5kyEJa1d8DScOm0w4xsMcppOXv/Q7ZwWjubtn+kJ1SLZh1eVTWurSXuYigg3Rg+/eAJDQIYtHADckGJYEe5Cn7Per9ku31827hTTUVzdU3IsUjuEJSa+T3iTOzlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezk5bnrr; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezk5bnrr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301a4d5156aso1929991a91.1
        for <regressions@lists.linux.dev>; Fri, 04 Apr 2025 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743776238; x=1744381038; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJkY/rj+UDur6IhWIRiqvOf7fRgwOlEqOQiYwibJQko=;
        b=ezk5bnrrXhEZ+3xSPfVBDN9utqdCH41kW3M7tU8cW/BuT39QDX3m3Tk/XUD01UY2zG
         AGOm37aiYEPVHBeuRF2oXE+qWqO1QUTQoSfLgY9O0yzyx/LzxzHyhJhCs5ZUm2+72vcH
         +1+jVnIXWPOrNDw2bghvMC869lSeUmEPkrB9Qn1LflQ95SDKyQp4c+7yui6xMiFeSdjA
         Sm5Af1lR8rG9XJPeLrIRRW5tGkrTlfiR6/BpVxqssgNPXnXLklDwCbKBg+PutAbEK0Eu
         mGdHx7dK4go0QwVRLfKW63pu7HJegOThrPtPzORClbu8EObt8po+BD5Ln2IBAvF16Yrk
         wlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743776238; x=1744381038;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJkY/rj+UDur6IhWIRiqvOf7fRgwOlEqOQiYwibJQko=;
        b=G+n1mPp2RumJ/fQOHHZlqDRJIiunCK5l6Vne8I8LX0fS9ULMW0RNO5cU2ORNKwo79a
         SClRmmnoMqrCGK1bazpQEVySXxU17ycE7yOlG0vmbFR5ilXd+W3Iyr3q0Quc0HgTSlk9
         ZpmT+ZAiT3RIY/ZI9DXCunhP1saSkH3BlsW04OhI8MUMTS2C+/6jbpRPnPdTH97huFKM
         JJN+dkAdSfQJoIU0ob5Ei60INieQfOAFVMBoOupIIDpCsA7qw2HEN9BkbVmFnMAN6F8W
         d2adYb2SlHb49+qkV6Ha0Iv/l2pA5SQlhfvT1oW/9xtCDImotG0iquTjjlvNqJVJwQ+/
         HRgw==
X-Forwarded-Encrypted: i=1; AJvYcCWgSet29EbDlrMxX0XVffifVBoZZt3zosrrxLH9FeR4t6ZBMy5hFPAdqdcdTN5R9K1HtXsXzc2/3WzhZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQsMXidWNCAruuQnwYu2YFAV7FIBBL+6NOUfxNZvWs0y2U3Sri
	M4oKN4JZzSqmE2PqbbUXkwRh7Hv+NRshe3qLd7rhPEoET1ClxRrJ
X-Gm-Gg: ASbGnctkSs/3cgEPBAnjr1C++x6LObNfgs0ipl49NVbHFldU5CHxE8zaw3zUS1O11Y9
	goj8yZuEuj6YiXvqgOoE0SqNuthsw8SWWx0irrt10iasfyQ+5Q91A5xkCtm2SteDkKv1SoD91co
	K1gyPnFuJVzlunIVoWxJWKpjH4ioJ9bWbd/rbN7LbJijFUarDisuzMa9vaVe3zOqJs3hF5lAS6d
	tfG+fWmpCtqCbsQCx4MhxYGWNSecR3e4yupm8MC3NlcwVhwIZvF6cBLoiRNN+FL99vxowAyTnP2
	PxOWnu91TVa+I80ApZY9MYVf7/1KtAH2842AwA6Ujzw=
X-Google-Smtp-Source: AGHT+IGq9BLsszWtOE+3T1GWMl1g2khKbvr87Eb9IDtheXW5uB6Qt8lknEwKp1TWBl0CEPIqeeafWA==
X-Received: by 2002:a17:90b:524f:b0:2ea:712d:9a82 with SMTP id 98e67ed59e1d1-306a498bfbbmr5106652a91.29.1743776238250;
        Fri, 04 Apr 2025 07:17:18 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c2:fdb9:802:4e79:d42a:3b39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca1f40fsm3693825a91.4.2025.04.04.07.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:17:17 -0700 (PDT)
Date: Fri, 4 Apr 2025 11:17:13 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] Kernel reboots unexpectdely on i.MX8X when Cortex-M4 is
 running and it was started by U-Boot bootaux
Message-ID: <20250404141713.ac2ntcsjsf7epdfa@hiago-nb>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

#regzbot introduced: 4f6c983261

Hi Peng and all,

Commit 4f6c9832613b ("genpd: imx: scu-pd: initialize is_off according to
HW state") introduced a regression where the Kernel reboots unexpectedly
(without any warnings, crashes or errors) when the Cortex-M4 was loaded
and running by U-Boot, using the bootaux command:

# load mmc 0:2 ${loadaddr} /home/root/hello_world.bin
# bootaux ${loadaddr} 0
# boot

This is a simple hello world binary that prints a message into the
M40.UART0 pin (demo from NXP MCUXpresso).

Before this commit, everything worked as expected, Linux boots fine and
the HMP core keeps running and printing messages to the UART. After the
commit, the kernel reboots at the beggining of the boot process. The
only relevant message is printed by U-Boot after reset:

"Reset cause: SCFW fault reset"

This commit was bisectabled, the same device tree, u-boot version, and
SCFW versions were used. Reverting this commit fixes the issues.

For testing purposes, I created the following patch which also fixes the
issue:

diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
index 38f3cdd21042..0477b3fb4991 100644
--- a/drivers/pmdomain/imx/scu-pd.c
+++ b/drivers/pmdomain/imx/scu-pd.c
@@ -539,6 +539,9 @@ imx_scu_add_pm_domain(struct device *dev, int idx,
                return NULL;
        }

+       if (strstr("cm40", sc_pd->name) != NULL)
+               is_off = true;
+
        ret = pm_genpd_init(&sc_pd->pd, NULL, is_off);
        if (ret) {
                dev_warn(dev, "failed to init pd %s rsrc id %d",


Test Environment:
- Hardware: Colibri iMX8DX 1GB with Colbiri Evaluation Board.
- U-Boot Version: 2024.04
- U-Boot Build info:
	SCFW 83624b99, SECO-FW c9de51c0, IMX-MKIMAGE 4622115c, ATF 7c64d4e

The issue is not present on: v6.5

The real root cause is still unclear to me. Anybody has any ideas? I am
happy to share more details if needed.

Cheers,
Hiago.
