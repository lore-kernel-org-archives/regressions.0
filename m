Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE1423A8
	for <regressions@lists.linux.dev>; Fri, 27 Jan 2023 12:49:38 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pLOAi-0001Fi-8p; Fri, 27 Jan 2023 13:49:36 +0100
Message-ID: <93d1e57f-a7c5-4d3c-3b3d-d1f573894a78@leemhuis.info>
Date: Fri, 27 Jan 2023 13:49:35 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [git pull] Input updates for v6.1-rc5
Content-Language: en-US, de-DE
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <Y3gwySzRvhCwdSgW@google.com>
 <824effa5-8b9a-c28a-82bb-9b0ab24623e1@kernel.org>
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <824effa5-8b9a-c28a-82bb-9b0ab24623e1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1674823778;2d61123b;
X-HE-SMSGID: 1pLOAi-0001Fi-8p

On 13.12.22 12:41, Jiri Slaby wrote:
> On 19. 11. 22, 2:26, Dmitry Torokhov wrote:
>> to receive updates for the input subsystem. You will get:
>>
>> - a fix for 8042 to stop leaking platform device on unload
>> - a fix for Goodix touchscreens on devices like Nanote UMPC-01 where we
>>    need to reset controller to load config from firmware
>> - a workaround for Acer Switch to avoid interrupt storm from home and
>>    power buttons
>> - a workaround for more ASUS ZenBook models to detect keyboard cnotroller
>> - a fix for iforce driver to properly handle communication errors
>> - touchpad on HP Laptop 15-da3001TU switched to RMI mode
>>
>> Changelog:
>> ---------
>>
>> Aman Dhoot (1):
>>        Input: synaptics - switch touchpad on HP Laptop 15-da3001TU to
>> RMI mode
> 
> This appears to break keyboard on HP's 15-da1xxx which appears to have
> the same ID: SYN3286. This happens on 6.0.12.

Dmitry, Jiri's report afaics made you quickly apply a revert that since
round about mid December is in -next:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=3c44e2b6cde674797b76e76d3a903a63ce8a18bb

But it looks like it never made it to mainline (or am I missing
something here? it feels like I do... anyway, moving on.). Was that
intentional or did that simply fall through the cracks due to the
festive season?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

> synaptics excerpt from dmesg:
> psmouse serio1: synaptics: Trying to set up SMBus access
> psmouse serio1: synaptics: SMbus companion is not ready yet
> ...
> psmouse serio1: synaptics: queried max coordinates: x [..5648], y [..4826]
> psmouse serio1: synaptics: queried min coordinates: x [1292..], y [1026..]
> psmouse serio1: synaptics: Trying to set up SMBus access
> rmi4_smbus 6-002c: registering SMbus-connected sensor
> rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics,
> product: TM3320-003, fw id: 2659795
> input: Synaptics TM3320-003 as
> /devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/input/input21
> 
> 
> 
> 
> This was reported downstream as a regression between 6.0.10 and 6.0.12:
> https://bugzilla.suse.com/show_bug.cgi?id=1206358
> 
> Full dmesgs available there too.
> 
> 
> 6.0.10 has this instead of the above:
> psmouse serio1: synaptics: queried max coordinates: x [..5648], y [..4826]
> psmouse serio1: synaptics: queried min coordinates: x [1292..], y [1026..]
> psmouse serio1: synaptics: Your touchpad (PNP: SYN3286 PNP0f13) says it
> can support a different bus. If i2c-hid and hid-rmi are not used, you
> might want to try setting psmouse.synaptics_intertouch to 1 and report
> this to linux-input@vger.kernel.org.
> psmouse serio1: synaptics: Touchpad model: 1, fw: 8.16, id: 0x1e2b1,
> caps: 0xf00323/0x840300/0x2e800/0x400000, board id: 3320, fw id: 2659795
> 
> 
> 
> thanks,
