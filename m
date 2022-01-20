Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9912C80
	for <regressions@lists.linux.dev>; Thu, 20 Jan 2022 15:07:49 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nAZ2R-0003jz-Kh; Thu, 20 Jan 2022 16:07:47 +0100
Message-ID: <6beced27-403e-7e8c-5c64-ec0feddd3331@leemhuis.info>
Date: Thu, 20 Jan 2022 16:07:47 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: net: iwlwifi: ax200: Firmware crashes on startup (fwd from bugzilla)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1642691269;e4d1d7e4;
X-HE-SMSGID: 1nAZ2R-0003jz-Kh


Lo! There is a regression dealt with in bugzilla I'd like to add to the
tracking:

#regzbot introduced: v5.15..v5.16
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215488
#regzbot from: Bernhard Rosenkränzer <bero@lindev.ch>
#regzbot title: net: iwlwifi: ax200: Firmware crashes on startup

> With kernel 5.16.0 (and current linux-firmware), the iwlwifi driver
> doesn't work at all because the firmware crashes on load.
> 
> Bisecting shows the problem is the newer firmware versions loaded by
> 5.16.0 -- reverting to iwlwifi-cc-a0-66.ucode (with the driver
> otherwise unchanged) makes it work.
Latest status:

> We have a direction for a fix.
> A *valid* W/A till we deliver will be to compile with IWLWIFI_BCAST_FILTERING  disabled.
Ciao, Thorsten
