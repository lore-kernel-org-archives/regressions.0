Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDAC46B2
	for <regressions@lists.linux.dev>; Sun, 13 Nov 2022 17:38:36 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ouGwE-000801-GB; Sun, 13 Nov 2022 18:38:34 +0100
Message-ID: <0d7b7d44-e2b9-9ea8-86b2-cf0f4b53eedd@leemhuis.info>
Date: Sun, 13 Nov 2022 18:38:34 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
 #forregzbot
Content-Language: en-US, de-DE
To: linux-usb@vger.kernel.org
Cc: regressions@lists.linux.dev, Peter Rosin <peda@axentia.se>
References: <fd0f2d56-495e-6fdd-d1e8-ff40b558101e@axentia.se>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <fd0f2d56-495e-6fdd-d1e8-ff40b558101e@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1668361116;2d5fab26;
X-HE-SMSGID: 1ouGwE-000801-GB

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

[reduced set or recipients, as this is only for regzbot]

On 13.11.22 17:59, Peter Rosin wrote:
> On Sat, Jul 30, 2022 at 08:05:00PM +0200, Marek Vasut wrote:
>> The TI TUSB320 seems like a better fit for USB TYPE-C subsystem,
>> which can expose details collected by the TUSB320 in a far more
>> precise way than extcon. Since there are existing users in the
>> kernel and in DT which depend on the extcon interface, keep it
>> for now.
>>
>> Add TYPE-C interface and expose the supported supply current,
>> direction and connector polarity via the TYPE-C interface.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Hi!
> 
> I'm very sad to report that this patch has caused a severe
> regression for our devices. They can no longer be powered by simply
> sticking a USB cable into their USB ports (they keep resetting
> when the tusb320 driver probes), and they reset (and keep resetting)
> if a USB cable is connected while the device is powered by other
> means.
> 
> We have no connector node nor any typec-power-opmode property
> in the device tree, so the mere touching of the new registers
> happening in this patch is enough to cause the resets.
> 
> The devices were fine before this patch, and reverting on top
> of a recent linus master (4bbf3422df78, from 11/11) makes the
> problem go away.
> 
> Any suggestions?
> 
> Cheers,
> Peter
> 
> regzbot: introduced bf7571c00dca

Peter, many thx for getting regzbot in the loop, there was a small typo,
let me take care of that:

#regzbot ^introduced bf7571c00dca
#regzbot title usb: devices are not powered anymore and sometimes reset

Ciao, Thorsten
