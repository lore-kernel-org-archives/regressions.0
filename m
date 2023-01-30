Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F58C1FA4
	for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 10:44:12 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pMRdy-0003bl-A5; Mon, 30 Jan 2023 11:44:10 +0100
Message-ID: <0767b10c-9061-9487-3e50-34fe731d1f77@leemhuis.info>
Date: Mon, 30 Jan 2023 11:44:09 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [regression] Bug 216977 - asus t100 touchpad registered but not
 working
Content-Language: en-US, de-DE
To: Hans de Goede <hdegoede@redhat.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <btissoir@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 jessegodfroy@gmail.com
References: <2f4dc626-5287-6ec7-a31d-335e5dbb9119@leemhuis.info>
 <325be2be-0c58-7414-70e9-9585e35874a2@redhat.com>
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <325be2be-0c58-7414-70e9-9585e35874a2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1675075452;13118133;
X-HE-SMSGID: 1pMRdy-0003bl-A5

On 30.01.23 11:16, Hans de Goede wrote:
> Hi All,
> 
> On 1/30/23 10:22, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
>> Hi, this is your Linux kernel regression tracker.
>>
>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>> kernel developer don't keep an eye on it, I decided to forward it by
>> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216977 :
>>
>>>  jessegodfroy@gmail.com 2023-01-29 15:44:34 UTC
>>>
>>> After upgrading the kernel from 6.0 series to the 6.1 the touchpad on my asus t100 no longer works. 
>>>
>>> The device is registered in dmesg. I believe hid_asus is responsible for the keyboard and touchpad.  The keyboard continues to function, but the touchpad does not. 
>>>
>>> Jan 29 09:29:53 t100ta-white kernel: asus 0003:0B05:17E0.0001: input,hidraw0: USB HID v1.11 Keyboard [ASUSTek COMPUTER INC. ASUS Base Station(T100)] on usb-0000:00:14.0-3/input0
>>> Jan 29 09:29:53 t100ta-white kernel: asus 0003:0B05:17E0.0002: Fixing up Asus T100 keyb report descriptor
>>> Jan 29 09:29:53 t100ta-white kernel: asus 0003:0B05:17E0.0002: input,hiddev96,hidraw1: USB HID v1.11 Device [ASUSTek COMPUTER INC. ASUS Base Station(T100)] on usb-0000:00:14.0-3/input1
>>> Jan 29 09:29:53 t100ta-white kernel: asus 0003:0B05:17E0.0003: input,hiddev97,hidraw2: USB HID v1.11 Mouse [ASUSTek COMPUTER INC. ASUS Base Station(T100)] on usb-0000:00:14.0-3/input2
>>>
>>> I do not see any changes to hid_asus that should be responsible for the change in performance.
>> See the ticket for more details.
> 
> This is my bad, I accidentally broke SW_TABLET_MODE reporting on
> the Asus T100* and T101* series and it is now reporting that it
> is in tablet mode while it is actually docked and thus in laptop
> mode.

Ahh, interesting, will keep platform code in mind as possible suspect in
case a similar situation arises in the future.

> This is causing libinput to suppress touchpad events, as
> it would for a 360° hinges style 2 in 1 with the keyboard +
> touchpad folded behind the display (so in tablet mode).
> 
> A fix for this has already been merged for 6.2-rc6:
> 
> "platform/x86: asus-wmi: Fix kbd_dock_devid tablet-switch reporting"
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fdcc0602d64f22185f61c70747214b630049cc33
> 
> And the fix is also queued for the next 6.1.y stable series release:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/log/?h=queue/6.1
> 
> I'll also add this info as a comment to the bug.

Ahh, great, thx for the info and your work

#regzbot fix: fdcc0602d64f22185f61

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

#regzbot ignore-activity
