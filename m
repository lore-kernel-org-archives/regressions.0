Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014598F44
	for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 06:53:43 +0000 (UTC)
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+linux-kernel@zugschlus.de>)
	id 1qfxHB-000H07-1W;
	Tue, 12 Sep 2023 08:53:33 +0200
Date: Tue, 12 Sep 2023 08:53:33 +0200
From: Marc Haber <mh+linux-kernel@zugschlus.de>
To: Tony Lindgren <tony@atomide.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux KVM <kvm@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Linux 6.5 speed regression, boot VERY slow with anything systemd
 related
Message-ID: <ZQAK7e/yuNFiBb56@torres.zugschlus.de>
References: <ZO4nbzkd4tovKpxx@google.com>
 <ZO5OeoKA7TbAnrI1@torres.zugschlus.de>
 <ZPEPFJ8QvubbD3H9@google.com>
 <20230901122431.GU11676@atomide.com>
 <ZPiPkSY6NRzfWV5Z@torres.zugschlus.de>
 <20230906152107.GD11676@atomide.com>
 <ZPmignexOJvJ5J5W@torres.zugschlus.de>
 <20230907105150.GJ11676@atomide.com>
 <ZPzQvXUW+dbkLMZ2@torres.zugschlus.de>
 <20230911125340.GB5285@atomide.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230911125340.GB5285@atomide.com>
User-Agent: Mutt/2.2.9 (2022-11-12)

On Mon, Sep 11, 2023 at 03:53:40PM +0300, Tony Lindgren wrote:
> * Marc Haber <mh+linux-kernel@zugschlus.de> [230909 20:08]:
> > On Thu, Sep 07, 2023 at 01:51:50PM +0300, Tony Lindgren wrote:
> > > Still a minimal reproducable test case is needed.. Or do you have the
> > > dmesg output of the failing boot?
> > 
> > I have both dmesg output of a failing boot (with my kernel) and of a
> > successful boot (with the Debian kernel). Attached.
> 
> Thanks I don't see anything strange there, serial ports are probed in
> both cases.

Yes, they do actually WORK in both cases, and even with the normal
speed, unless systemd begins doing its work, then the "bad" case keeps
running into obvious 30 second timeouts.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
