Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94B91C2323
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 21:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727991788; cv=none; b=nJzu0sPnh/KPRQ+hiwZSK1gJ3WUSg+iTHWbyvUWUGQrg5J3Fy/b9DUIMfoNR1UGfezZfX16buco0yxYByuGEdCYpQxJziFbMbxi1arqqaJ+73GB7F06w8tZlTLL+lDBLFmABjmfT7fTdlZcZvB45azwbRw6p9W5PLmxARiNlvKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727991788; c=relaxed/simple;
	bh=VDXJk6/dnSS8sn9qohZVdF+AvHEy5J4pjidawrVOoHk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ktuoMulg+njm6/3aN3wvwzdpFcvEU1nLujTRgU/hSP00EJwlXkpGT29VFjiBMWPBqfh9ZI0PDAhWKM+erp+/EbCTrOgDuFPOsdSmb+p5Fh/g0I6JXwL7fa7oxRmUbng6p64MfJX1uMvYIwmuxjKhdFsYLJhc4zRS01HwvEhzHS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpEkXkGS; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpEkXkGS"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5398e4ae9efso1711415e87.1
        for <regressions@lists.linux.dev>; Thu, 03 Oct 2024 14:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727991785; x=1728596585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDXJk6/dnSS8sn9qohZVdF+AvHEy5J4pjidawrVOoHk=;
        b=SpEkXkGSrdUjfsc9ntaBAhEq3XV+OBe9S2umdjVz/TLmN3Nvhg2QXGehpCDwxTIOKv
         DfnwvldFL18FsRlzFWfaDc8LJByE8oBanmPX18TCjI9TD2La2prbufAJwnzggP6H7dmi
         +Jkjl++lB9lQI8EcATO5vK2Y5qaGIEuRTK9iq5nZrXA6smruGXSXnDYrERPpsfTobLVq
         5ycqQToN1JlvHxn3ZRj4nIYoY92Pyrq/cnh6w8ku2uAbcWxn8vOPpYadFJDXBfnAoQjM
         2cxY0LiXdQzQhHQamsDrf3vfgkK2k9qktaVdAAEG6SYfE3UVEqjjIB9lq/uQyfrQbGTJ
         v1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727991785; x=1728596585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDXJk6/dnSS8sn9qohZVdF+AvHEy5J4pjidawrVOoHk=;
        b=cOqGnEJPc+eUPNCZ4T3Xwe6uGucKr5aH9WG2HEAu5bs6o10Zin+Mzei4Rix8aOUA8r
         bcpZlFvb/7fqnpELzzUjRWfeoRvRWOdn6fqE9bpY+6wj/LTvuxJ3b9DilebzLT2OGFqt
         rRIglXFKe2noRdZMrnzNhqUK/3UtnMA0LQ/Hp8AluZLeT+dJp9T2CqfZXIevRfZzTYkO
         GJAM78FZowuEUPInwZkZUh8pntwU9cmIFYws8U2ANsNlLtymaOpLr6pv/DJY4SKWXJMh
         zkYVhoRUvaOD7y8BZ7DqVt46TKePcQ0ymV2FvGCMQ0JblCw2JIFnoFqXqs9Rf7T1TQcB
         giJA==
X-Forwarded-Encrypted: i=1; AJvYcCWf9P31kXQlhzW2wV/Ib2gYf/Uhnw5brJWhuhvWzEK8HIhteKauhLgsuH/MFQfB0rgUla2NWmCEpsYbXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCIb6nXy/1PjVciAt5IQH8d09pK/1BKEHISpuXctFZebxdWndK
	2pyvJMjuFoEQvi6evSbvEMQk2WHMBhofEbmBi/bDslqpi2pU0+xS
X-Google-Smtp-Source: AGHT+IHgY/sKkr2jZT5s5Fvv9m89t/4drKmCvgrDFQwI2KFMP/IgkeOS8RulT8F0pGYHdHoA/l4nfQ==
X-Received: by 2002:a05:6512:b94:b0:539:8f4d:a7c9 with SMTP id 2adb3069b0e04-539ab9de2fcmr474571e87.41.1727991784536;
        Thu, 03 Oct 2024 14:43:04 -0700 (PDT)
Received: from foxbook (bfk18.neoplus.adsl.tpnet.pl. [83.28.48.18])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a82974dcsm264903e87.166.2024.10.03.14.43.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 03 Oct 2024 14:43:01 -0700 (PDT)
Date: Thu, 3 Oct 2024 23:42:57 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Raju.Rangoju@amd.com, Sanath.S@amd.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, mario.limonciello@amd.com,
 mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
Message-ID: <20241003234257.7e87b675@foxbook>
In-Reply-To: <82aa97b6-4b3a-48d3-a022-04563eb01e45@amd.com>
References: <20241003214827.4edb8731@foxbook>
	<82aa97b6-4b3a-48d3-a022-04563eb01e45@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> No 'quiet' option and with loglevel at 4 I still don't seem to see
> any prints.
What's the loglevel of your printks? If they are INFO, NOTICE or DEBUG
they will not appear on loglevel 4. In particular, the patch you are
testing added a dev_info, which is INFO and will not show on level 4.
I would simply change it to dev_err, then it should show.

> Interestingly if I set loglevel to 6 my boot gets much farther but
> then gets stuck at "A start job is running for Load Kernel Modules
> with ever increasing timeout values".
So the kernel isn't crashing, but probably some module gets stuck on
initialization and 'modprobe' never completes.

Not sure if it really gets much further or simply prints more noise?

If Magic SysRq doesn't work, maybe systemd simply disabled it? It does
so by default, unless overriden by custom config files. It looks like
your root FS gets mounted, so those configs may work.

You could also try blacklisting xhci_pci. I don't know what sort of
kernel config you are using, but on Arch Linux xhci_hcd is built-in so
your blacklisting attempt failed, but xhci_pci is a loadable module.

If this helps, then the next logical step is to 'modprobe xhci_pci'
while running 'dmesg -w' and see what happens.

Regards,
Michal
