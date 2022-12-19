Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D10410EF
	for <regressions@lists.linux.dev>; Mon, 19 Dec 2022 10:27:06 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p7DMM-0007WS-Fn; Mon, 19 Dec 2022 11:27:02 +0100
Message-ID: <9f0e95d1-5057-93f0-ad9e-985eaeed0226@leemhuis.info>
Date: Mon, 19 Dec 2022 11:27:01 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: =?UTF-8?Q?Re=3a_=5bregression=5d_Bug=c2=a0216818_-_The_microphone_m?=
 =?UTF-8?Q?ute_led_not_working_after_linux_6?=
Content-Language: en-US, de-DE
To: Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: sonic82003@gmail.com, plum <plumerlis@gmail.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>
References: <bf52f4c5-5cca-26d7-7fb2-ac8ecb5b24c5@leemhuis.info>
 <572159b3-a1a4-8735-d435-ea574c07851f@redhat.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <572159b3-a1a4-8735-d435-ea574c07851f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671445626;7c78547b;
X-HE-SMSGID: 1p7DMM-0007WS-Fn

On 19.12.22 11:00, Hans de Goede wrote:
> On 12/19/22 10:17, Thorsten Leemhuis wrote:
>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>> kernel developer don't keep an eye on it, I decided to forward it by
>> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216818 :
>>
>>>  sonic82003@gmail.com 2022-12-18 08:52:32 UTC
>>>
>>> The mic mute led of my ThinkPad X1 Carbon Gen 9 doesn't work anymore after updating linux to version 6.
>>> I can still turn it on by  running 
>>>
>>> echo 1 > /sys/class/leds/platform::micmute/brightness
>>>
>>> With linux-lts it still works fine.
>>
>> See the ticket for more details.
>>
>> Note, I found a similar report that (despite my attempts to prevent
>> things like this from happening) fell through the cracks here:
>> https://bugzilla.kernel.org/show_bug.cgi?id=216355
>>
>>>  plum 2022-08-13 02:11:01 UTC
>>>
>>> I upgrade to kernel 5.19.1 but found my thinkpad x1 carbon 2021's mute led stop working.
>>>
>>> Function is okay but LED won't light up.
>>>
>>> Back to kernel 5.18 and it's normal and working again.
>>>
>>> Fedora 36 64 bit 
>>> Gnome-shell 42
>>
>> From a quick research it looks to me like this is an issue for the
>> sounds maintainers, as the LED itself apparently works. If that is
>> something for the platform people instead please speak up.
> 
> Thanks for bringing this up, we recently hit this in Fedora too
> and we have a fix/workaround there. Let me copy and paste what
> I just added to bko216355 :

Many thx for sharing these details, really helpful.

> This is caused by a behavior change of the kernel code controlling the LED to only turn on the LED when all inputs, including e.g. the jack mic input are turned off in the alsa-mixer settings.
> 
> But most userspace code only turns the mic which it is actually using on/off when you hit the mic-mute hotkey.
> 
> Also see: https://bugzilla.redhat.com/show_bug.cgi?id=2134824

Ahh, lot's of helpful information and even a bisect there. :-D

#regzbot introduced: 9b014266ef8ad0159

> Which is the same bug.
> 
> There is a set of fixes available in the form of an alsa-ucm update which tells the kernel to ignore the state of the jack mic input restoring the old behavior:
> 
> https://git.alsa-project.org/?p=alsa-ucm-conf.git;a=commitdiff;h=79a8ec44d3dcf097f4a4492c506cbcf338324175
> https://git.alsa-project.org/?p=alsa-ucm-conf.git;a=commitdiff;h=9ce9ddb4a84fb467602b716575ea1d8f2bab0c39

Hmmm, that's nice, but well, by Linux' "no regressions rule" the issue
is caused by kernel change and thus must be fixed in the kernel, e.g.
without forcing users to update anything in userspace.

Jaroslav, are there any plans to do that?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
