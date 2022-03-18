Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779054C7E
	for <regressions@lists.linux.dev>; Fri, 18 Mar 2022 14:47:25 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nVDsx-0006gp-Jp; Fri, 18 Mar 2022 15:47:23 +0100
Message-ID: <1c913c49-ec49-99b7-8ddb-9f6045a4c50d@leemhuis.info>
Date: Fri, 18 Mar 2022 15:47:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [REGRESSION] Right touchpad button disabled on Dell 7750
 #forregzbot
Content-Language: en-US
To: regressions@lists.linux.dev
References: <s5htubv32s8.wl-tiwai@suse.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <s5htubv32s8.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1647614845;a8f5d3bf;
X-HE-SMSGID: 1nVDsx-0006gp-Jp

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

Seems below regression soon will be getting fixed, but with the nearing
final I want to have this in the tracking to make sure everyone is aware
of it:

#regzbot ^introduced 37ef4c19b4c659926ce65
#regzbot title HID: multitouch: right touchpad button is disabled on
recent kernels
#regzbot ignore-activity
#regzbot link:
https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/726#note_1303623

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

On 18.03.22 12:42, Takashi Iwai wrote:
> Hi,
> 
> we received a bug report about the regression of the touchpad on Dell
> 7750 laptop, the right touchpad button is disabled on recent kernels:
>   https://bugzilla.suse.com/show_bug.cgi?id=1197243
> 
> Note that it's a physical button, not a virtual clickpad button.
> 
> The regression seems introduced by the upstream commit
> 37ef4c19b4c659926ce65a7ac709ceaefb211c40 ("Input: clear
> BTN_RIGHT/MIDDLE on buttonpads") that was backported to stable 5.16.x
> kernel.
> 
> The device is managed by hid-multitouch driver, and the further
> investigation revealed that it's rather an incorrectly recognized
> buttonpad property; namely, ID_DG_BUTTONTYPE reports it being 0 =
> clickable touchpad although it's not.  I built a test kernel to ignore
> this check and it was confirmed to make the right button working again
> by the reporter.
> 
> Is this check really correct in general?  Or do we need some
> device-specific quirk?
> 
> 
> thanks,
> 
> Takashi
> 
> 
