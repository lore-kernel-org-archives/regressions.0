Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8452CA0
	for <regressions@lists.linux.dev>; Wed, 22 Dec 2021 09:40:02 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mzy6K-000790-1o; Wed, 22 Dec 2021 10:40:00 +0100
Message-ID: <bb72fdbd-1b89-cf1b-32f3-97d9fea4e7a3@leemhuis.info>
Date: Wed, 22 Dec 2021 10:39:59 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [Bug 215117] New: ucsi_acpi: kernel NULL pointer dereference
 #forregzbot
Content-Language: en-BW
To: Greg KH <greg@kroah.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <bug-215117-208809@https.bugzilla.kernel.org/>
 <eb34f98f-00ef-3238-2daa-80481116035d@leemhuis.info>
 <f74c422e-776a-46c5-4508-a7d15bb93c61@leemhuis.info>
 <YcLGlrW06oddk9SE@kroah.com>
 <3de36d9f-0579-f442-2bb2-b4b21ee990a2@leemhuis.info>
 <YcLpo5gKp4uPcVQL@kroah.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <YcLpo5gKp4uPcVQL@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1640166002;eb8a9292;
X-HE-SMSGID: 1mzy6K-000790-1o

On 22.12.21 10:02, Greg KH wrote:
> On Wed, Dec 22, 2021 at 09:37:55AM +0100, Thorsten Leemhuis wrote:
>> My biggest problem is: many developers don't place the Link: tags. I
>> obviously expected that up to a point. But what I didn't expect: so much
>> opposition to place them, because quite a few developers think they are
>> reserved for maintainers, as they are only meant for linking to the
>> submission of the applied patch; a few also think others tags should be
>> needed for linking to bugs.
> 
> Hah, I can't even get developers to add a Fixes: or a Cc: stable tag,
> trying to get them to add a Link: tag to a lore reference is going to be
> an uphill battle.

Yeah, that was expected, but I didn't expect how often I had to explain
"yes, this is how the Link: tag is used, too, just check the docs"... :-D

> Right now, the best thing we have is the git hook that auto-adds the
> Link: tag that points to the lore thread where the patch came from.
> Maintainers don't have the energy or time to add anything other than
> that, so I think you just might have to rely on Fixes: for a while.

Yeah, guess you are right.

>> My proposed "introduce the commit message tags 'Reported:' and
>> 'Posted:'" patch likely would have helped here, but didn't get any
>> traction :-/
>> https://lore.kernel.org/lkml/c6724c7fb534a46e095e6aef13d996ed9589e578.1639042966.git.linux@leemhuis.info/
>>
>> Maybe that was partly due to the stupid mixup in the subject of the
>> cover letter, but whatever. So I guess I'll drop the bold idea. I
>> consider proposing to create "Reported: <url>" while leaving ambiguous
>> Link: alone, which will help my case. Note sure if I also should propose
>> to drop "Reported-by" at the same time, which makes things easier for
>> developers, as that tag can only be set after asking the reporter.
> 
> Nah, I add "Reported-by:" all the time without asking for explicit
> permission, relying on the public email instead.

It was also news to me that an explicit permission is needed, but
Documentation/process/5.Posting.rst states so: ``Be careful in the
addition of tags to your patches: only Cc: is appropriate for addition
without the explicit permission of the person named.```

>  If there was some way
> to automate the Reported: tag, maybe it could be used, but again, that's
> a lot of manual work to do, which is going to be a hard sell.

Yeah :-/

Ciao, Thorsten
