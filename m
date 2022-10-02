Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0FF3C2A;
	Sun,  2 Oct 2022 17:11:31 +0000 (UTC)
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 01D1314017F;
	Sun,  2 Oct 2022 16:32:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id 68E6D30;
	Sun,  2 Oct 2022 16:32:21 +0000 (UTC)
Message-ID: <3381c74ad6862224e4511d7edf6f9681c678338b.camel@perches.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
From: Joe Perches <joe@perches.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, "Artem S. Tashkinov"
	 <aros@gmx.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Thorsten Leemhuis <linux@leemhuis.info>, 
 Greg KH <gregkh@linuxfoundation.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>,  workflows@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, ksummit@lists.linux.dev, Mario Limonciello
 <mario.limonciello@amd.com>
Date: Sun, 02 Oct 2022 09:32:27 -0700
In-Reply-To: <CAMuHMdWLbS5jnOpdq0a6ie3eB5rmM6Rof3390t0u5FeO4Hmt5g@mail.gmail.com>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
	 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
	 <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com> <YzgY9X/DM9t/ZuJe@kroah.com>
	 <f8cbb12c-590b-28a3-e3e9-d3fb0d7e3c90@gmx.com>
	 <d7798453-3105-7adf-a9a6-76e8cfe4d012@leemhuis.info>
	 <83f6dd2b-784a-e6d3-ebaf-6ad9cfe4eefe@gmx.com>
	 <a676e5cf-c67b-7946-ce73-8fb8d63a5a0a@leemhuis.info>
	 <Yzg7pHspc72I7TAb@mit.edu> <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
	 <YzmBjgXq9geMnL1B@mit.edu> <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
	 <CAMuHMdWLbS5jnOpdq0a6ie3eB5rmM6Rof3390t0u5FeO4Hmt5g@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 68E6D30
X-Spam-Status: No, score=-0.10
X-Stat-Signature: a97umkgmcu7bz1ysp1mcojeuu4sn3k5p
X-Rspamd-Server: rspamout07
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19vyxgtCVdDxa+BZU8gKI+mwpCueLiRhWM=
X-HE-Tag: 1664728341-897937

On Sun, 2022-10-02 at 18:08 +0200, Geert Uytterhoeven wrote:
> On Sun, Oct 2, 2022 at 2:49 PM Artem S. Tashkinov <aros@gmx.com> wrote:
> > The current ill-maintained semi-functional bugzilla has proven to be a
> > ton more useful than random mailing lists no sane person can keep track
> > of. Bug "reports", i.e. random emails are neglected and forgotten. LKML
> > is the worst of them probably.
>=20
> Such a statement really needs to be backed by numbers...
>=20
> > Let's operate with some examples:
> >=20
> > Bugzilla gets around two dozen bug reports weekly which encompass at
> > most thirty emails, which equals to four emails daily on average.
>=20
> This immediately debunks your statement above.

true.

> $ git log v5.19..linus/master | grep Fixes: | wc -l
> 2928
>=20
> So that's 46 bugs fixed per _day_.

But not really.  Many, perhaps even most, of these "Fixes:" are for code
introduced in -rc releases and so are a typical part of a development
cycle and are not for fixes in nominally released/final versions.

