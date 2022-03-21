Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4EA7A
	for <regressions@lists.linux.dev>; Mon, 21 Mar 2022 06:29:21 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nWBXX-0004rC-64; Mon, 21 Mar 2022 07:29:15 +0100
Message-ID: <818a4927-b204-3eab-da9f-466841ec9a16@leemhuis.info>
Date: Mon, 21 Mar 2022 07:29:08 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] HID: multitouch: fix Dell Precision 7550 and 7750 button
 type
Content-Language: en-US
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 jkosina@suse.cz
Cc: tiwai@suse.de, benjamin.tissoires@redhat.com, peter.hutterer@who-t.net,
 linux-input@vger.kernel.org, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220320190602.7484-1-jose.exposito89@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220320190602.7484-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1647844161;5e144c40;
X-HE-SMSGID: 1nWBXX-0004rC-64

thx for working on this

On 20.03.22 20:06, José Expósito wrote:
> The touchpad present in the Dell Precision 7550 and 7750 laptops
> reports a HID_DG_BUTTONTYPE of type MT_BUTTONTYPE_CLICKPAD. However,
> the device is not a clickpad, it is a touchpad with physical buttons.
> 
> In order to fix this issue, a quirk for the device was introduced in
> libinput [1] [2] to disable the INPUT_PROP_BUTTONPAD property:
> 
> 	[Precision 7x50 Touchpad]
> 	MatchBus=i2c
> 	MatchUdevType=touchpad
> 	MatchDMIModalias=dmi:*svnDellInc.:pnPrecision7?50*
> 	AttrInputPropDisable=INPUT_PROP_BUTTONPAD
> 
> However, because of the change introduced in 37ef4c19b4 ("Input: clear
> BTN_RIGHT/MIDDLE on buttonpads") the BTN_RIGHT key bit is not mapped
> anymore breaking the device right click button.
> 
> In order to fix the issue, create a quirk for the device forcing its
> button type to touchpad regardless of the value reported by the
> firmware.
> 
> [1] https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/481
> [2] https://bugzilla.redhat.com/show_bug.cgi?id=1868789

Nitpicking: those should be "Link" tags, as explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'? Never tried, but if you want to
make them footnote-style this should work according to the docs:

Link:
https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/481  [1]
Link: https://bugzilla.redhat.com/show_bug.cgi?id=1868789  [2]

In anyone wonders why I care: there are internal and publicly used tools
and scripts out there that reply on proper "Link" tags. I don't known
how many, but there is at least one public tool I'm running that cares:
regzbot, my regression tracking bot, which I use to track Linux kernel
regressions and generate the regression reports sent to Linus. Proper
"Link:" tags allow the bot to automatically connect regression reports
with fixes being posted or applied to resolve the particular regression
-- which makes regression tracking a whole lot easier and feasible for
the Linux kernel. That's why it's a great help for me if people set
proper "Link" tags.

While at it, let me tell regzbot about this thread:
#regzbot ^backmonitor:
https://linux-regtracking.leemhuis.info/regzbot/regression/s5htubv32s8.wl-tiwai@suse.de/


> Fixes: 37ef4c19b4 ("Input: clear BTN_RIGHT/MIDDLE on buttonpads")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> [...]

Ciao, Thorsten
