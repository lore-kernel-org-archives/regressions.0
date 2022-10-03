Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81A48F58;
	Mon,  3 Oct 2022 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1664782871;
	bh=gucUevQeUc5hHlWYZ1t++7IBfAQIeAFhv0oKVclAfIg=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LDtYKhZEVvsON9ElCUXdGHh4BQ3BmQOa9MqgbOwJf1VL4XpPwBcKn9xX9xusrQ9p5
	 CmdqLYMcUpL/yhFfwRgZdGx43NdWEVZkeKvq0M1XKRHWqlTAAFblpXsHaW/zcpeLYt
	 ikfmZ94Ig3DNG9B7WvgRIYuTCsBIgOJlvznLJD8o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.25.110.16] ([143.244.37.214]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MZCbB-1ok1Jv3NsP-00V9JH; Mon, 03
 Oct 2022 09:41:11 +0200
Message-ID: <b032e79a-a9e3-fc72-9ced-39411e5464c9@gmx.com>
Date: Mon, 3 Oct 2022 07:41:08 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Steven Rostedt <rostedt@goodmis.org>, Theodore Ts'o <tytso@mit.edu>,
 Thorsten Leemhuis <linux@leemhuis.info>, Greg KH
 <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev, Mario Limonciello <mario.limonciello@amd.com>
References: <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002141321.394de676@rorschach.local.home>
 <6de0925c-a98a-219e-eed2-ba898ef974f8@gmx.com>
 <20221002180844.2e91b1f1@rorschach.local.home>
 <3a3b9346-e243-e178-f8dd-f8e1eacdc6ae@gmx.com> <YzoY+dxLuCfOp0sL@ZenIV>
From: "Artem S. Tashkinov" <aros@gmx.com>
In-Reply-To: <YzoY+dxLuCfOp0sL@ZenIV>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DrgNFBxbBqk2s5Xnd5PRKt9UfYXricJ/EagAW0B9qrRTS4uYGrL
 Sy8BI4SytsvmGYtePFS3P0kMJWuczigBCyTfVCaTlYZ04ms1wp0oLvwbZqfM8jyKv7n2VRU
 8PX2fIBmOulVnDNumjjryF8/NyLnR4DUk6cqUz3kjUqlE+rINg42rKrYqDoq/YMNUl2X4wy
 ztXBa3EbIk6W+SHrE/l8w==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:GpOHzh+JbOQ=:e2fGUWLHIMAhSE8qqZeME9YO
 uam/Xr6wJAI//jIRGPtovEhyT7sxFi2gbAB6VGiCV3jpdTl5I4LMTigtJNMVCvSwEAh+pdEgK
 wZ5u6otuZ//Y3D8+tcfdR4mmw6RwWk1u+bpmAP9s+oLu3f08QtGM9NhHZFbfbRm9BhLniqoZd
 uDCtZ6Nm7zHMkadV6xDbfhIpYICGgbsC82I0YabhHUHqq+NOI8kSqNWE/HKu4loeVxTJm3/uk
 s7g3qkuF0yVCJZzagxP22RLm1uEIlzUrnG+6Mf2XT/X8YJKg7afnv/Ao2UmndFqNr9FMwaakR
 NdC5nFVuxZ1YXeIBMpBhlcnp9j2nRoEP34VJ4i07Uxwb+Egvm933RRuLY3iahO2lqCJ0ySaG4
 dp2MXFUI5u0sr8/ja/saMI4Lh/wdTF6mHannVGtGIbFDYyNdCdXnSyC393A7k5oKLk+RFZASy
 Gk6FTKh7lraBaGXi5MD307imK+SljE3qGOxXD8ZgkHziM4HTFdIA33Zp6QKodCR/UnudXy+SS
 hMxNXbG99nL6YgVXhbyKq9iEFJ35aI32TfbMrMp/sbLnNBsJ7GM4o7TnqFCyz3z+9WdGBm7Cd
 gs+zhLafsJ2qdBp6mA5S6rbP5/8X5SOyc8kms1qGo1PgsW+dS8rAUBKcznOkqb9UfAdqv7YCH
 R0WkTVZfZELgQUonSq0vUeBd6Ho41JNUf+cyj3eeDug//cW9C3cMfcOluDPFRcR8Ge71HbNiO
 qVGvrcNXb0wRS9QsP6UrUoLV1Cj/AfeF2kbOrG9d6DTXwnt97Hm8RurXpvKfVPlOABzVmUpMG
 /dt08MzoYwAQQ7sslQ8z62+nPqE0QguE7Kfm4Ocii37a9kFSe7i7IW688x+olE+eD91DOebR9
 DNeLBQRtHtZKnZg+rIOUgGWRv6bzBPrT9slxLzDVXIhxTB/i1LXm+jYbJEsWj+Zk5Q1dxkKjq
 BqIO2EY9csKkPJjX1o1RkViy5xMTJH7lVUMmSvN+VR5482qaa2xrMtCzk79AP0hxhQ+Jj6LKr
 uuPF8xntP+8WIuXJUyeEnBWc+y9+SDBfMKxnf5sgBjEA8IpmXj/GxRnuPfqFFHcWjwQbhd6m2
 qOPC26gJz7LdYoMnrsnJCUXcTH8r49jmMwSaFnqz/ASxEGd9x33S86OumdlGLh7nWwJg2GZTw
 5e0vR3fe63nPOQcQv7b2k2ink86lyN3IKnqY/azeh5t4IA==



On 10/2/22 23:04, Al Viro wrote:
> On Sun, Oct 02, 2022 at 10:20:40PM +0000, Artem S. Tashkinov wrote:
>
>> Bugzilla hasn't been updated in a very long time so it's missing both
>> mailing lists and individual kernel developers.
>>
>> AFAIK, some pieces of kernel have no appropriate mailing lists at all.
>> What about that? I've no clue.
>
> There's that file, right in the root of the source tree.  Called "MAINTA=
INERS",
> in all-caps...  Could have something to do with locating maintainers, co=
uld it not?
>
>> Opt-in will work, except I've no idea how to make it work. Mass email
>> all the kernel developers and politely invite them to sign up? Most wil=
l
>> simply ignore it.
>
> Sigh...   You really don't seem to appreciate just how deep a septic
> tank you've jumped into with your combination of "it should be opt-out"
> and "but unsubscribing takes just a minute, what are you unhappy about?!=
?"
>
> Maybe you are not using email a lot, but for just about everyone who doe=
s...
> We have heard that.  Many, many times.  From many sources - spammers,
> "legitimate" companies' marketing departments, etc.
>
> And you keep moving along the same track - the usual reaction of some
> company after having pulled back a bloody stump and enjoyed the pile of
> explanations of the reasons why opt-out is *NOT* *ACCEPTABLE*, *EVER*
> is along the lines of "OK, we'll just spam everyone in our database once
> and ask them to opt-in - that must be OK, right?"

Being on bugzilla does _not_ mean you'll receive a single email unless
someone _specifically_ CC's you.

(Except for relevant mailing lists and already specified maintainers who
are confirmed to manage certain kernel subsystems).

We've had over40 messages in this conversation and not a single person
has complained about SPAM ever coming from bugzilla.

With what I proposed that would _not_ change.

Weird to read this torrent of hatred and aggression towards purely
imaginary SPAM.

Anyways, Bugzilla is bad but it surely works. Let's have 100+ more
interchanges inventing something most users (for whom Bugzilla exists -
which people here keep forgetting all the time) will a have hard time
working with.

I repeat: Bugzilla exists for end users primarily.

Regards,
Artem
