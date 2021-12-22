Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0322CA0
	for <regressions@lists.linux.dev>; Wed, 22 Dec 2021 08:37:58 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mzx8G-0002TL-An; Wed, 22 Dec 2021 09:37:56 +0100
Message-ID: <3de36d9f-0579-f442-2bb2-b4b21ee990a2@leemhuis.info>
Date: Wed, 22 Dec 2021 09:37:55 +0100
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
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <YcLGlrW06oddk9SE@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1640162278;5dc1081b;
X-HE-SMSGID: 1mzx8G-0002TL-An

On 22.12.21 07:32, Greg KH wrote:
> On Tue, Dec 21, 2021 at 07:06:30PM +0100, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> For the record:
>>
>> #regzbot fixed-by: 3f345e907a8e7c56fdebf7231cd67afc85d02aaa
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=3f345e907a8e7c56fdebf7231cd67afc85d02aaa
>>
>> Greg helpfully added a "Link:" tag to make regzbot happy, but he
>> specified a reply to the report and not the report itself, as expected
>> by regzbot (I'm taken back and forth for a while already if that's a
>> good or bad idea). And that was not Greg's but my fault, as I had given
>> him the wrong link here:
>> https://lore.kernel.org/r/YcH2w9jmGnqUMWp4@kroah.com/
> 
> Sorry about that, I tried!  :(

Many thx. And as mentioned: it was my fault :-/

> Keep up the great work,

Will do, thx for saying this, there are sometimes tough days where
things like this help. :-D

> we'll get the workflow down yet.

FWIW, regzbot in a few cases already completely worked as intended to.
But yeah, things like this always take a while to get settled.

My biggest problem is: many developers don't place the Link: tags. I
obviously expected that up to a point. But what I didn't expect: so much
opposition to place them, because quite a few developers think they are
reserved for maintainers, as they are only meant for linking to the
submission of the applied patch; a few also think others tags should be
needed for linking to bugs.

My proposed "introduce the commit message tags 'Reported:' and
'Posted:'" patch likely would have helped here, but didn't get any
traction :-/
https://lore.kernel.org/lkml/c6724c7fb534a46e095e6aef13d996ed9589e578.1639042966.git.linux@leemhuis.info/

Maybe that was partly due to the stupid mixup in the subject of the
cover letter, but whatever. So I guess I'll drop the bold idea. I
consider proposing to create "Reported: <url>" while leaving ambiguous
Link: alone, which will help my case. Note sure if I also should propose
to drop "Reported-by" at the same time, which makes things easier for
developers, as that tag can only be set after asking the reporter.

Ciao, Thorsten
