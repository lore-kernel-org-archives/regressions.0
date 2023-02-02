Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5FF4408
	for <regressions@lists.linux.dev>; Thu,  2 Feb 2023 12:33:31 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 1E57DC8E47
	for <regressions@lists.linux.dev>; Thu,  2 Feb 2023 12:21:40 +0000 (UTC)
Received: (Authenticated sender: hadess@hadess.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 740CF24000A;
	Thu,  2 Feb 2023 12:21:30 +0000 (UTC)
Message-ID: <0aa7e4aab15179d4c6093d32db699ffcc8a2a8ec.camel@hadess.net>
Subject: Re: Linux 6.1 and 6.2-rc make mousewheel on Logitech G903
 (046d:c091) report too many non-hires events
From: Bastien Nocera <hadess@hadess.net>
To: Tobias Klausmann <klausman@schwarzvogel.de>, "Linux kernel regression
	tracking (Thorsten Leemhuis)"
	 <regressions@leemhuis.info>
Cc: Salvatore Bonaccorso <carnil@debian.org>, linux-input@vger.kernel.org, 
	regressions@lists.linux.dev
Date: Thu, 02 Feb 2023 13:21:29 +0100
In-Reply-To: <Y9VPBpcyEK61cNC1@skade.schwarzvogel.de>
References: <Y9GmnIjUgIGuYtk2@skade.schwarzvogel.de>
	 <Y9VBz/GVZPqG3KwM@eldamar.lan>
	 <01fb3b37-8ba2-70f9-df62-4cf8df6bcc97@leemhuis.info>
	 <Y9VPBpcyEK61cNC1@skade.schwarzvogel.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hey Tobias,

On Sat, 2023-01-28 at 17:36 +0100, Tobias Klausmann wrote:
> Hi!=20
>=20
> On Sat, 28 Jan 2023, Linux kernel regression tracking (Thorsten
> Leemhuis) wrote:
> > On 28.01.23 16:39, Salvatore Bonaccorso wrote:
> > > Let's loop in as well the regresssions list.
> >=20
> > Thx for that.
> >=20
> > TWIMC, I assume it's the same issue as this one:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D216885
>=20
> That is correct.

I've posted debug patches on the bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=3D216885#c29

I'll post a patch to either fix the bug, or disable the functionality
on those devices as soon as I have enough information.

Cheers
