Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613342569;
	Sat,  1 Oct 2022 10:57:31 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oeaBV-0002SU-6q; Sat, 01 Oct 2022 12:57:29 +0200
Message-ID: <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
Date: Sat, 1 Oct 2022 12:57:28 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US, de-DE
To: "Artem S. Tashkinov" <aros@gmx.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com> <YzgY9X/DM9t/ZuJe@kroah.com>
 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
In-Reply-To: <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1664621851;fb09945b;
X-HE-SMSGID: 1oeaBV-0002SU-6q

On 01.10.22 12:47, Artem S. Tashkinov wrote:
> On 10/1/22 10:39, Greg KH wrote:
>> On Sat, Oct 01, 2022 at 10:30:22AM +0000, Artem S. Tashkinov wrote:

>>> I have a 20+ years experience in IT and some kernel issues are just
>>> baffling in terms of trying to understand what to do about them.
>>>
>>> Here's an example: https://bugzilla.kernel.org/show_bug.cgi?id=216274
>>>
>>> What should I do about that? Who's responsible for this? Who should I
>>> CC?
>>
>> Input subsystem.
> 
> It's great you've replied immediately, what about hundreds or even
> thousands of other bug reports where people have no clue who has to be
> CC'ed?

Quoting from https://docs.kernel.org/admin-guide/reporting-issues.html:

"[...] try your best guess which kernel part might be causing the issue.
Check the MAINTAINERS file [...] In case tricks like these don’t bring
you any further, try to search the internet on how to narrow down the
driver or subsystem in question. And if you are unsure which it is: just
try your best guess, somebody will help you if you guessed poorly. [...]"

HTH, Ciao, Thorsten
