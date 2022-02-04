Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD412F26
	for <regressions@lists.linux.dev>; Fri,  4 Feb 2022 08:35:51 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nFu4L-0001SM-Ay; Fri, 04 Feb 2022 09:35:49 +0100
Message-ID: <9cf4e3d0-e6ff-8269-b36a-6faef275e049@leemhuis.info>
Date: Fri, 4 Feb 2022 09:35:48 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: net: iwlwifi: ax200: Firmware crashes on startup (fwd from
 bugzilla) #forregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <6beced27-403e-7e8c-5c64-ec0feddd3331@leemhuis.info>
In-Reply-To: <6beced27-403e-7e8c-5c64-ec0feddd3331@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1643963751;861cdad8;
X-HE-SMSGID: 1nFu4L-0001SM-Ay

#regzbot fixed-by: 92883a524ae918736a7b8acef

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=92883a524ae918736a7b8acef98698075507b8c1

> iwlwifi: remove deprecated broadcast filtering feature
> This feature has been deprecated and should not be used anymore.  With
> newer firmwares, namely *-67.ucode and above, trying to use it causes an
> assertion failure in the FW, similar to this:
> 
> [Tue Jan 11 20:05:24 2022] iwlwifi 0000:04:00.0: 0x00001062 | ADVANCED_SYSASSERT
> 
> In order to prevent this feature from being used, remove it entirely
> and get rid of the Kconfig option that
> enables it (IWLWIFI_BCAST_FILTERING).
> 
> Fixes: cbaa6aeedee5 ("iwlwifi: bump FW API to 67 for AX devices")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215488
> Cc: stable@vger.kernel.org # 5.16.x

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 20.01.22 16:07, Thorsten Leemhuis wrote:
> 
> Lo! There is a regression dealt with in bugzilla I'd like to add to the
> tracking:
> 
> #regzbot introduced: v5.15..v5.16
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215488
> #regzbot from: Bernhard Rosenkränzer <bero@lindev.ch>
> #regzbot title: net: iwlwifi: ax200: Firmware crashes on startup
> 
>> With kernel 5.16.0 (and current linux-firmware), the iwlwifi driver
>> doesn't work at all because the firmware crashes on load.
>>
>> Bisecting shows the problem is the newer firmware versions loaded by
>> 5.16.0 -- reverting to iwlwifi-cc-a0-66.ucode (with the driver
>> otherwise unchanged) makes it work.
> Latest status:
> 
>> We have a direction for a fix.
>> A *valid* W/A till we deliver will be to compile with IWLWIFI_BCAST_FILTERING  disabled.
> Ciao, Thorsten
