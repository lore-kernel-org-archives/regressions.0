Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991957C
	for <regressions@lists.linux.dev>; Wed, 21 Sep 2022 10:03:38 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oawZs-0007eK-Bn; Wed, 21 Sep 2022 12:03:36 +0200
Message-ID: <d6dd7b47-2c32-2de2-7282-0112ab73dc15@leemhuis.info>
Date: Wed, 21 Sep 2022 12:03:36 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: "nvme nvmeX: IO queues not created" with "Amazon.com, Inc. NVMe
 SSD Controller" from 5.19.y (issue bisected) #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-nvme@lists.infradead.org
References: <CAK8fFZ5vajOJGSwA53tU=Y2-jf0rnJWOjkadgqRCTf38bF0YXw@mail.gmail.com>
 <7883f05d-9ed8-2be3-3f9f-4f814aefe55a@leemhuis.info>
In-Reply-To: <7883f05d-9ed8-2be3-3f9f-4f814aefe55a@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1663754618;33b22517;
X-HE-SMSGID: 1oawZs-0007eK-Bn

On 08.09.22 12:41, Thorsten Leemhuis wrote:
> TWIMC: this mail is primarily send for documentation purposes and for
> regzbot, my Linux kernel regression tracking bot. These mails usually
> contain '#forregzbot' in the subject, to make them easy to spot and filter.
> 
> On 07.09.22 08:05, Jaroslav Pulchart wrote:
>> Hello,
>>
>> I would like to report a regression issue in 5.19.y in NVMe driver.
>>
>> The issue is reproducible at AWS EC2 instances with local NVMe storage
>> like "r5d.*". Kernel report "IO queues not created":
>> [    2.936641] nvme nvme0: 2/0/0 default/read/poll queues  <- EBS volume
>> [    2.939493] nvme nvme1: 2/0/0 default/read/poll queues  <- EBS volume
>> [    2.940797] nvme nvme2: IO queues not created              <- Local volume
>> with 5.19.y (kernel 5.19) and the nvme storage cannot be used.
>>
>> I bisected the issue to commit
>> "aa41d2fe60ee2e4452b0f9ca9f0f6d80a4ff9f9d" (nvme: set controller
>> enable bit in a separate write). Reverting it makes the nvme device
>> working again:
>> [    3.025599] nvme nvme0: 2/0/0 default/read/poll queues
>> [    3.032467] nvme nvme2: 8/0/0 default/read/poll queues
>> [    3.040040] nvme nvme1: 2/0/0 default/read/poll queues
> 
> #regzbot ^introduced aa41d2fe60ee2e4
> #regzbot title block: nvme: AWS EC2 instances with local NVMe storage fail
> #regzbot ignore-activity

#regzbot invalid: will be fixed by a rollout of a new firmware, for
details see the answers to this mail:
https://lore.kernel.org/linux-nvme/18e67378-1365-5e36-981b-13cada73bcda@leemhuis.info/
