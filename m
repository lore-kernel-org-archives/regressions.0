Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F7B20E3
	for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 11:27:50 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pMSKA-0005gA-FM; Mon, 30 Jan 2023 12:27:46 +0100
Message-ID: <02834fa9-4fb0-08fb-4b5f-e9646c1501d6@leemhuis.info>
Date: Mon, 30 Jan 2023 12:27:45 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
Content-Language: en-US, de-DE
To: Jason Montleon <jmontleo@redhat.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: casaxa@gmail.com, cezary.rojewski@intel.com, lma@semihalf.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 regressions@lists.linux.dev, stable@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>
References: <CAJD_bPJ1VYTSQvogui4S9xWn9jQzQq8JRXOzXmus+qoRyrybOA@mail.gmail.com>
 <Y9Vg26wjGfkCicYv@kroah.com>
 <CAJD_bPLkkgbk+GO66Ec9RmiW6MfYrG32WP75oLzXsz2+rpREWg@mail.gmail.com>
 <CAJD_bPK=m0mX8_Qq=6iwD8sL8AkR99PEzBbE3RcSaJmxuJmW6g@mail.gmail.com>
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAJD_bPK=m0mX8_Qq=6iwD8sL8AkR99PEzBbE3RcSaJmxuJmW6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1675078070;6b00b30f;
X-HE-SMSGID: 1pMSKA-0005gA-FM

On 30.01.23 07:33, Jason Montleon wrote:
> I ran a bisect back further while patching in
> f2bd1c5ae2cb0cf9525c9bffc0038c12dd7e1338.

Cezary Rojewski, you authored this change which appears to cause a
regression. Do you maybe have an idea what's wrong here?

Also CCing Takashi, who merged that changes.

FWIW, this thread starts here:

https://lore.kernel.org/regressions/CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

> When doing this, 3fd63658caed9494cca1d4789a66d3d2def2a0ab appears to
> be the commit in 6.1+ that it's interacting badly with. I couldn't
> revert this cleanly without reverting a handful of other commits, but
> doing so also results in working audio with 6.1.8 while leaving in
> f2bd1c5ae2cb.
> (e9441675edc1, 1cda83e42bf6, 37882100cd06, 0e213813df02, fb5987844808
> were the others removed)
> 
> Hopefully that helps narrow it down for someone more familiar,
> otherwise I'll keep digging.
> 
> 
> On Sat, Jan 28, 2023 at 7:23 PM Jason Montleon <jmontleo@redhat.com> wrote:
>>
>> I have confirmed 6.2-rc5 is also broken and removing the same commit
>> causes it to work again.
>>
>> Thank you,
>> Jason Montleon
>>
>> On Sat, Jan 28, 2023 at 12:52 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>>>
>>> On Sat, Jan 28, 2023 at 12:09:54PM -0500, Jason Montleon wrote:
>>>> I did a bisect which implicated
>>>> f2bd1c5ae2cb0cf9525c9bffc0038c12dd7e1338 as the first bad commit.
>>>>
>>>> Reverting this commit on 6.1.8 gives me working sound again.
>>>>
>>>> I'm not clear why this is breaking 6.1.x since it appears to be in
>>>> 6.0.18 (7494e2e6c55e), which was the last working package in Fedora
>>>> for the 6.0 line. Maybe something else didn't make it into 6.1?
>>>>
>>>>
>>>
>>> So this is also broken in Linus's tree (6.2-rc5?)
>>>
>>> thanks,
>>>
>>> greg k-h
>>>
>>
>>
>> --
>> Jason Montleon        | email: jmontleo@redhat.com
>> Red Hat, Inc.         | gpg key: 0x069E3022
>> Cell: 508-496-0663    | irc: jmontleo / jmontleon
> 
> 
> 
> --
> Jason Montleon        | email: jmontleo@redhat.com
> Red Hat, Inc.         | gpg key: 0x069E3022
> Cell: 508-496-0663    | irc: jmontleo / jmontleon
> 
> 
> 
