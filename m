Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9E14419
	for <regressions@lists.linux.dev>; Tue,  4 Oct 2022 20:06:38 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ofoBR-0003Wn-EX; Tue, 04 Oct 2022 22:06:29 +0200
Message-ID: <c74d9d75-4428-e22d-1adb-334b1173d871@leemhuis.info>
Date: Tue, 4 Oct 2022 22:06:28 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US, de-DE
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Artem S. Tashkinov" <aros@gmx.com>,
 ksummit <ksummit-discuss@lists.linuxfoundation.org>,
 workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
In-Reply-To: <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1664913998;7bfb63fc;
X-HE-SMSGID: 1ofoBR-0003Wn-EX

On 04.10.22 19:53, Konstantin Ryabitsev wrote:
> On Thu, Sep 29, 2022 at 01:19:24PM +0200, Thorsten Leemhuis wrote:
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
> 
> Here's my counter-plan, which builds on top of yours. 

Thx for working that out, much appreciated. You already mentioned the
hardest thing and others already raised a few few aspects that sprung to
my mind. That for now leaves one big question in my head:

Your plan would afaics mean that we invest further into a software
abandoned by its upstream and already becoming more and more of a
maintenance burden. That investment would also further increase our
dependency on that software by establishing workflows that rely on it.
Is that really wise at this point? Wouldn't it be better to spend that
time and effort to build something better that is more future proof?

Ciao, Thorsten

