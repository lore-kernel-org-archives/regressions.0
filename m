Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8674820F7;
	Tue,  4 Oct 2022 07:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664870207; x=1696406207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qb9fbv/Io45XqXq5yw/xMnK70ks44Jqm3hPSzeSs3eY=;
  b=EEn6pG2DZKxU3ajJyQZEG7zh3lBbXAOvzXSWj03WJgQa39fMWNp95ISn
   UCwdvtOp18PZ0is4dCNwVNeclnofn2Z8k2UQv3mpbr0ECC+del7hlMdhS
   1I/OKRLy6/ojWVw5bD78P8idi0eVsukFuJvNVZ8xovjoq9mqNVVSa2lxl
   rWPL50dK78qXynmoYSkfe4Bk9u2ra9bvugRoUASbipLf3IoMCbKaUAXBY
   UsEOhJ+fIr8htCDmz25gQ53aNMrH590myveoSvae0DN77N3VxncVO4ReB
   dkk3O2W+eyFNEPUi74OGWQxv22Cum9bCP+6P7upYaRwTghB5gPcqMqqOZ
   w==;
X-IronPort-AV: E=Sophos;i="5.93,367,1654585200"; 
   d="scan'208";a="180241548"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Oct 2022 00:56:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 4 Oct 2022 00:56:39 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 4 Oct 2022 00:56:36 -0700
Date: Tue, 4 Oct 2022 08:56:15 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
CC: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Mike Rapoport
	<rppt@kernel.org>, "Artem S. Tashkinov" <aros@gmx.com>, Al Viro
	<viro@zeniv.linux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, Theodore
 Ts'o <tytso@mit.edu>, Greg KH <gregkh@linuxfoundation.org>,
	<workflows@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>, <ksummit@lists.linux.dev>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <YzvnH3NROBu4U5kW@wendy>
References: <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002141321.394de676@rorschach.local.home>
 <6de0925c-a98a-219e-eed2-ba898ef974f8@gmx.com>
 <20221002180844.2e91b1f1@rorschach.local.home>
 <3a3b9346-e243-e178-f8dd-f8e1eacdc6ae@gmx.com>
 <YzoY+dxLuCfOp0sL@ZenIV>
 <b032e79a-a9e3-fc72-9ced-39411e5464c9@gmx.com>
 <YzqjfU66alRlGk5y@kernel.org>
 <20221003153718.o7fhrain5fnwwu3l@meerkat.local>
 <109147a2-621d-d4ce-f4b3-8516664e138e@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <109147a2-621d-d4ce-f4b3-8516664e138e@leemhuis.info>

On Tue, Oct 04, 2022 at 09:37:29AM +0200, Thorsten Leemhuis wrote:
> On 03.10.22 17:37, Konstantin Ryabitsev wrote:
> >
> > If we auto-create accounts for MAINTAINERS, that would allow them to be cc'd
> > by an actual human being triaging bugs, [...]
> 
> For the record: that would not be enough, as for bisected regressions
> you often want to CC the author of the culprit who might not be a

And possibly those who provided a review for the original patch too.

> maintainer. To catch that case as well, you'd have to create account for
> everyone that contributes a change.

As someone blissfully unaware of the workings of bugzilla, it is
possible to tie multiple emails to the same account? Not that I would be
happy about having an account created for me, but I certainly would not
want more than one account..

Thanks,
Conor.
