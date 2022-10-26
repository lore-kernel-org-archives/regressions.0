Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9769D1C36
	for <regressions@lists.linux.dev>; Wed, 26 Oct 2022 18:16:03 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1onkwb-0002PH-KQ; Wed, 26 Oct 2022 20:16:01 +0200
Message-ID: <2be74e19-9727-88de-54df-e6c6b0c364c2@leemhuis.info>
Date: Wed, 26 Oct 2022 20:16:00 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Regression: Re: [PATCH v2 4/6] PCI: Distribute available
 resources for root buses too #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: regressions@lists.linux.dev
References: <20220905080232.36087-1-mika.westerberg@linux.intel.com>
 <20220905080232.36087-5-mika.westerberg@linux.intel.com>
 <20221014124553.0000696f@huawei.com>
 <6a6bcca6-f0fd-f46a-f573-d1c182c1476b@leemhuis.info>
In-Reply-To: <6a6bcca6-f0fd-f46a-f573-d1c182c1476b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1666808163;b7eefa55;
X-HE-SMSGID: 1onkwb-0002PH-KQ

On 26.10.22 10:49, Thorsten Leemhuis wrote:
> [Note: this mail is primarily send for documentation purposes and/or for
> regzbot, my Linux kernel regression tracking bot. That's why I removed
> most or all folks from the list of recipients, but left any that looked
> like a mailing lists. These mails usually contain '#forregzbot' in the
> subject, to make them easy to spot and filter out.]
> 
> [TLDR: I'm adding this regression report to the list of tracked
> regressions; all text from me you find below is based on a few templates
> paragraphs you might have encountered already already in similar form.]
> 
> Hi, this is your Linux kernel regression tracker. Thanks for the report.
> To be sure below issue doesn't fall through the cracks unnoticed, I'm
> adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced
> #regzbot title
> #regzbot ignore-activity

#regzbot invalid: I'm too stupid to use my own bot (Thorsten)
