Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB7F33E9
	for <regressions@lists.linux.dev>; Thu, 21 Jul 2022 11:29:53 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oEUNE-0000LY-6A; Thu, 21 Jul 2022 13:29:44 +0200
Message-ID: <de41c874-0f1b-e940-5c85-35fe79bc9a2a@leemhuis.info>
Date: Thu, 21 Jul 2022 13:29:43 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Regression] ACPI: video: Change how we determine if brightness
 key-presses are handled #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CALF=6jEe5G8+r1Wo0vvz4GjNQQhdkLT5p8uCHn6ZXhg4nsOWow@mail.gmail.com>
 <baf81019-89a1-dc79-c80e-fe2dd1c8ee58@leemhuis.info>
In-Reply-To: <baf81019-89a1-dc79-c80e-fe2dd1c8ee58@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1658402993;cb2d7a1b;
X-HE-SMSGID: 1oEUNE-0000LY-6A

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 13.07.22 07:54, Thorsten Leemhuis wrote:
> [CCing Hans, who authored 3a0cf7ab8d ("ACPI: video: Change how we
> determine if brightness key-presses are handled")]
> 
> On 13.07.22 07:27, Ben Greening wrote:
>> (resending because of HTML formatting)
>> Hi, I'm on Arch Linux and upgraded from kernel 5.18.9.arch1-1 to
>> 5.18.10.arch1-1. The brightness keys don't work as well as before.
>> Gnome had 20 degrees of brightness, now it's 10, and Xfce went from 10
>> to 5. Additionally, on Gnome the brightness keys are a little slow to
>> respond and there's a bit of a stutter. Don't know why Xfce doesn't
>> stutter, but halving the degrees of brightness for both makes me
>> wonder if each press is being counted twice.
>>
>> Reverting commit 3a0cf7ab8d in acpi_video.c and rebuilding
>> 5.18.10.arch1-1 fixed it.
> 
> BTW, in case someone gets slightly confused like I was here:
> 3a0cf7ab8d is a mainline commit that was backported to 5.18.y as
> 1ed81b354d8c recently.
> 
>> The laptop is a Dell Inspiron n4010 and I use "acpi_backlight=video"
>> to make the brightness keys work. Please let me know if there's any
>> hardware info you need.
>>
>> #regzbot introduced: 3a0cf7ab8d

Sorry, regzbot got confused by something, so let's mark this as resolved
manually:

#regzbot fixed-by: 5ad26161a371e4
