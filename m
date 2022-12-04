Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F8F2560
	for <regressions@lists.linux.dev>; Sun,  4 Dec 2022 09:37:53 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p1lRP-0005zX-FS; Sun, 04 Dec 2022 10:37:43 +0100
Message-ID: <0611323c-2088-e6f3-1c38-7cf742dfb60d@leemhuis.info>
Date: Sun, 4 Dec 2022 10:37:42 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [regression] Bug 216753 - 6e 6 ghz bands are disabled since 5.16
 on intel ax211
Content-Language: en-US, de-DE
To: mbizon@freebox.fr, Dave Chiluk <chiluk@ubuntu.com>,
 Marcel Holtmann <marcel@holtmann.org>
Cc: "Coelho, Luciano" <luciano.coelho@intel.com>,
 "Greenman, Gregory" <gregory.greenman@intel.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <14722778-dda0-cb9f-8647-892493d94a5c@leemhuis.info>
 <2026016246ef719605c9932feeb56b105833593b.camel@intel.com>
 <CAMfi-DRE-u5TNu2zAL-7A-ENHM9EiJeYJ38BL_FMdk6QmW7c9w@mail.gmail.com>
 <9a03c244-adff-afaf-7385-d8e89cd3f338@leemhuis.info>
 <02F8DDF1-EC0D-4EBD-88F5-7E000841C337@holtmann.org>
 <CAMfi-DQfuro4c_VUrFHBTv8sPnwuV8XhTV_W7qswGeCC2t-wzg@mail.gmail.com>
 <19ea39c87df3c54cbc487466f806bc157d0bf563.camel@freebox.fr>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <19ea39c87df3c54cbc487466f806bc157d0bf563.camel@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1670146673;1f414052;
X-HE-SMSGID: 1p1lRP-0005zX-FS

On 02.12.22 18:42, Maxime Bizon wrote:
> On Fri, 2022-12-02 at 11:18 -0600, Dave Chiluk wrote:
> 
>> The 6ghz band becomes disabled as soon as I upgrade to the 5.16+
>> linux-stable kernels. So from a user perspective this really is a
>> case of a kernel upgrade breaking user-space.  This is what led me
>> down this rabbit hole here.
>  
> FWIW
> 
> I have the same issue on a Lenovo T14 gen2 laptop with built-in ax210
> card, and sold as Wifi-6E compliant.
> 
> The exact patch you mention causes the issue, so it seems my bios does
> not return the correct values either.

That makes me (as a outsider that has no real knowledge about the inner
workings of the Linux Wifi subsystem) wonder: Does it work in Windows?
Because if that's the case I wonder how Windows ensures everything
confirms to regulatory requirements & standards. If that handled on the
software level if the info is missing in the firmware? Or is there a
another place in the firmware structures where Windows looks for details
(and we don't).

Or is that a Linux-only machine that might even use a different firmware?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
