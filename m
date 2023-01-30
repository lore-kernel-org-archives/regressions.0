Received: from mail.schwarzvogel.de (skade.schwarzvogel.de [157.90.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2669620E1
	for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 10:44:33 +0000 (UTC)
Received: from klausman by mail.schwarzvogel.de with local (Exim 4.96)
	(envelope-from <klausman@schwarzvogel.de>)
	id 1pMReJ-001Gy4-2W;
	Mon, 30 Jan 2023 11:44:31 +0100
Date: Mon, 30 Jan 2023 11:44:31 +0100
From: Tobias Klausmann <klausman@schwarzvogel.de>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>,
	David Roth <davidroth9@gmail.com>,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linus <luna+bugzilla@cosmos-ink.net>
Subject: Re: [Regression] Bug 216885 - HID++ Logitech G903 generates full
 scroll wheel events with every hi-res tick when attached via USB
Message-ID: <Y9efj49RfzZRIDGY@skade.schwarzvogel.de>
Mail-Followup-To: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>,
	David Roth <davidroth9@gmail.com>,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linus <luna+bugzilla@cosmos-ink.net>
References: <1bb93259-1c9f-5335-a0bf-fc8641b26650@leemhuis.info>
 <be545e72-8312-f213-0250-86a128b7b629@leemhuis.info>
 <CAO-hwJJtK3B2x8CAAYsB41X8D=1EpEYK+nSuVA+fXuz1LHkmSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJJtK3B2x8CAAYsB41X8D=1EpEYK+nSuVA+fXuz1LHkmSg@mail.gmail.com>

Hi! 

On Mon, 30 Jan 2023, Benjamin Tissoires wrote:

> On Mon, Jan 30, 2023 at 10:56 AM Linux kernel regression tracking
> (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
> >
> > [ccing a few people that CCed to the bug]
> >
> > Hi, this is your Linux kernel regression tracker.
> >
> > On 05.01.23 09:12, Thorsten Leemhuis wrote:
> > > [...] Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216885 :
> > >
> > >>  David Roth 2023-01-04 20:37:22 UTC
> > >>
> > >> Created attachment 303526 [details]
> > >> Libinput record with G903 attached directly to USB
> > >>
> > >> Since
> > >> https://lore.kernel.org/linux-input/20220914132146.6435-1-hadess@hadess.net/T/#u
> > >> my Logitech G903 has gained hi res support. While normally a good
> > >> thing, it seems that in this case it leads to generating one normal
> > >> REL_WHEEL with each REL_WHEEL_HI_RES event instead of just a couple
> > >> of REL_WHEEL_HI_RES, followed by the standard REL_WHEEL once a
> > >> notch/tick is reached. This leads to overly sensitive scrolling and
> > >> makes the wheel basically useless.
> >
> > Bastien, Benjamin, Jiri, that problem was reported 25 days ago now and
> > there is still no fix in sight afaics (please correct me if I'm wrong)
> > -- and based on the reports I've seen it seem quite a few people are
> > hitting it. Hence please allow me to ask:
> >
> > Wouldn't it be best to revert that change for now (both in mainline and
> > stable of course) and then reapply it once a fix for this problem is
> > available? Or
> 
> Last I heard was that Bastien was actively trying to understand the
> problem. I do have a G903 here but it is lacking the feature the
> reporters have, and so I can not reproduce (there is likely a new
> firmware/model around).
> 
> After a quick search on
> https://support.logi.com/hc/en-us/search#q=G903&s=all it seems that
> there are 2 G903: M-R0081 and M-R0068. I only own the 68 one which
> explains why I can not reproduce it. :(

I have an affected mouse and am willing to try patches/fixes, but my
kernel coding fu is weak. 

Best,
Tobias
