Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC76C8DB
	for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 12:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id E961280A2;
	Mon, 11 Sep 2023 12:53:41 +0000 (UTC)
Date: Mon, 11 Sep 2023 15:53:40 +0300
From: Tony Lindgren <tony@atomide.com>
To: Marc Haber <mh+linux-kernel@zugschlus.de>
Cc: Sean Christopherson <seanjc@google.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux KVM <kvm@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Linux 6.5 speed regression, boot VERY slow with anything systemd
 related
Message-ID: <20230911125340.GB5285@atomide.com>
References: <ZO4YJlhHYjM7MsK4@torres.zugschlus.de>
 <ZO4nbzkd4tovKpxx@google.com>
 <ZO5OeoKA7TbAnrI1@torres.zugschlus.de>
 <ZPEPFJ8QvubbD3H9@google.com>
 <20230901122431.GU11676@atomide.com>
 <ZPiPkSY6NRzfWV5Z@torres.zugschlus.de>
 <20230906152107.GD11676@atomide.com>
 <ZPmignexOJvJ5J5W@torres.zugschlus.de>
 <20230907105150.GJ11676@atomide.com>
 <ZPzQvXUW+dbkLMZ2@torres.zugschlus.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPzQvXUW+dbkLMZ2@torres.zugschlus.de>

* Marc Haber <mh+linux-kernel@zugschlus.de> [230909 20:08]:
> On Thu, Sep 07, 2023 at 01:51:50PM +0300, Tony Lindgren wrote:
> > Still a minimal reproducable test case is needed.. Or do you have the
> > dmesg output of the failing boot?
> 
> I have both dmesg output of a failing boot (with my kernel) and of a
> successful boot (with the Debian kernel). Attached.

Thanks I don't see anything strange there, serial ports are probed in
both cases.

> In the last few days I have made some additional experiments. Since 6.5
> has landed in Debian experimental in the mean time, I tried with the
> Debian kernel: It works. I then used the Debian .config with my kernel
> tree and my build environment, it works as well. I tried again with my
> own .config, doesn't work.

OK

> I spent the next days with kind of binary searching the .config
> differences between mine and Debian's (they're huge), and I now have two
> configurations that only differ in CONFIG_PREEMPT_VOLUNTARY and
> CONFIG_PREMPT. The version with CONFIG_PREEMPT_VOLUNTARY seems to work
> (both attached). Sadly, my "own" .config uses CONFIG_PREEMPT_VOLUNTARY
> and doesn't work, so the actual problem seems to be a bit more complex
> still.

OK

Regards,

Tony
