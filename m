Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7C21FA7;
	Fri, 30 Sep 2022 09:35:20 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oeCQO-0004tH-VO; Fri, 30 Sep 2022 11:35:17 +0200
Message-ID: <a86adc6d-05db-ec2e-c5de-d280aad9fb8a@leemhuis.info>
Date: Fri, 30 Sep 2022 11:35:16 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US, de-DE
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Slade Watkins <srw@sladewatkins.net>
Cc: "Artem S. Tashkinov" <aros@gmx.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
 <20220929135325.4riz4ijva2vc7q5p@meerkat.local>
 <95c3384b-53d0-fd6c-6ec5-a7e03fdeddfc@gmx.com>
 <F300ED64-5E8E-4060-89DC-C98BC5FF08E6@sladewatkins.net>
 <YzXK6Px+BrNuuMZH@pendragon.ideasonboard.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
In-Reply-To: <YzXK6Px+BrNuuMZH@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1664530520;076a176e;
X-HE-SMSGID: 1oeCQO-0004tH-VO

On 29.09.22 18:42, Laurent Pinchart wrote:
> On Thu, Sep 29, 2022 at 10:54:17AM -0400, Slade Watkins wrote:
>>> On Sep 29, 2022, at 10:22 AM, Artem S. Tashkinov <aros@gmx.com> wrote:
>>>
>>> I've mentioned several times already that mailing lists are _even worse_
>>> in terms of reporting issues. Developers get emails and simply ignore
>>> them (for a multitude of reasons).
>>
>> It’s 100% true that emails get _buried_ as waves of them come in (LKML
>> itself gets hundreds upon hundreds a day, as I’m sure all of you know)
>> and it just isn’t something I personally see as viable, especially for
>> issues that may or may not be high priority.
> 
> E-mails are not that bad to report issues, but they can't provide the
> core feature that any bug tracker oughts to have: tracking. There's no
> way, with the tools we have at the moment (including public-inbox, b4
> and lei), to track the status of bug reports and fixes.

Well, I'd disagree partially with that, as my regression tracking bot
"regzbot"
(https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
; https://linux-regtracking.leemhuis.info/regzbot/mainline/) does
exactly does that: tracking, by connect the dots (e.g. monitoring
replies to a report as well recording when patches are posted or
committed that link to the report using Link: tags), while making sure
nothing important is forgotten. But sure, it's still very rough and
definitely not a full bug-tracker (my goal is/was to not create yet
another one) and needs quite a bit of hand holding from my side. And I
only use it for regressions and not for bugs (on purpose).

Ciao, Thorsten
