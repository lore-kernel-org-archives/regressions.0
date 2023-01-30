Received: from mail.schwarzvogel.de (skade.schwarzvogel.de [157.90.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C4C17D9
	for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 10:09:30 +0000 (UTC)
Received: from klausman by mail.schwarzvogel.de with local (Exim 4.96)
	(envelope-from <klausman@schwarzvogel.de>)
	id 1pMR6I-001Gpf-1w;
	Mon, 30 Jan 2023 11:09:22 +0100
Date: Mon, 30 Jan 2023 11:09:22 +0100
From: Tobias Klausmann <klausman@schwarzvogel.de>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Bastien Nocera <hadess@hadess.net>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>, David Roth <davidroth9@gmail.com>,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linus <luna+bugzilla@cosmos-ink.net>
Subject: Re: [Regression] =?iso-8859-1?Q?Bug=A02168?=
 =?iso-8859-1?Q?85_-_HID++_Logitech_G903_generates_full_scroll_whee?=
 =?iso-8859-1?Q?l?= events with every hi-res tick when attached via USB
Message-ID: <Y9eXUl6ShjMeH/gO@skade.schwarzvogel.de>
Mail-Followup-To: Linux regressions mailing list <regressions@lists.linux.dev>,
	Bastien Nocera <hadess@hadess.net>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>, David Roth <davidroth9@gmail.com>,
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linus <luna+bugzilla@cosmos-ink.net>
References: <1bb93259-1c9f-5335-a0bf-fc8641b26650@leemhuis.info>
 <be545e72-8312-f213-0250-86a128b7b629@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be545e72-8312-f213-0250-86a128b7b629@leemhuis.info>

Hi! 

On Mon, 30 Jan 2023, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
> [ccing a few people that CCed to the bug]
> 
> Hi, this is your Linux kernel regression tracker.
> 
> On 05.01.23 09:12, Thorsten Leemhuis wrote:
> > [...] Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216885 :
> > 
> >>  David Roth 2023-01-04 20:37:22 UTC
> >>
> >> Created attachment 303526 [details]
> >> Libinput record with G903 attached directly to USB
> >>
> >> Since
> >> https://lore.kernel.org/linux-input/20220914132146.6435-1-hadess@hadess.net/T/#u
> >> my Logitech G903 has gained hi res support. While normally a good
> >> thing, it seems that in this case it leads to generating one normal
> >> REL_WHEEL with each REL_WHEEL_HI_RES event instead of just a couple
> >> of REL_WHEEL_HI_RES, followed by the standard REL_WHEEL once a
> >> notch/tick is reached. This leads to overly sensitive scrolling and
> >> makes the wheel basically useless.
> 
> Bastien, Benjamin, Jiri, that problem was reported 25 days ago now and
> there is still no fix in sight afaics (please correct me if I'm wrong)
> -- and based on the reports I've seen it seem quite a few people are
> hitting it. Hence please allow me to ask:
> 
> Wouldn't it be best to revert that change for now (both in mainline and
> stable of course) and then reapply it once a fix for this problem is
> available? Or

I think there was something cut off or that `Or` is leftovers.

As for no fix: correct, there is no fix yet, though the workaround of
blacklisting the module sortof works. _Not_ having hires support usually
doesn't break anything, as it's a relatively new feature/functionality,
and so many pieces of userland (GTK+, Qt etc) need to be explicitly
configured to use it, and fall back to lowres in a benign way. I would
have never noticed this if I didn't use a distro kernel on one machine
(my hand-built ones omit the module entirely).

That said, figuring out what is going on and what to do is not trivial,
since most people won't think "kernel" when they notice their mouse's
behavior has changed. My liberal reporting of bugs with Debian, libinput
and then the kernel (and linking them) was a deliberate attempt in
leaving breadcrumbs for people to find.

Best,
Tobias
