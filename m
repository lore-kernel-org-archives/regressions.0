Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F323023B5
	for <regressions@lists.linux.dev>; Mon,  4 Jul 2022 09:32:05 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o8IR1-00065d-Ll; Mon, 04 Jul 2022 11:32:03 +0200
Message-ID: <b839da7c-9377-23b6-948c-371e079d978d@leemhuis.info>
Date: Mon, 4 Jul 2022 11:32:02 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Boot stall regression from "printk for 5.19" merge #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: linux-kernel@vger.kernel.org
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220619204949.50d9154d@thinkpad>
 <4457efae-2c74-4251-f0db-88cfc833b591@leemhuis.info>
In-Reply-To: <4457efae-2c74-4251-f0db-88cfc833b591@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1656927126;70b6140e;
X-HE-SMSGID: 1o8IR1-00065d-Ll

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 21.06.22 11:39, Thorsten Leemhuis wrote:
> [TLDR: I'm adding this regression report to the list of tracked
> regressions; all text from me you find below is based on a few templates
> paragraphs you might have encountered already already in similar form.]
> 
> Hi, this is your Linux kernel regression tracker.
> 
> On 19.06.22 20:49, Marek Behún wrote:
>> Hello Linus, Petr, John,
>>
>> the series
>> https://lore.kernel.org/linux-kernel/YouKQw72H7y9EJQK@alley/
>> merged by commit 537e62c865dc ("Merge tag 'printk-for-5.19' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux")
>>
>> and in particular the commit 09c5ba0aa2fc ("printk: add kthread console
>> printers")
>>
>> causes a regression on arm64 (Marvell CN9130-CRB board) where the
>> system boot freezes in most cases (and is unusable until restarted by
>> watchdog), or, in some cases boots, but the console output gets mangled
>> for a while (the serial console spits garbage characters).
> [...]
> #regzbot ^introduced v5.18..v5.19-rc3

#regzbot fixed-by: 07a22b61946f0b80065b
