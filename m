Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E84EDB
	for <regressions@lists.linux.dev>; Fri,  8 Sep 2023 04:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id F11068050;
	Fri,  8 Sep 2023 04:41:47 +0000 (UTC)
Date: Fri, 8 Sep 2023 07:41:46 +0300
From: Tony Lindgren <tony@atomide.com>
To: Marc Haber <mh+linux-kernel@zugschlus.de>
Cc: Sean Christopherson <seanjc@google.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux KVM <kvm@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Linux 6.5 speed regression, boot VERY slow with anything systemd
 related
Message-ID: <20230908044146.GK11676@atomide.com>
References: <ZO4RzCr/Ugwi70bZ@google.com>
 <ZO4YJlhHYjM7MsK4@torres.zugschlus.de>
 <ZO4nbzkd4tovKpxx@google.com>
 <ZO5OeoKA7TbAnrI1@torres.zugschlus.de>
 <ZPEPFJ8QvubbD3H9@google.com>
 <20230901122431.GU11676@atomide.com>
 <ZPiPkSY6NRzfWV5Z@torres.zugschlus.de>
 <20230906152107.GD11676@atomide.com>
 <ZPmignexOJvJ5J5W@torres.zugschlus.de>
 <20230907105150.GJ11676@atomide.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907105150.GJ11676@atomide.com>

* Tony Lindgren <tony@atomide.com> [230907 13:51]:
> So I tried something similar with just kernel and ramdisk:
> 
> qemu-system-x86_64 \
> -m 768 \
> -machine pc-i440fx-2.1,accel=kvm,usb=off,dump-guest-core=off \
> -nodefaults \
> -kernel ~/bzImage \
> -initrd ~/ramdisk.img \
> -serial stdio \
> -append "console=ttyS0 debug"
> 
> It boots just fine for me. Console seems to come up a bit faster if I
> leave out the machine option. I tried this with qemu 8.0.3 on a m1 laptop
> running linux in case the machine running the qemu host might make some
> difference..

Sorry I noticed that the above example I tried on my x86_64 box, no on m1.
On m1 accel=kvm needs to be left out. Both cases work fine for me though.

Regards,

Tony
