Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37558816
	for <regressions@lists.linux.dev>; Sat,  6 May 2023 06:47:41 +0000 (UTC)
Received: from [185.238.219.2] (helo=[192.168.44.27]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pvBhh-0001It-5W; Sat, 06 May 2023 08:47:37 +0200
Message-ID: <5df240d4-03f1-31cd-03e1-a6cfddd5cc1d@leemhuis.info>
Date: Sat, 6 May 2023 08:47:35 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, de-DE
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Limonciello, Mario" <mlimonci@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Chuanhong Guo <gch981213@gmail.com>, linux-input@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <01ea5c8e-ed2f-7568-f6ed-896329e7b673@leemhuis.info>
 <68d017d9-d815-01d4-23c1-49c0aaf5f20b@amd.com> <ZFKvVKMesT+3NthN@google.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [regression] Bug 217394 - IRQ override skipping breaks the Aya
 Neo Air Plus 6800U keyboard buttons
In-Reply-To: <ZFKvVKMesT+3NthN@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1683355661;746852ba;
X-HE-SMSGID: 1pvBhh-0001It-5W

On 03.05.23 21:00, Dmitry Torokhov wrote:
> On Wed, May 03, 2023 at 11:11:33AM -0500, Limonciello, Mario wrote:
>> On 5/3/2023 7:58 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>
>>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>>> kernel developers don't keep an eye on it, I decided to forward it by mail.
>>>
>>> Chuanhong Guo, apparently it's cause by a change of yours.

BTW, there is another report caused by the change:
https://bugzilla.kernel.org/show_bug.cgi?id=217406

```
I have an HP Pavilion Aero 13 laptop that comes with an AMD Ryzen 7735U
CPU and an up-to-date BIOS. Using any kernel version that is strictly
greater than 5.19.9 on it is causing the typing with the integrated
keyboard to be extremely slow. "Slow" is subjective but let's say [...]"
```

/me wonders how many machines out there show problems we never hear about

Anyway:

>>> Note, you have to use bugzilla to reach the reporter, as I sadly[1] can
>>> not CCed them in mails like this.
>>>
>>> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217394 :
>>>
>>>>   Matthew 2023-05-03 02:28:33 UTC
>>>>
>>>> Reverting the changes found in this patch fixes the issue:
>>>>> https://lore.kernel.org/all/20220712020058.90374-1-gch981213@gmail.com/
>>>> With that patch the AT Translated Set 2 Keyboard doesn't show up with the evtest and is not usable.
>>>>
>>>> Hardware:
>>>>
>>>> Aya Neo Air Plus
>>>> AMD Ryzen 7 6800U
>>> See the ticket for more details.
>>>
>>> BTW: there apparently is another IRQ override needed for a different
>>> machine. See https://bugzilla.kernel.org/show_bug.cgi?id=216804#c8 for
>>> details (ignore the comments before that, the quirk entry for that
>>> machine was merged; comment 8 and all related to it really should have a
>>> separate bug; that's also why this partly fall through the cracks here
>>> :-/ ). The user is currently trying to create a patch.
>>>
>> Something I'm wondering about is if it's possible for i8042 to detect the
>> polarity is incorrect when it probes and
>> to try to correct it.
>>
>> If we could do that we can probably drop 9946e39fe8d0 ("ACPI: resource: skip
>> IRQ override on AMD Zen platforms")
>> to fix this issue along with all the other quirks that have collected over
>> time on i8042 polarity issues.
> 
> 8042 is shared between multiple platforms and is quite fragile as it is.
> If there are issues in AMD firmware and you know the polarity that is
> needed for 8042 on these platforms you should add a proper fixup for
> override. Maybe you should only skip override for IRQ 1?

Stupid question from the peanut gallery: does anyone know what Windows
is doing on those machines? I wonder if this is one of those situation
where we just must follow suite to make things work reliably long term
for users, even if that might mean 8042 needs to be modified.

Or is the problem likely to go away with new hardware?

Ciao, Thorsten

P.S.: BTW:

#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=217406
