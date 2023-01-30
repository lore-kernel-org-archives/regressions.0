Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717D217D9
	for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 09:56:15 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pMQtY-0008LJ-Qm; Mon, 30 Jan 2023 10:56:12 +0100
Message-ID: <be545e72-8312-f213-0250-86a128b7b629@leemhuis.info>
Date: Mon, 30 Jan 2023 10:56:12 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: =?UTF-8?Q?Re=3a_=5bRegression=5d_Bug=c2=a0216885_-_HID++_Logitech_G?=
 =?UTF-8?Q?903_generates_full_scroll_wheel_events_with_every_hi-res_tick_whe?=
 =?UTF-8?Q?n_attached_via_USB?=
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Bastien Nocera <hadess@hadess.net>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Jiri Kosina <jikos@kernel.org>
Cc: David Roth <davidroth9@gmail.com>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, Tobias Klausmann <klausman@i-no.de>,
 Linus <luna+bugzilla@cosmos-ink.net>
References: <1bb93259-1c9f-5335-a0bf-fc8641b26650@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <1bb93259-1c9f-5335-a0bf-fc8641b26650@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1675072575;c6e20d29;
X-HE-SMSGID: 1pMQtY-0008LJ-Qm

[ccing a few people that CCed to the bug]

Hi, this is your Linux kernel regression tracker.

On 05.01.23 09:12, Thorsten Leemhuis wrote:
> [...] Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216885 :
> 
>>  David Roth 2023-01-04 20:37:22 UTC
>>
>> Created attachment 303526 [details]
>> Libinput record with G903 attached directly to USB
>>
>> Since
>> https://lore.kernel.org/linux-input/20220914132146.6435-1-hadess@hadess.net/T/#u
>> my Logitech G903 has gained hi res support. While normally a good
>> thing, it seems that in this case it leads to generating one normal
>> REL_WHEEL with each REL_WHEEL_HI_RES event instead of just a couple
>> of REL_WHEEL_HI_RES, followed by the standard REL_WHEEL once a
>> notch/tick is reached. This leads to overly sensitive scrolling and
>> makes the wheel basically useless.

Bastien, Benjamin, Jiri, that problem was reported 25 days ago now and
there is still no fix in sight afaics (please correct me if I'm wrong)
-- and based on the reports I've seen it seem quite a few people are
hitting it. Hence please allow me to ask:

Wouldn't it be best to revert that change for now (both in mainline and
stable of course) and then reapply it once a fix for this problem is
available? Or

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

>> Interestingly this only happens when the mouse is connected directly via
>> cable (PID:0xC091) and not via the Lightspeed wireless dongle
>> (PID:0x4087) where it will lead to correctly applying the times 8
>> multiplier and the relevant set of HI_RES and REL_WHEEL event once a
>> notch is reached.
>>
>> I originally thought about patching the module/adding a param to simple
>> disable high res support in general, assuming this might be something
>> people might want to configure, but seeing that this can be "fixed" that
>> way I decided to hold off on the thought.
>>
>> However it seems like we'd need to trade one set of quirks for another,
>> so not sure what the correct approach might be.
>>
>> I'll attach some libinput debug logs when the issue happens.
> 
> See the ticket for more details.
> 
> BTW, let me use this mail to also add the report to the list of tracked
> regressions to ensure it's doesn't fall through the cracks:
> 
> #regzbot introduced: 908d325e1665
> https://bugzilla.kernel.org/show_bug.cgi?id=216885
> #regzbot title: hid: overly sensitive scrolling with Logitech G903 that
> makes the wheel basically useless
> #regzbot ignore-activity
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
