Received: from cloudserver094114.home.pl (cloudserver094114.home.pl [79.96.170.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C581102;
	Tue, 18 Oct 2022 16:31:03 +0000 (UTC)
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP (IdeaSmtpServer 5.0.0)
 id 9816cde6ce27baf2; Tue, 18 Oct 2022 18:24:21 +0200
Received: from kreacher.localnet (unknown [213.134.183.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by v370.home.net.pl (Postfix) with ESMTPSA id 20447666963;
	Tue, 18 Oct 2022 18:24:20 +0200 (CEST)
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Thorsten Leemhuis <linux@leemhuis.info>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Artem S. Tashkinov" <aros@gmx.com>, workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
Date: Tue, 18 Oct 2022 18:24:19 +0200
Message-ID: <4452253.LvFx2qVVIh@kreacher>
In-Reply-To: <20221017204731.a7rixhqlqmhlntvl@nitro.local>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info> <f0412b37-fac0-c3f5-9877-0460a027e109@leemhuis.info> <20221017204731.a7rixhqlqmhlntvl@nitro.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 213.134.183.104
X-CLIENT-HOSTNAME: 213.134.183.104
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelvddgjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhgggfgtsehtufertddttdejnecuhfhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqnecuggftrfgrthhtvghrnhepfeduudeutdeugfelffduieegiedtueefledvjeegffdttefhhffhtefhleejgfetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddufedrudefgedrudekfedruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvudefrddufeegrddukeefrddutdegpdhhvghlohepkhhrvggrtghhvghrrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqpdhnsggprhgtphhtthhopeelpdhrtghpthhtoheplhhinhhugieslhgvvghmhhhuihhsrdhinhhfohdprhgtphhtthhopehkohhnshhtrghnthhinheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegrrhhoshesghhmgidrtghomhdprhgtphhtthhopeifohhrkhhflhhofihssehvghgvrhdrkhgvrhhnvghlrdho
 rhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrvghgrhgvshhsihhonhhssehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepkhhsuhhmmhhitheslhhishhtshdrlhhinhhugidruggvvh
X-DCC--Metrics: v370.home.net.pl 1024; Body=9 Fuz1=9 Fuz2=9

On Monday, October 17, 2022 10:47:31 PM CEST Konstantin Ryabitsev wrote:
> On Mon, Oct 17, 2022 at 03:57:17PM +0200, Thorsten Leemhuis wrote:
> > > Here's my counter-plan, which builds on top of yours.
> > 
> > Is this the agreed on path forward by silent agreement? And if so: who
> > will actually shepherd this? I just wonder, as it sounded to me that
> > Konstantin would be happy to take care of the bot-related stuff, but
> > leave the rest to somebody else.
> 
> Indeed, I need to do most of the preliminary legwork. I will start by creating
> a public-inbox feed of all bugzilla comments, which is something I was
> planning to do for a while anyway. Once that is in place, I can build on top
> of that to add a two-way bridge to replace bugzilla's native (and rather
> limited, in my experience) email bridge implementation.
> 
> Once I have this in place, we can consider what next steps should be taken.

Sounds good to me.

Cheers!



