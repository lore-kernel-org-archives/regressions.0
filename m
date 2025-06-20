Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56D82222D2
	for <regressions@lists.linux.dev>; Fri, 20 Jun 2025 19:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750447246; cv=none; b=KXZGYR5aB+5O6PXfC4Eul6zVHqN63HaKjOqwGTgBYkl+FJlmiHWCMQ1kaB1uJ8sXgvoyfT3yGTlaSjaQ5piOrSp3HFkKj8g0SYalDp1ZNaIoRaJ3y8zkPUSsaATRRRih96P3Fm9Em+jlxCM2RY1BNzM0Vndeu42ar7Bvo8OsJOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750447246; c=relaxed/simple;
	bh=ilXnAqYMDwX2xluyBBX5nFo0usHqV7SIWUSbptLAfII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FCrJNL3Qd3VHtVSCa/ETlXJl1pk7jvIi4gIq38/G2eCFc6QCkcsrcnWMH6OWi4coKGK/N+uXvkAgdJWOhgcZ+/JkklNibs8zjgSEch1wLiAIOZ1Rq4W0PHZgUvZrpPmvEv6Ik0jngVAaFN6EqQr8BkP6JrC7N7pPmMk2tcznQAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eC+ZVCCe; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eC+ZVCCe"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45348bff79fso24728165e9.2
        for <regressions@lists.linux.dev>; Fri, 20 Jun 2025 12:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750447243; x=1751052043; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4UADvpkf2IiBFZKK6AAi88bvFyLNL2fvrTWtjFa2BEw=;
        b=eC+ZVCCen3YdrJ1c2OPnNrVaJOeJKACA7vxrILeXeqD3tLSKhai6BDYwwKgeuwTiRw
         5yKKqI6PjGJ9TFRkEx+OXqi166onIpxY129FX/G/IaISwfGfKjbT8ocbTM1s43YwyTPh
         0NEKt7UlBt3HJJbYVxT2QGzOIgs50Ku9h5Cv3cuu3LM4kOofFaEdsK1TNClGEfY1wm5G
         dNzCQlHHoz0nVC/B1tiGzY79RP1ZtDHlwtI264CV3YBGHrAMu/0fapX5opfsjtPlkKhF
         4dL4zLfuRpKf6FTJHn7DMsbse59uj0mXSiSLsOuFL0vn1fMBo9XT3S1Q2qXljd3pBm0R
         jHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750447243; x=1751052043;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UADvpkf2IiBFZKK6AAi88bvFyLNL2fvrTWtjFa2BEw=;
        b=Mq0wkfTVUM7DeFo89C5r0eVGe/iW05LhNJWZHCoUBBiFkLGDi2M3qSLQTFtDyiwshP
         i9tXgnVlSFM7wVvHg9wTUXe+AMDc+zqRNWIczcPmERgJTGIkkTbOHuP3hJvn4qX9gV2Z
         Il+neyjPS5cb1EHfLPppXLdBF90HH+CHngjTzjQGyZWYu3nq46ST6Lepd1mZ0OHuhJ2p
         NOv2X3gq9GUYkRKZ+6jdP/xP4cXpTxDXvZHhEJc+CN9EW4Uvgpz1ng6wgupF8UcltV6a
         MJnYWhrSjbjH/OI/Tt2n9twOL+v5bMh76NboosIaxZiJKn4wQBssWiohURGroHjbJQzU
         seHQ==
X-Gm-Message-State: AOJu0YxhJZnECyAsSIoG0bY/z2VG7uc5MHol+sCHnG2r+LAWTCT3PwYn
	rvNZAsJ5G2UUjX/+y5Cg8EBk1icS1LY7cK72V3Kii22YYaw8nv8ya0Qt
X-Gm-Gg: ASbGncsOXoBnLOkdsdzWcQnyHThrhXPD2oaPAwvV1pXRlTf82cS8Td2v5vImjv/GrSt
	HIXT0FXOWAtogEPeic2+TIgiP1IrfmvZRiZ7yBYQMNn+IXmLkIRD0J3gEDNMFZ7fcs2d+NHzETG
	a9EFz8J5b1h9BNroGnKbPnsXg/mib2B/SMI9x24nRk8tQP2pecHkjkLQWSaES74E7weU+zqegFj
	/vjAJQFeuynPIPWJve0+w/xwxPyc7aLz7CkAJEaTCwzpCrVoVG6KXPGKbM7UCi3rqS8Wcgicfzc
	E9kOUm8t9f8MvAC11VCwZlklg3bgwaPrJoWeZVisOBT2be5qDaBj38l+72IW3m+/SyTCwfVCB7Y
	6KoK87gGIHDZYkImH5gk=
X-Google-Smtp-Source: AGHT+IG8aOoZC8S1rb/ev7lP9inHcJLu9ktL7RT5BqPIoEbcvhdGm52Wha1xhaCLBRuUuM1GSAo0nQ==
X-Received: by 2002:a05:600c:3b2a:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-453659b68afmr35278195e9.6.1750447242856;
        Fri, 20 Jun 2025 12:20:42 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e98b4bbsm66613005e9.15.2025.06.20.12.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:20:42 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 8766BBE2DE0; Fri, 20 Jun 2025 21:20:41 +0200 (CEST)
Date: Fri, 20 Jun 2025 21:20:41 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: regressions@lists.linux.dev, Jeremy Lincicome <w0jrl1@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-mmc@vger.kernel.org, 1107979@bugs.debian.org,
	stable@vger.kernel.org
Subject: [regression v6.12.30..v6.12.32] mmc1: mmc_select_hs400 failed, error
 -110 / boot regression on Lenovo IdeaPad 1 15ADA7
Message-ID: <aFW0ia8Jj4PQtFkS@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

In Debian we got a regression report booting on a Lenovo IdeaPad 1
15ADA7 dropping finally into the initramfs shell after updating from
6.12.30 to 6.12.32 with messages before dropping into the intiramfs
shell:

mmc1: mmc_select_hs400 failed, error -110
mmc1: error -110 whilst initialising MMC card

The original report is at https://bugs.debian.org/1107979 and the
reporter tested as well kernel up to 6.15.3 which still fails to boot.

Another similar report landed with after the same version update as
https://bugs.debian.org/1107979 .

I only see three commits touching drivers/mmc between
6.12.30..6.12.32:

28306c58daf8 ("mmc: sdhci: Disable SD card clock before changing parameters")
38828e0dc771 ("mmc: dw_mmc: add exynos7870 DW MMC support")
67bb2175095e ("mmc: host: Wait for Vdd to settle on card power off")

I have found a potential similar issue reported in ArchLinux at
https://bbs.archlinux.org/viewtopic.php?id=306024

I have asked if we can get more information out of the boot, but maybe
this regression report already rings  bell for you?

#regzbot introduced v6.12.30..v6.12.32
#regzbot link: https://bugs.debian.org/1107979
#regzbot link: https://bbs.archlinux.org/viewtopic.php?id=306024

Regards,
Salvatore
