Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC0C17C1;
	Mon,  3 Oct 2022 07:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1664783380;
	bh=XJ3yLIRRwz1eAbA1d81tgni1urtwHc90e4KEWk3oQUY=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DAa7XT4rfj6h9vgCDbmSgVX5MeTW7tDOmqraFsr5Yu3oMmWbBc0crMuvVdUdmcMZp
	 nIl4yKkJV+PA0mP6upl8E2vvb6JSJZe+l32okasUF/JbhEfnrfYWyPgJh+QDqj33Qj
	 cYqQc1HV1ad1O4rSXLHVp40MVx/nY3nDw1JGMC9E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.25.110.16] ([143.244.37.214]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1M3DJl-1oeROY484L-003dqo; Mon, 03
 Oct 2022 09:49:40 +0200
Message-ID: <c828f525-8fdf-186a-2d18-582f534ecb61@gmx.com>
Date: Mon, 3 Oct 2022 07:49:38 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Willy Tarreau <w@1wt.eu>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Theodore Ts'o <tytso@mit.edu>, Thorsten Leemhuis <linux@leemhuis.info>,
 Greg KH <gregkh@linuxfoundation.org>, workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev, Mario Limonciello <mario.limonciello@amd.com>
References: <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
 <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002150522.ul4nbtfawqjhnsag@meerkat.local>
 <b594681b-6b8c-ffb7-f526-3da847d160a8@gmx.com>
 <20221002205430.GC22129@1wt.eu>
 <d1f99826-2a66-c2d5-c9cd-d2fadd35eca4@gmx.com>
 <20221002213235.GA22532@1wt.eu>
 <867b35b7-da2b-fed0-1f75-b2021d9be499@gmx.com>
 <CAMuHMdVkFdXiqV-k2X8yDh5VkR3cv0a4z78z+uCF_PfgHgGx=Q@mail.gmail.com>
From: "Artem S. Tashkinov" <aros@gmx.com>
In-Reply-To: <CAMuHMdVkFdXiqV-k2X8yDh5VkR3cv0a4z78z+uCF_PfgHgGx=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mWPRkpUwznFoXen54lwUDHYoG8g+JNyj2hfp3ybTKUdR+tOxStu
 G9Apot6jK42gV9UmZ9qStUhhErPzgODzzfhHCJc6n2Z1IMSHBeNL90AKd0vCNXhZZmLwsXz
 Bi1dTT8NZLbVpIQfcYKazScIdY4XADEJ8CyNRTnRcfihCaRyn4BECQgBXDJIU1l3z1ai5mM
 IWOSfokpeCpVP0qQy2yvg==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:jXndgaeEj54=:lFp3JtHHfc3F26wfGDXgRIfh
 N2vKHOv7I1wWc+MIxRjMAqkyu1CdwuPIuwfFO+kzR2IU3V9Lg/9I2+vWPBP6nlT/VffkR7ErC
 DAG/xorZ9DDx4VsACs+2gA1mHvNI8jWJYxLWJquXtdPpBmUsL91lg7LKgPfxLtd5WF1ve6upF
 nxkQOW+Jdec1G7nAN9I1kj97EFrpFc29bpQ/4+/7YTJfNfpmQLdLjCC7iZ9yNjncisCk3yxcB
 Ahzj94aqMCQNmHE/WAF1aNL8U53wMW84DhrZW2J6VtKOtebyvoS0zzfedlPDEIsZGyeaXjsw+
 +D9iLMBwmuQTeLY3UhqRSatsdI+9Is47Epm2L8YjR8v4JGQy2/KqBuCfimzMuU5+DcCBIeqpd
 s/eG3WBxzM1Nu74XiD2Fu/fT9tjbo88pUNvecGDMnA2Tccw9SP6OCRQLKkhaUouS9jS0jZkzZ
 wTEoJVLqbV/QF3VEFqTWT9d/kdudqdJz95RmtZaH5rY1p0Di0zjGo1rllbZxqw40x26Dy6pN/
 Xu7Ol/0G9coNxkse9rdPnWr5vHIiSjv80BEE0hLnUKYivSfFwhtiw8etmTEnjYuJ6b5VLs5y8
 VuS/I0C2hnB7/fqDyW0DapbibNmuzpH0vkF1r11lvWkraCWDcmuYyg1egzu6KHF7dUM6x/Z0d
 rAI6I7gvEWBvjxdO3PdNYEycJLPFU+NEkgoXEQuDF+32Ay09MmqZbwwtu/wcc7AfOlMnySYRA
 eOoXLW5hpI7+X3/IAEa4Pi/RUO/eKNs7VTm0+SYETYOgV92SRHZWZsuB5RpmFdVvD1YQtUScv
 v5CV5BE2nzvhWiS+mzGyZLLoxv7eTqdczYg103RwWGc0ofj+FH2ssbqG8989y6G0TwdzUYkq1
 B1WDnQEKvRvu7R67FEtcKTDn44IvKAlgtY8bVn6VjspvE1KoJELseqNtNfoAwIkT9qwnqLpJ8
 Y64v5+bMYwJWgC15hEDPPAPb5pCxrrNmG0P/DhPLlOQP4tmCRaIU3kBciiNL3BwcTl+tED73N
 SELuC9cZmNJvQm1U1+hBsnuYjYEpcEyTm7cBMbF1xOrQTzxfwXc1Dz+bL73w2uQtZF6u3BB5S
 DqE8pn7z4xDq0yEodW1Q6Mxos36uIogSUUtEeM+GcqhmTK41ejk+VwElTrFf/drvcSkpHWqOF
 docfPU0ybWkP72NJbKDTPQT7IXJ5jDHB3ZqegdczS4D+6g==



On 10/3/22 06:37, Geert Uytterhoeven wrote:
> Hi Artem,
>
> On Sun, Oct 2, 2022 at 11:54 PM Artem S. Tashkinov <aros@gmx.com> wrote:
>> It's easy to join an existing bug report. Tell me how can I join an
>> existing email thread without being first subscribed to it? I certainly
>> can, absolute most people will not be able to.
>
> lore.kernel.org
>
>> What about sending large dump files? Should everyone on the mailing lis=
t
>> receive it?
>
> post a link
>
>> A bug report is a simple plain list of messages in a single place which
>> could be read with a web browser. An email thread is anything but.
>
> lore.kernel.org
>
>> Searching through many emails at once? Good luck with that.
>
> lore.kernel.org
>
>> Replying to a particular email? Good luck with that.
>
> lore.kernel.org
>
>> It looks like you're under the impression that every Linux user who is
>> willing to ever use Linux must:
>>
>> 1) Subscribe to _all_ the existing mailing lists (just in case - what i=
f
>> you need to work on something which was started by someone else)
>
> lore.kernel.org
>
>> 2) Know the email etiquette
>
> Just Be Polite
>
>> 3) Learn to be persistent and resend (an unknown number of times) your
>> concerns hoping they will eventually be addressed.
>>
>> Bugzilla: sign up once. Follow up. If you file a dupe, hopefully it wil=
l
>> be marked as a dupe. Everyone's happy. No particular skills, email
>> clients, formatting, referencing, etc. etc. etc.
>
> Having at last the skill to provide a good rebug port would be nice...
>
> Now, back to work. The merge window has opened, so there will be
> bugs to report and/or fix...

Lore looks alien to me and in my life I've worked with a dozen bug tracker=
s.

* Where are open "issues"?
* Which issues are now resolved?
* What's the status of the "issue"?
* Which kernel subsystem is responsible for this or that "bug report"?
* How to change the assignee? How to know the new assignee has been
notified?

This thing looks interesting to discuss patches and merge requests
between developers who know each other and even at that it's not exactly
super intuitive. Again, you're not thinking about users who have no idea
how the kernel is developed.

If you remove bugzilla I'll never use lore.kernel.org, I promise. I'm
frightened by it.

Regards,
Artem
