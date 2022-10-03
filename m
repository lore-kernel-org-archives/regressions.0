Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1D817C1;
	Mon,  3 Oct 2022 10:10:12 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ofIOo-0000U1-7o; Mon, 03 Oct 2022 12:10:10 +0200
Message-ID: <63a8403d-b937-f870-3a9e-f92232d5306c@leemhuis.info>
Date: Mon, 3 Oct 2022 12:10:09 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Artem S. Tashkinov" <aros@gmx.com>, workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
In-Reply-To: <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1664791813;2542fa30;
X-HE-SMSGID: 1ofIOo-0000U1-7o

On 29.09.22 13:33, Thorsten Leemhuis wrote:
> On 29.09.22 13:19, Thorsten Leemhuis wrote:
>>
>> TLDR: Core Linux kernel developers are unhappy with the state of
>> bugzilla.kernel.org; to improve things I plan to change a few important
>> aspects of its configuration, unless somebody comes up with better ideas
>> to tackle current problems: (1) Create a catch-all product making it
>> totally obvious to submitters that likely nobody will look into the
>> ticket. (2) Remove or hide all products & components where the subsystem
>> didn't fully commit to look into newly submitted reports. (3) Change the
>> text on the front page to make it clear that most kernel bug reports
>> need to be sent by mail.

Well, there are lots of interesting things discussed in this thread for
a time when a bugzilla replacement needs to be found. But one thing
afaics is pretty clear for the time being: we as the kernel development
community are not going to double down on bugzilla now.

Thing is: bugzilla.kernel.org is there and will be for a while, as it
provides services that some developers rely on. And it has some
problems, as widely known and outlined in my mail. Reducing those for
now by performing a few small changes (aka applying some band-aids here
and there) as outlined above IMHO is worth it to reduce the pain. There
was no opposition to that plan from Konstantin or core Linux kernel
developers afaics (please correct me if I'm wrong), so I'll likely start
working on realizing it later this week, unless I get "no, please
don't/please wait" from those people.

Ciao, Thorsten
