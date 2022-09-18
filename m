Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C531375
	for <regressions@lists.linux.dev>; Sun, 18 Sep 2022 16:24:50 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oZx68-0000Ja-Aw; Sun, 18 Sep 2022 18:24:48 +0200
Message-ID: <b6aeaf85-c88f-c526-30c8-e040b99c66ea@leemhuis.info>
Date: Sun, 18 Sep 2022 18:24:47 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [Regression] Bug 216371 - acpi wake up with black screen with msg
 "amd_gpio AMDI0030:00: failed to get iomux index" #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <849a07ba-a53c-3f10-e2ec-25421c1e40ee@leemhuis.info>
In-Reply-To: <849a07ba-a53c-3f10-e2ec-25421c1e40ee@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1663518290;daef1314;
X-HE-SMSGID: 1oZx68-0000Ja-Aw

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 25.08.22 11:42, Thorsten Leemhuis wrote:

> To quote from https://bugzilla.kernel.org/show_bug.cgi?id=216371 :
> 
>>  neoe 2022-08-17 01:50:41 UTC
>>
>> just upgrade from 5.18 to 6.0.0-rc1
>>
>> `acpitool -s` 
>> to set to sleep, it seems a little slow.
>>
>> then wake up, black screen,
>>
>> everything works fine before.
>>
>> AMD 3900X
>>
>> [reply] [−] Comment 1 neoe 2022-08-22 02:39:12 UTC
>>
>> dmesg
>>
>> amd_gpio AMDI0030:00: failed to get iomux index
> See the ticket for details.

#regzbot backburner: likely bad bisect and reporter apparently ignoring
the issue for now
