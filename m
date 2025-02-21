Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AEE1FC102
	for <regressions@lists.linux.dev>; Fri, 21 Feb 2025 20:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740170434; cv=none; b=E+qo+6wCBTnLR8uAJuRowmXPnwhu44jxSt/RXXqWl8X9WMVHS0Lghqhy3pxW4zNlIOkYkZzS1k7EP08UvNp1QkKsX5aPlcM02qXORvAFaNAg1MNG39omKfHDA1FwLKSlI7mI+sfMt/5lEHe0MDWh6Mq7nmIiqqVQ+sC38lUMJpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740170434; c=relaxed/simple;
	bh=Mg6gmWKzWVa3N3jYfzSbLKWnOA5bhpnJPyDk3cTyD38=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=afc2ivv58tZhy5ZXMCRwZl6VsIyyY4z3p9WZbk8cGkOqNU5YqMbxDIb0p6gRvsN5nqQFjyC0fVx0Y/nD8r2fJMrjad7kXdmY3nfN11hx5HUrYOErxwCdfCDSzxM8d/Qg6sFDFlOqJLoEV9gMEsxOlzWZH4m2saYEIzbxFOMHvtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.2] (ip5f5af2a2.dynamic.kabel-deutschland.de [95.90.242.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 807A061E64783;
	Fri, 21 Feb 2025 21:40:26 +0100 (CET)
Message-ID: <9ded85ef-46f1-4682-aabd-531401b511e5@molgen.mpg.de>
Date: Fri, 21 Feb 2025 21:40:25 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-pci@vger.kernel.org, regressions@lists.linux.dev
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Linux logs new warning `gpio gpiochip0: gpiochip_add_data_with_key:
 get_direction failed: -22`
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Bartosz,


On the Intel Kaby Lake Dell XPS 13 9360, Linux 6.14-rc3+ with your 
commit 9d846b1aebbe (gpiolib: check the return value of 
gpio_chip::get_direction()) prints 52 new warnings:

     $ dmesg
     […]
     [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 
06/02/2022
     […]
     [    5.148927] pci 0000:00:1d.0: PCI bridge to [bus 3c]
     [    5.150955] gpio gpiochip0: gpiochip_add_data_with_key: 
get_direction failed: -22
     [50 times the same]
     [    5.151639] gpio gpiochip0: gpiochip_add_data_with_key: 
get_direction failed: -22
     [    5.151768] ACPI: PCI: Interrupt link LNKA configured for IRQ 11
     […]
     $ lspci -nn -k -s 1d.0
     00:1d.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI 
Express Root Port #9 [8086:9d18] (rev f1)
     	Subsystem: Dell Device [1028:075b]
     	Kernel driver in use: pcieport

Judging from the commit messages, this is expected. But what should a 
user seeing this do now?

Also, it probably should not be applied to the stable series, as people 
might monitor warnings and new warnings in stable series might be 
unexpected.


Kind regards,

Paul


[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9d846b1aebbe488f245f1aa463802ff9c34cc078
