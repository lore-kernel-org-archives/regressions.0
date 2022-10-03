Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB9417C1
	for <regressions@lists.linux.dev>; Mon,  3 Oct 2022 09:15:25 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-152-7v2wAzpCNpqDy5N2hp2WyQ-1; Mon, 03 Oct 2022 10:15:23 +0100
X-MC-Unique: 7v2wAzpCNpqDy5N2hp2WyQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Mon, 3 Oct
 2022 10:15:20 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Mon, 3 Oct 2022 10:15:20 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Mike Rapoport' <rppt@kernel.org>, "Artem S. Tashkinov" <aros@gmx.com>
CC: Al Viro <viro@zeniv.linux.org.uk>, Steven Rostedt <rostedt@goodmis.org>,
	Theodore Ts'o <tytso@mit.edu>, Thorsten Leemhuis <linux@leemhuis.info>, "Greg
 KH" <gregkh@linuxfoundation.org>, Konstantin Ryabitsev
	<konstantin@linuxfoundation.org>, "workflows@vger.kernel.org"
	<workflows@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Linus
 Torvalds" <torvalds@linux-foundation.org>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>, "ksummit@lists.linux.dev"
	<ksummit@lists.linux.dev>, Mario Limonciello <mario.limonciello@amd.com>
Subject: RE: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Thread-Topic: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Thread-Index: AQHY1weEHk6/wLsF4ECGzuVlql59zK38YeGA
Date: Mon, 3 Oct 2022 09:15:20 +0000
Message-ID: <3fd468de1da04d8fba4e0c49001b81b5@AcuMS.aculab.com>
References: <Yzg7pHspc72I7TAb@mit.edu>
 <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com> <YzmBjgXq9geMnL1B@mit.edu>
 <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002141321.394de676@rorschach.local.home>
 <6de0925c-a98a-219e-eed2-ba898ef974f8@gmx.com>
 <20221002180844.2e91b1f1@rorschach.local.home>
 <3a3b9346-e243-e178-f8dd-f8e1eacdc6ae@gmx.com> <YzoY+dxLuCfOp0sL@ZenIV>
 <b032e79a-a9e3-fc72-9ced-39411e5464c9@gmx.com> <YzqjfU66alRlGk5y@kernel.org>
In-Reply-To: <YzqjfU66alRlGk5y@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

...
> You repeated multiple times that bug reports sent to the mailing lists ar=
e
> ignored, but what will make emails from bugzilla different from those bug
> reports? Why do you think they will get more attention?

Most bug tracking systems I met end up being 'mostly write only'.
Sometimes management try to track the number of open bugs.
The 'solution' to that is either to get all your friends to
open low priority bugs and then ignore them (the bugs not
your friends), or to close the bugs just before the weekly
summary is done - knowing they'll get reopened later.

Oh, and bug update emails form bugzilla are entirely useless.
Unless you have time to open the link.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

