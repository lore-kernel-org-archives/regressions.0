Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8689EC5
	for <regressions@lists.linux.dev>; Sun, 10 Apr 2022 07:59:29 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ndSTn-000399-G8; Sun, 10 Apr 2022 09:59:27 +0200
Message-ID: <be67a3cf-44a2-7ea2-c0c3-29829b029e1b@leemhuis.info>
Date: Sun, 10 Apr 2022 09:59:27 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Bug 215725] New: Basilisk X Hyperspeed Bluetooth LE mouse fail
 to connect under 5.17 with Opcode 0x2043 failure #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <bug-215725-62941@https.bugzilla.kernel.org/>
 <b6d3a868-d29f-224b-dcaf-7143fd8ce99a@leemhuis.info>
In-Reply-To: <b6d3a868-d29f-224b-dcaf-7143fd8ce99a@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1649577569;08682d34;
X-HE-SMSGID: 1ndSTn-000399-G8

On 09.04.22 13:00, Thorsten Leemhuis wrote:
> TWIMC: this mail is primarily send for documentation purposes and for
> regzbot, my Linux kernel regression tracking bot. These mails usually
> contain '#forregzbot' in the subject, to make them easy to spot and filter.
> 
> About a week ago a regression was reported to bugzilla.kernel.org that
> seems to be handled there already, nevertheless I'd like to add to the
> tracking to ensure it's not forgotten.
> 
> #regzbot introduced: v5.16..v5.17
> #regzbot from: Winston Wu <winstonwu91@gmail.com>
> #regzbot title: net: bluetooth: Basilisk X Hyperspeed Bluetooth LE mouse
> fail to connect under 5.17 with Opcode 0x2043 failure
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215725

#regzbot monitor:
https://lore.kernel.org/all/bug-215725-62941@https.bugzilla.kernel.org%2F/
#regzbot ignore-activity
