Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CC163D7
	for <regressions@lists.linux.dev>; Wed,  4 Oct 2023 16:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=mJVDX3StT92iZZZB1DwyeljX4JE7L2QJNwBNTCnTGZc=;
	t=1696435775; x=1697645375; b=ocs3v9DAKyYXhAq8z+Pwzneo4xWc6BWTJZaAZJ37ZnhJ1yT
	7i5vos4IOMDXtCeJ5zAs29FioZAoHRFQwufHy/LO4f7zWh4+JW3IDhAOmccY0tJ7ljI9mM5cR/SB9
	inIdAafqDCyGfq+FXHiYl4F/VDdbtnKC2qSVRZmypF/q5QWNXdlo8zhrAbnfGmAPYsNHvdD7dO2LE
	sjcJyMl0ZXa0tE2sNhaOyPKa04ZdcdFx3X2RERCjuT5u0uVRj5RGUu/J9Ntf5sn8uE13XPhLPtJRj
	he8Gi2YgygVOhEe+KKQemVMqPeLEw0YQImNCVWlomqTJNEeFCaBBstenJ2Al/usw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qo3tB-00435L-2G;
	Wed, 04 Oct 2023 17:34:17 +0200
Message-ID: <a0da9cf2365b4478eddc7c1d6e9ee8565e4e2a1f.camel@sipsolutions.net>
Subject: Re: Microcode SW error since Linux 6.5
From: Johannes Berg <johannes@sipsolutions.net>
To: Linux regressions mailing list <regressions@lists.linux.dev>, 
	"Greenman, Gregory" <gregory.greenman@intel.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
 "Peer, Ilan" <ilan.peer@intel.com>, "anarcat@debian.org"
 <anarcat@debian.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>
Date: Wed, 04 Oct 2023 17:34:16 +0200
In-Reply-To: <0c07b6bf-a9cc-4dc0-b71c-a2257e501e5f@leemhuis.info>
References: <87ttrncuc8.fsf@angela.anarc.at>
	 <60e2c052f3cedc5c80964e4be90c50cdaa899a87.camel@sipsolutions.net>
	 <87jzsf9dme.fsf@angela.anarc.at>
	 <0190dde1170bd1ee810e99b9799678f4f5b8f30e.camel@sipsolutions.net>
	 <8734z29jx7.fsf@angela.anarc.at>
	 <7bd483fd0d004aed37931561a7faa2e176ca3fac.camel@sipsolutions.net>
	 <5d0904a4-bc0d-42dd-aae8-6b50e5c567ba@leemhuis.info>
	 <42e000913e3af714c77fb7a55dd898733e271be0.camel@intel.com>
	 <0c07b6bf-a9cc-4dc0-b71c-a2257e501e5f@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

Thorsten,

You know ... when you started this regression tracking project, I
actually naively thought it might be a good idea, and _help_ us.

Honestly though, now after seeing it for a while, for me it's done the
opposite.

Pretty much all interactions we have with it are like this:

> (2) Would have been great if that fix would have had a stable tag to
> ensure a quick backport to 6.5. :-/ Made me wonder if this is an
> accident, but doesn't look like it:
>=20
> $ git log --oneline --grep 'CC:.*stable@vger.kernel.org' mainline/master
>  -- drivers/net/wireless/intel/iwlwifi/ | wc -l
> 11
>=20
> Is there a reason why iwlwifi patches nearly never contain stable tags?
> Reminder: a "Fixes:" tag alone does not guarantee that the fix is
> backported.

Yeah, that's wrapped in a "question", but really it's not, it's a
demand. You're demanding that we do our job differently, you might say
better, but you're demanding things of us.

Seeing this seriously makes me want to reconsider being a maintainer at
all. Why bother? All people do is feel entitled to you doing _more_.

Never mind that the the whole phrasing/reminder thing is pretty
condescending, like we don't know that?

Yeah, sure, I can already see how you're going to apologise, say you
didn't mean it that way, you're just doing your job etc., like last time
when you did the same to Kalle, etc. And I'm pretty sure we're _far_
from the only ones.

But honestly, _you_ chose this job. _You_ chose to be demanding in this
way. _You_ chose to complain to people about these things. _You_ decided
(as far as I can tell) to demand that stable maintenance was now the
subsystem maintainer job, rather than the stable maintainer's job.

This isn't helping. In fact, it's the exact opposite of helping.

You _could_ have decided that the patch was indeed worth it for stable,
submitted it there (once in mainline), and then maybe send a nudge
saying something like "I've proposed this patch for stable, it would've
been nice if you could add a Cc tag for future similar patches", or so?
But no, you decided to complain, counted wrongly (*), accused us of not
doing a job (that you signed us up for to boot!), etc.

(*) I'll leave it as an exercise to figure out why, because really, this
email isn't about the actual count or proportion patches or anything,
it's about the fact that you decided to count at all.

And also, "Cc'ing netdev because it's not merged" - have you paid any
attention at all? There are conferences going on, some parts of the
world have fall/autumn vacations, etc. It's been what, a week? Even
Linus noted there wasn't a net pull request, but I'll note that nowhere
did he actually _complain_ about that, unlike you. Relax!


So ... in summary: Can you please just stop? In fact, I'm tempted to
just ask you to simply stop rendering your services unto wireless, but I
haven't spoken with Kalle about it now.

Thanks,
johannes
