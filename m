Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BE223A4
	for <regressions@lists.linux.dev>; Wed, 21 Dec 2022 11:30:10 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p7xIV-0003rv-UI; Wed, 21 Dec 2022 12:30:07 +0100
Message-ID: <d6c68083-25e3-3ff5-9b0d-8928d1e077f1@leemhuis.info>
Date: Wed, 21 Dec 2022 12:30:07 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PULL] Networking for next-6.1 #forregzbot
Content-Language: en-US, de-DE
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221004052000.2645894-1-kuba@kernel.org>
 <6b971a4e-c7d8-411e-1f92-fda29b5b2fb9@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <6b971a4e-c7d8-411e-1f92-fda29b5b2fb9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671622210;e8ddaa4c;
X-HE-SMSGID: 1p7xIV-0003rv-UI

[Note: this mail contains only information for Linux kernel regression
tracking. Mails like these contain '#forregzbot' in the subject to make
then easy to spot and filter out. The author also tried to remove most
or all individuals from the list of recipients to spare them the hassle.]

On 16.12.22 11:49, Jiri Slaby wrote:
> 
> On 04. 10. 22, 7:20, Jakub Kicinski wrote:
>> Joanne Koong (7):
> 
>>        net: Add a bhash2 table hashed by port and address
> 
> This makes regression tests of python-ephemeral-port-reserve to fail.

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced 28044fc1d495
#regzbot title new: regression tests of python-ephemeral-port-reserve fail
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
