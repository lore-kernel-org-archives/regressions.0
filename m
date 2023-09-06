Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F7E101E1
	for <regressions@lists.linux.dev>; Wed,  6 Sep 2023 15:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 783DC8050;
	Wed,  6 Sep 2023 15:21:08 +0000 (UTC)
Date: Wed, 6 Sep 2023 18:21:07 +0300
From: Tony Lindgren <tony@atomide.com>
To: Marc Haber <mh+linux-kernel@zugschlus.de>
Cc: Sean Christopherson <seanjc@google.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux KVM <kvm@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Linux 6.5 speed regression, boot VERY slow with anything systemd
 related
Message-ID: <20230906152107.GD11676@atomide.com>
References: <ZO3sA2GuDbEuQoyj@torres.zugschlus.de>
 <ZO4GeazfcA09SfKw@google.com>
 <ZO4JCfnzRRL1RIZt@torres.zugschlus.de>
 <ZO4RzCr/Ugwi70bZ@google.com>
 <ZO4YJlhHYjM7MsK4@torres.zugschlus.de>
 <ZO4nbzkd4tovKpxx@google.com>
 <ZO5OeoKA7TbAnrI1@torres.zugschlus.de>
 <ZPEPFJ8QvubbD3H9@google.com>
 <20230901122431.GU11676@atomide.com>
 <ZPiPkSY6NRzfWV5Z@torres.zugschlus.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPiPkSY6NRzfWV5Z@torres.zugschlus.de>

* Marc Haber <mh+linux-kernel@zugschlus.de> [230906 14:41]:
> If I cannot see the host boot, I cannot debug, and if I cannot type into
> grub, I cannot find out whether removing the serial console from the
> kernel command line fixes the issue. I have removed the network
> interface to simplify things, so I need a working console.

I use something like this for a serial console:

-serial stdio -append "console=ttyS0 other kernel command line options"

Regards,

Tony
