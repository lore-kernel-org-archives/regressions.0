Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4906E2CA2
	for <regressions@lists.linux.dev>; Mon, 31 Jan 2022 06:36:29 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nEQIc-0004Ov-L4; Mon, 31 Jan 2022 07:36:27 +0100
Message-ID: <74ee2216-a295-c2b6-328b-3e6d0cc1847e@leemhuis.info>
Date: Mon, 31 Jan 2022 07:36:26 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Intel_backlight does not work after updating from 5.10.89 to latest
 5.15.17 (fwd from bugzilla)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1643610989;f6984e3a;
X-HE-SMSGID: 1nEQIc-0004Ov-L4

Hi, this is your Linux kernel regression tracker speaking.

There is a regression in bugzilla.kernel.org I'd like to add to the
tracking:

#regzbot introduced: v5.10.89..v5.15.17
#regzbot from:  Filippo Falezza <filippo.falezza@outlook.it>
#regzbot title: backlight: Intel_backlight does not work after updating
from 5.10.89 to latest 5.15.17
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215553

Quote:

> As per title, after updating the kernel from to the currently latest version available in Arch repositories, the intel_backlight class has stopped working.
> 
> This is still present under /sys/class/backlight, but any change to it does not affect backlight. The only change that can be made is by setting abcklight to 0,  which turns off the screen.
> 
> To keep a usable system, I had to roll-back to 5.10.89, the last known version to work properly.
> 
> I have tried changing the pwm of the screen, which does affect the backlight, dimming it in steps, but it seems that something major has been changed.
> I also tried to just roll back the linux-firmware package, with no success. From this, I concluded that the issue should be in the kernel.
> 
> Finally, I should say that I have noticed a change in the scale of intel_backlight, as maximum_backlight went from 120000 down to 512.
> 
> Thanks to anyone who will help me.
> 
> 
> Which files should I upload to start debugging?

Ciao, Thorsten
