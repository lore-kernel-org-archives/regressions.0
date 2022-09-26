Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24CB366
	for <regressions@lists.linux.dev>; Mon, 26 Sep 2022 04:41:00 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ocfvL-00013U-Ev; Mon, 26 Sep 2022 06:40:55 +0200
Message-ID: <10c29d1e-4048-acb8-891e-dcd5103ab355@leemhuis.info>
Date: Mon, 26 Sep 2022 06:40:55 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: v6.0-rc6 - arm64 / rock960 : kernel panic #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
References: <4f398e4c-973b-7843-2f75-27324d109277@linaro.org>
 <646ff571-81b1-346d-97ba-3e85e6805af1@leemhuis.info>
In-Reply-To: <646ff571-81b1-346d-97ba-3e85e6805af1@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1664167261;e9b727ab;
X-HE-SMSGID: 1ocfvL-00013U-Ev

On 25.09.22 09:21, Thorsten Leemhuis wrote:
> TWIMC: this mail is primarily send for documentation purposes and for
> regzbot, my Linux kernel regression tracking bot. These mails usually
> contain '#forregzbot' in the subject, to make them easy to spot and filter.
> 
> [TLDR: I'm adding this regression report to the list of tracked
> regressions; all text from me you find below is based on a few templates
> paragraphs you might have encountered already already in similar form.]
> 
> Hi, this is your Linux kernel regression tracker.
> 
> On 24.09.22 19:43, Daniel Lezcano wrote:
>> Hi,
>>
>> there is a kernel panic on a rock960 board:
>>
>> After git bisecting, I have:
>>
>> commit 14facbc1871ae15404666747b5319c08e04b875a
>> Merge: f5c97da8037b 32346491ddf2
>> Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Date:   Mon Jul 11 08:32:58 2022 +0200
>>
>>     Merge 5.19-rc6 into char-misc-next
>>
>>     We need the misc driver fixes in here as well.
>>
>>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>> Any clue?
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 14facbc1871ae154046

Per
https://lore.kernel.org/all/CAMdYzYrqVSNmOASDUXK0MaJVy56gmRkHweb9Bs7J76O4HZn2NQ@mail.gmail.com/
and its parent:

#regzbot introduced: 8dc60f8da22fdb
#regzbot fixed-by: f340ed8664a55a4

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
